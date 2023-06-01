CREATE TABLE [Crash Date] (
  [Crash_Date_SK] datetime2,
  [CRASH_DATE] datetime NULL,
  [CRASH_TIME] time(7) NULL
)
GO

CREATE TABLE [Dim_date] (
  [Date_Sk] int NOT NULL,
  [collision_dt] datetime NULL,
  [collision_day] date NULL,
  [collision_time] time(7) NULL,
  [collision_hour] int NULL,
  [collision_dayoftheweek] int NULL,
  CONSTRAINT [_copy_1] PRIMARY KEY CLUSTERED ([Date_Sk])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Ped] (
  [PED_LOCATION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PED_ACTION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PED_ROLE] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

CREATE TABLE [Person] (
  [PERSON_ID] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [Person_Injury_SK] varchar(255) NOT NULL,
  [PERSON_TYPE] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PERSON_AGE] int NULL,
  [PERSON_SEX] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PED_LOCATION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PED_ACTION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PED_ROLE] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PED_LOCATION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PED_ACTION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PED_ROLE] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT [_copy_6] PRIMARY KEY CLUSTERED ([PERSON_ID], [Person_Injury_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Person_Injury] (
  [Person_Injury_SK] varchar(255) NOT NULL,
  [EMOTIONAL_STATUS] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [BODILY_INJURY] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [POSITION_IN_VEHICLE] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [SAFETY_EQUIPMENT] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [COMPLAINT] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PRIMARY KEY CLUSTERED ([Person_Injury_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Person_injury] (

)
GO

CREATE TABLE [Property_damage] (
  [PUBLIC_PROPERTY_DAMAGE] varchar(1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [PUBLIC_PROPERTY_DAMAGE_TYPE] varchar(1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [public_property_damage_sk] varchar(255) NOT NULL,
  CONSTRAINT [_copy_8] PRIMARY KEY CLUSTERED ([public_property_damage_sk])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Vehicle] (
  [VEHICLE_ID] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [public_property_damage_sk] varchar(255) NOT NULL,
  [Vehicle_Damage_SK] varchar(255) NOT NULL,
  [STATE_REGISTRATION] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [VEHICLE_TYPE] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [VEHICLE_MAKE] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [VEHICLE_MODEL] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [VEHICLE_YEAR] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [VEHICLE_OCCUPANTS] int NULL,
  [PRE_CRASH] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [POINT_OF_IMPACT] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [TRAVEL_DIRECTION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT [_copy_5] PRIMARY KEY CLUSTERED ([VEHICLE_ID], [public_property_damage_sk], [Vehicle_Damage_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [address] (
  [Location_sk] varchar(255) NOT NULL,
  [borough] varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [zip_code] varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [off_street_name] varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [on_street_name] varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [cross_street_name] varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [latitude] numeric(24,6) NULL,
  [longitude] numeric(24,6) NULL,
  [location] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT [_copy_3] PRIMARY KEY CLUSTERED ([Location_sk])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [contributing_factor] (
  [contributing_factor_sk] varchar(255) NOT NULL,
  [contributing_factor_vehicle_1] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [contributing_factor_vehicle_2] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [contributing_factor_vehicle_3] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [contributing_factor_vehicle_4] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [contributing_factor_vehicle_5] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PRIMARY KEY CLUSTERED ([contributing_factor_sk])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [damage] (
  [Vehicle_Damage_SK] varchar(255) NOT NULL,
  [VEHICLE_DAMAGE] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [VEHICLE_DAMAGE_1] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [VEHICLE_DAMAGE_2] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [VEHICLE_DAMAGE_3] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT [_copy_4] PRIMARY KEY CLUSTERED ([Vehicle_Damage_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [driver] (
  [Driver_SK] varchar(255) NOT NULL,
  [DRIVER_SEX] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [DRIVER_LICENSE_STATUS] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [DRIVER_LICENSE_JURISDICTION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT [_copy_1_copy_1] PRIMARY KEY CLUSTERED ([Driver_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [fct_1] (
  [COLLISION_ID] bigint NOT NULL,
  [Date_SK] datetime2 NOT NULL,
  [Location_sk] varchar(255) NOT NULL,
  [VEHICLE_ID] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [Driver_SK] varchar(255) NOT NULL,
  [PERSON_ID] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [number_of_cyclist_injured] int NULL,
  [number_of_cyclist_killed] int NULL,
  [number_of_motorist_injured] int NULL,
  [number_of_motorist_killed] int NULL,
  [number_of_pedestrians_injured] int NULL,
  [number_of_pedestrians_killed] int NULL,
  [number_of_persons_injured] int NULL,
  [number_of_persons_killed] int NULL,
  [contributing_factor_sk] varchar(255) NOT NULL,
  PRIMARY KEY CLUSTERED ([COLLISION_ID], [Date_SK], [Location_sk], [VEHICLE_ID], [Driver_SK], [PERSON_ID], [contributing_factor_sk])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [stg_nyc_mv_collision_persons] (
  [UNIQUE_ID] bigint  NOT NULL,
  [COLLISION_ID] bigint  NOT NULL,
  [EJECTION] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [EMOTIONAL_STATUS] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [BODILY_INJURY] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [POSITION_IN_VEHICLE] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [SAFETY_EQUIPMENT] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [COMPLAINT] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PED_LOCATION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PED_ACTION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PED_ROLE] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CONTRIBUTING_FACTOR_1] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CONTRIBUTING_FACTOR_2] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  CONSTRAINT [PK__stg_nyc___61C269090A2F3757] PRIMARY KEY CLUSTERED ([UNIQUE_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [stg_nyc_mv_collision_persons] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [stg_nyc_mv_collision_vehicles] (
  [UNIQUE_ID] bigint  NOT NULL,
  [COLLISION_ID] bigint  NOT NULL,
  [TRAVEL_DIRECTION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [VEHICLE_OCCUPANTS] int  NULL,
  [DRIVER_SEX] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [DRIVER_LICENSE_STATUS] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [DRIVER_LICENSE_JURISDICTION] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PRE_CRASH] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [POINT_OF_IMPACT] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [VEHICLE_DAMAGE] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [VEHICLE_DAMAGE_1] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [VEHICLE_DAMAGE_2] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [VEHICLE_DAMAGE_3] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PUBLIC_PROPERTY_DAMAGE] varchar(1024) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [PUBLIC_PROPERTY_DAMAGE_TYPE] varchar(1024) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CONTRIBUTING_FACTOR_1] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [CONTRIBUTING_FACTOR_2] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [DI_PID] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [DI_Create_Date] datetime DEFAULT getdate() NOT NULL,
  CONSTRAINT [PK__stg_nyc___61C269092D77BC03] PRIMARY KEY CLUSTERED ([UNIQUE_ID], [COLLISION_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [stg_nyc_mv_collision_vehicles] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [stg_nyc_mv_collisions_BigQuery] (
  [COLLISION_ID] bigint  NOT NULL,
  [contributing_factor_vehicle_1] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [contributing_factor_vehicle_2] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [contributing_factor_vehicle_3] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [contributing_factor_vehicle_4] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [contributing_factor_vehicle_5] varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [vehicle_type_code1] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [vehicle_type_code2] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [vehicle_type_code_3] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [vehicle_type_code_4] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [vehicle_type_code_5] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  CONSTRAINT [PK__stg_nyc___EC41E14AA55C4AB5] PRIMARY KEY CLUSTERED ([COLLISION_ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [stg_nyc_mv_collisions_BigQuery] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [table_2] (

)
GO

CREATE TABLE [table_3] (

)
GO

ALTER TABLE [Person_Injury] ADD  REFERENCES [Person] ([Person_Injury_SK])
GO
ALTER TABLE [Vehicle] ADD  REFERENCES [damage] ([Vehicle_Damage_SK])
GO
ALTER TABLE [Vehicle] ADD  REFERENCES [Property_damage] ([public_property_damage_sk])
GO
ALTER TABLE [contributing_factor] ADD  REFERENCES [fct_1] ([contributing_factor_sk])
GO
ALTER TABLE [driver] ADD  REFERENCES [fct_1] ([Driver_SK])
GO
ALTER TABLE [fct_1] ADD  REFERENCES [Dim_date] ([Date_Sk])
GO
ALTER TABLE [fct_1] ADD  REFERENCES [address] ([Location_sk])
GO
ALTER TABLE [fct_1] ADD  REFERENCES [Vehicle] ([VEHICLE_ID])
GO
ALTER TABLE [fct_1] ADD  REFERENCES [Person] ([PERSON_ID])
GO

