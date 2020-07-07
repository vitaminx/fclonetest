#!/bin/bash
# fclone安装和环境配置
cd ~ && 
wget "https://github.com/vitaminx/fclonetest/raw/master/fclone.zip" && 
unzip fclone.zip &&
chmod 777 fclone && 
mv fclone /usr/bin
rm -rf fclone.zip
#在文件的最后一行添加内容
echo "fs.file-max = 6553500" >> /etc/sysctl.conf && sysctl -p
#在文件的最后一行前添加内容
sed '$i * soft memlock unlimited
* hard memlock unlimited
* soft nofile 65535
* hard nofile 65535
* soft nproc 65535
* hard nproc 65535

root soft memlock unlimited
root hard memlock unlimited
root soft nofile 65535
root hard nofile 65535
root soft nproc 65535
root hard nproc 65535' /etc/security/limits.conf

sed '$i session required pam_limits.so' /etc/pam.d/common-session
ulimit -n

read -t 15 -p "恭喜你fclone以安装并配置好环境已设置就绪，系统将在15秒后或按任意键重启！"
reboot
