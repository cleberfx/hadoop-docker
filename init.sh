#!/bin/bash

/usr/sbin/sshd

$HADOOP_HOME/bin/hdfs namenode -format

$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/root
$HADOOP_HOME/bin/hdfs dfs -put $HADOOP_HOME/input input
