## This fucntion creates a "special matrix", which is a list containing a fucntion to:
## - set the value of the matrix
## - get the value of the matrix
## - the value of the inverse
## - get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
    ## initialize the stored inverse value to the NULL
    inv <- NULL
    ## set the value of the matrix
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    ## get the value of the matrix
    get <- function() x
    ## the value of the inverse
    setInverse <- function(invH) inv <<- invH
    ## get the value of the inverse
    getInverse <- function() inv
    ## return the list with all these functions
    list(set = set, get = get,
    setInverse = setInverse,
    getInverse = getInverse)
}

## The next function calculates the inverse of the special matrix.
## Moreover, it checks if this matrix has already been calculated to inverse.
## If it was, it ships the calculation and and get the value from the function above
## If it wasn't, it calculates it the inverse matrix and sets the value if the inverse matrix in the cache

cacheSolve <- function(x, ...) {
    ## check if inverse matrix has aleady been calculated
    inv <- x$getInverse()
    if(!is.null(inv)) {
        message("You've done it. Getting cached data")
        return(inv) ## so we return the cache if it was
    }
    ## if there's no cache we compute the inverse
    data <- x$get()
    inv <- solve(data, ...)
    x$setInverse(inv)
    m
}