```haskell
import Data.List (sort)
import Data.Ord (comparing)

main :: IO ()
main = do
  let xs = [1, 2, 3, 4, 5]
  let ys = sort xs
  let zs = sort [1,2,3,4,5]
  let ws = sort $ [1..5]
  print ys
  print zs
  print ws

  let list_comprehension = [x * 2 | x <- [1..5], x `mod` 2 == 0]
  print list_comprehension
  let sorted_list_comprehension = sort list_comprehension
  print sorted_list_comprehension

  let nested_list_comprehension = [[x,y] | x <- [1..3], y <- [4..6], even x] 
  print nested_list_comprehension
  let sorted_nested_list_comprehension = sort nested_list_comprehension
  print sorted_nested_list_comprehension

  -- Here's how to sort nested lists based on a specific criteria, e.g., sorting by the first element then second
  let another_nested_list_comprehension = [[x,y] | x <- [1..3], y <- [4..6], odd x] 
  print another_nested_list_comprehension
  let sorted_another_nested_list_comprehension = sortOn (
                                                  [a, b]
                                                  -> (a, b)
                                                ) another_nested_list_comprehension
  print sorted_another_nested_list_comprehension

  --Alternative using comparing
  let sorted_another_nested_list_comprehension_alt = sortOn (comparing (
                                                        [a, b]
                                                        -> (a, b)
                                                      ) ) another_nested_list_comprehension
  print sorted_another_nested_list_comprehension_alt

```