Return-Path: <linux-arm-msm+bounces-102473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILdnINN512mXOggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 12:05:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF103C8E73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 12:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4271B30089A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 10:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938CC3A3E8F;
	Thu,  9 Apr 2026 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="INyWlCty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D2358381;
	Thu,  9 Apr 2026 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729102; cv=fail; b=GdgG2MvYEBtJ/ldg3kJWvwcq05/rZaErcARSHFNwuMmo/EDwJt5w0iimQ7o12h+tzzRZP6TQV8UQUDrGxxz2Tt3Y8iI+e30WnTc9LVMlxC55Gc4k4+hCiIjFCCSvyiZFIcTJxq07sIoSpoI7ciq1ftsHT2W/vnZHmvmXuHoRCUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729102; c=relaxed/simple;
	bh=Jm4IE8veFLY3pPLOOXTOsdaNyiZqazAb84B4KOhhVvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S7ervbyAS2cU6ULdKxHwMVPOZ2OQwAt40ywIkc99AAa93+UoYJrM8RQJU8FbYX2FqAXLr0JM4Qm1iuQQHup40rmSxrtWsJjqBKKVOd9zwebgoVmcRMtA5AuUqALxybI0HRxNsyQR4fPNeG3+hoWBHN6FCCS9LQtrLYTNZt1DMTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=INyWlCty; arc=fail smtp.client-ip=52.101.46.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JE+jciI4Ww+3MyHfTnWSBKrY8WSm2DZfAE4PiWVojcUQehKa82btUltXainCDXEZFsbkhJVpXiA4IBePs/KbszASPpswqYZKfsGWRqsHPySBMZi22EA74PW9qovE5t6T+bpg85/Jtz7GAIJDYZ9+430sXTZ3du4/T1Q5tzPJN+8S/GUqPu6q1YsjY/daSHbxbZq+zvJk4zlTVA6Rzaz9NMqArO0ulddqJJlDcPPWe1pj+/Q5lhnAUIxOXb+I0IAlFid8ky5sT3Yev+GsP3qF+cbdAYjx2CK77YnqVVbaqzX99jIA23Vda/tOyJMJ2xaqdNnvaxlUbuOZR/7rVxTJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88ZE/XqGoiUh3XZHEeQ47Yh9mmkfqHIpMlZhz8tMJ74=;
 b=tw10c51VnlQ1YjH9X/YmcjJlHQ7v4qBHU5yHERIldJamopK+DJS/WcgCzrjVJr6UWA8m+j5b7lLQ7i5efi7HpFJEsYotQPnjQGuAejt+XyNPR/WMekSNWhv6KF5TciHk3weuZN/Q4Iy1AvxPe3bHnN0Jj0HI601a1WCuZXaTCgp6nh/rbnLOrrMLfjgCVoHYrOsm9Od9XS+lnxARKwU7LvU+RYpZJIr/cpu5uACfSGy8xfq5xHd2mVQg4dXviYgBimxI9e0PK/RLNJYRtxnlZUNeDFsG/8DFCX1wTwbWpPWZWE5aidnKpL0+RfYLmd1NWJcPRJPdRbeN50Id6J+gNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88ZE/XqGoiUh3XZHEeQ47Yh9mmkfqHIpMlZhz8tMJ74=;
 b=INyWlCtydILojlC7cSdj9BBcF1dw9LF9CFAUb+WWf9hjp9FTliQQJks/5HLbIOZHN7UngoYAI+qexjb1TNUb8M8ZxAEsgiptEOmaB12Y3cN/rp+UdUCPChuHG6ksts5gyLpueRTtgKHdnYOK2LxOb71AR9BKp4kR9bZiyzSPhzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by DM4PR10MB6864.namprd10.prod.outlook.com (2603:10b6:8:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 10:04:57 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 10:04:57 +0000
Date: Thu, 9 Apr 2026 11:04:55 +0100
From: Joe Sandom <jsandom@axon.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board
 support
Message-ID: <20260409100455.foytyzse3k5ty55l@linaro>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
 <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
 <20260407113925.4imd3lxkcrq47pu3@linaro>
 <25g2sasffiq4axsamv2m5nywieucj3vbwfhvn66jtzjxoodfxx@vkswsycqju6g>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25g2sasffiq4axsamv2m5nywieucj3vbwfhvn66jtzjxoodfxx@vkswsycqju6g>
X-ClientProxiedBy: LO4P123CA0450.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::23) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|DM4PR10MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f3d5d9-76e9-497f-7c3b-08de961f745d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cyZS5yVKDrtIRcLL7Ou4pyQ4l0BF16RF/QG7SDT7bGPhHbofSRqEg9dw9fF9KDuQ9Wbx4CadX2IMHiDupXBcc1dzr7UEKWgU3sCCBRyEHx7NLRmkChAa98pv/2doUmhjj6ua88g7yPzZ7Uvt8EZ8ImX1EpI12+W93AR7I98VUhp/T3Sj2WdZ95jhjHcCSkQS7bKE8hmk7lYRcg6DAxYLreIua5ChGJM9TIgAS2K2CHkgw/OfDyrbzkncqWoVe351N93A5sOizLcZegmpa0CLivgUK0uHM8U+G1iK7NU9/4BMSTqVqhMYdJQjYUwDs15WnbeTCiVC0P4urzMraEfwhOYouKvnn5tHbo5Sd6Ysw283DY2iL1T8LsJQKT7dGB2EWAwncv+5kWpoUNq7GLwXd14dhErHNuej5ikoP9xO591yEO8xe8wcIZ2J3TkksBtKeLxwwfKm90atf2n++13IyJrQ7p+xsv09Z9IfQVePJMFPdGb51DRsCnLFrUBDrL95WKJqxkRt7EpHPdK0yu3MbGaf6IzklerFFhezD3xFOjwegGzN9ndJnIf9JikfsjT/7+zhOpMspzh5r5I9S2Gw8H6XbnhavZppsJU8a0IkE6kF+qr3MKhfQnIlYXnEWoiJ3WpDeCcJOuvKo6CfRb+ECfr7dA1FkZOVbaIA8EzgHGvHDioSxDWWsGuGKkMKJ0l/fAUuYzykarU6bMxriI+QrvlKr35cTXOv6KBUC6WhMQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU82blI3MHJkNVdwZ1lOQTdWVUxWcGtTWklKOVlpYVY1NjZZMlB2OEJPMS82?=
 =?utf-8?B?MTdWVlloOUZsSWREMEN6dkptd0ozeFNzR3FEZVczdElzOHFvSVdMT0ZiQ1M2?=
 =?utf-8?B?eWdIa1A4em1aTHZnVFFpZmhZeXFnNzJ0OGlNOUIvVm5SOVlmY1FJMmk4bk5P?=
 =?utf-8?B?U1g3SEhNZVlsZis4NW12aG1XbXhUTWw5bWdQbHpDUmd2cGlvRGUvSGM5eDEv?=
 =?utf-8?B?MkFDb0xNc245dXZHbjU0dGF3REFCLzh4YXMrM2taU3RFNHB6d0x4ckVkV3lB?=
 =?utf-8?B?L252NGtBeU1udndoV1VkSWdtd29lV1BDeGdvQ0k1T096ai9Lang3OEptRHlw?=
 =?utf-8?B?VEhvaWJxd1FlckZ1NGNMVWt2WDU1WFVLTncxZ1B6OFVLL0ZTZ2UrdUJobDd2?=
 =?utf-8?B?VEJ4bUpkYmkrTk9EMEJaUTRBeDQxRUtDWlY5dEFHeU9VcjExMk4vWTZNTG9h?=
 =?utf-8?B?VTROYXFENlBMUjVLQkpTWm10azZLVVp5dFNLd2hGZXRtUWw5NS9laEJ3UnQw?=
 =?utf-8?B?RzllTG85bjZmNUtzdXUzZ01TY29GbWdpT0pmWWwwMGpSa3RWOVB5ODRvTkV0?=
 =?utf-8?B?RWJCYzhwczJKVGF5VC9Da3AwaWdQMTdxZUFEbW5PUkZGdDhYbzNtRmhVeUk3?=
 =?utf-8?B?WWtaNk0ydy9oOXJrU1B1aHl6eEJreDhKbXltZnd6VnQvRFpUYytaZHdZbUZ0?=
 =?utf-8?B?dFNBVERURWlMbVVkOTlNenNQU2JIYWc1ZE1keWkwaWc0OEQ3SHZOa2QzcHo2?=
 =?utf-8?B?V0ZBYXZqdGlpRnFYRDAvOVhhTDRhemE1S1RKaDJZVzI2QkU3K2Q4M2JEdFNv?=
 =?utf-8?B?b2t4cDBJc0R1WE1yMkV2MW5WNVBOZk1qR2FacE4vRlJWUWx4dzhqeW95ZDlH?=
 =?utf-8?B?YlZBUmVkT3k1VmF1N3hIUUZzQVFwOWR5cW9EUHdtMC9SUFQzTU5FZXFYQWNr?=
 =?utf-8?B?RWpZTkh5OEJrcEtCc3dPL3dXNlA5RDVhMnNXQXlyMkR6T1VtUzE2ekVCcjE1?=
 =?utf-8?B?QnlUNXhOalRtNHo4R2VxdU15cmVVWlVGYUVQUWRDWUtWRGlKeG9wNkdjWC9s?=
 =?utf-8?B?aDFMTWxPT29kSG5zR3d5blUxSVZCR01Bb09TbHBEQVYyUmg0MmhsVTMvZ3l5?=
 =?utf-8?B?OFE0d2M0VkZleE9oU2xWRDhVWGRSS0dDR09ZeGVHcVFYVGFzV2gvQTVlYy9w?=
 =?utf-8?B?ZDFyKy8xMkJxYVBnb3NRZU9PbUtKY3BaL1ppcGlDa040MzFGS1RNWHM2cU4x?=
 =?utf-8?B?YzQxSjdDMy9PMVBRMWpaUmJPWjBuTS9lVmRza0xGOVBxNVg3ckxmVnNxOXhX?=
 =?utf-8?B?aVpxaHFZalZhdzZQMmVlTUZwelZXK0IxRnFpQnB5REpsTVdxS1pENGx5NlZt?=
 =?utf-8?B?MkNQaHhkSnZmU24zamtyTUhLeTROSkNZU1J2SmsxaTlLdzU5YktKOG5BZXVV?=
 =?utf-8?B?NDgyRmFwdE9wT3h3eng1ZGE5ZkFxVkwwdGtmbW9DbnR4ZkxOYUhFUFhlcUJB?=
 =?utf-8?B?d2FpU0NONElXblM0Q0xzNXFYZ1hVa29scHFEQk5ycTB1TzRlM3B5SE9hUlZK?=
 =?utf-8?B?a1BRL2lYbXk2V1l2NXdFc3prTlpFTXRuN2JzWWJxcFlkTVJ2akxxdGI5QnZ3?=
 =?utf-8?B?RjViSGlIMUZJd2QvV3dOMjk1R1k5WE9Vc25SQUNTM1NWdXMvN1NESXFjQkFw?=
 =?utf-8?B?Q3lLOHhrUklaZk1mdmcyTU5CY3dFcFBtc3dWVkpMUm5LSFN3RnFCWnp2Snpv?=
 =?utf-8?B?YVJ3djNXcEJwZFA1MzBoK2ExaVFidDFUZWhlRy92UGljcU44RmlSQWNPek8w?=
 =?utf-8?B?TjBJT3NlQWZYMlFaWi9SZUIvY2ZwZTdETmFKK1ZvaTB6dHgyZm1ISS9mR21E?=
 =?utf-8?B?bmtBNDZSbU9KTWw0QTM0TlRBTEtyVW12SG5KZVp4Ly82d2VNdXZNNUhQUHIr?=
 =?utf-8?B?dXdjNVBvRGgxNTRkallrS1Fzd3p1QVlaWFBVaGdUd2xBb0k1aUVsTWVMT1Rk?=
 =?utf-8?B?OExnbFlzdDJDTUo0VTllUk9Ob1EzOHdiM0ZtUXpJVGYzelBSaVdMQmdXSXMw?=
 =?utf-8?B?SEFNc3BMY0dIVHVrWlYrRFFBT1VQR0NQSUlFNWFqYWpvL243RUg5Z0F0TkpL?=
 =?utf-8?B?NUNYdXVPakVWYXlHbG5tRHd1ZlJOOFZzOHV5VmdhaS9xUnVBaUxoNXh1bURD?=
 =?utf-8?B?U3kxQUdvOXhlTFAvVmtybWJKREdvdmE4M1J3Ym55R1k3MTAzVWlXbHlYU3I4?=
 =?utf-8?B?eTAyMkZ6bHJTcWFId1JjRWtuak15dGNFTXZOMUJTelFGVUFYdWRlRU0vdjNO?=
 =?utf-8?Q?q4qzScb4dra9wJ0GJH?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f3d5d9-76e9-497f-7c3b-08de961f745d
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:04:57.6797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xf1s1VRelz/PzZM2V7lhu6JrXe90LEG081CRVyE5OcLaodHioZr6arb/ZEKrPDq9Y7ZdxTSZJdtQGa7ugssisQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6864
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[axon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102473-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axon.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jsandom@axon.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,axon.com:dkim]
X-Rspamd-Queue-Id: 1DF103C8E73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 09:44:34PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Apr 07, 2026 at 12:39:25PM +0100, Joe Sandom wrote:
> 
> [...]
> 
> > > > +&pcie0 {
> > > > +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> > > > +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> > > > +
> > > > +	pinctrl-0 = <&pcie0_default_state>;
> > > > +	pinctrl-names = "default";
> > > > +
> > > > +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> > > > +		    <0x100 &apps_smmu 0x1401 0x1>,
> > > > +		    <0x208 &apps_smmu 0x1402 0x1>,
> > > > +		    <0x210 &apps_smmu 0x1403 0x1>,
> > > > +		    <0x218 &apps_smmu 0x1404 0x1>,
> > > > +		    <0x300 &apps_smmu 0x1407 0x1>,
> > > > +		    <0x400 &apps_smmu 0x1408 0x1>,
> > > > +		    <0x500 &apps_smmu 0x140c 0x1>,
> > > > +		    <0x501 &apps_smmu 0x140e 0x1>;
> > > > +
> > > > +	/delete-property/ msi-map;
> > > 
> > > Why?
> > I tried extending the msi-map to cover the RIDs from the QPS615
> > PCIe switch (matching the iommu-map entries), but this caused
> > ITS MAPD command timeouts.
> 
> I'm not aware of any specific issue with ITS on this chipset. At what time did
> you see the timeout? During probe?
So when I set msi-map to match the iommu-map entries, I got this;
[    0.000000] ITS [mem 0x17140000-0x1717ffff]
[   11.085152] ath12k_wifi7_pci 0001:04:00.0: BAR 0 assigned
[   11.115762] ath12k_wifi7_pci 0001:04:00.0: Wi-Fi 7 Hardware name: wcn7850 hw2.0
[   11.153632] ath12k_wifi7_pci 0001:04:00.0: MSI vectors: 16
[   11.252398] mhi mhi0: Requested to power ON
.........
[  101.596274] mhi mhi0: Wait for device to enter SBL or Mission mode
[  101.603098] ath12k_wifi7_pci 0001:04:00.0: failed to set mhi state: POWER_ON(2)
[  101.610632] ath12k_wifi7_pci 0001:04:00.0: failed to start mhi: -110
[  101.617171] ath12k_wifi7_pci 0001:04:00.0: failed to power up :-110
[  101.794431] ath12k_wifi7_pci 0001:04:00.0: probe failed with error -110
[  103.158872] ITS queue timeout (12640 12609)
[  103.163183] ITS cmd its_build_mapd_cmd failed

With msi-map removed, I got this;
[   11.469642] ath12k_wifi7_pci 0001:04:00.0: BAR 0 assigned
[   11.490059] ath12k_wifi7_pci 0001:04:00.0: Wi-Fi 7 Hardware name: wcn7850 hw2.0
[   11.497787] ath12k_wifi7_pci 0001:04:00.0: MSI vectors: 16
[   11.559958] mhi mhi0: Requested to power ON
[   11.567375] mhi mhi0: Power on setup success
[   11.693069] mhi mhi0: Wait for device to enter SBL or Mission mode
[   12.185946] ath12k_wifi7_pci 0001:04:00.0: chip_id 0x2 ... soc_id 0x40170200
[   12.482168] ath12k_wifi7_pci 0001:04:00.0 wlP1p4s0: renamed from wlan0
> 
> > From what I could gather, deleting
> > msi-map forces the PCIe controller to fall back to the internal
> > iMSI-RX module, where this worked properly.
> > 
> 
> That's true.
> 
> > For reference, I checked the RB3gen2 since it also uses a QPS615
> > and there doesn't seem to be any msi-map defined (in kodiak.dtsi).
> > 
> 
> But Kodiak has no MSI support (no LPIs). That's why the ITS node is disabled and
> iommu-map is used.
Good to know, thanks Mani.
> 
> > Any recommendations to resolve this properly?
> 
> I will also check internally in the meantime.
Thanks Mani
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

