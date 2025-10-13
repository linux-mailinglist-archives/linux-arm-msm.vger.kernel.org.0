Return-Path: <linux-arm-msm+bounces-76895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8914BD0EF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F8CF3BBC67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A07324A044;
	Mon, 13 Oct 2025 00:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ixJb7Ug3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE0F22B8BD;
	Mon, 13 Oct 2025 00:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313977; cv=fail; b=R4XsEY6/4F+0riq4vWjNUFqnikSX8bnnp7pXApngpmsAKHN65bKENiAvIF1u1r1MEbuJ5s5ozTG0sDJ9yUo3YMTNo29O6xQEWsglY/oojlMpjWpP1bD5EQnrSRLD+ht/beFn00LUeokDXuSDJ8pEcaeBRwqMTpRd2iXxGzMuuQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313977; c=relaxed/simple;
	bh=kbqOpQvScmTN5T5/0i5qG4IakfJVDNMpAzUiW1KFzqo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QgJAg2kpRixGHkfpwyEtaEt/KwT4hZNmwQN5zLPdo8bjZ0bURR+Eag18y9hilOXqhMcBYouK//kvUEXn57mgp3HHVw/b5MACyRbxJSNIdMtpfqBwxBV9IEsCD9JStoIH/f1+1pSfKu7B6YO6a3ij3LeMiRZcOISLiJvc4yHRqUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ixJb7Ug3; arc=fail smtp.client-ip=52.101.85.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2YAWYjNvhzAGB/hH4in4GCkExkZJnzqVTy2YFclKqDKVPCBqK6FJM17FPJgTWrxl9DFlB0YNiP1hnJJqWHMtFpXCFuQlmHp0DaCXcg+XQh/pcSFNG5zRmrIRijVdODt2j/GhsB04X+j6hPyr4HHYJvnHaz00EU8Wgk0k65D2VSHBRcFtaCjP7LHPyvcApNJaqUxcUa1PG2YOE8SskoskSwV0KWR71pof9oFLoWnX4zCrU11GjCFlJOhAlz9LdzXXj0ODB1/qAWrrAnltcOE+j6sCCqPmOsxCdDz7wVxdxQ7ozezpsdRZFN11xZEmVXpu6Nd7be6e9+IMVqUVe63tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJARpm0+6KDFdNkqAy5+22ObehEg1OFSTeUUABI5AN0=;
 b=D8xOgJ8Yy/4jraNRzhwWYyj5lkkZH+CscRifGoOSdjnYxrbCAyvBnIG6K47q05me4RMD6/YBXlAkVDs9fjjs98PD+OdjOK2KxxY+cH7/I6bNSgVWBM57h8edjQ1JfUzRE3LCmYrb9UX8eU/gOhE0XreCF0Cc0/BvrSU6wBsOk0tx1X3Lk2fbYit14G3OFYXW66kcI8gyfGurHXk9gcuPCrrD9gWTSI0mR3U0EhB0dxlnDc12gO82eeyync/AWX9k4akINFIqlYocXPuxZ0Hst0V/XStImJxWhe9byku1ndos2EhNy1ApICnyqp7omS/12JuqspOhjd1olXygOV5hNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJARpm0+6KDFdNkqAy5+22ObehEg1OFSTeUUABI5AN0=;
 b=ixJb7Ug3ywc9cC7zt0rH0ann2JKHCj+ihI9lAcYLG3oMIpmAg0PkkuW4b8dEGsk7XRX12bf6uPMbGIHYaPozCD6NGzLYpuYo5ejjGxi1CC3KVv6iCoOGYBxeRFYiBN97k2qIm1kOSXJfc/2PrXUCioPx9EkHJJsI7SQ8QmpiiDqS2/QtFGaF9jBIQH2X8tR3Tr+5kcLuAIofqf3q8DETBxYtKeFQpCIGXkB0rAHwMte0A7BXNo7FiGplxORPBlxnGHorf2f1kfCMKJoHNHJn0d+CjJzY+mCsLguUzsFTKew+6ZhpPvXhjQHZDXGXrO2Q23zBMhDUkOgFKsXmYXzZjQ==
