## The following set of two functions calculates computationally time
## consuming inverse of matrix. For any given matrix, the inverse
## calculation is done only once and the result is cached. When inversion 
## is called for the same matrix the next time, no calculation is done
## and the cached result is returned.

## makeCacheMatrix function creates a special matrix object that can cache
## its inverse. It returns a list of following functions.
## 1. set - set the value of the original matrix (to be inversed).
## 2. get - get the value of the original matrix.
## 3. setInverse - set the value of the inverse matrix.
## 4. getInverse - get the value of the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## cacheSolve function gets the inverse of the special matrix created
## makeCacheMatrix function. It calls getInverse function to get the
## inverse of the matrix. If inverse was already calculated for that matrix,
## it returns that. The function getInverse will return NULL, if the
## calculation was not already done. In that case inverse is calculated
## and stored in the cache before returning it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     i <- x$getInverse()
     if(!is.null(i)) {
          message("getting cached data")
          return(i)
     }
     data <- x$get()
     i <- solve(data, ...)
     x$setInverse(m)
     i
}
}
