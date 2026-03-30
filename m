Return-Path: <linux-arm-msm+bounces-100668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3H2EDmATymlB5AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:08:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8437D355D2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E92D63003328
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673423939BC;
	Mon, 30 Mar 2026 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SJLoanJF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aee+8qQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEA12BEC2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774850615; cv=fail; b=Totflft09Uxd5KS394TBtUo0zQ1Mtm2RZFkAFswWWrnM/fqhDAcl+pZ9yEdhdJnnrI9cJLmdwNkSVasCVJ4P7bbHazRT3mKseLrn/gOghxLtKfY/qHCiKotWgmya0pF8JCgoom98RDwdHqnk727m0FOU4gX+iKYWM8TQcynKFB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774850615; c=relaxed/simple;
	bh=VGHtnI51G7mL6e+OSZbBE4N6q4f8XCNJUwgw7O8tFeU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KCYk8kfizUo+ckuPIFvnKp908gNcPHDQI4J83rCkQOSp/M1hYfybcuJPAOxJzYiPOvxZA536Hx0EdYgsmV9TJnpIHLAp6US7vm7oZv6WSI6BDVLHRwrylR9u3T34p9PZle0i0tqDGr65LLUjlQSl5akhWmaso11cBJ7SSkAXkC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SJLoanJF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aee+8qQS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TNelvb1461013;
	Mon, 30 Mar 2026 06:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=VZHkAKqz04zMV4RPSnUerU/ZMDP5cKcH0PkaKNos10k=; b=
	SJLoanJFR9I2ZEl99tJpy2CxLqviNhbWmeYD36wPBTnPbwKKpncFSWHDlvxP2RqF
	ammKrA7ERVOVmoynaV2UmYB6Nnqys+R3BIQHo6bYSMHEZABuRchl92iWi8NoxezJ
	FNlRCLXKM4DGCBoPqt/Jm5LihAvU32Pm6kAnckk4czG6UvGehNYAZRMtKpuBBAVQ
	q/COe7PjWntEnO1/NMKf7f2uu43a95Fr3/37S1y+zqzmmvthlw9Dg42Y1JZwR7lj
	gp1lzCZP/GYb162hqu2WAIRc/tE2uQDjxvYhaFNvGbKvlR0QEnozFaBXZ3A+CFme
	EdHMVlzFJU3rh7zZMg27BA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d65w79jk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 06:03:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62U3ibvd020033;
	Mon, 30 Mar 2026 06:03:25 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65e89fb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 06:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnwVeMiGaKyxno0v0OoWTpPpD4hagMOaA0tBF7xYDrdXDatigig86eSUG5pAvxSHS/HWj78YYi7LlZNtqHEb8dgO9z2TJyMOpn1fVAsQTN+L0mTf6IEZknWJJMHcaxGIPRcTj3AzCEOra59V5Btcz5AgaULwu7oPSY2AvMCCz4S1iVxml7Bdj508ISHBo5UkvQOW6TmQMlqTlIcl1NrR9LH5z+WOvIFmI/x+KSKuWbPN5OSncIrn5xh5K9NUpy4NGSJhegyroBe/aAvXTVBuKHrs2gs1r3xiZ4X9SAi4Xc2Ic/+FWh9k79Pn5rDZyprC23CegSvd4wFpqdGMxYtHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZHkAKqz04zMV4RPSnUerU/ZMDP5cKcH0PkaKNos10k=;
 b=V94fptyELdrQ8nJUh0l/lJi1LlIwhTRpx8iAFLOkrqmTmlbu+o+ttu9c3LxtbMT+cuBZc7SA6wfbEHvBvWpv1hxlNHT4i6oEvwD5YQeeDL1KbwOUqh7BxxETECoDh3NBAHSjL2cPwfOFKqDhneUYzdsdNd77bq7TPVdAw6qZyy1MO/yjX2Uq8XUNTAS0JXb6IB3bcTInkBKB4KjKmX30nbrg5FgImpGlyiPkOsGXhKXxTHgmvVu9BEo3RcL9RBIQ76BWeTIcWAbmCAm6Sb+s93zNGR93NU9PNoC/P82jIf7pkpuULc6KA7bcJszdnbJTb1SC+OYVwH9xTBZ8VsGhug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZHkAKqz04zMV4RPSnUerU/ZMDP5cKcH0PkaKNos10k=;
 b=aee+8qQSVgqJT7Hiho8K3FzT/IhIZ3ytoPdTCWk3BfKRMMxwqdG53QoU9i2PR0g+OS0yuQPOLGa7FR+XoWM83tAvSZF+gAmCv79AXkf6RNuFR3tfTUGWTGxRHHuucdF7pJwUr6wfV+0NZ1BwrseNYA8nVpxBYRCOsawroBtmXNo=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by MW5PR10MB5808.namprd10.prod.outlook.com (2603:10b6:303:19b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 06:03:20 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::619b:1264:c089:7e90]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::619b:1264:c089:7e90%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 06:03:19 +0000
