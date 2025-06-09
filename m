Return-Path: <linux-arm-msm+bounces-60697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11AAD2944
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 00:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA2673AD095
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221A31E9905;
	Mon,  9 Jun 2025 22:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hlml93mK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609DB1624CE;
	Mon,  9 Jun 2025 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507390; cv=fail; b=C6dOu2j3mkZbAvfFdOSImiqax8m1oUvfGDCbOin33pALyCaoyIgJeAgzHF52ku9gbRbW31nai8B2YRRuE1bRBO5yzyjK6udl/xMG3m3zAeq65axgHJZaONRqLyZ/DKlhK7nCwR3l6crcc6Q7zTMg6vqj2ihls5gDDZKGsRt6ZQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507390; c=relaxed/simple;
	bh=wWclb7cJx/C+qqexJG5oJCEigWnONInSA+V2zpyNphQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q12BwAUUvI6spsgjVwwAg8+QoLsjt2dRaNA+PVi/p8dgKlO9P1Xfk9a68zoMO0k3BbSc1V/dQR5o7XNVjl7RRQ6qw7dukIw0Gvrv5DPc+AAOGyPluLX0OuMAc1G1M95N7/a3VDDWAqJAOpOJL2KgNg691qKhL4Q3eddupgDZLNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hlml93mK; arc=fail smtp.client-ip=40.107.95.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toO8cJXOuZV+C2OTEC6tYJSNmrYRON7k0BD+c/e5hRb8zSpYoJqLvwxPtJP81dIw3BCVfLuMs8CZV67E4QmC/v4SImp428qzhU2bi/Bs/7wfpH8PyGoix9yXaAwGS7LCSQovcvWxagFSLzkab1gM8GRYXxAZOOiDDfnKigDNFyqPTT/asLlqltiO39DYH4GiwRSxunmTwKAtXzJux3vlIRNgeA9GOtMrMX1zXfMjqYXlQcAIzGcAEMY8mk18Klv9Pr77zOPnzmXDguC3CmSUOJZ3EIKvR/fAmiklqKkbF3jauIAZIXGLA7tIZQuq85VjJSHnutfQusdAAFGAjB96jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnxtUCVepOokMLj9HewGrMSru18ryYsCZaVG1F9beBI=;
 b=Z4Z4yPZnaonQmzsw87c7crJWGdYfOtjgEjj0gnUJS4cOKR/W4EjgoCgo2YMKTKNs/pm8wx6udqmYLk5W+0kSf3oCH73RAQpKUf+fYQPfXtmnXBhDnHVbIAaEncft2zrMP2YB9HfpVQ1/hR3a4b3SarH5PY8KHEyQtGCC1Jam1hvpjruJDc/6j0jA9y0AbPIYhF3WEAqtGNeoIV2kmbiKjj4JJa9Oforav599Vl0cq174cuyhtLTnfQlk/FsRL2KsdIKzIb8Lami48/wPoM5+41W1IGHkCwxh52FzNxII5QxhPBv+Z9IkzjM8hT2V+8rRoV5pF2LF4c1V53CekcKPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=samsung.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnxtUCVepOokMLj9HewGrMSru18ryYsCZaVG1F9beBI=;
 b=Hlml93mK+DoN36JmZuHhatJ9ovGuOwzxuoMcEdg8k5bdScYDj50RbiZaGS+b7gKnTyu0yKkEZpDLCO/1vr66McWZ4qBQAHawHsCg1KWz3CKU2rJZwDOn0Ebad1a5+FiGcC4KopbOJ47stLQ7Zt2jZKt6zhy3/BZNQsq6kBz83pwiPExsSCXmgiAIfjrs+pgupoCX6lPLqY4kwZjdzqFBwGpKQDjWry8iM2r+K2O8c+fPyGvle+oaoPQYw0GMY4AZ4yy8RH8BF/NI8fgTDhr1MphWy/lY78DGzUBDCqykfsvysTOiD7RtgF4H5SiBY1zyYu8iPIZx4FRWX9nW63D5bQ==
