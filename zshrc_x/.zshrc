source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# enable colors in autocomplete for directories, files, aliases and commands
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:options' list-colors '=^(-- *)=34'
zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
zstyle ':completion:*:commands' list-colors '=*=1;31'
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Disable Powerlevel10k - comment out the following if block and at the bottom two lines of code
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

#PLUGINS
# z plugin for quick filesystem navigation
source ~/.config/zsh/zsh-z.plugin.zsh
# zsh-autosuggestions plugin, cloned from github
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# call the completion script for zsh
# source ~/.config/zsh/completion.zsh

export PATH="/home/tomas/Applications:$PATH"

source ~/.zshrc_aliases

#CLEAN THEME
#source ~/.config/zsh/clean.zsh-theme

# fzf
# tomasr/molokai theme
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --inline-info --margin=1 --padding=1 --color=spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range :500 {}'"

# nnn
source ~/.dotfiles_lnx/nnn_x/nnn.config

# theme powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# syntax highlighting plugin must be at the end of the file
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# launch neofetch
# neofetch

# enable homebrew in shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval $(thefuck --alias)
