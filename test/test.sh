#!/bin/sh

file=test/hashes.zsh
cmdf="./hashed -f $file"

test_hash () {
  assertEquals '~src/vim' $($cmdf $HOME/src/vim)
}

test_unhash() {
  assertEquals $HOME/src/vim $($cmdf -u '~src/vim')
}

test_muluti() {
  assertEquals "$HOME/src/vim
$HOME/bin" "$($cmdf -un '~src/vim' '~bin')"
}

test_pipe() {
  assertEquals "$HOME/src/vim
$HOME/bin" "$(echo '~src/vim
~bin' | $cmdf -un)"
}

. /usr/share/shunit2/shunit2
