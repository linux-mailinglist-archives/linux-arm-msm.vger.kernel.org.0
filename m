Return-Path: <linux-arm-msm+bounces-76904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A140DBD0F93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FB541896814
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64482F1FD6;
	Mon, 13 Oct 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MAMEBTEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF32F25E8;
	Mon, 13 Oct 2025 00:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313996; cv=fail; b=rqIIM2z0R7TEZzOMT5Qqwdj2YgO3e44SF7yd4yh9uC6hQSj+8bLc8NB1w7OEYSEKv/D8WYAHtjieeOzpuYc+fn/Pwlngc0z+WYWWh5X3DOktroQgKiuvfA8EN13DMmV4ezGKnIPxJfYZhV6FwTnD8RDv0qLD+zpR3jGZ/ZUna3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313996; c=relaxed/simple;
	bh=EHRDc2Ox8ldUhytPOVzDHFCwMXylIx86WuyPR4JpUG4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rssDxCZlLpMVrQQBUCWtYxfyYtsHrtVg+13B5+Zsqp2lyo/0JZDA2Rrm4wUeO3zcSd+dgPvo5mVjp/kzLpYfkNPm+olmU8cV4inbQlpZPrYftMxWE1+zYeyJzL9g7X9Bnm8O7r6s8x56jn4gh+AJlQLphdsKUlkeDqIlpxBWEtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MAMEBTEw; arc=fail smtp.client-ip=40.107.208.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBKsW4NkesCoR3OlG8+OgPIT56nz3YScPBWy/g052WQQlHZ588LbebWgkfG6OVG9jWN0IgDRZ7Z1UhgDUnXAL8JoDLuQNER/i3V08kPFe670XHD5V/+rKFtYL8TH1xHYJ+PibMC6kVTJSlPFmbwZaNZyFAkHrlaboFG0YwaxVqPgW5G//kuasq4BfJAHaQUsVTCouiuPKxyTm9uKC0Y1C41K9HoCB5RD0m9kr9bf4W0lAhUtxreKY+S4EBm+ODzR963ePh6D/zwUgpXrRQOy9KKsETghMH5Hx+ICg7fApf0mq1ludp86Sq7EdqE6a652Adomjt1bHhHhGq+apah/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk2cVIy8uwAn25YfiMtMX5GI5sI1IX2K4N1rX+eSuaE=;
 b=mN2RtHQ1Q/yUt0EpGSGJPpLj5ED9vyzZnQ+vcVc5JGThJIpWnC9e/SPDNrUPo0GGNtVTzOdyPsEwPJrsbPHHQFAjZNradq7fWcQQ0YzFjyaBrX4l+/xmLjXfcKbYZIlQ4e7Ev+zzVxyCdnusE72QlTW9VBrEH2RCSbMEBYRGPOEMxOIse+w3vgImTHRwWiVQxByxhSFDxrln+tEwSi3PFy36u+Rj6evlmV9kGUT1KErCVXTxbHIAlCb0tICNItTBG0NEUwNsL5fkhtpgnJ7xIYl16jbOAJDK+m6GUc5Uq7jE8xaKCROYxfL4v3RhHWzIGTcj1rxIBIbyfH2KDsL/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk2cVIy8uwAn25YfiMtMX5GI5sI1IX2K4N1rX+eSuaE=;
 b=MAMEBTEwDI1dCwVTGivMXwbn5P54HxGhMJ1labsU5BX4RWvsdkR5lO8lqQnC+MGjsoW4pbg+ZDt5/2ETHO+puRF82RTbkYifo5+AzRMxJCcrA3vnhyIqmiHW8KCJ0oyGaHZfkHKLAX6kdfhtZev8Z+eUni7x9dFssjTlKiOsanhEPsVBtVKESYJPP2dt8FiaLSMH4SeoKTHFxTmRq7INAlwePrEAwsmf8OuiB9CREFA6QOv8AQ5qE8n3pih07xv3oF95kXSphopgBs7XZ0Ki3IKkTI7A9bKzbiOODvljGUlFTTYpq7xGVM3CV3htklNwx/rbftMkPwjRDgwVTyAT9g==
Received: from CY5PR17CA0012.namprd17.prod.outlook.com (2603:10b6:930:17::18)
 by CY3PR12MB9704.namprd12.prod.outlook.com (2603:10b6:930:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:06:30 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::45) by CY5PR17CA0012.outlook.office365.com
 (2603:10b6:930:17::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:30 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:06:24 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:21 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:19 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<jean-philippe@linaro.org>, <robin.clark@oss.qualcomm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<tjeznach@rivosinc.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v1 20/20] iommu/tegra-smmu: Implement tegra_smmu_domain_test_dev
