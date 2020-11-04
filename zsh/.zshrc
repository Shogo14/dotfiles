
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/onsiter/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/onsiter/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/onsiter/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/onsiter/google-cloud-sdk/completion.zsh.inc'; fi

# ~/.zshrcを読み込んだ際に~/.bashrcを読み込むようにします。
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

export PATH=/Applications/rar:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

# autoload colors
# colors

# PS1="%{$fg[green]%}${USER}@${HOST%%.*} %1~ %(!.#.$)${reset_color} "
# prompt setting
# PS1='%n@%F{green}%m%f %1~ %# '

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
