Return-Path: <linux-arm-msm+bounces-78058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75217BF3090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456E84240E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6865A2D4B4B;
	Mon, 20 Oct 2025 18:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rFkY9KBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95B2C3774;
	Mon, 20 Oct 2025 18:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986352; cv=fail; b=UG6yHRLT3CR4fzIxtFTqvtksfWLdXTXX22j6NxARr8B4m9d3btxNp9qVZPrBwQ4tUWqCGAcM6wx6EBBEgXsluX+dX3OMPWmclZrwcMY68K0PVQ4vZM7Aa0Srh2RHup8+80bB8Gvv9sJy5jb+jQjvRBPiOH3Jbi3c6oz4P2Sws70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986352; c=relaxed/simple;
	bh=ZUVVwHS33WeOlscVWLw5dvGQNvxaqsdJW1bDAMN4UtA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2QfQHYziYIAO41Fiv2Y+vbXNpys5/5DI2VC/XlLqf24ysWWa5IrVqgRsLeRJfYhfKN0TCedr9b6aINYR9OcAXZ4a6fDVihJUgf6omL8g5i30UK0TwgzV7BZ7XF6AkYwNOQ/VQxlwWdn2CDsNu2u68jtcreUX/YUTQeYx3VxqEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rFkY9KBl; arc=fail smtp.client-ip=52.101.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg8UvY5w+uvcS+Mq9u+DPa06LYFvJ70EPKhcHMiO4u3wpha2KdmtpHRDgzZJ2JNIAddPfzOORYXKl2uBD+xsJv8MBvRCqyD0n5TWHLyh3kdRlPhCLn3jM5b/obgzXAH1045HA9Q7BqkGKP7nKSdbWbXFY0MUGuj2TryrCxXYqE4dReCpWUh9vp+ciQqvJXLVZ86lcCNC1oLa2vAFQYQBgYaAOwuf7qZLeqSwdu3yoLgf2tJ76oil8zbEwTq4AnBBblGr98Qb+QFIu7OH8DvNYARRFrps1du4SYchWHU352CgM2JIgQBVIRDBnnNg6g4pqJUku6LVREl+lxph/XfQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq7MnGqYrePh9wEPS49LBx3k3CGPL+8NjS9qiJdkxZU=;
 b=fEF7GuEZIegZas+rwA1v5WSyYmiDaXYOPTJCK9lYbeZreNMCFSBeXkZ0+y8LjGstF4SKz3k8eP286Fr0TaJyENeRHyaH/jGHP3Q1zOC0UH64GZFCiVabmac2AmpWYmm0eQhVLCpppLbCoZeF/pj7LNI+LQsgg1yX8SqJmhmbwnHpFWjKV2Gn5Fnsq5suG33FBZJdJhMwmiXSKOZm6kZjimnqK+A8wTNtm4vNFvCFFLl6bYQCNcNVWJAldTReKamXxUFg057l9uppYcTSTJpMBB8VNvIhazhNmIasF19PUO1Xwnonsrms95/6p+LHRoC1hNW/KxzGMR3TQ1CpeR+pHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=csie.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bq7MnGqYrePh9wEPS49LBx3k3CGPL+8NjS9qiJdkxZU=;
 b=rFkY9KBlCvF9ETSLsOI91XkloxyNtGQXv8mWih5Mg8qLh/U7TWpDcFJ2WMwWRT0zbNe3ut9ooQ/MuI76vgZGrsMz1SUp2x32lWsAdKjzomxZeaN8+AH5SButHQUp0TXBKolsp6Q7NNsovOTKvsryTeqnddvx7p0m/rLRP9QB/8DCSgX5kj+RGIE+3sQQBz8Im13imvuf0YqI9f/pNM7kSBAeZgz8nvGaXT9RJBpRLoqnSL4NPr5qq0iQyjGVnITsWb46dC4y0+yeIQ/IpWkKwZz9ccznQuDXO4+CwNx5MM43poyBjBcXtiPB+h5BiMaRBI0d8vA406hJTS5bvIf4LQ==
