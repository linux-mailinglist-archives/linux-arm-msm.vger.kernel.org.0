Return-Path: <linux-arm-msm+bounces-64542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F058BB0196E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A87B73B0F6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E772E27EFF4;
	Fri, 11 Jul 2025 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cmd3h1Y1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FDKWprOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9E27EFED;
	Fri, 11 Jul 2025 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228701; cv=fail; b=qs9Y18hubDzo7gAtgCnFiSyS20+5gj+8Wa5bNfqWAJ+aT79hke3DPC9FluKxlSpFAXcIP8rIqsIcAFa5pFy2kAzwjmxybxIFckhaD4ofiDoENX/EjPO1lX2Sst9Ju+QuM0/EZV9Lc0lDaNoJdtxNQDWu4rgqXQBpWgmQ29EwWOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228701; c=relaxed/simple;
	bh=9J0RiuYT6uT1ibhm7VmC6/KSkhThqAKhn8/MOT8DkLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OE+llqjwCVRX6sy7CXE30F6YQ28AHkgIcq65ec/Mb6JMZKsYj/iFrsQB4OyE8PNGtVOhChpD2Rr4iWW2Oww7OCjfOodXM5VuDIo5AtWGhsAU9Ctd5YDDj8YOjOGfSKEVzAr9YyUpybotXP0dsIqoe/Tp0ZyFfGF+UDmtxhga334=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cmd3h1Y1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FDKWprOr; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B9k94Q011859;
	Fri, 11 Jul 2025 05:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yCPwOUAjXGGae/0UoimuWkStXMHeispAz7BIVN/GA7o=; b=
	cmd3h1Y1Ott8SkU13MovoTcK04gH/a3Jtfl4oVyhNcvyeaETc4jWoBfCjIeVKr4a
	q/zsGCezOqO32NixHMAJfIWWbwKzLiHlALGO4HJNv3UMVwKWoBIhwhkCCeLbPGZ9
	xcWd1uu9edVRGlbVf6mxRgzZ/ElgntA3fVNnT2Xzb0SczMTF+zGgIHDqDbagQ8yE
	v+H+GvJWxt8bxF2ki0cBiyFxEJCPx4X/fpJWeZiWlcDeYMZVh8gaXR3JVBylnscB
	akp0g+4GaBj88DzemucqWNM8qvlfGNwJB4pSUL1EZVTKmUUlvsvjHl0mJDmOT6e+
	JcEf0tAYEFN4s/5pD+R1cQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2099.outbound.protection.outlook.com [40.107.236.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47skytvxj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 05:11:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISF56B5TWEv1cuF+XaeU6nZ+/5a2pd+TT2e2y7BWvMVbeKl4C4t5DBW4ugnR2RCHOVdiBxZdn61oiS3A4eJ8OoqfCkc+kwa/xmXBWRhVnMVSrNBt3Oxdz4gGKy1EX8iqTocIv2ilOU9AgJtV88ff2nqf4uZTkxGyWHfgASD90i9pY0PhzqtKEMyGqc5vnjagOs3MrzExKYS9MUWffx+o8OTJcuxrHAUB7ZidIlXicUD+ibkdhPEaCQNS+qpotBkWPOBm4sEh3zEbUXCrkmZDCBrXIRZrGE95pUJ/+GLVbkv/tOga9acv3LB0FVpYXozNZWBibonqJT7OcWZSnV5vVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCPwOUAjXGGae/0UoimuWkStXMHeispAz7BIVN/GA7o=;
 b=ZwE+m1VNJaAfWRAFqY0H5mHmiTVpbvLiUqvQ2lGRb/RcMAUqX2RbgadJ1OgpZYpXSrKQYrxW9Cq9xgRDQfLUBDmvGaRdvWJ5j2q0A9AOBOowweW7JMRYtp8ThOM9OzP4u9ZXD9SOvsLOSHzc3EVzYCQlVBJSrH6LbT8kKHAFd98VBZaQsvF/Gadrq/XX2aM8AoKJ6KLK5TvPk6AY3ViMpp6RkTvgag7ikag8QwZRbIn7Qhbj0ZQ3SqulrE+CbehE3HwOA/M30UMAugR9EAHVDckvjxx6gaSBn1uhvHSQlAeudbq09maVLJIy5PkanyXD6rtx9CInLiAtpWbmIMKBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCPwOUAjXGGae/0UoimuWkStXMHeispAz7BIVN/GA7o=;
 b=FDKWprOrEInYXdwdpchpEBqqj7oDsWrmG3ngdxYOx3to6s9LKod5Yqvp1dEb6v9gEWtvQH5ltpXxULduoe0dhdUsj/3gBTipikN7OqaTmcuGGR1+oEt7ih9f6WFb3hNnJu0lWCitZfOohoQlLOcEO/2KOMCoYa+F1NMDZc69Qlo=
Received: from DM6PR02CA0142.namprd02.prod.outlook.com (2603:10b6:5:332::9) by
 MW4PR19MB6601.namprd19.prod.outlook.com (2603:10b6:303:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.21; Fri, 11 Jul
 2025 10:10:58 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::ec) by DM6PR02CA0142.outlook.office365.com
 (2603:10b6:5:332::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 10:10:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 10:10:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D85A3406545;
	Fri, 11 Jul 2025 10:10:54 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A9D08820249;
	Fri, 11 Jul 2025 10:10:53 +0000 (UTC)
Message-ID: <2d90ea36-437c-4aba-b92b-f1b591ed5dad@opensource.cirrus.com>
Date: Fri, 11 Jul 2025 11:10:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ASoC: codecs: Implement 64-bit pointer operation
To: Joris Verhaegen <verhaegen@google.com>, Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Baluta
 <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel-team@android.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org,
        linux-arm-kernel@lists.infradead.org, David Li <dvdli@google.com>,
        Miller Liang <millerliang@google.com>
References: <20250711093636.28204-1-verhaegen@google.com>
 <20250711093636.28204-5-verhaegen@google.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250711093636.28204-5-verhaegen@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|MW4PR19MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a12c590-774c-4ef6-d349-08ddc06339ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|61400799027|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHE0YmtrTHZXdWYybWFpNjc1QnM4MjJDMnZZOThab1ViZlY1RThSNkY2Qm5Q?=
 =?utf-8?B?Ky9HWHk3S1lub2pWb0NJZ1UwRFVLTS9md0lJQXVRVUVzRVNJaktnYmhaNFUr?=
 =?utf-8?B?VzcvL1VrUUw5eDNFcmJXQ3RTUDRnd21WSmFOS0I2MnJqdFB4UXJnUGF4Sjh0?=
 =?utf-8?B?OGVFZy9YcFpxTnpJTlVRRVo2V3JYRFl5ZHQ2TVl0U0FOSnU1bFRucElLV25k?=
 =?utf-8?B?aHhnZ1pkNFdBOGtIOWtxVFZKRUZrYnFlMTVMSDZ3UnVlcm8xbmVkVTZZYWlX?=
 =?utf-8?B?VU5RUlR5S24vS29qZ09LeHFsNWdlSnRCMXdXRHpLMlNhVmc0OGlXR3BWS2d1?=
 =?utf-8?B?RnVyTU4rK0pMcUxqdnduQlVGM1N3WExnWkNRU2JRdzYyblB6b1F1d2VYQ0kw?=
 =?utf-8?B?UmxLZ2QvSzBBWlFveTRHNnZGeExFazV6QzJYMHBYYUx3OTl4azNFV0NBZ091?=
 =?utf-8?B?TVZvbGhpQmNKaW16aThRSDJIa3hMU1RCUkMwNGdQcUJVaTBoVnN5M25HT2U5?=
 =?utf-8?B?b2VZTDltQkY1TTF1aG5WdjVHcDBSVDhZRUorTkt0MHZLK2ROUlhHWThJRVVF?=
 =?utf-8?B?Z0hPOEVGdm1IK2RPbllnQi9WQVJ5SmxPUFNEa21VOGd4RDAxQnlpUitIa1NR?=
 =?utf-8?B?Z0FoemljOWx3NXVkMDlyOXNpanlER1RIenJDdWUxenlBam85ZnBWMytMWjJY?=
 =?utf-8?B?QldIYXEyMHNlZ25oRU9iR1RKZjJ4djMwanZtR2J2UEh1MVc5ZU5ZMlVlM0JN?=
 =?utf-8?B?NzVhRnVmdEhWVFJ3VGdZRW5qbnptWGNGWFMvSUpWOWl5UGNXcE5COGFQYnZI?=
 =?utf-8?B?S3pRc3l0UDVTTG91RHdTV1BRZkFpYmgvU2I4NVh4Tk9PaDk5d3NyM3ROaXpz?=
 =?utf-8?B?S3pwV1krNWl4ZDF1MzhXaTBKZHJYazI1NXh0UDBTczVvSEpRL0phcERsc0hH?=
 =?utf-8?B?NUdEdERaUENndWlsZU1QQUdFWk5IRThkS1UzYk9RMFUrUEtJNzJ2dHgyOEZN?=
 =?utf-8?B?Y2V2K3JDcXFTblZKaVg3ZTFxRms5amh1ZDUwZWRaK2JrZzdvWHVCc1FOQUZh?=
 =?utf-8?B?WU9CdGJXbkxXeTcrTys0QzZIRU1taEFxZ1JTWmtRdDFZOEZwK3AzNFVwaURp?=
 =?utf-8?B?M0lhWnNHTkJ2eFBsQVl3Y1NPT2wxVjlhaUlKLy9MQTZOTzBTSUV6QytqL3NU?=
 =?utf-8?B?cWhYazlFWWlsV1ZvZGFVSHJXOEZJNFBQWlFOZjA3U3dPY2EvZldRdExsdHZZ?=
 =?utf-8?B?WEIzUThMRGZPUFc3alNXcWJoa0F1eE9iVWJDcGZ5a2tSZFovK2F0WENpTVoy?=
 =?utf-8?B?RnBiNm9hQWV3aUc0Zk5CdS9uM0ZaeDhZNUtzSmkxK1FDckpkVHNqWkZyTVZB?=
 =?utf-8?B?bEdjWEtFcDBNYUtuSU92cWlEM0J1dDZocG5nd0RScDJUWTF3OEtrRUQxaTh0?=
 =?utf-8?B?VlNqb1hNblFkc1gvcnRObzN1SC94c0VUUVB4TytVYmp4NU84Ym1zZk1USjNG?=
 =?utf-8?B?bGVpV1pzUzA4WWxiUWdjL0h6RWVkanBYWldyVysrellhZVZhNXEzZHpWdk1G?=
 =?utf-8?B?TU02MFg5YWdnakUyYUZnTVVMVTV4UENSb3U5eXlEc2MzUGdoY1F1d24vcWlR?=
 =?utf-8?B?YnVpc2tnM2FHdkJMYlNOZkx1anJ0aHQrWHljNldjWjlIcitxRW5WZHZUZlpm?=
 =?utf-8?B?Y3lXcDc1VTJPUWd2TTNwK0lzaHFVMDJOY2RiSjdQc3JTMG4yZlQ4MEJCcWJO?=
 =?utf-8?B?OEl0VllQV1FBUFhBUzFBN1B1dm1uc1IvbTR3SGp2V0Q2UmhwK1RlVDdaNTEr?=
 =?utf-8?B?R2xMTkhIOXVhQjU4UWdid1c2cExvMi9sYjMwY2N0TjB3L1U1T093dEdVM002?=
 =?utf-8?B?OVBTRFJZczIvdkdWWkxad2duT0YyZ2FyS2tzQ0x2UHF0SjlPbXB6QjE1WTFF?=
 =?utf-8?B?UWRKR1FzV294bjRHM3hsclhNenQzdXp1ZmNMVUNHMXFlOTlibUVlYVNFK1F0?=
 =?utf-8?B?MmVYbXZyMkZUZU1XSmw3aVVxd1BIZS9RcVN6bTBPUlg2SWI0bTVEVDQyYmdK?=
 =?utf-8?B?aFJ5dmtjTGNJTWZKTTFnUkJzamk0R01YMXJnUT09?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(61400799027)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 10:10:55.9789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a12c590-774c-4ef6-d349-08ddc06339ec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6601
X-Authority-Analysis: v=2.4 cv=BerY0qt2 c=1 sm=1 tr=0 ts=6870e337 cx=c_pps a=FgJbo65O0phykmojyLKJSA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=1XWaLZrsAAAA:8 a=w1d2syhTAAAA:8 a=oKIUttxB6HqKT3QylSQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0BxwqY0yCcfx-1gILag7hfjezndr_SAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MiBTYWx0ZWRfX3dlsMhHqTooo A8RSWxcWdo05IJrMhi3lRnpMV9Uv05MNQi9PvG/OM29mHQGx0UVHCo37MyJwpFPILvZCFVGlkbn Ov3xKhVTarJNsnIFJ/QxCwNM2NbW2jcRGDLavmSwhQtMLiPgDc8Q1i3sC+KUrrqyruP/J/xEGFu
 O5bQ95E6zWHq/mD0G+nr+lupkMBvJ7AGvMu9AG5ubiflHrwNc8gb+yjVoGsDQ+5Y5T6Z1tP1Z+D ygOX5N043GuwbfMjhxcOTOjqaPv9XaA4uQqWFMUZEVn3Kxwyi+nka2JytB6EnxYHBFSbxI/1RgZ SUhCBRPz0QnvLl2H4jRUKjmsjR/h18Kv5RMjpRKWbuFzGB8GLrJXERT57xNf03g2DrEVurS8yH/
 Wwn8Yd9D6gk/G9a8IrbLzgKqkBYKeNrRGoBNHnoj59/0Kft25SMqySvupfvlKFj+qBgZF7nE
X-Proofpoint-GUID: 0BxwqY0yCcfx-1gILag7hfjezndr_SAn
X-Proofpoint-Spam-Reason: safe

On 11/7/25 10:36, Joris Verhaegen wrote:
> Implement the new .pointer64 compress operation for the various ASoC
> drivers that support compress offload.
> 
> For drivers with complex but similar 32-bit and 64-bit logic
> (wm_adsp, sof, uniphier), a shared internal function is used to handle
> both requests, minimizing code duplication and improving maintainability.
> 
> For other drivers, internal counters and related variables are updated
> to u64 to ensure the source of the timestamp data is overflow-safe.
> The legacy .pointer operation is retained in all drivers to ensure
> full backward compatibility.
> 
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Reviewed-by: David Li <dvdli@google.com>
> Reviewed-by: Miller Liang <millerliang@google.com>
> ---
>   sound/soc/codecs/cs47l15.c                    |  1 +
>   sound/soc/codecs/cs47l24.c                    |  1 +
>   sound/soc/codecs/cs47l35.c                    |  1 +
>   sound/soc/codecs/cs47l85.c                    |  1 +
>   sound/soc/codecs/cs47l90.c                    |  1 +
>   sound/soc/codecs/cs47l92.c                    |  1 +
>   sound/soc/codecs/wm5102.c                     |  1 +
>   sound/soc/codecs/wm5110.c                     |  1 +
>   sound/soc/codecs/wm_adsp.c                    | 53 +++++++++++++++----
>   sound/soc/codecs/wm_adsp.h                    |  3 ++
For these 10 files:
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

