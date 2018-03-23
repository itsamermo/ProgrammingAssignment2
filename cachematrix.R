## Put comments here that give an overall description of what your
## functions do
## makecacheMatrix func creates a special vector of methods and initiates a given matrix AND
## cacheSolve FUNC creates a inverse on first call and returns results from cache on subsequent calls

## Write a short comment describing this function
## function to create a special vector of lists to
## set /get / set inv and get inv of a given matrix
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(invmat) m <<- invmat
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
	

}


## Write a short comment describing this function
## function to calculate inverse of matrix for a given matrix on 1st calli
## on subsequent calls, function returns the cached results of inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        mat <- x$getinv()
        if(!is.null(mat)) {
                message("getting cached matrix")
                return(mat)
        }
        mat <- x$get()
        invmat <- solve(mat)
        x$setinv(invmat)
        invmat

}
