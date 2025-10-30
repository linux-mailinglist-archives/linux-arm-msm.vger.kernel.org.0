Return-Path: <linux-arm-msm+bounces-79761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0AC220A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 20:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1B43B5313
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4951F304BBA;
	Thu, 30 Oct 2025 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n636A038"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1030276E;
	Thu, 30 Oct 2025 19:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853467; cv=fail; b=kYaBDv746/rBKtL5dCBk8RPAUsMfW4Q6HJoPG1AU5XNs94RwT6lDa42hZHp176MjjhYIEjtCOV4gm+EbIKqtT7dGb/Ol51j+OfiIdhybkqWoNvBnrUXRGEUqrTuL8/1SMp+1DpLyu6Y29xIgvQ5g3wVN9PfdHjdjohxfI4uMHOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853467; c=relaxed/simple;
	bh=km3IrBxS0fDii0DFfWD2ce+QuN+G5cMYAHhB1XNP5VU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgxK53mYuXNyEv71W8ZJrarmzppS9Q3jx/DgGzI14ABBhTFFKhi2vQKthjco51XtaF425Rfvdfm5Vmp3zId4xC3V/apKyeBcqFeA0y2QrakR2HkaLLc2j6lYWPt1g6pXLUn8tHj35CHXk/8Fo/oNM06/efE//WaO1l0h7v3HqCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n636A038; arc=fail smtp.client-ip=40.107.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIt9Al490i85L/oS8knO96IcmdOLqGL6rKZpVgdB3eYlm3PO01plIwtpJB/974p69qzQ6OFV+E/i8oQGd1AqtUJxSNUk4RIlcWIlamGj+5ez+jsynQrLvS2YFbTB4FMuqNFOMau4VsWXD/jtvEshD8cBHvWYcqEQcvXS4WL0Nm0VMNdm6uTUJuMT7r+jc3cR2N72Z8DSs9UtD70bBcc8Vbes+Fo997dMo4Q1W1xT1S/MXY2zynGJbsTyX7n55c6m2Xf0NoGkpzCbpqsida021exIo9KvHtHHq+Ym49m6P9u3UyyeEaqijqUDD5+5E4yBReFYkewa+anhf4YyErvA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvqEx1G2ygyvTN3lLDG32I0dvexEIahM9G3t/0OYeS8=;
 b=FawP3FyzvIxNVh/0d5o5G7gK5f0eAL+L45k6jMGLpYVyBCVwaocmr9C5ry+hNVfmUZldU2SPY5nlqdZwkM3PjOTEuMfjx2DfYsz0GItDSj6rQWGUoSElynzdk5pNwLvk18A0GulLjJqXKrv/+/KOAn2OYsyZ2FKz7R2M9yaDKf16xO8GWLrMzl7ZxtPsx+mwh710e3sybSU7dIBXtL7HiOVYDo1ReVJECn8SOmVd2X8+3MW2XsJpYloFkxgLqw1MI4/z+kc6I6lplg61dQGrt+RjtfSE30FfI2PB9p0y5qf3D4zXfpQ4L0V3xcOuE7kqb6gBJwgj6TVs+UklWq2HGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvqEx1G2ygyvTN3lLDG32I0dvexEIahM9G3t/0OYeS8=;
 b=n636A038RwCuAU+b0PzE9Od2AG9Ue5KZ+Q6m2/9T5vbIjK543e/0nboc3Vo0EpB3Dhp3qfSfO2j1o0in8PaY9iI3xLC80AvDeks/2iweUpRVgXDezvqexfhOfis3Z5tvdahDGjqOLnxAlK/HrB5vrqpdur9Y6zPiO/+E82Zi6jkAsimFm9nV01k4GJjePTWB29EBf21QQxgigtCVsgHCCuiXYzWQuzz2z4vwBaWeMco6S2hwQ37upYP2L7VKgdXRMd8mDjxxOoKjUVDd69jvUTPv1PKRzwmq2LIiPDmOyUyx+TkkaYXCcnreHlq1OrciN9lG161pNe4QnNzSMuTsZA==
