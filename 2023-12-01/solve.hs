#!/usr/bin/env runhaskell

import Data.Char (digitToInt, isDigit)
import Data.List (find, isPrefixOf)

solve1 = sum . map digs
  where
    digs = read . (\s -> head s : [last s]) . filter isDigit


solve2 = sum . map digs
  where
    digs s = 10 * firstnum s + (lastnum . reverse) s
    numwords = zip ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"] [1..]
    revnumwords = map (\(s, n) -> (reverse s, n)) numwords
    numprefix s = fmap snd . find (\(num, _) -> num `isPrefixOf` s)
    firstnum [] = 0
    firstnum s@(c:rem)
      | isDigit c = digitToInt c
      | otherwise = case s `numprefix` numwords of
                      Just n -> n
                      Nothing -> firstnum rem
    lastnum [] = 0
    lastnum s@(c:rem)
      | isDigit c = digitToInt c
      | otherwise = case s `numprefix` revnumwords of
                      Just n -> n
                      Nothing -> lastnum rem

main =
  readFile "input" >>= return . lines >>= \input ->
    (print . solve1) input >>
    (print . solve2) input
