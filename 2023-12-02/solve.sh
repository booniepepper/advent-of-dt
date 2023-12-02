#!/bin/sh

echo -n "PART 1: "
<input \
  dt \
  '[ [max target]:  ... [n color]:  n to-int max gt?  color target eq?  and ] \bad? def' \
  '[ ": " split deq [game pulltext]:' \
  '  game words last to-int' \
  '  pulltext "; " split [", " split \words map ...] map \pulls:' \
  '  pulls [12 "red" bad?] filter' \
  '  pulls [13 "green" bad?] filter concat' \
  '  pulls [14 "blue" bad?] filter concat' \
  '  len 0 neq? [drop] swap do?' \
  '] map' \
  '\to-int map' \
  '" + " join' \
  | bc

# TODO: Add sum to builtins

echo -n "PART 2: "
<input \
  dt \
    '[ [color]: [ dup last color eq? ] filter [first to-int] map sort last] \best def' \
    '[ ": " split last "; " split ", " join ", " split [words] map \pulls:' \
    '  pulls "red" best' \
    '  pulls "green" best *' \
    '  pulls "blue" best *' \
    '] map' \
    '" + " join' \
    | bc

# TODO: Add max to stdlib [sort last]
