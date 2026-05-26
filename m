Return-Path: <linux-arm-msm+bounces-109891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9rO0E/PVFWrRcwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:18:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6757F5DA827
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D371C300E73E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75739402435;
	Tue, 26 May 2026 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rhg8YZC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B01400E19
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814717; cv=fail; b=oGNHSMh258P/JltFR8RAzrOGhON3o3tdYE6IcznAtnZAGuSWfqthwMSnQHrnc0QKNUNb7MCqlqtg/IKladnANMjCz1TP9qQ7MAjiHeq9FZ1uuuBO1gMBV/cXciRK88/W+5J6+lE9h/87rPU+SJTBXNEXX/SHu5I9AE9a8CHZLMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814717; c=relaxed/simple;
	bh=6egTh8+x04SYTNaGp8D5KHz2HY/zC1cYWCx7W7Kdqw4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ipLcpneNC+RJOU5tAhqjtbMqOgOQ2ung3uxtRzQ5R+2vdy9rFcNldQ/lPBi8B+jMzbJ3xhILen9Lm50XIxh/ETK+i5R9ytvuq19laZO2r/rpYyyrT5xUqChOYn9Tq20NfPIAIk0E4nxaDAPJ/QqmlrMgaY74OJP/dTbBZPC/5AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rhg8YZC+; arc=fail smtp.client-ip=52.101.43.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+LR99m7uW25TOlMLx+9W7xYRjK2MtrDigOK3ht10ZqOz9zbEU8SG/5sbydLyuhLkTHSwMoSSfzs3kjUTRZe4K2ptixPfoCZSxBijMiVJ3ZiUiF2F5/qqPEJIiD/UXfRcFsu3Yc+FFPRq4eBCetu03YIYCVLCs79Cmrd+88zr/kY0mALX9M8T0UfWbuCG4djG1cDxlEd1si7a2L5eJiALsH21oM7pg60GPCiECFT6OvT/1qlmg3b+PZImZHIMHobRZlWkMbeCkDws37hZ6avyUW65fa68QM+3RpV60kdOaglTh7o8a8SGutJlJ6djaJffYIF5g5uGxpDTHPGif5myw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jin9ZQEW5ieNr+p+7yj4fk5UYi8kamWaStvk8pYotc=;
 b=DUMqX1oE9SqaOpRbb96e6LFzcvjcI44PSghF3NC5+7qVyFmAqmwWhVg2RvtDYe7dirwXnWOzo+xEdfK6dpWkvRlKsmvYB1nUo0fqSUgLOhAFdZ+E6oOIJ6EBQ2ST+lG5oCwPUA35TT7Z6VNMmBUxd/Ju1IjaFXKfI1BVZ4cqm7BHc35z6FvVrL46noTShoceeThdYI6gFqQMqUmDZrA0dYrA0OydK6vlEPoI24xCZsROniMXs7SY+sSRRW2j1AuQOsj4mB+dTZPS6+iGeTtmVRQ+XqdLMQ3fNVpcafLF+MHctTBEv2OJvl3OIQKPJl9H34h0reVthqbDo6TBZzIn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jin9ZQEW5ieNr+p+7yj4fk5UYi8kamWaStvk8pYotc=;
 b=Rhg8YZC+b139tKwk/uMR2gcRualUpGk6V+m+UjrbXzn7qVmKxr5v9dJ2UT92d42Npo/1uoZkN40XzMsQIRHAh6hePouHmihEAJXmUZtlfBrVlXX97fvIaP/LUzCe13OQCtxQOKBOJ+Ifl0hJ0NTKyEhvN/piYbf7IF47i4BFlHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 16:58:31 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 16:58:31 +0000
