Return-Path: <linux-arm-msm+bounces-76896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F236FBD0F07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC3134E6167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C1E2609C5;
	Mon, 13 Oct 2025 00:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VehLefYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FEC15539A;
	Mon, 13 Oct 2025 00:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313978; cv=fail; b=nrBHjFspl/Jx6MtHu5Ltorr4h3wmiin5JKUShP9OUuVuKjAM+Ylo8ntirHsxDUbBjanSgFbVjPKtEv56cpZvGTN0X6BI4Unica+UV+CeTG1u7+k21w6W7vmo5o1LUf+Q2axfJWqa0NAMAdZzHupbmJRiaoyTFbE4azM/6qvlnxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313978; c=relaxed/simple;
	bh=zyRfKtpng8dCxEpeRKCsMoirRovTn+XwyexrMJQWuw4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FnapXcL8dr2gvjpiFBLEbTDxDXixA22qVottFNB8NNtBwTyyi/paepGLsxNzHsM/qChJnZi3epFEDkvdXkTvVDkrE2HfZ+/W3cXknHltCweKN296kfxfcF50eHL6rlyYD+RLa/yJlyZpuoHdMXSn0+xABkzQ5HfBfE/MvW1KArA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VehLefYR; arc=fail smtp.client-ip=40.107.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lC6hFb9UQc27EZ2MNbDBXXlWagloUKzAvePuEQ4DrYdIQMeHS4BJsyLggqxqh+NyTFuM4kceAtY9VLehj9HZYS5repF6ZoSX4lG7sF1letoU7KGM6aVamKsEhHoVzopfKrQkU0IZg3fitvsT/1N10WErlEshNXBcWJlfk6rTQc+xB0+U36GGdVhz2PEsO5z13pkah3icUG8SH7uY2oCp0JPLLywqfPQGv9pmW9LP+C9f5M4xpemDF0QEMt+YRXvsn5vvMj6Opr47CVAnhntZUR1VOChDhl+HZnD5EfYpJC309LwnLBhunNK8WOlg5zHM4xoPyKEa+gT3IDK4UL5Vhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5v0tdio0rtxlLQ2VpG1h/+5eWhyMJ2ZieoNzIM35Wg=;
 b=a0wo/UfFPpUWF2KI7Cd3gLtdmqX6+c3ZsOdgYQJ3I1IBQoiHOMlq+3rqOvykRn5NN51sByLaScYcEBnHjKhnzqxmmyvsJDsa1QTIJMgCqwhbHV86rUgDBH1pqrCejS+wohf4OrJddu5QqJqSqaY9OaVSWkNYW/eSCm9rN4lFRy+pUkGgt4LCbNidH6HvykJuWQwGo9xrB/Pzh2VLAIkA2O4Wj53LwxaXv2wLOV27Bj6PC/WL7CdR9+g8MZSW4gIgh/aOEcO5zsxxGbqukUQj7imJGgoWdfxyv+n5d6BDAAWtOCJUH7a+mE8uQZ6OIRzacKytCXCmwVHA/FGlefx2eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5v0tdio0rtxlLQ2VpG1h/+5eWhyMJ2ZieoNzIM35Wg=;
 b=VehLefYR8RFrJm4Yqw64nYYC4vzus6G93HfEKVcORMreN4yKDVcGIwNYWl1p2nsic4tSH6EAi6GsxpkTPfaSyx6M3iG3A2yUi2puvw7J8//LyRJ+7Q1GVtHnNSRsmarAmYfNyDHwfNI1wfHIQWkkkDuus/Vij7L4sOKLCHjcxsCeXMBJXa7rDTaAuaxxe21Zj+EhEavj5YijllRiHo8owXBwRIInM/d3r3yWuxC5OAhbyoFzOBoGiUdVz79iVor6JuowVZxNh0gXBNSgti0FFRUTK/7xV6Ny8S9hPMW5vh7x3T7I/cix046Zi5KvD2GdrEa3od/tKN4V0LRIxa31wQ==
