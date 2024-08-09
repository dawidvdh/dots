source ~/.config/op/plugins.sh
source ~/.zsnap/znap.zsh

# history
SAVEHIST=100000

# vim bindings
bindkey -v

fpath+=${ZDOTDIR:-~}/.zsh_functions

PURE_GIT_UNTRACKED_DIRTY=0

znap prompt sindresorhus/pure

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search

eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init zsh)"

# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# VI mode
bindkey -v

for file in ~/.{path,exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
	done;
unset file;
