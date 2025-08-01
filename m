Return-Path: <linux-arm-msm+bounces-67333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9717B17FD5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C316D7AD9E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9A820E030;
	Fri,  1 Aug 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BD4tFKOc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oG/IeJu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF382E36FF;
	Fri,  1 Aug 2025 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042421; cv=fail; b=CaJcKa3EPx3gw8nulaD6l86e5Lha5LjDSn6EXnhUgFRRCB8R+Wjq6GsOqLAdfqJ5M/evIkwuHP14VHId9Or8Ct2byWyERM3rbacM0Ff2bR5porqr99Y66voRr33qFkk5d3shjdad9ykeZx4o3eIZ7jzFKSl+DBdXyFevG/2CPbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042421; c=relaxed/simple;
	bh=CNmU3IF9j74zzMuv2FSGXXarTkZt+Sxp1giJEPj6wzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7k8O3gYjSQOES8KFsWAVpw/ijnrWUVldyXczZ+KSylrOyjSxBFqOD6HVVydgCCV4jLuXgchZFl+HdVRsSNiQ8k10Y45G6e9O8hgEx4XJvvDGDc2eufom70kuhVYkE2hkBGMoA5vH1ydZr2qxOrN5TajChhs0SEblVkobvvQ2gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BD4tFKOc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oG/IeJu+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719Q2tU028955;
	Fri, 1 Aug 2025 04:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sTARMsS32SGlplJ4Kf
	i/hZPQa+yM1yt/K3K4gvXkwO0=; b=BD4tFKOc1umoDpZDaoBLL1jz7+PY0kKqNr
	U1HBgZh+SgIrgKD7cOmy70oySrUQnSOaHY3hKfEKXJD4B1ixjAIoeYYtcZG4B3k0
	rePiaytFf6AoKSE9nQ7gFjSAmU30SOOTd29xqmF26NYKDwjgQK4MHyGey4r+7mzO
	3uI1nB1ypjE3q4DFptFtNbfQ8XRbiHyc8XKz1BdZlPWGJ9NXQbx5jsqKLH34ueIJ
	ZFfX6I7oCT73oXrK1RU5T55OsLkyqTpV01daF/VHatK8DCSDfUfRkYnHXpZ/OyX/
	YPvL2XtejCdJOjUm5C59jklqwdxRJ8Z+6/KXjLdyAe/PAUKxAHug==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2120.outbound.protection.outlook.com [40.107.94.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 484ueg07jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 04:59:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJtMKgKoNBiubrd3ccLVn7N3iCPysExp+jGeUwC2IEVn3Q2QHOd0kXTz12SNafeALIpiHFXmVz+WzOoCMCsi9E+chzienVbV2AhoR9zcqP9f8iyhhOh6k4mD51TmePpezOrZmw11cRo27S3C4okFquxcvmGVdVC53e9w//SKcrirjXI001dsZX4Ep/FjqTBqp9EuQKnmlOlHTiQYJ5W9LB+v2RPItTlAp+fY7DyyqmlEAB8OvecDqVAnyUXHgMSUAEd3N/8j5ZCq7lm83wtIEVpNJxTeHmaVONeWW2n3QAVN1LgxB2AnHpdsKypqYCgi4z6paa9xaZbNObQaNZzHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTARMsS32SGlplJ4Kfi/hZPQa+yM1yt/K3K4gvXkwO0=;
 b=TsChNq5khiabV5nBEDVanRhqpdsqz+B0SrQCIIseqzlPhFGH+zTjGSFr7z3tCeLkDH8VCok0a/EFp5cY7/rHQvhpPgIXlIDrPCviptFyxeRGIiL8mdrxtMMO6+HBEjkGHeeCGo+grUW1FjVPqSFA4WMgm6cRmDEpQJzQy+jPy1VfDbKV353dipI//yjrfaR/qU6g1cjr3uoMI+D9AZE7mmEAzp83HV9BkggotBnbmXpVGy0knzshgLXzcWLbILjObn4lhcw4gRDfrVWp0n/HtQOGo9QfbTgCWXln+RCgh/26X0d93lqfzktz5BerpfS6AaHy6Zg4n5n34wBd1RPzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTARMsS32SGlplJ4Kfi/hZPQa+yM1yt/K3K4gvXkwO0=;
 b=oG/IeJu+OGw4kYLEmT3NgBZ0qZXdmIZfRnG7KYU2ib82jwjtYn3eqRBZ6aAu2b8ygRoGfPsv3l1bt09oKEd109z1NUGv3gjCYfyfsP8tpaaFHyGYAIifebmF8e0UdJiKdBhSr8nLve8hWhx+4EcZVzRBcLTqW8gbdIVjtPtZRX4=
Received: from BYAPR02CA0055.namprd02.prod.outlook.com (2603:10b6:a03:54::32)
 by DS7PR19MB4455.namprd19.prod.outlook.com (2603:10b6:5:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.5; Fri, 1 Aug
 2025 09:59:22 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:a03:54:cafe::3b) by BYAPR02CA0055.outlook.office365.com
 (2603:10b6:a03:54::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 09:59:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.0
 via Frontend Transport; Fri, 1 Aug 2025 09:59:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A51A8406547;
	Fri,  1 Aug 2025 09:59:19 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 80A0C820244;
	Fri,  1 Aug 2025 09:59:19 +0000 (UTC)
Date: Fri, 1 Aug 2025 10:59:18 +0100
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
Subject: Re: [PATCH v4 0/3] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aIyP9u0ASJUUPToB@opensource.cirrus.com>
References: <20250801092720.1845282-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801092720.1845282-1-verhaegen@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|DS7PR19MB4455:EE_
X-MS-Office365-Filtering-Correlation-Id: 7934eb85-ee21-4b63-8e2f-08ddd0e21668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+i+WSdGZ445H2BC681HLW+SIe1ZLOGmRLZhHsGv+G0uLJ1APolE1tlxW+iQq?=
 =?us-ascii?Q?yzqIojJakgrcnPRxa+pdUZvTEV3VHoIpQus30V4L56FDWTbUwx5UK58MmSKI?=
 =?us-ascii?Q?9JnmqlC4F8R8dMIYlS4VPHYlJvpjnXOhaXN13akr1fhHgsKLFH6KR1oSkkr2?=
 =?us-ascii?Q?Y19fDmVDgckZKzF15zGVFzwjsNcIeYj6eQ1e2tnk0huEKtypCG9cwZb+E2cU?=
 =?us-ascii?Q?Uktz16SOfFx4aoKD/Pg2aph8fREFkX+2MlSBhYLj0sI5UL72+243N4UmkOTu?=
 =?us-ascii?Q?D65FM/CbvXEKQ1JpTAV1wjXmHyDzh8pwhG/vEUq6sIzv06xh5LXP9ePP3fxi?=
 =?us-ascii?Q?ZCt6hX596ocULU5sy/HZPaGV66HBqK1f7fzifcE+5z/GgJFqONt4AF8SKChg?=
 =?us-ascii?Q?ucEZtoRxjbJrRAxKFJ4BM1n4PpF5y5JIskYUPmL9I00N6K0LWZ0XWG1dgu24?=
 =?us-ascii?Q?3x5s+OfK77dSCBU9nh7TnrCcyE19ehygeJFgPHXQJE3OMmMT+XFQSsiwbxSc?=
 =?us-ascii?Q?Sjjy7PtNnAfTvYKbw/qrVYD8zacJPxZ+dZ1SeHzamoeSL1A+Gc12cNdEYmXZ?=
 =?us-ascii?Q?Ikr8RUNRojWLV5dla9NPAKabXeMJGXEO9hYPGXBzFEkMMbccBPzGIV+FkqId?=
 =?us-ascii?Q?1QQUsH6wmGkzQ1ELQbC5k5we5yhGgmC9ASltLVQRUoK/VMI/n4wLfscrGyPJ?=
 =?us-ascii?Q?R4fH3iiCdBVEADeU7kd378pp1nj/qOMUbt4/FaGlS+2+BgxRM16MaLR3L0Dq?=
 =?us-ascii?Q?X+vPeZNWet0zahUwE5L+nifpc5p0HiuuQl3TU7I1lKMMOQKePilvMUI4iqGM?=
 =?us-ascii?Q?WlTPhhqeqtickVPYcKVxvrSXiYzRl+nwmFXgdMPJjXY5I3F4sG5RwBaY369T?=
 =?us-ascii?Q?ANMxGgoDyBwuMvKpo3sShjWKGgcxHNQedD73jhDFgQA67WuC2sEzn0vVplzT?=
 =?us-ascii?Q?hsjuH5Pt0kzkdrVuoGA+L7w7YH0vVERpT/JBbW7rsDBVsj4n0ED0QZOlrs+X?=
 =?us-ascii?Q?O56IkSrWuSaN6bEMV55ZjhMdsjzUiwiaCdU86E38FVeT5T0lb8+q4d3W5TIT?=
 =?us-ascii?Q?Y5A7tQq6iRTLMUozrwcLIQgzQIAE4V5ScCXrc9QHuGE1PuZeDMyktCKXLRdU?=
 =?us-ascii?Q?h+G7icpnTY7unsq6YG0HclCLbCqdlWmxA+46qGUDv7sZaAMx/WTYK0cYp9Tz?=
 =?us-ascii?Q?ZBOgz7F8Uhc1HtJAkFqW+WXaBfbZu6FAPm25KbFbvE26vy7emH4gItHnxI3M?=
 =?us-ascii?Q?uaPpk32NZIIBLfnC/YZw+idDNsYx4Nn3PjYLj4CsXEiZyJncyHvC1mTIBPrr?=
 =?us-ascii?Q?GTxKNK5WLf1bkG0Kq5Fdpl0SrT6FAilpxCggzQMpMjKxox5jrqBjTtGiEXhy?=
 =?us-ascii?Q?6gSGq8ns69FCRMlJBykffTezlqreji0vCfoc0CdKItUA3b2tqZsA0FY57n6j?=
 =?us-ascii?Q?xcm0EfJBvyYhr4ftqXFx2CbhFUTMiUNH2WznAFzsPNZ++n3JRi8KGOG+8KV1?=
 =?us-ascii?Q?H9V0B8XIZR6eTIkcoS8OX/66YNE3kA2yVIuI?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 09:59:21.0343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7934eb85-ee21-4b63-8e2f-08ddd0e21668
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4455
X-Proofpoint-GUID: bHUUuEHv2JsDMk3VJGlSzySdC7P3tO0w
X-Proofpoint-ORIG-GUID: bHUUuEHv2JsDMk3VJGlSzySdC7P3tO0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDA3MSBTYWx0ZWRfX0sF6zQhJZlVg F/WMsV2RPy4H6aV8+JSJb90l1NjD16NOw/SFHZvtd7oFyn9v1fQhmbr00zeRCl3CZ3tuFIKzI5q yrzjUIYYAWefREbXAJn0h7nTuD+XmHuNJZMjjdXk0ITGjGsbNN4C1KosnREkdv+ng6oonb9Tq6i
 yid+Khsq5xRZP3qsmwjGpFqzzxgcU9rh95bUny2GaFDFEzeH75UdzrRs4sMX/XtI3rIW7fEn+cr 9f4q08H0YbbFW7OiAphbY6jMcrXmQaK8Go5feRZYUzUtMpO2/qSNiHdriblIzUOtRfx4U5EAj7x LxZ22FsJ3nuzi0puQ7Gjbc13Tftx2tqHUCn+inMiOkLn3mzn74tLwBrNUmzZesHWT/Z//uqrHn2 N/2pvNdO
X-Authority-Analysis: v=2.4 cv=OdKYDgTY c=1 sm=1 tr=0 ts=688c8ffe cx=c_pps a=sEwf21bbMNMW6iOsV/dM2g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=1XWaLZrsAAAA:8 a=w1d2syhTAAAA:8 a=KwO0Y2ZaRY3UfMHnQbAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Aug 01, 2025 at 10:27:13AM +0100, Joris Verhaegen wrote:
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

Think it all looks good to me:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

