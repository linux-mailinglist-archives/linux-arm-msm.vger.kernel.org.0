Return-Path: <linux-arm-msm+bounces-63903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF75AFAF74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EB1C16DDDB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5584128D83C;
	Mon,  7 Jul 2025 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AZjGGtPi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bZkF/H/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F5A28D8DB;
	Mon,  7 Jul 2025 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879828; cv=fail; b=dTc89N/eCp/G6NZWcKfxip8ypwQMDy4ZWhr1NHP3ic8RoTEJPqLhEs97cdnV2m4+/aCsKtkOOxqCPiDFMiMpFMidhMcL6zeg7SdQqopMCDX7FjpERx0cb8cxC5t9E2CRMR3y7WrM6Y5XnEA6nsnQMyl6miYVc1NK35jk/Yi7WrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879828; c=relaxed/simple;
	bh=kwK3AScUKgXbbnNVqcFFnjL8vahyECBz1wU8Zcnh3sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnqQSse4g165ilYkLL1B5hB071OlYi8W2WVeveN712D3F3zlzCy/UrwPwUZkB6eEQPZxlVAfBJv58fSbiriHEdPRzPcO5VgATz3qGYGgBcrRQpR2yx8dB9UeAJnTNmoPoRc35yl7nkC2dnspuy3WJfz+4P+uhBNNPieqhQH0Png=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AZjGGtPi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bZkF/H/r; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5677Tbnl024506;
	Mon, 7 Jul 2025 04:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7wA98xjF5jWUhgLluk
	yJn6SxyMQ4WvvHAWWzK59u9u8=; b=AZjGGtPi/eft8LGqoJ+aLw4kCYIC0W8Yum
	iNhV6ZQgrMi7DTMPG17xaYw65iaO2SEyKVzoid+cxhLe5X9UcJl7gn5ijehIs+GQ
	Lg2/wSmeZNylQVxN325fd4d0NRsS3NZf7iY8tnSi7JJ6BiiFJOqIDcyxuuqWz26+
	m1cSz3l0iRlOZw+eQl8labyOYT9TnDOuxh709AzcgPLKC3Hnk6PBnVTXe3iBGoeM
	NL0Xy38IqD+/sB41Rs43sGN8wlQDrorFlaA0sv0gLgrg3vpAIjAo8JHf14Rn2REP
	hZY6dgPTQ8mn/AjRsYTpfZ5JiJCAIvZbxiZB4pa4T5UhYevvL6Xw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2115.outbound.protection.outlook.com [40.107.244.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47q1f3j0em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 04:16:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+0AusgOnoPHQHtadZGHeZ3kVrNu4P649V2vu8YRCqlPJFcHOuq1Ps8AxnS8WjBRW6HLkf7Mt5XIntpWGOSIcyKnhvkf7IAdTMhhqAvfYBE07ZCHEcANsdsARqrzPy4vicApyuDM6+IBOfsS6oc1oIT0/P0DPkD7nQhgsqpmPHoDNuxN9HrEZflDlLmh8jQcNSLD+pzOYad9t0Y2H3de9h5/z6YIbJar3JOnMdc5sgULEmOPGqA5NxSQci6gsuzwZoe5MWESjK2yjC3oU0P8ge09clJTBRAK/S/FGULJuCYFeXopcoHQoOVQFn6cukPAORtFF8X4JZYaISkVsI548Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wA98xjF5jWUhgLlukyJn6SxyMQ4WvvHAWWzK59u9u8=;
 b=WeWskOEWe98KSWY2zhFtRPYil7XPxJVvQ3iOf/8W13LA1VAl/5A2M3UTLKSXdVp+N2FrYkigcwCmwf/W5qOxNinP9bmJ7gkPpFjs4v/SuVR8ZC8MVsRS3ryOredE6WbbKwGaqvxAGKLODoBa4qf7S2xiRCLXaHlkRq7/XTDfGOoxWLrp6gsl7JRMGRvRvnubQu5+GFG8Rouq+SU3ekevGiMuJkXif71+DViowbUzY7zDvh0fc3213W6SnbfVzFn2JQZ4YIkLQc6lHWg+haJTG7P2jCUg1W6PcOI4iC8ZScE1AVWHv3CTDQxVhLDYZmfk2UIX2xvkUO99InDQ1Msnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wA98xjF5jWUhgLlukyJn6SxyMQ4WvvHAWWzK59u9u8=;
 b=bZkF/H/rkhPlhnusBzU762OVMiNyYP+PIXQ9XhIxxq8cehE+qJMCm/nga7JB+G7Xv+dAF5KyPYFZzd2hS3tHqN3XP8Pfa7LSJusFyKI52hX98c5jiFw8T7UUxVe2qJkbXv47YbWhL/u2Pigng+eyOtN3b52AMyLREkMpAhvU0oM=
Received: from SN7P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::27)
 by MW5PR19MB5506.namprd19.prod.outlook.com (2603:10b6:303:192::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Mon, 7 Jul
 2025 09:16:46 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::b6) by SN7P220CA0022.outlook.office365.com
 (2603:10b6:806:123::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 09:16:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 7 Jul 2025 09:16:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1F167406541;
	Mon,  7 Jul 2025 09:16:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F2CB582024B;
	Mon,  7 Jul 2025 09:16:42 +0000 (UTC)
Date: Mon, 7 Jul 2025 10:16:41 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 71/80] ASoC: codecs: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aGuQefpURWq/WFf1@opensource.cirrus.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075456.3222642-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075456.3222642-1-sakari.ailus@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|MW5PR19MB5506:EE_
X-MS-Office365-Filtering-Correlation-Id: 5444dbd7-d5c0-4b03-59c8-08ddbd36fe0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cMti6fjLhsdmbVSAJTApD6d9e2XSzqIGvpy4E4OKf7tKfhyvuNt+FpRCfy03?=
 =?us-ascii?Q?1AzWR5mPXgBdoq1H23TKJM7LIJ+RVlWF7Nq3f7yDAhP96nGAP3yhR5ilGWBL?=
 =?us-ascii?Q?2djucrQxi1/g6RgNwKEX7CYzUaT+IHcSRzx89ySaL0nd7F2NNZzVjSiZiwSN?=
 =?us-ascii?Q?Dfg+H7DtsepC2pRIuToxgqMlydFqF7cdU4SwxHAjT4QkOLUjbsHu73GxvAmO?=
 =?us-ascii?Q?Y/GJ0f98Luj5MvqR1WZ/RkRz+1RzmEHKSRImmFTFy2lO+9ZSRxMB8/FDrfn1?=
 =?us-ascii?Q?7vVwiH91742c8Uk7NNl0eI6N/Rphj9ng8rMXytMhAfZ9pWaBi/lZ4AzXnQpz?=
 =?us-ascii?Q?3aAY1cyhFG1U9Mj4gYRZ2l0HOIp+N2KEB77zGsBrqzWaSBDgNZF81psv6TeR?=
 =?us-ascii?Q?gAR+/mSN3zSH1iK0uAf9Pdt5LERnMSMEOtcI/MGh5lv/nr7ixoUOJlYYNdgh?=
 =?us-ascii?Q?COfwFVSeJAZ4gbUcq0WqA64Xokm1usZy6iOVtbv5RkZ+hMp6g8bs26pfc0oY?=
 =?us-ascii?Q?iyX34hQiBd2WV2MUqRPxDAIqilJjpew4TmTx72atGBilhOWPgIwn8xSVytaa?=
 =?us-ascii?Q?m6xOIKyHK05IYEN0ofZ6pvYZAnDxwVd4Ww8z0Sbo1jcp/hwd9cTjbGPx+iRI?=
 =?us-ascii?Q?51zukTjG8fKBM0FJaZoczfpcEKWEqyPHbrk96/tucYx6RaagYcGiRNcClr5D?=
 =?us-ascii?Q?Xx/VUmSexOFYHO2VmoSKWXsQ6QqVp+ivAC11HevfON0J9byMyM8fAlVQdtbP?=
 =?us-ascii?Q?9YwAa763YiHgeDeeMji9Q9jkXBIEFgRLvDZNJY67dHy+DxgNdyDaIkmOsqE+?=
 =?us-ascii?Q?6ceyozvEApRMGxSwEn+D10RZ4nnJuan+mYw/CJZAJP3uI3S0egVdOrTsAct1?=
 =?us-ascii?Q?xJ6TQUI97QtN1O860olaw78vQlWnNLQ/RpX33JC+HrKOGi+JPLiVAlUb3J4Y?=
 =?us-ascii?Q?d79wt6L5k3NmXfJb7rP+wRD6CnIiLeYh07Qh/Uq4jc0PS2aB4JCq1BuB+7Wy?=
 =?us-ascii?Q?ose/yPE+J0taiBY2j0MRNGiOScC3HHmf2qstxL5dCNgkkUDGQ113Aoy+MPWt?=
 =?us-ascii?Q?RUBgWtKcqVbLVbnP7VrUfgdddEWCjn57skbvw0Ye5Rcliat9sj9a1eRoKBD3?=
 =?us-ascii?Q?bEI6D0vSnYMCHbQZCmCinIIT4XMZ2QMySA/R+VW56mjQDWzyZfQ89zBneyXY?=
 =?us-ascii?Q?gCG1bvT/KkSRNSdpzvkFaytRuq3Tfo/PikZUta9JIvuwCYTAGynZTSXR84yh?=
 =?us-ascii?Q?QUTI9oaCus6ct88nWFMhjeh6ft9ABUjahOHWsMleXndvN6Ol2ptasfZTCXOL?=
 =?us-ascii?Q?3HY+DdKFugFcOITaYlBT+6+VPZiAzfDgwGQqEHDDmV+yI93FCepIcYA/2ljZ?=
 =?us-ascii?Q?qfK3JflfYdw9bq3ou+W0uO1UWxRkF0+lrRRDesxkP/MAJpq+8ZhNOYlNvxK6?=
 =?us-ascii?Q?AGQhMcSjNX6IlVKJTBDOXLmoS5Zo86fTeXtvdIqiGWr28+ExIjlgjpYuuEK6?=
 =?us-ascii?Q?epqOOK/kmO00caTz69Wm7cnC6q0oTKT7C/TB?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 09:16:44.1827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5444dbd7-d5c0-4b03-59c8-08ddbd36fe0c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR19MB5506
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MyBTYWx0ZWRfX/qDoqVFF47uh Ia0VOJ41AW7KEwo89rn9kdCGA5f3aAwafeohzuab53dHtfP/Nr9/efXgFgOdSeIOybl1HfZLOve g9XZYI9Pg7PGbJe0txkQSRJoV52rKdNUXyQ0ZHysXLyEIEX3diJCez5ebof+65gxcbJIr4PQClp
 SZc1KVCiB+nTx35cKBfbeQDSVo4621Qa0QWPw9IDD7bWvMIuHJxMmublZA5BIMsTTa7k+Hyecw+ HgFfTMEW6U8jVCIeonWZqW1KSsaevT9yedoq+cykuhkwYJ4GYGLcXtOrUagbuoABBZKK/EDPzdQ AHsxa/icKQIdDe2/Nzvm4Gj2fMu4sHEVuq0u6nj8yeYrlxEOv2piF8YpqKW0rANTUCVNUwjHDPH
 4dBvrlezmemzFXGC88ljZ1ksC8bG76X083Zd+qKmu3NmYo8e1IO9FAs8PMMRCftAsVceC30A
X-Proofpoint-GUID: 4irWisAegthHmkzU-ozRm9nxRHjtNCRX
X-Proofpoint-ORIG-GUID: 4irWisAegthHmkzU-ozRm9nxRHjtNCRX
X-Authority-Analysis: v=2.4 cv=YNafyQGx c=1 sm=1 tr=0 ts=686b9081 cx=c_pps a=CPDyn8ho2KF1l7cSkvawzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=QXuSEnVgnoAJZhOi9yIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 04, 2025 at 10:54:56AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  sound/soc/codecs/arizona-jack.c    | 2 --
>  sound/soc/codecs/cs35l41.c         | 2 --
>  sound/soc/codecs/cs35l45.c         | 1 -
>  sound/soc/codecs/cs35l56-sdw.c     | 1 -
>  sound/soc/codecs/cs35l56.c         | 1 -
>  sound/soc/codecs/cs42l42.c         | 1 -
>  sound/soc/codecs/cs42l43-jack.c    | 5 -----
>  sound/soc/codecs/cs42l43.c         | 2 --
>  sound/soc/codecs/cs48l32.c         | 1 -

For the Cirrus/Wolfson bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

