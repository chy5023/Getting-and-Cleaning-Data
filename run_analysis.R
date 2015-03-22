setwd("C:/Users/chy5023/Documents/02 Education/Getting and cleaning data/Assignment")  
## acknowledgenent to tao zhang (UsingtcNower) for the manual work to extract only the mean and sd
 
#join data from subject, activity, observe  
joinData <- function(datatype) { 
        set_files <- paste("UCI HAR Dataset/", datatype, "/X_", datatype, ".txt", sep="") 
        label_files <- paste("UCI HAR Dataset/", datatype, "/Y_", datatype, ".txt", sep="") 
        subject_file <- paste("UCI HAR Dataset/", datatype, "/subject_", datatype, ".txt", sep="") 
        sets <- read.table(set_files) 
        labels <- read.table(label_files) 
        subject <- read.table(subject_file) 
   sets <- cbind(subject, labels, sets) 
   sets 
} 
 
 
#1. Merges the training and the test sets to create one data set 

train <- joinData("train") 
test  <- joinData("test") 
data  <- rbind(train, test) 
head(data) 

# train and test no longer needed
rm(train) 
rm(test) 
 
 
names <- read.table("UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors = FALSE) 
colnames(data) <- c("Subject", "Activity", names[,"V2"]) 
 
 
#build index to extract mean and sd
idx <- c(1,2, c(1,2,3,4,5,6, 41,42,43,44,45,46, 81,82,83,84,85,86, 161,162,163,164,165,166, 
         201,202, 214,215, 227,228, 240,241, 253,254, 266,267,268,269,270,271, 
         294,295,296, 345,346,347,348,349,350, 373,374,375, 424,425,426,427,428,429, 
         452,453,454, 503,504, 516,517, 529,530, 542,543, 552)+2) 
data <- data[, idx] 

 

 
 
#2.Extracts only the measurements on the mean and standard deviation for each measurement 
cleanData <- aggregate(subset(data, select=-c(Subject,Activity)), by=list(Subject=data$Subject, Activity=data$Activity), FUN=mean)

#3.Uses descriptive activity names to name the activities in the data set
 
mapToActivity <- read.table("UCI HAR Dataset/activity_labels.txt") 
data[, "Activity"] <- mapToActivity[data[,"Activity"], "V2"] 

#4.Appropriately labels the data set with descriptive variable names

cleanData <- melt(cleanData, id=c("Subject", "Activity"), measure.vars=colnames(cleanData)[-c(1,2)]) 
colnames(cleanData) <- c("Subject","Activity","variable","mean") 
 
 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of
# each variable for each activity and each subject 

write.table(cleanData, file="data_cleaned.txt", row.name=FALSE) 
