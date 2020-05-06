# scott-encoding

## Opiniated understanding of scott encoding

Any DS (either recursive or non-recursive) can be re-represented  
as function using church or scott encoding (there are blogs described   
using both). 

* Scott encoding will leave the type of itself in the function expression of
  the type  
    eg: 1) T ~ F T (Fix type) is equivalent to (T -> r)   
        2) newtype Scott a = Scott { unScott :: (a -> Scott a -> r) -> r -> r }  
           newtype Church a = Scott { unScott :: (a -> r -> r) -> r -> r }   
>newtype ListS a = ListS { runList :: (a -> ListS a -> r) -> r -> r }  
>data List a = Nil | Cons a (List a) --- therefore here  
>Nil === r  
>Cons a (List a) === (a -> List a -> r)
           
       

