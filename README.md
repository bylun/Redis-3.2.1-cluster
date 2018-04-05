# Redis-3.2.1-cluster
## redis集群节点目录
<br>redis-6382
<br>redis-6383
<br>redis-6384
<br>redis-6385
<br>redis-6386
<br>redis-6387
## 删除集群节点
删除从节点
========使用forget删除从节点
使用forget删除redis集群节点（从节点），集群依然可用
cluster forget aeb8f1310d42e10c71ec16f76b83e2d7aee3a49e
查看redis集群状态
cluster info
从节点已删除。
# 删除主节点
1、先转移哈希槽到其它主节点
./redis-trib.rb reshard 192.168.1.161:6382(首先把该master节点下的哈希槽转移到其他节点下)
注：
How many slots do you want to move (from 1 to 16384)?16384 //输入一个大于或等于7001节点所拥有的slots数的数即可.
What is the receiving node ID? 8ab3d14eba181c06dc8826bea0db1becdead2533 //接收这些slots的目标节点,这里是7002节点
Source node #1:a2eee0ea546f2c3701b08981737c07938039857c //因为我们要删除7001这个节点,所以源节点的id就是7001的节点ID
Source node #2:done //输入done,回车,就会开始从7001 这个节点迁移16384个slot(没有这么多就迁移拥有的全部)到7002节点中去.
## 删除主节点
./redis-trib.rb del-node 192.168.1.161:6382 9fbb6ed576b802c8b910c44fe975977540a1c9af（删除节点）
## 集群状态查看
cluster info
主节点已删除。

另外, 经过观察,这个主节点被删除之后,它之前拥有的从节点会自动成为其他主节点的从节点.
### 启动redis集群节点
./startRedisCluster.sh
### 执行redis节点加入集群
./joinRedisNodesCluster.sh
### 停止redis集群
./stopRedisCluster.sh
