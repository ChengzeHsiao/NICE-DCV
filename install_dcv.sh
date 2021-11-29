#!/bin/bash
set -e 
echo -e "\033[31m `date` ! \033[0m"

# download dcv software package
echo -e "\033[31m Download dcv package ! \033[0m"
wget https://d1uj6qtbmh3dt5.cloudfront.net/2021.2/Servers/nice-dcv-2021.2-11445-el7-x86_64.tgz

# extract dcv tgz
echo -e "\033[31m Extract dcv tgz ! \033[0m"
tar -xvzf nice-dcv-2021.2-11445-el7-x86_64.tgz

# install dcv server 
echo -e "\033[31m Install dcv server ! \033[0m"
cd nice-dcv-2021.2-11445-el7-x86_64
yum install -y nice-dcv-server-2021.2.11445-1.el7.x86_64.rpm 
yum install -y nice-dcv-web-viewer-2021.2.11445-1.el7.x86_64.rpm 
yum install -y nice-dcv-gltest-2021.2.279-1.el7.x86_64.rpm

# start dcv server
echo -e "\033[31m Dcv Server starting ! \033[0m"
systemctl enable dcvserver.service
systemctl restart dcvserver.service
systemctl status dcvserver.service