Received: from PH7PR17CA0038.namprd17.prod.outlook.com (2603:10b6:510:323::17)
 by SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 00:06:11 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::24) by PH7PR17CA0038.outlook.office365.com
 (2603:10b6:510:323::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:06:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:10 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:05:50 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:49 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:47 -0700
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
Subject: [PATCH v1 08/20] iommu/riscv: Implement riscv_iommu_test_paging_domain
Date: Sun, 12 Oct 2025 17:05:05 -0700
Message-ID: <77e60e630435ed5fcd755a09126c0bc2e85bf1ff.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SA1PR12MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 7becf227-8728-4d92-6f71-08de09ec50f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qy2XFjOA+tR7kH9q/IARx/fpOo5BzZzfC8gz7gKRUi7to5qhWxKy8TC4HJLj?=
 =?us-ascii?Q?Z10hdLpj//GUw839wvaaSTtKCDk9xDjxsfPp/ZMPsl0hUbqq6SY993QN9hLA?=
 =?us-ascii?Q?ns70C028lh9s5msfHMzRyBWbSLWtJcbTp3n/28kGuZGcOYTLZAP+ZW5WfCSS?=
 =?us-ascii?Q?2KxlhyB/izxLLLrjB0hlxqHZMG1Bas9+FV7jUDaM8GOeysPkSpEADw+bVLiq?=
 =?us-ascii?Q?WX4CppyEYuoJiXnZjM2kbugV98+HulyS2Vk4uRLnPKikWvWUUAUsuwAvZ9kc?=
 =?us-ascii?Q?gDTg79YfVVhGgUPpwq1SlxWIC2CcLteLY0IGf0z6hgwLU/yPyN7nqFN1r03x?=
 =?us-ascii?Q?7S5t0qjnh7yDnipJCr1ZCGw2EPuvRjI9apUd8L+lq7Mt1qPEk+5e097ou2tO?=
 =?us-ascii?Q?zVP56mc6EIryboW3j0JgAZpGuQvoA//NOFq3lCI/xlKPJy+9et4FFWoWJKnI?=
 =?us-ascii?Q?jhzFety5ynp40rnG6Wu0KUiSWAzuUCtCPr7ahUfCfm7pT8Uaw4PzX+dLKW5K?=
 =?us-ascii?Q?fkFzLIBly0MFNNsWMjtsaQRNIoiM3ZbkVidxYnU2ArEXB4CULD1psN6Oj4ke?=
 =?us-ascii?Q?kBn9l0ydapILg0zXQobSdE0+cE+zkS0iuqJ7NSquFasdAVwRJKKSTuFrXw0P?=
 =?us-ascii?Q?AisuQt3AQ/cjL4TZT7Uf7YHbWz/jd3WUtfaRPfcAaFpN+PdEsWrz/M5rT0E+?=
 =?us-ascii?Q?lJl+EMG/VoGLTQBi6gIYpbIOgPZvnhZL7rm7+6qglHZC3FpD4Ha/aKyF8RUn?=
 =?us-ascii?Q?a/aS+fZULeSAQDZ0anyikE1V6Sbb4N5ABdizBUehbWmeIdoOTdUz7YzSgIMm?=
 =?us-ascii?Q?A3OyMYS+nvYemcP+IW38bc1dLVYiJlj+roISRSgaFVkqa62EWgnXpcpIXPtD?=
 =?us-ascii?Q?fdCtqYdiAHoCXUuSVwZV7q2i97ueX1cV9VXAVBXYZ2huPfa7sXDSbvoB+AjO?=
 =?us-ascii?Q?6P4If/qK7ZC0WUF4xxomBwAJ1ihzDfrHrkw/DlQ2GVotUm3EpDZZT1blCkOd?=
 =?us-ascii?Q?5V7IM225mThz7VdvkbVbbbmstamz3GxN0fo5L5j1CS4tlzwJZFu9hA9aral6?=
 =?us-ascii?Q?aTtJ7jmwHrc3nfzIQHBNcAcBzFhIhlg5MZ8aqNuH70tHozhjYmF/YXCzgqW+?=
 =?us-ascii?Q?iydzUQfuMC/lP9Zs+wblNCItIVc5OponzYe0B73wxVtIl/l7VyWAPxst5pVX?=
 =?us-ascii?Q?OFjblK3Io7CQb9bPkhScJ6ZUvqAfcXqOrXw2zKBPi4rQv2pOfQx3N3PlcAKw?=
 =?us-ascii?Q?DooKZkZN+o7levvMqTlXxEJQrfj13J10HPWuC6ZbBErqXzRDW0oabcRdo9fJ?=
 =?us-ascii?Q?HnbhyZvNuQ4t9YVt5TYNMOc1VDIEs0JpTUFgvBioljibg4jX/4skQSwEGxF6?=
 =?us-ascii?Q?q5nA7w8iMF+/casIjbo+lTOm1JX0Qhppi9MfdTDgG5yyNRWvFEeFTIw4ugx9?=
 =?us-ascii?Q?ca8DoEPFHtyH70Bb+zwu63Dl3K7kuZ3AqUkQbEVnKd3/t99/3JIXFxDwzL+o?=
 =?us-ascii?Q?ml8umwXZ6v+JebeSHrxcx3cc0Oo18VRnBHXjkyJUeakokHmIbDMup2pHLrnG?=
 =?us-ascii?Q?j4q+1SdyFvRHRNlv+gg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:10.7766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7becf227-8728-4d92-6f71-08de09ec50f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d9429097a2b51..6613ece2c9f41 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1320,6 +1320,18 @@ static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_m
 	return false;
 }
 
+static int riscv_iommu_test_paging_domain(struct iommu_domain *iommu_domain,
+					  struct device *dev, ioasid_t pasid,
+					  struct iommu_domain *old)
+{
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+
+	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
+		return -ENODEV;
+	return 0;
+}
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1329,9 +1341,6 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	u64 fsc, ta;
 
-	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
-		return -ENODEV;
-
 	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
 	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
 	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
@@ -1348,6 +1357,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 }
 
 static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
+	.test_dev = riscv_iommu_test_paging_domain,
 	.attach_dev = riscv_iommu_attach_paging_domain,
 	.free = riscv_iommu_free_paging_domain,
 	.map_pages = riscv_iommu_map_pages,
-- 
2.43.0


