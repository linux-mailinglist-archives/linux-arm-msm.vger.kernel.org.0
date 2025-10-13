Return-Path: <linux-arm-msm+bounces-76887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5209BD0E88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C56AF1895278
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836842566;
	Mon, 13 Oct 2025 00:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FeFSZS0M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5999B339A8;
	Mon, 13 Oct 2025 00:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313967; cv=fail; b=a2j4rMAeVeOIoKB1G/NCNuEkQDNW9h1L2FhtjAhFDku43FD/6CwD3oXPKa7k2ut9qLCH4qVACI+DbDUXsQ2PEMBfdMAV3nCXUcH8sy9zFMP3y3kfZpxObCoBvuSJ02y3R04wmvPQUVRVY7jvJfTGZ6EKWiCaFKNN8FNaS5gcmmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313967; c=relaxed/simple;
	bh=dYyEsKcYZsVzEh96PQKoM2ELs1t1VAIEM1I4wIJjbWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNlYrbR5v+3ZTZZS5g1xw2vevkNJzDiV6QlhZnWQqx+hv6ZhPnLLnaDbub/gg3yhokC7WtScG2JxWzVD4/7IeEwHP/KZgPrqK6L+3UUyID1wg+bqLtmMv+Y9mW1OXnktQ/Jx3DxgpbDilrtpzNPvDBXL56LT8sKrXQX9ZUqO52Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FeFSZS0M; arc=fail smtp.client-ip=52.101.62.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfBjCyR2ybnlb82oEoz0LjLyNz7XFFwLgpXLHpYJGgmJWnyRRiwcDi9yIXbhy17VvIog//OBzE8fPtfQ5uzOzyLXHF3z25qNaxkMpb6/HIXoe7CtF5E52xd5deP/lsALZAZOxUNhDOglkMu+Zzsaue7uFYm2d/HoE7T3L7HWaqrydaH2wkhOvuvWA1Uxrp4IQ3wt+zV2ZvE0wAKruAom3Y+jbHPUqkoZaYYTDMbZJ0AnzZaECGdvOTrIPFy5VgNr4RAdeDEuyo3zlSaMnmBhxH00einU1V0DiKHkUCVtiycZuXxCg0tQRftJC4Zpyb2LSxJEE04R6GKopzUk4qdlww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v09sZbypHJWchEVdkmR3UO/t72qlThIWk+CNgXkQ6Mo=;
 b=l5sDHN5/kU7GAa27GmTwRFDHCgjDjsrfbjnVnDlU4DubaU9u1Mpx8s7MIOw8+1LGSwqJMjR+YwxFHQ7moBY4CZAZO3SI6igUdvhOYijjVvpfjbY5HtAQcrXjBhXMYjAVwv6f+5rK3IoYKxk2b+jeqmXJTTNhho/hLwM7atscpclJgNS5T9S5sMNAZspuGQvFQ4Tlq0OjWaPtA+IATkJon3Psx+8qcMB39XnFk2tuZQ8snIe+lcBBDLFafFdFb3OrUfyI1vVmoWxF0JLQLtcjZtT4TTeXzzjMoG6tOCkPNpJLdJljyLmjXSXYE1I5qCc95TWSONWwpd0GPbujDgar5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v09sZbypHJWchEVdkmR3UO/t72qlThIWk+CNgXkQ6Mo=;
 b=FeFSZS0MfmjH0CImXA5tU//LiwOKQx9cblofpvqfvF97b6HX6kNzbIflLhCTr68uWpOnZX8Rl34GisZOOKXWTSoBcucFIYU0Ch2ti9jQ6aiHszQFc+p2Pu5daYqC9vudZeuN+tkzKtYKg/6amiuVzwRc2/FlK475T122MzJAVUFMrfw+wpaVUTT92OIWg+Q43bmmAuNjniwzeggXRDoEgUIDTI5p76S0SGmXYv87qkCGUla4X612O39hoZnuYpIOK7Y7KtTPCRPL+uli0R8ctKeETiJgl0qugNU//AaEkjWqfMN5g/1WZBWHruyxq0O4X5B5gxW4lYbOqFHM5q2+jQ==
