﻿CREATE TABLE [dbo].[Message]
(
	MessageID INT NOT NULL CONSTRAINT PK_Message PRIMARY KEY CONSTRAINT DF_Message_MessageID DEFAULT(NEXT VALUE FOR dbo.MessageID)
	,FromUserID INT NOT NULL CONSTRAINT FK_Message_FromUserID REFERENCES dbo.[User](UserID)
	,ToUserID INT NOT NULL CONSTRAINT FK_Message_ToUserID REFERENCES dbo.[User](UserID)
	,[Subject] NVARCHAR(100) NOT NULL
	,Body NVARCHAR(1000) NOT NULL
	,ReadDateTime DATETIMEOFFSET(2) CONSTRAINT CK_ReadDateTime CHECK (ReadDateTime IS NULL OR ReadDateTime >= CreatedDateTime)
	,CreatedDateTime DATETIMEOFFSET(2) NOT NULL CONSTRAINT DF_Message_CreatedDateTime DEFAULT(SYSDATETIMEOFFSET())
)
GO

