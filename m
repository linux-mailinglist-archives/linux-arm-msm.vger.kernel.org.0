Return-Path: <linux-arm-msm+bounces-78430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA3BFEED4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B3141A0420E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC85E224AE0;
	Thu, 23 Oct 2025 02:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U6LPO+nq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF71A2C0B;
	Thu, 23 Oct 2025 02:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186180; cv=fail; b=AoYYiM3dKnasVyRL+Lgs+iA/9UEZVe6deedRs2g67HmyU7QZYrrAYRWOgYGnzGL6PXwu52oSY42r55sxyT2gmGKyon2/fBdsyXZRI7Wu21KAc50oIyf/kN9bjkXtNbItmMmKY124AbVSLhWqz75iccHKlfl8rtOYZnjztaCBZ9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186180; c=relaxed/simple;
	bh=LLK1y8OTqWlkTXJWyHbryvDgYNio5ECRGwNouJ+SYy8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a0J0uBYTH5xEMIfplHdXCdb+/+0vNK39F4YgU7r5X+5sQYE657GrpK+Tsj4FZ7yMuPY3dWSfdX093aNpbKufOH/mAvDg74tZSkYixbSmUTman7waUVIBUsDovxxz++v5GhDe6sUy/vG6joZq9stWW2S5hfdh9ah+V2MpPH+87CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U6LPO+nq; arc=fail smtp.client-ip=52.101.43.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez/Mjc8X58VSOJwk42d+ybbgxJhzgKsiz2o24p1geWhTioHsYeDgUoyxf6fdK3nebE66EuTAVO1oRbTXM+aCmQdWzIuNBM3CWAXw6tzzllZr0nPE36MsuATslJRny3GaQCvrbpf2jRZuFeXiFEk4HaCUFnmU1pUft+LbeAivDH0Dl7Z6oPaowMdSJn28Ugru4zSGoU1heUsjFAGBeiixuZszFcd+duzLnKZI4cdsdlhkZf1AXZB8TodSR/2xasuQJnlnKcol7caKA8I5RkALLeWJdAorMLMZOFlunRYPEf7nw5WwGLuZRiEYFfDJjczXkVeTwDPlYvEoSBkr9g+7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vm1yNDcrFygnkl/L7/7sBm66JmWilDRnRfI3FVcxBo=;
 b=L+nB1lKCnDix1MGHKDTLhjqZpd8VXahhSTW5V9yhWHKkqh7VCAwrdlmAWvfQ8MDoXzQdLN6JQ5spIb/EUw37whk143L2740mZYUqp1P0wmMM7VftQrW4oc5OQ0Uf/oSzhQPDL1ouRvytQMY7MJ+oikeplHQzAxznR/HObsmnotMBn6qSxlYPqFBz+WQSJ1hfqKh5bzQsDsmulPCR3SNMmWNXC2KdaaO8CbeuWAQNRNWO9Cjmlgmon2rqq8eN3GMUlMsOBELns8TmCgdUCK6S46hSTyVvQcKVD4zu5NL1Br3/f7NEOF/49qCZLARYrsYXBGSxrAIw3oEQKexX6C/5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vm1yNDcrFygnkl/L7/7sBm66JmWilDRnRfI3FVcxBo=;
 b=U6LPO+nqOKXpaUNKmMwBYSpYLw382q+CKu9EKGxiq/g2aXSCpkDjgO0U0pOCUwKpgjvaV6NAJZlw8yTfMp7gJYQ5GJd72UpGqkpjzhNZeL2Ui1oHPBe7CuyKYSHCbtycs1OtyL2a7OsNYwDW96T4pioKX0SLcdl1ZwUMNE0HI99vyWrz4LmAWePVReDtcTLafEfg/FfYwBbcg0ewYQdlCbfjNWvryCdwTrh931NoLPcVtzc5f1He4+juZy9l17RMVcoO/6Ny3tv7u0cBKmNdwLuftLUgh4QyLBm7tdN4BtZMddM6CW21bnUQeBbBT6eLQG3HMv7wb1SnqvYP7ulpzg==
