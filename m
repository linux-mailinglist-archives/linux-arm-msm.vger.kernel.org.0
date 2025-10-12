Return-Path: <linux-arm-msm+bounces-76879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BCEBD0DF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAC2F189448E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 23:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB7E2F1FF3;
	Sun, 12 Oct 2025 23:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LsJWqmSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3CC2EC54C;
	Sun, 12 Oct 2025 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313489; cv=fail; b=bOU/OH/nkkXxg7Nek7G56EAGII7JJe1TLdo5uZ4/x+Wfid3GF0A5FDuTgHOIyWMriCf/z+drXRQEw4DOkmSu26H/Aihu3CSksmP3pKT3GKlfIto3cceYFHxKh6fqCxz1WjPvsbHt96XuhgHjfnszb22fCbXGjP8Xok+TqX8Lq/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313489; c=relaxed/simple;
	bh=kCSbVwyS/dV9duyQucTy9V+pqkBtHIrMgDgvlD28y58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RqB3TEWvfjtlUCp/QNNCePHlPOFdfR/ZS8T9jd2Ni9fx929+ZZ3a8zO1BY2DIAgDQxr8BWmG1FWeAClgBmFRxbYaqHWmAmV66pkaKukZkewDzxTDruRjGOUxyZikUyJeeLtMCod4U4HZcK/i2HIjtGDx7HfuosftkFzDq5jXBmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LsJWqmSp; arc=fail smtp.client-ip=52.101.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrwMawDWQuymroLz9lHNG+8E5EOH3jehcfFjyh9DGUPX9whBQbfY8EwoXNb2zm5zO5UZTRVqoSYLgQulfsYoieSbyyBy4AMo1QEvVKF3gtnuwX8Eu9neySFzAUzjerA+rsQJgH/tjWH4w9/UFdsxIXoYPJMMF9G9a2R83de/NZ1tmkFl5Xgcm5ldcB81QC4cF2AutQoMBGm0brOizaFNAGDg9L0DeuLmwB7pEUPf1YfXvgqJ3jMMlktA4Zqv5pOKzJe0Ed0ketFkKLUN7VX1W+JVU+PD2YU7A/ukMC9ZS9FnISgxCCmG/jdmukbAiiFyalK65s5phUGf7PzT5OpNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPoppCKHD8SPZBpqix/l4W3LqITOl3uJs5lCc1U1ve8=;
 b=CGlbli/3uDu2qxzJ3AVI6pSVR7VaIaWWTMme6BBkbBRnSKJUedyUC/Oe1uuCxIJg7R03MxHTijdnVxVDYk3TqjYvZzBql65A3mhI50sKmnrPRXQXqzaaCi6gR7XkQF1uVNYyRWw1ssXz/YYpv14J49ZRJG+ux+ZycbvBi0mb9FYwnF+ahV336RKQ5S9YcFShcxOKGYnwAKu6PqydqzYtAIDL3xaJK4ft3IVYpvQ+n/I/6GcPpD5go1Q8awqBY3yYqgNUcg4Drg09ln2T7xLtsBWqsD+JGCsnTk3IkWTweXfv30v3J+wSM9XsETocBJAd3ZkwiIT7FcXP0LenNqW4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPoppCKHD8SPZBpqix/l4W3LqITOl3uJs5lCc1U1ve8=;
 b=LsJWqmSpCMW15XT5WNKQApHSHNDYRxNsNbcsYrvdorpLTGswS9FCx3sNJyrj9vAPM9G70KeGbSh9khdi8smDSxC62m4Pyr9nNInCrx2RPG5xMEYwmBFnvrcDYAjvckl2I2x6Ba6pRNsStPV9eHBmqhOW+6JvyJdXK4skXxVa+lKoiASUKtUhOTiUvTfQRYL1mkdVG/KlgYMEAV8En9P5cCPHQNfMXGbfAetF2mBpQUIDdz0b4FARlKbw1PWIcxVChhAO8GvRVUaBWFgrLAVJeOwCBsyMVkAFe+S9dJt2ChLB0tR1qSll7C+5zKdH/eJYRH60qFr8JmEmdLhzSlq8TQ==
