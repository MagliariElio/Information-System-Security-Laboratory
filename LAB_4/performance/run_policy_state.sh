
echo -e "flush of the states"
ip xfrm state flush

echo -e "flush of the policies"
ip xfrm policy flush


echo -e "ESP with AES-128-CBC"

ip xfrm state add src 192.168.82.97 dst 192.168.82.78 proto esp spi 0x1000 enc aes 0xaa223344556677889900aabbccddeeff
ip xfrm state add src 192.168.82.78 dst 192.168.82.97 proto esp spi 0x2000 enc aes 0xbb223344556677889900aabbccddeeff
ip xfrm policy add src 192.168.82.97 dst 192.168.82.78 dir out tmpl proto esp mode transport level required
ip xfrm policy add src 192.168.82.78 dst 192.168.82.97 dir in tmpl proto esp mode transport level required


# echo -e "ESP with AES-128-CBC and HMAC-SHA1"

# ip xfrm state add src 192.168.82.97 dst 192.168.82.78 proto esp spi 0x1000 enc aes 0xaa223344556677889900aabbccddeeff auth sha1 0xbbccddeeff00112233445566778899aabbccddeeff
# ip xfrm state add src 192.168.82.78 dst 192.168.82.97 proto esp spi 0x2000 enc aes 0xbb223344556677889900aabbccddeeff auth sha1 0xaaccddeeff00112233445566778899aabbccddeeff
# ip xfrm policy add src 192.168.82.97 dst 192.168.82.78 dir out tmpl proto esp mode transport level required
# ip xfrm policy add src 192.168.82.78 dst 192.168.82.97 dir in tmpl proto esp mode transport level required


# echo -e "AH with HMAC-SHA1"

# ip xfrm state add src 192.168.82.97 dst 192.168.82.78 proto ah spi 0x3000 auth sha1 0xbbccddeeff00112233445566778899aabbccddeeff
# ip xfrm state add src 192.168.82.78 dst 192.168.82.97 proto ah spi 0x4000 auth sha1 0xaaccddeeff00112233445566778899aabbccddeeff
# ip xfrm policy add src 192.168.82.97 dst 192.168.82.78 dir out tmpl proto ah mode transport level required
# ip xfrm policy add src 192.168.82.78 dst 192.168.82.97 dir in tmpl proto ah mode transport level required


echo -e "\nstates:"
ip xfrm state

echo -e "\npolicies:"
ip xfrm policy

echo -e "\n restart of ipsec service"
ipsec restart
