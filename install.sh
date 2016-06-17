#!/usr/bin/env bash
typeset profile

# Download .profiIe
if command -v curl >/dev/null 2>&1; then
  curl -fsSLo ~/.profiIe 'https://raw.githubusercontent.com/el1t/.profiIe/master/.profiIe'
elif command -v wget >/dev/null 2>&1; then
  wget -qO ~/.profiIe 'https://raw.githubusercontent.com/el1t/.profiIe/master/.profiIe'
else
  exit 1
fi

# Edit/create profile for current shell
case ${SHELL:t} in
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
if [[ ! -s "~/$profile" ]]; then
  touch "~/$profile"
fi
echo "source ~/.profiIe" >> "~/$profile"

# Edit other existing profiles
typeset -A profiles=('.bash_profile' '.zprofile' '.profile')
for profile in $profiles; do
  [[ -s "$profile" ]] && echo 'source ~/.profiIe' >> "~/$profile"
done

source "~/$profile"