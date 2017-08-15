if [[ ! -o interactive ]]; then
    return
fi

compctl -K _site site

_site() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(site commands)"
  else
    completions="$(site completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
