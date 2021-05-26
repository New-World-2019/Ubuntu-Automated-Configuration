# Ubuntu-Automated-Configuration
Ubuntu automatic initialization configuration tool.

## 程序功能
- 安装 net-tools, 以便使用 ifconfig 命令;
- 安装 openssh-server，以便使用 ssh;
- 设置 ssh 服务开机启动;
- 启动 ssh 服务;
- 设置 root 密码;
- 安装 vim;
- 修改配置文件 /etc/ssh/sshd_config,以便允许 root 远程登陆;
- 重启 ssh 服务;

## 使用方法
 - git clone https://github.com/New-World-2019/Ubuntu-Automated-Configuration.git
 - cd Ubuntu-Automated-Configuration/src
 - sudo ./init.sh

## 其它
- 欢迎提交 PR 添加新功能；
- 欢迎 fork 和 star;
