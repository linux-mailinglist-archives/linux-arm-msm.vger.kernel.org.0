Return-Path: <linux-arm-msm+bounces-76878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A95CEBD0DE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C41811894210
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 23:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495532F0C45;
	Sun, 12 Oct 2025 23:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VMR/QVBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012007.outbound.protection.outlook.com [40.93.195.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F482EDD7A;
	Sun, 12 Oct 2025 23:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313484; cv=fail; b=TENodJu2p0Ikz4v9y7feuucrOeuOwT7YK2p0bSbMMQdONPbDwc/9H7QMq3VgyqEli+1tHLZ1ODAXtbCK/vEx8i5kJDk1431qI+Be7+IuL18HkoKiQBY7+Oos/hzL51d22fckAxqkK4Jrh2B6XJIuvc6OoIO/c0cko70gFac/Z2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313484; c=relaxed/simple;
	bh=Oovxc2xwQBxYwcT81UaZp4r5Cby3UMpyL2z6ZKVqPCU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gHiBAkdM9mglHBzlzcFPoj/PF2S88YZ5phR/4rREQs93cAJI3Pwt3z3b/R4HT3fxL5Kc90ZaeE1Lx87ZR4MRksI5jSxkNriV4UmoxiEmLmue/6/SeIqZ5RcBCmX8b90sPAM908wUhKz1qlRuTlHF+Hn08g7GejDXQsnmfxRIip0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VMR/QVBB; arc=fail smtp.client-ip=40.93.195.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYr+8Us3FYN8faq5vLcTrCg9LLeb0n2dJ3qek5dxVaMiCns8sdHkYJbdM9BDlzhaeWTCBDYSe5aNAGEFd18C8rnVYjMMMcS+CKXB5/q28JCJXDHi7yoFTRoLcw7PL4+GIzIWNJKpBBfpkWOxPhTjo65tk6Iea9bcet+W3nagh2FGfZop/WPD/Bq8hdftNA2iSlb1OWLQi+YoE39kryRqeiwPLCYvckKxvORDNjWNAoS2ysKiauv1I2b4St6YjHa2uPXKRmVmcS9DpSp5+ar5EfOslA/D2mex+p5z+rhG8RbQ6q0ok0WbDtVErCLLRRg51y3gBGCbanBOSz/kAE3IiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQbKQPGHHteriTFPWtmN0+oYPeNAZs7WnUqBuOXCIo4=;
 b=cJ8p7EZFlhjvpF6O8gRHNcup+XmGt7glgbHHCNRaIftYArP30QGm0pmgya6IIPfAmCYo1Zw+KdhLwE4K1SvuWoXDaKPiVpChgkJyDqx1YZ6EqUl8GgvZ//Pn5vwlkj7lq8yOPiK4WR/U7hifrpngyKI3dShR3xHwtKimSkq1o+TQO7AdaWsdNDIj/lJPO7cHZv8XkNLVx2uayD+f9nQjJuxNFn2e+BwKThfwz5SUo3AI+CnAdaBNYFp+/7tSJgEQ5GbmpZB0mD4Nc53li1HqqvTfADLMWcyyM7j3r1vHvNKmquCoxKjzX29w1YSR/ZO8LkzJRU8D7MCb/MhxQBlz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQbKQPGHHteriTFPWtmN0+oYPeNAZs7WnUqBuOXCIo4=;
 b=VMR/QVBBI4JmpTXcHjUJ+WvwCWm3Zhr+GST6IkTv9StMjV5cwh/4QqjsLRDk5A2x7nL22TvNM9HQ6QUMogfnqQTZcfQJel4XeQL9f5P/jaHUqbRSuVRUCtW2h8uwsB0hQn/A0wKhnHXADtJSFB6Ru8L7TxW5kvWm7mb0gaJDD54mteHBYwvV6vJMwSX/0PJx2isrDgoGqYAkUlqX5h1nXqqIFYZfjcZTuapLod5cfhQn1BDaW4f/YFbn25O+9DSKXGOJRWGZgkYkDx/tC+akectPQFFrIfyeeCUPgBfyUPdJdvyY8hjn8IpGBZFaa2MU0FxYQo33cAfLb6E2B5Rd5A==
Received: from BN0PR04CA0035.namprd04.prod.outlook.com (2603:10b6:408:e8::10)
 by SJ1PR12MB6219.namprd12.prod.outlook.com (2603:10b6:a03:456::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sun, 12 Oct
 2025 23:57:57 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::a4) by BN0PR04CA0035.outlook.office365.com
 (2603:10b6:408:e8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Sun,
 12 Oct 2025 23:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Sun, 12 Oct 2025 23:57:57 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 16:57:51 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 16:57:51 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 16:57:48 -0700
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
Subject: [PATCH v1 1/6] iommu: Generic support for RMRs during device release
Date: Sun, 12 Oct 2025 16:57:37 -0700
Message-ID: <631ef0483b8d1981d037131d0f342c6970ffc155.1760312540.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|SJ1PR12MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 949994c1-c008-4e19-bea1-08de09eb2b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OVndwf61hCayzo9konwB9wH1Vw2u6HWwBOgvsd0u+kLr2G/AwVBhdd2gZsrU?=
 =?us-ascii?Q?rBhk0kIn4Iaw3y+pQHGOKLTaMqb9BpHS1hXfCHBMz//N5Cgk360UAQZmkX2D?=
 =?us-ascii?Q?CpyAaG49Fjam/pRa3AsdJ49RNVjmqQrKSihRsnzPknqxQr/hymgx7KsawcFC?=
 =?us-ascii?Q?xbrUTZRGenAqPwyCtEiCxnEuX8ZZQWC1nYgUtAGEbcQrgzKbZ/rTEe+sxJ+A?=
 =?us-ascii?Q?AanARun6DAci9qGoXvciuZ7kyiuTp5s51XPizqfDZuOVvs2kuc5GBnB4KvsF?=
 =?us-ascii?Q?pVU8DbOkNHVrKHJ3hli9ksR7E1hHZCEAjqN5uc/+adZUVEJM+yGERYB2j9VS?=
 =?us-ascii?Q?Xj9JzXPF5d0NIqpwEo0swEz5j+XUm2VUsVP0UZmBZaTVQSyojuEYTY2/Lxp8?=
 =?us-ascii?Q?ruztFFEkOtlu4+HR4KMyps89r9SeAJ5ZvDnSAtumA7jDFRqD3I27LsbmLqOA?=
 =?us-ascii?Q?Q07xYWh0ZVjP0CNS6RkKz1i9PchqlaEPFHk7kroFfHiRhdt5I1SPsEQXJu/I?=
 =?us-ascii?Q?U6KYW/Wl6Sg9wkMxAClD3uopVA4KIY8uk5HsF21H9KaFEXXxrdf491Co4KWR?=
 =?us-ascii?Q?VCIvdqQKPi8dJ1hhzDhiLBd2x8M4BcnTZQAdl0iNBLWFk1ceMD8+ODcNJriF?=
 =?us-ascii?Q?6Cmrr946MhXng7GM+RxNeQUJGWSRWSppvLWUr5DXGkjFs+zDzSdVOaRR5Eb8?=
 =?us-ascii?Q?ubCYfPJfTV+x4gDVMej/r0wjSZEnHlv5MDOSQJYVVPer2VkCEN7RTM95EsN6?=
 =?us-ascii?Q?3hvuYt84x3Qy9FZWqULqOuphPAEalIj3T4Rc6ITOI2Jm6I5AzDzSX68V1C2U?=
 =?us-ascii?Q?RNYESnwB8Cyk7KruW1vNad6Tj2KfB/cWns2CuS8CAAi1kUaxITR8bSQMkMA4?=
 =?us-ascii?Q?unlHo7BYrPTcKVUpmkdOs8qWSYOSiMTMU1atnvh/m0tmfzl8cAdSc6JRwN0Q?=
 =?us-ascii?Q?l4/effomLjYj98sy7Yv50tV7yjhZ9j/oM4O9RwKyvPjxNARZ35sgopRa6lS9?=
 =?us-ascii?Q?gtombJAXllvnf5/1nZvBDPyTwP8HT1Kw2V0Fmp2AYiJ+zpeRsOJ0TfNzntp/?=
 =?us-ascii?Q?yMbGPIGCu+KdkS6ZvbU1t8dSKMTEXqlBVB7XtZAELNfQOXT4tt+DKCgT7cNt?=
 =?us-ascii?Q?kR9gseQctbyBm3D5vNhSO6sQfM1tgpYpel9CGi9xfMYQSGOlPDGPanctZhaT?=
 =?us-ascii?Q?BAx6zD8Rio8GXJtLbl4/xn1v4X2mdJvd8GRJr9pQ0+AwOWptW+fd5tYGxyOp?=
 =?us-ascii?Q?Z9raF/NmcMLVtKOipJK+k8bzammfPdODQwhzHLxFOhAPPl+Oa3dRi/KQ48CC?=
 =?us-ascii?Q?x6mRLvOy+BFNKsHgYEySTX5B9A9o0RMkReCFCFW4Hp/r2HrKxU65QVbg138R?=
 =?us-ascii?Q?x7fGapS9r64PnVWixn+Yk6KlYPDh8DHVtgZRtr5UpkS/HWsTF0iipQfkrAGB?=
 =?us-ascii?Q?T4qKkTNIrA3D9JLGtDV8nwwA9JLgDmHxLbVFQJgQo41JpCLpZWK1ARsXC0Cf?=
 =?us-ascii?Q?z3L3/XLgmtg6OYCbYFA52uMKsLxiLmYboTTPeBn9oOwMZaiLCgtQvA4nmHYT?=
 =?us-ascii?Q?ncebb/BvnYPa+BESmtU=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 23:57:57.5266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 949994c1-c008-4e19-bea1-08de09eb2b00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219

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