Received: from PH7PR03CA0007.namprd03.prod.outlook.com (2603:10b6:510:339::9)
 by DS2PR12MB9616.namprd12.prod.outlook.com (2603:10b6:8:275::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 02:22:45 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::a) by PH7PR03CA0007.outlook.office365.com
 (2603:10b6:510:339::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Thu,
 23 Oct 2025 02:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 02:22:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 22 Oct
 2025 19:22:26 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 19:22:26 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 19:22:23 -0700
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
Subject: [PATCH v2 6/6] iommu: Pass in old domain to attach_dev callback functions
Date: Wed, 22 Oct 2025 19:21:09 -0700
Message-ID: <7f760e795097e3052da82abf410c6ee963e4c62b.1761017765.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|DS2PR12MB9616:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cfbfa5-43f3-477b-6e45-08de11db0d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Zho1wbvYfRCGgXdrv6Pq+V4+MiRJxSq7HGKQZ98vZ3nJrRPc7m5cNAQDfQ1?=
 =?us-ascii?Q?NBPmD5ls4HSdZd7gANhvt9dWXXHn0yEPwNJab651bVoGH+vPZK5JLEUfu6Rp?=
 =?us-ascii?Q?Lnfo2hv3EQSLXqAuxUj9bd9ztSw89vIoRWKjV8gD7MZbXpAe7eHw+mIk9+t8?=
 =?us-ascii?Q?i4G5svZQFL+WDbumlK7675G2fG1uccz/PpJ29FwD/6uXSt2MIXVAuJWnhRNM?=
 =?us-ascii?Q?mW2Ae5CzEJvtmuzmq0rFas7nULFDtptA+hpcr5snev6IgpF6fkpdBj4krK4h?=
 =?us-ascii?Q?PsSRTPROIxNLFkKZgyxjjFdBHLKC2vxtxWeUkCC+m94p5XCc7SJ5wiiPLQpG?=
 =?us-ascii?Q?N7dUf09PVtzZGmHG/yBqK9quGQJFrPfr312ZeVSd+i7JAQCJ9+FvcTf8oY+I?=
 =?us-ascii?Q?lvZyh35+knBrCUKdeF1qltqyyTlvYM2DC3bo67mztfiXn+COZLN5jnjWGU2f?=
 =?us-ascii?Q?rWkwGg9VzOOpAl4xklL9iqontYCaoN0lSKCmDRFIFcgcEt/jxl06Lt1NuAHB?=
 =?us-ascii?Q?6NrnEwGOQXE5CP8UAWVV3u9P4ZEDoESDjEJcpyKW1g+VzLtbvIFpShB232fQ?=
 =?us-ascii?Q?VzJldGvt6yzDZp5SN3/pBhb3rqnLkXflmdkHfkmXPiZxfPH2bm5qiSlWg5/D?=
 =?us-ascii?Q?BHCo1yLfhWR995mpRaNdZkdLTitOl8suIRS4ors4E3+B3dW4BPWVUct0IFZa?=
 =?us-ascii?Q?0KwI/2fiBNdYkkQFBXb8wwn1s7xxO8WKC1jmkWExTt5vTTgoTpF9qqifEE+F?=
 =?us-ascii?Q?w+fWw6ozKekENU3JAOcikSy2BVFWkWWY6hXzKBSc5RjLo+c4lkQ7ErEiA9qX?=
 =?us-ascii?Q?kHKMuIn8fWvTh/9qhPKMdWodWfNZ7td0hObabzHUwXZLRA+qZTtNYvsqwtvr?=
 =?us-ascii?Q?NgDZk7No4t85bUawSozcMCADlj4tRGyirmwiQ7whfS6iDk6WDZQ1jAXqOt4B?=
 =?us-ascii?Q?ypDtU6Ogtb5bat4VxNo/G0SbhpaQ4ehQpOXWcnD0QVAbYCq3iztrQnWr8J9Z?=
 =?us-ascii?Q?EPYOA1zBEbEtAiGdpSysPPwKi7YcRy0JoWJcWee9Gyd35B74HHW/+2iBULNa?=
 =?us-ascii?Q?/mF15Sclsz0ZJxilRjPKHQFtmkm0DJkde1miNkvyYm5KAq5shSK4is9roTxl?=
 =?us-ascii?Q?KNKhnBnYEJdW9UtlpDTEECXHuDQR6wD5TAY47NDek94lbxEApVEhEd1ghV71?=
 =?us-ascii?Q?8pxfQq8ZCW4NFtiGVRILgwc08GqvX3U+lF746GpRidnabHomnxc+DPbdK7j/?=
 =?us-ascii?Q?UX5YZl1ZSRa8ip0I9I3KnWeaL1z7++gngDIXU/oSX3fK7F7cfdEZtlFEDT3t?=
 =?us-ascii?Q?/vdnlHZupS4NbidtRELXlhrB17K4IE1WcBJmVOtyM8mgpHxtzOz2VkMQu/4X?=
 =?us-ascii?Q?6Q6EO8lL3e0B8f31YeCZ+3j0wbhJBXk3yjn0mGJppatCgQZ558hODLZ4ii/9?=
 =?us-ascii?Q?Vo5AHelyFbKQ65S3inSQEGYq49v71sDq3oEvIq1y9ucTJk+PfEy8+Po0dYLV?=
 =?us-ascii?Q?bH4pexJjARBJqxiQVC0ieMYHNL1BlxevQgatbELqjmCfQAuIrg9wPgDBoWYI?=
 =?us-ascii?Q?muyo2060TkVwxsN/WQQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 02:22:44.6665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cfbfa5-43f3-477b-6e45-08de11db0d0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9616

The IOMMU core attaches each device to a default domain on probe(). Then,
every new "attach" operation has a fundamental meaning of two-fold:
 - detach from its currently attached (old) domain
 - attach to a given new domain

Modern IOMMU drivers following this pattern usually want to clean up the
things related to the old domain, so they call iommu_get_domain_for_dev()
to fetch the old domain.

Pass in the old domain pointer from the core to drivers, aligning with the
set_dev_pasid op that does so already.

Ensure all low-level attach fcuntions in the core can forward the correct
old domain pointer. Thus, rework those functions as well.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h                         |  3 ++-
 arch/powerpc/kernel/iommu.c                   |  5 ++--
 drivers/iommu/amd/iommu.c                     | 11 ++++----
 drivers/iommu/apple-dart.c                    |  9 ++++---
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  5 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 24 +++++++++++-------
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  9 ++++---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 11 ++++----
 drivers/iommu/exynos-iommu.c                  |  8 +++---
 drivers/iommu/fsl_pamu_domain.c               | 12 ++++-----
 drivers/iommu/intel/iommu.c                   | 10 +++++---
 drivers/iommu/intel/nested.c                  |  2 +-
 drivers/iommu/iommu.c                         | 25 +++++++++++--------
 drivers/iommu/iommufd/selftest.c              |  2 +-
 drivers/iommu/ipmmu-vmsa.c                    | 10 ++++----
 drivers/iommu/msm_iommu.c                     | 11 ++++----
 drivers/iommu/mtk_iommu.c                     |  8 +++---
 drivers/iommu/mtk_iommu_v1.c                  |  7 ++++--
 drivers/iommu/omap-iommu.c                    | 12 ++++-----
 drivers/iommu/riscv/iommu.c                   |  9 ++++---
 drivers/iommu/rockchip-iommu.c                | 20 +++++++++++----
 drivers/iommu/s390-iommu.c                    | 13 ++++++----
 drivers/iommu/sprd-iommu.c                    |  3 ++-
 drivers/iommu/sun50i-iommu.c                  |  8 +++---
 drivers/iommu/tegra-smmu.c                    | 10 ++++----
 drivers/iommu/virtio-iommu.c                  |  6 +++--
 26 files changed, 153 insertions(+), 100 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index c30d12e16473d..801b2bd9e8d49 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -751,7 +751,8 @@ struct iommu_ops {
  * @free: Release the domain after use.
  */
 struct iommu_domain_ops {
-	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
+	int (*attach_dev)(struct iommu_domain *domain, struct device *dev,
+			  struct iommu_domain *old);
 	int (*set_dev_pasid)(struct iommu_domain *domain, struct device *dev,
 			     ioasid_t pasid, struct iommu_domain *old);
 
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 244eb4857e7f4..b7dcf07b24994 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1156,7 +1156,8 @@ EXPORT_SYMBOL_GPL(iommu_add_device);
  */
 static int
 spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
-				    struct device *dev)
+				    struct device *dev,
+				    struct iommu_domain *old)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_table_group *table_group;
@@ -1189,7 +1190,7 @@ static struct iommu_domain spapr_tce_platform_domain = {
 
 static int
 spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,
-				     struct device *dev)
+				   struct device *dev, struct iommu_domain *old)
 {
 	struct iommu_group *grp = iommu_group_get(dev);
 	struct iommu_table_group *table_group;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 6f4559eb5121a..e16ad510c8c8a 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -70,8 +70,8 @@ int amd_iommu_max_glx_val = -1;
  */
 DEFINE_IDA(pdom_ids);
 
-static int amd_iommu_attach_device(struct iommu_domain *dom,
-				   struct device *dev);
+static int amd_iommu_attach_device(struct iommu_domain *dom, struct device *dev,
+				   struct iommu_domain *old);
 
 static void set_dte_entry(struct amd_iommu *iommu,
 			  struct iommu_dev_data *dev_data);
@@ -2635,7 +2635,8 @@ void amd_iommu_domain_free(struct iommu_domain *dom)
 }
 
 static int blocked_domain_attach_device(struct iommu_domain *domain,
-					struct device *dev)
+					struct device *dev,
+					struct iommu_domain *old)
 {
 	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
 
@@ -2685,8 +2686,8 @@ void amd_iommu_init_identity_domain(void)
 	protection_domain_init(&identity_domain);
 }
 
