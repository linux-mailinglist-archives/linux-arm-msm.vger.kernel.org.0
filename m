Return-Path: <linux-arm-msm+bounces-76893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A0703BD0ECF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BAE6B4E5E1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E27A231827;
	Mon, 13 Oct 2025 00:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RLW0ragb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2821CA14;
	Mon, 13 Oct 2025 00:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313975; cv=fail; b=Otz+cdVzGF+o2HItYGjY9G59SGYwlJx1E8o6OHTyifBZwU0EBpp/nxkJqBZMJyZYKP4nHKXRfKB6z0iIoJLus9IJkUGkQOCBjHqQMaODg0DzSNAz8UiyMpIkG7ZTMJ+Uoo1H8DB9FGZf890rquf2jlxBQ1xmHGJ5RIah+Ll1Yng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313975; c=relaxed/simple;
	bh=+WM+y/MxLhbm4NcwKhGWRjRjYQGrBJ8qaRjUUZaCk3w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A78/d3XiO8LUQXMc7m2vCVi0cucAoqrLxMK/tTHEKH+2gJpQvLnwnnZYp4bGqrz5wMgPSXd3yFE8ciAmWkP+aL7YKNBfskDdKkP8RmvwoBmueNmvvFBzdp2qjM9BesChlyv4n6A+enGPH7yL4k+qm97pxtqULj0JupfxG2LrXMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RLW0ragb; arc=fail smtp.client-ip=52.101.61.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrIM469+EDWyAtXJqZsmebaiEOjBQfS4oNkDZcdYmsE3QXJrkvHkMisfSLOIbtQzknKiY7hmdZxTQmN7qwqk+ytuStG+cA4YlgunfkM9xGE2ZUn9FosL6gERvtOJpgrMiZ3tdBShvGUWw+RvM5IN0YDhBXxx40LYJVKUNvP2dm2cnndvXbhx0AfzVfEe51gLyW0iSfO3x9yyOrIVg18c6pxJXwJuzonjgWsA3ywJAKH5spRrr9pfuzBxPvO6vjiZnrBIBQSY5QaCDbC0PLlgL0KD8OQpla5UI2t9PwdSsxhqygZQpTOKKwR34SaK7MAPnSPhaaiL7EISEr06K/ZcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2TpiFmSv0Pxeaaw85UPysodXw4ER1kMjfJh8j0adC8=;
 b=Oeda0z1oNc8cwbXA5j7HRWRm11ZvqMmzn//1bIJXczDSCZXDuKqv/ti5E6NcGckrVK85kZ7bI+kVRMA4rxlx+CHUC5o6aXY/JHtn1OoAeEMuT0LcJIECt33y6bF3qsz6Se304BNQ4Zh2ovsqe+x8kW8hSFycPE21n/Kfwi+Wt7jQaFvcl+ir3V7xthWbPFst+Gfim7aklcxD0RL5R9HMv+UwoOOjfCH8GpJX2RFvLfc+yP2x6owpUUojuuQ2pBVRSRaFU4w7s6D0DQKOb4xIQ11ntdtAu7U+lbV9HxkjBNmpo+YHZu2znYwgqAbl/bOlFp8KkBhFS0DXNspdKaA/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2TpiFmSv0Pxeaaw85UPysodXw4ER1kMjfJh8j0adC8=;
 b=RLW0ragb/aIj3SgidX2+s1rtBN3noPt3pNZDfQt52Rtj8lQ1i7PwQkEj5LV+fiOO9zn1fAcAYM9bpS/2Sd2gDtYaCrWJ23VmLne6XeTBeyKhtIIVGLAKRV5YF5ZWeKCRbAr4eu/rSHVmLy0wsptbwklPix26OPStqquzyMSt8T5vDmimKdZufFZVEMN5R593DJiugsAeXyB8ccTnDRDzvDfUwZ9cpSusBoDTIJukkuiCBD/wFBPxgiN2lP5SeD62cLu+UTPrSgF4OBLrHa7SUywX6BrbSu6w9Z8McOV9q1Q5Tl67/RH50XUC96KVoLNJofWVemArOkywwKopsKPGfw==
