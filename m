Return-Path: <linux-arm-msm+bounces-69587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D6B2A9DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 16:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B3786880E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E110B3218B1;
	Mon, 18 Aug 2025 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pCxCwk2Y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ECoj1Lue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F050321455;
	Mon, 18 Aug 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525997; cv=fail; b=HGGranP15qb3IaCgefh9/mvxm251C1quEFsOIlDXmOLSzWgl5FjkiM4c73I7/6G31mbqJXuW5CyhaGvq3fRWE0AIjhW1Gcf18o1TCcOgYZew3mYqS3Fud64AsEJirOfD1mSWvvHH2PMpX2IcTT/1nkl9r/pLrxJcIsNmVzsfIEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525997; c=relaxed/simple;
	bh=7AXZ0lqeYEkO5a2So8eGpS41RUEE1BMjDryvVMqxOfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCvArqHsKGUmruOgfIYh9RDHlaOgDu7QbyKnO9UohrCJTdGL0fBvCfGtrVBIBhkmcmDiPclbnCGrkuZUg/fwa+uVhNQiesD9YpAR5vl0FGtw2EXeGEP8WqhNd+pCta7TRK97L1bEtExO3Pci6Rq9aHKtDQKjY/t2wHX7/w+m6bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pCxCwk2Y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ECoj1Lue; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57HMI8Y14063630;
	Mon, 18 Aug 2025 09:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=XTmdlRXKzNgBNR6uf7
	t9Fr6UadagR1wDnlEvMPNXJLI=; b=pCxCwk2YvOC0NkC8O3GKPBBkCkyvML8ryn
	3h+vI3F7dZxt6mkvNY/Asnu19RXJ3XYjnHjCJBJgyPVd3sV2VrJ3J3xmvHWFWZYi
	S6NJC+oYIsMBt8Nb4yuK/nmsUlWAdKFUJN9q20s9k0RAjd7LoIvDTbiNNh05AsDI
	4XQJl4Q3scxVSkVrrdgtzD3WUd+Kb10O5wN+tsMg88QTxVSxxCxRY8wekUzF2pva
	GCkQ5lJNXjL43exxT2L2ycOdAH3gpBFVYotRrKTxJ4L1lgiCV0OF2qOP6ZudnOZB
	R0KzSRExaVKjHkdK6FGqCrSy0vDk0CRO6SNQtCklteheAk0xZz2A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2112.outbound.protection.outlook.com [40.107.243.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48jpdf26x1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 09:05:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ovz/tMB7GHqfqrrSSeq5/I+IpzzoQ1R3h8qYw/p6+UOTW1Yb9uHUrFigJYBZS12JYVUPtZuhNTWTtwCfWSu5exU1wGzivXrhWndCZDy3M1WwYmX/eg9A8heexZa6mp8bCRKilcGn0eXkchaZ7D1S/GpWKun4IutCc2uPeIzAa0qa7YfsZCfxvySoF3TCnHyQUf4/wyqw1AfzZAxikluu9eWAQxUkr/GkuPKolhkPBIccp7kfHikY7ByJWrgrvRETwbA0tY7HMHkHUhuK+OGde98oBj+WGZuARXAqQ3yXCLsI8rrBI5bExCIRO/o6mkujT8fSC487K890AsYYwnlK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTmdlRXKzNgBNR6uf7t9Fr6UadagR1wDnlEvMPNXJLI=;
 b=rKApiMamOyADVCRORfcHZdi3m5Mx9dFaVTgls4hnyn5Hz5H35IiRtLduocScXMJJ+H1mOTFAeTPDZ9GVnB3nSlJPxitocLADVIbs7Qt+qu2J2pw41jLsbehsFAikyvdFrTzTJCeOh/UM1IIzCLgsMVC4cpoxQEpgKYg/lf7V+83VuJ2OJiXMAJJfyWmhx+tmCw9hGTxnmHiv3weqzS67WLg/aViX9Ftm1KmTr+2qjG4NiCHKTPgjX4WgO1Ae6Ha3n8EGwojcc3Ds0q4/6OCSnuNpJmoAmtstr0ujGPpMJj+F/ENHd/DlJxQrbqz7SpNbe2NYgLeOfHlFtTp19QW+2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTmdlRXKzNgBNR6uf7t9Fr6UadagR1wDnlEvMPNXJLI=;
 b=ECoj1Lue6BE5ZtgTSu2FsKL/CoV92uaql37IlwS2gvBmosXZdr/fIxDY7Hh3BTPB2+eCJ6n0zAmEYGlh2U/nm0gXC7y1Y3/tdqtCg9R7AQa7I+KWfChUC+bDzNb3kluU3o9pO/q/RNGr5cMpDCDg4uOEUoadJrr9FxMp8DG+OvQ=
Received: from BN9P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::23)
 by DS0PR19MB7672.namprd19.prod.outlook.com (2603:10b6:8:f5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Mon, 18 Aug 2025 14:05:27 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::1a) by BN9P222CA0018.outlook.office365.com
 (2603:10b6:408:10c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Mon,
 18 Aug 2025 14:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Mon, 18 Aug 2025 14:05:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 774FC406541;
	Mon, 18 Aug 2025 14:05:24 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 540E8820249;
	Mon, 18 Aug 2025 14:05:24 +0000 (UTC)
Date: Mon, 18 Aug 2025 15:05:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Vinod Koul <vkoul@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
        linux-arm-kernel@lists.infradead.org,
        Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add
 SNDRV_COMPRESS_TSTAMP64 ioctl
Message-ID: <aKMzGRzeRqkOwTNS@opensource.cirrus.com>
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com>
 <aJGM2zXS6hOLDFm1@vaman>
 <87h5ym1f75.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5ym1f75.wl-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|DS0PR19MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc95920-789c-4600-78f3-08ddde6047b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hpwh0oshuvXD25/YJWAIO+shVDZxyQzXgOVK/uXi52uDWtiTyKu7a1H4lOb4?=
 =?us-ascii?Q?3Pslwaq3bcr6+9Y9vGQM9MD6heEir8ws9LxSeYq1qlWF7y4T5eC4/qeoBZtZ?=
 =?us-ascii?Q?nY7RSykJEgW/strWNIoS8J1ivnH0CTpSJMEF1c84IfC91ZaA4qgyp7LLcXSx?=
 =?us-ascii?Q?UNQzT/r/2WKLii5Bi+V4VqpO3aJ0GOzIQWPcQRCZyhtW7N0m0mOF4Wl13WjZ?=
 =?us-ascii?Q?TrCJ/04a+Wr8kygQl8t3VsmHbcDVr/6DWLtigWga/+cx+vQ6iZgx/iIRcRjk?=
 =?us-ascii?Q?7pXnXOk/EIHcc68Oz+maQra6ocW2DFWVynCLVXpZshxFwKJwtKuPFs++AypJ?=
 =?us-ascii?Q?/HVkLUpD3J7HzzegllARR3JE9GwdIm7FubiWGRIyn56M1FmsR1xLAe1APmcG?=
 =?us-ascii?Q?Y/pLE1nmio9ku1YUUH+s3VWQQlrMcCnXuojv01Dm1RDilkNjKLaviSW0pY/T?=
 =?us-ascii?Q?zLW0nA/S/tuwwIS2sBPjBsGFNChmEjOKuEIdgM7pYhdx5i4BSCZvQa+04tYS?=
 =?us-ascii?Q?ekF9Fv0epvDfRXYJi8+wNxAPGoXBsn04Kxi+wm7KMMeXGghrvq7WJfY3lsBW?=
 =?us-ascii?Q?Iof7GJXVa4TlE3y5ouCUjzf4Tx6Jbzw/Oz9C/2MvJE8gfgM/Z/i9q/2ot9i6?=
 =?us-ascii?Q?fq1pjN8So1PbVnykBTr8hpd1r0dZD5n2uu8O3V3alJGbMYkQ7MKIxwJ4ieBM?=
 =?us-ascii?Q?3O2p9+fpLayTOOxzJmF/YaedmHmNqd2E/PrZmC89Qrmmx7uPORNPNyk7kt79?=
 =?us-ascii?Q?5N7AVw+89MJdNwVa76BHkI8x432R4viHzB2SL7iWlTH5z0Jf3AABnPyFLLFW?=
 =?us-ascii?Q?b6TftG9eQ2HduZvMIy3cch8zHiCNZTTIcXCMOCB8J9s60BRG7A0IeY6Sgr0r?=
 =?us-ascii?Q?CPA4cfkqZEs6XN7ijbaFm+DsJDjSF7gEWLhvCbYR9oJJtwXNDsQivYH+Gt6c?=
 =?us-ascii?Q?6DrW5g6HERVvpkYDbXW51Ad/aK/wg07msTu5Vrj3SQaVAEfsq0WwU8yRYd0I?=
 =?us-ascii?Q?CIvT+ucMG8K55oVgSlvnROkMmzMM8T598sM8Hm8BTXw23IpsOsB5aenkHzSC?=
 =?us-ascii?Q?6QYlmVuy2+j+mkSfVV198QYPxHay1CUSRkxO8l2oPGoszHQ2q+ZvjernO6yG?=
 =?us-ascii?Q?CFxLcB7B3YnWDLWD5a7jEAu997AaObw+kGXgNNExrqDU2Wh9a3LRPYe4Cd9H?=
 =?us-ascii?Q?tUxkUhj1nLDlcdjqSTrO+JK21dfETAA9/pHypcqn6LFXVLCEqDIFbL9W4Vws?=
 =?us-ascii?Q?l8daWNovsct1oyclV4BfBqy7x60YDDJFzMUB0fR6oUMCIMJxWStqReA1qkAe?=
 =?us-ascii?Q?j7cdqm7irjeiawqT1x3DbpDc90G4O3I1W9ciAe+jn5rAmns68KbtQ5PPre6K?=
 =?us-ascii?Q?emMd8iskzJOUMICMTv3qnTBfHflcBZhtKE0tSkiO7MmuZIq6QLYcwFEXM/Eq?=
 =?us-ascii?Q?ncsg5FL6N6WTtzWWAGdSyDc0eM1zXffw96+tWJWA9ZYsqGQ4+tIIarDMOuvI?=
 =?us-ascii?Q?nNutPCrOJDeco0btEgq3TbHMBQ4EmMnZDzCJ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 14:05:25.5383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc95920-789c-4600-78f3-08ddde6047b2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7672
X-Proofpoint-ORIG-GUID: E2muHiCgN9mB1FDfVm5_hqZ8CS7BLBNL
X-Authority-Analysis: v=2.4 cv=ZJbXmW7b c=1 sm=1 tr=0 ts=68a3332a cx=c_pps
 a=+PpozFyv/4R/82JvxB1TJw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=dpYL2l9-0U5vaeJkK0AA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: E2muHiCgN9mB1FDfVm5_hqZ8CS7BLBNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzNSBTYWx0ZWRfX/HARxNU8mOwl
 RCD/zByHwBGJVvXwteNMCtremm894dwRyTLetGVhl0nbYuAkNB+6tHrhILfCBXD0jn+++4lnZTY
 80l6RTJp9KVf9B24n90dWtZXNyRiLMMvnLjhvOmKbwSJh+/edOcXDmWGyu/ZkRqrp/X+ppYGHjp
 UezD9SkOGxUCm2E7uxmN3C96IVb2tT1C7kYDqBrO7unazb9qg1ENoXpVrRiMhE5GEly/xzKah+b
 zJnNfttA8k9b0pDehg2jdu2efdbx+X47+CqICvamEj1NhcKbFs0rvD8NNueVnfyvyqcxJZHLB+3
 jqG4N7NdTkTmT/nDq+fXpIQdue1VxbJKCXjxDFEjvybFDZTN8K4rV77V51A82w=
X-Proofpoint-Spam-Reason: safe

On Tue, Aug 05, 2025 at 07:59:42AM +0200, Takashi Iwai wrote:
> On Tue, 05 Aug 2025 06:47:59 +0200,
> Vinod Koul wrote:
> > On 01-08-25, 10:27, Joris Verhaegen wrote:
> > >  	ret = snd_compr_update_tstamp(stream, &tstamp64);
> > >  	if (ret == 0) {
> > > -		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > > -		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> > > -				   &tstamp32, sizeof(tstamp32)) ?
> > > +		if (is_32bit) {
> > > +			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > > +			copy_from = &tstamp32;
> > > +			copy_size = sizeof(tstamp32);
> > > +		}
> > 
> > Most of the applications and people would be 32bit right now and we
> > expect this to progressively change, but then this imposes a penalty as
> > default path is 64 bit, since we expect this ioctl to be called very
> > frequently, should we do this optimization for 64bit here?
> 
> Through a quick glance over the patch, I don't think you'll hit the
> significant performance loss.  It's merely a few bytes of extra copies
> before copy_to_user(), after all.  But, of course, it'd be more
> convincing if anyone can test and give the actual numbers.
> 

I am inclined to agree the impact should be very minimal and the
only alternative is a more complex implementation. I would vote
for leaving this as is.

Thanks,
Charles

