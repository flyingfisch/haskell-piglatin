import Data.List

main = do
    putStrLn "Translate (t)o or (f)rom Pig Latin?"
    choice <- getLine

    let translator = chooser choice

    putStrLn "Type some text to translate into Pig Latin!"

    input <- getLine
    putStrLn $ translator input


chooser :: String -> (String -> String)
chooser choice =
    case choice of "t" -> toPigLatin
                   "f" -> fromPigLatin
                   otherwise -> fromPigLatin

toPigLatin :: String -> String
toPigLatin = unwords . map wordToPigLatin . words

fromPigLatin :: String -> String
fromPigLatin = unwords . map wordFromPigLatin . words

wordToPigLatin :: String -> String
wordToPigLatin (x:xs) = xs ++ [x] ++ "ay"

wordFromPigLatin :: String -> String
wordFromPigLatin x =
    let withoutAy = fst $ splitAt (length x - 2) x
    in [last withoutAy] ++ init withoutAy
