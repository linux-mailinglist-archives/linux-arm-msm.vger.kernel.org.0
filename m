Return-Path: <linux-arm-msm+bounces-76888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA04EBD0E85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8F23B73CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FC24501A;
	Mon, 13 Oct 2025 00:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XUZQ0UOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77A1DDC07;
	Mon, 13 Oct 2025 00:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313967; cv=fail; b=RTlox59J5FMm1Z54qh0+DwaKghPzEopVm3uOV1sr5Kedcp7b1WoxmWU30ASbRioiE4KMuZYJCY9+ok/cQvfTX1lzHCvUK9ppuWCXfva7imb6Pk0H6wRQAasZ6gtITwcvP6KT9/oc3v3cBFXig5kOQc6TEFcX079AWOk8hVdQaRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313967; c=relaxed/simple;
	bh=K2aHwX/7aW4OHfTw7Jx8YRDWe9XyHyl1NfOhSCx5hS0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uO6SOR9FFQlL+lhPGrF8XG1R0I1Qx/yke27txkFsOhIFbOT/fTGeh6PRmBuq549W88SJUtLrlntH2DI/UpfUWD0LolcxlJbEG15tG5gAtS2MElocaOiWOzxcyq/XiWDsysmkedNliKNxrii5eG/gGD6O1tTXv0r91/QB6IThUeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XUZQ0UOo; arc=fail smtp.client-ip=52.101.43.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hydjQ4w0MClPWowz/qLWw2Z+tngnVJEYDaXBkZxDfy3rR4ABcbkSpEVQI0dCCM6we9hTT9Egzes+i2elc4H9Jily1LKfq/fSN2arfKjbYdVQtKSLpBYrjweThRKhl9tMRrcWjwyegKRYBXQbpomL72Wd3HeUATDIKIoQxn/tHDvJndTQXHGeIB2JWPMm5FLsgxAzvPzOM8vvZZqabPtpFiubKX93DmvJLwaXMm/irhNu3kMyiMrXZsReny1t0Xn7qAXDmU7+KmvPhMLOm9R98IeYY8BVbjmFjkro7FZcGkPMNVqPe8mEGSuyYBBl6z0hqy+s753DUai9dhQc6vtiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/tl8btLMqZTZoa4YJsybI0ayC0J3qAhB5UQU93JFYA=;
 b=e7FMik2DYZCo6NhDmqvgCCL9aRhf1nLRME9H181NVGr6dxUkfIuGlkSEy1P5WMmwDYL0m4x5Xgf0K0CJvey3+bInVGmy67ysCEI2UBQmooCO2IoJvPqW4EaM56Bu3UWzZRqOVazdly1SAzVKmp368lvU1BVkKNFBvSg5H3hrMDgQwy2W6855gMuuHZb2zdqU8KnTsCD3x6yJNqnfvm+f+3tD05vpjkuWJkcmZLrJOVQYRGqczNunudVmUSvA/FAZ4fkTkadErreWZQb5vCNDxhcoE71kjc0cpmPHJ110fm6eB6QB1aGfhJnD689BwKhtj9EBc/rUPx3JTxeiUVYghw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/tl8btLMqZTZoa4YJsybI0ayC0J3qAhB5UQU93JFYA=;
 b=XUZQ0UOoAocPJRllc++17Ot1owhEdfnSxR99jrMNwiovxHKqTaRWAn4XGAzrhvfsKobl6t6LZUqhdfYj9BiR/aUbVdsdS45X2ZgbGc0HBO6cH1H73rVTAif07xDX1qNqN8Rqio8TZJB6NzVZXhXlj5I0UERipL/++ZQAPOCo27dVnPdlf2RRk9lWMEr3jdJTAaizWXkB5VY8R7dzSV4bbfsU/mJtoJALzwVFCdCIYLUpvExkv88WqWTFo5/MOZ/IWIo/iwam0tA94b0CQMfMeQc5R8QiAIbpt2WL49IqaBmj+q8K/RWACi1kwl1qL5T06WFZVM7ge41ME/+omQCmng==