-static int amd_iommu_attach_device(struct iommu_domain *dom,
-				   struct device *dev)
+static int amd_iommu_attach_device(struct iommu_domain *dom, struct device *dev,
+				   struct iommu_domain *old)
 {
 	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
 	struct protection_domain *domain = to_pdomain(dom);
diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 95a4e62b8f63c..b5848770ef482 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -672,7 +672,8 @@ static int apple_dart_domain_add_streams(struct apple_dart_domain *domain,
 }
 
 static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
-					struct device *dev)
+					struct device *dev,
+					struct iommu_domain *old)
 {
 	int ret, i;
 	struct apple_dart_stream_map *stream_map;
@@ -693,7 +694,8 @@ static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
 }
 
 static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
-					  struct device *dev)
+					  struct device *dev,
+					  struct iommu_domain *old)
 {
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
 	struct apple_dart_stream_map *stream_map;
@@ -717,7 +719,8 @@ static struct iommu_domain apple_dart_identity_domain = {
 };
 
 static int apple_dart_attach_dev_blocked(struct iommu_domain *domain,
-					 struct device *dev)
+					 struct device *dev,
+					 struct iommu_domain *old)
 {
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
 	struct apple_dart_stream_map *stream_map;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 8cd8929bbfdf8..313201a616991 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -138,14 +138,15 @@ void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
 }
 
 static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