Received: from BL1PR13CA0074.namprd13.prod.outlook.com (2603:10b6:208:2b8::19)
 by DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 00:06:08 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::56) by BL1PR13CA0074.outlook.office365.com
 (2603:10b6:208:2b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 00:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:08 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:06:00 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:57 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:55 -0700
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
Subject: [PATCH v1 11/20] iommu/ipmmu-vmsa: Implement ipmmu_domain_test_device
Date: Sun, 12 Oct 2025 17:05:08 -0700
Message-ID: <9460b6fc29dc82ac38bdb5769e37c4814d8f2ad0.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: d29668f7-b0f3-4d4d-7a7a-08de09ec4fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vuXvuekpdyn8qg/tBTu7TFp5SRHPdbszejxlEcxGpRWyf12LOYJqoLVzXNBa?=
 =?us-ascii?Q?KbPW7Da0pmyWKF620D2ZWmqyNJ6k82XjsQUZeLAStls5ziCSufSAtJdiWlQV?=
 =?us-ascii?Q?WmUcnD6o0KG13/6b+tKPXXHdkeigzo6Bbx+DWyW4o9BsUte+OXpm68vTDFHd?=
 =?us-ascii?Q?uzI8pnT30Gmq8GxIb3zGd/riBsacPQrTWeJPgh0xwFq0XJU8SHGKwo8BQJVL?=
 =?us-ascii?Q?NxCWWjLXV1FWYVZXXp2pkgcZkV+zBkxALj7/j26IBIOT2uZ6hn6Iy1BRMhcE?=
 =?us-ascii?Q?uUNvGQHWvpIPkvLVEyBURuITRlHNSYUIDVZpQuKtM9DxU1vFZnFAxvgAo0zJ?=
 =?us-ascii?Q?wYbXOG1fKhfVO932HEdKdRLR/FbtX9z8azxpvR7BsgICqkSFvA/ZBB2/1dXX?=
 =?us-ascii?Q?xOeIhJWsAloxJ5sg7IpaYTp+7++bkMUwV4os7j/vJ9Y5mI5TBy16Zu7XO7Et?=
 =?us-ascii?Q?MvzNFMa3CYrfTuhfZ/8ptIE/taZm02GHxM+iQp6XBUEj3ibRENObPli+8UcD?=
 =?us-ascii?Q?QUNDon6FdVfooa2uiK+qiRa2H8va5r+XZDiUkmkApzQ4+VpHyXviHvbyKhJe?=
 =?us-ascii?Q?y+XMDJPMDntlqtafgAU0riUGbxYvt5cfH4SihREHkzcsK5e8VeMq7NXSmFPq?=
 =?us-ascii?Q?Ff2j16b9iCKpAh7OoIYH5GD35X2lUbM9czc9YUkW6OiHTr/SxEuzb2xALt67?=
 =?us-ascii?Q?i9SLhS7DljPfueQXX/3vX2x3thOI83tY5CUXUsdfPv2u0+kuIA/LoLyNaqxP?=
 =?us-ascii?Q?O/RqeacAkZHm+XtSrHBWWi0bXt53ARApnWfPMK171pIRFLdPZK1ttkDFH6KB?=
 =?us-ascii?Q?S8DvEwWHhTtL5pZcjMtL7FTFIx/4HzYmMxOiZoynHOPCa2Oz0PS5CUEjN4VH?=
 =?us-ascii?Q?na1CrWVG//9cgIsoTOBnzAplanvBQQ3q3uaA+gHiHoN/auT7PDNopg6M9c/U?=
 =?us-ascii?Q?J13NAoBV4Evo4pb3l6vHjqY1MKUzdnQv2sOPeroOF13BWi3Ok4RgPkfk229V?=
 =?us-ascii?Q?nfAi3c2KgDz+1o0kJh868y6M5LALvhFRoUHYH6eOf4tubAmHK60I1lb4bTSd?=
 =?us-ascii?Q?W8V2zl4w7ik+MthcNzRx+NPeBSXOfF5dqzr63o80XSsHyqWVZS+TCycuV7/q?=
 =?us-ascii?Q?aQP0X6S0dDJ1rHF3FJ2b8esEbC9t4T/JZ20Ui46h+PBlW2WBeSBNIrlKPFZS?=
 =?us-ascii?Q?v01Ag5ypXSjq8977gugEVhxSawnO2Ak9yHV4ivoyWbgG4lx4S/MVpHexB8rR?=
 =?us-ascii?Q?M4cwc1TWXtAp7sxuzq2AeoAhzqU8luK3/W8WhwwysMS67vjJlnKO9ecQWmH4?=
 =?us-ascii?Q?GExSuTbKbOpLOOrptybnY19dV4UJ4Z2VfXxUpc7r2SJc5Hi8hNtnMprxw7RY?=
 =?us-ascii?Q?qr/rGfVdVCaXVWj80cVpGgiaeeZpILuDub7ByYCTc+ljOALywFl751shS4om?=
 =?us-ascii?Q?DnHZ5ohuOnLInusxQBjtSeoJRhb7wemgeXZvLlsIYfvguY7BQftNfxhZQMdF?=
 =?us-ascii?Q?kLCqvGApkO9g7eSgkKQfWuRz0lVGZZu1088ruObsFMoiw4Dxu/Zv7MJo9Guo?=
 =?us-ascii?Q?wjK+sUwinEFKI+U4BqY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:08.5351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29668f7-b0f3-4d4d-7a7a-08de09ec4fac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/ipmmu-vmsa.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 6667ecc331f01..fdbb26ec6c632 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -589,6 +589,30 @@ static void ipmmu_domain_free(struct iommu_domain *io_domain)
 	kfree(domain);
 }
 
