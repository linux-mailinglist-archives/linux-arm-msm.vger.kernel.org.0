Return-Path: <linux-arm-msm+bounces-63164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4F7AEF1CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 844697ADB3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B64225416;
	Tue,  1 Jul 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UKbCiXy2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tCx9ieyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA168220F4F;
	Tue,  1 Jul 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359825; cv=fail; b=T+ekNRJc9NfBjUcjJ8uUTji2miDs6mEgvQFW0dlOS8pFBbJrtaBhRbsGgav0bg6t9UzuAZOVmE9QFBQWURD7+S6pEMqQSUbDb+J4dIf7XtzP1SA6wECln66XOh7LYs+jzhgy02U5Y18iHg7GGXaJKGXKkp+hIZ1lqunHivviagQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359825; c=relaxed/simple;
	bh=CSkb0//Zcg1oBY9lOXhsR+hvW2/DwG5RIDCaroT4gF0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gti+kd6+PNxsLUJRKRsDQQHzCwpT19iEp7JjrjWzQeLU4pSFgdqCerNFfS4uuZtYl3MCQ7LHFpAAQqpNxXTmzsikEeZK143OvGyyjzQrCduuiCFxWfgODsmdhJaq/1KCV9l8HLjqZVQoXKZlfU2YR4Ws6LQ6DvsOVlRiiMDpMBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UKbCiXy2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tCx9ieyD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611OW1m007061;
	Tue, 1 Jul 2025 08:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jLAdo/NdKTcK2V+gJYWpQv+dbd3ecjMKOezTn5Nyod8=; b=
	UKbCiXy2un+MMpJ8Y0Q1MX/XS3G7mq3BigouZauhq9IGscnVnkfsUrDFPErGwhj6
	flJOkp4UXqill98a/THaqzN6Hmqh5jTAn2MYSw5zgKWReWxORyhAMuCDqT7wlHrW
	pouyVmV2Js2LL6Yj7n7Ykv5tlyP4g02ZXE3ggZomvB8BXj6TfpnYQDVMEDMw5S15
	4UdGS07iUm3yiZm4EHITqDy17Z3Bsgz+nFaAtf9axC/gEP+0EvbLvQpzBmzyWxeV
	BxSjd/mS/tM0PydXMXQuN1Yk9PTnAWjz8TG79S0fCsMAQAny/iZbCqqzzoleGT2o
	+y+W1uuvbILvc/CKOOVC9A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af48s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:48:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56174Yga017478;
	Tue, 1 Jul 2025 08:48:58 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011045.outbound.protection.outlook.com [52.101.62.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1e7g3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 08:48:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGnS5womznxjKxPJd1JCSmydQujx8QCjAZmKf7SCLrkmTjpmv/ZEC6PqJw8KZBb7i2aYGQ5VI9T4dHn98rkvCjhwtOLTOV1aLtAUgEcYSRsMkoan9ZIJks7h25BkoWjoEjm5cNJbCoq4lNoGIDVs8v2Gw3Up1ho+0VFGUs9aqGih5nKsL2JlBP7XW2RHlRc9XZSxR7pO90R4x4zOG+B7SEly/3RYsaq1lBi718+T1vKVMa+xT0yb1ZIlYlKnrtSU8RMPiGsOtjgM+CZc56mMwW1C+hw8msaw72oSRFNoaUFzWcETvark5Kf5ecZ5ZPujG4IW3eUdnrFuCo2o1OAhCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLAdo/NdKTcK2V+gJYWpQv+dbd3ecjMKOezTn5Nyod8=;
 b=Bt0tms5Be+S97VrppdU3LOYwJ8d2btib+BT+LM3YtbMElMlGqyqIh9StSPFoOzf5WPg1IRL3UQgnVcmOgHQ14cynNgegva7qmGczC2OpqY5XxAQ0Azl75E8pbc70CYMW/8fenclahVhd70cwkfsLQICk8ulVqRKUfHd0789X1QQdyHGY4YVGz5+nCdMCCAci4HrsjJMpRBDcYJAwzAjq6/v5uT615CeZNjf87tWuhps7Sja3KUryMvglPyjEhLUOq4XrLSYyzwmIf8JAtmuRHh7lMTHA9Cj+cP+Spyz37pYHn43cFdZgUCBCrt/AYoJYwBI1TcnKMOxEjGvdqEpLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLAdo/NdKTcK2V+gJYWpQv+dbd3ecjMKOezTn5Nyod8=;
 b=tCx9ieyDSZGdv8aHIELGMCZ9vlfggEFK8xwb995PcPeEkjJL/rh6lCZNkxujQLJaiVwJ89F/UAWI+auIjc2i75NgfJahRtXqls23RzI4XgCQF0JNJu/kB7QX1dLEA5QZIKeqALenG/UOBZtZ3AvsymU5m7yQ9zpFMKlG7PU4mHg=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by IA0PR10MB7547.namprd10.prod.outlook.com (2603:10b6:208:493::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 08:48:24 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:48:24 +0000
Message-ID: <050100ed-724b-4b23-ba96-2ac4f0da08e0@oracle.com>
Date: Tue, 1 Jul 2025 14:18:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::12) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|IA0PR10MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a2ec0b-92b6-4b86-19c7-08ddb87c09aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmRoU1dOSzY3T0NYeUhTYVloRUQzREw0WStTMHFxNjFWMWJLVVU0TWpSUnY1?=
 =?utf-8?B?dkF0R25KeTZpci9CaUEzSlN1bDE2akdod3FLdG5jMnV6SVg2SHJMUHlJY0xV?=
 =?utf-8?B?T3k2ZVdYZTNla3piRU1xQllHNEtlSGx4TVI0SGFkaVZldEgzK0cwVXl4NXd1?=
 =?utf-8?B?bmFjZWRkRFMvVkQ3RkhkUHYyRnZ6MThEbXBMZWNzaHl4TFBzVXVCM21zS2VG?=
 =?utf-8?B?a1UxcVpLZmp1S1N4RjJMb0dhMnlWWCtIYWJ6TU9Jc0ZNWmM0KzR2Sk9ERGNa?=
 =?utf-8?B?T3Zhek1xMnVzZnVMQVErUWRCZGF0MEZiNTRiN2NwK3BQc1lHMzV4RTlhOUZG?=
 =?utf-8?B?K084QW5yWko4S1VJWG5JV2lpQS9kUGlrbTNUT3V2S0xoU2lhazljLzFVQTZU?=
 =?utf-8?B?bkdvTS9uaVhLOUsyeEhydUtXVEpNZU90Ry9ZUk1mOUJXQmpVbVh2b3lwUkdu?=
 =?utf-8?B?MGJCaGZhaDc1U1R2RnhQckRqcXJiNjlwK3lCUDg1VXhmYzdXL2EvYVRMQ3VV?=
 =?utf-8?B?ZzdoVGNTaXk4cnBkT0RJbEVyWFRLM2I0MXNsek5Ic0doaHBJNWFvZjdHaHl2?=
 =?utf-8?B?Rlo0czNFWUZaWStFUkdtem5laXVhRG5zZWhPKzVZRlZYSERxN21vdGx6Z1VD?=
 =?utf-8?B?SWNZSUlKdjN3c1M3SXNRM0RZZ0QxeERlN3Z0Qmk3NkRFNjh6UXhkVklLblN5?=
 =?utf-8?B?cHhVUzBZaE1SbVV6RXAwaG0wUC9zUnltdGE0VmdTMnJqL082N3pMajg3cE9F?=
 =?utf-8?B?NHI2YW10a2JLZ3Y0ODBGZFFYaFRSb0lYc0Q3NzZDL0RORWxGN0did1R4VVA1?=
 =?utf-8?B?dG5VVTk3dlQ1WVVWNEYrSStJaUI0MkdNTmJXaitIdFI3b3JpZTlsMS9TNFhV?=
 =?utf-8?B?d0x3VmFSVFB6emc5WnJWbW5DZ1Y5bGptcjZwYkhEV0NXYXBqN0VLcHN5Z2dY?=
 =?utf-8?B?MmVYcW5hcTBHa0JKQVN6a3d4UzFKa3ppR3A2RnNXazlFQzlUaVVDS3c1NzM2?=
 =?utf-8?B?NkUwTWM0aVYwdGVPd200em5hRmNZYlJIQ2k0V1dXUGg1elJhcmtCRHRpU0lP?=
 =?utf-8?B?a2FuandmVGl2VlY1Q2F6dzM0Kzhld09BNlJwR3RnbExkU2tmdjdwL3ZqalM1?=
 =?utf-8?B?eFd0YUdJOVVnb3loTlljMXI3NytnU1BkMW5nTittUldQUnhXUzh3VENJcVY4?=
 =?utf-8?B?STNMTWUwb25JS1Z4WVpvUHFnRENKbk4wMzhodWFDQUtrZ3JoYzJlRi8raEVS?=
 =?utf-8?B?QXBGVUFwWU1uc01kR3cyUDhTQWVVeGcxVHhxTHZZL2MwSFF5Tk16OGM3cklm?=
 =?utf-8?B?SkQySjZvK3c1a01RaWZhdUFaWFp5K1QyL1c4T29ONldtMHNTb1VzSGVVbG5s?=
 =?utf-8?B?Y2lSRzJRcGFzbkI3TStjY2ZJTnJEZHd5Um9MNW0vYVlFUEpmL1VZNldJYVpt?=
 =?utf-8?B?WjBSSGFTNUMvZFBkVC9ua0Jzc2NYMFhHRzh1V21TeGVCV05jZC9xMGR2dXVJ?=
 =?utf-8?B?L3N1eWFFaW9xQmdXcFNyN0RUWmNMRGhVY1RSZTR0TzduU05jSitTOFAxYzdP?=
 =?utf-8?B?aUQvQWYzMkorSStlcS9KaktpcjFYUUFneGhweXVnQ1VIUlZjMzNZTVE1T3Zu?=
 =?utf-8?B?aDlXb2JFUldrOHhmVGdHdHp4TW5WbXprek5LRGhSekJYQlZEazNtTGJOWm9H?=
 =?utf-8?B?NkRzVEhYMjlHNkoyYkdEZHVXOWI3dkFzSVdUMXVjSGhTd0NsNnY0TGU2blB0?=
 =?utf-8?B?SjNtcUFmZ3JoN2dWdWFkQ0Q2OGczTFIrZGl2Zlc0MzQxWndDd2wzQTRKbTN1?=
 =?utf-8?B?RUF3NjRpc25HSFNMRzFKcWpyQkpvZjZzQm5SU1ZWSzltMENLM1FLZXVFRGQy?=
 =?utf-8?B?RXY1VlhqUjdHMFhjcDU2a1hlR29XTWMvUW9vYXhHeXZ3MmNsK3NqOEVvelBI?=
 =?utf-8?B?VmdUVHVmeXRsMW10VWJiUDdRS01ieHAyTUhZa1VEUFdDRUxkUHNKWkcxZlBC?=
 =?utf-8?B?MEJ1NzJjUnBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEJWYWlOU3A1OWY3anl0UDRiTTBLMGJwNnowVTNxYlNsQ0NBSGo4L1VGK2o5?=
 =?utf-8?B?b1Zuck04eGxUcjdhalVlMk0vRkpIb3MxOWJLdTJPMU9uL2lkQXNVSDFXb1RX?=
 =?utf-8?B?YUE5dEozWVd1bDZPbWIwN1JqOTFmVjZqWUwwUjhQYldPQWtaMW5UR1FXRk04?=
 =?utf-8?B?SjlRZVV0bHBBazhRTkJteUpTRkkwdGJPTzZQb0x0ek5pRzd1ekdZOUh2Q0Nh?=
 =?utf-8?B?c3JwczI2Z2txT3VNTlkxMHVzcVYwMk56dmlMY0RTSDd4V3VvRll2L0I4WGN6?=
 =?utf-8?B?c0lvL3g0bk1Bd1p0dUFyTi9IRDJTSGdoOG5yRmRJZExuNVpydjdlWkU0Z09a?=
 =?utf-8?B?YVpteElzUCs3YXFDQTdpNTJMQUZQc3YxbFl3Ty9RRnRjc2dvTzZGUXNpT3NM?=
 =?utf-8?B?T21ZaWFaT2krdU5mWnlXUmFVQXRUSGNMVUltUlcxV28wNU4zcnlYKzRRY1Bw?=
 =?utf-8?B?dEQwK0JPd0N5UFVVdmNJeUNXV1R1VjhSZFkwR2FHdEtKSXZ1blB6Slo5Q1Fk?=
 =?utf-8?B?elFFRElvN2owSzNCUS82UDlkOHhwazU3cGppeFRoNHlsN0J1aExIMW9OTGVw?=
 =?utf-8?B?UEdJVGZYV3czSTdyYUR6UVF1RVFDVWNxK1B5Z3BGb2hEODQyMUZRVy9rM3Yy?=
 =?utf-8?B?TWJHWWx6bGpkK1ZLVkZrNDdCR3doMFdOQkcycFh1SzhDTzI3WjFqcGh1SHpO?=
 =?utf-8?B?amdBcUR2d2VDVEZqSitEMGRWYlA4MGhjeFl5dXEvMSt6WnBRU0xiMkI1ZnN6?=
 =?utf-8?B?Z3p1NmVQWjUvWC8wdkxWU2laZHhZZ1N3TzZpRHI4M09tWXdXSlMvSjBac3ZL?=
 =?utf-8?B?a255cWZhWHU0aE5XSFd2ZnFmNXl6WkVIRVE4VUpzVFU2bWswam9sM3AvdUFL?=
 =?utf-8?B?TTVHcU9ObmxueFdPYnJKUW1zcHdKcEVsTnhXRnB0amNVWk94eUFlQnNVOGEr?=
 =?utf-8?B?bzYvVklWem1SMGEyN1d3S25RcWVQY3JlWnV0aGwwNkhva2ZVdFVUOXd3ZGVH?=
 =?utf-8?B?ZXJTNkk5bGxxdFlTV3NEZVhzK1g5dUFvbTU1MFUxQmtRa3l1TUhERmRsNkFT?=
 =?utf-8?B?byt2ak41Mk1zMmtGdnFxYythOG1nMWhQWkxHUzA0VjBzeTNWNkd4MG1wSlNw?=
 =?utf-8?B?SE9sWmU5Q0FQc2lLeTh3QlRmcG8yOWZvMldwVEl3cmlmRnB5T0pFT05TYVdE?=
 =?utf-8?B?anVvY012clI0MWc1RFYzNUt5QXF4ay8xRUJYckZ4bFp1NnJtNUlXejcvQjdL?=
 =?utf-8?B?VTdTS1BaQ2s3ZHNWeGxXTGtvTGYrZzlXNWlkME5lYzA2bGFmZmJRcTBPWGlV?=
 =?utf-8?B?K2p1VnJxYUxMRTdwQlN4bkVIUmlUbXhPTzdxR3BNN1RvTHJBWXhtWnNaRGh4?=
 =?utf-8?B?NDE4QXZoTUYvdU0zaXBlQVcwTFVuK2pLdDllT3EweHQyUGpRMGpEa2dtcURZ?=
 =?utf-8?B?dkxMbmNxVFBJVUJMWHR2S0o0Q29qWnJPd09yUy9nRU4zNkVrOVNQcEgyM29n?=
 =?utf-8?B?ZjJiOHE3VmsrSkI0Rnl6QzQ1bGZIWVY2OFFXczc2ZHZiUG9zVmdCSklpait5?=
 =?utf-8?B?YjFkY0VWdjlFaEY4SFgxN3N5Yzd6cHdQWW1NQVNkTmc0UUZTTWZqeFhkRFlG?=
 =?utf-8?B?d2s1L2tZWWdpaDNEMFdUOXlYY3c5THNhMDdHb1kreEM4RW1xQUNZczViUEg1?=
 =?utf-8?B?dy84cldSQlhLV09MR0o2a3NPVk9YdXRSbStSbFUzSGZiRmJGNEt4a1htYmJR?=
 =?utf-8?B?Y3NhQUtpd2ZoSEIrZnRXMVJYRHNQK1ZhdGpRVWZXOUdKNTJEaEZUZTdlK0dZ?=
 =?utf-8?B?Zjd5TGd0d2ZhQm9lQitDdlVrWXF2Nlc0UzhiUkljbm0zZlkwWnFKOExNVElH?=
 =?utf-8?B?a0VhNmVIeFpYek9TUjZRa0N6SHNEOStiZGhhaGNwOVpPV1FhNGxzckZpMFMw?=
 =?utf-8?B?bndZV0ZPdURKNjhqck82NDc2dWZ0SmJEKzJuaDk3U1dmVnlYdnNRb0FlbWlD?=
 =?utf-8?B?V0UzK29WY1lNMkFiMnBDUngycW54RDN3V05GdURPeUZpbkliZFlpWFN5VlVG?=
 =?utf-8?B?d0YwUCtwOFZFNU5JT2QvaWVYTnBJUGd0VVVDYi9kVm9laTBhOXRIY2YrT0ZZ?=
 =?utf-8?B?SERPb2tRYXc3QjVmNXZ5OU8xMVhWREJtZkpOU2UxTG84dHNUek1XL3dNZFZF?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vE1ebmFqRO6M+EBrECBy9zB2Y2TJIFF2tAZn+Bt7m+2von0PR4TtE/grlkAEBlcXPobg4Zo6RbMHt3w7gpmRA/NNoQJfQyqyDzdM7avlex0g+4yjIOzPYpzrh807yXKUmcMulYaRQUapRUM1PXqjkdM9LAO/4DkoIu1+TyyYbeZHuzs8pXZ82z63qzdnea23haap/kMwZMlLZF+jkYeUD3+hktVOs5bIoH1ROWaK6b93V9TTfU5ft8LoVruTHKAHERG4RXRkFO+klFCTBgMdQcgyO7SJVmUcS6fg0+448Ets2kyQ2LR/vBiBAvImyCRe70/hYV/yceOFXULTqJY8ZHeVXGjUah7luN4Qc1AKi2SxxzcdXZSRGo2NmPGIAzl/zHWfn5RlSJV1kOYgCMm+nDt133YRsoR05TRnWRZ0zPpRXbcPFqRZ/u8W23odzdQZNhXVqbCXv7pzMKGCUHxEZnG4KQPShAtxotz60Igo6w5i15HLseXycsuMnQSglUoaAOEwzu92YGoq5LEiTXLvVdbX4fiANIho5M10u5G0Bz1WpP4wDq+HIhnbojPbx1AIT3WQ8apIur0X2BVXu9hWAbPTvJZ2HnJGOPj0Eq9o1bg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a2ec0b-92b6-4b86-19c7-08ddb87c09aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:48:23.9579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcXurOgOJk3w8B7VVyuq6gkkUTMjmcQkDDp7RNXH8+kUxLKLJJgN+cIfbe1yDOSWkhsLS0q38OJjfX6Wluo0mg/n+0F/Af0r+S6AMWykxrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7547
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010051
X-Proofpoint-ORIG-GUID: JeH_OsvrHkhD-oW08-zdh4Jl1Ze1fIA9
X-Proofpoint-GUID: JeH_OsvrHkhD-oW08-zdh4Jl1Ze1fIA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MCBTYWx0ZWRfX7zSbX6vOGSr3 PeS5f2+Cz/H/ZtpVyxGF9HFVRUrmR+Xy3Z0WxAmgVtMZKyibbTjfm+otMy1wjBh8KaerMQwHotH UZSSoAKz7ryDLkvNWgo0j+Xg81JaqCdL0OiCcoxl85dOvAaKG6L5fIFAbgP0YDNCgaXzELNft+B
 bXxkGHt47GFUbBtwCiaj2MYkW9r1G99xvU+UuGk9Dya5EN+OD+9NAEPSW5ty558dsTtv26buYp5 +PlecOuSZTad7sxw3Qg6jt99x8OvCFx4yf5Mxh67in7kUgUkR8++z51pjb37AWCzuFWCwnnqTNq 0TI9IOMQ7+l3qGWf9bkRIqnMJLgmsysx9Gm9DItB1TmncEqBbfklwMHyrj61HEozTyEIhIa8Lp8
 mrq9B6qiWy38IA/wpYDi5JDLsqJbY+XBqS6Yiy6sKoGW4S5SdSRDlaydW3LFRb1nVbsElzVE
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=6863a0fb b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=EUspDBNiAAAA:8 a=Pr-rAcl5uWtk5MiUOWcA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13216



On 7/1/2025 12:48 PM, Mukesh Kumar Savaliya wrote:
> Add support for the Qualcomm I3C controller driver, which implements
> I3C master functionality as defined in the MIPI Alliance Specification
> for I3C, Version 1.0.
> 
> This driver supports master role in SDR mode.
> 
> Unlike some other I3C master controllers, this implementation
> does not support In-Band Interrupts (IBI) and Hot-join requests.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>   drivers/i3c/master/Kconfig         |   12 +
>   drivers/i3c/master/Makefile        |    1 +
>   drivers/i3c/master/i3c-qcom-geni.c | 1158 ++++++++++++++++++++++++++++
>   3 files changed, 1171 insertions(+)
>   create mode 100644 drivers/i3c/master/i3c-qcom-geni.c
> 
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 7b30db3253af..3e062d4b8f85 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -41,6 +41,18 @@ config SVC_I3C_MASTER
>   	help
>   	  Support for Silvaco I3C Dual-Role Master Controller.
>   
> +config I3C_QCOM_GENI
> +	tristate "Qualcomm Technologies Inc.'s I3C controller driver"
> +	depends on QCOM_GENI_SE
> +	help
> +	  This driver supports QUPV3 GENI based I3C controller in master
> +	  mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
> +	  this option, support will be included for the built-in I3C interface
> +	  on the Qualcomm Technologies Inc.s SoCs.

is this .s have any meaning

> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i3c-qcom-geni.
> +
>   config MIPI_I3C_HCI
>   	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>   	depends on HAS_IOMEM
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc..0e3ad9d96424 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
> +obj-$(CONFIG_I3C_QCOM_GENI)		+= i3c-qcom-geni.o
>   obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>   obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>   obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/i3c-qcom-geni.c
> new file mode 100644
> index 000000000000..c8bb40cdaaf4
> --- /dev/null
> +++ b/drivers/i3c/master/i3c-qcom-geni.c
> @@ -0,0 +1,1158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + * Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/i3c/master.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/geni-se.h>
> +#include <linux/units.h>
> +
> +#define SE_I3C_SCL_HIGH                 0x268
> +#define SE_I3C_TX_TRANS_LEN             0x26c
> +#define SE_I3C_RX_TRANS_LEN             0x270
> +#define SE_I3C_DELAY_COUNTER            0x274
> +#define SE_I2C_SCL_COUNTERS             0x278
> +#define SE_I3C_SCL_CYCLE                0x27c
> +#define SE_GENI_HW_IRQ_EN               0x920
> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
> +
> +/* HW I3C IBI interrupt enable */
> +#define M_IBI_IRQ_EN			BIT(0)
> +
> +/* M_IBI_IRQ_IGNORE */
> +#define M_IBI_IRQ_IGNORE		BIT(0)
> +
> +/* SE_GENI_M_CLK_CFG field shifts */
> +#define	CLK_DIV_VALUE_MASK		GENMASK(23, 4)
> +#define SER_CLK_EN			BIT(0)
> +
> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field bits */
> +#define M_IBI_IRQ_PARAM_7E		BIT(0)
> +#define M_IBI_IRQ_PARAM_STOP_STALL	BIT(1)
> +
> +/* SE_I2C_SCL_COUNTERS field shifts */
> +#define I2C_SCL_HIGH_COUNTER_MASK	GENMASK(29, 20)
> +#define I2C_SCL_LOW_COUNTER_MASK	GENMASK(19, 10)
> +#define I2C_SCL_CYCLE_COUNTER_MASK	GENMASK(9, 0)
> +
> +#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
> +	M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
> +	M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
> +
> +/* M_CMD OP codes for I2C/I3C */
> +#define I3C_READ_IBI_HW          0
> +#define I2C_WRITE                1
> +#define I2C_READ                 2
> +#define I2C_WRITE_READ           3
> +#define I2C_ADDR_ONLY            4
> +#define I3C_INBAND_RESET         5
> +#define I2C_BUS_CLEAR            6
> +#define I2C_STOP_ON_BUS          7
> +#define I3C_HDR_DDR_EXIT         8
> +#define I3C_PRIVATE_WRITE        9
> +#define I3C_PRIVATE_READ         10
> +#define I3C_HDR_DDR_WRITE        11
> +#define I3C_HDR_DDR_READ         12
> +#define I3C_DIRECT_CCC_ADDR_ONLY 13
> +#define I3C_BCAST_CCC_ADDR_ONLY  14
> +#define I3C_READ_IBI             15
> +#define I3C_BCAST_CCC_WRITE      16
> +#define I3C_DIRECT_CCC_WRITE     17
> +#define I3C_DIRECT_CCC_READ      18
> +
> +/* M_CMD params for I3C */
> +#define PRE_CMD_DELAY		BIT(0)
> +#define TIMESTAMP_BEFORE	BIT(1)
> +#define STOP_STRETCH		BIT(2)
> +#define TIMESTAMP_AFTER		BIT(3)
> +#define POST_COMMAND_DELAY	BIT(4)
> +#define IGNORE_ADD_NACK		BIT(6)
> +#define READ_FINISHED_WITH_ACK	BIT(7)
> +#define CONTINUOUS_MODE_DAA	BIT(8)
> +
> +#define SLAVE_ADDR_MASK		GENMASK(15, 9)
> +
> +#define CCC_HDR_CMD_MSK		GENMASK(23, 16)
> +#define IBI_NACK_TBL_CTRL	BIT(24)
> +#define USE_7E			BIT(25)
> +#define BYPASS_ADDR_PHASE	BIT(26)
> +
> +/* GSI callback error fields - DMA_TX_IRQ_STAT */
> +#define GP_IRQ0			BIT(5)
> +#define GP_IRQ1			BIT(6)
> +#define GP_IRQ2			BIT(7)
> +#define GP_IRQ3			BIT(8)
> +#define GP_IRQ4			BIT(9)
> +#define GP_IRQ5			BIT(10)
> +#define DM_I3C_CB_ERR		GENMASK(10, 5)
> +
> +#define I3C_AUTO_SUSPEND_DELAY	250
> +#define PACKING_BYTES_PER_WORD	4
> +#define XFER_TIMEOUT		250
> +#define DFS_INDEX_MAX		7
> +
> +#define I3C_ADDR_MASK		I2C_MAX_ADDR
> +
[clip]
> +
> +static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, struct i2c_msg *msgs, int num)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	int i, ret;
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
> +
> +	for (i = 0; i < num; i++) {
> +		struct geni_i3c_xfer_params xfer;
> +
> +		xfer.m_cmd    = (msgs[i].flags & I2C_M_RD) ? I2C_READ : I2C_WRITE;
> +		xfer.m_param  = (i < (num - 1)) ? STOP_STRETCH : 0;
> +		xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
> +		xfer.mode     = msgs[i].len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;

is this 32 assumptions ,can tx_depth decide this?

> +		if (msgs[i].flags & I2C_M_RD)
> +			ret = i3c_geni_execute_read_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
> +		else
> +			ret = i3c_geni_execute_write_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
> +		if (ret)
> +			break;
> +	}
> +
> +	dev_dbg(gi3c->se.dev, "i2c: txn ret:%d\n", ret);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);
> +
> +	return ret;
> +}
> +
[clip]
> +static int geni_i3c_master_bus_init(struct i3c_master_controller *m)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	struct i3c_device_info info = { };
> +	int ret;
> +
> +	/* Get an address for the master. */
> +	ret = i3c_master_get_free_addr(m, 0);
> +	if (ret < 0)
> +		dev_err(gi3c->se.dev, "%s: error No free addr:%d\n", __func__, ret);
> +
> +	info.dyn_addr = ret;
> +	info.dcr = I3C_DCR_GENERIC_DEVICE;
> +	info.bcr = I3C_BCR_I3C_MASTER | I3C_BCR_HDR_CAP;
> +	info.pid = 0;
> +
> +	ret = geni_i3c_clk_map_idx(gi3c);
> +	if (ret) {
> +		dev_err(gi3c->se.dev,
> +			"Invalid clk frequency %d Hz src for %ld Hz bus: %d\n",
> +			gi3c->clk_src_freq, bus->scl_rate.i3c, ret);
> +		return ret; //This was missed in upstream : TBD

why this TBD

> +	}
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
> +
> +	ret = i3c_master_set_info(&gi3c->ctrlr, &info);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);
> +
> +	return ret;
> +}

Thanks,
Alok

