 install
 firewall --disabled
 url --url="http://192.168.127.2/"
 rootpw {{ password }}
 auth  useshadow  passalgo=sha512
 text
 firstboot disable
 keyboard us
 lang en_US
 selinux --permissive
 timezone Europe/Madrid
 reboot
 user --name={{ user }} --plaintext --password {{ password }} --groups=wheel
 bootloader location=mbr
 clearpart --all --initlabel
 part swap --asprimary --fstype="swap" --size=1024
 part /boot --fstype xfs --size=200
 part pv.01 --size=1 --grow
 volgroup rootvg pv.01
 logvol / --fstype xfs --name=lv01 --vgname=rootvg --size=1 --grow

%packages
 @core
 net-tools
 %end
 %post
 %end
