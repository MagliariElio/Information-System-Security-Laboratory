#!/bin/bash



sudo iptables -F INPUT
sudo iptables -P INPUT DROP
sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

sudo iptables -L -v -n 