Received: from BN0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:408:ee::31)
 by LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 00:06:00 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::a7) by BN0PR04CA0026.outlook.office365.com
 (2603:10b6:408:ee::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:05:44 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:44 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:42 -0700
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
Subject: [PATCH v1 06/20] iommu/arm-smmu: Implement arm_smmu_test_dev
Date: Sun, 12 Oct 2025 17:05:03 -0700
Message-ID: <ff644b97bccd6454bd770a481a89d0612a836741.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f53487a-5098-4eee-5aa2-08de09ec4a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vAFkRjJB5JStJFSzBCtyCX6nhRxwEgh4dQjIE2P22saOjD5LEnXMvkLo19Sm?=
 =?us-ascii?Q?zXC9N6/dUoKLvuaWuZJAK4NUg+vurrIqVhkBkQpTbI4woKCWuaB6xaaXoOYX?=
 =?us-ascii?Q?8NVAmKSZNqEVNr8RSkX6DjUaYaD7ZezsHG0y7icAWjtyZj0OdR/s0n5ePU0N?=
 =?us-ascii?Q?IOJC3ii+vEjdwF/jz7tfPO4pVEm8IRAfhViJSgqwflS2YXlEa6PbtVDtJSmc?=
 =?us-ascii?Q?k6k1CvU7FQ7VeronpexbMa74Vec1/DUOqmuiiZzflA++ltpvJQR+fE/uzkR6?=
 =?us-ascii?Q?km/L6u7OMe9BGi44efwQDKqKkfb3joz1jcSd6BnHGQ9M0EXttLWtBv8Ohszm?=
 =?us-ascii?Q?2gilYrbfByjYUn+86jvaQSg6nQqE67a2U1GANUrJhwESarx7PFuFdC7nuEzN?=
 =?us-ascii?Q?qO1aUK7aK1JqnpH7eE+XP7LOQBJIoSgPwttiE6ceF/zuojMV2DeqdPRiarwR?=
 =?us-ascii?Q?ijLjBXP5hueldap6siSj4WZ+QRzLUQK5bRVsp47RXpk3203i57MySuag3R/g?=
 =?us-ascii?Q?V3WuEBYQ+GsYfQN2VA/MR/AbPg2OXxvY9hKq0CYdZq8KROeKjoFDZJyNoOot?=
 =?us-ascii?Q?lDBr2dy/fiBAyUmZ+D6ScLgW8/00G47dxGCyhaypuZ3avQTJEPBHYJUzaZxl?=
 =?us-ascii?Q?jKu0FuRexoAHuH/U2tGZu6EWrjoSJOJ6FVBU0Hkz6iMXlRz5fQkbifeMLG31?=
 =?us-ascii?Q?PzEOVmA8EYvwztKRmxZHkXc+n59ABerc6UCNktHQxdGs7rNReKhDL5Q9NiNa?=
 =?us-ascii?Q?/ng2s452C+6KqLxG7YkFk/ZrCYPhN0HXdlL4fLSdQi1JLYVPa1IPt+P6+mvG?=
 =?us-ascii?Q?tTlbhj1TkF085M9IqnVknOlk15YGP6kDTCHnmg9L40T4a1oVtaV7Tx13pVFr?=
 =?us-ascii?Q?7T+SghpIR30GLTY2jG/q35LgfMz9yAMXOBhF+hVnrNGGxmhFcUx/d5dZgorS?=
 =?us-ascii?Q?QsfWH7G4hyj3iVhS9ZqCSn4RkrvHOcM8kirbNS/h9AtmT2Y/7NmhRLhj1Yzd?=
 =?us-ascii?Q?BllNu4+GtbJKhbUtIEaw7f4yPX3cxwwV9yRXouS1bA0dafpmmQAs68xpYBFT?=
 =?us-ascii?Q?1YC/9d8NAk0RsrbtEXs8vMY2GWeMStX3yW9hVbdVEJxt7ie/19nv2BeTGB0U?=
 =?us-ascii?Q?35dXvelRyr/Yc6CeFJNdIRwGJ0Q6RF8vqQ9Ax7q/RW/9M7UUcUkf/Jr6KcCh?=
 =?us-ascii?Q?g7Omop3i/1ER6DgE9XIJRwsWFq5cBFUrA34w52cXSPBUi3v4hLFzI93ahN2L?=
 =?us-ascii?Q?R0MHRyglpmq75a/lccTxWDxE0ysZoVMaPRQbFP5yB31Usb37d8u3WvL7VLKq?=
 =?us-ascii?Q?jKNlfiAemy6ZH8jo292k4/EdNExDnxEXIsB3OAYOIAA1Wb9PE90TTYukm2a1?=
 =?us-ascii?Q?TtvAhTiHOV87J0b+2x5wnwJSoel6S/FYAdyiLf+9DCBOh15qg9AFZ52QVnSb?=
 =?us-ascii?Q?hTVXYwF5Nr2oUqIBGUZVxMO+XGBi5F64JNWDn0mAYnsJgR4EUC5lm9XpoQ1F?=
 =?us-ascii?Q?vaBErmAjdIEVF/cpnG8K/1GzAZnElsGmOxycLkigPFTOmq0G7gcRrxX35dW4?=
 =?us-ascii?Q?/Nc0w0TAUQzWEktlnKM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:00.0566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f53487a-5098-4eee-5aa2-08de09ec4a9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 116 ++++++++++++++++----------
 1 file changed, 71 insertions(+), 45 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 5e690cf85ec96..5752eecc1d434 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -672,6 +672,37 @@ static int arm_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, smmu->num_context_banks);
 }
 
