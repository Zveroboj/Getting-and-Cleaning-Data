library(dplyr)

test<-read.table("X_test.txt", sep = "") # read a test dataset
train <- read.table("X_train.txt", sep = "") # read a train dataset
field_names<-read.table("features.txt", sep = " ") # read field names

full_data<-rbind(test,train) #  combine datasets
names(full_data)<-field_names$V2 # assign field names to a combined dataset

sb_train <- read.table("subject_train.txt", sep = " ") # read a list of subjects who performed the activity
sb_test<-read.table("subject_test.txt", sep = " ")# read a list of subjects who performed the activity
subject <- rbind(sb_test,sb_train) # combine subjects from test and train lists


code_test <-read.table("y_test.txt", sep = " ") # read activity codes for testing set
code_train <-read.table("y_train.txt", sep = " ") # read activity codes for training set
code<-rbind(code_test,code_train) # combine activity codes

label <-read.table("activity_labels.txt", sep = " ") # read activity labels
mergeID <- merge(label, code, by.x = "V1", by.y = "V1", all = T) # merge labels and codes


final_set <-cbind(subject,mergeID$V2,full_data) # combine subjects, labels and data

final_set <- final_set[,c(1,2,grep("mean\\(\\)|std\\(\\)", names(final_set))) ] # collect only fields with
                                                                                # the words mean and std


final_set<-rename(final_set, Subject=V1,Activity = `mergeID$V2`) # rename two first fields 

final_table<-tbl_df(final_set)

# create an aggregated table summarizing means by subject and activity
ready_data<-aggregate(final_table[,3:ncol(final_table)],
                      by=list(Subject=final_table$Subject, Activity=final_table$Activity),mean)


#tidy up the names by removing parenthesis and switching to lower case
names(ready_data) <- tolower(gsub("[()]", "", names(ready_data)))
#check out how it looks
head(ready_data[,1:6],3)

#write the table to file
write.table(ready_data,  "tidy.dataset.txt", row.names=F, col.names=T)