Received: from BL1PR13CA0086.namprd13.prod.outlook.com (2603:10b6:208:2b8::31)
 by DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 00:06:07 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::9a) by BL1PR13CA0086.outlook.office365.com
 (2603:10b6:208:2b8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 00:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:07 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:05:57 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:54 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:52 -0700
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
Subject: [PATCH v1 10/20] iommu/apple-dart: Implement test_dev callbacks to domain ops
Date: Sun, 12 Oct 2025 17:05:07 -0700
Message-ID: <f38a0630f32f842f4c00f7191b47b19a75747af2.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 699abd7f-dc73-43d3-1561-08de09ec4ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KB7grSuFyoKA9/1nRgAOzuAOjP7aMDt1AjniKnBpcTKdpzcYu9M6czQuVhRF?=
 =?us-ascii?Q?+0P5NbtLXUNBb+GdGR/eGdQYCZft1H7XaS+yPUyqcn15MX5xm3FsAwrMYEZY?=
 =?us-ascii?Q?ondVoovjWxAgzzqJTh0Xj/88ZmQ9kdMO0bbHJMZ4w7nq3ga3JMld8gW5njWS?=
 =?us-ascii?Q?4mZyt5MwaaM74APzl6mZQFpBG3MVLNqsM6H3w+Wm544TP2h/yy77ZQDfXVKl?=
 =?us-ascii?Q?29sxiFTIsD+gMM34BuuTLO+8aTpG9ScZBe0kmtvnB681mCro7Ikrrx/es8qX?=
 =?us-ascii?Q?M4DqwFpDPI+wUknmNyR0q8gRkHqGOFcbYLhjrpSX0VfmeVuIndODkQId3t7b?=
 =?us-ascii?Q?Cvtkt0W87bZT46czSg7cmGGne6BezoFbwWCTZBRBDFEatUI2fArAYiW9l5YR?=
 =?us-ascii?Q?kAx5UIqWm3+utFzG8d7zgyqwZqYawrJ8gW5ZEW2Lbj3gnXoz9EuBXQDZ1Uk7?=
 =?us-ascii?Q?JbycaAD/gCpj/uYTCvP1nHCrdbT6jd4+ha/4P1IQ8drgwsxZXwRRlVSLWtri?=
 =?us-ascii?Q?f6MTlvncqQ0MSEJauy5GHUiaCjbm3cGt8NvogQtDrYA1UezPfcU815SoJalF?=
 =?us-ascii?Q?UO5PwHlO1Nr03exrRxrXBj+33oRwa7taDFU+Gf+Xvqx1biX+xvXtDt63qCBr?=
 =?us-ascii?Q?v5l3AGo6iaGd6Ktw1J+YO+LP8Gx0qicd/6FOBUgrsBtlQf4fRFQyb9YMfgnT?=
 =?us-ascii?Q?gKt8TzieDahePnK+bmTiBeKBzWTIZ5t30/fNRP0o6z+lGO3YtO9+Lzfp2uhb?=
 =?us-ascii?Q?58Yxlr6Y0kPp+9dwRvxp/uYCEtwnVhiUYPhfxgi//Fyahob25PhMe3jQyg+R?=
 =?us-ascii?Q?WXQZKSZjhNzTiB8pZr42VLgQGPzx26oiInx8LLKpB0wd+Vt+fthcmypMNclC?=
 =?us-ascii?Q?1g+sM7r6xt+yb/P3vaGDJ3EI8bhG7V5XgfR8IdE5/4CuoPVqMgV0uZ3cyNP7?=
 =?us-ascii?Q?NyeJI8CD4gHHMLzze9W+s/tKJ7GI3GImw6e6uaWW1o2eLrZjb+LT9pTvvOtv?=
 =?us-ascii?Q?VrESwhph5GRuEaZilejGj2mDdIvO12LBsiG8xUOugW+cPEl5noss0QPTguf1?=
 =?us-ascii?Q?k1VHj5j1rnsImBHCzxWESRMeTl2jymuTOuuitJPV8VLnqjGKTQQlHsUT+W9j?=
 =?us-ascii?Q?RPVj8PQpNnB9m44UuackapRFB0aGYeeX+l8vuvRxwAcJq2wIw6i3vcqfKYRa?=
 =?us-ascii?Q?rw3kuppnrD1HljwipkF3Xb/gzT/2pm9ZOiuoZ3qapU/U+xuv/Oz0uXbbv66m?=
 =?us-ascii?Q?TicLlvNNY33SYJDsCa9DJDzJ7dbAHkY8vQQy3Q6/zKx3XxYbphVnm3iomjEH?=
 =?us-ascii?Q?tM7tGfQK7recFESbwQRJk/svKqS+Lnehfs+gThVqt0GYlycEKlwJ6Xetx5Ac?=
 =?us-ascii?Q?h3/NpcLlXyd+GTrl8bFdN+U3R+cAx0T6k/L5yExlni8j1Xn/AVT9hRDiq9aN?=
 =?us-ascii?Q?7uVT+LAWY9USs0QdNVfGZbpjXWlfNAquN+68tDGznbUBAl67neYaXYXqGNE3?=
 =?us-ascii?Q?OjoCOqoLrZfWNwkBJdGccVbX1ljPvQyjM6PZJPQ6hr/dE27Tsh5R9/5h0j8p?=
 =?us-ascii?Q?IE8cTiHRU0EqeuNuIAc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:07.2276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 699abd7f-dc73-43d3-1561-08de09ec4ee5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086

Move sanity and compatibility tests from the attach_dev callbacks to the
new test_dev callback functions. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Note the apple_dart_finalize_domain() has another caller than attach_dev
so it has to duplicate the pgsize sanity too.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/apple-dart.c | 50 +++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index b5848770ef482..fb63dcb7462a7 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -593,9 +593,6 @@ static int apple_dart_finalize_domain(struct apple_dart_domain *dart_domain,
 	int ret = 0;
 	int i, j;
 
-	if (dart->pgsize > PAGE_SIZE)
-		return -EINVAL;
-
 	mutex_lock(&dart_domain->init_lock);
 
 	if (dart_domain->finalized)
@@ -643,11 +640,6 @@ apple_dart_mod_streams(struct apple_dart_atomic_stream_map *domain_maps,
 {
 	int i, j;
 
-	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
-		if (domain_maps[i].dart != master_maps[i].dart)
-			return -EINVAL;
-	}
-
 	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
 		if (!domain_maps[i].dart)
 			break;
@@ -671,6 +663,29 @@ static int apple_dart_domain_add_streams(struct apple_dart_domain *domain,
 				      true);
 }
 
+static int apple_dart_test_dev_paging(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid,
+				      struct iommu_domain *old)
+{
+	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct apple_dart *dart = cfg->stream_maps[0].dart;
+
+	if (dart->pgsize > PAGE_SIZE)
+		return -EINVAL;
+	if (dart_domain->finalized) {
+		int i;
+
+		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
+			if (dart_domain->stream_maps[i].dart !=
+			    cfg->stream_maps[i].dart)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
 					struct device *dev,
 					struct iommu_domain *old)
@@ -693,6 +708,17 @@ static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
 	return 0;
 }
 
+static int apple_dart_test_dev_identity(struct iommu_domain *domain,
+					struct device *dev, ioasid_t pasid,
+					struct iommu_domain *old)
+{
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+
+	if (!cfg->supports_bypass)
+		return -EINVAL;
+	return 0;
+}
+
 static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
 					  struct device *dev,
 					  struct iommu_domain *old)
@@ -701,15 +727,13 @@ static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
 	struct apple_dart_stream_map *stream_map;
 	int i;
 
-	if (!cfg->supports_bypass)
-		return -EINVAL;
-
 	for_each_stream_map(i, cfg, stream_map)
 		apple_dart_hw_enable_bypass(stream_map);
 	return 0;
 }
 
 static const struct iommu_domain_ops apple_dart_identity_ops = {
+	.test_dev = apple_dart_test_dev_identity,
 	.attach_dev = apple_dart_attach_dev_identity,
 };
 
@@ -776,8 +800,11 @@ static struct iommu_domain *apple_dart_domain_alloc_paging(struct device *dev)
 
 	if (dev) {
 		struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+		struct apple_dart *dart = cfg->stream_maps[0].dart;
 		int ret;
 
+		if (dart->pgsize > PAGE_SIZE)
+			return ERR_PTR(-EINVAL);
 		ret = apple_dart_finalize_domain(dart_domain, cfg);
 		if (ret) {
 			kfree(dart_domain);
@@ -1010,6 +1037,7 @@ static const struct iommu_ops apple_dart_iommu_ops = {
 	.get_resv_regions = apple_dart_get_resv_regions,
 	.owner = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= apple_dart_test_dev_paging,
 		.attach_dev	= apple_dart_attach_dev_paging,
 		.map_pages	= apple_dart_map_pages,
 		.unmap_pages	= apple_dart_unmap_pages,
-- 
2.43.0


