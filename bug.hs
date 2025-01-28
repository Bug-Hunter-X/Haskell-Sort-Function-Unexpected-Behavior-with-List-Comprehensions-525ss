```haskell
import Data.List (sort)

main :: IO ()
main = do
  let xs = [1, 2, 3, 4, 5]
  let ys = sort xs -- This works fine
  let zs = sort [1,2,3,4,5] -- This also works
  let ws = sort $ [1..5] -- This also works, uses list comprehension
  print ys -- prints [1,2,3,4,5]
  print zs -- prints [1,2,3,4,5]
  print ws -- prints [1,2,3,4,5]

-- This however doesn't work
  let list_comprehension = [x * 2 | x <- [1..5], x `mod` 2 == 0]
  print list_comprehension  --prints [4,8]
  let sorted_list_comprehension = sort list_comprehension
  print sorted_list_comprehension --prints [4,8]

  -- Another example with a slightly more complex list comprehension
  let nested_list_comprehension = [[x,y] | x <- [1..3], y <- [4..6], even x] 
  print nested_list_comprehension --[[2,4],[2,5],[2,6]]
  let sorted_nested_list_comprehension = sort nested_list_comprehension
  print sorted_nested_list_comprehension --[[2,4],[2,5],[2,6]]

  --This is unexpected behaviour
  let another_nested_list_comprehension = [[x,y] | x <- [1..3], y <- [4..6], odd x] 
  print another_nested_list_comprehension --[[1,4],[1,5],[1,6],[3,4],[3,5],[3,6]]
  let sorted_another_nested_list_comprehension = sort another_nested_list_comprehension
  print sorted_another_nested_list_comprehension --[[1,4],[1,5],[1,6],[3,4],[3,5],[3,6]]

```