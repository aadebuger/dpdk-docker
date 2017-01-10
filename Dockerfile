from ubuntu:latest
run apt-get update
run apt-get install -y build-essential
run apt-get install -y   linux-headers-generic flex bison
run apt-get install -y wget 
run cd /tmp && wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz && tar xzvf libpcap-1.8.1.tar.gz
run cd /tmp/libpcap-1.8.1 && ./configure && make && make install
run cd /tmp && wget http://fast.dpdk.org/rel/dpdk-16.11.tar.xz && tar xvf dpdk-16.11.tar.xz  
run  apt-get install -y linux-headers-generic
run cd /tmp && tar xf dpdk-16.11.tar.xz 
run cd /lib/modules && ln -s 4.4.0-57-generic 4.4.39-moby
run cd /tmp &&  cd dpdk-16.11 && make config T=x86_64-native-linuxapp-gcc && sed -ri 's,(PMD_PCAP=).*,\1y,' build/.config && make
