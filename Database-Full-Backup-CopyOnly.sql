USE Master
go
BACKUP DATABASE [AdventureWorks2019] TO  DISK = N'C:\SQL_Tutorials\Database-Backups\AdventureWorks2019_Full_Copy_04012020.BAK' 
--FORMAT Option will overwrite all existing data
WITH FORMAT, Copy_only,
--Description of the backup file
DESCRIPTION = N'This is a full database backup', 
--Below one will compress the database backup file which will take less storage.
--When your database size is more, then better to use this COMPRESSION option.
COMPRESSION,  
--STATS will show you the percentage completon
STATS = 10
GO