-				      struct device *dev)
+				      struct device *dev,
+				      struct iommu_domain *old_domain)
 {
 	struct arm_smmu_nested_domain *nested_domain =
 		to_smmu_nested_domain(domain);
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 	struct arm_smmu_attach_state state = {
 		.master = master,
-		.old_domain = iommu_get_domain_for_dev(dev),
+		.old_domain = old_domain,
 		.ssid = IOMMU_NO_PASID,
 	};
 	struct arm_smmu_ste ste;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2125ebfc9a70e..a33fbd12a0dd9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3002,7 +3002,8 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state)
 	master->ats_enabled = state->ats_enabled;
 }
 
-static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
+static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
+			       struct iommu_domain *old_domain)
 {
 	int ret = 0;
 	struct arm_smmu_ste target;
@@ -3010,7 +3011,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_attach_state state = {
-		.old_domain = iommu_get_domain_for_dev(dev),
+		.old_domain = old_domain,
 		.ssid = IOMMU_NO_PASID,
 	};
 	struct arm_smmu_master *master;
@@ -3186,7 +3187,7 @@ static int arm_smmu_blocking_set_dev_pasid(struct iommu_domain *new_domain,
 
 	/*
 	 * When the last user of the CD table goes away downgrade the STE back
-	 * to a non-cd_table one.
+	 * to a non-cd_table one, by re-attaching its sid_domain.
 	 */
 	if (!arm_smmu_ssids_in_use(&master->cd_table)) {
 		struct iommu_domain *sid_domain =
@@ -3194,12 +3195,14 @@ static int arm_smmu_blocking_set_dev_pasid(struct iommu_domain *new_domain,
 
 		if (sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
 		    sid_domain->type == IOMMU_DOMAIN_BLOCKED)
-			sid_domain->ops->attach_dev(sid_domain, dev);
+			sid_domain->ops->attach_dev(sid_domain, dev,
+						    sid_domain);
 	}
 	return 0;
 }
 
 static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
+				    struct iommu_domain *old_domain,
 				    struct device *dev,
 				    struct arm_smmu_ste *ste,
 				    unsigned int s1dss)
@@ -3207,7 +3210,7 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 	struct arm_smmu_attach_state state = {
 		.master = master,
-		.old_domain = iommu_get_domain_for_dev(dev),
+		.old_domain = old_domain,
 		.ssid = IOMMU_NO_PASID,
 	};
 
@@ -3248,14 +3251,16 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
 }
 
 static int arm_smmu_attach_dev_identity(struct iommu_domain *domain,
-					struct device *dev)
+					struct device *dev,
+					struct iommu_domain *old_domain)
 {
 	struct arm_smmu_ste ste;
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 
 	arm_smmu_master_clear_vmaster(master);
 	arm_smmu_make_bypass_ste(master->smmu, &ste);
-	arm_smmu_attach_dev_ste(domain, dev, &ste, STRTAB_STE_1_S1DSS_BYPASS);
+	arm_smmu_attach_dev_ste(domain, old_domain, dev, &ste,
+				STRTAB_STE_1_S1DSS_BYPASS);
 	return 0;
 }
 
@@ -3269,14 +3274,15 @@ static struct iommu_domain arm_smmu_identity_domain = {
 };
 
 static int arm_smmu_attach_dev_blocked(struct iommu_domain *domain,
-					struct device *dev)
+				       struct device *dev,
+				       struct iommu_domain *old_domain)
 {
 	struct arm_smmu_ste ste;
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 
 	arm_smmu_master_clear_vmaster(master);
 	arm_smmu_make_abort_ste(&ste);
-	arm_smmu_attach_dev_ste(domain, dev, &ste,
+	arm_smmu_attach_dev_ste(domain, old_domain, dev, &ste,
 				STRTAB_STE_1_S1DSS_TERMINATE);
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4ced4b5bee4df..5e690cf85ec96 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1165,7 +1165,8 @@ static void arm_smmu_master_install_s2crs(struct arm_smmu_master_cfg *cfg,
 	}
 }
 
-static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
+static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
+			       struct iommu_domain *old)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -1234,7 +1235,8 @@ static int arm_smmu_attach_dev_type(struct device *dev,
 }
 
 static int arm_smmu_attach_dev_identity(struct iommu_domain *domain,
-					struct device *dev)
+					struct device *dev,
+					struct iommu_domain *old)
 {
 	return arm_smmu_attach_dev_type(dev, S2CR_TYPE_BYPASS);
 }
@@ -1249,7 +1251,8 @@ static struct iommu_domain arm_smmu_identity_domain = {
 };
 
 static int arm_smmu_attach_dev_blocked(struct iommu_domain *domain,
-				       struct device *dev)
+				       struct device *dev,
+				       struct iommu_domain *old)
 {
 	return arm_smmu_attach_dev_type(dev, S2CR_TYPE_FAULT);
 }
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index c5be95e560317..9222a4a48bb33 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -359,7 +359,8 @@ static void qcom_iommu_domain_free(struct iommu_domain *domain)
 	kfree(qcom_domain);
 }
 
-static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
+static int qcom_iommu_attach_dev(struct iommu_domain *domain,
+				 struct device *dev, struct iommu_domain *old)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_iommu_priv_get(dev);
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
@@ -388,18 +389,18 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 }
 
 static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
