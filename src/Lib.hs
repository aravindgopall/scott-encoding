{-# LANGUAGE Rank2Types #-}
module Lib
    ( someFunc
    ) where

import Prelude hiding (map)

someFunc :: IO ()
someFunc = putStrLn "someFunc"


newtype Pair a b =
  Pair { runPair :: forall r. (a -> Pair a b -> r) -> (b -> r) -> r }

data List a =                  Nil | Cons a (List a)

newtype ListS a =
  ListS { runListS :: forall r. r -> (a -> ListS a -> r) -> r }

nil :: ListS a
nil = ListS (\r f -> r)

cons :: a -> ListS a -> ListS a
cons x xs = ListS (\r f -> f x xs)

uncons :: r -> (a -> ListS a -> r) -> ListS a -> r
uncons r ra (ListS rl) = rl r ra


map :: ( a -> b ) -> ListS a -> ListS b
map f =
  uncons nil (\x xs -> cons (f x) (map f xs))


----------- Booleans
data Bool = True | False
--newtype BoolS a b =
  --BoolS (forall r. (a -> r) -> (b -> r) -> r)
--newtype BoolS =
  --BoolS (forall r. BoolS -> BoolS -> r)

--true :: BoolS
--true = Bools (\a b -> a)


-------- Tuples ------
data Tuple a b = Tuple a b

newtype TupleS a b =
  TupleS { runTuple :: forall r. a -> b -> r }

--fst :: TupleS a b
--fst = TupleS (\a b -> a)

--snd :: TupleS a b -> b -> b
--snd (TupleS s) a =  a
