!db2set DB2_INLIST_TO_NLJN=YES@
!db2set DB2_EVALUNCOMMITTED=YES@

--------------------------------------------------------
-- Generate CREATE DATABASE command
--------------------------------------------------------

CREATE DATABASE XCC
	AUTOMATIC STORAGE YES
	USING CODESET UTF-8 TERRITORY EN
	COLLATE USING IDENTITY
	PAGESIZE 16384
	DFT_EXTENT_SZ 32

	CATALOG TABLESPACE MANAGED BY AUTOMATIC STORAGE 
	EXTENTSIZE 4
    AUTORESIZE YES 
    INITIALSIZE 32 M 
    MAXSIZE NONE 
	TEMPORARY TABLESPACE MANAGED BY AUTOMATIC STORAGE 
    EXTENTSIZE 32
    
    FILE SYSTEM CACHING 
	USER TABLESPACE MANAGED BY AUTOMATIC STORAGE 
    EXTENTSIZE 32
    AUTORESIZE YES 
    INITIALSIZE 32 M 
    MAXSIZE NONE 

@

CONNECT TO XCC@

CREATE SCHEMA "XCC"@

CREATE TABLE "XCC"."CLIENT"  (
        "ID" BIGINT NOT NULL , 
        "APPID" VARCHAR(254 OCTETS) , 
        "DOMAIN" VARCHAR(254 OCTETS) , 
        "ENDPOINTURL" VARCHAR(254 OCTETS) , 
        "APPKEY" VARCHAR(254 OCTETS) , 
        "ORGID" VARCHAR(254 OCTETS) NOT NULL , 
        "SECRET" VARCHAR(1000 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."CLIENT"

ALTER TABLE "XCC"."CLIENT" 
	ADD PRIMARY KEY
		("ID")@
-- DDL Statements for Unique Constraints on Table "XCC"."CLIENT"
ALTER TABLE "XCC"."CLIENT" 
	ADD CONSTRAINT "U_CLIENT_ORGID" UNIQUE
		("ORGID")@

------------------------------------------------
-- DDL Statements for Table "XCC"."CONTAINER"
------------------------------------------------

CREATE TABLE "XCC"."CONTAINER"  (
        "CONTAINER_ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) NOT NULL , 
        "ANONYM" SMALLINT , 
        "COMMACCESSID" VARCHAR(254 OCTETS) , 
        "COMMUNITY" SMALLINT , 
        "FLYOUT" SMALLINT , 
        "LASTMODIFIED" VARCHAR(254 OCTETS) , 
        "MODIFIER" VARCHAR(254 OCTETS) , 
        "CONTAINERNAME" VARCHAR(254 OCTETS) NOT NULL , 
        "READRESTRICTED" SMALLINT , 
        "SHOWACTIVITYSTREAM" SMALLINT , 
        "SHOWRIGHTCOL" SMALLINT , 
        "TEMPLATE" SMALLINT , 
        "TEMPLATECONTAINERID" BIGINT , 
        "TITLE" VARCHAR(254 OCTETS) , 
        "CSSFILE_FS_PK" BIGINT , 
        "SELECTEDTEMPLATE_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."CONTAINER"

ALTER TABLE "XCC"."CONTAINER" 
	ADD PRIMARY KEY
		("CONTAINER_ID")@
-- DDL Statements for Unique Constraints on Table "XCC"."CONTAINER"
ALTER TABLE "XCC"."CONTAINER" 
	ADD CONSTRAINT "U_CONTINR_CONTAINE" UNIQUE
		("CONTAINERNAME",
        "ORGID")@
-- DDL Statements for Indexes on Table "XCC"."CONTAINER"

CREATE INDEX "XCC"."I_CONTINR_CSSFILE" ON "XCC"."CONTAINER" 
		("CSSFILE_FS_PK" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."CONTAINER"

CREATE INDEX "XCC"."I_CONTINR_SELECTEDTEMPLATE" ON "XCC"."CONTAINER" 
		("SELECTEDTEMPLATE_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."CONTAINER"

CREATE INDEX "XCC"."CONTAINERNAME_CONTAINER" ON "XCC"."CONTAINER" 
		("CONTAINERNAME" ASC,
        "CONTAINER_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."CONTAINER_WIDGET"
------------------------------------------------

CREATE TABLE "XCC"."CONTAINER_WIDGET"  (
        "CONTAINER_CONTAINER_ID" BIGINT , 
        "WIDGET_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."CONTAINER_WIDGET"

CREATE INDEX "XCC"."I_CNTNDGT_CONTAINER_CONTAINER_ID" ON "XCC"."CONTAINER_WIDGET" 
		("CONTAINER_CONTAINER_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."CONTAINER_WIDGET"

CREATE INDEX "XCC"."I_CNTNDGT_ELEMENT" ON "XCC"."CONTAINER_WIDGET" 
		("WIDGET_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."CONTAINER_XCCPROPERTY"
------------------------------------------------

CREATE TABLE "XCC"."CONTAINER_XCCPROPERTY"  (
        "CONTAINER_CONTAINER_ID" BIGINT , 
        "XCCPROPERTY_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."CONTAINER_XCCPROPERTY"

CREATE INDEX "XCC"."I_CNTNRTY_CONTAINER_CONTAINER_ID" ON "XCC"."CONTAINER_XCCPROPERTY" 
		("CONTAINER_CONTAINER_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."CONTAINER_XCCPROPERTY"

CREATE INDEX "XCC"."I_CNTNRTY_ELEMENT" ON "XCC"."CONTAINER_XCCPROPERTY" 
		("XCCPROPERTY_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."CONTAINER_XCCUSER"
------------------------------------------------

CREATE TABLE "XCC"."CONTAINER_XCCUSER"  (
        "CONTAINER_CONTAINER_ID" BIGINT , 
        "USER_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."CONTAINER_XCCUSER"

CREATE INDEX "XCC"."I_CNTNCSR_CONTAINER_CONTAINER_ID" ON "XCC"."CONTAINER_XCCUSER" 
		("CONTAINER_CONTAINER_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."CONTAINER_XCCUSER"

CREATE INDEX "XCC"."I_CNTNCSR_ELEMENT" ON "XCC"."CONTAINER_XCCUSER" 
		("USER_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."CONTENTSTREAM"
------------------------------------------------

CREATE TABLE "XCC"."CONTENTSTREAM"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "ATTRIBUTENAME" VARCHAR(254 OCTETS) , 
        "INDEX" INTEGER , 
        "ITEMCOUNT" BIGINT , 
        "NAME" VARCHAR(3000 OCTETS) , 
        "PAGESIZE" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."CONTENTSTREAM"

ALTER TABLE "XCC"."CONTENTSTREAM" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."CONTENTSTREAM_ENTRY"
------------------------------------------------

CREATE TABLE "XCC"."CONTENTSTREAM_ENTRY"  (
        "CONTENTSTREAM_ID" BIGINT , 
        "ENTRY_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."CONTENTSTREAM_ENTRY"

CREATE INDEX "XCC"."I_CNTNTRY_CONTENTSTREAM_ID" ON "XCC"."CONTENTSTREAM_ENTRY" 
		("CONTENTSTREAM_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."CONTENTSTREAM_ENTRY"

CREATE INDEX "XCC"."I_CNTNTRY_ELEMENT" ON "XCC"."CONTENTSTREAM_ENTRY" 
		("ENTRY_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."ENDPOINT"
------------------------------------------------

CREATE TABLE "XCC"."ENDPOINT"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "APPNAME" VARCHAR(254 OCTETS) , 
        "CLIENTID" VARCHAR(254 OCTETS) , 
        "CLIENTSECRET" VARCHAR(1000 OCTETS) , 
        "NAME" VARCHAR(254 OCTETS) , 
        "PASSWORD" VARCHAR(254 OCTETS) , 
        "USERNAME" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."ENDPOINT"

ALTER TABLE "XCC"."ENDPOINT" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."ENTRY"
------------------------------------------------

CREATE TABLE "XCC"."ENTRY"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "ATTRIBUTENAME" VARCHAR(254 OCTETS) , 
        "COMMID" VARCHAR(254 OCTETS) , 
        "ENTRYCONDITION" VARCHAR(254 OCTETS) , 
        "INDEX" INTEGER , 
        "SHOWALLPOSTS" SMALLINT , 
        "SHOWFOLDER" SMALLINT , 
        "SRCCONTAINERID" VARCHAR(500 OCTETS) , 
        "SRCNAME" VARCHAR(500 OCTETS) , 
        "TYPE" VARCHAR(254 OCTETS) , 
        "VALUE" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."ENTRY"

ALTER TABLE "XCC"."ENTRY" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."ENTRY_ENTRY"
------------------------------------------------

CREATE TABLE "XCC"."ENTRY_ENTRY"  (
        "ENTRY_ID" BIGINT , 
        "CONDITIONALENTRIES_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."ENTRY_ENTRY"

CREATE INDEX "XCC"."I_NTRYTRY_ELEMENT" ON "XCC"."ENTRY_ENTRY" 
		("CONDITIONALENTRIES_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."ENTRY_ENTRY"

CREATE INDEX "XCC"."I_NTRYTRY_ENTRY_ID" ON "XCC"."ENTRY_ENTRY" 
		("ENTRY_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."ENTRY_ITEM"
------------------------------------------------

CREATE TABLE "XCC"."ENTRY_ITEM"  (
        "ENTRY_ID" BIGINT , 
        "ITEMS_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."ENTRY_ITEM"

CREATE INDEX "XCC"."I_NTRY_TM_ELEMENT" ON "XCC"."ENTRY_ITEM" 
		("ITEMS_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."ENTRY_ITEM"

CREATE INDEX "XCC"."I_NTRY_TM_ENTRY_ID" ON "XCC"."ENTRY_ITEM" 
		("ENTRY_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."INTEGRATION"
------------------------------------------------

CREATE TABLE "XCC"."INTEGRATION"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "NAME" VARCHAR(254 OCTETS) , 
        "URL" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."INTEGRATION"

ALTER TABLE "XCC"."INTEGRATION" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."INTEGRATION_SERVICES"
------------------------------------------------

CREATE TABLE "XCC"."INTEGRATION_SERVICES"  (
        "INTEGRATION_ID" BIGINT , 
        "ELEMENT" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."INTEGRATION_SERVICES"

CREATE INDEX "XCC"."I_NTGRVCS_INTEGRATION_ID" ON "XCC"."INTEGRATION_SERVICES" 
		("INTEGRATION_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."ITEM"
------------------------------------------------

CREATE TABLE "XCC"."ITEM"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "INDEX" INTEGER , 
        "POSITION" VARCHAR(254 OCTETS) , 
        "SRCHTML" VARCHAR(2048 OCTETS) , 
        "SRCID" VARCHAR(254 OCTETS) , 
        "SRCNAME" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."ITEM"

ALTER TABLE "XCC"."ITEM" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."OPENJPA_SEQUENCE_TABLE"
------------------------------------------------

CREATE TABLE "XCC"."OPENJPA_SEQUENCE_TABLE"  (
        "ID" SMALLINT NOT NULL , 
        "SEQUENCE_VALUE" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."OPENJPA_SEQUENCE_TABLE"

ALTER TABLE "XCC"."OPENJPA_SEQUENCE_TABLE" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."TEMPLATE"
------------------------------------------------

CREATE TABLE "XCC"."TEMPLATE"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "TEMPLATENAME" VARCHAR(254 OCTETS) NOT NULL , 
        "TEMPLATEID" INTEGER , 
        "TITLE" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."TEMPLATE"

ALTER TABLE "XCC"."TEMPLATE" 
	ADD PRIMARY KEY
		("ID")@
-- DDL Statements for Unique Constraints on Table "XCC"."TEMPLATE"
ALTER TABLE "XCC"."TEMPLATE" 
	ADD CONSTRAINT "U_TEMPLTE_TEMPLATE" UNIQUE
		("TEMPLATENAME")@

------------------------------------------------
-- DDL Statements for Table "XCC"."WEBTOKENSTORAGE"
------------------------------------------------

CREATE TABLE "XCC"."WEBTOKENSTORAGE"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "WEBTOKENCONTENT" BLOB(1048576) LOGGED NOT COMPACT , 
        "WEBTOKENKEY" VARCHAR(254 OCTETS) , 
        "LENGTH" BIGINT , 
        "WEBTOKENOWNER" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."WEBTOKENSTORAGE"

ALTER TABLE "XCC"."WEBTOKENSTORAGE" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."WIDGET"
------------------------------------------------

CREATE TABLE "XCC"."WIDGET"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "COMPONENTTYPE" VARCHAR(254 OCTETS) , 
        "CONTENTTYPE" VARCHAR(254 OCTETS) , 
        "DEFINITIONURL" VARCHAR(254 OCTETS) , 
        "HEIGHT" VARCHAR(254 OCTETS) , 
        "LAYOUTTYPE" VARCHAR(254 OCTETS) , 
        "LOCKED" SMALLINT , 
        "NAME" VARCHAR(254 OCTETS) , 
        "PAGE" VARCHAR(254 OCTETS) , 
        "PERSONALIZED" SMALLINT , 
        "POSITION" INTEGER , 
        "SHOWLIKESANDCOMMENTS" SMALLINT , 
        "TITLE" VARCHAR(254 OCTETS) , 
        "WIDTH" VARCHAR(254 OCTETS) , 
        "XCCINDEX" INTEGER )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."WIDGET"

ALTER TABLE "XCC"."WIDGET" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."WIDGETOAUTH2REGISTRATION"
------------------------------------------------

CREATE TABLE "XCC"."WIDGETOAUTH2REGISTRATION"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "APPNAME" VARCHAR(254 OCTETS) , 
        "AUTHORIZATIONENDPOINT" VARCHAR(512 OCTETS) , 
        "CLIENTID" VARCHAR(254 OCTETS) , 
        "CLIENTSECRET" VARCHAR(1024 OCTETS) , 
        "TOKENENDPOINT" VARCHAR(512 OCTETS) , 
        "WIDGETID" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."WIDGETOAUTH2REGISTRATION"

ALTER TABLE "XCC"."WIDGETOAUTH2REGISTRATION" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."WIDGET_CONTENTSTREAM"
------------------------------------------------

CREATE TABLE "XCC"."WIDGET_CONTENTSTREAM"  (
        "WIDGET_ID" BIGINT , 
        "CONTENTSTREAM_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."WIDGET_CONTENTSTREAM"

CREATE INDEX "XCC"."I_WDGTTRM_ELEMENT" ON "XCC"."WIDGET_CONTENTSTREAM" 
		("CONTENTSTREAM_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."WIDGET_CONTENTSTREAM"

CREATE INDEX "XCC"."I_WDGTTRM_WIDGET_ID" ON "XCC"."WIDGET_CONTENTSTREAM" 
		("WIDGET_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."WIDGET_XCCFILESTORAGE"
------------------------------------------------

CREATE TABLE "XCC"."WIDGET_XCCFILESTORAGE"  (
        "WIDGET_ID" BIGINT , 
        "FILE_FS_PK" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."WIDGET_XCCFILESTORAGE"

CREATE INDEX "XCC"."I_WDGTTRG_ELEMENT" ON "XCC"."WIDGET_XCCFILESTORAGE" 
		("FILE_FS_PK" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."WIDGET_XCCFILESTORAGE"

CREATE INDEX "XCC"."I_WDGTTRG_WIDGET_ID" ON "XCC"."WIDGET_XCCFILESTORAGE" 
		("WIDGET_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."WIDGET_XCCPROPERTY"
------------------------------------------------

CREATE TABLE "XCC"."WIDGET_XCCPROPERTY"  (
        "WIDGET_ID" BIGINT , 
        "XCCPROPERTY_ID" BIGINT )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Indexes on Table "XCC"."WIDGET_XCCPROPERTY"

CREATE INDEX "XCC"."I_WDGTRTY_ELEMENT" ON "XCC"."WIDGET_XCCPROPERTY" 
		("XCCPROPERTY_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@

-- DDL Statements for Indexes on Table "XCC"."WIDGET_XCCPROPERTY"

CREATE INDEX "XCC"."I_WDGTRTY_WIDGET_ID" ON "XCC"."WIDGET_XCCPROPERTY" 
		("WIDGET_ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."XCCFILESTORAGE"
------------------------------------------------

CREATE TABLE "XCC"."XCCFILESTORAGE"  (
        "FS_PK" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "BACKUPINDEX" INTEGER , 
        "FILE_CONTENT" BLOB(1048576) LOGGED NOT COMPACT , 
        "CREATED" BIGINT , 
        "CREATOR" VARCHAR(254 OCTETS) , 
        "ISBACKUP" SMALLINT , 
        "LASTMODIFIED" BIGINT , 
        "LASTMODIFIER" VARCHAR(254 OCTETS) , 
        "LENGTH" BIGINT , 
        "FILE_NAME" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."XCCFILESTORAGE"

ALTER TABLE "XCC"."XCCFILESTORAGE" 
	ADD PRIMARY KEY
		("FS_PK")@
------------------------------------------------
-- DDL Statements for Table "XCC"."XCCPROPERTY"
------------------------------------------------

CREATE TABLE "XCC"."XCCPROPERTY"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "PROPKEY" VARCHAR(254 OCTETS) , 
        "PROPTAG" VARCHAR(254 OCTETS) , 
        "PROPTYPE" VARCHAR(254 OCTETS) , 
        "PROPVALUE" VARCHAR(2000 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."XCCPROPERTY"

ALTER TABLE "XCC"."XCCPROPERTY" 
	ADD PRIMARY KEY
		("ID")@

-- DDL Statements for Indexes on Table "XCC"."XCCPROPERTY"

CREATE INDEX "XCC"."XCCPROP_KEY" ON "XCC"."XCCPROPERTY" 
		("PROPKEY" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS@
------------------------------------------------
-- DDL Statements for Table "XCC"."XCCUSER"
------------------------------------------------

CREATE TABLE "XCC"."XCCUSER"  (
        "ID" BIGINT NOT NULL , 
        "ORGID" VARCHAR(254 OCTETS) , 
        "EMAIL" VARCHAR(254 OCTETS) , 
        "SHORTNAME" VARCHAR(254 OCTETS) , 
        "USERROLE" INTEGER , 
        "UUID" VARCHAR(254 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."XCCUSER"

ALTER TABLE "XCC"."XCCUSER" 
	ADD PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."DATABASECHANGELOGLOCK"
------------------------------------------------

CREATE TABLE "XCC"."DATABASECHANGELOGLOCK"  (
        "ID" INTEGER NOT NULL , 
        "LOCKED" SMALLINT NOT NULL , 
        "LOCKGRANTED" TIMESTAMP , 
        "LOCKEDBY" VARCHAR(255 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
-- DDL Statements for Primary Key on Table "XCC"."DATABASECHANGELOGLOCK"

ALTER TABLE "XCC"."DATABASECHANGELOGLOCK" 
	ADD CONSTRAINT "PK_DBCHGLOGLOCK" PRIMARY KEY
		("ID")@
------------------------------------------------
-- DDL Statements for Table "XCC"."DATABASECHANGELOG"
------------------------------------------------

CREATE TABLE "XCC"."DATABASECHANGELOG"  (
        "ID" VARCHAR(255 OCTETS) NOT NULL , 
        "AUTHOR" VARCHAR(255 OCTETS) NOT NULL , 
        "FILENAME" VARCHAR(255 OCTETS) NOT NULL , 
        "DATEEXECUTED" TIMESTAMP NOT NULL , 
        "ORDEREXECUTED" INTEGER NOT NULL , 
        "EXECTYPE" VARCHAR(10 OCTETS) NOT NULL , 
        "MD5SUM" VARCHAR(35 OCTETS) , 
        "DESCRIPTION" VARCHAR(255 OCTETS) , 
        "COMMENTS" VARCHAR(255 OCTETS) , 
        "TAG" VARCHAR(255 OCTETS) , 
        "LIQUIBASE" VARCHAR(20 OCTETS) , 
        "CONTEXTS" VARCHAR(255 OCTETS) , 
        "LABELS" VARCHAR(255 OCTETS) , 
        "DEPLOYMENT_ID" VARCHAR(10 OCTETS) )   
        IN "USERSPACE1"  
        ORGANIZE BY ROW@
----------------------------------------
-- Authorization Statements on Database 
----------------------------------------
COMMIT WORK@

CONNECT RESET@

TERMINATE@