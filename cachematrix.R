## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should 
#retrieve the inverse from the cache.

library(matlib)

makeCacheMatrix <- function(m = matrix()) {
        invx <- NULL
        set <- function(y){
                x<<-y
                invx<<-NULL
        }
        #set(m)
        get <- function() x
        setinverse <- function(inverse) invx <<-inverse
        getinverse <- function()invx
        
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invx <- x$getinverse()
        if(!is.null(invx)){
                message("Getting cached inverse matrix...")
                invx
        }
        y <- x$get()
        invx <- inv(y)
        x$setinverse(invx)
        invx
}
