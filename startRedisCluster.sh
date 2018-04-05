#!/bin/sh
./redis-6382/redisManager start
sleep 1
./redis-6383/redisManager start
sleep 1
./redis-6384/redisManager start
sleep 1
./redis-6385/redisManager start
sleep 1
./redis-6386/redisManager start
sleep 1
./redis-6387/redisManager start
sleep 1 
ps -ef|grep redis-server