Message-ID: <c90c7607-aa9b-4353-b900-1e8e9f2bfbda@amd.com>
Date: Tue, 26 May 2026 10:58:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/amd/display: use plane color_mgmt_changed to
 track colorop changes
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Simon Ser <contact@emersion.fr>, Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260525100524.304263-1-mwen@igalia.com>
 <20260525100524.304263-5-mwen@igalia.com>
 <85aad1b1-3ac8-464a-ab5a-69c92a491925@amd.com>
 <9d30ef2d-cea8-44dc-9669-492ddaa02108@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <9d30ef2d-cea8-44dc-9669-492ddaa02108@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:303:2a::14) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: effca768-db33-427c-e422-08debb4803ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	JIUlunbgtUqGT9Z1NksZicqtDJbJ6+7nEgj4skd6ffBDm69OEhWfhCubNb8WOaX8iXMo4WOyhUJFuIUsH9sQZVYu+UEkUMhr5dc2IrcW3wpm6wjATPzjiGMAnXNYrSgtBMJhrWbPZvD/jXqZnoH0EuHpNaXFuGUMzkB6xRqAlQ2iNtVo7zGvjVnM3PVryiftCDYlYQke3vbJbF+RMtsEdopUptHPmG/Eckpdr7v8NPnKcnMYvcfGFsc7PuZPW5j+JbmKF6ulwRpCezKsUdsDobyv5x3W4f1qnFEbO0siMajvCMJBL/qYtf8y3IIGGTksg7epnBYga/OxLdPW0YXNSU8F/ff4U+fKcBLfHT2Me7q5coZVkHz+Xbw8FwjDKjv8tIA+Ik4IRRGiejMDJRPJpfEW4AjOOiYY6yFsjT/MCXpBiQ9g8SDdORbn3I5v3ePDa/uCLju/NFv/hCqB439MbtUbU1pUJzInf9ANWsW+YQXaZO91lM1SduD5jVUyUaEPmXlTaKZrGDM656CA7Ux8ggUK2i6HjQwMP097tOHgrE6m6vXK23DMElUxAdLJr+z5ud8QplMV5njaBP12jcwJWJZzD5FRVO7MO1PwRiMl3B9AR2x0CPKFeNbLmTyScZnM7dBwyQK5vgu9jPx2mV3lStpaNVNCmWjBvy+OP5jZbWMCDGvmWKgk6WEVyuTavXqtUOAVFITM/Jzj4J49pF5fuwjZJt06tY8l2cJ0Tgl1F10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8476.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXgzNnBRdTliNmRPZThVZWhJSDNVT3dGOXBLd2RCUTFLd2dxeGx3K1BnMDhZ?=
 =?utf-8?B?WSs0OWZSS01uMW4xdGdySmx2Wlp3blRjTWkyOEIxUkh5YVhDNVdNcUFJZWt4?=
 =?utf-8?B?YWw1RzY3ejV2cmFuT1FlUDBnZ1FaZFMxTTRWSHhZcXBUc3ZtczNpVm5lSXVi?=
 =?utf-8?B?WDdFaEVDOTQxcEZhTnpvdkpaOTlJQ1ZPamVuVWd4UjNTblJSWTh6a3RTMDlr?=
 =?utf-8?B?T0N1L3BBVndseUdKYWhtdFdZME9wa0NuWEtRd3JBdk9PSlN1aTd2VldhN1d3?=
 =?utf-8?B?WGNndWN5a2pkMmo4SzZralIzRlVncDNpbG53Vnl1UkE5WmtJQ0J1YXo1bC9K?=
 =?utf-8?B?aVREWm1vWjc2cDFOR2QvY2orUFFMMHR1WUtEK0pnRmJvemdRalp6cWl0NThq?=
 =?utf-8?B?Sy9vb09kcDBQT2dYTkRCVjBuL3FzSmdFUzluY3FtQ24rTTk2VTdIaHVMOFhr?=
 =?utf-8?B?RXlWOE5kTjA3MGROWHFkZlRTWlRXaUdkTFF5OXJBZ0Q1WVA2UUJJTEJsTnpa?=
 =?utf-8?B?ZndhM0UrNzN3bXRPSXBldnpFZ01Kem54UlFKNG1SMDEvTHZyYVBJc09Sb0V5?=
 =?utf-8?B?bVRKZFgrSVE4c0RMRlBnOWx2aUtXS0VBdVdxdnY0bCtvYlYvLzJKS2JPYUhF?=
 =?utf-8?B?bldmTXY0Zi9uUGpRb05MT2toSUdJeFduTDZlcWl4dEVZcE9BajVZRFp3U2lY?=
 =?utf-8?B?OGhxaDFyeUJ6c1RuMHdFMmNFbXhsa3l6UVBqb2lMYkdzTEtJdlptVnZ0d2gv?=
 =?utf-8?B?b3RUam1ENXpleDd6cmt3ak1kU0RHY2RnOVFnYk1tdXNtOTFRdEJSK1VNaFg1?=
 =?utf-8?B?RkplRE9DVkgxYUU5VHNYYVYrdXg5aE9zcXBGbGoyNWRCdy9UdXRDcFNqQnFt?=
 =?utf-8?B?aEtwTjI3alFhQnFpQUhlYXZWZGdvMDRKY0dHUWRyL3Nhb25CUnI0dDBGcHNj?=
 =?utf-8?B?Zi9RdXFONnJVRS9jREJ4NXRtZW9sMVdrSURRVTFqY1drdVpZNFRPSHhxblZF?=
 =?utf-8?B?RisyVjVkRzRxd2NHSWZMWDBqdVU2Vjk4b3h6dGdUbTZPNGhKVVZFeHo3OEdq?=
 =?utf-8?B?MWhHTHEwWUFSOVEvcXlOMkZYNWJCdjJPL05hVkZ3WFkvMC9panFoYXNLOTBs?=
 =?utf-8?B?TlRNcDl3Um5GZ3hOMHd6VW96aGQ0TnFCU3hDUitFYWFiL2NjWHZJZmpFSGM3?=
 =?utf-8?B?dG1QazhlMWJWdFhLcFdSVzZPYXZnWDlMblViaUNUemF5bmtBRWVlcW55a1RU?=
 =?utf-8?B?VlB5QkFpczgvSzg1eGY5bGRraXZrbEE3MkdubDYzZVoxZWd2am1udTdXbTBj?=
 =?utf-8?B?WDY3YTQybnZuaXdueFQ2TXd4Ri9KVDVyaHFncnVyMzdtV3RCVVRlQ0xTaHZD?=
 =?utf-8?B?N0cwQ3FQTCt5NXpDM3VVTTNnNW1xNUhSUFNVLytFVXl0WUN0M3Bvb2dKRHI0?=
 =?utf-8?B?ZjJlODBwRm95bFkwZm41elZPVWx0S1EweUhVQWV5eXBnZVRZUkU0Wit5SlVO?=
 =?utf-8?B?NlF3Q3crOXcyL0VDSUoyRm9jRTJCbU5ReW5mOStPeFJCbmRkcmZXUE1BMWor?=
 =?utf-8?B?WC9NYjk4SDIzTENsZkFaZlU4R0oxU3lCOWQxNTFyQ1dqTVc1aHExVFg3TXF6?=
 =?utf-8?B?MjZhZG9YZ3RhVkpjQ3c3bWRucXlMS2ZUSDJtdEs1ZlAzL1FhejF1MHVDYjRu?=
 =?utf-8?B?cUIwWmEzY0p5bWJPR1hTLzIyWEdEK2thZTJ4dW9ST1JBZDFnU2IvVU4xRVF6?=
 =?utf-8?B?YUhxbVdROVlRTVhGNldwWjdibnZIemNpbXg3Q0d3RkovSUtwRjBiTDZucExF?=
 =?utf-8?B?OElZY0RHUjFycEFFTUVrU1QzYUR6c3htNkk1R1E4aE8vVFU0SGo5a0hvMGNH?=
 =?utf-8?B?VWpnb2RUZmVLUGo4Zkh3bnlORDkxcGZNakEzejQrOHZFT2d4OWdXK0swOXRm?=
 =?utf-8?B?MnNpeDY4REJoWGJQSmlLamkwbGdzWXI1QVdjMU15Q29meE9odkxnTDVVeFBW?=
 =?utf-8?B?WGdwTElNYUpYWTFFcm1uMWNXMGpTZEJ2Mkw2Q0NxWmp3dGJwbFp6K2xQa3JB?=
 =?utf-8?B?MHp3Tk5pVjhaVlpoL2xYQ0lXejNva0dkU2RZRFRvZkd1bDU0aEsvdWJCektY?=
 =?utf-8?B?d1NuVUFuenZGV0tmQXlSVVpxdVk5MUFOczB6L0RXZVBqalhoZjVjL0NtRTF0?=
 =?utf-8?B?OW9kTGh3S05nNDl0UjREQ3g5K0c4OERQUDh4Mjl3TnljT1dmZWErZmxwcXVY?=
 =?utf-8?B?ZklsVkNWNGFLZnp0NWp1UldFQ3NRVzJwcXpNWERocHR2RGdIK3B0dEJiR1Fj?=
 =?utf-8?B?UEVacnA1OCsrdTAzdkM2Y2xMalJxdTVySG9vN202TWVnanNieVFkZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effca768-db33-427c-e422-08debb4803ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 16:58:31.3631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImotAoUcOb0WJK6ggbHW4pm48PqEAVtymO89y/SS+dSbiGP5j4PSocqwmJBP0AT8y8OTQN6cepa0trAWMj2Q5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109891-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,igalia.com:email]
