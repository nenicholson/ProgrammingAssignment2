## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        matrix(c(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse), nrow=2, ncol=2)
}

## Write a short comment describing this function

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