+static enum arm_smmu_context_fmt
+arm_smmu_get_context_fmt(struct arm_smmu_domain *smmu_domain)
+{
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	enum arm_smmu_context_fmt fmt = cfg->fmt;
+
+	/*
+	 * Choosing a suitable context format is even more fiddly. Until we
+	 * grow some way for the caller to express a preference, and/or move
+	 * the decision into the io-pgtable code where it arguably belongs,
+	 * just aim for the closest thing to the rest of the system, and hope
+	 * that the hardware isn't esoteric enough that we can't assume AArch64
+	 * support to be a superset of AArch32 support...
+	 */
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_L)
+		fmt = ARM_SMMU_CTX_FMT_AARCH32_L;
+	if (IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) &&
+	    !IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_ARM_LPAE) &&
+	    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
+	    (smmu_domain->stage == ARM_SMMU_DOMAIN_S1))
+		fmt = ARM_SMMU_CTX_FMT_AARCH32_S;
+	if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt == ARM_SMMU_CTX_FMT_NONE) &&
+	    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
+			       ARM_SMMU_FEAT_FMT_AARCH64_16K |
+			       ARM_SMMU_FEAT_FMT_AARCH64_4K)))
+		fmt = ARM_SMMU_CTX_FMT_AARCH64;
+
+	return fmt;
+}
+
 static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 					struct arm_smmu_device *smmu,
 					struct device *dev)
@@ -712,31 +743,8 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
 		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 
-	/*
-	 * Choosing a suitable context format is even more fiddly. Until we
-	 * grow some way for the caller to express a preference, and/or move
-	 * the decision into the io-pgtable code where it arguably belongs,
-	 * just aim for the closest thing to the rest of the system, and hope
-	 * that the hardware isn't esoteric enough that we can't assume AArch64
-	 * support to be a superset of AArch32 support...
-	 */
-	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_L)
-		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH32_L;
-	if (IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) &&
-	    !IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_ARM_LPAE) &&
-	    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
-	    (smmu_domain->stage == ARM_SMMU_DOMAIN_S1))
-		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH32_S;
-	if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt == ARM_SMMU_CTX_FMT_NONE) &&
-	    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
-			       ARM_SMMU_FEAT_FMT_AARCH64_16K |
-			       ARM_SMMU_FEAT_FMT_AARCH64_4K)))
-		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
-
-	if (cfg->fmt == ARM_SMMU_CTX_FMT_NONE) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	cfg->fmt = arm_smmu_get_context_fmt(smmu_domain);
+	WARN_ON(cfg->fmt == ARM_SMMU_CTX_FMT_NONE);
 
 	switch (smmu_domain->stage) {
 	case ARM_SMMU_DOMAIN_S1:
@@ -1165,14 +1173,11 @@ static void arm_smmu_master_install_s2crs(struct arm_smmu_master_cfg *cfg,
 	}
 }
 
