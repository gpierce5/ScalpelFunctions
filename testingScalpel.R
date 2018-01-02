#I dont know what this means
## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ------------------------------------------------------------------------
library(scalpel)
library(Matrix)

##----------------------------------------
#find the input and output locations
rawDataFolder="//10.112.43.46/homes/georgia/Data/SC01-1/171027-001"
outputFolder = "//10.112.43.46/homes/georgia/Data/SC01-1/171027-001/scalpeltest"
videoHeight = 512

##--------------------------------------------------
#run scalpel
scalpelOut = scalpel(outputFolder, rawDataFolder, videoHeight, minClusterSize = 1,
        lambdaMethod = "trainval", lambda = NULL, cutoff = 0.26, omega = 0.2,
        fileType = "matlab", processSeparately = TRUE, minSize = 50, maxSize = 500,
        maxWidth = 50, maxHeight = 50, removeBorder = FALSE, alpha = 0.9,
        thresholdVec = NULL, maxSizeToCluster = 3000)