-				      struct device *dev)
+				      struct device *dev,
+				      struct iommu_domain *old)
 {
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct qcom_iommu_domain *qcom_domain;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct qcom_iommu_dev *qcom_iommu = dev_iommu_priv_get(dev);
 	unsigned int i;
 
-	if (domain == identity_domain || !domain)
+	if (old == identity_domain || !old)
 		return 0;
 
-	qcom_domain = to_qcom_iommu_domain(domain);
+	qcom_domain = to_qcom_iommu_domain(old);
 	if (WARN_ON(!qcom_domain->iommu))
 		return -EINVAL;
 
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 0857519ca7188..e375ced6e2b00 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -984,7 +984,8 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
 }
 
 static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
-					struct device *dev)
+					struct device *dev,
+					struct iommu_domain *old)
 {
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct exynos_iommu_domain *domain;
@@ -1035,7 +1036,8 @@ static struct iommu_domain exynos_identity_domain = {
 };
 
 static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
-				   struct device *dev)
+				      struct device *dev,
+				      struct iommu_domain *old)
 {
 	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
@@ -1044,7 +1046,7 @@ static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 	unsigned long flags;
 	int err;
 
-	err = exynos_iommu_identity_attach(&exynos_identity_domain, dev);
+	err = exynos_iommu_identity_attach(&exynos_identity_domain, dev, old);
 	if (err)
 		return err;
 
diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 5f08523f97cb9..9664ef9840d2c 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -238,7 +238,7 @@ static int update_domain_stash(struct fsl_dma_domain *dma_domain, u32 val)
 }
 
 static int fsl_pamu_attach_device(struct iommu_domain *domain,
-				  struct device *dev)
+				  struct device *dev, struct iommu_domain *old)
 {
 	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
 	unsigned long flags;
@@ -298,9 +298,9 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
  * switches to what looks like BLOCKING.
  */
 static int fsl_pamu_platform_attach(struct iommu_domain *platform_domain,
-				    struct device *dev)
+				    struct device *dev,
+				    struct iommu_domain *old)
 {
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct fsl_dma_domain *dma_domain;
 	const u32 *prop;
 	int len;
@@ -311,11 +311,11 @@ static int fsl_pamu_platform_attach(struct iommu_domain *platform_domain,
 	 * Hack to keep things working as they always have, only leaving an
 	 * UNMANAGED domain makes it BLOCKING.
 	 */
-	if (domain == platform_domain || !domain ||
-	    domain->type != IOMMU_DOMAIN_UNMANAGED)
+	if (old == platform_domain || !old ||
+	    old->type != IOMMU_DOMAIN_UNMANAGED)
 		return 0;
 
-	dma_domain = to_fsl_dma_domain(domain);
+	dma_domain = to_fsl_dma_domain(old);
 
 	/*
 	 * Use LIODN of the PCI controller while detaching a
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index e236c7ec221f4..f0396591cd9bb 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3230,7 +3230,8 @@ void device_block_translation(struct device *dev)
 }
 
 static int blocking_domain_attach_dev(struct iommu_domain *domain,
-				      struct device *dev)
+				      struct device *dev,
+				      struct iommu_domain *old)
 {
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
 
@@ -3537,7 +3538,8 @@ int paging_domain_compatible(struct iommu_domain *domain, struct device *dev)
 }
 
 static int intel_iommu_attach_device(struct iommu_domain *domain,
-				     struct device *dev)
+				     struct device *dev,
+				     struct iommu_domain *old)
 {
 	int ret;
 
@@ -4401,7 +4403,9 @@ static int device_setup_pass_through(struct device *dev)
 				      context_setup_pass_through_cb, dev);
 }
 
-static int identity_domain_attach_dev(struct iommu_domain *domain, struct device *dev)
+static int identity_domain_attach_dev(struct iommu_domain *domain,
+				      struct device *dev,
+				      struct iommu_domain *old)
 {
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
 	struct intel_iommu *iommu = info->iommu;
diff --git a/drivers/iommu/intel/nested.c b/drivers/iommu/intel/nested.c
index 1b6ad9c900a5a..760d7aa2ade84 100644
--- a/drivers/iommu/intel/nested.c
+++ b/drivers/iommu/intel/nested.c
@@ -19,7 +19,7 @@
 #include "pasid.h"
 
 static int intel_nested_attach_dev(struct iommu_domain *domain,
-				   struct device *dev)
+				   struct device *dev, struct iommu_domain *old)
 {
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
 	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index ce141f095f969..2ca990dfbb884 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -100,7 +100,7 @@ static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
 static int __iommu_attach_device(struct iommu_domain *domain,
-				 struct device *dev);
+				 struct device *dev, struct iommu_domain *old);
 static int __iommu_attach_group(struct iommu_domain *domain,
 				struct iommu_group *group);
 static struct iommu_domain *__iommu_paging_domain_alloc_flags(struct device *dev,
@@ -114,6 +114,7 @@ enum {
 static int __iommu_device_set_domain(struct iommu_group *group,
 				     struct device *dev,
 				     struct iommu_domain *new_domain,
+				     struct iommu_domain *old_domain,
 				     unsigned int flags);
 static int __iommu_group_set_domain_internal(struct iommu_group *group,
 					     struct iommu_domain *new_domain,
@@ -554,7 +555,8 @@ static void iommu_deinit_device(struct device *dev)
 		    release_domain == ops->blocked_domain)
 			release_domain = ops->identity_domain;
 
-		release_domain->ops->attach_dev(release_domain, dev);
+		release_domain->ops->attach_dev(release_domain, dev,
+						group->domain);
 	}
 
 	if (ops->release_device)
@@ -640,7 +642,8 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	if (group->default_domain)
 		iommu_create_device_direct_mappings(group->default_domain, dev);
 	if (group->domain) {
-		ret = __iommu_device_set_domain(group, dev, group->domain, 0);
+		ret = __iommu_device_set_domain(group, dev, group->domain, NULL,
+						0);
 		if (ret)
 			goto err_remove_gdev;
 	} else if (!group->default_domain && !group_list) {
@@ -2127,14 +2130,14 @@ static void __iommu_group_set_core_domain(struct iommu_group *group)
 }
 
 static int __iommu_attach_device(struct iommu_domain *domain,
-				 struct device *dev)
+				 struct device *dev, struct iommu_domain *old)
 {
 	int ret;
 
 	if (unlikely(domain->ops->attach_dev == NULL))
 		return -ENODEV;
 
-	ret = domain->ops->attach_dev(domain, dev);
+	ret = domain->ops->attach_dev(domain, dev, old);
 	if (ret)
 		return ret;
 	dev->iommu->attach_deferred = 0;
@@ -2183,7 +2186,7 @@ EXPORT_SYMBOL_GPL(iommu_attach_device);
 int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
 {
 	if (dev->iommu && dev->iommu->attach_deferred)
-		return __iommu_attach_device(domain, dev);
+		return __iommu_attach_device(domain, dev, NULL);
 
 	return 0;
 }
@@ -2296,6 +2299,7 @@ EXPORT_SYMBOL_GPL(iommu_attach_group);
 static int __iommu_device_set_domain(struct iommu_group *group,
 				     struct device *dev,
 				     struct iommu_domain *new_domain,
+				     struct iommu_domain *old_domain,
 				     unsigned int flags)
 {
 	int ret;
@@ -2321,7 +2325,7 @@ static int __iommu_device_set_domain(struct iommu_group *group,
 		dev->iommu->attach_deferred = 0;
 	}
 
-	ret = __iommu_attach_device(new_domain, dev);
+	ret = __iommu_attach_device(new_domain, dev, old_domain);
 	if (ret) {
 		/*
 		 * If we have a blocking domain then try to attach that in hopes
@@ -2331,7 +2335,8 @@ static int __iommu_device_set_domain(struct iommu_group *group,
 		if ((flags & IOMMU_SET_DOMAIN_MUST_SUCCEED) &&
 		    group->blocking_domain &&
 		    group->blocking_domain != new_domain)
-			__iommu_attach_device(group->blocking_domain, dev);
+			__iommu_attach_device(group->blocking_domain, dev,
+					      old_domain);
 		return ret;
 	}
 	return 0;
@@ -2378,7 +2383,7 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	result = 0;
 	for_each_group_device(group, gdev) {
 		ret = __iommu_device_set_domain(group, gdev->dev, new_domain,
-						flags);
+						group->domain, flags);
 		if (ret) {
 			result = ret;
 			/*
@@ -2413,7 +2418,7 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 		 */
 		if (group->domain)
 			WARN_ON(__iommu_device_set_domain(
-				group, gdev->dev, group->domain,
+				group, gdev->dev, group->domain, new_domain,
 				IOMMU_SET_DOMAIN_MUST_SUCCEED));
 	}
 	return ret;
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index de178827a078a..5661d2da2b679 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -216,7 +216,7 @@ static inline struct selftest_obj *to_selftest_obj(struct iommufd_object *obj)
 }
 
 static int mock_domain_nop_attach(struct iommu_domain *domain,
-				  struct device *dev)
+				  struct device *dev, struct iommu_domain *old)
 {
 	struct mock_dev *mdev = to_mock_dev(dev);
 	struct mock_viommu *new_viommu = NULL;
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index ffa892f657140..6667ecc331f01 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -590,7 +590,7 @@ static void ipmmu_domain_free(struct iommu_domain *io_domain)
 }
 
 static int ipmmu_attach_device(struct iommu_domain *io_domain,
-			       struct device *dev)
+			       struct device *dev, struct iommu_domain *old)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct ipmmu_vmsa_device *mmu = to_ipmmu(dev);
@@ -637,17 +637,17 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 }
 
 static int ipmmu_iommu_identity_attach(struct iommu_domain *identity_domain,
-				       struct device *dev)
+				       struct device *dev,
+				       struct iommu_domain *old)
 {
-	struct iommu_domain *io_domain = iommu_get_domain_for_dev(dev);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct ipmmu_vmsa_domain *domain;
 	unsigned int i;
 
-	if (io_domain == identity_domain || !io_domain)
+	if (old == identity_domain || !old)
 		return 0;
 
-	domain = to_vmsa_domain(io_domain);
+	domain = to_vmsa_domain(old);
 	for (i = 0; i < fwspec->num_ids; ++i)
 		ipmmu_utlb_disable(domain, fwspec->ids[i]);
 
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 43a61ba021a51..819add75a6652 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -391,7 +391,8 @@ static struct iommu_device *msm_iommu_probe_device(struct device *dev)
 	return &iommu->iommu;
 }
 
