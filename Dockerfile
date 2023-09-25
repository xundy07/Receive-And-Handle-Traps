FROM ubuntu:22.04

RUN apt-get update
RUN apt-get --no-install-recommends -y install sudo ufw iptables vim net-tools snmp  \
    snmp-mibs-downloader libsnmp-perl libnet-ip-perl snmptrapd snmptt pip xvfb libglib2.0-0 libnss3 libgconf-2-4 libfontconfig1

WORKDIR /app

COPY . /app/
COPY snmptrapd.conf /etc/snmp/snmptrapd.conf
COPY snmptt.conf /etc/snmp/snmptt.conf
COPY snmptt.ini /etc/snmp/snmptt.ini

RUN chown -R 1000:1000 -R /app
RUN chmod +x /app/entrypoint.sh
RUN chmod +x /usr/sbin/snmptt

EXPOSE 162

ENTRYPOINT ["sh", "-c", "/app/entrypoint.sh"]