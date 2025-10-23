Return-Path: <linux-arm-msm+bounces-78425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A5BFEE7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D2AE935295E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720B9221FCD;
	Thu, 23 Oct 2025 02:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jmPOFL2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0AC21D596;
	Thu, 23 Oct 2025 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186150; cv=fail; b=AInim7EyMZOWCEuIGx14RAJm0Gzb5ZJhncYe1+vADu7Ixt6iBxf18O4dHEztH3VuQJFcUkPDu3TeO6yZ0k5POe3IPs1hJhil7E1WRb5Xaau+gzFi/JT+MvWmzujSelHH+VOUsADYpr7UC6sGJv1980uzXPwtfiK+xPkwSAXgawM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186150; c=relaxed/simple;
	bh=Oovxc2xwQBxYwcT81UaZp4r5Cby3UMpyL2z6ZKVqPCU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/4KnQEwuY/Ddb1eZNYXQyEYt+T5QWqj98D9Cwp52MHWKZ8dACpPJlG/ZjPsrl7p6A1IEEb8xj10ny1MokHz2ozq75EqD+5S98jusKFpLJ2vnrpvs7o4GlNXCE37Ecb7rdXI0oHokKKrvN04ocr0AcUbju2TQlHXBG0cEOBZdpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jmPOFL2x; arc=fail smtp.client-ip=52.101.56.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfwO4eMpEGYdgaBq/wO+f8mMHIU1/PHiREhI+TnKRBEsfpMAIdVZJN1sAbHFbSbh2bcA2US8zdvrh64TD8k1zjs0JLEm5symnBKM4qNBid+PKGcD//W4FFKABjj0La005eRMLtfahPf6KyTbozOeq/ouFTJbANqGLC1e9qKuKJNLXQClcTtBqu5lKQzEOiFi+XoYEIexe5Bjfo+j4btNjPKz0pWQ73cttoQ9jUU9mvb6JG/6q8et28KQyTljG1DKJipixo2XBjx/X3YmHGcp6g+Dfl47QLTkVEvkNlSu/cYgIBcTRFThWlE6gaIywZLMXGZT+lMd3sYa3itzPJffHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQbKQPGHHteriTFPWtmN0+oYPeNAZs7WnUqBuOXCIo4=;
 b=F4haNnvT2YljJZP/U40dH7KiwE8U/fIFVv2WbFFlc2otn8SbdRXa+VCYA594A3SGgHCWymYWgSKDLIeY432HaMm8UXP/8NzItZCrUonnhHh5oNx9qmuAz9+KCC36P7ICxmAPjmuxKs5RjpDxHWU3XTzAsripxd+5NzfQj+yuqFRIa+kcErtNuWSYSKcJbuwq4VhIZIqLy1PAJe9nVmOJ7x8+UddJ/zSTd85NWe+c8MrteTsJgTvHlvfbvpVQE7oEhhq+iONyhx9fJq7IP2UjPlTQE7MLcJ66JAtCJMqVwUdRJ54J1po2lBCJwHRGp8sqqz5335JQEqhn0oJhfQttqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQbKQPGHHteriTFPWtmN0+oYPeNAZs7WnUqBuOXCIo4=;
 b=jmPOFL2xinGmajesZ8XBc+OFmKObMYp3ZzeEbzwANX6mOPw2SSLuUC34PpLKkS2gt22LEILiCU9EfV2JPLx94cNa+FE76T97v0Z+p2njNT0q9Ogx2yRpKX+lqh7uUeo9YP8ExLUXyNNaP3OFYWmL98fBMQvd8VvaF+qm3LiXQ/QWXQ1pPmR6C7hjUMXUN1eXCQByxRR9u/LV525SySECjvbHHycDG3i4O/3MAH43TYwzEGe5Y4LfVOtHB/BsOMLQz9JDSqkd0C+vJsitQM7m7zxLXum55/CNUAtPP01QYDwsi+yALCMsCqvSEPWkiLSC/1mZx+K6UpY7hzNjMxysMw==