Received: from CY5PR17CA0011.namprd17.prod.outlook.com (2603:10b6:930:17::8)
 by MW4PR12MB6949.namprd12.prod.outlook.com (2603:10b6:303:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 00:05:56 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::91) by CY5PR17CA0011.outlook.office365.com
 (2603:10b6:930:17::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:05:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:05:56 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:05:34 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:33 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:31 -0700
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
Subject: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an internal helper
Date: Sun, 12 Oct 2025 17:04:59 -0700
Message-ID: <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MW4PR12MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 78946808-a7f5-4dd5-b571-08de09ec4859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RlvLI2qzTcAPDYUeZcpZFxeNrD/yU7vm99xSYJIFVbGPGSFK3ICNQQZhjp26?=
 =?us-ascii?Q?pIqOt5fXwppsqnNpGbfKXO/zAT3l5FM0SCofaK/SoKKZmrAMKPg/lMOQ8zuX?=
 =?us-ascii?Q?PqUXUACPoBZdWHQOYEeTeX65n8mS3xvJthGqg5F80pbjjZJ50MI9hTi1/166?=
 =?us-ascii?Q?5YKH+3Z/jubsHdF4envf1265UH3uCgychy5ZOVU5cHU7gHzhTqBUSRUzN+Dg?=
 =?us-ascii?Q?I4AA5CuSCEBZaPEXBCGVtPoLohYWsxTwJeVohtq3fiT+pkrQCuI3M7P68QOt?=
 =?us-ascii?Q?a9iqfisyVnfGz442wbacnvXeo/A9alNEFrm/WoWAUCjULGHNcd0jjHBr3jlA?=
 =?us-ascii?Q?9AL+0gT0DKBcIx38pPtXqHTVAvv1D9My72vmw7cZSqX0PMYm0wLPXvOnexHF?=
 =?us-ascii?Q?3fBKTuLYcxnnWoWta2paNf7vXxOX5E/Q86ksDl2OYTkq5LGBZCXEZzkPpYmM?=
 =?us-ascii?Q?sN/yZXu2GA1vk6w8kRC1cama4qg23pjzSPhO6LQHPlJqTGn31YVMgPCxONbB?=
 =?us-ascii?Q?2x0x+EauZUaDOphb0KiuotUEwCzJ4jBzBYe3Uv5OlrcgQerwJHWOzMVbgO/2?=
 =?us-ascii?Q?6Jp+Bws5fT4QkIkmKgujQQZ9oC8nywUl6GJZ1VPPUskXIZwbnXiy/gpqCHZa?=
 =?us-ascii?Q?6MM05mLsEg/OYczRJf3vFv7Zj0U51OaDfMOmb82bKwTPbTA0gnDC9978DpMv?=
 =?us-ascii?Q?dGUAS6T4skGLMVm//rMjYwROfxA579VMd4c/iuxaS8oRvLfOQE79jnle2BnO?=
 =?us-ascii?Q?sbDwRhqLHoDH905Rs/mKTB7PyHOoqCCqZ3oMsuiBkAy3qbvfzzKioTMkcCIc?=
 =?us-ascii?Q?OFoAkt09G3e/IpzQuz7bUp6mTiEh8Q40UdHWpQo4xfcFFs2eEppd0hNpqMC9?=
 =?us-ascii?Q?WWpTYmiGIheSqXWwKumCJCrijt9vBbQgiP9Sy02Ch0M15v5IxaIoLIrMG+ug?=
 =?us-ascii?Q?PLkJDOwjyn6Pg6Eu9GywdBEuutA0Dfm2oPsyO4bv2ZedRl147QlCqvmH4mJj?=
 =?us-ascii?Q?tKn+Lo5qudrvaBwXxk5emsOkkseltRjhsjNZJRriYdcE38uamAUFLyYqu+/1?=
 =?us-ascii?Q?kT2MKGYNwUx9QzeRMcMZx/VXbaGTPw7O3BC9Vbj/8zG1GpfQDYdFldY9Tb/P?=
 =?us-ascii?Q?Tmyw87b3Ip1eeZwOIeK4Yklf6HXC2eWUlKAMSq9yCC2M0Akx+sOYbk5o7a7u?=
 =?us-ascii?Q?FJJmUBu3SfwulSuqQ5yFJ+YtGSd+DJVu9V/R2Zu7W5FN5908d/Tz97JLyjMH?=
 =?us-ascii?Q?wRTHftZGzjjRV5XSt4cNSurURmp0rw6QC38hMdXzOKseJa9p5ID3R8/vIWVD?=
 =?us-ascii?Q?eoV5AFvqYpMC0BpyteU+iZmizk4jGUETKIq3+snNM6Fl8e2gukOAb1oimoYD?=
 =?us-ascii?Q?CHpcwgJnHjUBAtjatmd1Y0jIE6N1JQsAGp5+hQDgkKd9xT684xDXjk1hO/b3?=
 =?us-ascii?Q?5Veh9BtafNYdEDZT3mHflJkA5o/LvcZm+fb3e/v9f/++G1goJnKuGrDF7iiU?=
 =?us-ascii?Q?ZfvoQbDj/qcBKNmzb3d9giSxw+u9P4KNdvc85p6OyBGjZCNIjnPrFaeCVLrN?=
 =?us-ascii?Q?Zy/7QsrhGptL+q8dLA4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:05:56.3213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78946808-a7f5-4dd5-b571-08de09ec4859
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6949

Add a new test_dev domain op for driver to test the compatibility between
a domain and a device at the driver level, before calling into the actual
attachment/replacement of a domain. Support pasid for set_dev_pasid call.

Move existing core-level compatibility tests to a helper function. Invoke
it prior to:
 * __iommu_attach_device() or its wrapper __iommu_device_set_domain()
 * __iommu_set_group_pasid()

And keep them within the group->mutex, so drivers can simply move all the
sanity and compatibility tests from their attach_dev callbacks to the new
test_dev callbacks without concerning about a race condition.

This may be a public API someday for VFIO/IOMMUFD to run a list of attach
tests without doing any actual attachment, which may result in a list of
failed tests. So encourage drivers to avoid printks to prevent kernel log
spam.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h |  17 +++++--
 drivers/iommu/iommu.c | 111 ++++++++++++++++++++++++++++++------------
 2 files changed, 93 insertions(+), 35 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 801b2bd9e8d49..2ec99502dc29c 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -714,7 +714,12 @@ struct iommu_ops {
 
 /**
  * struct iommu_domain_ops - domain specific operations
- * @attach_dev: attach an iommu domain to a device
+ * @test_dev: Test compatibility prior to an @attach_dev or @set_dev_pasid call.
+ *            A driver-level callback of this op should do a thorough sanity, to
+ *            make sure a device is compatible with the domain. So the following
+ *            @attach_dev and @set_dev_pasid functions would likely succeed with
+ *            only one exception due to a temporary failure like out of memory.
+ *            It's suggested to avoid the kernel prints in this op.
  *  Return:
  * * 0		- success
  * * EINVAL	- can indicate that device and domain are incompatible due to
@@ -722,11 +727,15 @@ struct iommu_ops {
  *		  driver shouldn't log an error, since it is legitimate for a
  *		  caller to test reuse of existing domains. Otherwise, it may
  *		  still represent some other fundamental problem
- * * ENOMEM	- out of memory
- * * ENOSPC	- non-ENOMEM type of resource allocation failures
  * * EBUSY	- device is attached to a domain and cannot be changed
  * * ENODEV	- device specific errors, not able to be attached
  * * <others>	- treated as ENODEV by the caller. Use is discouraged
+ * @attach_dev: attach an iommu domain to a device
+ *  Return:
+ * * 0		- success
+ * * ENOMEM	- out of memory
+ * * ENOSPC	- non-ENOMEM type of resource allocation failures
+ * * <others>	- Use is discouraged
  * @set_dev_pasid: set or replace an iommu domain to a pasid of device. The pasid of
  *                 the device should be left in the old config in error case.
  * @map_pages: map a physically contiguous set of pages of the same size to
@@ -751,6 +760,8 @@ struct iommu_ops {
  * @free: Release the domain after use.
  */
 struct iommu_domain_ops {
+	int (*test_dev)(struct iommu_domain *domain, struct device *dev,
+			ioasid_t pasid, struct iommu_domain *old);
 	int (*attach_dev)(struct iommu_domain *domain, struct device *dev,
 			  struct iommu_domain *old);
 	int (*set_dev_pasid)(struct iommu_domain *domain, struct device *dev,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 170e522b5bda4..95f0e2898b6b5 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -99,6 +99,9 @@ static int bus_iommu_probe(const struct bus_type *bus);
 static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
+static int __iommu_domain_test_device(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid,
+				      struct iommu_domain *old);
 static int __iommu_attach_device(struct iommu_domain *domain,
 				 struct device *dev, struct iommu_domain *old);
 static int __iommu_attach_group(struct iommu_domain *domain,
@@ -642,6 +645,10 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	if (group->default_domain)
 		iommu_create_device_direct_mappings(group->default_domain, dev);
 	if (group->domain) {
+		ret = __iommu_domain_test_device(group->domain, dev,
+						 IOMMU_NO_PASID, NULL);
+		if (ret)
+			goto err_remove_gdev;
 		ret = __iommu_device_set_domain(group, dev, group->domain, NULL,
 						0);
 		if (ret)
@@ -2185,6 +2192,8 @@ EXPORT_SYMBOL_GPL(iommu_attach_device);
 
 int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
 {
+	int ret;
+
 	/*
 	 * This is called on the dma mapping fast path so avoid locking. This is
 	 * racy, but we have an expectation that the driver will setup its DMAs
@@ -2195,6 +2204,10 @@ int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
 
 	guard(mutex)(&dev->iommu_group->mutex);
 
+	ret = __iommu_domain_test_device(domain, dev, IOMMU_NO_PASID, NULL);
+	if (ret)
+		return ret;
+
 	return __iommu_attach_device(domain, dev, NULL);
 }
 
@@ -2262,6 +2275,53 @@ static bool domain_iommu_ops_compatible(const struct iommu_ops *ops,
 	return false;
 }
 
+/*
+ * Test if a future attach for a domain to the device will always fail. This may
+ * indicate that the device and the domain are incompatible in some way. Actual
+ * attach may still fail for some temporary failure like out of memory.
+ *
+ * If pasid != IOMMU_NO_PASID, it is meant to test a future set_dev_pasid call.
+ */
+static int __iommu_domain_test_device(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid,
+				      struct iommu_domain *old)
+{
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
+	struct iommu_group *group = dev->iommu_group;
+
+	lockdep_assert_held(&group->mutex);
+
+	if (!domain_iommu_ops_compatible(ops, domain))
+		return -EINVAL;
+
+	if (pasid != IOMMU_NO_PASID) {
+		struct group_device *gdev;
+
+		if (!domain->ops->set_dev_pasid || !ops->blocked_domain ||
+		    !ops->blocked_domain->ops->set_dev_pasid)
+			return -EOPNOTSUPP;
+		/*
+		 * Skip PASID validation for devices without PASID support
+		 * (max_pasids = 0). These devices cannot issue transactions
+		 * with PASID, so they don't affect group's PASID usage.
+		 */
+		for_each_group_device(group, gdev) {
+			if (gdev->dev->iommu->max_pasids > 0 &&
+			    pasid >= gdev->dev->iommu->max_pasids)
+				return -EINVAL;
+		}
+	}
+
+	/*
+	 * Domains that don't implement a test_dev callback function must have a
+	 * simple domain attach behavior. The sanity above should be enough.
+	 */
+	if (!domain->ops->test_dev)
+		return 0;
+
+	return domain->ops->test_dev(domain, dev, pasid, old);
+}
+
 static int __iommu_attach_group(struct iommu_domain *domain,
 				struct iommu_group *group)
 {
@@ -2272,8 +2332,7 @@ static int __iommu_attach_group(struct iommu_domain *domain,
 		return -EBUSY;
 
 	dev = iommu_group_first_dev(group);
-	if (!dev_has_iommu(dev) ||
-	    !domain_iommu_ops_compatible(dev_iommu_ops(dev), domain))
+	if (!dev_has_iommu(dev))
 		return -EINVAL;
 
 	return __iommu_group_set_domain(group, domain);
@@ -2381,6 +2440,13 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	if (WARN_ON(!new_domain))
 		return -EINVAL;
 
+	for_each_group_device(group, gdev) {
+		ret = __iommu_domain_test_device(new_domain, gdev->dev,
+						 IOMMU_NO_PASID, group->domain);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Changing the domain is done by calling attach_dev() on the new
 	 * domain. This switch does not have to be atomic and DMA can be
@@ -3479,38 +3545,19 @@ int iommu_attach_device_pasid(struct iommu_domain *domain,
 {
 	/* Caller must be a probed driver on dev */
 	struct iommu_group *group = dev->iommu_group;
-	struct group_device *device;
-	const struct iommu_ops *ops;
 	void *entry;
 	int ret;
 
 	if (!group)
 		return -ENODEV;
-
-	ops = dev_iommu_ops(dev);
-
-	if (!domain->ops->set_dev_pasid ||
-	    !ops->blocked_domain ||
-	    !ops->blocked_domain->ops->set_dev_pasid)
-		return -EOPNOTSUPP;
-
-	if (!domain_iommu_ops_compatible(ops, domain) ||
-	    pasid == IOMMU_NO_PASID)
+	if (pasid == IOMMU_NO_PASID)
 		return -EINVAL;
 
 	mutex_lock(&group->mutex);
-	for_each_group_device(group, device) {
-		/*
-		 * Skip PASID validation for devices without PASID support
-		 * (max_pasids = 0). These devices cannot issue transactions
-		 * with PASID, so they don't affect group's PASID usage.
-		 */
-		if ((device->dev->iommu->max_pasids > 0) &&
-		    (pasid >= device->dev->iommu->max_pasids)) {
-			ret = -EINVAL;
-			goto out_unlock;
-		}
-	}
+
+	ret = __iommu_domain_test_device(domain, dev, pasid, NULL);
+	if (ret)
+		goto out_unlock;
 
 	entry = iommu_make_pasid_array_entry(domain, handle);
 
@@ -3573,12 +3620,7 @@ int iommu_replace_device_pasid(struct iommu_domain *domain,
 
 	if (!group)
 		return -ENODEV;
-
-	if (!domain->ops->set_dev_pasid)
-		return -EOPNOTSUPP;
-
-	if (!domain_iommu_ops_compatible(dev_iommu_ops(dev), domain) ||
-	    pasid == IOMMU_NO_PASID || !handle)
+	if (pasid == IOMMU_NO_PASID || !handle)
 		return -EINVAL;
 
 	mutex_lock(&group->mutex);
@@ -3615,6 +3657,11 @@ int iommu_replace_device_pasid(struct iommu_domain *domain,
 	ret = 0;
 
 	if (curr_domain != domain) {
+		ret = __iommu_domain_test_device(domain, dev, pasid,
+						 curr_domain);
+		if (ret)
+			goto out_unlock;
+
 		ret = __iommu_set_group_pasid(domain, group,
 					      pasid, curr_domain);
 		if (ret)
-- 
2.43.0


