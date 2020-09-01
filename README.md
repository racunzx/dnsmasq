# dnsmasq
dnsmasq分流详解
一、dnsmasq是什么?
Dnsmasq为小型网络提供网络基础设施：DNS，DHCP，路由器通告和网络引导。它被设计为轻量级且占用空间小，适用于资源受限的路由器和防火墙。它还被广泛用于智能手机和便携式热点的共享，并支持虚拟化框架中的虚拟网络。支持的平台包括Linux（带有glibc和uclibc），Android，* BSD和Mac OS X. Dnsmasq包含在大多数Linux发行版以及FreeBSD，OpenBSD和NetBSD的端口系统中。Dnsmasq提供完整的IPv6支持

本站dnsmasq分流脚本有什么作用？
1.根据系统安装dnsmasq。

2.默认写入netflix相关的规则并指定DNS。

3.修改系统DNS为127.0.0.1，作用是使网络域名解析在dnsmasq上进行。

注意
1.解锁成功后系统DNS应该为127.0.0.1，部分系统会自行重置系统DNS，或重启VPS系统、重启网络相关功能导致系统DNS被重置使DNS解锁失效。

2.可使用chattr -i /etc/resolv.conf && echo "nameserver 127.0.0.1" > /etc/resolv.conf && chattr +i /etc/resolv.conf进行文件加锁，解锁chattr -i /etc/resolv.conf，C7以外的系统加锁会提示错误等信息，自行百度谷歌

3.dnsmasq分流只适用于科学服务端使用系统的DNS。

二、脚本用法。
编号:A2

1.最后DNS为变量,就是需要你自行修改成想用的DNS,格式必须为。

wget https://raw.githubusercontent.com/evaslr/dnsmasq/master/unlock.sh && chmod +x unlock.sh && ./unlock.sh 8.8.8.8

									
2.已测试过阿里云系统C7、D9、u6。推荐C7，其它两个或多或少有点小问题


									
3.如安装错误，请手动安装，注意报错（百度搜索找寻答案）


								
三、自定义dnsmasq的配置。

									
1.打开vi /etc/dnsmasq.d/unlock.conf。


									
2.按照里面的格式自行添加删除修改。


									
3.修改完成重启dnsmasq。（重启命令systemctl restart dnsmasq）


									
4.最后重启科学服务端
