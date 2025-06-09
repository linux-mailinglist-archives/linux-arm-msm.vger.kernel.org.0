Return-Path: <linux-arm-msm+bounces-60699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A641BAD2986
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 00:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89A103AC4C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B701DB346;
	Mon,  9 Jun 2025 22:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="epC6+HqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9F2190067;
	Mon,  9 Jun 2025 22:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509156; cv=fail; b=GgfSMaaGuNwZl5vCEnSbhlbuCYnNimYQhyN4ueMK7u2aOO/A1MHLG8XKQIVivoncgBj3De0lq6eVt4+DoqdkvJdixrKyJA3zxnMBmxTgdDT3Ik3oqw/EcFaf5scJaeUKsnVflBSgWUDnKA44ERXNIrLvHRZEQjIxtaok782Saj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509156; c=relaxed/simple;
	bh=799N08ZxDrP6sr6kln078M5yJNjMHwfPA6NWZ0kSaGA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djp6MVkKh64dL7grefbGXvucN4vysH1av37rF+Mq/9iRKHJ25LVLi+YMSgpNe2U9TVLVs6GXc43uXlm+mOIcyn0NwYKmX8HZNhRiYdWSTFwrDJRrk05BD3wDPrhqQnQeRYf+8We7bRgPS7T5jPrUjsQJpGimb/Ine1fpUtIWt2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=epC6+HqC; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBV50CLIyJQM20KvEI6VacdmYagyh3UdrTvVpfLYeQon90BsWsstRnTrSgdC+l9sBcCDo2puJudciddZ+f7EA/yABdposRT9BbaieVvBOkWlwnfrqsBVrw+aEQC1/w5oWlmRdVoSANS9loVXz8wYSAIB5Zq9FAnviwWNKY8nFDsMwSC9bRy+AUXC+MvfaRoCHswORyj3bYL4CoaJQKp2wsA5DCTynPUU8brO/OesJNFMk0lTaExfTNPfZFSfKQ37NISK3i1mRhx2+FCdxB40EQ7HADGJ00MwDoIwTesad+Hiqiavj0Hf6qbu8N8GwcwXlW803kXcxEdtRx8jTilpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVTBaLD5jsJF9Kshb7PdHMaNMlvcDKhGXR7NzhRSw7Q=;
 b=hv5RkRnCSZkxW7wCHNmUbtTt5GhzjzT4e4aJrwsAgQmeDGqjcbDl/NyIODtXsG8GpVvc3SxxSXPjiROXLlzwh20gV+daic3tX5lfRyDs/bJsM8rHcG6cVRGQlcz1HUHoerKzmXvodnD0cONLfJOJNYLOHEgGFwszLM+eey2rsH1bOIN7CnvV2tTQuoFFz9KJxTfDBgRlA9WsFvGVvH/wH0Xzy8bGsCvaCp7ynw52XRbeHfjxUdA4nePHYqtaTiGz7aXYeqM7sLNrP6j6tKTGaXV0FrlhxsGsQEanxr155ORXtDkBL3XWIgDFHpjN2OrmF2B3YG8CzKspB6/GSIJdyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=samsung.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVTBaLD5jsJF9Kshb7PdHMaNMlvcDKhGXR7NzhRSw7Q=;
 b=epC6+HqCfXhzm/Lj+EFBmL7Z5VBTBmx0gQsDwNtiMFwffNf2rrvfuO5mnURjjhLohA/mKB52h1A+MXKKTpp26oFYT1Pg4A3wAjFYbag0CVnHcJCQzsw9uNOJzOJp6bQHFubMNWO+V+CM9c9d66b2jTK/exODiy54R+pDJNrx48BjVpLhnN8ji9miLvrqMF9Ogp50PF8McI79lj0t9JVEwN3wVkS85OvcFstF5FVFhLztd+Pw4gdWOMuHy6VrDRuAngn7v5/+xyN5IOXWtXxzV+2QMjOoP84a8ag0vdrByLRiiH1sePO6yydqIf0WqnRaaxWaqgu7kd9oAGAk6BYRhg==
