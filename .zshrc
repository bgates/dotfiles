# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bgates"

autoload bashcompinit
bashcompinit

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git extract rvm git-extras fasd command-not-found)
# I apparently can't use bundler plugin due to rvm conflict
# https://rvm.io/integration/zsh

. $ZSH/oh-my-zsh.sh

# Customize to your needs...
 
# to use tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && . $HOME/.tmuxinator/scripts/tmuxinator
TMUX_COMPLETION_PATH=$(ruby -e "print Gem.bin_path('tmuxinator', 'tmuxinator_completion', '>= 0')" 2> "/dev/null") 
[[ -s "$TMUX_COMPLETION_PATH" ]] && source "$TMUX_COMPLETION_PATH"
### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR='vim'

# http://blog.sanctum.geek.nz/terminal-annoyances/
stty -ixon

PATH=$PATH:$HOME/.manymo/bin # Add manymo to PATH for scripting

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# http://stackoverflow.com/questions/14181933/how-to-fix-zsh-correct-deploy-to-deploy-nyae
alias rails='nocorrect rails'
# hub
export PATH="$PATH:$HOME/bin"
alias git='hub'
# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