Received: from CH0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:610:11a::16)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 02:22:24 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::3d) by CH0PR03CA0342.outlook.office365.com
 (2603:10b6:610:11a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 02:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 02:22:23 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 22 Oct
 2025 19:22:11 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 19:22:10 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 19:22:08 -0700
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
Subject: [PATCH v2 1/6] iommu: Generic support for RMRs during device release
Date: Wed, 22 Oct 2025 19:21:04 -0700
Message-ID: <80bbe9125d90b001f3ce08429704aa4168b0a00b.1761017765.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761017765.git.nicolinc@nvidia.com>
References: <cover.1761017765.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 108e0cb7-760e-4063-ccda-08de11db0057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x/UNMLeWA17a8ENKszWEqUWPMbALU0Q/+iklg2FUhBee44SobM8wldo9Mt71?=
 =?us-ascii?Q?8OvQKD9T8jqxqG9itNxq+9cr7ayD/9xXRWTuo1Wn49DMuKqlUwKfKLgcGwoF?=
 =?us-ascii?Q?RNH3Tohk7MREseMDnFchkSZTrF5zW5deCOyb3KfZps6S/EQ3TyZu++IO2iJC?=
 =?us-ascii?Q?iQ78vAlAAM5BKsZwF1DTkdDumHz6FO3I2VS1Ga/Czbi+akl/X7lRLdijDm7g?=
 =?us-ascii?Q?+f5p9hHt2NbJotH2DEBKS0hCy/DM5oRjiJ6qY/g8bcmuYbkGXEW41W3jxlIL?=
 =?us-ascii?Q?dJDN72Nsyejtl9t3ctz/vuYucm7HOrdfvMuW8tZpFvSFICpienHHjfewiOIe?=
 =?us-ascii?Q?s7nNKm2dvwYkmjWLQb1HfjuQEu9UUxn9tPSE1HjOvFbtuuVnr6F3xry9irJM?=
 =?us-ascii?Q?WSt/ZNeHcJIB9nD84uv0mEhNtF+MGcyJDSVoYu3Q5DxsuFj5dnd28cQYDX9A?=
 =?us-ascii?Q?IcHxoyE9yetyKLJs/W9fBvsvSowhajuOmIy9CdcF04pOpo2m1401AktbbeA/?=
 =?us-ascii?Q?Rt6WXIltPxP4i98IAzinE1c3i32BrZrLqf7KFYxMKd0ZW47kqBuRNYTCgUHG?=
 =?us-ascii?Q?Yt9h/f1JmejBbtqOi7Xu3/w23bTm7JSq/mEB/QRJmnfuhI1KPKPrvJuijAcz?=
 =?us-ascii?Q?UsavqnMDZrYgZDk5yr54PMQeyZomJcr9gAMnYqSgSe4TWvtJz5vBvFAKbDck?=
 =?us-ascii?Q?y+dMc6Ur/KSqDTqQiyHAeI5jk3YVIGPxAsFimdvpgBTdu6sAipz0j8XA1S9c?=
 =?us-ascii?Q?l/4dcyWAFOkM21IJcbTr30KJ8X9rdswElKiUDoeyRfJvyvgReYSiF3nVuycX?=
 =?us-ascii?Q?3/a/W/kmjl/5SgBWTZsJ0TEfzDrtzMzsrrcbzBmSnmtKUhm+2FkwOzL0b59z?=
 =?us-ascii?Q?7aegehLK4vbdvs7PWWtqY/28Le2MwCSqkCPcNDj7631SmAUW9lGPkW1gPDkh?=
 =?us-ascii?Q?yKiFI+gRexvT4nIkzEzzaEp3ZVVf9o6ag3CjYmCv9s2o0ol10hrU101JonBp?=
 =?us-ascii?Q?UMKGCDmD/s4JkYAXj9Yzi+/gRtnrfSCgqeZZza4kWgoHcbEmUokPjGn0lg7H?=
 =?us-ascii?Q?WK5QhbmHkA86+8o1xWe83HhDnE/5g6fsBa3HIpDyDjd+8guN+M3Z/BxJuzRR?=
 =?us-ascii?Q?Fv2g5+iqUzkjPuSwMvXV/ZL5FNwWVnuoGPB/dGXeQyWFmixFktyT8PWHgmO9?=
 =?us-ascii?Q?gP+zmKYJ0Sov9SW4/AXs+UcxvSRsnMSldqUguVtBq16i6iRq8q3/C4lCg3hF?=
 =?us-ascii?Q?eeGqWk0Z2WsHViRhBsn2wK8kinHEhxXi+W98Ym5LjEqm9IRTRpunw3EtZ2Xc?=
 =?us-ascii?Q?Hq+H4MrtxjZ3aNvLSoOzFacGu6cHAL/GZF6ICIn+NHwwuteimF3KauddMUQ9?=
 =?us-ascii?Q?12ClZn1pHXdZM23mjmJhbjZlJyNRSOwi8U0IIMSAoB4+v4HNNNp9LhLVNJRc?=
 =?us-ascii?Q?XLkqTKR/7SAd7q2ZNzR+O3NmvaJDZiS+hLhERcn+1l5Lp+JMs/YrUSrwxpfQ?=
 =?us-ascii?Q?pBvXna4Rxvisrlr8Ea5U5s2wZKin1E+DQHjAlDuag5aNU1/Llg2ZT9KO/6tY?=
 =?us-ascii?Q?a+GHGIzN//vW2M3rSK8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 02:22:23.3321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 108e0cb7-760e-4063-ccda-08de11db0057
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

From: Jason Gunthorpe <jgg@nvidia.com>

Generally an IOMMU driver should leave the translation as BLOCKED until the
translation entry is probed onto a struct device. When the struct device is
removed, the translation should be put back to BLOCKED.

Drivers that are able to work like this can set their release_domain to the
blocking domain, and the core code handles this work.

The exception is when the device has an IOMMU_RESV_DIRECT region, in which
case the OS should continuously allow translations for the given range. And
the core code generally prevents using a BLOCKED domain with this device.

Continue this logic for the device release and hoist some open coding from
drivers. If the device has dev->iommu->require_direct and the driver uses a
BLOCKED release_domain, override it to IDENTITY to preserve the semantics.

The only remaining required driver code for IOMMU_RESV_DIRECT should preset
an IDENTITY translation during early IOMMU startup for those devices.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 59244c744eabd..adef1a37f9311 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -542,8 +542,20 @@ static void iommu_deinit_device(struct device *dev)
 	 * Regardless, if a delayed attach never occurred, then the release
 	 * should still avoid touching any hardware configuration either.
 	 */
-	if (!dev->iommu->attach_deferred && ops->release_domain)
-		ops->release_domain->ops->attach_dev(ops->release_domain, dev);
+	if (!dev->iommu->attach_deferred && ops->release_domain) {
+		struct iommu_domain *release_domain = ops->release_domain;
+
+		/*
+		 * If the device requires direct mappings then it should not
+		 * be parked on a BLOCKED domain during release as that would
+		 * break the direct mappings.
+		 */
+		if (dev->iommu->require_direct && ops->identity_domain &&
+		    release_domain == ops->blocked_domain)
+			release_domain = ops->identity_domain;
+
+		release_domain->ops->attach_dev(release_domain, dev);
+	}
 
 	if (ops->release_device)
 		ops->release_device(dev);
-- 
2.43.0


