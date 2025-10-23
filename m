Return-Path: <linux-arm-msm+bounces-78424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85483BFEE6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD09F18C6910
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3B0202F93;
	Thu, 23 Oct 2025 02:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Enkkhrtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010032.outbound.protection.outlook.com [52.101.46.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287931459FA;
	Thu, 23 Oct 2025 02:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186146; cv=fail; b=coUHP2fYPlRhXtffJpgPPTBfQpd67obdaI92nELgAu3JQg0QCNJwomYY3qf1h8qIs8z0Y6ioREqa2vRwsGqOTQq5/lwtGCNKrwNTugTlWKc8eb38VpTIRWl3Qdk6K6dXn8NAneN0FfWq6X89yhpTMT0rFnHUvglc5IN9RHniqHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186146; c=relaxed/simple;
	bh=7rATca/5ftm7MiMlcmqYN4QhZwtdmQpiiPHnuKQWu20=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YK3RpuYHOhe0JZPkXGq4fahbSssflqfW95tJQguUmr7lnyb9JhCazm+aj47NVwU9+nJD7Gr9vt6jzcAYaiTU7JGqOH1bI7iAlUBDaC5npv3KcWOpDvDX5ucz+Fh1q6thVWy6R0VH9OfZR2tuhgNNRypbbtF8etc+vVyfhqs76Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Enkkhrtm; arc=fail smtp.client-ip=52.101.46.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AATngSbQnH2/2xRAx4r6eNaadMxLp4RfJ6oprX9O+UKu2aH6V5yjEcCrwt2fgTSL4Ijv8KiEsEA0hZ9Yq8V5e/TYcQqN10PyaRnbjFdtXbC/pZ8ZbsmYe/dVLoat+dWz+oqnuEXOx9k9KRAcy0lwDdZMcpLHJsDegs/8M5Ea+GTbtSZKikOyAc5uUkKPFZC30v2i94x26sJgMqmWNtjDWH7/XvXM7h+tOiplPndr56uOX0sqs/At+SB3LdWhJMn4KKB3pTnEUfhUvun3lWXrZuCYTU03OpdkYazKRLanx+IY0mioD9+Z8Ps2awIhIIcirxBPJscqTf0xE2qpCEo02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAVwymAGTAdQk5Ef+A4GanmI5VpeyPBDf20KGUBcGpI=;
 b=RFUXzEaEOLIaR5NJbbfSM2l9U1oMlimiOMRUmSGgHX9laCsIiFHhSXVU/+lrur1s5zMwcF9qzxHFlBtOzQD1oUox0jiLcP79IrO3RZjOLLdnc9Y7Gl4wIqQ/Dr6t9kgUd3cGF8ygGWQFE6GvFMH1QN2Yu3lwzw8DogaLP8SSSfrmLiJM3vGLdT6F+1n0/LfPL0C1zE9a/ojF29Wfy5rX1budawpj8+IrZ3hReroqDwAINcLpmW7cPHE7Tk3tzyg4lDegThW3MtsMcAs7FJY8Tt/qP3Sp3LzOgfHgIXhTEfFDxlNsVQtl0NgqHfExDm9loGGMUcz7cZy7HHxywRcLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAVwymAGTAdQk5Ef+A4GanmI5VpeyPBDf20KGUBcGpI=;
 b=EnkkhrtmeI+klOY4DLDMYApJPOilTOeibkmo9Po49EuKQGygx8n9IyibGxg5volowqqeBD1k/LPFqzvygA/B8D0fP6l9MQ8/U+NvmjFLka6a1hmvaVH1TyWWpBZrGP1ZW/Eg2WatKnFYWYiI9nKRGh3fNlVQpsbN9fuOLWrKGgdejgbskH2uXVWvBz6TSG1PfrXKX/B0ybxqS1nNZ+stoCeuv+JetQOnM2mmuHfT6w8m4HDm1AOJxXBM+RoXKbk7GleHwY9l4vCVbjK4tlYsqIF+Y6fyoboIWy8v2Smdjg85yS7mcoxOe9r0gaj4igLUbTrK/vwmyvTcMdsLY0fqNw==
Received: from PH8P220CA0033.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::11)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 02:22:20 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::c4) by PH8P220CA0033.outlook.office365.com
 (2603:10b6:510:348::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 02:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 02:22:19 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 22 Oct
 2025 19:22:08 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 19:22:07 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 19:22:05 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<robin.clark@oss.qualcomm.com>, <m.szyprowski@samsung.com>,
	<krzk@kernel.org>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <schnelle@linux.ibm.com>, <mjrosato@linux.ibm.com>,
	<orsonzhai@gmail.com>, <baolin.wang@linux.alibaba.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jean-philippe@linaro.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v2 0/6] iommu: Pass in old_domain pointer to attach_dev
