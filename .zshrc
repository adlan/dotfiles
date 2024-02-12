source ${ZDOTDIR:-~}/.antidote/antidote.zsh

antidote load

autoload -Uz promptinit
promptinit
prompt pure

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt INC_APPEND_HISTORY_TIME

bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