+static int ipmmu_domain_test_device(struct iommu_domain *io_domain,
+				    struct device *dev, ioasid_t pasid,
+				    struct iommu_domain *old)
+{
+	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
+	struct ipmmu_vmsa_device *mmu = to_ipmmu(dev);
+
+	if (!mmu) {
+		dev_dbg(dev, "Cannot attach to IPMMU\n");
+		return -ENXIO;
+	}
+
+	scoped_guard(mutex, &domain->mutex) {
+		/*
+		 * Something is wrong, we can't attach two devices using different
+		 * IOMMUs to the same domain.
+		 */
+		if (domain->mmu && domain->mmu != mmu)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ipmmu_attach_device(struct iommu_domain *io_domain,
 			       struct device *dev, struct iommu_domain *old)
 {
@@ -598,11 +622,6 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 	unsigned int i;
 	int ret = 0;
 
-	if (!mmu) {
-		dev_err(dev, "Cannot attach to IPMMU\n");
-		return -ENXIO;
-	}
-
 	mutex_lock(&domain->mutex);
 
 	if (!domain->mmu) {
@@ -616,13 +635,7 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 			dev_info(dev, "Using IPMMU context %u\n",
 				 domain->context_id);
 		}
-	} else if (domain->mmu != mmu) {
-		/*
-		 * Something is wrong, we can't attach two devices using
-		 * different IOMMUs to the same domain.
-		 */
-		ret = -EINVAL;
-	} else
+	} else /* domain->mmu == mmu */
 		dev_info(dev, "Reusing IPMMU context %u\n", domain->context_id);
 
 	mutex_unlock(&domain->mutex);
@@ -885,6 +898,7 @@ static const struct iommu_ops ipmmu_ops = {
 			? generic_device_group : generic_single_device_group,
 	.of_xlate = ipmmu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= ipmmu_domain_test_device,
 		.attach_dev	= ipmmu_attach_device,
 		.map_pages	= ipmmu_map,
 		.unmap_pages	= ipmmu_unmap,
-- 
2.43.0