Date: Sun, 12 Oct 2025 17:05:17 -0700
Message-ID: <7c06a0d6165e69b7a8aac10e5b8aea45c8e020f1.1760312725.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|CY3PR12MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bb0a35-4e89-446e-67cf-08de09ec5ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Txk4NSskoZkwOYl3/X/f/kcpNc0ofUJHsse7PoIuysRxafHaNUojgxxNlF7c?=
 =?us-ascii?Q?htKLe+Fa1mH8bFcUxlUXB5J8AyFP7zbQJ7ygpP+IZ2+N7lvVz/F5bXynE4Hr?=
 =?us-ascii?Q?824tBTBNC1mVX/JMDnASOIF88uFA4O8g6Bz2/DwAxApRlsptZF+aqYmxT8JR?=
 =?us-ascii?Q?Lcvx5Itujv/h98L6gojKQ/ReWj7JXmAaBP6M73gx4PCcik76X7pNUGNLoqJy?=
 =?us-ascii?Q?xZYGjTHfouZU+M2OFlzM6Qv4qLFINhYlPiAHv0slDqfNNXx347UBVzaeecNd?=
 =?us-ascii?Q?JEE0OQPIgxmO2Ek9jtrsc1bY5qxRwBM+45rqzmxExhXiHHKgUlTOhb+vANlD?=
 =?us-ascii?Q?iuAJOf7Pg0CN1347+0oExp05rg6ie54BjiA90pjDx/VYKgWbY1HNEVkjfBrz?=
 =?us-ascii?Q?UQ5xen4xvD4N7YkAcCC8d8L/r2tN5FcadSc+2ry7eoKzIUwTQZJVXg2M71KE?=
 =?us-ascii?Q?o9Vxx5GGtxLWzddLboo8ZZVu8U7JGErcJP5LLevqrN/KPsIdGzxmKWnqyXwn?=
 =?us-ascii?Q?X14eiDrdccSXYmKDLYC5g86OtizZXXOvXPBZKpIZMyiFEVX6Q0UydSXNS1b6?=
 =?us-ascii?Q?q0RxCB6I+oc+kzh3V/klTxRBgi68zxrHyr+u1NSQLq0SxMNz9Z3dBisp1GqX?=
 =?us-ascii?Q?V39Tqu8PlC8JpZ3crpzfG+7iR1+hHludowJ6MTXk5ElQgcgYHw0Cl+e0jZp2?=
 =?us-ascii?Q?5EDjRcdQ/N+6Z1vNa+4lkfxKCvViIG2w1H4nCk+IZ5yEjLPvrxYlAx503/gy?=
 =?us-ascii?Q?5lmBkJMv8tdFCjhgkvFc+HIAg7BsyLS3FJT7iFmk/JtFuiY3X6vbD4uq9gy9?=
 =?us-ascii?Q?NFWU4e9sXRQV6bKjWaxiYRpB6u8/Ed1oypVHwQl4UvOcAEssq5Lk7BmOt6Ke?=
 =?us-ascii?Q?EcgHqAK33HZcegSPf4d08zisdyLf11L8cB706HjqJ1oEcKSd4VlnBHDuLE41?=
 =?us-ascii?Q?Kvw3JwcYuVkTk0W9I9f9vRaLe56V+MpDUqF7OiVLDnmVarqXY6FOe3e6jaNG?=
 =?us-ascii?Q?jcvVJkhjMBVAhoUe6WjA8hx9c3zyPIcgBV3H7qJeLs/5Hdujv0TpU5oJSbTp?=
 =?us-ascii?Q?BQWJZbTrtRQHTlHjs6czUOBHq4kJD1fza59sd1amo6dpA91cKVPL3WBKBswi?=
 =?us-ascii?Q?B2R0qE/0v/DwFoum9H+6lrozqb4P+4ybhqiKqf95aXSbYJmBxgHd8MhlakVi?=
 =?us-ascii?Q?9UNEexPMW8GiDF8v8fmXKzC/Nn6rgPzfH68G2W0eKBrOfqS6ac2s1iDRE1aw?=
 =?us-ascii?Q?pXOiCMumRM0P+txGGJbEsIz3iFXsG2tKAXPJEZRCZsQZqLT4ivI/fk8pOQdf?=
 =?us-ascii?Q?PhVI6AEDacVVsM+apcA9iK2osA5BId+UT/IulctHGyO+xPvd3pM+rm+7H42Q?=
 =?us-ascii?Q?sAf5sbyDYgq19WioflLb5aGgqCKSeMeMi/wF9A3UfzfWqmT0B0W2iZU9w/oi?=
 =?us-ascii?Q?hLxjJfVOgjS5mpCk8iCKD9nbZ+1/zqpBXQPIwCv7gtXakg95tvmvBBN0w8B8?=
 =?us-ascii?Q?eSypBK8aB+9hfT3gpFmIkrllTY4qd1zj7AKRqMOE3C4y/b7SyiDgZ16YKhdD?=
 =?us-ascii?Q?qcQthlTwRe40bG25Gsc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:30.8053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bb0a35-4e89-446e-67cf-08de09ec5ce7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9704

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 336e0a3ff41fb..cfbe67678a426 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -489,6 +489,18 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 	mutex_unlock(&smmu->lock);
 }
 
+static int tegra_smmu_domain_test_dev(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid,
+				      struct iommu_domain *old)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+	if (!fwspec || !fwspec->num_ids)
+		return -ENOENT;
+
+	return 0;
+}
+
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev, struct iommu_domain *old)
 {
@@ -498,9 +510,6 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	unsigned int index;
 	int err;
 
-	if (!fwspec)
-		return -ENOENT;
-
 	for (index = 0; index < fwspec->num_ids; index++) {
 		err = tegra_smmu_as_prepare(smmu, as);
 		if (err)
@@ -509,9 +518,6 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
 	}
 
-	if (index == 0)
-		return -ENODEV;
-
 	return 0;
 
 disable:
@@ -532,9 +538,6 @@ static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
 	struct tegra_smmu *smmu;
 	unsigned int index;
 
-	if (!fwspec)
-		return -ENODEV;
-
 	if (old == identity_domain || !old)
 		return 0;
 
@@ -548,6 +551,7 @@ static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
 }
 
 static struct iommu_domain_ops tegra_smmu_identity_ops = {
+	.test_dev = tegra_smmu_domain_test_dev,
 	.attach_dev = tegra_smmu_identity_attach,
 };
 
@@ -1005,6 +1009,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.device_group = tegra_smmu_device_group,
 	.of_xlate = tegra_smmu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= tegra_smmu_domain_test_dev,
 		.attach_dev	= tegra_smmu_attach_dev,
 		.map_pages	= tegra_smmu_map,
 		.unmap_pages	= tegra_smmu_unmap,
-- 
2.43.0


