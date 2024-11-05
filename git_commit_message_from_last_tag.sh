#!/bin/bash

# 确保我们在一个git仓库中
if ! [ -d ".git" ]; then
    echo "当前目录不是一个git仓库"
    exit 1
fi

# 尝试获取上一个tag的commit hash（或者就是当前HEAD，如果它是一个tag）
last_tag_commit=$(git tag --sort=-creatordate | head -n 2 | tail -n 1 )

# 获取commit message
if [ -n "$last_tag_commit" ]; then
    # 如果有上一个tag（或者就是当前HEAD），则获取从上一个tag（包括这个tag）到其之前的所有commit的hash
    commits=$(git log --pretty=%s "$last_tag_commit"..HEAD)
else
    # 如果没有上一个tag，则获取从开始到HEAD的所有commit的hash
    commits=$(git log --pretty=%s)
fi

# 打印每个commit message
echo "$commits"
