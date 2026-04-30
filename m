Return-Path: <linux-arm-msm+bounces-105355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FMXGKhB82kGywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:48:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B335D4A2561
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B59B3009B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F415A3FB7E3;
	Thu, 30 Apr 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CxCZYrGg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z2zelwmh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AD51E8320;
	Thu, 30 Apr 2026 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549732; cv=fail; b=Ce6REpItMSUukxfP2vVtBy/9UGbayR5JPBO7SCb99U4epc7TIf2VUb5YwuihHiWoCP7j9epSy1BUTDR963IoLUHcEug8T83xcjzUdHSB3qusMYtJL4cO+jbbMwAZ9M2jlRcR7ohfM0kVutCmVholDXhjYU0UU0Tx1k6gO7NU1Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549732; c=relaxed/simple;
	bh=C8jv6oJIaHuKuCfCsUwrE7F+1rQqb56s6HFGg748O+Q=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=M3XbEMjjJLArLbSnPAKYPeDLKcucfNXOn6BNjrwGRZmwaZ4GcAzTjqgcC9VgdpmgqXtD14CBGnba/NTMSdqFGsTkRhOFnMS+fGpO5BwtN8j8EzSVc4XjRHAuimubcX3mcdUeTK1yRNdUegNSt0ielO6m41TP4kVzbncgkadvnxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CxCZYrGg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z2zelwmh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UAQRj73488167;
	Thu, 30 Apr 2026 11:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XmNRVBUdtzEVQJPVgf
	9VuIt779bg5U8hC1WwtULDfvI=; b=CxCZYrGghWzV8RHK56noOiy7tRyxprlrAC
	XDbcImonADpWycYacRovtze54qdLwabN/U5+pilbyRq1y+l1flMDkUhIK/syUhXm
	hg/uB7CN6iaG4aD8FgmeW1dkKIOjd3ibRcwbuXX+ohhNxP+CEHqYTHZBoAkP/HL+
	5gxmtjVWzzFZVksdXMDoyq7jKlVx4aJTGECEsQaojVBg47529U3KrvgSctSYeoaa
	YFV/B7+korHLxFzFqMDmCHXCwLgvrLLLYmn15ohzng2gfa9Fp1MxBoOcjuTzAwbz
	7rnrx7J5z7Xp10c/n9RiAXsu9+2qypbT6eyCWtwJ+vNYsPr8cfAA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4drng8n0q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Apr 2026 11:48:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63UBfLBA019533;
	Thu, 30 Apr 2026 11:48:47 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010004.outbound.protection.outlook.com [52.101.193.4])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4drm2fudty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Apr 2026 11:48:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSrFYF+fx8QCLSHDD2vhAw04CZgB+Ddu6wGQpduxGiWROzUxaiGCMbeiqxU8H+uu/43/TlV4yAwdOoKpRZTfI/L/5Sur4SFm36TKLN2n7j26ee0hCx5ny+l7nx3Xp5h4nn55CtYaQV0THXGu6uB1kfFe8XpaBwSb03e1tvm27zg2FKSJvGpLUqVZ6axBhG5KetsYv8yIJKC0H+fNKsWuoLJLFDOxkty6E/OSsR/1412nmZmqC5IKu/55Lg46VVQXPfV3aX0pTMO2Y1PDOsDmDn0npZ/2TEYjecFwfXe6WCoOXPI0X7wHfDN7jGDbrwT/QcbMnRj0wsaroomVnbd9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmNRVBUdtzEVQJPVgf9VuIt779bg5U8hC1WwtULDfvI=;
 b=e/6i1EQxhPpgWAK+oqMt5CU03SArWKOHqD87qczQleNBIHgtiO3GpCmDDWHuar3aWWEkrR2ugtZrFL45dfTumrQHT4TfxEatjXowohTnHZFPzT52NHXq93dKALy450qAHZyCHGU1eM/CSw7qVOtdyUZ6Yk5H/brBzzzypByBYspx9Gbd+hWKnXWBrp5t/g1S+5TocMKPEwhqgkgAHHDVnNM2bql7SJ/1TKbkGX1+ydQYjyscZ7vlk0pmQ3uqhCirngppG5XE78P+JI3X1tgV5DEl97bX0VXgmBu/NhEKYIN7cRfCXveHtCUebPlIK7YgaCx588lmzHEPnSnT/71k0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmNRVBUdtzEVQJPVgf9VuIt779bg5U8hC1WwtULDfvI=;
 b=Z2zelwmh8mjl1WKuGnf3psg1j1TvXTzc1iRNdLl18qzFW5UxmQtCjjgYtqG2UkMtR0gzwKhjF5S0qb6O6fmZU1b/UHFEBz5P/fnvO88jw9BH0hPJGouCW4+v2yHBcsP/ntiKjVWVKb0j/RX7hjr5MfeSMpuTXrSqbiwYcxi1+wk=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by MN0PR10MB6006.namprd10.prod.outlook.com (2603:10b6:208:3ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Thu, 30 Apr
 2026 11:48:43 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 11:48:43 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin
 K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Unify user-visible "Qualcomm" name
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260427070048.18017-2-krzysztof.kozlowski@oss.qualcomm.com>
	(Krzysztof Kozlowski's message of "Mon, 27 Apr 2026 09:00:49 +0200")
Organization: Oracle Corporation
Message-ID: <yq1pl3gfz4c.fsf@ca-mkp.ca.oracle.com>
References: <20260427070048.18017-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 07:48:41 -0400
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::20) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|MN0PR10MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 76be9bb2-0137-470b-6103-08dea6ae6df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0dIKIniLXtDBcgJ+tbj3sColDlCVpfbU3PX2SOk/z0yoKmZkAhClWk1u/GT11R14yCvsgErnhrmpZx1NVCeBNRvdJgz9cdi+55zSabNSQWSRETMlF+O1KW3kA3OQs4I7ECcl3nQ3ZdM0vUGxx0WYwTsYKlgk6YyFEvQ9yMcRDVklI5/SaN+5XWwMC1ueC8hgtnip5v5u4tZeqH825lhyGN/IbI9o+4xHmT7G/EgUcwEn2moyCY205CHIZwmWsqcRn/YlrgyT3I0dnzsiV7bD7L+E6JCcM4bob7SavKJ50tFkuKxAe+sJP0Y1fU+YzXAiXgiGFraTJEwjOf2Lmlc8zffExkkglpdmf/LTQ8Uf+10ZZqZYfr6Ypa1PyfuknWplaybVxq9mqOvUIfKVtU8ziiFqVHVecSIoLLT6eA4EDYSSA+UqyJYpi4UXuOHxoddzyG2e3iYoCD96e+V1nmrOOGPgm++hXWTy06ErZ04W6BR8qV4nIKN7D4WTW/9qJcHoSAQEXTjAvgk5K4LT2gcYfB8l4fmnrlwgrLBgRBcBQ1sEuAI+64vhyLVYqE1I/P8vMOsTmBGBY/P2GaSdVTXmbbOksTEJ0uiZPUoYIDdKA9zqnMQl1Efxqjx3vdTd4Q40hcj1JbgcJtkJpCKMq4JiDYdQmxN5Nw3SlT9dLjSEsM230BUanNxJcVHHIC+oR9Y+mkzrq6CDqp98uatYWIFp/aUJchTBtgxmXQtwLqQ3IPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zKD/cNBKtGcGpX+0XXIB4oWWyB6kF1nLl7VvIU5mtEkjPqGzoPtxIGqfq7Bk?=
 =?us-ascii?Q?X9QgRO5u2870m4d6nCM/Wai94hcHr12eZmlFRqPIamgKMmC4PntPj52/8QXc?=
 =?us-ascii?Q?ygxWcn58L7fKRKTV8dsh+6HbAYkIw5oSqc+9j1n7/vstBrErcFGeiOovcHNt?=
 =?us-ascii?Q?MQ8S0l3p3fl4jfVjkwU/grrUjgw4PCW980zyaWetaV91gUAMc7nVnqaAs5Lu?=
 =?us-ascii?Q?O2zgdsOiyn93u0P6DSRwsmUSePGQl+CBixgjc/HxzBd0CSzfUJPGd6BBDMge?=
 =?us-ascii?Q?EcMConq3WPw+Y4UT3WO9x9n9KVCtF+fff5FKZM0e1UYgRrOzR1zczJxusfQh?=
 =?us-ascii?Q?Q/WDQ4uM1Ue7nOg8uWda7SOuzVgJT170MWi2wpe2evkXyvT1q1zf0ZKgcl1V?=
 =?us-ascii?Q?nVSjSDhrjjOWgixYcOI5N2bVVzZokzvFm4pxIyTsBWBJZHD/KyivTQjQCC4h?=
 =?us-ascii?Q?crK+OvlexEyplTv33zLRm5Qwuzg8fsPWhUure5Ul9Hqzt8VEdCt1++r+mIaq?=
 =?us-ascii?Q?0C6flCKnpHoTuE1Qv7xXUdPhN9X0qHz9HBW8U7XhaYFPZ2yJBnGimqafQKYK?=
 =?us-ascii?Q?R+O4wjSKFZ6z/CMjk6bvkx7hsmWDkAfObDMghBCR8d5RSIG550kWFAP9ILy6?=
 =?us-ascii?Q?pdGxAFrIgJYEknAjnUNq1UlEgh0fl38axhLCt+57hJF12/hbQoZtH9Kj5eMj?=
 =?us-ascii?Q?AY4U3j0aS1R22OXeN3NB5/gY7mpK9D9Ln0VdfnqbtSTaxCpJyuRBnB5rr5oU?=
 =?us-ascii?Q?U+Y0vmhJhKkJTbu0yISzE8Xf6PSoZ2gzHeQtJCgOIG6ze9+dZrzzqytifr0g?=
 =?us-ascii?Q?UTD8oS24pW3J7JeZmquS++owGXKBhuuaYZKpHyigNtlxU48XLdl1w0iB0nc1?=
 =?us-ascii?Q?GwWV+pdOEIjmk6EuHezIFHCFEk78HLFNJnz6Q54/DH8OTYgywgzH3v801t1V?=
 =?us-ascii?Q?/xqCC0CMVymhFL18xrEaXWCJjuE90/z4t9MGquw8iK1pbxebwEOorBJPENlZ?=
 =?us-ascii?Q?XDGWt+RaFECYH/EorDM3CcuYgRje17jN9fMrJvmGd2ljiJcu9jPK4/diEFtj?=
 =?us-ascii?Q?h1xZO9szV1EEYzrFSepwj29/ooBhf7BEDnoZqPiVEvjw4p0nJvxl4awccOYQ?=
 =?us-ascii?Q?pXS2GO5uNC951t7SZM3vc/A142r8DnIXa/RLRhDQ4TphxaZ05MeI+w9uwJ/P?=
 =?us-ascii?Q?qM/0ik3bj5vE3qlLFhmlC+d420FmLA37vR3tjo9Sgqv7dX2WXK6tyb3OMeWq?=
 =?us-ascii?Q?EHAcFCWi7NdgmxO7s/8x6KhDU3gt3/KUcp8yKwGVWxq+O5AJOqgMs8mqxPpe?=
 =?us-ascii?Q?5mOKUKXToww7rwqqCkSTlr6Bz7EidnS00voJSfHJUvWESnq0JUkDwAWjmZap?=
 =?us-ascii?Q?T2nJT2mGI9+uzhuMBMBFTkKGR3NxsyqX0uOw2Vw1uj3SeoSC9JM2dyNv0/4Z?=
 =?us-ascii?Q?Ml85x21cDpgCuffo1Fo7Z2uY8p+PPiAh31oNB9IPQhFSkAKpS8efwY9X/DIL?=
 =?us-ascii?Q?ZmC+gPJSWNUcWlPJ9cRyaR9m1Xssf13eMnnV+jzN4uBQhqTlNokl3K4Aa0Lk?=
 =?us-ascii?Q?QgFKlKwXRq2FFlaqeA9QB9BnluM1PNDZ1lN/jRbt5r6RKhr2UbMm+CmLQugF?=
 =?us-ascii?Q?rNNp8F4u6Yq/UhO8hSc8qNlDJpJw69Pc6i7/irszV2oJUUOFxWGEiOl7GEcK?=
 =?us-ascii?Q?YSdPF3uaVEjY5ZQ8A3gSjR0gwm3vhQrNuzMlzdBmdUCtMra4lw00FmPNg1uD?=
 =?us-ascii?Q?rYEeXFy/xB3DORJp7uiQpKL1mUdtsUo=3D?=
X-Exchange-RoutingPolicyChecked:
	Yo1APGbaf7hSgKGKXnqc55+yvFHS6HL0VdGEyDLsqnRloPd60KavHbk9rt+i9Rya1b42UgVOEw21nyET9W+B+OM4QIzxp01I/lXlZ5k2iy4DqcFW1NNDtGuBnOoFxn70DoyVec8OSm+hsPjbZtX1tK9YjN02jpxpB7/mAR7GY45o5KKwsK6YrZV/qJlSh0uCEKDAs9R1Nn+0EHRtnk/OUjhIVzVh1w+cHvLnq8EeDKnPPZb9uxZdcaoDf+nn2u8r/UgQFo/1l8bCQXrBlEjETPwWuVdNH+KkvXWCDnianDlsHlHWlBeg4HB9W0wyYiddKLwcQOQJUq8WMRyfpybRJg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kvNMFd58vi1lmCf8jNkidSVjbye0ffxVaCGQyKQH0gRCG1XJq8l82ZyoP21zUQAKVDJ6Bd1d9OsBzybOhWarLgFoOgLXNAOEYnkDQoBiD8zrzq/2GVylmZAdcx3v03vlNP0hrEVRO5AOYNNMPf4KNvbT7+jPS5JOSo/8ZcI+r6BEEDSNTohz9kMPqKvl5aAHFy0v+hnEmRYWcbV5sp1zQxYQSKokcQNCn6slRzghSUYyyv44//xpFPyMeD8yyPnBMgxc1h/mE1s9RH4bail2pxdnQsdYm/rkLtErKvi5LkG0xnH5iEtRN/cM/8xURkklImPU+sVBWe0817Cica51nq7Ld3dHPvlwSQvKBTO7icIsOn9XEYqesyn0NpqIBxGNXG7lToRW31NsTfSjow8FxRo5wuXqT3tBZ5bimgvI/q2CZehGdj3xGmI/wUv0sRX4B0xEzn3o/PbhaxV8kWl8ReaX2dOQJOzvIoeoInCwc5C0/UpsUwWdYIrHPefS4znHB9KRNdFmhrW4+f12Rla0LoeMs4SIs81ls0W99I0dvMRBTKIkGCQO9WWB7rwwk1kh2p6AlSijYY8CjJn0E7vFFfnEe51bo1yF3SNzOO5RDEw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76be9bb2-0137-470b-6103-08dea6ae6df0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:48:43.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ds9qlzGcNg3VAiLuUT9/CBg+aZHJ+fvyXcb6823dkT7jb4k3aHDyajyZc2zFNxn9EWlRzh4B3Mt0rGPZrTHuj0JWKK51ZKsagvfokxLLUVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6006
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=728 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604200000 definitions=main-2604300119
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=69f3419f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=WwpDaH9WuNZY06HOqTkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXx26/+CsNLGE6
 qTeWb9gzq2gB/OtJMMk5bx0vWW2BKg7GeUtCKwCQvzA36yWzgjprCTgMlNImZGV63l2FqUi5gWD
 CTpMymFP5Co7WOwZ29UQwt4EvbxkNfA4vZm/2z8QuMks6EraGP4vinp1s2icVsWIINW+dvahWiV
 sGIpo49q2c5Sa9QjaPxEmHJ1Fd6laY2Vjf0Y+22uIH7q0f8yC6D61NZ//ZQg9KUA1fYGuiTX983
 X5xQsDsXoL+geP4Uy7l5QOerU7+ncG33bQ1+gyx1xGuuNMufHPpYf1J523iGJ4KMATDI6cSBf9C
 F0rpP9d1vrXtNz12UVLaOywgdoDmLaKwfLzXU5C1TbZl078eRwwTIHmqe41rK9pqpnAPQz8q4Ct
 GzjkA105Bud8MxlJ1p5nGzfkQBpqA351Dt4Fi1dyBkhp8hMHGWQJ/sYA6hlJRcv5CNWeXJ8fJs4
 fkjJKsTT3xCSDgDPxwA==
X-Proofpoint-GUID: 7kC6ucPNg3WgnqR0OqfNPb_IqiA8KznD
X-Proofpoint-ORIG-GUID: 7kC6ucPNg3WgnqR0OqfNPb_IqiA8KznD
X-Rspamd-Queue-Id: B335D4A2561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105355-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.onmicrosoft.com:dkim,ca-mkp.ca.oracle.com:mid];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[9]


Krzysztof,

> Various names for Qualcomm as a company are used in user-visible
> config options: QCOM, Qualcomm and Qualcomm Technologies. Switch to
> unified "Qualcomm" so it will be easier for users to identify the
> options when for example running menuconfig.

Applied to 7.2/scsi-staging, thanks!

-- 
Martin K. Petersen

