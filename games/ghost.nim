import rdstdin, strutils
import os
import random

# clear the terminal screen
template clear() =
  when defined(Windows):
    discard execShellCmd("cls")
  else:
    discard execShellCmd("clear")

# play one round
# return true if continue
# return false if ghost
proc play_round(score: uint): bool =
  clear()
  let secret = rand(1..3).uint
  while true:
    echo "score: ", score
    let input = readLineFromStdin("choose a door (1-3): ")
    try:
      let n = parseUInt(input)
      return n != secret
    except:
      echo "not a right number..."

proc main*() =
  randomize()
  var score: uint = 0
  while play_round(score):
    score += 1
  echo "Oh NO !!! A FANTOM !!!"
