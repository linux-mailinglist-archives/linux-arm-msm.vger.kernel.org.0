Return-Path: <linux-arm-msm+bounces-72310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA39DB45B3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D53170FBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6130837426D;
	Fri,  5 Sep 2025 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SwDoVB61";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XHAhxQWG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9E306B3D;
	Fri,  5 Sep 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084135; cv=fail; b=X/5k6sSWZI+T1lb4h4fBCqDuk8YRx8fGlchtrZZgM5H19/Fn+XptHTjXK8+EnYb2H91YLpbfgbwubLpJiEXUqWweubgn8bQ9f/CCms38Qwawo2i+7cX6932ZC+okZ07Z80CDVyscRRR/HQtgaN3y+g91T4GCmPmpHeGxwUvww4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084135; c=relaxed/simple;
	bh=km9yTII+IQAr3pd0rLEGBUpkqvhh6BL8/qzqfsYGdjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROi2SLoQQ0MdxryFhk0Fm8Z0mt08oSVuZ1kzzWyxTj80nGWyrgXLHtcm0lh2/HypLVeknjrEp+kDMMWQFxhjPyEWQOdS8wnNLa5rlbgLdywdNGjO+8/Kh5c5pVDoBiuHVxs8/afl2wpLVEL66U8exP9NPt9y9Quh4wyHkIoeCK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SwDoVB61; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XHAhxQWG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 585EYYdg293708;
	Fri, 5 Sep 2025 09:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pnmpRQtMm4+bB1wVxc
	L6Njex5x817xHXnRnTQpSC9oE=; b=SwDoVB61eDdOfachLq2ILsguHlSgM7/FFz
	CxBvP0YrK0q3K3E/5zBvcvc5O0/G2R/cba9PQWjbebQl7ntzVXq6V6mdIdt+bpC+
	QwxQwra80IZej27pWwVlqOF52Ecqgw/UQtlPlUeFr2eo8w7P0WulqS4E+9DmiDFt
	0zKScCGBdL2/6xktRWdHI4rToMp0cIo+s18MDqpL0RqcYmmKYphCRatMT5MTOWmg
	xRrophmAbeGI7IxlcpuleScrXbH5SmWxUAc88JM4SGjJMA24hpQHFSH8QpHntCM1
	F1KOny3M68u1Tst9Xj18uzwtnUrUwV7KZAVyUYsumOCm9iH+JiIA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11hn2211.outbound.protection.outlook.com [52.100.171.211])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensftuv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:54:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2kfpM+2y6yLSw+ZGoilM0qUJtXrZALjqoihaML0vTdzIj5eOJLeKib2F/vxZrBtK79kde7setmQw+uc9NIDZzKnpESVIt276+B0lhUu7I7T8dLWe1cpdANJd1kWi3ktjkvo8WxCHAcjcmH1vKowJAvE2s+0oZliBjB50kfjABJCNEWLndDi1tYlpossc97q1H2sBybdRLvHeU2gSfNHYiq45KlGitAahexXV1180j4Uqszwbg+pUvuczA15nJbT82FUtVgo8INzNsBQB0INMdi9qGwMr3/J2u/hT98vJkzTX8vkFefwUWS36VmjWYBDTjPIGhBUVd8DtWR6TCCMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnmpRQtMm4+bB1wVxcL6Njex5x817xHXnRnTQpSC9oE=;
 b=vWHEaTuinnbUkdMjbjcHuAmg7ar+XCDp1byvBufL1+wygCKcRi014H7uuanKwdVq/Z2/9NTYexCRVJltTxJxCARJeOYyTqOmibouww83hwYolcjD0EmS1ut1XgdWDAeurCIi/5pFlXxPl3DK/Y1OPdzx30I7NwUDBubRluQj9OeSYWMhgny8DAxBK9sx7kPqegFhMo2kUaDjAo5llzwNy5MH0dig92ku65q8/mjx+5joV4G0S2vL6U/x78eAF9YjtxmPSOmDhuKSwvERMEErdUFVd2xX2ym3V5L3bMUhLAmT+fUjLV8F91o+uRFtqo4dViiNWZxicVpMC1s6elAmGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnmpRQtMm4+bB1wVxcL6Njex5x817xHXnRnTQpSC9oE=;
 b=XHAhxQWGdSxxSjoJuzExqoi0WqlpjPtcndPHj14y32M/e6jBSwL+tdJkeRjuJU0ozcZ2qYODqA1kbU/PqM2OO7OPrZhrumwhn+ArNBTVVRVeV41SDNj3OFEqv4byh1dY6FMr/ozVJwm6o/N3LEiKmboeo6HU3tpFcnGNroI72uo=
