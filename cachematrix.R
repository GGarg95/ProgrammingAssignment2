## The function makeCacheMatrix creates a special matrix object that cache its inverse

## makeCacheMatrix function creates a special matrix, which is really a list containing a function 
## 1. set the value of the matrix
## 2. get the value of the matirx
## 3. set the value of the inverse
## 4. get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
              m <- NULL
              set <- function(y){
                x <<- y
                m <<- NULL
                                }
              get <- function()x
              setinv <- function(inv)m <<- inv
              getinv <- function()m
              list(set = set, get = get,
                   setinv = setinv,
                   getinv = getinv)
                                          }


## cacheSolve function solves the inverse of the special matrix created with the above function. However, it first
## checks whether the inverse has already been calculated. If it has been calculated it take the inverse from cache memory. Otherwise,
## it calculates the inverse of the matrix and sets the value of the inverse in the cache via the setinv function. 

cacheSolve <- function(x){
        m <- x$getinv()
        if(!is.null(m)){
                        message("Getiing Cached data")
                        return(m)
                       }
        else{        
          data <- x$get()
        m <-  solve(data)
        x$setinv(m)
        m     }
                        }
