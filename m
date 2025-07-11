Return-Path: <linux-arm-msm+bounces-64557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F23B01B48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC6B91C84155
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2285728AB03;
	Fri, 11 Jul 2025 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="im01OQgG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="j4ZvAGuT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F62175D47;
	Fri, 11 Jul 2025 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235072; cv=fail; b=TxM7F7wCFI3gVwKv2E26DOThuFRWY/Qi1RDQ2or6DiuZjJ+mVO1PBcO/9iiWhZ876Ovzir1q8X8/9NoG/ydaHH5zxevFQFKPY6aDbe5w8DUQAIPRugrdNmIWge7XK//dW5c4E6ycvOlqcRIvJsRbSmu97gReNfo0NwSt9VVqoc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235072; c=relaxed/simple;
	bh=rwve9LKcq+VmUNfdZsaysmrheBqGCS7SAAbGSJIGZm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+kyeifZ7z5hi91c+Md2vF4LHpTAgs0c06WqmvAqIuPkxfFUpdL4iWTkLMSf2KO4BwaqXC3/E0sc1s+82PmJOsXU6UGVFzAdAekYr8XZjD2CoZRxAg50lf834XVJn/Kbp8vToFzTZ4d/DYW5ScMGRnwiANB8ZdJNEwsrT+n1uZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=im01OQgG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=j4ZvAGuT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B5jANf028134;
	Fri, 11 Jul 2025 06:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=zHVw/+U99kmdZnxQQH
	nbwtjxEFmcpyu3cFVskZr4c0Y=; b=im01OQgGxyYNlwGbR0+j5rvjOlvLKN+HJs
	CRqL6NdtSegC7j5b3OHOHopnZek/d99ZeAMqAgzdPUg5Y6kAQN2KAlKOpDnxcszO
	KNKmNbhmuguL31F2/+0Rg7ICB0KQ5rHwv9AkZfIUUrzGky/wXHU39dOH66eH+ufh
	lG9ZUdnTVTGmiLkhjCtcz8qShRNUn6Z+BWTQDo6lcWuCAqoEzHEKUbGQrxSv3JBT
	uVdMDgx9a3+svHdr+7KuC4yEEj9CSwTmGi9xOnAQMhAlsfEQEyX33ZGITiJP+e3u
	CQ/tKbVhx8LVP28pb5seXsoUm46HvctF7RJpcVxvmCjToLSuitvg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2135.outbound.protection.outlook.com [40.107.93.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6e5p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 06:56:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/VW2deWFjd6GZ0kgvEJMnU9aCnKu7+EjB90LJjZ0hM/YHGtaGS0J9FU5fXnWfI6WB60ag+8BSocLx3Bn5sYAcVftVYq1xkjNcIO51UfTFBi+xHD7pTdXCxlVY7vC3oinGd1R8wamMj1KmTsey0OiW7hUbh8xiWtSuxWk1oMFuS1NEmn7xrwXo7TpVjKNyHq59p3XL9ktJh2JAuy8cmMmllpauiNUd4kuTVvJkkAuHKtDvcA6elb9W0or+LJv93jxzVyDIZw0UwFdNgCWTHpmQLYqlK5znkDCJxhuj0s1A4Jlm5bQ0kGG/4z9MjKO+2tELJePBThPGYSvtSTc1KyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHVw/+U99kmdZnxQQHnbwtjxEFmcpyu3cFVskZr4c0Y=;
 b=e3kKGSdkQ4mQh6iJgiyaq/bpXl5H2xQWopLXWoNuzxOwDWp0du0me2WbxHM/nj7xVw9LRm6WibWAzhqKMCQTF7VA+o1PQrRX2Gw7OrVk5CfA6a7oKe/PL0gots7IWiRfHZziqExa24GXDBSc8vtxFvcWdU3tDiOAZl/hRtM/rSKS2zrqWtYMbcHUNhptdYf2Fg8EeR2uf29GsdnbnALu3k/Cv5fnDJe747L9+kAuPJY24VxFhRSxH+zxy0u449My+b8JCrlh1SC7IgoGsXbkRqIIToWFPYWsNl+P7vDPSuSf1W9BQOXoS2kx6AkhTZ5JQfO4oMx1hLMMbgc098yBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHVw/+U99kmdZnxQQHnbwtjxEFmcpyu3cFVskZr4c0Y=;
 b=j4ZvAGuTTCCxZHFhLkfnNaBGaHwtwlssH8cYiloR3Y8KjHnIAfoJd1s69miyzMNQMoPRMUptp335B3lUu+wRrDYSZzxbR9tuValIh5BjPqpA1hRtQjtFdbdMgb9MYFuABJIxfkmBA/UXF000gLAZFg4GhZXhbBASkKSCBrGZLas=
Received: from BYAPR21CA0022.namprd21.prod.outlook.com (2603:10b6:a03:114::32)
 by LV1PR19MB8897.namprd19.prod.outlook.com (2603:10b6:408:2b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 11:56:52 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::5d) by BYAPR21CA0022.outlook.office365.com
 (2603:10b6:a03:114::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.9 via Frontend Transport; Fri,
 11 Jul 2025 11:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 11:56:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 63F9D406545;
	Fri, 11 Jul 2025 11:56:48 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3F1AF82024B;
	Fri, 11 Jul 2025 11:56:48 +0000 (UTC)
Date: Fri, 11 Jul 2025 12:56:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
        sound-open-firmware@alsa-project.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aHD7/9MZbcOmn+08@opensource.cirrus.com>
References: <20250711093636.28204-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711093636.28204-1-verhaegen@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|LV1PR19MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ef4809-919b-4612-fafd-08ddc072052f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ixqj/RRfamR4KpelTlhy2DKVx/+G8cGEhWekrNf1JNr4mUp2iTIQj5A4AJu9?=
 =?us-ascii?Q?UqVtDpyzhKPXFSF1yc2B9QbNJ9Vq0Mc8OYo2not+2r8aVxt5jbaEWvxOXO9b?=
 =?us-ascii?Q?XMnNcv8TjpCIGodundV20rIoASkXqpG2ua0TnSPYrhWggrQbDun9DVUUxQwS?=
 =?us-ascii?Q?n6TrQHY7fXrcDt6lGYzZsxIsoqBevONJVR+ByuO9ixNhKkxTmJXDS+3bHQ3T?=
 =?us-ascii?Q?o2uHlxvSZEU8jQ2E+JkZXNHS2Ewjf/Qy+xfZlK+j8NzjpUFyc/hf0i6p2Rz8?=
 =?us-ascii?Q?CDYW0QiVEukyA5bHf001ZBX7tmsusis0//tDE7KYjojro9Ldi/4qeg4nv1gX?=
 =?us-ascii?Q?wNmpoF5dyXw/oaAaGS2c506hJc2xjBzrv536EM8mJcpFW82ppR+fIXJN5JgO?=
 =?us-ascii?Q?LMffF4PMfdD1rEbMktQAw6Aq6Amy2dLsqSOVf1Tthl0QP7w1vEN3XWDO8mxZ?=
 =?us-ascii?Q?FgGKZyuTuvwE+iwucDdGrcCxR83JFN9/0/w54Bwgtf0cCgYNVeikNbE7FeB+?=
 =?us-ascii?Q?eRCzYGD5vbTKsJ0lTjCkkQSmpIaOkyvD8DvP0QfT5jxvRIU+vZslzRJYUzrp?=
 =?us-ascii?Q?2ZgGJlFMehJGEFEMaZVVYQGixlvSXkUqJxwaRXg+FjvwCyVNj1FQKYVse5v+?=
 =?us-ascii?Q?116pArKlGjt4aOI49KkXFC0eOrikvbdpmOIFI7PE+6nJ44mliPPIjArb7tPd?=
 =?us-ascii?Q?0SsPrprc2hhQmUVMZXRbzA+pZzi84yqu/B7fbk4rbWROwD/NGKgfnQzXxG1Y?=
 =?us-ascii?Q?axBoYIH7GA2AiffvVJPHz8TkZ1iy2reeDWEQqr8+tb77m85Wbr+YNO8dGiWT?=
 =?us-ascii?Q?g/SiRHS6Zk+taAQmflaXaeUgJ3BgUttBsg2sc2mX6G8IG2K5UOm1fjGF5oI6?=
 =?us-ascii?Q?iiX2zzqC/dX9ao830ztXdBtdSEsFfG1x7GzK4ZvWHsq88ShepNWc0a60ZA9T?=
 =?us-ascii?Q?zzscwrsdhjptoOcGPmFNo6dB/WOcVlTRiOYfAekBrUj30t5j9cLJRXvFFzUt?=
 =?us-ascii?Q?g0Tq5gq411mTEOC0B1wWocsKcyDmOn3pKYgx+Pum7sqnNzpGT/ApU7tfjDVn?=
 =?us-ascii?Q?VA8ExDI7bpkchbz0l9m3poICuVr7ev5264AF9TM+5NDqKj6YdyLPOSoPl94n?=
 =?us-ascii?Q?afG3XVxpkueilSOVNIiVTdCWxyu1bZa9oAHYUv4AbpH3HCrNLpFpsQiTIbP8?=
 =?us-ascii?Q?zFvEQBUM842rjXtxW8ism0hVcR47JmkMZGZiOg+uZzI6l5s/pQr2NuYv7qQk?=
 =?us-ascii?Q?yOmpxaFNF2YGhG1JQ3fEWddvtiNGnqnUAiocrKFvxOLPPxz7dd66z7bPuVRN?=
 =?us-ascii?Q?iJvQZmqtdrshueQRcgJg6D8MzKgOLWdChnGiKf7Y8ceVQ+k66Fpprgkp+wVF?=
 =?us-ascii?Q?VycFcG7qsa2CywR8sYq8slBROBbgewJx6LXSZ6tVSZLHUkzk3iuBkhIOtjld?=
 =?us-ascii?Q?GiYSo+sIXec3WFaXstl02lOgZ4mmvDSdZl1Ev8KF072NHF3LC3kWMkOdelfm?=
 =?us-ascii?Q?dfFaOtFRX8x8pzk0VisFzWW5kQT67jasQzK4?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 11:56:49.9035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ef4809-919b-4612-fafd-08ddc072052f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8897
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=6870fc0a cx=c_pps a=dGDOtd2Dv01GEEMIE2KOfQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=RWc_ulEos4gA:10 a=1XWaLZrsAAAA:8 a=yTA4N2hPbYLOA8DzoToA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NCBTYWx0ZWRfX+n+e0fnWYVTe nu/Zb8wOWpcWj8yuPBB7uxfu/DPei6WI8vZktclwP4glfQ4QoSBhPsZZUrWcruuq/078NgQaAJQ cDORMtaNuWlO9X6ajGJziF/9dLRLt0VktiieIcaK28A8zPHWc9t4P+Y5zFevUBD7DqJTUtM8sHh
 wNCW6gIsy3l4yF77w4JFPDF+FrUt1dLLIwyTbjAEIqUbpYJom2JwspqZfp6r68Mqi7Sm1r9fZ9t 8u4kRPLexwCKkYGfzUuMFvW9Rs3jMaWCAYdpRP/CAZ176BrByfe2ntZZPLsWKq7vhcVYSLH7VvH tuzQi/aUV+pA5EX2AEcZT1usMklI4QCKVEcYSejNbdNAYT8XFL7JZF9XTYMRpSdeBn79tCduGRj
 EqKdOPdSWOPFiXY5d1uK7XEY5+AhhdKqf16wVFDORklJ5CYk6eJFLKIQdcNnYyPYMyidNrkR
X-Proofpoint-ORIG-GUID: HxLCNpyoA4M4UyWffPvECUjWd08qTNGT
X-Proofpoint-GUID: HxLCNpyoA4M4UyWffPvECUjWd08qTNGT
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 11, 2025 at 10:36:26AM +0100, Joris Verhaegen wrote:
> The current compress offload timestamping API relies on
> struct snd_compr_tstamp, whose cumulative counters like
> copied_total are defined as __u32. On long-running high-resolution
> audio streams, these 32-bit counters can overflow,
> causing incorrect availability calculations.
> 
> This patch series introduces a parallel, 64-bit safe API to solve
> this problem while maintaining perfect backward compatibility with the
> existing UAPI. A new pointer64 operation and corresponding ioctls
> are added to allow the kernel to track counters using u64 and expose
> these full-width values to user-space.
> 
> The series is structured as follows:
> 
> Patch 1: Introduces the new internal pointer64 op, refactors the
> core logic to use it, and defines the new UAPI structs.
> 
> Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> 
> Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> 
> Patch 4: Implements the new .pointer64 operation in various ASoC
> drivers that support compress offload.
> 
> This series has been tested on a Pixel 9 device. All compress offload
> use cases, including long-running playback, were verified to work
> correctly with the new 64-bit API, and no regressions were observed
> when using the legacy API.
> 
> Thanks,
> Joris (George) Verhaegen
> 
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> 
> ---

Would it not be slightly simpler to just update all the in kernel
bits to use 64-bit and then only convert to 32-bit for the
existing 32-bit IOCTLs? Why do we need 32-bit callbacks into the
drivers for example?

Thanks,
Charles