Received: from BN9PR03CA0545.namprd03.prod.outlook.com (2603:10b6:408:138::10)
 by SA3PR12MB9199.namprd12.prod.outlook.com (2603:10b6:806:398::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:52:26 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::10) by BN9PR03CA0545.outlook.office365.com
 (2603:10b6:408:138::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 18:52:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Mon, 20 Oct 2025 18:52:25 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 20 Oct
 2025 11:51:52 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 11:51:52 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 11:51:50 -0700
Date: Mon, 20 Oct 2025 11:51:49 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <joro@8bytes.org>, <kevin.tian@intel.com>,
	<suravee.suthikulpanit@amd.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<sven@kernel.org>, <j@jannau.net>, <jean-philippe@linaro.org>,
	<robin.clark@oss.qualcomm.com>, <dwmw2@infradead.org>,
	<baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <schnelle@linux.ibm.com>, <mjrosato@linux.ibm.com>,
	<wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <patches@lists.linux.dev>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <aPaExVobV9evs22n@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <20251020162736.GW316284@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020162736.GW316284@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SA3PR12MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fd7eb8-9221-4580-ad1b-08de1009cf5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WVN2xFLk0Qx25KrBBAYUc9WgRk50kq3NanZTLGyj9vCDuJVEvJCfAZPwXFdF?=
 =?us-ascii?Q?7g8KTwT8e+fGS1Jok+uw7ByrlORU7TVaBBzcus6Pfok6TRxbYFdt14n9RUA0?=
 =?us-ascii?Q?FoOGk5ndpsvYd2dHvzq7Zi7tY8NtV0HDxPzAtRebWAlColeP1cKzgmS1L3T7?=
 =?us-ascii?Q?s+I5l5BbVETq+xv6Xg2/G/Q6VkdSDM6An65283S+Ku7KDr+UzSG24hAyyaTE?=
 =?us-ascii?Q?yS45V9sPosBQ8Xsnql0mq6qsnFiWBI6MA0q9tbn3n5QkT1NBm2yuqNLwLIh7?=
 =?us-ascii?Q?hKEidWy3avC6AvSEuUcaVtzTMzahOK3ADzWBHZKN0V02hfoE9M01zsalZ9wl?=
 =?us-ascii?Q?lxkDczTVXQYDDBGwld5ZekzHm0m/houaRMxl2k5gN2Lmo/7N32hQs+2ZzhN8?=
 =?us-ascii?Q?IfEzgYzbi0xBXGqNknaa9SGRRbPudFIHmx6KGWUXE/U8DfV6JKk0+2gE+Kbg?=
 =?us-ascii?Q?GaqzMQbXVw8Z5m4J2Hu8XSTlDBlV8fa8W1UaynVAJ9LByvSQkgaA/nyRa41I?=
 =?us-ascii?Q?HHBlAdm0E0hCve74Wy78HjOFnbK8t0XOqyqvFPragLPklxdIgMfsPOzh0wGQ?=
 =?us-ascii?Q?QS9KQGmmjWFCnMt38njJP63tYASqNJinpy3o8lzkZ5cTq2tV75CVezxH+tpv?=
 =?us-ascii?Q?egllim0dRt+HZwum3Duk1jIFKoYVv6FvpVoRCMC20zlNxwVJ6JnVp/oP7Aqn?=
 =?us-ascii?Q?d+7f7evFeM/iSX1ctBAOOLZM9p9KEHA322F+E6hFIcyqA58V7kvQ4BEpvlYk?=
 =?us-ascii?Q?kwUkPG1lCp+DzfK1wAudlms0R053ovT2yRmeuVtpMVwBqT2GUApWxMN37zRr?=
 =?us-ascii?Q?f3niJEZ/KRnYfm+3AA/Is5iuknaHeeIEWTl2KFl8dx0RrvQeWZa02X/brblt?=
 =?us-ascii?Q?pIx6KekIrYeNhJEHzooqrCZf9Hy1urC1ia2ilirNAoKewdJDy6AIAW/eCKxd?=
 =?us-ascii?Q?RFGY+a9wy4Gxcn582I4u5AkcU7KJpAYcsAgHhgzGR5+7ocS57yvKI9EckgjN?=
 =?us-ascii?Q?ikJAlFMYe/b7219owtymEEGGMv1M4niAQ1THGUnRWip7+7Kb5J5s7VvZ4zUr?=
 =?us-ascii?Q?S2sZn+1kiqr9/gPy1EDWPUIzDvS7Lcevj6nk3h3mlK2r0jrS7N1j+IOSI0av?=
 =?us-ascii?Q?CraGqRdLEVG8RkgnluVWxO1S1q90tPX4LGkF24vlj8EEETcUq5JPbrUD16fp?=
 =?us-ascii?Q?pfeG73oCBF9b0klbKzWQeOwOYujPXNJp/JDL3rNTYI1kvwyWenmgs1SFUT+b?=
 =?us-ascii?Q?aDhRDXUkgAwmU9RXGIioUELRMt7Djw4dnCRBV1PvEGeWssJn4q9wRzoqgYyV?=
 =?us-ascii?Q?a1KE8y4e8/mgDvA7x3FlarkVc3ScPHfDPS8cHUWUVGZjXRKjneinlhzrDlL/?=
 =?us-ascii?Q?b0UYKmr33p4t317QAwmckaOYfRtURuA7O35R4/GSYUTxFVmRJxEpZHm17EUs?=
 =?us-ascii?Q?NGuOpwocYG+lfVHzV70JuznStbNr4aDN0Lv0x1bOa9erfvAXqzxccygHX7gQ?=
 =?us-ascii?Q?haltcVdaqCkDB38zbNDWitnq+sIzlcP52ShaEflwrwtqc+B/TsENcXIvsRKx?=
 =?us-ascii?Q?Hf+fR3IMQZDPQ8muJDU=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:52:25.0808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fd7eb8-9221-4580-ad1b-08de1009cf5f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9199

On Mon, Oct 20, 2025 at 01:27:36PM -0300, Jason Gunthorpe wrote:
> On Sun, Oct 12, 2025 at 05:04:59PM -0700, Nicolin Chen wrote:
> 
> > And keep them within the group->mutex, so drivers can simply move all the
> > sanity and compatibility tests from their attach_dev callbacks to the new
> > test_dev callbacks without concerning about a race condition.
> 
> I'm not sure about this.. For the problem we are trying to solve this
> would be racy as the test would be done and the group mutex
> unlocked. Then later it will be re-tested and attached.

Oh right, we'll have to retest in iommu_dev_reset_done(). I missed
that.

> > @@ -751,6 +760,8 @@ struct iommu_ops {
> >   * @free: Release the domain after use.
> >   */
> >  struct iommu_domain_ops {
> > +	int (*test_dev)(struct iommu_domain *domain, struct device *dev,
> > +			ioasid_t pasid, struct iommu_domain *old);
> 
> Because of the starting remark I'm skeptical that old should be
> included here.

Hmm, the followings functions sanitizes "old":
 - qcom_iommu_identity_attach() drivers/iommu/arm/arm-smmu/qcom_iommu.c
 - iommu_sva_set_dev_pasid() in drivers/iommu/amd/pasid.c

Thanks
Nicolin