Received: from CH0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:76::29)
 by PH7PR12MB7842.namprd12.prod.outlook.com (2603:10b6:510:27a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 9 Jun
 2025 22:16:24 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::a9) by CH0PR04CA0024.outlook.office365.com
 (2603:10b6:610:76::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 22:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 22:16:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 15:16:05 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 9 Jun
 2025 15:16:05 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 15:15:50 -0700
Date: Mon, 9 Jun 2025 15:15:47 -0700
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
Subject: Re: [PATCH v2 1/7] qiommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
Message-ID: <aEddE8bupuaVJTEP@nvidia.com>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <1-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|PH7PR12MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1b875e-3771-4ba5-4c8a-08dda7a344bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OSezRCpiydD53Qcq2T/8oeT3KoeMpQFSKDai6OzhBEc2t/4yWp9h/ySqq4xb?=
 =?us-ascii?Q?GkFu19ya0mOVmgsnOz+jHrsByPXKDjiQC4y0q9KzpfeEREXboKdk75z/oDmq?=
 =?us-ascii?Q?wukgCtqNksbUx61mkiKD2Z33D/jMnwDHPE5RJI7PWXJSeN3wnOD4hemqLUrx?=
 =?us-ascii?Q?b8D5+lX6j7X9QOic6E383/XZnSKd6tz5Phc++JlTznvAksTgUKOp3HMGTIjH?=
 =?us-ascii?Q?SAaYCuNM3U1v+C5jtU8hLNVa2ayrSF8sHLr93d3AZy+cK1s+aL7ufOaPB186?=
 =?us-ascii?Q?zKHV+6vWMUktAZwlsNxMotkCHQEiUr+DNziVS2XA7fmh2LIiXq4ICcWj7P4D?=
 =?us-ascii?Q?IA/530qo1x7OmAIAXkExCTkvAZ83260NsyXhTdNKp68aAr7EtCtF8/q957Ym?=
 =?us-ascii?Q?kHlugg9BSe7P8CziATyy+adN2Vj03xwMrWeZGcxgM6peedN1G+VmC2Q8gvSv?=
 =?us-ascii?Q?bJUr1H74qtqCMHE5UuVJfkPwcwkdrIIHQcPAOxoc7jrykc4Yt845WMWS2QgR?=
 =?us-ascii?Q?JR3edYcMuNbYxPCKPvXxy8HLfkcVIJx8ztrhiaup9+cSwLZuWsDP/ng6aRYz?=
 =?us-ascii?Q?cE0xlB0QP5S5T4e1G9EHc/DCIFqorAWKbob4nDu3C5MZXNc7NcOaeYOjYnyq?=
 =?us-ascii?Q?IzF7FevIRSgDJ40SMK7rqN153BoLVV2PllX+IV+3otpsYUOiU+i71oVs/xOQ?=
 =?us-ascii?Q?Pbs4naC5IzG+74tUoIK0VG/UhXtpJDvVcxSfS/QZj4Gulhd0bp6xt2EoUtcY?=
 =?us-ascii?Q?KHDkez2KvSSEs9jS6i184sEPaIYEmqwtX9CQAB34GuZi/ly7qqpNj0ztlXxW?=
 =?us-ascii?Q?5URmnTbuICPV3hZZjKPcwOAzwogVf22OONsv39K+ZTpcoz1de0NaKfdHFkIY?=
 =?us-ascii?Q?0PD4QJLN2My8F6TkzgndccK8uJUY/iPKZg6BXoX+/vCsPxDs2+CUXhgYj4aq?=
 =?us-ascii?Q?quPvQNi3t47lffoNXwBA3vhPFA73Jj5fHbYMUAGBwrxPbzZK1cmwObcbbucg?=
 =?us-ascii?Q?6Mmq552W6GDtx8X40gb8QxCzFFBJl9gjaPxhx8ZP+yW5xC3RTioVVVyb57y7?=
 =?us-ascii?Q?C8vcqOUk9cjmpsn/N4GRKsMxS/asuo9UqgoVUIfcToN7W8Era32ejF/saWEk?=
 =?us-ascii?Q?HDQvK09dzXMhqYT5fPNwePkN53DhgbOEldouo2V07fPaaGaqEPLURm583dYo?=
 =?us-ascii?Q?zQChpXmhbb07j5p2xyHRPuCM5zP0U9cLtUv3UkgHag4l5TfkLeIDuOU6BXmJ?=
 =?us-ascii?Q?vtzR25OWYcgu3qAbPb+VBVLo/06yYX/ZD4NQ/9z5ZprbwoYSav/xPxZtlLlR?=
 =?us-ascii?Q?mlcwk4SOkynmro0HlzSYWbcCws3K87FNb1n7ou9afTOSagbxmoirzlspx2O8?=
 =?us-ascii?Q?wz2XoYaKN1UacOB51hm35jaSNAoMTl+YJfigxNTcqmSeODzomJjvwuHD+DvF?=
 =?us-ascii?Q?vnle13Tn6L8WoEFZui4R+fxmMx7vdHwnSGyr3bATyhofhNi5Lk7gGbYnK/5M?=
 =?us-ascii?Q?ukPc5SCUf3iccDv/mTlZ8iuh+FBQUiDzlFox?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 22:16:22.9802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1b875e-3771-4ba5-4c8a-08dda7a344bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7842

On Mon, Jun 09, 2025 at 05:41:25PM -0300, Jason Gunthorpe wrote:
> The driver never reads this value, arm_smmu_domain_finalise() always sets
> domain.pgsize_bitmap to pgtbl_cfg, which comes from the per-smmu
> calculated value.
> 
> Remove the ops version entirely, the related dead code and make
> arm_smmu_ops const.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

Is "qiommu" a typo in the subject?

