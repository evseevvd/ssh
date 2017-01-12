#! /bin/bash
apt-get install python-software-properties && add-apt-repository ppa:webupd8team/java && apt-get update && apt-get install oracle-java8-installer && echo JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/bin/java" >> /etc/environment && source /etc/environment
