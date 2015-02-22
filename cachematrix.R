## Takes  a square matrix, assuming non singula, and converts it into a special 
## C++ class type object with its own cache variable soring the inverse of the object

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

## Function which when called on special bundled object created using makeCacheMatrix
##checks for if the the special bundled matrix has its inverse already calculated or not
## in case the invers is not a null the same is returned else it is calcualted and 
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
##Return a matrix that is the inverse of 'x'Verify taking a diag of original and inverse
}
