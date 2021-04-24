#!/bin/bash

#set -v   # 测试打印执行命令
#先检查是不是 Ubuntu 系统，以及输出当前系统的环境

echo "          Start Automated Configuration" 

unameString=`uname -a`
UbuntuStr="Ubuntu"
if [[ $unameStr == *$Ubuntu* ]]; then
    echo "Check system configuration"
    echo "OS : Ubuntu"
else
    echo "The OS is't Ubuntu and cannot be configured!"
    exit
fi
#更新下载源

echo "	- 更新下载源"
sudo apt update &> /dev/null

#安装 net-tools 包使用 ifconfig 命令
echo "	- 安装 net-tools 工具"
sudo apt install -y net-tools &> /dev/null

#安装 openssh-server

echo "	- 安装 openssh-server"
sudo apt install -y openssh-server &> /dev/null

echo "	- 设置 ssh "
sudo systemctl enable ssh &> /dev/null

sudo systemctl start ssh &> /dev/null

#设置 root 密码
echo "	- 设置 root 密码"
sudo passwd root

#安装 vim
echo "	- 安装 vim"
sudo apt install -y vim &> /dev/null


#修改ssh配置文件
echo "	- 修改配置文件，用于 root 远程登陆"
sudo sed -i '/#PermitRootLogin prohibit-password/a\PermitRootLogin yes'  /etc/ssh/sshd_config

# 重启 ssh 服务
echo "	- 重新启动 ssh"
sudo systemctl restart ssh &> /dev/null

# 使用 root 远程登陆

echo "	- 配置成功，可以使用 root 远程登陆！"


