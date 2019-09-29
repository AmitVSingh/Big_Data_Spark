#!/bin/bash
learn_hdfs_helper() {
    local readonly OPERATIONS="start stop tty logs remove"
    local readonly OPERATION=${1}
    if [[ ! $OPERATIONS =~ $OPERATION ]]; then
      echo "Usage: ${OPERATION} not in {${OPERATIONS}}"
      return 1
    fi
    learn_hdfs_helper_${OPERATION}
    return 0
}

learn_hdfs_helper_remove() {
    docker container rm learn_hdfs
}

learn_hdfs_helper_start() {
docker run --rm -it -v /Users/amit/Documents/Big_data/Spark/Spark_rdd:/home/jovyan -p 8888:8888 -p 50070:50070 -p 8088:8088 --name learn_hdfs  bigdatateam/spark-course1
}

learn_hdfs_helper_stop() {
    docker container stop learn_hdfs
}

learn_hdfs_helper_tty() {
    docker exec -it learn_hdfs  /bin/bash
}


