## Takes  a square matrix, assuming non singula, and converts it into a special 
## C++ class type object with its own cache variable for  storing its inverse 
## Bundles a matrix with its inverse. There are methods to set the matrix, 
##extract and set its inverse.
makeCacheMatrix <- function(x = matrix()) {  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
  }

## Function  when called on special bundled object created using makeCacheMatrix
##checks for if the the special bundled matrix has  inverse already  or not
## in case the inverse is not a null  same is returned else it is calcualted and 
##stored in the bundled onject.
cacheSolve <- function(x, ...) {
     m <- x$getinv()
     if(!is.null(m)) {
          message("getting cached data")
          return(m)
     }
     data <- x$get()
     m <- solve(data, ...)
     x$setinv(m)
     m      
##Return a matrix that is the inverse of 'x'Verify taking a diag of original 
##and inverse
}
