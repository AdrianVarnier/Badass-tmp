# enter config
vtysh
conf t

# config ospf
int lo
ip addr 1.1.1.1/32
int eth0
ip addr 10.1.1.1/30
router ospf
network 0.0.0.0/0 are 0

# config isis
router isis 1
net 49.0000.0000.0001.00
int lo
ip router isis 1
int eth0
ip router isis 1

# display port and addr
sh int

# display parameter
do sh ip ospf int
do sh ip ospf neighbor
do sh ip route

# ping addr
do sh ping 1.1.1.2

# delete ip addr
int eth0
no ip addr 10.1.1.1/30