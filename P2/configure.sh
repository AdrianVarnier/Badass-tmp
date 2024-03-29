# STATIC CONFIGURATION
# config bridge
ip link add br0 type bridge
ip link set dev br0 up
ip addr add 10.1.1.1/24 dev eth0
ip addr show eth0

# create vxlan network
ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.2 local 10.1.1.1 dstport 4789
ip addr add 20.1.1.1/24 dev vxlan10

    # addif = add vxlan interface to bridge
    brctl addif br0 eth1
    brctl addif br0 vxlan10

    # put vxlan on
    ip link set dev vxlan10 up


# MULTICAST CONFIGURATION
# config bridge
ip link add br0 type bridge
ip link set dev br0 up
ip addr add 10.1.1.1/24 dev eth0
ip addr show eth0

# create vxlan network
ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789
ip addr add 20.1.1.1/24 dev vxlan10

    # add bridge
    brctl addif br0 eth1
    brctl addif br0 vxlan10

    # put vxlan on
    ip link set dev vxlan10 up


# show configs
ip -d link show vxlan10
ip -d link show eth1
ip link show
