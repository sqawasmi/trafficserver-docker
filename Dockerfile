FROM        debian

MAINTAINER  Shaker Qawasmi "http://github.com/sqawasmi"

# Update the package repository
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \ 
	DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl locales build-essential bzip2 libssl-dev libxml2-dev libpcre3-dev tcl-dev

# Configure locale
RUN export LANGUAGE=en_US.UTF-8 && \
	export LANG=en_US.UTF-8 && \
	export LC_ALL=en_US.UTF-8 && \
	locale-gen en_US.UTF-8 && \
	DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

# Install TrafficServer
RUN mkdir /downloads
RUN wget http://download.nextag.com/apache/trafficserver/trafficserver-4.2.1.tar.bz2 -O /downloads/trafficserver-4.2.1.tar.bz2
RUN cd /downloads && tar xvf trafficserver-4.2.1.tar.bz2 
RUN cd /downloads/trafficserver-4.2.1/ && ./configure --prefix=/opt/trafficserver
RUN cd /downloads/trafficserver-4.2.1/ && make
RUN cd /downloads/trafficserver-4.2.1/ && make install
ADD ./files/etc/trafficserver /etc/trafficserver
RUN ln -sf /etc/trafficserver /opt/trafficserver/etc/trafficserver

EXPOSE 8080

CMD ["/opt/trafficserver/bin/traffic_server"]
