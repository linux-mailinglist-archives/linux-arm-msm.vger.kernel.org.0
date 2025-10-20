Return-Path: <linux-arm-msm+bounces-78061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74544BF3546
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 22:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 071D1480407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9CB2DC782;
	Mon, 20 Oct 2025 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GS8VtLn7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0B21C695;
	Mon, 20 Oct 2025 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990921; cv=fail; b=mjjPoKSfuR/kwPEVwD0D+ZhK6eSyzafnSK4ldrdXyuFFNPowMWE16gjfnCrKECuZD95+XSu+XWZJhpz9PqzB9Mr6nCMzdcOiTDb5FrNrFkFrMCCo62KPaiPUsVdPb2NiT1sIa/erCZbJ2nkNT3/flZn80uBkkQWAIlcZRIhGYks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990921; c=relaxed/simple;
	bh=6nbxM7PGrI0xTdoh6ri1TWuYYjvTspQ/CZ1rmisWugY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRzJ4hc8edR7RVPveka7TEEj9IsEQIjMmNhAm6Wo8rhI8kgeXvNovdPOUYko3zY5B3Bw7/qdlISWl7Gx1KDneFIn0QzyfsZguF4yvueEmVzp0idoNvkeBMh1iLD8KajSaOxNo35WJ15YZoCnBx9g6FD3nTgLGOPIQGVkIbOhiKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GS8VtLn7; arc=fail smtp.client-ip=52.101.52.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpSVWL4Bt4KXJapkoKbrlcZo09uiK4RWOl/9L7ryEw96Edq87/Xhwm+xfAMJAMdSBq8TzYPnIGZCu1h9nHreQiRNZCNU41JdyDXJ45JZ3itFSV8OzQRwsqUecM5H7Hs+TNJE8JyTJUQv6RHeRXrKVaTjABey8IdCZXhtAJO4AbPzRDDv3oSfTujU0VGbOBZ0EI2KkIe1uv8+MhFl0Yvb4vD30zZESeZbnT/MqW6sfkc1mqXG7/0ORrHI4HkAtbUZKXHhKruhoaLUH+RjFYMR9DEGhLKqIGw/KQmPTf/xjj5oiQ1IktVfmRJm45bFUe8L+ljOxu8q2wJTSvUbFGn3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+HcKg5I0iYSOa1cv7EeGcGCX9FLTiflIci0SQNbuDY=;
 b=w0h7/Nr6spa5wBxG499qj5EXLFSe/Adpq/4Wsp2POZuSRUUNQ1IAjH5ovTgYVqxPejN/1SMF63X/7dREwIuUMxI8nTzbrZ90ceFLMUdmRbhNqlZRE9GdQkNSV5b9va13cfkwcMRcSGQSFPt7yHXovTPHmsBJp0TL/KuIJxMGoprs5AnSDsGBiReL8Cx+E/a7BZq27G0l+D7P84y+n07QtebNTqrgt5caiXnr5ue71cQKXU5Gk2XIZAP7kOaoSeOAzjmYO4hEbwadpmACkl5nQqSr+KxnFKASNyrN+e7eNIO1WMEakd+Mh4qCD7bL57LDlL8SYprkrCtZotNC1R5Y5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=csie.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+HcKg5I0iYSOa1cv7EeGcGCX9FLTiflIci0SQNbuDY=;
 b=GS8VtLn7kcdkLkQu+tgHMtDvdeKIZwvbkfufMIru24+xOX/HUxl97EUPEzfC32yJ6RHGx5IMfpOSvFWT1Cq+I6LzIohHPu2vSsGo9a4ATJC/8KLtQVDHSTD9WZRGlZ7cAHh7z4zDPohfbSHMgtPgg6rgnp34GaaLzWKINHWhq09ubZmh3MA1w1J3yZ+xczxmXZcZjBkoSsjT4OgLNSMCYs4AVa9gxGJlKf2GpJEmd1Btdlkuew9vOo4N0xy66TjB5RF0seDIhmszKsYiM23+jXOQOgFnWZGsO3od2ipi4+jo7Furf+2/tCNkxUV98S7UULHndERu2uj2o8z66Qg8cA==
