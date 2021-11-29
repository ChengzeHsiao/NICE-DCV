#!/bin/bash


set -e
echo -e "\033[31m `date` ! \033[0m"

read -p " Enter login your name: " username
read -p " Enter session  name: " session

echo -e "\033[31m Create disble-clipboard file  ! \033[0m"

cat >> permissions-$username.file <<EOF
[permissions]
$username deny clipboard-management clipboard-copy
%owner% allow builtin
EOF

echo -e "\033[31m Create Session  ! \033[0m"
sudo dcv create-session --owner $username --user $username --name $session --permissions-file permissions-$username.file $session --storage-root %home%

echo -e "\033[31m Successful create session $username, Welcome open dcv desktop ! \033[0m"


echo -e "\033[31m list Session  ! \033[0m"

sudo dcv list-sessions