Received: from BN9PR03CA0769.namprd03.prod.outlook.com (2603:10b6:408:13a::24)
 by SJ0PR12MB6968.namprd12.prod.outlook.com (2603:10b6:a03:47b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 19:44:21 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::85) by BN9PR03CA0769.outlook.office365.com
 (2603:10b6:408:13a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 19:44:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 30 Oct 2025 19:44:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 12:44:03 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 12:44:03 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Oct 2025 12:44:01 -0700
Date: Thu, 30 Oct 2025 12:43:59 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "joro@8bytes.org" <joro@8bytes.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "sven@kernel.org" <sven@kernel.org>, "j@jannau.net"
	<j@jannau.net>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>, "yong.wu@mediatek.com" <yong.wu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "tjeznach@rivosinc.com"
	<tjeznach@rivosinc.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "heiko@sntech.de" <heiko@sntech.de>,
	"schnelle@linux.ibm.com" <schnelle@linux.ibm.com>, "mjrosato@linux.ibm.com"
	<mjrosato@linux.ibm.com>, "wens@csie.org" <wens@csie.org>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "samuel@sholland.org"
	<samuel@sholland.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <aQO//+6/B/WbdK2h@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <BN9PR11MB5276D10BD480FE66881870B08CFBA@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276D10BD480FE66881870B08CFBA@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SJ0PR12MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: fc59e19b-660d-4245-4f39-08de17ecb8cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?coK9pFakNqZRASNqG9fe3/gaEPZb8DlHiclo4EwaWEkWZAKKl8GlJNWz4wrR?=
 =?us-ascii?Q?zr6ViIzANRUVty7P99UfaFiscK6nLpr28ZYfvN+3ieH8u5EU0PlZdzTG/Afy?=
 =?us-ascii?Q?9HtkE76k8HFPo2wEF7vzBuNyCHWwLVui7AE1MCsT0DFS+ERvONEuzQyaJKeu?=
 =?us-ascii?Q?9lsMlb89vAivBHTVROLFdkCFPOvoUSk3ulS9U8LWkKCQNQbw9FCgoB/Dps5M?=
 =?us-ascii?Q?aSc0meAcs1ZuPZyhpdcD/2P/yGkpqUSNKm7timTw822b4HHBlezHDD6xtKBO?=
 =?us-ascii?Q?d9cVxKl88MNbGNqrOGCyV9o9GhJHxC7ldYqicslM9TQpw6gpM2ugh5z/IST4?=
 =?us-ascii?Q?S69EL6HnJjEztdEhfXopBiRbSVZT0m3aCX9Vj1f6D8iHzlroOvHMCmwJ+QSz?=
 =?us-ascii?Q?DmBPTmC6NuhTH38HAsU54abx43pd1jp1VM5AOtne09fvdzKaghdvuPkAkCPM?=
 =?us-ascii?Q?XO4yeMOTS21GC4MSKdXnteGNrh9SHqFFSPzkgGoK3qlAap8V6VzLD7FfUTvd?=
 =?us-ascii?Q?wGukH/5GQqklCtNw2se3iLpyJKq+yhh/p7x1Oh7DAaUwQLwQjjhn9VveSwuH?=
 =?us-ascii?Q?1857KxQeN3PTGK5vwLoSrc36xZnaKV4Y1NGZGq/RjhokDp3qKYTmVDAsvgrQ?=
 =?us-ascii?Q?F9JiGn9dj0FwWNOA1FmjZ6CaW5rwKM3RmtGlxJRwyjQi0/hVnrPvDiAqanBy?=
 =?us-ascii?Q?IXO0TNdS7RqvcbpeG2KKyNlC7QAI6CzO02EXM7dKamonTcYhzhYuzDcQtKEh?=
 =?us-ascii?Q?MM8FIwAQOnhXCNkPS+hEANX/WJ5fjurKBYbHr8dv6l9WzKD2cEEuByaP2FNP?=
 =?us-ascii?Q?s2HH/3fYRVASoag9C6ZsoJ+XquGxFVd5/qX7dnt3t0fECWt1C+Ei616YPRLr?=
 =?us-ascii?Q?tCdTAEMsMQaTW3hQnA2bqdbA7OoKoPNeXlogC4psRj66SNa+kAm5zqbHVlAi?=
 =?us-ascii?Q?0HRRGi1rUlrR6/yNkXFnD2xOcaNv4yJBvpab7GMpJovLEyDLQYKREvxpVTWU?=
 =?us-ascii?Q?siryXShKBvANj84uEopBeG28/O+oT0AkYNFwm0l7ALhI5ybfgQ2jk51pSONe?=
 =?us-ascii?Q?3gZQR/E3Ztarm+j92prFSIn/R5b4n3BN4OmlQyyhuQcEkNKv1sN9oebOlAmx?=
 =?us-ascii?Q?loHctz0qkAx71sLMMkvs95YDc5KPTmYQnJ762Jq+UMRFjAFT4iT82Jri1FTv?=
 =?us-ascii?Q?XA2/NI6euISdRqATCUafc/tZMdbnkVUEAF65vDqv9wJJpu99o6lC975E2Wp+?=
 =?us-ascii?Q?vGXluXdS0JBIshFii2XnCUAHDPFAC021nPCiN1b4AcYRo6YMdx2qysYqlich?=
 =?us-ascii?Q?8jvJHA1MxtV9ktf1E3pTn4J1eyHyjAp/nOAEUN2xHLRpyz7/sXAgrvbyYWfz?=
 =?us-ascii?Q?dRHUAURlBpSrw+12M00B+tqMj30axKiQHXpCE1E3y5CHcMF0TbXep0yd55ee?=
 =?us-ascii?Q?r86P+evwtILnuGLvonMgKy7l9L06kp/9dmgrUZKiE3jjzuQiGM/md/q6pG3G?=
 =?us-ascii?Q?PiXfZGRB1lHNUfpK3AQPB7bmpLA7+uqbGm9u7Q32CqbsvkZb8YdYUUhFXKpH?=
 =?us-ascii?Q?lcz3iGBIFP3flMEcEyQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 19:44:21.1890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc59e19b-660d-4245-4f39-08de17ecb8cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6968

On Thu, Oct 30, 2025 at 08:47:18AM +0000, Tian, Kevin wrote:
> It might need more work to meet this requirement. e.g. after patch4
> I could still spot other errors easily in the attach path:
> 
> intel_iommu_attach_device()
>   iopf_for_domain_set()
>     intel_iommu_enable_iopf():
> 
>         if (!info->pri_enabled)
>                 return -ENODEV;

Yea, I missed that.

> intel_iommu_attach_device()
>   dmar_domain_attach_device()
>     domain_attach_iommu():
>       
>        curr = xa_cmpxchg(&domain->iommu_array, iommu->seq_id,
>                           NULL, info, GFP_KERNEL);
>         if (curr) {
>                 ret = xa_err(curr) ? : -EBUSY;
>                 goto err_clear;
>         }

There is actually an xa_load() in this function:

	curr = xa_load(&domain->iommu_array, iommu->seq_id);
	if (curr) {
		curr->refcnt++;
		kfree(info);
		return 0;
	}

	[...]

	info->refcnt	= 1;
	info->did	= num;
	info->iommu	= iommu;
	curr = xa_cmpxchg(&domain->iommu_array, iommu->seq_id,
			  NULL, info, GFP_KERNEL);
	if (curr) {
		ret = xa_err(curr) ? : -EBUSY;
		goto err_clear;
	}

It seems that this xa_cmpxchg could be just xa_store()?

> intel_iommu_attach_device()
>   dmar_domain_attach_device()
>     domain_setup_first_level()
>       __domain_setup_first_level()
>         intel_pasid_setup_first_level():

Yea. There are a few others in the track also..

>         pte = intel_pasid_get_entry(dev, pasid);
>         if (!pte) {
>                 spin_unlock(&iommu->lock);
>                 return -ENODEV;
>         }
> 
>         if (pasid_pte_is_present(pte)) {
>                 spin_unlock(&iommu->lock);
>                 return -EBUSY;
>         }

Hmm, this is fenced by iommu->lock and can race with !attach_dev
callbacks. It might be difficult to shift these to test_dev..

> On the other hand, how do we communicate whatever errors returned
> by attach_dev in the reset_done path back to userspace? As noted above
> resource allocation failures could still occur in attach_dev, but userspace
> may think the requested attach in middle of a reset has succeeded as
> long as it passes the test_dev check.

That's a legit point. Jason pointed out that we would end up with
some inconsistency between driver and core as well, at the SMMUv3
patch. So, this test_dev doesn't seemingly solve our problem very
well..

> Does it work better to block the attaching process upon ongoing reset
> and wake it up later upon reset_done to resume attach?

Yea, I think returning -EBUSY would be the simplest solution like
we did in the previous version.

But the concern is that VF might not be aware of a PF reset, so it
can still race an attachment, which would be -EBUSY as well. Then,
if its driver doesn't retry/defer the attach, this might break it?

FWIW, I am thinking of another design based on Jason's remarks:
https://lore.kernel.org/linux-iommu/aQBopHFub8wyQh5C@Asurada-Nvidia/

So, instead of core initiating the round trip between the blocking
domain and group->domain, it forwards dev_reset_prepare/done to the
driver where it does a low-level attachment that wouldn't fail:
  For SMMUv3, it's an STE update.
  For intel_iommu, it seems to be the context table update?

Then, any concurrent would be allowed to carry on to go through all
the compatibility/sanity checks as usual, but it would bypass the
final step: STE or context table update.

Thanks
Nicolin

