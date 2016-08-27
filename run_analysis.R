# 1. Merge the training and the test sets to create one data set.

## step 1: load data into R 
train.x <- read.table("./X_train.txt", header = FALSE)
train.y <- read.table("./y_train.txt", header = FALSE)
train.subject <- read.table("./subject_train.txt", header = FALSE)
test.x <- read.table("./X_test.txt", header = FALSE)
test.y <- read.table("./y_test.txt", header = FALSE)
test.subject <- read.table("./subject_test.txt", header = FALSE)
featureNames <- read.table("./features.txt", header = FALSE)

## step 2: merge train and test data
FeaturesData <- rbind(train.x, test.x)
ActivityData <- rbind(train.y, test.y)
SubjectData <- rbind (train.subject,test.subject)
FinalData <- cbind (FeaturesData,ActivityData,SubjectData)

## step 3: Set name to variable
colnames(ActivityData) <- "Activity"
colnames(SubjectData) <- "Subject"


# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

## step 1: Subset name of features by measurement on the mean and standard deviation

subfeatureNames<-FeaturesData[, grep("-(mean|std)\\(\\)", featureNames[, 2])]
names(subfeatureNames) <- featureNames[grep("-(mean|std)\\(\\)",featureNames[, 2]), 2]
Data <- cbind(subfeatureNames,ActivityData,SubjectData)


# 3. Uses descriptive activity names to name the activities in the data set

## step 1: load activity data into R & factorize ActivityData(variable) using descriptive names

ActivityData[, 1] <- read.table("activity_labels.txt")[ActivityData[, 1], 2]
names(ActivityData) <- "Activity"

# 4. Appropriately labels the data set with descriptive variable names.

## step 1: Defining descriptive names for all variables.
Data <- cbind(subfeatureNames,ActivityData,SubjectData)
names(Data) <- make.names(names(Data))
names(Data) <- gsub('Acc',"Acceleration",names(Data))
names(Data) <- gsub('GyroJerk',"AngularAcceleration",names(Data))
names(Data) <- gsub('Gyro',"AngularSpeed",names(Data))
names(Data) <- gsub('Mag',"Magnitude",names(Data))
names(Data) <- gsub('^t',"TimeDomain.",names(Data))
names(Data) <- gsub('^f',"FrequencyDomain.",names(Data))
names(Data) <- gsub('\\.mean',".Mean",names(Data))
names(Data) <- gsub('\\.std',".StandardDeviation",names(Data))
names(Data) <- gsub('Freq\\.',"Frequency.",names(Data))
names(Data) <- gsub('Freq$',"Frequency",names(Data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr);
TidyData<-aggregate(. ~Subject + Activity, Data, mean)
TidyData<-TidyData[order(TidyData$Subject,TidyData$Activity),]
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)