Received: from SA9P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::25)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Mon, 9 Jun
 2025 22:45:51 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:25:cafe::69) by SA9P221CA0020.outlook.office365.com
 (2603:10b6:806:25::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 9 Jun 2025 22:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 22:45:51 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 15:45:37 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 9 Jun 2025 15:45:36 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 15:45:24 -0700
Date: Mon, 9 Jun 2025 15:45:20 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<asahi@lists.linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>,
	<iommu@lists.linux.dev>, Janne Grunau <j@jannau.net>, Jean-Philippe Brucker
	<jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Matthew Rosato
	<mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, Orson Zhai
	<orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Clark <robin.clark@oss.qualcomm.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, "Sven
 Peter" <sven@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "Krishna
 Reddy" <vdumpa@nvidia.com>, <virtualization@lists.linux.dev>, Chen-Yu Tsai
	<wens@csie.org>, Will Deacon <will@kernel.org>, Yong Wu
	<yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Lu Baolu
	<baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<patches@lists.linux.dev>, Niklas Schnelle <schnelle@linux.ibm.com>, "Sven
 Peter" <sven@svenpeter.dev>, Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 0/7] Remove ops.pgsize_bitmap
Message-ID: <aEdkADqw6WGIPAmH@nvidia.com>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 821cff94-7dab-4a01-b154-08dda7a762b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9hy1/mxqHhI+GYv4/fe1Qy583x4kPL4eZB5sQhZtcUDzREe7Nix1fe9Wf+kx?=
 =?us-ascii?Q?aSoGYXn1wZ0Qm4lWn4Bw4/0qB9X4S8wGqR5xHkWotWLUbrGarPa66trHVtpv?=
 =?us-ascii?Q?LE4mxLjzbHfOE0k3/V4aU18ULhh61ZNUXmNCldE2qhzra8tZMJ4OjxhB7f0h?=
 =?us-ascii?Q?uObDLKGMCGwSLqU+McNNbwJxjV2D+BPN+uW3XjLu1d/g5OIKgQ3D/z3NF1CV?=
 =?us-ascii?Q?OckGz5gl0FzEmPO72ly6AO5+oyOCBJrsY8ZzUzimGsZrAD6miSoTLrlAisKQ?=
 =?us-ascii?Q?PdtEiyOURHCREwvJ/DAiMDuD9aRxvV7k9RQAYC0lST5oFWYi0usoMO1s6zi5?=
 =?us-ascii?Q?WZcT+BWlHlZk+WY31QRt/q4t2fVsV4NiazyGEVBDEQ+2SZPoAOcKZnpLo2Xm?=
 =?us-ascii?Q?RbMbbxrjWLKh2kls90Cdxlh9/IQo32Wp4kg7ucCf0k5kYHnoxJnKCBI/NdLt?=
 =?us-ascii?Q?dq+eaXDa73H+3WXfrNtIzXafdylGsZ9OHbkNeHT/z/+wZsJEASHLqLVYJ8+G?=
 =?us-ascii?Q?cOjDXKwInO8SXQ+ePIqJWrrwOPA4xxMKwZpihYFcZbKIV5EftC2SSUFPOlgh?=
 =?us-ascii?Q?bb8MkKtQZZk8A9N7i9fks9e24cKA8zzW2RBqCEM3bTZS2w1aH1ncZzos2e0r?=
 =?us-ascii?Q?ojyava+qqQDTwAuFyudyDeYpsH5eE8RmGp+Fz0rLRxBUPnZtP90J3F5trZmJ?=
 =?us-ascii?Q?SAgcl2pTTX3UuU8Fe2ivFiztmumSHXBBBVlrC+13mzF1vHVuZQHARvU4X+ex?=
 =?us-ascii?Q?rLCGXnXKJ9jqvEZlsSfKGRH6NvQUBX9z2JSNgfddd3rJ9AVl8wgsRpiT3yQm?=
 =?us-ascii?Q?u1B3DECagfbHkmwNK1e2C7ZzKgMkP40efjDPXIEHy5vP/eZIZbN0fYKyO88p?=
 =?us-ascii?Q?ioWV8aRuZkCoaUSUWwa+y3BpJI7zOjR2nOsHY5t3KmoSHlQgEtqYX/grv9+k?=
 =?us-ascii?Q?l7IME/gnNDcHPNJvt+CCcVK1VGFf8KHdVgB/LV+eolprWb4hJFb0mW5Q4699?=
 =?us-ascii?Q?f5kiYMDRC1J9GD1HwORDKLLgoCIOE1AP8zlaH8RGucE1rqFpGHAfVyB4iAfX?=
 =?us-ascii?Q?3tdzE9G+UWfamRMf37AApf6U+EmqwxOpZ/QOL198ckjztWVyOzw2ai3ilW4Q?=
 =?us-ascii?Q?p+kQGmOD7G8B8vn3SK5N24BvoiTavuaRAEuBmIx6d94lYKcw2D14SAu3jjHU?=
 =?us-ascii?Q?1zarGYajdjf4LzYXCmv0jaaOh4r8fAYvZnJvXMBBHrv9Kw+xYtz/I9FSXoDY?=
 =?us-ascii?Q?rpduL8c5eGVmHnHoytm/F8CSsGqFrVtXg195/pGctKeQKxw3vEU9AeUfeeJy?=
 =?us-ascii?Q?3J/J4lVBFUoZbIklZJkKSLtWQpf5zqEZKnsUsjYDjPVArSRHvWaOtWGyJ7xQ?=
 =?us-ascii?Q?GH+M/shu3PnVDxwGG2pJS0A3DDErd5xlhdPoVGjIhvtmXV+VMGqUvxmgU514?=
 =?us-ascii?Q?ISCuNRs/bKx88D1HyG15y9638CruaYWDlsqip+8xI8DVqc86Mq8zg0gAPecx?=
 =?us-ascii?Q?eOHFfQE9NcAPnNT/XCSGQ+NoUmdEbDA4M2y6?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 22:45:51.3126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 821cff94-7dab-4a01-b154-08dda7a762b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250

On Mon, Jun 09, 2025 at 05:41:24PM -0300, Jason Gunthorpe wrote:
> Now that all drivers are using domain_alloc_paging() and dev is never
> NULL, we can have all drivers correctly set domain.pgsize_bitmap during
> their allocation function.
> 
> There are a few oddities that have accumulated here over past changes:
> 
>  - Some drivers always set domain.pgsize_bitmap during their
>    domain_alloc_paging() call but still provide a value in ops. This is dead
>    code, delete it.
> 
>  - Some drivers calculate a system global pgsize_bitmap in the ops, but
>    it is now trivial to use the per-instance value instead. In several
>    cases this is dead code, delete it. This also allows
>    constifying the ops in these drivers as a hardening measure
> 
>  - Some drivers have a fixed pgsize_bitmap, put it next to setting up the
>    geometry in their domain_alloc_paging() functions.
> 
>  - Finally a few drivers still use ops because they have a delayed
>    finalize operation. Set the constant pgsize_bitmap in the
>    domain_alloc_paging().
> 
> Then remove ops.pgsize_bitmap.
> 
> This is based on iommu next, and must go after the virtio
> domain_alloc_paging() conversion.
> 
> v2:
>  - Rebase on v6.16-rc1

Sanity tests with SMMUv3 look good.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>