Date: Wed, 22 Oct 2025 19:21:03 -0700
Message-ID: <cover.1761017765.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: bfadc637-fa12-463f-997b-08de11dafe51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m7CS3jco3MuGnv9X+NjxvXS9UcmmsktQfmtxRjz/0G8znD4q//qbpZDCPxKu?=
 =?us-ascii?Q?6dEirr5lYzcRNfmIgSL8gj8XmBhgCWVRv7p7HEvX3mBQORrXZfrvMGG5sred?=
 =?us-ascii?Q?q/p9BFP988CG9hCDj7/ivfyCg+ipnDGpEjQ9GRQWWuUIQhrZHKjseaXG3Byh?=
 =?us-ascii?Q?bM/61Hx/umgf/GaEUi9rhnZX7apTCz9/XLZgmjTRrIpWk6zKvpuzXYBN1oMX?=
 =?us-ascii?Q?UlBDXU0Y5rNQRMvh2VGiREH8NnA5hR3VTnah9R9Rfk3blmS70xnP4bIBcQww?=
 =?us-ascii?Q?ekELOu/KVwhIc9N/8q/8YbVMR4WxZp1SYfg1k03H9NoB4o0m30WiKzSdteOs?=
 =?us-ascii?Q?UZz7JoTUOpEsMGKvj7vu53bc+5mNiYH0HA1bVYoB2O3EUyBG4dsxodJhQaI2?=
 =?us-ascii?Q?G7CNbDme0peh/7a8DkPjwRKq+xrFtexDi4flJm7+erFmde+A0f9F/tQlF0sH?=
 =?us-ascii?Q?e4Byc/zTTnMR2DmWFaTXJlVKLRwa+BMmHfivZmB1Z3FNMUgDHtH4N8vj+ASq?=
 =?us-ascii?Q?T74oIOQdLKA8eYlJxhNl7FDPrSKp1S+8UXVUtIEUPDZGMDjkVC3/rIh9U0oi?=
 =?us-ascii?Q?9mLYi2JlMy4qM7i1zdd/+zBXmZNldEbtyIuOkraUDENkcqU2v0bSETbCK0OL?=
 =?us-ascii?Q?CtK/1+1oYeMe+Y2O2qkCmNL2wSnYQsNb33R7KQ+Wk9njkKjxdE8GwK3im/td?=
 =?us-ascii?Q?jJz+VeGmLyJ7K/u9Azrs5WV3/uai+c0p+r8qWof80VAXNoDkxtO9PurR+6r8?=
 =?us-ascii?Q?zfnI08iAzFDNqyaIyvF4vloEiIwu1gd8mgkoI2n5AMl+Y7iBBPnyVjcgmNxv?=
 =?us-ascii?Q?/30JMwxOSYxqUl16vH3AkGQwgPTpnodTxHEZTMh5tyvaR0t3sKhI4fhpaNqj?=
 =?us-ascii?Q?wA+WjCP+yhMXlu52Y0qsuWGuaiXr8ef8Jn5ndte+ImU6jxf0sRKapzShhVjy?=
 =?us-ascii?Q?9Jkp1jWgflciOFvjN9eMdk2YNUi1ZlCNlLu4QdFRchDVNX+g4rYByhyC4ZLd?=
 =?us-ascii?Q?cYhdZFiIp9agdRjhtKRfZBUfFuKl9V215Lm1t96oWabdlhzajU4wXCmICuca?=
 =?us-ascii?Q?I/jvYWOnurtxq1Ku+yoDz9oipdQXD3DmepScARn4HB8QL8RZNwbC6H7SjqYb?=
 =?us-ascii?Q?g5YQukkZso0Y0qC5Q81tkspqz4iiMWfCWJPQ6sI0/FnZ11VlSNTQS0sLBD66?=
 =?us-ascii?Q?bTvCfVUUySmQ3BRRAqTD9wtXVfHjMq5W8RoI5iDNb4ykSbxELlOERk3Ipero?=
 =?us-ascii?Q?jgYJqyrfVPFDHHgy0Zh9pC6SoblsEnytIaIZ8La279ldBaegTIuhwlNJSpDZ?=
 =?us-ascii?Q?h4WipAh9cbWPDvXkv7UrIaxAIJerScx0nf3Bx1gLkFKXHw8lBMb5Hdf2ozxX?=
 =?us-ascii?Q?orJDG3bl4SgyS9CYDMg5dCFFKi95g7+75auOlrrk/8K5YKNPb6v8LoNPm4AR?=
 =?us-ascii?Q?rdOlbW1Bu6JG5RFXBMX8/JDYZXUPCZZt7mauKB/baH5IOezqRAI6xvjk3yBv?=
 =?us-ascii?Q?1d4/IL4Z0MKfaLxyAJfHMNh8gOZfgqKj6zhrRFAzphox8/csAf3GYsH67Am1?=
 =?us-ascii?Q?YcNohyLPTx7Oc6+qPwtLdZhvGs/rvd2/UkeSidmt?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 02:22:19.9354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfadc637-fa12-463f-997b-08de11dafe51
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929

