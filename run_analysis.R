## This R script created to complete the course project of Getting and Clean Data by Coursera.

## load library
## When need functions from both plyr and dplyr, please load plyr first, then dplyr:
library(plyr)
library(dplyr)

## Download file from web
## --------------------------------------------------------------------------------------------------
## Create directory if not exist
if (!file.exists("./data")) {
	dir.create("./data")
}

if (!file.exists("./data/UCI HAR Dataset")) {
	## Download file
	setInternet2(use = TRUE)
	fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	zipfile <- "./data/UCI_HAR_Dataset.zip"
	download.file(fileURL, destfile=zipfile)
	## Unzip the source file
	unzip(zipfile, exdir = "./data")
	## Remove zipfile
	## file.remove(zipfile)
}

## Load data
## -------------------------------------------------------------------------------------------------
features <- read.table("./data/UCI HAR Dataset/features.txt")[, 2]
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")


## 4. Appropriately labels the data set with descriptive variable names
## --------------------------------------------------------------------------------------------------
names(activity_labels) <- c("label_id", "activity")

names(x_train) <- features
names(y_train) <- "label_id"
names(subject_train) <- "subject"

names(x_test) <- features
names(y_test) <- "label_id"
names(subject_test) <- "subject"


## 2. Extracts only the measurements on the mean and standard deviation for each measurement
## --------------------------------------------------------------------------------------------------
extract_features <- grepl("mean|std", features)
x_train <- x_train[ , extract_features]
x_test <- x_test[ , extract_features]


## 1. Merges the training and the test sets to create one data set
## ---------------------------------------------------------------------------------------------------
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

data <- cbind(subject_all, y_all, x_all)

## 3. Uses descriptive activity names to name the activities in the data set
## --------------------------------------------------------------------------------------------------
data <- select(inner_join(data, activity_labels), subject, activity, c(3: ncol(data)))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject.
## ---------------------------------------------------------------------------------------------------
tidy_data <- ddply(data, .(subject, activity), function(x) colMeans(x[,3:ncol(x)]))

write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)