Received: from CH0PR08CA0001.namprd08.prod.outlook.com (2603:10b6:610:33::6)
 by DS4PR12MB9609.namprd12.prod.outlook.com (2603:10b6:8:278::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 20:08:36 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::a9) by CH0PR08CA0001.outlook.office365.com
 (2603:10b6:610:33::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 20:08:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Mon, 20 Oct 2025 20:08:36 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 20 Oct
 2025 13:08:20 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 20 Oct 2025 13:08:19 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 13:08:17 -0700
Date: Mon, 20 Oct 2025 13:08:16 -0700
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
Subject: Re: [PATCH v1 03/20] iommu/arm-smmu-v3: Implement
 arm_smmu_domain_test_dev
Message-ID: <aPaWsEg1Y3XqsA3E@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <f52e8079148a673641d2858700c49fa0c81022aa.1760312725.git.nicolinc@nvidia.com>
 <20251020163231.GX316284@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020163231.GX316284@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|DS4PR12MB9609:EE_
X-MS-Office365-Filtering-Correlation-Id: b913b544-cf62-471b-b882-08de101473c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F3eAErrdRFBP8Xc5NHf5q6RpFXZy1wb9kVOirYNRpE7PMh7br7u24qD1hl3h?=
 =?us-ascii?Q?/mUBsSCHBxSCffcpLmh0DCLpRRd6rW8HEyKp0u/Q99CJ7ggK8jL1V2oUdkyI?=
 =?us-ascii?Q?YNWmNgRlF70yR24cTL1tEJWXPYawD6orOCB4NdCTqfQ6YC/fwCIK8UORffKp?=
 =?us-ascii?Q?q75+PGsHG52OmM1jGMVkaZ6RR9fgl83IBRXCoOtoqEtXCiw9Le/CBNfnOfQ1?=
 =?us-ascii?Q?kVlMVssrGF6wMUGDbxHi4iuEdFnUhXwdgVXeALDGayQuwzFSOfG6tGe7IHoz?=
 =?us-ascii?Q?RARz4PjAWoimxGcYqYJuq4vxYRzTtL0XNCqqSoMPvSYntmbR7KzXzwSCg0RI?=
 =?us-ascii?Q?7BHgl/P8BX8LZD3YdFzLvWOiXMy8QtL4XqkHKjQ+wtV/2/HDWWyvfVdThCEF?=
 =?us-ascii?Q?mEYs24HKqtUgrYFAeVmkoQa1Y6jThw/+TeCikZQbjGeOrgKYcj6f2/F4F93P?=
 =?us-ascii?Q?lDH3pd1+LAsHgCyLEUJkT+0gmieMd121YZJOy5Bd/j7dPomgbnOyg8XFf2Mk?=
 =?us-ascii?Q?KtgYGaTcuCBB4k6NdtLD3B9Z/yljpc5ipbQcO8E+SDRTUqQTuad20XXrGbnC?=
 =?us-ascii?Q?cDSeZfdcaZWl1B+Sqbud/b0w9A1/bLSgYc3QpAhcEMqMyfQTbroppE+1maQg?=
 =?us-ascii?Q?W+VVkLsXm8xUQOZrSJju4INOMt7QyV/Jwm/s/P+jaPVbsR5vAwuoT7UTNAg1?=
 =?us-ascii?Q?pQHpReA279OCbXsDZ8Rnw83JwizocsKRllV5hb24bioum4GnMI59K0JSguXT?=
 =?us-ascii?Q?6IZjRKeBc94KaUcoOvRgpFR3xbqPeaaeZg0WMuMOS7Su8G+eoFH33oXqynsf?=
 =?us-ascii?Q?LAYqRXPS6F1mxG0SqOELxss7r/ci79ei0Sjh3mc4CCkF4Q6kZuU0gzLlnpln?=
 =?us-ascii?Q?gqh4ve8bikLKfvVChvHqbUCMKECugsMcozft3wn1Z2U4J81qqn1WcM1a1HKL?=
 =?us-ascii?Q?6YV2pW+nd8tsTkYk5f5lY5hexcNY255JsnZmDz7eCFSubMRjHFKOKmBzwRcI?=
 =?us-ascii?Q?cGsFbeWuMGKEc4YE9Ee5ijAxky24LmLSWwSYcwTgvuEv6cNnZuLZvOmLSBU1?=
 =?us-ascii?Q?O8u+AUaNWTqJ+hjZOSo3xm6K++mzMKxEe2zeB/su0v0xA7hetrQKlOhCfR5p?=
 =?us-ascii?Q?B49sEgGqf+qHYQjwPNmS88+67rveT7p63hgJjuvLvbI9+/mPQhIz8cOaaTFe?=
 =?us-ascii?Q?Nq95xU/Eu7Qub9nfR3wpNgkQREEK19dvCtJ+zdp5+HkimCmPsIbJsUztE2tK?=
 =?us-ascii?Q?IkNCh6Yi8ohUR3u+qfZ3GQiTrpC2qeEouuPkb02WOQ+h6m6KHFrR0lEMI+C+?=
 =?us-ascii?Q?GDl/y8vVulIodb6asSM+UzfC88BeuSpomTFvHPRWsm6IO6L8ZLem4vBNhZvz?=
 =?us-ascii?Q?hjTjGP1qIXUYwiD3MfwfSs2UHO/otuA/6d1BAw9AoAri/SRIUJ781QyonG3n?=
 =?us-ascii?Q?zER3wwgf0MfeCnQms11bQ0GLm0o6WquqNicGV7tFc6ekcyGnc6LVNG0IPu/r?=
 =?us-ascii?Q?8q4dmbNFJIegn9bixbz4SqEjODCEJk8gFtOvNf5RopgPfKCZcSCiyVxBnwfU?=
 =?us-ascii?Q?p5oUWUY/3z639WmwyI0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 20:08:36.0020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b913b544-cf62-471b-b882-08de101473c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9609

On Mon, Oct 20, 2025 at 01:32:31PM -0300, Jason Gunthorpe wrote:
> On Sun, Oct 12, 2025 at 05:05:00PM -0700, Nicolin Chen wrote:
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index a33fbd12a0dd9..3448e55bbcdbb 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -2765,9 +2765,6 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
> >  
> >  	iommu_group_mutex_assert(master->dev);
> >  
> > -	if (!IS_ENABLED(CONFIG_ARM_SMMU_V3_SVA))
> > -		return -EOPNOTSUPP;
> 
> Stuff like this is also optimizing the codegen, it shouldn't be
> removed.

Okay. I assume we should just copy it to test_dev() then.

> > +int arm_smmu_domain_test_dev(struct iommu_domain *domain, struct device *dev,
> > +			     ioasid_t pasid, struct iommu_domain *old_domain)
> > +{
> > +	struct arm_smmu_domain *device_domain = to_smmu_domain_devices(domain);
> > +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> > +
> > +	if (!dev_iommu_fwspec_get(dev))
> > +		return -ENOENT;
> > +
> > +	switch (domain->type) {
> > +	case IOMMU_DOMAIN_NESTED: {
> > +		struct arm_smmu_nested_domain *nested_domain =
> > +			to_smmu_nested_domain(domain);
> > +
> > +		if (WARN_ON(pasid != IOMMU_NO_PASID))
> > +			return -EOPNOTSUPP;
> > +		if (nested_domain->vsmmu->smmu != master->smmu)
> > +			return -EINVAL;
> > +		if (arm_smmu_ssids_in_use(&master->cd_table))
> > +			return -EBUSY;
> 
> This gives me alot of pause.. Here we are detecting if a S1 PASID is
> installed for a S2 attach, but to your purpose this can be made
> inconsistent by userspace during a FLR..

Ah right, the used_ssids could mismatch with the group->domain!

> I don't see any reasonable way to mitigate this??

Right. It can't simply go through a regular attach_dev call since
driver wouldn't expect any inconsistency in the core.

Driver would have to be aware of the reset state, and make a copy
of the old domain's CD/STE to use for a test_dev() during a reset.

> Which makes me wonder if we should just try to solve the simple
> obvious things like direct, permanent incompatability and still have
> some kind of recovery code to leave things in blocking if they fail to
> attach

I don't quite get this. Mind elaborating?

Thanks
Nicolin

