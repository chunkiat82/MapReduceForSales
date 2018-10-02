#!/bin/bash
export CLASSPATH="$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.2.0.jar:$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-common-2.2.0.jar:$HADOOP_HOME/share/hadoop/common/hadoop-common-2.2.0.jar:~/MapReduceTutorial/SalesCountry/*:$HADOOP_HOME/lib/*"
cd SalesCountry
javac -d . SalesMapper.java SalesCountryReducer.java SalesCountryDriver.java
jar cfm ProductSalePerCountry.jar Manifest.txt SalesCountry/*.class
$HADOOP_HOME/bin/hdfs dfs -copyFromLocal ~/inputMapReduce /
$HADOOP_HOME/bin/hdfs dfs -ls /inputMapReduce
$HADOOP_HOME/bin/hadoop jar ProductSalePerCountry.jar /inputMapReduce /mapreduce_output_sales
$HADOOP_HOME/bin/hdfs dfs -cat /mapreduce_output_sales/part-00000