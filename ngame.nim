import games/puissance4
import games/ghost
import games/wordle
import os, strutils

const games = [
  puissance4.main,
  ghost.main,
  wordle.main,
]

template logo() =
  echo "\e[33m"
  echo "   ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄"
  echo "  █  █  █ █       █       █  █▄█  █       █"
  echo "  █   █▄█ █   ▄▄▄▄█   ▄   █       █    ▄▄▄█"
  echo "  █       █  █  ▄▄█  █▄█  █       █   █▄▄▄ "
  echo "  █  ▄    █  █ █  █       █       █    ▄▄▄█"
  echo "  █ █ █   █  █▄▄█ █   ▄   █ ██▄██ █   █▄▄▄ "
  echo "  █▄█  █▄▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█▄█   █▄█▄▄▄▄▄▄▄█"
  echo "\e[0m"
  echo "\n"

template clear() =
  if defined(windows): discard execShellCmd("cls")
  discard execShellCmd("clear")

template play(play_func: proc) =
  play_func()

proc menu(): uint =
  var c: uint = 0
  while c == 0:
    clear()
    logo()
    echo "    1. \e[33mPuissance 4\e[0m"
    echo "    2. \e[34mGhost Game\e[0m"
    echo "    3. \e[35mWordle \e[0m"
    echo "    4. Quit"
    echo ""
    stdout.write "    Your choice: "
    try:
      c = parseUInt(readline(stdin))
      if c < 1 or c > 4: c = 0
    except: continue
  return c

proc pause() = echo "Press Enter to continue"; discard readline(stdin)

proc main() =
  while true:
    let choice = menu()
    if choice == 4: break
    try:
      clear()
      play(games[choice-1])
      pause()
    except: discard

try:
  main()
except: discard
