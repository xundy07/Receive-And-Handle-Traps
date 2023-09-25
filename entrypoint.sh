#!/bin/bash
/usr/sbin/snmptt --daemon
/usr/sbin/snmptrapd -Ln -f -Lf /var/log/snmptrapd.log