-static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
+static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev,
+				struct iommu_domain *old)
 {
 	int ret = 0;
 	unsigned long flags;
@@ -441,19 +442,19 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 }
 
 static int msm_iommu_identity_attach(struct iommu_domain *identity_domain,
-				     struct device *dev)
+				     struct device *dev,
+				     struct iommu_domain *old)
 {
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct msm_priv *priv;
 	unsigned long flags;
 	struct msm_iommu_dev *iommu;
 	struct msm_iommu_ctx_dev *master;
 	int ret = 0;
 
-	if (domain == identity_domain || !domain)
+	if (old == identity_domain || !old)
 		return 0;
 
-	priv = to_msm_priv(domain);
+	priv = to_msm_priv(old);
 	free_io_pgtable_ops(priv->iop);
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0e0285348d2b8..9747ef1644138 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -705,7 +705,7 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
 }
 
 static int mtk_iommu_attach_device(struct iommu_domain *domain,
-				   struct device *dev)
+				   struct device *dev, struct iommu_domain *old)
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev), *frstdata;
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
@@ -773,12 +773,12 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 }
 
 static int mtk_iommu_identity_attach(struct iommu_domain *identity_domain,
-				     struct device *dev)
+				     struct device *dev,
+				     struct iommu_domain *old)
 {
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 
-	if (domain == identity_domain || !domain)
+	if (old == identity_domain || !old)
 		return 0;
 
 	mtk_iommu_config(data, dev, false, 0);
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 10cc0b1197e80..3b45650263ac3 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -303,7 +303,9 @@ static void mtk_iommu_v1_domain_free(struct iommu_domain *domain)
 	kfree(to_mtk_domain(domain));
 }
 
