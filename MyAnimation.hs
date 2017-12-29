{-
 --------------Falling code-------------------
 * The animation is taken from the movie Matrix
 * with a black canvas in the background to
 * highlight the binary looking rect shape '1's.
 * The animation gives the illusion effect of
 * the shapes endlessly falling downwards.
 --------------Falling code-------------------
-}

module MyAnimation where 
import Animation 

-- gives infinite pseudo like random numbers ranging from 1 to 33 to new list 
pseudoRandoms :: [Int]
pseudoRandoms = map (`mod` 39) (iterate (*6) 33)      

picture :: Animation
picture =
    (withPaint (always black)
         (rect (always 799) (always 599)))
    `plus`
    (combine    
      [translate 
        (repeatSmooth (0, 599) 
          [(0,(3*eights,0)),                  -- eights: multiples of increasing 8s 
           (0.1* fromIntegral switchSpeed*3,  -- switchSpeed uses pseudoRandoms for repeatSmooth switches
            (3*eights,599))])    
              (withPaint (always green)
                   (rect (always (5)) (always 15)))
      | (eights, switchSpeed) <- take 33 (zip [2,10..] pseudoRandoms)]) 
test :: IO () 
test = writeFile "MyAnimation.svg" (svg 800 600 picture)


