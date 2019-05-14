echo "option kvm_intel nested=1" >> /etc/modprobe.d/kvm-intel.conf
modprobe -r kvm_intel ; modprobe kvm_intel
yum -y install ovirt-engine ovirt-engine-cli
yum -y update selinux-policy
sed -i "s/0000/`hostname -f`/" /root/answers.txt
yum -y install rng-tools
sed -i 's@ExecStart=.*@ExecStart=/sbin/rngd -f -r /dev/urandom@' /usr/lib/systemd/system/rngd.service
systemctl start rngd
engine-setup --config-append=/root/answers.txt
yum -y install vdsm
{% if nested %}
echo "options kvm-intel nested=Y" > /etc/modprobe.d/kvm-intel.conf
yum -y install vdsm-hook-nestedvt vdsm-hook-macspoof
{% endif %}
