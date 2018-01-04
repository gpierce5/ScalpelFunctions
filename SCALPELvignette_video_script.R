library(scalpel)

###########################################################################################
## run SCALPEL pipeline on simulated data in R package
## this is the first code chunk from the vignette
###########################################################################################

#example video is provided with the R package
#automatically locate the folder that contains "Y_1.rds"
rawDataFolder = gsub("Y_1.rds", "", system.file("extdata", "Y_1.rds", package = "scalpel"))
#define the height of the example video
videoHeight = 30
#existing folder in which to save various results
#if rerunning this code yourself, change this to an existing folder on your computer
outputFolder = "~/Desktop/miniData/"

#run the entire SCALPEL pipeline
miniOut = scalpel(outputFolder = outputFolder, videoHeight = videoHeight, rawDataFolder = rawDataFolder)

###########################################################################################
## PART I
## INTERACTIVE MODE: Manual Filtering of Estimated Neurons Between Steps 2 and 3
###########################################################################################

#do an initial review of each estimated neuron
reviewNeuronsInteractive(scalpelOutput = miniOut, neuronSet = "A")
#gather more information as to whether an estimated neuron is real
reviewNeuronsMoreFrames(scalpelOutput = miniOut, neuronSet = "A")
#update the status of the neurons we were unsure about
updateNeuronsInteractive(scalpelOutput = miniOut, neuronSet = "A")
#gather more information about overlapping estimated neurons
reviewOverlappingNeurons(scalpelOutput = miniOut, neuronSet = "A")
#see the status of the neurons
getNeuronStatus(scalpelOutput = miniOut, neuronSet = "A")

par(mfrow=c(1,2))
#dictionary prior to manual classification
plotSpatial(scalpelOutput = miniOut, neuronSet = "A")
#dictionary after to manual classification
plotSpatial(scalpelOutput = miniOut, neuronSet = "A", neuronsToDisplay = "kept")

#run Step 3 with the neurons we kept
step3discarded = scalpelStep3(step2Output = miniOut, excludeReps = "discarded")
plotResults(scalpelOutput = step3discarded)

###########################################################################################
## PART II
## INTERACTIVE MODE: Plotting a Custom Set of Neurons
###########################################################################################

#do an initial review of each estimated neuron
reviewNeuronsInteractive(scalpelOutput = miniOut, neuronSet = "Afilter")
#gather more information as to whether an estimated neuron is real
reviewNeuronsMoreFrames(scalpelOutput = miniOut, neuronSet = "Afilter")
reviewOverlappingNeurons(scalpelOutput = miniOut, neuronSet = "Afilter")
#update the status of the neurons we were unsure about
updateNeuronsInteractive(scalpelOutput = miniOut, neuronSet = "Afilter")
#see the status of the neurons
getNeuronStatus(scalpelOutput = miniOut, neuronSet = "Afilter")

#plotting functions that use the neuronsToOutline="kept" argument
plotVideoVariance(scalpelOutput = miniOut, neuronSet = "Afilter", neuronsToOutline = "kept")
plotBrightest(scalpelOutput = miniOut, AfilterIndex = 1, neuronsToOutline = "kept")

#plotting functions that use the neuronsToDisplay="kept" argument
plotResults(scalpelOutput = miniOut, neuronsToDisplay = "kept")
plotResultsAllLambda(scalpelOutput = miniOut, neuronsToDisplay = "kept")
plotSpatial(scalpelOutput = miniOut, neuronSet = "Afilter", neuronsToDisplay = "kept")
plotTemporal(scalpelOutput = miniOut, neuronsToDisplay = "kept")

###########################################################################################
## PART III
## NON-INTERACTIVE MODE: Manual Filtering of Estimated Neurons Between Steps 2 and 3
###########################################################################################

#save the plots for determining the classifications
reviewNeurons(scalpelOutput = miniOut, neuronSet = "A")
#see the status of the neurons
getNeuronStatus(scalpelOutput = miniOut, neuronSet = "A")
#update the status of the neurons once files are sorted
updateNeurons(scalpelOutput = miniOut, neuronSet = "A")
#see the status of the neurons
getNeuronStatus(scalpelOutput = miniOut, neuronSet = "A")
#gather more information as to whether an estimated neuron is real
reviewNeuronsMoreFrames(scalpelOutput = miniOut, neuronSet = "A")
reviewOverlappingNeurons(scalpelOutput = miniOut, neuronSet = "A")
#update the status of the neurons once files are sorted again
updateNeurons(scalpelOutput = miniOut, neuronSet = "A")
getNeuronStatus(scalpelOutput = miniOut, neuronSet = "A")

par(mfrow=c(1,2))
#dictionary prior to manual classification
plotSpatial(scalpelOutput = miniOut, neuronSet = "A")
#dictionary after to manual classification
plotSpatial(scalpelOutput = miniOut, neuronSet = "A", neuronsToDisplay = "kept")

#run Step 3 with the neurons we kept
step3discarded = scalpelStep3(step2Output = miniOut, excludeReps = "discarded")
plotResults(scalpelOutput = step3discarded)

###########################################################################################
## PART IV
## NON-INTERACTIVE MODE: Plotting a Custom Set of Neurons
###########################################################################################

#save the plots for determining the classifications
reviewNeurons(scalpelOutput = miniOut, neuronSet = "Afilter")
#see the status of the neurons
getNeuronStatus(scalpelOutput = miniOut, neuronSet = "Afilter")
#update the status of the neurons once files are sorted
updateNeurons(scalpelOutput = miniOut, neuronSet = "Afilter")
#see the status of the neurons
getNeuronStatus(scalpelOutput = miniOut, neuronSet = "Afilter")
#gather more information as to whether an estimated neuron is real
reviewNeuronsMoreFrames(scalpelOutput = miniOut, neuronSet = "Afilter")
reviewOverlappingNeurons(scalpelOutput = miniOut, neuronSet = "Afilter")
#update the status of the neurons once files are sorted again
updateNeurons(scalpelOutput = miniOut, neuronSet = "Afilter")

#plotting functions that use the neuronsToOutline="kept" argument
plotVideoVariance(scalpelOutput = miniOut, neuronSet = "Afilter", neuronsToOutline = "kept")
plotBrightest(scalpelOutput = miniOut, AfilterIndex = 1, neuronsToOutline = "kept")

#plotting functions that use the neuronsToDisplay="kept" argument
plotResults(scalpelOutput = miniOut, neuronsToDisplay = "kept")
plotResultsAllLambda(scalpelOutput = miniOut, neuronsToDisplay = "kept")
plotSpatial(scalpelOutput = miniOut, neuronSet = "Afilter", neuronsToDisplay = "kept")
plotTemporal(scalpelOutput = miniOut, neuronsToDisplay = "kept")
