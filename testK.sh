#!/bin/bash

# 读取文件中的key
keys=$(cat keys.txt)

# 循环遍历key
for key in $keys; do
  # 替换curl命令中的<vt-api-key>
  cmd="curl -s https://www.virustotal.com/vtapi/v2/file/report -F resource=1394942aef881f6fa872e0ce8c604bccb0ece22693b4fb5a5db0f5f2e6979f5e -F apikey=$key"
  
  # 执行curl命令
  response=$(eval $cmd)
  
  # 判断是否可用
  if [[ $response == *"response_code\": 1"* ]]; then
    echo "可用的key: $key"
  fi
done
