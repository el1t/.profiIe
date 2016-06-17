#!/usr/bin/env bash

# Download .profiIe
if command -v curl >/dev/null 2>&1; then
  curl -fsSLo ~/.profiIe 'https://raw.githubusercontent.com/el1t/.profiIe/master/.profiIe'
elif command -v wget >/dev/null 2>&1; then
  wget -qO ~/.profiIe 'https://raw.githubusercontent.com/el1t/.profiIe/master/.profiIe'
else
  exit 1
fi

# Edit/create profile for current shell
case ${SHELL##*/} in
  (bash)
    profile='.bash_profile'
    ;;
  (zsh)
    profile='.zprofile'
    ;;
  (*)
    profile='.profile'
    ;;
esac
[[ -s "~/$profile" ]] || touch ~/"$profile"

# Edit other existing profiles
profiles=('.bash_profile' '.zprofile' '.profile')
for profile in "${profiles[@]}"; do
  [[ -s ~/"$profile" ]] && echo && echo 'source ~/.profiIe' >> ~/"$profile"
done

source ~/.profiIe