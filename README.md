# gh-action-shell
- 一些有用的shell脚本,可用于github-action,因为懒得编写一个新的action
# 使用方法
## git_commit_message_from_last_tag.sh
- `curl https://raw.githubusercontent.com/chenxuan520/gh-action-shell/main/git_commit_message_from_last_tag.sh | bash 1>commit-message.log 2>/dev/null`
- 运行后输出为当前提交到上一个tag生成的所有commit message信息,用于release body的自动化生成
