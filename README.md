# SQL Server Database Administration (SQL DBA)

Course Link: <https://www.udemy.com/course/sql-server-database-administration>

## Notes:

- Install SQServer by command: https://docs.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server-from-the-command-prompt?view=sql-server-ver15

```
C:\SQLMedia\SQLServer2019> setup.exe /Q /IACCEPTSQLSERVERLICENSETERMS /ACTION="install" /PID="AAAAA-BBBBB-CCCCC-DDDDD-EEEEE" /FEATURES=SQL,AS,IS,Tools
/INSTANCENAME=MSSQLSERVER /SQLSVCACCOUNT="MyDomain\MyAccount"
/SQLSVCPASSWORD="************" /SQLSYSADMINACCOUNTS="MyDomain\MyAccount "
/AGTSVCACCOUNT="MyDomain\MyAccount" /AGTSVCPASSWORD="************"
/ASSVCACCOUNT="MyDomain\MyAccount" /ASSVCPASSWORD="************"
/ISSVCAccount="MyDomain\MyAccount" /ISSVCPASSWORD="************"
/ASSYSADMINACCOUNTS="MyDomain\MyAccount"
```

- SQL = Structured Query Language
- It's particularly useful in handling structured data
- Database consist of 3 kind of files: `mdf`, `ndf`, `ldf`
- Data storage unit in SQL Server is page
- Eight contiguous pages known as `Extend`

## Database files:

- `mdf`: it's primary data file. User data and objects are be stored in this file
- `ndf`: it's secondary data file. User data and objects are be stored in this file
- `ldf`: transaction log file that records all transactions and the database modifications that are made by each transaction.

* Note: SQL Server all the data rows are written on pages in `mdf` and `ndf` files. Transaction log file internally devide into a number of virtual log files (VLFs)

## Page

- `Page` is the fundamental unit of data storage in SQLServer
- Each page in size is 8KB = 8192 Bytes

_Page Types:_

    - data
    - index
    - Text/image
    - GAM -> Global Allocation Map
    - SGAM -> Shared Global Allocation Map
    - IAM -> Index Allocation Map
    - PFS -> Page Free Spac
    - DCM -> Differential Changed Map
    - BCM -> Bulk Changed Map

- 1 page = 8KB
- 1 extent = 8 pages
- 1 extent = 8x8 KB = 64KB
- 1MB = 1024KB
- 1024KB / 64KB = 16 -> this means SQL Server databases have 16 extents per megabyte

## Extent

- Extents are the basic unit in which space is managed. An extent is 8 physically contiguous page or 64KB
- 2 types of extents:
  - Uniform - all the 8 pages belong to the same database objects
  - Mixed - can be mixed of 8 different database objects

## System Database

- `master`: records all the system-level information for a SQL Server system. This includes instance-wide metadata such as logon accounts, endpoints, linked servers, and system configuration settings
  ```sql
      select * from sys.sysdatabases
      select * from sys.syslogins
  ```
- `msdb`: is used by SQL Server Agent for scheduling alerts and jobs, and backup operations. For example job history
  ```sql
     select * from sysjobs
     select * from backupset
  ```
- `model`: Is used as a template for all databases created on the instance of SQL Server
- `tempdb`: Is a global resource that is available to all users connected to the instance of SQL Server or connected to SQL Database. Tempdb is used to hold:
- `Resource`: is a read-only database that contains all the system objects that are included with SQL Server. SQL Server systems objects.
  The pgysical file names of the Resource database are: mssqlsystemresource.mdf and mssqlsystemresource.ldf
- `Distribution`: store metadata and history data for all types of replication, and transactions for transactional replication

**Note**: https://sqlbackupandftp.com/blog/sql-server-copy-only-backup

LSN (Log Sequence Number)

## Maintenance Plans

- Allow a DBA to Automate many database Administration tasks
- 3 options to create Maintenance plans: 2 options using GUI & 1 option using T-SQL

### List task can be maintenance:

- Shrinking a database
- Backing up a database
- Performing an operator notification
- Updating DB statistics
- Verify the integrity of a database
- Cleaning up the leftover maintenance files
- Executing a SQL Server Agent Job
- Executing a Transact-SQL statement
- Rebuilding an index
- Reorganizing an index
- Cleanup database histories
