set -o vi
alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'
export PS1='$(__git_ps1) \W\$ '
