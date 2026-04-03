-- FULL BACKUP
DECLARE @FullFile NVARCHAR(200)

SET @FullFile = 'F:\ShopSphere_OLTP_V2\Full\Full_' 
+ REPLACE(CONVERT(VARCHAR, GETDATE(), 120), ':', '-') + '.bak'

BACKUP DATABASE ShopSphere_OLTP_V2
TO DISK = @FullFile WITH FORMAT;


-- DIFFERENTIAL BACKUP
DECLARE @DiffFile NVARCHAR(200)

SET @DiffFile = 'F:\ShopSphere_OLTP_V2\Differential\Diff_' 
+ REPLACE(CONVERT(VARCHAR, GETDATE(), 120), ':', '-') + '.bak'

BACKUP DATABASE ShopSphere_OLTP_V2
TO DISK = @DiffFile WITH DIFFERENTIAL;


-- LOG BACKUP
DECLARE @LogFile NVARCHAR(200)

SET @LogFile = 'F:\ShopSphere_OLTP_V2\Log\Log_' 
+ REPLACE(CONVERT(VARCHAR, GETDATE(), 120), ':', '-') + '.trn'

BACKUP LOG ShopSphere_OLTP_V2
TO DISK = @LogFile;