Tidy the release_device callbacks in the drivers and switch to the core
managed release_domain.

This allows the core further to pass in the old domain pointer into the
attach_dev callbacks to reduce the use of iommu_get_domain_for_dev().

This is a preparatory series for new iommu_dev_reset APIs:
https://lore.kernel.org/all/cover.1756682135.git.nicolinc@nvidia.com/

This is on github:
https://github.com/nicolinc/iommufd/tree/iommu_attach_old_dom-v2

Changelog
v2
 * Add "Acked-by" from Marek
 * Add "Reviewed-by" from Jason
 * Fix build break in s390-iommu
v1
 https://lore.kernel.org/all/cover.1760312540.git.nicolinc@nvidia.com/

Jason Gunthorpe (1):
  iommu: Generic support for RMRs during device release

Nicolin Chen (5):
  iommu/arm-smmu-v3: Set release_domain to arm_smmu_blocked_domain
  iommu/exynos-iommu: Set release_domain to exynos_identity_domain
  iommu/amd: Set release_domain to blocked_domain
  iommu: Do not revert set_domain for the last gdev
  iommu: Pass in old domain to attach_dev callback functions

 include/linux/iommu.h                         |  3 +-
 arch/powerpc/kernel/iommu.c                   |  5 ++-
 drivers/iommu/amd/iommu.c                     | 21 +++------
 drivers/iommu/apple-dart.c                    |  9 ++--
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  5 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 31 ++++++-------
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  9 ++--
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 11 ++---
 drivers/iommu/exynos-iommu.c                  | 11 ++---
 drivers/iommu/fsl_pamu_domain.c               | 12 ++---
 drivers/iommu/intel/iommu.c                   | 10 +++--
 drivers/iommu/intel/nested.c                  |  2 +-
 drivers/iommu/iommu.c                         | 44 +++++++++++++------
 drivers/iommu/iommufd/selftest.c              |  2 +-
 drivers/iommu/ipmmu-vmsa.c                    | 10 ++---
 drivers/iommu/msm_iommu.c                     | 11 ++---
 drivers/iommu/mtk_iommu.c                     |  8 ++--
 drivers/iommu/mtk_iommu_v1.c                  |  7 ++-
 drivers/iommu/omap-iommu.c                    | 12 ++---
 drivers/iommu/riscv/iommu.c                   |  9 ++--
 drivers/iommu/rockchip-iommu.c                | 20 ++++++---
 drivers/iommu/s390-iommu.c                    | 13 +++---
 drivers/iommu/sprd-iommu.c                    |  3 +-
 drivers/iommu/sun50i-iommu.c                  |  8 ++--
 drivers/iommu/tegra-smmu.c                    | 10 ++---
 drivers/iommu/virtio-iommu.c                  |  6 ++-
 26 files changed, 172 insertions(+), 120 deletions(-)

-- 
2.43.0


