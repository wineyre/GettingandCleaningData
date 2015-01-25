This documents shows how the data is processed to get final result of tidy_data.txt.

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






