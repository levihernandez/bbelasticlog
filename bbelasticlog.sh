#!/bin/bash

###################################################################
# Title	        : Blackboard Access Log with Logstash
# Description.  : Basic script to download logstash and conf file
# Author        : Julian Levi Hernandez
# Date          : 08/03/2016
# Aumersbee Data
###################################################################

# Setup DIR structure
hdir=`pwd`
mkdir -p ${hdir}/{data,bins,conf,temp,arcs}

# Download Logstash 
curl -o bins/logstash.zip -L https://artifacts.elastic.co/downloads/logstash/logstash-6.7.1.zip

# Unzip the downloaded file
unzip bins/logstash.zip -d ${hdir}/bins/

# Download the blackboard.conf file to the conf dir
curl -o conf/bb-access-log.conf -L https://raw.githubusercontent.com/levihernandez/bbelasticlog/master/bb-access-log.conf