-static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device *dev)
+static int mtk_iommu_v1_attach_device(struct iommu_domain *domain,
+				      struct device *dev,
+				      struct iommu_domain *old)
 {
 	struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
 	struct mtk_iommu_v1_domain *dom = to_mtk_domain(domain);
@@ -329,7 +331,8 @@ static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device
 }
 
 static int mtk_iommu_v1_identity_attach(struct iommu_domain *identity_domain,
-					struct device *dev)
+					struct device *dev,
+					struct iommu_domain *old)
 {
 	struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
 
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 5c6f5943f44b1..9f0057ccea573 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1431,8 +1431,8 @@ static void omap_iommu_detach_fini(struct omap_iommu_domain *odomain)
 	odomain->iommus = NULL;
 }
 
-static int
-omap_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
+static int omap_iommu_attach_dev(struct iommu_domain *domain,
+				 struct device *dev, struct iommu_domain *old)
 {
 	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
@@ -1536,15 +1536,15 @@ static void _omap_iommu_detach_dev(struct omap_iommu_domain *omap_domain,
 }
 
 static int omap_iommu_identity_attach(struct iommu_domain *identity_domain,
-				      struct device *dev)
+				      struct device *dev,
+				      struct iommu_domain *old)
 {
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct omap_iommu_domain *omap_domain;
 
-	if (domain == identity_domain || !domain)
+	if (old == identity_domain || !old)
 		return 0;
 
-	omap_domain = to_omap_domain(domain);
+	omap_domain = to_omap_domain(old);
 	spin_lock(&omap_domain->lock);
 	_omap_iommu_detach_dev(omap_domain, dev);
 	spin_unlock(&omap_domain->lock);
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index ebb22979075df..d9429097a2b51 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1321,7 +1321,8 @@ static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_m
 }
 
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
-					    struct device *dev)
+					    struct device *dev,
+					    struct iommu_domain *old)
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
@@ -1426,7 +1427,8 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 }
 
 static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
-					      struct device *dev)
+					      struct device *dev,
+					      struct iommu_domain *old)
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
@@ -1447,7 +1449,8 @@ static struct iommu_domain riscv_iommu_blocking_domain = {
 };
 
 static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
-					      struct device *dev)
+					      struct device *dev,
+					      struct iommu_domain *old)
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 0861dd469bd86..85f3667e797c3 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -960,7 +960,8 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
 }
 
 static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
