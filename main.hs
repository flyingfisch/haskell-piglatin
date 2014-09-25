main = do
	putStrLn "Type some text to translate into Pig Latin!"
	input <- getLine
	putStrLn $ toPigLatin input

toPigLatin :: String -> String
toPigLatin = unwords . map wordToPigLatin . words

wordToPigLatin :: String -> String
wordToPigLatin (x:xs) = xs ++ [x] ++ "nay"
