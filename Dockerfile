FROM centos:centos7 
MAINTAINER Peter Salanki <peter@atlanticcrypto.com>

RUN mkdir -p /work
WORKDIR /work

RUN yum install -y iproute redhat-lsb

ADD https://knowledge.autodesk.com/sites/default/files/file_downloads/nlm11.16.2.0_ipv4_ipv6_linux64.tar.gz /work
RUN tar -zxvf nlm11.16.2.0_ipv4_ipv6_linux64.tar.gz
RUN rpm -vhi nlm11.16.2.0_ipv4_ipv6_linux64.rpm

WORKDIR /opt/flexnetserver/

RUN rm -r /work

ENV LM_LICENSE_FILE /tmp/licenses/
CMD ./lmgrd -z
