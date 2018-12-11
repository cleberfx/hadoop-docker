# Apache Hadoop Docker image

[![DockerPulls](https://img.shields.io/docker/pulls/dvoros/hadoop.svg)](https://registry.hub.docker.com/u/dvoros/hadoop/)
[![DockerStars](https://img.shields.io/docker/stars/dvoros/hadoop.svg)](https://registry.hub.docker.com/u/dvoros/hadoop/)

_Note: this is the master branch - for a particular Hadoop version always check the related branch_

# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build -t dvoros/hadoop:latest .
```

# Pull the image

The image is also released as an official Docker image from Docker's automated build repository - you can always pull or refer the image when launching containers.

```
docker pull dvoros/hadoop:latest
```

# Start a container

In order to use the Docker image you have just build or pulled use:

**Make sure that SELinux is disabled on the host. If you are using boot2docker you don't need to do anything.**

```
docker run -it dvoros/hadoop:latest /etc/bootstrap.sh -bash
```

## Testing

You can run one of the stock examples:

```
# run mapreduce
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar grep input output 'dfs[a-z.]+'

# check the output
hdfs dfs -cat output/*
```

## Hadoop native libraries, build

The Hadoop build process is no easy task - requires lots of libraries and their right version, protobuf, etc and takes some time - we have simplified all these, made the build and released a 64b version of Hadoop nativelibs [here](https://github.com/dvoros/docker-hadoop-build/releases). (These are automatically pulled during the build of this image.)

## Versions

The following versions are available from Docker Hub.

Image                      | Base CentOS image
---------------------------|------------------
dvoros/hadoop:2.7.4        | 6.5
dvoros/hadoop:2.9.0        | 7.0
dvoros/hadoop:3.1.1        | 7.0

## Downstream images

The following tables show what downstream images are available and what
images they're built on.

### Tez

Image                      | Hadoop image
---------------------------|--------------
dvoros/tez:0.8.4           | 2.7.4
dvoros/tez:0.8.5           | 2.9.0
dvoros/tez:0.9.1           | 3.1.1

### Hive

Image                      | Hadoop image | Tez image
---------------------------|--------------|-----------
dvoros/hive:2.3.0          | 2.7.4        | 0.8.4
dvoros/hive:2.3.3          | 2.9.0        | 0.8.5
dvoros/hive:3.1.1          | 3.1.1        | 0.9.1

### Sqoop

Image                          | Hadoop image | Tez image | Hive image
-------------------------------|--------------|-----------|-----------
dvoros/sqoop:1.4.7-hadoop3     | 3.1.0        | -         | -
dvoros/sqoop:hive2-sqoop3 (\*) | 2.9.0        | 0.8.5     | 2.3.3

> (\*) This is an experimental image built on my own version of Sqoop and not
an official Apache Sqoop release!
