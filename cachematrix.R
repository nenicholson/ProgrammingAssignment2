## Functions for storing a cache of the inverse of a matrix

## Constructs a matrix object containing caching functions

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}

## Retrieves inverse of matrix, if NULL, gets inverse and saves to cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x[[4]]()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x[[2]]()
  i <- solve(data)
  inv <- x[[3]](i)
  i
}