Received: from MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::22)
 by CY8PR19MB7129.namprd19.prod.outlook.com (2603:10b6:930:53::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 14:54:51 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::ed) by MW4P222CA0017.outlook.office365.com
 (2603:10b6:303:114::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 14:54:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:54:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5F41E406540;
	Fri,  5 Sep 2025 14:54:48 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 446AB820247;
	Fri,  5 Sep 2025 14:54:48 +0000 (UTC)
Date: Fri, 5 Sep 2025 15:54:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
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
Subject: Re: [PATCH v5 0/3] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aLr5t4c2H1mv7tkE@opensource.cirrus.com>
References: <20250905091301.2711705-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905091301.2711705-1-verhaegen@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CY8PR19MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b599e88-3308-44c5-4ebd-08ddec8c29e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|34020700016|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eL7URwXHEGx8tS0TDvy1fu6svM8D7EswZ3dnAF2G+E5F6HaDKqewNJ42oH3i?=
 =?us-ascii?Q?WwcsN4iBof47mS5c6vg/aK6caNXvlFmKZGzvpfbZh1EZ1Qq0eqZ/z/vmpIAU?=
 =?us-ascii?Q?KkfbBp5PIr++6BDO4jSJ4670D0ZW3Fy+kFZIIpk1X5M89uhLHq8NO0G5s+2t?=
 =?us-ascii?Q?mMn1AwaqPV347sM/pC78r+SYBhpKszAD/Ss+PGTSSGmfdDTythrBt5Olt/Yv?=
 =?us-ascii?Q?2YBkoaVQvQMI5gzms/tg3IFQtFwqRLk4WGV9sN5fQgIYsvLskR77T1cT2qtN?=
 =?us-ascii?Q?elM7DR3yyDhV4bZZIlsMp3bhqCmIZoNNhT8N3tkU/MRUbWrMPIAPwm2lxSqI?=
 =?us-ascii?Q?ZIUUMESLwW8+TKW+eO+t3+8zqW+EKl1EJ2PWPEZRZIU58G+hN0lb+UVM+tiZ?=
 =?us-ascii?Q?1uFNpNIAr2X3Chpmi7N9REQ1dFoA+UHPn/kjXu4u2EQGLyP4QnasrkkgCcl7?=
 =?us-ascii?Q?1RwuthqgWrq6/9idpwNncXFZ10NOnjpyLOIs4+lpUshjOkoLo+2OvrxPYrpg?=
 =?us-ascii?Q?b1X7LfWy4MKZRW/tCZzMdrlkVBFUjGXnSQvG8TMaZtXglKx950ZsXkK0Z86/?=
 =?us-ascii?Q?+3E+3+44rFtJoBHDiWwCBLXhDlqLF0aBV7aMfyQkfVYHLXHLvsIJk3RQJnR1?=
 =?us-ascii?Q?812+HAy6S2uZNQDZWy1Iy+nOSst5Qp5IRXfE/9+0SAdebwDjOHIgZncz/Stt?=
 =?us-ascii?Q?/MyHI6t61vB1SZDJ2zunFSmzeC0cO1HzXvKqc+5RQHY1ZgXfWtlGOYtoplbX?=
 =?us-ascii?Q?wxLxS9BTq70z5lEXsMvgHy7g36H9FsV72gDtuSMFHTvivwzF6yBK5Pxd/FQ6?=
 =?us-ascii?Q?6RQTzZjvjhOd1AqehdyZ6oKwGTuh5BxMmcYfiFcaqdvDCw+IIta1Yngv+dyZ?=
 =?us-ascii?Q?ycA1Byp090YbFPM7xSz0//ITn9PLYuCybaXSRBinOAzXMaZD4s3KSlGQbKpK?=
 =?us-ascii?Q?75y8NMZNMoxNqJ9EaFregnv6y+G0ltrDgtAmiKyqlesDIuOiv0HD6WDHb3C9?=
 =?us-ascii?Q?dnuWfZ+GskeP9YMrzKNPRRkifTksSNEhJU2A6CWwWk8NTnFLvcgzu/iNOgo7?=
 =?us-ascii?Q?L/+YRbZ6fqJ3NtKmLMDSDKQ1PAWwGAaES/hctbrvndREqCT4QlP0s/zPNDKb?=
 =?us-ascii?Q?YLpeD6+uYlkDUUDKn/y453MOytM/SLTZz0dE7zVkWBBe6ceKZzwvASVeCXIx?=
 =?us-ascii?Q?h4yU+kEfAaXXV+I5+WVF90MfRPdpZ9uo1yEEM0b7YF03LOrNkHe96Oq0r/uk?=
 =?us-ascii?Q?H6jgWPdeMQG2o5tAN8jkQS+ExeeBCe8jJ17scvzmG/yOVPnN/d75KCgvaFpL?=
 =?us-ascii?Q?AoDIGo0owZ/FMef4wO8HwpdwzRuEalsqxjDlJ0bopjucd04K9oBHeVY0JwXM?=
 =?us-ascii?Q?47L4qxJTIMP6Zv6G6hlzMiTFZ6v+gLcIWZDj4GaomznBgp2Zo+J8psd3AIhW?=
 =?us-ascii?Q?71iGSxyPAC3WxaYUdH+6Jum1RvW5q4DMVaCjl+Htn5y1QWj+cIqJbGqYD1iF?=
 =?us-ascii?Q?nc6285VSE/v/TEIHl9MWU+a2qtTWzlYbB14q?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(34020700016)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:54:49.5968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b599e88-3308-44c5-4ebd-08ddec8c29e5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7129
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0NCBTYWx0ZWRfXx82v3JwSVcnN
 F0BCS9Eifof9eS3I914AGBqv3r6KA3ZvHaUXdrDcy3h3qI+rlEnsWezdXoLOPsve1ykoii1qvwa
 ugbJXKJ51ILQ8oxx9wECEogCdp97MZ9vZzRRoLlpTBQZwWR9C8Wg5FtEYMqppSd62vYj8JFBPtT
 hvXEB9nh2MqtmHZHE4lwgIiKTmXee6Z2ibyIFLLgxGOsxgY98mjPtaIg3MdCfXMmHWfXutLIFbe
 RvSHux3aIeyo021052ixHAA4FTpN1O3SU6V0JBbaltXNJHnEU3Y5FQGFViwyWinwjA96m/Vxkd1
 4lOydXYwJSDc/+34AAqPjyXAo8DHoDUBhRRLdwi9qj5rzrLX0MDjU5DYlbJiqQ=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf9bf cx=c_pps
 a=YftmMNJ5qei3SrHiXj1U2A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=1XWaLZrsAAAA:8 a=w1d2syhTAAAA:8 a=CHjSlX_YXkE0Gg0bRwUA:9 a=CjuIK1q_8ugA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: zngGIG2T25IukiIUtz4WmJ1igNRK8VRR
X-Proofpoint-ORIG-GUID: zngGIG2T25IukiIUtz4WmJ1igNRK8VRR
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 05, 2025 at 10:12:53AM +0100, Joris Verhaegen wrote:
> The current compress offload timestamping API relies on struct
> snd_compr_tstamp, whose cumulative counters like copied_total are
> defined as __u32. On long-running high-resolution audio streams, these
> 32-bit counters can overflow, causing incorrect availability
> calculations.
> 
> This patch series transitions to a 64-bit safe API to solve the problem
> while maintaining perfect backward compatibility with the existing UAPI.
> The pointer operation is reworked to use a new timestamp struct with
> 64-bit fields for the cumulative counters, named snd_compr_tstamp64.
> ASoC drivers are updated to use the 64-bit structures. Corresponding
> ioctls are added to expose them to user-space.
> 
> The series is structured as follows:
> 
> Patch 1: Updates the pointer op, refactors the core logic and ASoC
> drivers to use it, and defines the new UAPI structs.
> 
> Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> 
> Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> 
> This series has been tested on a Pixel 9 device. All compress offload
> use cases, including long-running playback, were verified to work
> correctly with the new 64-bit API.
> 
> Thanks,
> Joris (George) Verhaegen
> 
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> 
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

