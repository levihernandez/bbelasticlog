# bbelasticlog
[Blackboard LMS](https://www.blackboard.com) log parsing with [Logstash](https://www.elastic.co/products/logstash).

The current project parses logs from Blackboard LMS with the assistance of the Elastic Logstash product. Blackboard logs are saved in a daily basis with the use of the internal tool called LogRotate script. All files are compressed and stored in the $BBHOME/logs directory with random naming of the zip files.

The installation script can take care of the download and directory structure. Use at your own discretion and risk.

## Install

Download the script, it will fetch logstash and the bb-access-log.conf file.

```bash
$ pwd
/home/logstash

$ curl -O -L https://raw.githubusercontent.com/levihernandez/bbelasticlog/master/bbelasticlog.sh
$ chmod 744 bbelasticlog.sh
$ ./bbelasticlog.sh
```

## Decompress Zip files
Decompress the Blackboard logs:

```bash
$ unzip 89463778234.zip -d /home/logstash/data/inbound/20190401
```
Tweak the bb-access-log.conf to match the inbound data path.

## Running Logstash

Execute Logstash to parse Blackboard logs.

```bash
$ pwd
/home/logstash
$ bins/bin/logstash -f conf/bb-access-log.conf
```

## Preview CSV Data

A caveat with the CSV approach is that the headers for the file will be printed multiple times accross the file. This is a minor annoyance as logstash needs to use the column headers to know where to allocate the data. A sed command to remove the headers can be applied. A second sed to insert the header at the first line of the CSV can also be done.

```bash
$ head -5 data/output/access/2019.04.03/09_01-access.csv
```
