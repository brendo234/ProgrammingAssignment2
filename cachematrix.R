## The following functions create and cache a matrix, and 
## solve the matrix, returning the inverse

## This function takes a matrix as an argument and caches it
## in the working environment

makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
     
     ## Take input and save to x
     set <- function(input){
          x <<- input
          m <<- NULL
     }
     
     get <- function() x 
     
     setmatrix <- function(solve) m <<- solve
     getmatrix <- function() m
     list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}


## Return the inverse of the matrix

cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
     m <- x$getmatrix()
     ## If a matrix wasn't provided, get it from the cache
     if(!is.null(m)) {
          message("Getting matrix from cache.")
          return(m)
     }
     data <- x$get()
     m <- solve(data, ...)
     x$setmatrix(m)
     m
}