Received: from SN1PR12CA0070.namprd12.prod.outlook.com (2603:10b6:802:20::41)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 23:58:04 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:802:20:cafe::89) by SN1PR12CA0070.outlook.office365.com
 (2603:10b6:802:20::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Sun,
 12 Oct 2025 23:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Sun, 12 Oct 2025 23:58:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 16:57:59 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 16:57:58 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 16:57:55 -0700
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
Subject: [PATCH v1 3/6] iommu/exynos-iommu: Set release_domain to exynos_identity_domain
Date: Sun, 12 Oct 2025 16:57:39 -0700
Message-ID: <56175bec385d24af9eb2a38632e1d6ce889025e3.1760312540.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312540.git.nicolinc@nvidia.com>
References: <cover.1760312540.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|DM6PR12MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7ef840-c66a-48ba-6ce8-08de09eb2e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O5ON+E57VtgaAvyRQrKFuVui5tOCkGZ2emh2s9achGkNkEjFgq9njENeor71?=
 =?us-ascii?Q?l4gP+TM5N2yRLQha1zcClg2MNvB8Pqis33thqTjrSG73S3MtuzfLqx5/22Rz?=
 =?us-ascii?Q?TyMDZBl2GGAEafO1zqwOSdKeefAhY3C881BiC5S/Ksa8hygjllriRpUNeGx4?=
 =?us-ascii?Q?MD9b+eZifZmP450ygGZhDKppLCNIo9bvaM2uhT9DxQMgw9Rkk7zFqrGj6cH1?=
 =?us-ascii?Q?54vDn0hqofO2awmRAHv2vnmC1y4WbdE7vPWXvvxff9D+zGBZc82i+JSOhd9x?=
 =?us-ascii?Q?+PCDUPPdl/QDXA6OugU2ik26odN8lYxRohPyFuNAG7vCz5B6R97tHRpEtdrj?=
 =?us-ascii?Q?Kp1nkteYRriEQklmW9iDGQrBNaAGJpBRaVaKy7OBfa4To1XQh3S/p8uGlPIZ?=
 =?us-ascii?Q?lF19evy/68fgkADRQzGF2x9GHanE5CEutQorCGkeEHsDFttCFRVmmQ32dt5z?=
 =?us-ascii?Q?Ip39Xqn93FiOoACVv8bS3nnOaJJORTukE02PbSpBVSVdtpFbtUr/cKpEsv4k?=
 =?us-ascii?Q?9cc4Tzd65tmiNNi7u4FfHJNjLVQoa56tHjRTRPtA+qLd+osmIz1hLa+28QqF?=
 =?us-ascii?Q?Rg2+Gi6ks0GyLvFa25aDN0i14o3Ovf31XgU2MpQnRSwGp5UGYrYlSrklKGch?=
 =?us-ascii?Q?s0I6IDgxo6H9haVQLRxs9Pe/ZV4N3ByaCOy7wihniUK+c2Dgg76WaWOIZP5E?=
 =?us-ascii?Q?GNg4bV2Rx+U6nRmuf6YcFXDQ6hg+Ta8mybTqKBVya9D8hpyRgcd14qRvXbGm?=
 =?us-ascii?Q?zYfKqphMkNmAUhCk6NQfreyl1WTWpRnBza9Nid1VZ0P94Y8o7TbqbRPLqt5x?=
 =?us-ascii?Q?3l6gp3g3VaMe/lQd1DoVBOCAs2OAMPmq5QSP7OQy3wWL9tYtVG+5lw9IA7NQ?=
 =?us-ascii?Q?JoTObAFYkc7szdgojywmNZ1Ee8t9SZgF+yh1/7c7jQwZP3K+uUUp/SSX0pNA?=
 =?us-ascii?Q?LNb3wNCtg+alw55sITMrpnPTbKMHi4ksVuBHFWX3ZwH6FH3WHTX63xSpvlpt?=
 =?us-ascii?Q?z7DE1mHx3qOHcoJIQ/N/UfqpOAyhdqMYJAD4sDlpYZSLGp/2GZyrxMDRFFuK?=
 =?us-ascii?Q?/SA39M2/plBY9KnasGSlUkdhex3OIrcvv1jv8d8GZqYfz30nsNt5dIDINGHL?=
 =?us-ascii?Q?IzUPjLzxxLY2VY8yJ2oai7Ohmg1zQi/6UI/KCiHlhCcSWGHy4LmAOPrSvXH4?=
 =?us-ascii?Q?5zdAKomljAhNOmGy0miFO949/IBum6hS48Bx8U85jNY5ndAjuk9twZUVQDQS?=
 =?us-ascii?Q?xBFLjPxLRtIqLufyH5GCoyJZWsJbEqF5vplUGqj5jLJ6D4zVZdXd+b1irjrZ?=
 =?us-ascii?Q?Sw87bkA/Sm+hN5aRvdysxuNMAcQAKheAgr+lA3WF0aFQ3QVEMHJ397s9BWBY?=
 =?us-ascii?Q?65OsuDpwaexSyB0qRjJfXouxi8JkZLxcohxRofZKj0ktZ96gmqNLiODwX6sf?=
 =?us-ascii?Q?h1z8smqWpm+3tVfv1D9h3Swx/A1d4YJiKXeiBa5gb6Q4tpvnhomZkyXCfsv+?=
 =?us-ascii?Q?QIYpyS08gHCHnyyYosWEXiU0DUByNeOSfrl2QN4Jz4C+Lw6K3zxx1UOS44p8?=
 =?us-ascii?Q?CdNUFH1a53l5PRhvwZA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 23:58:03.5731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7ef840-c66a-48ba-6ce8-08de09eb2e97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075

Following a coming core change to pass in the old domain pointer into the
attach_dev op and its callbacks, exynos_iommu_identity_attach() will need
this new argument too, which the release_device op doesn't provide.

Instead, the core provides a release_domain to attach to the device prior
to invoking the release_device callback. Thus, simply use that.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/exynos-iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index b6edd178fe25e..0857519ca7188 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1429,8 +1429,6 @@ static void exynos_iommu_release_device(struct device *dev)
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
-	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
-
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
 }
@@ -1476,6 +1474,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops exynos_iommu_ops = {
 	.identity_domain = &exynos_identity_domain,
+	.release_domain = &exynos_identity_domain,
 	.domain_alloc_paging = exynos_iommu_domain_alloc_paging,
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
-- 
2.43.0


