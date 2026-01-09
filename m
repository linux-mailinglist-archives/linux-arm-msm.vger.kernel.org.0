Return-Path: <linux-arm-msm+bounces-88254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC3D08B1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 11:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A176E302B51D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 10:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE0A339714;
	Fri,  9 Jan 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZQimZIvP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAE83382D5;
	Fri,  9 Jan 2026 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955400; cv=fail; b=ZsdLHee7cBX92YJ6sTpOI5NlrRkRpDFYFXUiOzRrpbndz8cOzGcaGTSxuYHaISKALDeqzZWrSzmWEx8CdVSs34GMi0TQ2W/51m28wd2dGoJyhG2aujkTs4bek2oXbgm7sU3qa3KnmkVbHFK7uj64rQ6JSVKRvXl27Tb20VBIs2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955400; c=relaxed/simple;
	bh=p6WpKuKURH8dOAnDgpGARItWPQL9oiMw756OjvgpGYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cGFubIKnbEFZ9d/EmG5fVxvyhAbSVFLP+N72zoblkr+B4wUJW3Qt4Q4m8b4I0JjEosnjjFaMxsN73HlmsmWd1efm/zi0LFUKw5L+byDHYT7rdUXlK+wN+GomMkEbp+HYvilvXBTRNwtz4wPccgaAhj4OPXhwwQzoB+C2xaCEf8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZQimZIvP; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609APIgK4097930;
	Fri, 9 Jan 2026 11:38:00 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjqbf9n6n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:37:59 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkDTFGC3W3AGnj1sRfiYGSZmemUd1CPnIfXi4dxN3D7MLUNvikNmtNA/wQdtrhYUR/QQeuh6pNSAxOcV8BoFjy7DFAMy51x1O+EuywSS3JAKQb2Gqoc1DRA1CuOz9dL+MooPqQOpzFRJtcffYxWHFJKbX0ta9HVv7WJZeN3hPW6d60lPbJGP4zXOVbQ6SdrnNnRcvfa5AlNbcHQUOUQ03viYYr8qZRGZJGJvWb2WTRoGfJp4I8ttFzvpkdNon0eygi4fyEPqaWVbteiXTt8tCIfk3ekqduZGykW7XxHoVCzERYGKb1dZpZkrao9j6wzpGNKjaRvjswYa3j9UcqR1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PxD596EAbBN8Wti5p4Il9C6GEWUSle4F/SmQe+bKHI=;
 b=DzKVTpzl2z2H6dExNcfJzgOG9Wb6AWWLWrI3PI8nc4akbCqRtBJ3uUcjT+xV+ONKda2WXjaXB93M+TZIGfWpsn5cxGi2FbldUw9Rhltes5E7Jc5sCt51JsLFRNPZHGTzb8cYhtx/SpqI5F6yshnd43qbg3r/hGmSooJIBnK8yGCSWrthtTlKxnb/TTsvBuAe2DmvDdnKB2DWq2YzV3Y6+g9MT9QbmVzLaT7yJKsm1FCRvKUZ1WKxeC+F25iQ8WiYY44hX37ZqzhEvfS0EAbEkohSCI+cjcDaIg9ZfEWfyFLwsQhqwC8VWqkxHMp+ysZqfpvxo2KHu3iR10demp7XEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PxD596EAbBN8Wti5p4Il9C6GEWUSle4F/SmQe+bKHI=;
 b=ZQimZIvPt1FOFZTxOhMYddWrh+4TGPR/l1hY4cL4Nt8v9fYVVtehvaNHGhnvAJ+Orlk5gLrb2crDk/i6Ej5QyYNLDabqSJEyTkEHhQpfOQPgI3rLf6knHrIDHegaT73aUs7BZvv0GQ8/U4oiBSQtw8AhMkoaK3gC/pFlFH7nyqev4z6cCyBM/am5u+7w4zru6gCJcrnHY0jITG8vFHffFypd/EY+o6rLudTB+q13ToXeCB2zgH1f91q4DjI9c1wqZwYQobGHFzRZzGzgDJsEdgCAhDlPAV65GZjiRdqAagczmUGe7vj4IWI+m/MjSEwCz/uc7KFMV6Jr/Elacuo4vw==
