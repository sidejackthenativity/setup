#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt install openvpn

sudo snap install jq  

sudo apt  install golang-go
go get -u github.com/tomnomnom/httprobe
