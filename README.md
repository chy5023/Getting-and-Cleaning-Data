# Getting-and-Cleaning-Data
This repo is for the Getting and Cleaning Data class assignment.

The file referred to in (6) below can be found: here
https://s3.amazonaws.com/coursera-uploads/user-2b3ca9e96f8dc1393ffe1185/973499/asst-3/5405c600d0b511e4aceffbf2a09067c7.txt

A full description of the Human Activity Recognition Using Smartphones Data Set is availiable: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis.R program is executed to a get a clean data set and consists of the following steps: 

1.Merge the train and test data into one dataset (UCI HAR Dataset/test & UCI HAR Dataset/train, respectively)
2.Extracts onlt the measures on the mean and standard deviation for each measurement
3.Uses descriptive activity names to name the activies.
4.Label the data with descriptive variable names
5.Create one tidy data set with the average of each variable for each activity and each subject.
6.Save the new data set into the txt file named data_cleaned.txt

Please refer to the code book for variable information, etc.

