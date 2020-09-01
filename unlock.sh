#!/bin/bash

if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum install bind-utils
    yum install -y dnsmasq
elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
    apt-get update
    apt-get install dnsutils
    apt install -y dnsmasq
elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
    apt-get update
    apt-get install dnsutils
    apt install -y dnsmasq
else
    echo "This script only supports CentOS, Ubuntu and Debian."
    exit 1
fi

if [ $? -eq 0 ]; then
    systemctl enable dnsmasq
    rm -f /etc/resolv.conf
    echo "nameserver 127.0.0.1" > /etc/resolv.conf
    touch /etc/dnsmasq.d/unlock.conf
    echo "server=8.8.8.8" > /etc/dnsmasq.d/unlock.conf
    echo "server=8.8.4.4" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflix.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflix.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflximg.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflximg.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflxvideo.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflxso.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflxext.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/mytvsuper.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/d2anahhhmp1ffz.cloudfront.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/d1k2us671qcoau.cloudfront.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/d304yiyvlwmwvl.cloudfront.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/tvb.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/viu.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/viu.tv/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/api.viu.now.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/now.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nowe.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/gamer-cds.cdn.hinet.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/gamer2-cds.cdn.hinet.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/gamer.com.tw/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/i2.bahamut.com.tw/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/4gtv.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/dmm.co.jp/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/abema.tv/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/abema.io/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/ameba.jp/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/hayabusa.io/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/abematv.akamaized.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/ds-linear-abematv.akamaized.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/ds-vod-abematv.akamaized.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/linear-abematv.akamaized.net/$1" >> /etc/dnsmasq.d/unlock.conf
	
    systemctl restart dnsmasq
    echo "dnsmasq启动成功"
else
    echo "dnsmasq安装失败, 请检查仓库状况"
fi
