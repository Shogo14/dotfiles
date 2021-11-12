# ~/.zshrcを読み込んだ際に~/.bashrcを読み込むようにします。
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# rarの設定
# export PATH=/Applications/rar:$PATH

# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit

# git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='
%F{green}[%~]%f
'\$vcs_info_msg_0_' $ '
precmd(){ vcs_info }

# history setting
setopt extended_history
alias history="history -di"
alias ls="ls -G"

# reviewer_stats
alias reviewer_stats="gh pr list | awk '{print \$1}' | xargs -I@ gh pr view @ | grep Requested | awk '{print \$2}' | sort | uniq -c | sort"

# Git掃除コマンド
alias gb_clean="git branch --merged|egrep -v '\*|develop|main|master'|xargs git branch -d"

