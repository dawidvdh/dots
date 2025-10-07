
# Load OP plugin manager and Znap
source ~/.config/op/plugins.sh
source ~/.zsnap/znap.zsh

# History configuration
SAVEHIST=100000
HISTSIZE=100000

# History options to prevent duplicates and improve search
setopt inc_append_history
setopt share_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# zsh-history-substring-search unique results
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Vim mode bindings
bindkey -v
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Load Pure prompt
PURE_GIT_UNTRACKED_DIRTY=0
znap prompt sindresorhus/pure

# Enhanced Pure prompt settings
export PURE_CMD_MAX_EXEC_TIME=3
export PURE_SHOW_UPSTREAM=1
export PURE_GIT_DELTA_FORMAT="%F{yellow}%s…%f"

# Completion configuration
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

# Load syntax plugins
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search

# zsh-completions plugin
znap source zsh-users/zsh-completions
fpath+=${ZDOTDIR:-~}/.zsh-completions/src
autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select=1           # Enter menu-completion on first Tab
zstyle ':completion:*' list-prompt "%S%M matches%s"  # Show match count
zstyle ':completion:*' group-name ''            # Don’t show group headers

# Use recent matches first
zstyle ':completion:*' sort yes
zstyle ':completion:*' file-sort mru           # For file names
zstyle ':completion:*:commands' command-sort mru  # For commands

# Smart directory navigation
setopt auto_cd
setopt pushd_ignore_dups
bindkey '^O' pushd
bindkey '^[O' popd

# Automatic correction of typos
setopt correct

# zoxide for directory jumping
eval "$(zoxide init zsh)"

# Python environment manager
eval "$(mise activate zsh)"

for file in ~/.{path,exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
	done;
unset file;