Message-ID: <bdaccf73-d7aa-489a-b0fe-94ea2d1d2a83@oracle.com>
Date: Mon, 30 Mar 2026 11:33:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: cmd-db: fix minor version decoding in debugfs
 output
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260329191110.1476304-1-alok.a.tiwari@oracle.com>
 <eed2185e-1754-4e5a-8a19-36b9f968c03a@oss.qualcomm.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <eed2185e-1754-4e5a-8a19-36b9f968c03a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX1P273CA0035.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:20::22) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|MW5PR10MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fc3c94-2f24-48b3-5b3a-08de8e220a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	r2bhxgLdwrh8RrifkQ6l4I71nkNDyIJQ66K/aQzFAhB2ckr9vw2n4lUK7ZE2aOWY3W9HJg9coJOA90SjGSBhYAgxKKvAW9cjIiLl8ftaGrHV24O7kvhI1SjxkwWi5eR5mNZ9OEdHUQLuNNEDwCCmCfDRdaLfRfsvXZGjs4u379mlIZUkep3vOyIUfdhvjcDtYZt9YjpFQHQZSwsCVpEu+ABEOATArEGb0uwJJkUHHoAQdbUN2ZQvlub2NnT4/MnJTyQJwcVi2D32X0PNRAR/XpjUGz0p02ZAh8HGzaWi/qKfs5eiPLRBhpHthmAa5jgCiQMRAIaB7Re7kT223KJDS0e0Y7isvtZSUnmbTaHPugY6IJ7QU+LhTkpeuJ4A1SNiSXaUEH4P8MzQTq+BPXz9hapfKQ3kG/ubZgSlOglhT6mHGiw9sgi8QUDHukrq66lFvBacsZ94hc1IbewYpLVDTAxshJ0Z3gAjzWkPIe7+XVn7GJIngCdFbTOIMh4L+/DAkFkzYreAczkBn4LAKFNDvP2uU88SmjYrLZWiJ4YPptuuz82fiMiAq17gFLiyFm4Wa0DsQjblaBQgLwT0rVgb3xxopgZ+b0ALtJPq/TGnH8kZeEyHn4ipGZhJz8WpGKeSg5VtV813hORtZxyZyec9pgqmpIoSfHZSkbjWfOdWX1VmTCP8rJ0L0k8VJX9hvPiMRcz5mX/ZE1yJmOfu0rTkVLFfLiOdsjfj8qWDKoo82hQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUVOd0NtalZ4K01hK1dTTWswVGthdWZKNzZGSHM1TDB4eUhGSExEY1Vid0p2?=
 =?utf-8?B?VUY3Y05TRnluTDVoZEVuVmtjZVArTHNvRWt6aGVFekF0cVRycGgrODdtUU1Z?=
 =?utf-8?B?WnZBbXFrU3AxWlAzZWdWR0ttRkI3eURjT2VLcFpabnNsU216RWliQmI3b2xR?=
 =?utf-8?B?V0paK0hiRFpEd3JFUGRKUy9GdjhpZEtScitXMzh6Rk4xMnc2dEt3ZWRyUTlr?=
 =?utf-8?B?SzFMOVowQ3JmRmxqMmlFektHZUk2STBjYVlYd09vRjRzRmdtTXA4M25XOUFs?=
 =?utf-8?B?WWhWUnVqaVIwS3JPY1hML2txaWdQY2NMS1RSMTFwOEYxM1VQYlZ6cGlrd1RK?=
 =?utf-8?B?cmROUUxZNVNmb3NIbDNESkgzTGVOZklYUkN2bEVjT3pOMUpraDYxNExKVHF6?=
 =?utf-8?B?bHJQTElIVVNCbE9tUFRyNllNcCsxVFBMZ2hBYThFT0k3eUNQcEFoTzhVWGF5?=
 =?utf-8?B?VTBrWnZZbGNZV2tFVkpCa0VZZlJNOEZpRXQ4TlBpV0NBbU9hai83YWxiZzhk?=
 =?utf-8?B?YTRKYmFyL1h5OUM4TTlZY3VMTTlnQjNHUlFMZUt0NmxsVFNXb0ZXQklxT1Bn?=
 =?utf-8?B?dW56OFlMQjcwK0taT0s4WmZRV0lidWhNNG1SNHpQVXZxTUh0eXJlemtYWTNZ?=
 =?utf-8?B?QjdpcDFOT1R1bTF5YmwzMVhkem5LeE56WHJKTXgzUmJHdEtHSkJPZWVUd2Jo?=
 =?utf-8?B?OVMremJLYXpPdFNUWFlEYzJ5ZExaQlE5L3dnNXFrWDB5ODBCVWhoL3IrY3FH?=
 =?utf-8?B?dWNLRUpYcjFHVFU2aGFxZ3QwN0ZwMXl2VUM3L2owM1ZCYjQyOWtDU1lrMmxk?=
 =?utf-8?B?YTdOOXl3TStXc2F5Y0xzVU50d1FZYWx3UndMSlRUdkk5T3paVC9CUWZDQjYv?=
 =?utf-8?B?NzlQeXpIVitTbStsN2J4QVNJTHM4bGNYelp5U2VXTENLNnZvcFljL3RKOFRN?=
 =?utf-8?B?eVdoTWJtcE5HOU0zek1zSlJGTWlPNFh5aGhXTEE4NTlqTjFpSjF0VEdkVzJo?=
 =?utf-8?B?QlJMYUszVVNyQndLNjM0QmxVem04RmRkT3BUeVhObUFJWHVFZ1BUSCtpUm4v?=
 =?utf-8?B?Uk83aURGWU9WYkp3ZmRqQnpNUVR5RzFoM1NVR244Mk1kSXVWS3FTLy9BWTNy?=
 =?utf-8?B?bEZPVTZoVW9oc1paWXIxS3drdkxGR0Z1QUdzdnl1Vy9ES1JSd3lYUy9Mb1pZ?=
 =?utf-8?B?MHZvQS9FZFNRUU9aNU5PZ3EvK2xMcWJ3OGl0ckhxQmVuZlFjR09BdEw4S3B0?=
 =?utf-8?B?dFk5VVpzalZBMTRLczkxWE9ndDV0UTByQTIvSG8wVmxGVnJyWWJQZjJwS0NU?=
 =?utf-8?B?c0pZSER0UDlqSWlqWTkvOE5IREdZOHB4cDd3UmlXMEROd0htZVpDYWZyUklH?=
 =?utf-8?B?THlGVkl1Slg2RXhPbTFkYlFkVDNBWDJ3QlNBS21zOGFITmp3L3l4UHhVVmpB?=
 =?utf-8?B?Y3N6MUZ2UzZ0cGlKWTVvd1pONVNlUHpLKzhYakN6ZUdIRk1rdFBRYTg1RUYv?=
 =?utf-8?B?L2ZWaUV3Q1dlTFR3aTdGZytnU3FaMlJIYlBLL3k3RzJRRWdkTGY0d2FrZGFC?=
 =?utf-8?B?SU9KN2ZZT0l0ZWFTcjFGdTdNRUVyUjFFN20wNlBiS1BobE9NYStwdkQ2NEJW?=
 =?utf-8?B?QTFiUFJ2bEk2RnV6d0xRQnEzMEZha0Qra2xEcG9ETzJMVHl3dnhDSWJpSFBy?=
 =?utf-8?B?dU9YN1NqRnVuWEs5YkpUT2E4cjc5SFFNRjNTRENITnF2bHd0OGJHZ3FPeUdG?=
 =?utf-8?B?MUZzU3RacGtiUGtMa0UrT1NoT1R6WDhOR2F2Q0ZEem1YeUo0R1NjS2w4TXU2?=
 =?utf-8?B?UUFQSVN5TGRWNXRsN1NVeSt3ZERzWk8rSmRKY2pnc0tEYUFvemgxeW9nVVZX?=
 =?utf-8?B?cXpKRENTd1ZBRlZGdkxtTTQrL1NER0NhNjVNVUJmNDhTNTBtZk44NmNLUGk2?=
 =?utf-8?B?WHhQbHd5S0x2d29GeEwrTHpzYUgwM0ZFanRxd3BKT1VkSG5Wc2JuVDZhVGVj?=
 =?utf-8?B?ZUJOWVhld3RhK3NYWFlBV3haWHZSY1RQUndMWlBSREY5SzlPQWxWRnRvbXdH?=
 =?utf-8?B?UjAweEhDb1VTYnRndG04WXkyaWhKKzNiVFFPNjdVOTRYVXBweXdBeWpqZzdB?=
 =?utf-8?B?NkFoTlNKZy9uODdqTnVvMWFCTmpDbm03OXUxd3NUK2tKMytPd0JJRWlSYkxN?=
 =?utf-8?B?WVJMODhUSTZnQXFUcExTWGtGVlBFdWJJeVVDUDVyY2I5czJ6ZkkvQlhreEFY?=
 =?utf-8?B?RlgveG5wQVJQcVUrN1VlRVpZUldVRHpENnREb1lWQXhnSzhzVzlvc0liSVFj?=
 =?utf-8?B?Y3hJUFliNThnbzl2YXlxaEcvYUFPMG9wamhPQ0FxUmNNK2xZaGIrVWhQM0FP?=
 =?utf-8?Q?PZh5pOWlm5kyeenA=3D?=