-static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
-			       struct iommu_domain *old)
+static int arm_smmu_test_dev(struct iommu_domain *domain, struct device *dev,
+			     ioasid_t pasid, struct iommu_domain *old)
 {
-	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_master_cfg *cfg;
-	struct arm_smmu_device *smmu;
-	int ret;
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct arm_smmu_domain *smmu_domain;
 
 	/*
 	 * FIXME: The arch/arm DMA API code tries to attach devices to its own
@@ -1181,11 +1186,40 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
 	 * domains, just say no (but more politely than by dereferencing NULL).
 	 * This should be at least a WARN_ON once that's sorted.
 	 */
-	cfg = dev_iommu_priv_get(dev);
 	if (!cfg)
 		return -ENODEV;
 
-	smmu = cfg->smmu;
+	if (domain == arm_smmu_ops.identity_domain ||
+	    domain == arm_smmu_ops.blocked_domain)
+		return 0;
+
+	smmu_domain = to_smmu_domain(domain);
+	scoped_guard(mutex, &smmu_domain->init_mutex) {
+		/* arm_smmu_init_domain_context() will initialize it */
+		if (!smmu_domain->smmu)
+			return 0;
+		/*
+		 * Sanity check the domain. We don't support domains across
+		 * different SMMUs.
+		 */
+		if (smmu_domain->smmu != cfg->smmu)
+			return -EINVAL;
+		if (arm_smmu_get_context_fmt(smmu_domain) ==
+		    ARM_SMMU_CTX_FMT_NONE)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
+			       struct iommu_domain *old)
+{
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct arm_smmu_device *smmu = cfg->smmu;
+	int ret;
 
 	ret = arm_smmu_rpm_get(smmu);
 	if (ret < 0)
@@ -1196,15 +1230,6 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
 	if (ret < 0)
 		goto rpm_put;
 
-	/*
-	 * Sanity check the domain. We don't support domains across
-	 * different SMMUs.
-	 */
-	if (smmu_domain->smmu != smmu) {
-		ret = -EINVAL;
-		goto rpm_put;
-	}
-
 	/* Looks ok, so add the device to the domain */
 	arm_smmu_master_install_s2crs(cfg, S2CR_TYPE_TRANS,
 				      smmu_domain->cfg.cbndx, fwspec);
@@ -1221,8 +1246,6 @@ static int arm_smmu_attach_dev_type(struct device *dev,
 	struct arm_smmu_device *smmu;
 	int ret;
 
-	if (!cfg)
-		return -ENODEV;
 	smmu = cfg->smmu;
 
 	ret = arm_smmu_rpm_get(smmu);
@@ -1242,6 +1265,7 @@ static int arm_smmu_attach_dev_identity(struct iommu_domain *domain,
 }
 
 static const struct iommu_domain_ops arm_smmu_identity_ops = {
+	.test_dev = arm_smmu_test_dev,
 	.attach_dev = arm_smmu_attach_dev_identity,
 };
 
@@ -1258,6 +1282,7 @@ static int arm_smmu_attach_dev_blocked(struct iommu_domain *domain,
 }
 
 static const struct iommu_domain_ops arm_smmu_blocked_ops = {
+	.test_dev = arm_smmu_test_dev,
 	.attach_dev = arm_smmu_attach_dev_blocked,
 };
 
@@ -1647,6 +1672,7 @@ static const struct iommu_ops arm_smmu_ops = {
 	.def_domain_type	= arm_smmu_def_domain_type,
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev		= arm_smmu_test_dev,
 		.attach_dev		= arm_smmu_attach_dev,
 		.map_pages		= arm_smmu_map_pages,
 		.unmap_pages		= arm_smmu_unmap_pages,
-- 
2.43.0