X-Rspamd-Queue-Id: 6757F5DA827
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 10:09, Melissa Wen wrote:
> 
> 
> On 26/05/2026 05:29, Alex Hung wrote:
>> Reviewed-by: Alex Hung <alex.hung@amd.com>
> 
> Hi Alex,
> 
> Thanks for the reviews.
> As this last patch depends on the previous one, I think the entire 
> series should go via AMD's branch, instead of drm-misc.
> WDYT?

More changes in drm than amdgpu so I think drm-misc will be a better 
choice, but I am fine with either.

Hi Alex Deucher,

Do you have any suggestions?

> 
> Melissa
> 
>>
>> On 5/25/26 03:50, Melissa Wen wrote:
>>> Ensure the driver tracks changes in any colorop property of a plane
>>> color pipeline by using the same mechanism of CRTC color management and
>>> update plane color blocks when any colorop property changes. It fixes an
>>> issue observed on gamescope settings for night mode which is done via
>>> shaper/3D-LUT updates.
>>>
>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/ 
>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index d590f0df6abd..36425d9c2a67 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -10198,7 +10198,7 @@ static void amdgpu_dm_commit_planes(struct 
>>> drm_atomic_commit *state,
>>>               continue;
>>>             bundle->surface_updates[planes_count].surface = dc_plane;
>>> -        if (new_pcrtc_state->color_mgmt_changed) {
>>> +        if (new_pcrtc_state->color_mgmt_changed || new_plane_state- 
>>> >color_mgmt_changed) {
>>>               bundle->surface_updates[planes_count].gamma = 
>>> &dc_plane->gamma_correction;
>>> bundle->surface_updates[planes_count].in_transfer_func = &dc_plane- 
>>> >in_transfer_func;
>>> bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane- 
>>> >gamut_remap_matrix;
>>> @@ -12024,6 +12024,10 @@ static bool should_reset_plane(struct 
>>> drm_atomic_commit *state,
>>>       if (new_crtc_state->color_mgmt_changed)
>>>           return true;
>>>   +    /* Plane color pipeline or its colorop changes. */
>>> +    if (new_plane_state->color_mgmt_changed)
>>> +        return true;
>>> +
>>>       /*
>>>        * On zpos change, planes need to be reordered by removing and 
>>> re-adding
>>>        * them one by one to the dc state, in order of descending zpos.
>>
> 