X-Exchange-RoutingPolicyChecked:
	jlzi0QRZumdA/I4hyZ2Jy6HX1yWlqnniKPlLpVFxP1hRw0yCyHibXR2TzqIrcFaAN4QoZ+9mVlznpgI0bIu3G6YdkkNGGOskYpuFZ3rMuIMcYcPWYsGWkHeHbwL4O1tsiIHx9QSoXDXmdRlYmyfvL4LOOczYSxhDfxZgZ6yFAxoh69WeNTu3FAHDGa/H48aeN/cjkCFykPzLl17U1taO78mFgZ3xvvndSU3Nk4v125/e5NleQ9XiuO6LZzJJteWt9y51PaDJqaIexOer4NOS4KjdAXFissnKnJEJPMTK0nEDEY8MTSmKEF5gK6GEMtG58506oS+8MIANUGqa/PX5rQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rwDbGw8O1SV60iSaCtNZfXgBnhDIKmx8228c8ktLBkJIQ9C7CUTVTj3WZNytEzbpAnprJOyqhFArD/T0MTJyB8icCRfGiwt9YDxmXF8+JLn2v5G97HvzppcbnGtno2vFD3adbzzEdBf1glMgSMgq9qsHT4Uh0Zr6YKNlW6GCt+BhcpZ+nqkfygUFm0xVY0tSO7xfGK3Z5uwz8c+aFLBao7EaNbhB0t0veNuOYlK4WAiiocimOliC+8RDSLpoM7dXJ2ViUaxvm3ANXu4bF0bupfdqhOnWkakt3id6pQ4ridWXdTn8CbVmbDcRLyMIqiYVJhMDlIXHgYf11f47FaZFmOp2xX748VCVqevP4nYoY/a07YYEnd4/U1CTzy1HUJPsridx76e82pG+W8DAyScUx5zwjhmKZSiPzoRQvgvjwkGbQiXoMHIcmDwFjlsh/SKhPOu08zcL8H5jqNjL6E5YOoOMGvSm3R3QKQderGyQm5Od5CVGv7v+JQGxlbNBzOM//xSXVdE1sQkQOdx+/OSXlS+QmOVXX2NahX9hJEFpvxuhhkG8V080LGyfS7+fqS+0wVpWL+fdoAL/k7/p9zaqu/D14rTS3RMSIQOjftHdnU8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fc3c94-2f24-48b3-5b3a-08de8e220a7d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 06:03:19.7539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbcu8k5QCTyKqWw/ZmdKxg9tdZbrcpW+8Frsd0xieuRrswRiSydaOu7v68GdWiV5cDqM0Rz5POOf/AneFyRJChRibXgWVPdlMsr0Tr65ZRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5808
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603300045
X-Proofpoint-GUID: vcgZp7_EU-kMijbUc0ATo1GiY75aJ3Os
X-Proofpoint-ORIG-GUID: vcgZp7_EU-kMijbUc0ATo1GiY75aJ3Os
X-Authority-Analysis: v=2.4 cv=DKSCIiNb c=1 sm=1 tr=0 ts=69ca122d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=o3pMYaSDxpYf2nIJkY4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0NCBTYWx0ZWRfX6HFGb54vavs7
 w23454z3M5rLJRMtFVGVELA1RkUL7gSiKbQooGP3u/yd0nZ+pLdIysfw1P939cOnJ/vdgFvW53K
 Tn2l8/wTbrEuRuBGVlczKGRCBC2oc4gSg8flohz6hujig9WEBxveLIGoYj74TK/TiTYqlPGkV3d
 nZoDRsMHBuOMxw8G4++/qW3xOP2vUBW6SdTm4wIcAXS+V8+Xh+V9qb/byGL1oznZsMR54wJtN61
 wn1OGmxnSB6A35geIRXKRERpyvoa589D5bdbKFXTJasTiSbcHQTlo9A3rmBSRMPCHedraKMVyt0
 cQlBeDzJnGrFBlVPx8r6qFuyJ0T+yCd+A7Pg1SU4yVg/3rluKc88CFVh+kZOgR15uysruL2TMiR
 mcApaPUAa1NdGlwDGparDeAwECdQjVCaVhoNalWvz+PgUNL/CNpwm91JEhVlY1Twl3isumi20iS
 nx7+m+Wx2CvCKuqZfFQ==
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100668-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alok.a.tiwari@oracle.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8437D355D2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/2026 11:05 AM, Sneh Mankad wrote:
>> cmd-db encodes the version as major in the high byte and minor in the low
>> byte. cmd_db_debugfs_dump() prints the full 16 bit value as the minor
>> version, resulting in incorrect output.
>>
>> Extract minor from the low byte using (version & 0xff).
>>
>> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> There should be a "fixes:" tag added since this is a fix.
>> ---
>>   drivers/soc/qcom/cmd-db.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
>> index 84a75d8c4b70..eed7013c7676 100644
>> --- a/drivers/soc/qcom/cmd-db.c
>> +++ b/drivers/soc/qcom/cmd-db.c
>> @@ -301,7 +301,7 @@ static int cmd_db_debugfs_dump(struct seq_file 
>> *seq, void *p)
>>           version = le16_to_cpu(rsc->version);
>>           major = version >> 8;
>> -        minor = version;
>> +        minor = version & 0xff;
> 
> Minor is already a u8 type, so assigning a u16 type version to u8 type 
> will automatically truncate the higher 8 bits.
> 
> Its the same reason why version is right shifted by 8 before being 
> assigned to major variable.
> 
> I do not think there would be any difference in output with or without 
> the change, do you have any example?


Thanks for pointing this out.

You are right that if minor is of type u8, assigning a u16 value will
implicitly truncate the upper 8 bits.

However, the intention of the change is to explicitly extract the minor
version from the lower byte, since the encoding defines the version as 
major in the high byte and minor in the low byte.

Using version & 0xff makes the extraction explicit and consistent with 
how major is derived using version >> 8. It improves readability and 
avoids relying on implicit truncation.

Since this change does not alter functionality and is mainly for clarity 
and consistency I believe a Fixes: tag may not be appropriate.
I can also drop “fix” from the subject to avoid confusion.

Thanks,
Alok