-				    struct device *dev)
+				    struct device *dev,
+				    struct iommu_domain *old)
 {
 	struct rk_iommu *iommu;
 	struct rk_iommu_domain *rk_domain;
@@ -1005,7 +1006,7 @@ static struct iommu_domain rk_identity_domain = {
 };
 
 static int rk_iommu_attach_device(struct iommu_domain *domain,
-		struct device *dev)
+				  struct device *dev, struct iommu_domain *old)
 {
 	struct rk_iommu *iommu;
 	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
@@ -1026,7 +1027,7 @@ static int rk_iommu_attach_device(struct iommu_domain *domain,
 	if (iommu->domain == domain)
 		return 0;
 
-	ret = rk_iommu_identity_attach(&rk_identity_domain, dev);
+	ret = rk_iommu_identity_attach(&rk_identity_domain, dev, old);
 	if (ret)
 		return ret;
 
@@ -1041,8 +1042,17 @@ static int rk_iommu_attach_device(struct iommu_domain *domain,
 		return 0;
 
 	ret = rk_iommu_enable(iommu);
-	if (ret)
-		WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev));
+	if (ret) {
+		/*
+		 * Note rk_iommu_identity_attach() might fail before physically
+		 * attaching the dev to iommu->domain, in which case the actual
+		 * old domain for this revert should be rk_identity_domain v.s.
+		 * iommu->domain. Since rk_iommu_identity_attach() does not care
+		 * about the old domain argument for now, this is not a problem.
+		 */
+		WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev,
+						 iommu->domain));
+	}
 
 	pm_runtime_put(iommu->dev);
 
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index aa576736d60ba..fe679850af286 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -670,7 +670,8 @@ int zpci_iommu_register_ioat(struct zpci_dev *zdev, u8 *status)
 }
 
 static int blocking_domain_attach_device(struct iommu_domain *domain,
-					 struct device *dev)
+					 struct device *dev,
+					 struct iommu_domain *old)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 	struct s390_domain *s390_domain;
@@ -694,7 +695,8 @@ static int blocking_domain_attach_device(struct iommu_domain *domain,
 }
 
 static int s390_iommu_attach_device(struct iommu_domain *domain,
-				    struct device *dev)
+				    struct device *dev,
+				    struct iommu_domain *old)
 {
 	struct s390_domain *s390_domain = to_s390_domain(domain);
 	struct zpci_dev *zdev = to_zpci_dev(dev);
@@ -709,7 +711,7 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 		domain->geometry.aperture_end < zdev->start_dma))
 		return -EINVAL;
 
-	blocking_domain_attach_device(&blocking_domain, dev);
+	blocking_domain_attach_device(&blocking_domain, dev, old);
 
 	/* If we fail now DMA remains blocked via blocking domain */
 	cc = s390_iommu_domain_reg_ioat(zdev, domain, &status);
@@ -1131,13 +1133,14 @@ static int __init s390_iommu_init(void)
 subsys_initcall(s390_iommu_init);
 
 static int s390_attach_dev_identity(struct iommu_domain *domain,
-				    struct device *dev)
+				    struct device *dev,
+				    struct iommu_domain *old)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 	u8 status;
 	int cc;
 
-	blocking_domain_attach_device(&blocking_domain, dev);
+	blocking_domain_attach_device(&blocking_domain, dev, old);
 
 	/* If we fail now DMA remains blocked via blocking domain */
 	cc = s390_iommu_domain_reg_ioat(zdev, domain, &status);
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index c7ca1d8a0b153..555d4505c747a 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -247,7 +247,8 @@ static void sprd_iommu_domain_free(struct iommu_domain *domain)
 }
 
 static int sprd_iommu_attach_device(struct iommu_domain *domain,
-				    struct device *dev)
+				    struct device *dev,
+				    struct iommu_domain *old)
 {
 	struct sprd_iommu_device *sdev = dev_iommu_priv_get(dev);
 	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index de10b569d9a94..d3b190be18b5a 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -771,7 +771,8 @@ static void sun50i_iommu_detach_domain(struct sun50i_iommu *iommu,
 }
 
 static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
-					struct device *dev)
+					struct device *dev,
+					struct iommu_domain *old)
 {
 	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
 	struct sun50i_iommu_domain *sun50i_domain;
@@ -797,7 +798,8 @@ static struct iommu_domain sun50i_iommu_identity_domain = {
 };
 
 static int sun50i_iommu_attach_device(struct iommu_domain *domain,
-				      struct device *dev)
+				      struct device *dev,
+				      struct iommu_domain *old)
 {
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu;
@@ -813,7 +815,7 @@ static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 	if (iommu->domain == domain)
 		return 0;
 
-	sun50i_iommu_identity_attach(&sun50i_iommu_identity_domain, dev);
+	sun50i_iommu_identity_attach(&sun50i_iommu_identity_domain, dev, old);
 
 	sun50i_iommu_attach_domain(iommu, sun50i_domain);
 
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 36cdd5fbab077..336e0a3ff41fb 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -490,7 +490,7 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 }
 
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
-				 struct device *dev)
+				 struct device *dev, struct iommu_domain *old)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
@@ -524,9 +524,9 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 }
 
 static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
-				      struct device *dev)
+				      struct device *dev,
+				      struct iommu_domain *old)
 {
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu_as *as;
 	struct tegra_smmu *smmu;
@@ -535,10 +535,10 @@ static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
 	if (!fwspec)
 		return -ENODEV;
 
-	if (domain == identity_domain || !domain)
+	if (old == identity_domain || !old)
 		return 0;
 
-	as = to_smmu_as(domain);
+	as = to_smmu_as(old);
 	smmu = as->smmu;
 	for (index = 0; index < fwspec->num_ids; index++) {
 		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index b39d6f134ab28..d314fa5cd8476 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -730,7 +730,8 @@ static struct iommu_domain *viommu_domain_alloc_identity(struct device *dev)
 	return domain;
 }
 
-static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
+static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev,
+			     struct iommu_domain *old)
 {
 	int ret = 0;
 	struct virtio_iommu_req_attach req;
@@ -781,7 +782,8 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 }
 
 static int viommu_attach_identity_domain(struct iommu_domain *domain,
-					 struct device *dev)
+					 struct device *dev,
+					 struct iommu_domain *old)
 {
 	int ret = 0;
 	struct virtio_iommu_req_attach req;
-- 
2.43.0