Received: from AS4P195CA0033.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::20)
 by AS2PR10MB7129.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:37:58 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::24) by AS4P195CA0033.outlook.office365.com
 (2603:10a6:20b:65a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:37:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:39:14 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:37:56 +0100
Message-ID: <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
Date: Fri, 9 Jan 2026 11:37:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|AS2PR10MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 2802276e-96fd-4573-ecd9-08de4f6b279a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVNmeENpRkpiSmNieEF4MnZ5MmR5ZHhXRWo4NWxTaTA1dzNWSUNPSGo1eEFT?=
 =?utf-8?B?ejhtUEJOcFJIVVl0NnpmaGdLc05MaEJveW9BVTNjbGlIZEJiNEUyVEFVTXdt?=
 =?utf-8?B?YzRJSTVsTGhTbmp2VWlwSlVxMkF2clBZT3VvYWdGUUtVdUhIUHdsSmNrWjlW?=
 =?utf-8?B?NWFjeDlIMXJZNEVlRXhpNzdOa2RmbkJyYTdpb0xwZDMxbE9DMTk5Q3FTNkdX?=
 =?utf-8?B?TUJ4cjVIbnBVblJTRjNqL1NJdHowSUp0TTlDTXFONlIxTGhhWEV5cHdacnBV?=
 =?utf-8?B?M2pseHIyVHJJaXJldkN0WHZRY1lUanFkZ21EbmVGMDg1bDd3b2h6TlpoMlpD?=
 =?utf-8?B?UHdYVEN5RkVCYVR3TDd5Nks5NE9ReE1CMDVSR2tITGZJbG0wNWlrT0ZzR2Yr?=
 =?utf-8?B?Y3psNTBwNWlvRHh1eXJMUXR2a0Jzb1ZjNGYzWXBNcjVvV1J1YnY1WnJyQ1hZ?=
 =?utf-8?B?UEZ6c040Yjl2akIwZXczVWFBYWNaMmkveWw5akVYMVFwTEVaMnIxNW1NdkYz?=
 =?utf-8?B?aldzNlhhakNCYzUzNS9pcHFtYmo0cnBOUTZQeG5YSHRrRDlVZWl3cVNEYVR3?=
 =?utf-8?B?OVdocEwxMnFWN3FJZzJ6US94SERxYUROeklNWGJ4eFJwMXVIbkJxUVpYd1l3?=
 =?utf-8?B?U1U0UHR6Nzk2ZVp0S2owU3RCQy9LdGZKQ1pRVG1RczJUb2ZNV3ViUTRNcFpK?=
 =?utf-8?B?bkQxSjhJbGY1eTQ1RFRVd200VHhxY2ljZ2VqME01eDB3L2VUVzVkVkR2M0dy?=
 =?utf-8?B?VFpOV0s2citVSXUrOEdnWUJ4b2ZubFcwaUgyQTFaSFN2cDlFVG1ZYTlXSSs1?=
 =?utf-8?B?M1Z3WUJxb0RFSHZRcjNIajg3K2N3VllScXFIWXZ5M0RNSDBIZ1lwU2o1VVhE?=
 =?utf-8?B?MkxTenhDTzBFVkdmSEhDYjJERlFhVHduSXFHSTlETkI5bUdsUTRoR21rancx?=
 =?utf-8?B?Y0RDeGJmUllqMExXRlFjQXpTU3BUcXF6d2FsMjZZU0xnMXZWenVwTWJLSm9r?=
 =?utf-8?B?ZXNPK2JTU0FQODBtY2FLa1JzZDFscEI5ZDFoZXdnVEY2dURJRDFNd3BlSWVu?=
 =?utf-8?B?R2l5L3NLNEpuZWVkeTU5bVlnY2drVE5xZG1mc3JHcG9BVHFUU1AxUjdGa3Fx?=
 =?utf-8?B?RnB2SHY3UEFRS3NCSi93TzhxZGEyV29FV3lnOC9pRHRmT21lazlNTXZ4eEtk?=
 =?utf-8?B?bjZrZmphWGFVVFA2VUVpb2htaW5YV3NacEpkQm9rdnkwOTBBRjBaS1VFQkh1?=
 =?utf-8?B?YVhzVVRvR1NYcjVRa1RvcjRYU3dIN2phd3poTSt2OFlBZ0s5OWhzR054Skhp?=
 =?utf-8?B?V1o1K0hhOFJZRi9oVDdZMUovdjRhM1J2ajAxb3IrbFJGZDFWWjdMajNBQmh0?=
 =?utf-8?B?MzVMSnNrSVBsOGg5VHgwNGtubzE3QTYzNGFZNFQ0SkMwTElVTlFjZkR3ZnNS?=
 =?utf-8?B?MjVPR1E1SktjNzlJVFlQUHZ4cnNienVOQU1VTTZuQk9WeUFUUTk4TDdaNWRt?=
 =?utf-8?B?b0RnNWJRVUlxVU1YckthYkxSNUw5anFQb1lmK0g4WFJlL0ltZXU1aUFsNWdH?=
 =?utf-8?B?V2lKb21SUUNNSDJ6SlRFMWlzYW5UcTJhbG10bnpUcHlDSW5UMmI1cDhtRzhr?=
 =?utf-8?B?QzIyN2psejRHeVYrQ2h2amFNVS9uN3ZBbk5tY3VYM2kxc1R0eUdBdlNHR3ZO?=
 =?utf-8?B?RVo2TmROSGU1TmF4clJJai9qd0tDZWUrb3lmWDBmQ0ozSmZwbVBqa2ZDaENC?=
 =?utf-8?B?Q01wdU9aY1hIUE1DTkxYT0hKbzBZa0FYUE1pOC9vOU8wVk0zSWZmK1hCdDM2?=
 =?utf-8?B?cHNidVBrbkRucGFYVFZ1ZmVrajNldHJ4ZUFObnNnV2tyRGZ2QTlDdnpBLzFY?=
 =?utf-8?B?bTZnM2dlQU4wcUF2U1J0SjVsZ2JkRS8rZU45OG5tMVZWdUNWbzdFSCt1bDJO?=
 =?utf-8?B?YjNEOUxFYmxwUUxkVitEK1R0R3JoN0FySnRkY0lkbmF6V0E4eTBtOGFSU0hN?=
 =?utf-8?B?bWV4d1hsQTFGV3pBUkxZeUh1bHAvSXNBZlp5TkNoYlFPN2xiYkFhVjkyeDNT?=
 =?utf-8?B?cHBjcnF5QVlmdjdtcmJBemcxVHJsQTlBZERqdXg0SlRqWStYU0VWWEJkQzFo?=
 =?utf-8?Q?gdaY=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:37:57.6983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2802276e-96fd-4573-ecd9-08de4f6b279a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7129
X-Proofpoint-ORIG-GUID: 8r1_z0ceIPhtBfpVtSbmjOihGnjytGut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3NyBTYWx0ZWRfX3pSE3gCWakwo
 G6cin23baoKc1+sqZ5x/CC/pnRnXq1YZ3VCGrPpA+z/FS5FgUTUPP77PuUYOodL5hd8jTwnUaNv
 95gmjM3q71331s2iCN0nAls46GyNh/aH9VPofqDy2IlerG9oaYMSIea5kBPVXsv6b/3n2LsseXd
 YXKPUQOAagWvqTcZ2ppIeKn5mfAYxcyc3D/c/DNNkSME3Z5jMayWkIlLG6/9EYLxrqpgEV7McUW
 pCJJz9rIjInqtRtm+AuxtSdbq7NIk8QhiffZ83teYRMLPBRBhzxSFa90c9UTFdyMdYCw9FAZVHN
 JWoUadHvMfvwc0SXp5o37xnOp41+uSxC5ssOFhID/ptM2f5OYUVYUwt6eZhYHth61wM4xEhzNJl
 QSARVemQHlsYqwjJQDf71JOMUWw/ugSrs7PA2UyTDnnBCCjAUqhX2+Y29ugD2Tztucql6pFQhRp
 x4eDqgKou4cY3HlOSCA==
X-Authority-Analysis: v=2.4 cv=abtsXBot c=1 sm=1 tr=0 ts=6960da88 cx=c_pps
 a=QwrbhXh03MhuZ2mRWfjA2w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=8b9GpE9nAAAA:8
 a=r-NxFxRDZjlsnDwPFCkA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 8r1_z0ceIPhtBfpVtSbmjOihGnjytGut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090077

On 1/5/26 15:37, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling and
> make the code a bit simpler.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>   drivers/bus/stm32_firewall.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> index fae881cea9a0..92414a4c7bb1 100644
> --- a/drivers/bus/stm32_firewall.c
> +++ b/drivers/bus/stm32_firewall.c
> @@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>   
>   int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>   {
> -	struct stm32_firewall *firewalls;
>   	struct device *parent;
>   	unsigned int i;
>   	int len;
> @@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>   		if (len <= 0)
>   			return -EINVAL;
>   
> -		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> +		struct stm32_firewall *firewalls __free(kfree) =
> +			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);

Hello,

I'd prefer to keep declarations separated.

Otherwise:

Tested-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Thank you,

Gatien

>   		if (!firewalls)
>   			return -ENOMEM;
>   
>   		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
> -		if (err) {
> -			kfree(firewalls);
> +		if (err)
>   			return err;
> -		}
>   
>   		for (i = 0; i < len; i++) {
>   			if (firewall_controller->grant_access(firewall_controller,
> @@ -279,8 +277,6 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>   					child->full_name);
>   			}
>   		}
> -
> -		kfree(firewalls);
>   	}
>   
>   	return 0;


