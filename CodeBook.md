# Data Set Information:

## The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Attribute Information

## For each record in the dataset it is provided: 
## •Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
## •Triaxial Angular velocity from the gyroscope. 
## •A 561-feature vector with time and frequency domain variables. 
## •Its activity label. 
## •An identifier of the subject who carried out the experiment.

# The script,  run_analysis.R , does the following:
# 1. Merge the training and the test sets to create one data set.
## step 1: load data into R 
## In this section, the following variable are created with respect to the data provided:-
## 1.train.x source from X_train.txt
## 2.train.y source from y_train.txt
## 3.train.subject source from subject_train.txt
## 4.test.x source from X_test.txt
## 5.test.y source from y_test.txt
## 6.test.subject source from subject_test.txt
## step 2: merge train and test data
## In this section, merging are performed for each data set as below:-
## 1.FeaturesData from row binding of train.x and test.x
## 2.ActivityData from row binding of train.y and test.y
## 3.SubjectData from row binding of train.subject and test.subject
## 4.FinalData from column binding of FeaturesData, ActivityData and SubjectData 
## step 3: set name to variable
## In this section, following variables are being named as:-
## ActivityData as Activity
## SubjectData as Subject
#2. Extract only the measurements on the mean and standard deviation for each measurement. 
## step 1: subset name of features by measurement on the mean and standard deviation
## In this section, subsetting is being done and merged data is rename as Data. 
# 3. Uses descriptive activity names to name the activities in the data set
## In this section, the codes written load activity data into R & factorize ActivityData(variable) using descriptive names
## hence, ActivityData is named as Activity
# 4. Appropriately labels the data set with descriptive variable names.
## In this section, codes is defining descriptive names for all variables
## 1.'Acc' as "Acceleration" 
## 2.'GyroJerk' as "AngularAcceleration" 
## 3. 'Gyro' as "AngularSpeed"
## 4. 'Mag' as "Magnitude"
## 5. '^t' as "TimeDomain."
## 6. '^f' as "FrequencyDomain."
## 7. '\\.mean' as ".Mean"
## 8. '\\.std' as ".StandardDeviation"
## 9. 'Freq\\.' as "Frequency." 
## 10. 'Freq$' as "Frequency" 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## In this section, independent data (TidyData) is created from the previous data obtained, excluding Activity and Subject.
## A text file named "tidydata.txt" is also created.
