Getting and Cleaning Data Course Project

===================================================================================================================
This project includes following folders/files:
- data: contains a folder and a file
	- UCI HAR Dataset: unzip of UCI_HAR_Dataset.zip. For data directory of this dataset, please refer to "README.txt" inside this folder. 
	- "UCI_HAR_Dataset.zip": original dataset downloaded from web.  A full description is available at the site 	where the data was obtained: 
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
- "CodeBook.md": includes information about all the variables and summaries, along with units
- "run_analysis.R": R script with comment to run with data in the data folder to get the "tidy_data.txt"
- "tidy_data.txt": the output file of the project, a processed tidy data set.

====================================================================================================================
Data directory for "tidy_data.txt"
- subject: 30 volunteers where the original dataset was collected from
- activity: 6 activities has been included
	- WALKING
	- WALKING_UPSTAIRS
	- WALKING_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING
- features measurements: all measurements are calculated based on the average of each subject and acitivity combination of the original dataset.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag

	The set of variables that were estimated from these signals are: 

	mean(): Mean value
	std(): Standard deviation


===================================================================================================================
This section shows how the data is processed to get final result of tidy_data.txt.

Note: The run_Analysis does not follow the steps in the order as the project statement. The actual data is processed in the following order to optimize the efficiency.

1. Download the original data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Load the all data into R from data/UCI HAR Dataset folder.
	- activity_labels.txt
	- features.txt
	- test folder
		- subject_text.txt
		- X_test.txt
		- Y_test.txt
	- train folder
		- subject_train.txt
		- X_train.txt
		- Y_train.txt

3. Appropriately labels the data set with descriptive variable names.

4. Extracts only the measurements on the mean and standard deviation for each measurement.

5. Merges the training and the test sets to create one data set.

6. Uses descriptive activity names to name the activities in the data set

7. From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject.