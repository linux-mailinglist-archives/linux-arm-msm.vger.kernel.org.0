Return-Path: <linux-arm-msm+bounces-76889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE009BD0E8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA8533B8A46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6532F211472;
	Mon, 13 Oct 2025 00:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M2jbau65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB97751022;
	Mon, 13 Oct 2025 00:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313969; cv=fail; b=ONHX26NnlP325Tbk+M7FDugEWKrQF0f2oWrg/O1TCQ7VLo4Di0sZOiEwSLqHbFwoUz70ZOcP13vZMHEc9X4XrsIHKhhg9ukDdwAbhCpFy1SN6yvBa6hTPmFJJUxGC5bnAGsMLPzqcu26uS+BZ1bPZVO3EEXc7sM149qch2pNHqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313969; c=relaxed/simple;
	bh=+DwmtdY88cpukbGdoRDdz4NS917HRxjC05DpaA+A6aY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tuG8CiTMLdJ73YGwTXuLVHM6KSPI1uuMM3FHhrj3SnRMRGkMpNGnlz8AvHxcvEJTd6mNEHn0VoXH//E5FtYDopHfU5bolaGSjrfJBvvbc6e/imREbw74/BxZ7GNASU093CawU0oiqnnaUUaeZcFOwwxrFznx5AdLIlMPvZxawRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M2jbau65; arc=fail smtp.client-ip=40.93.194.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAiBfN+JHAsh5XZZqKFU3dx2ANThiftTYDfXx1RW29EGN2SwSbqA46MyFTrpAZ+6byzTcmY+yFFfZaAbhmi0NmENINcPW/51DzKoZ388TUP/vC8Fu+TagoCv6Hhj1uzUzi9rrDmNfLeWB2/fBe8K4o9KiA/B8QShsiZ5Wy9uQ9r/SnRLsMbnpfBEqFQcZu9J2vfjDyiQuY6CF8AC76YTul0ANqFwCPKBlFlp39C6dQN/7EEE7IAEbWtcDOYiq2tcQP6ujidofvvu0eMoScGbiP8PPA/QdDyrnDoXTvBhE/v8+dyWfswtra3arh8ofLTgfZLf0+7wDC9IaaknLeAKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U04N37/i2Gx0En0oabDvjhxLDpt6Lmu1eTHiLTJwMLw=;
 b=ydu3pnqbvqRfp1kExx9pbc3elovUke192AZ6tQ0BVqSibY8hS2VZCf6JZSN4TyU4NUZVhuX7lw6pM1JTXqQet7gdWPcY3cp9QnWEqc7l5lcrvFrSCaHRbwEWgrM3hSibvF2IxzwGgHu0ROU/y992CO6ORW2IXsWq+XYmYQ6P9cCVV3TpzQ/h91TLNoC4nFbpN8E0GPJlKdauuo8F/bi27a0Kbrj9n3CyIUQrr4buAwnhCruxOa/nr2CjBsMTPTYIE024ZHT1lOJu7rNepdPLvJpcbxun4rzmzhI/o3WxTiC877XvzHevDI679m56at7AvFZ9gvDo83MNIXqn35hMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U04N37/i2Gx0En0oabDvjhxLDpt6Lmu1eTHiLTJwMLw=;
 b=M2jbau65qMk+M69xlUXgreIY60LZRt5vL0csAaA53jL7tuunYg+DPA3qivzTvm3kfXdOhikviSG+hQbPSHz/W/OI8E+2WGbgHb3av1D7TVawf2j31h8vWVQaVMlUmRegBI55CWTqabyPGACFxf11kes+GnxhGROBwL+XAityY5JEqzFP2tfZhbkBm+bG4KY0XUEmGOr2M/u1RB46ygJX5h1N2CLX88F2dN2HOUTtR/nA8kAZWntCNbh/8mrrEIP8on7fB3+Lf1C9MVeGt9gDr7fJMTTqrJjhdqJR1A4HlK5G0hwQabMWQLBZOWIK5gAXF778Ms26nM6B5llNYt+96A==
Received: from PH7PR17CA0046.namprd17.prod.outlook.com (2603:10b6:510:323::6)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:06:00 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::60) by PH7PR17CA0046.outlook.office365.com
 (2603:10b6:510:323::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:05:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:05:59 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:05:39 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:39 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:36 -0700
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
Subject: [PATCH v1 04/20] iommu/intel: Implement test_dev callbacks to domain ops
Date: Sun, 12 Oct 2025 17:05:01 -0700
Message-ID: <6be7d22093c09af872ecf8880566f9d9486fb744.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 72735675-3d61-4672-9007-08de09ec4a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MmnJzp15KLJ2J83My72pGU4ckVK7AaEEASjw26zAnhBGKUM6uuoQPajbPzOy?=
 =?us-ascii?Q?y/X6WEkwl/L5dDLQ/b8Fe6xFiu2lV97+OFhVw6AYFlcz4dUzHX5BM7A7N5IT?=
 =?us-ascii?Q?z+hk/Tj6FFy6FEzsrjqHmSownERL2JqeASNxVY0KYzfPcU/DtCov8rvMPo5F?=
 =?us-ascii?Q?0IjO00+Qk+SySW7Ia0e/2Bd3BWXZmkcivHrTUlsqs0IEVbH1rZGYVaM1Y5TP?=
 =?us-ascii?Q?SNzdzFaxT8dPYvGNiEOIXMi1jquCTSPMJqRQ7pEZMe3OeRCuiFlIuKt3nux2?=
 =?us-ascii?Q?VbiS7s9q5gb+ruoXodPc+3ilK3yDg35Wr0FmGSJEin/MHdz0/sEMVu4sFHxO?=
 =?us-ascii?Q?IpQ2vgyNZiApNxhYsl7W6viQamL4dDTIi4B7HaUUFDbbX6gTp0kuuqlwu9aT?=
 =?us-ascii?Q?f+UDWcZBJNvbqbk7g+0iS0I4fAxaK7xz9NejjWqK417UaHMtL+q1Min87Rzw?=
 =?us-ascii?Q?qZQ0gFT+4N3XS0DPyQgTUpyf21vTtKudSYxoKpQdhFfmXLU0XdgjCcM4OOQ7?=
 =?us-ascii?Q?hgwaFOw/kFWTaC1nW5HFcTCjAZSiCRt5c4Klkz0xz3+XPzdV6rA/fdZC012V?=
 =?us-ascii?Q?SFjceTrCVibn73oKywIBEJQwZuglU63ncQxfai6opaYKKPTkGA/gaYzRHO36?=
 =?us-ascii?Q?2G3o2kkHLH8E3JM5EuKOMSOm0Bn/51gBMAU1lsZ0HVlbMojE0jyRsJVDJZ49?=
 =?us-ascii?Q?Nht9tbg/S7fIMm8Yl7KI7eUjE14TEVVPXDa4pIUPuLzzvZstxRuEbFHTz9df?=
 =?us-ascii?Q?AoR21DtRQZoUjQOEFgYXlN0kxH4n4l7TP7Pl5Ck+75b93yHZwCOyIdL6dvxy?=
 =?us-ascii?Q?JBIEezcLPTJskGsFMB5gXRHwGZWZl4JVwB2pRKqAuJgQuvofsG1Z4JzOzm3X?=
 =?us-ascii?Q?IE+4dWk2VGCFsbMqEho1QO1RThKP/yr564wfuUdv+u1rauzmeAG1Dw5Tb7ws?=
 =?us-ascii?Q?WLzlj4aEYnoU8CjsdtofHq11Wn4YJyzyKC3nKUjHO1ePLqkcpJRgzaRMb1ct?=
 =?us-ascii?Q?Yoa04CIom7ImyfXHVSP7rd0aNKa+/jpRGYv59/QJarfuXxAJWnZklVVYEnmk?=
 =?us-ascii?Q?lzNkCmx2WIdcSQ4Li6KdZtXhVwPTwQNANMBKWMP51n+lwcu8CWJeQ9o+iDYk?=
 =?us-ascii?Q?DF7gDBB7mgwyycTDMicr0YwX+AfUWgcgsAn0UrBcunLzB1jkckyL00lOAhFu?=
 =?us-ascii?Q?/RfSAO+17psZSPIarFFkrNcQFPi6N/WF3hfBnc1i4yqm4WJKBQ1rany6fDzo?=
 =?us-ascii?Q?vIj5L6vAkBmnakktdr4Wc/VKburYB9zHHTvTkCgpulC6s4b3L/5VJdZA9rmb?=
 =?us-ascii?Q?MTMR1U0YQmapMohXM6jo/umzIpYPyqPEsw0ZmsULdPh982p+lOP0p8Hl/24g?=
 =?us-ascii?Q?CQ3lK1+xOdyG9piznV5H7r8i8+vi8X2xNX3TcrM+yBFt9ldoO1R5QAQO4D5S?=
 =?us-ascii?Q?iJgMF7mLaeUtP6/snvXGAT0R4L7LQzbNYmg7qgQOKxMovNJCWSjl3ArU7tsa?=
 =?us-ascii?Q?yttHouYgrOnYGwy1Z5BxKIybg/tUFpsotkRU1TEjIgITuhuJh6ByAVTbHlgq?=
 =?us-ascii?Q?htuZ6u4EsB6cdumeudg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:05:59.8461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72735675-3d61-4672-9007-08de09ec4a73
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956

Move sanity and compatibility tests from the attach_dev callbacks to the
new test_dev callback functions. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Following the test_dev guideline, replace dev_err with dev_dbg.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/intel/iommu.c  | 66 +++++++++++++++++++++---------------
 drivers/iommu/intel/nested.c | 29 +++++++++++-----
 drivers/iommu/intel/svm.c    | 11 +++---
 3 files changed, 67 insertions(+), 39 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index f0396591cd9bb..10d422bd463a2 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3537,6 +3537,26 @@ int paging_domain_compatible(struct iommu_domain *domain, struct device *dev)
 	return 0;
 }
 
+static int intel_iommu_test_device(struct iommu_domain *domain,
+				   struct device *dev, ioasid_t pasid,
+				   struct iommu_domain *old)
+{
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct intel_iommu *iommu = info->iommu;
+
+	if (pasid != IOMMU_NO_PASID) {
+		if (WARN_ON_ONCE(!(domain->type & __IOMMU_DOMAIN_PAGING)))
+			return -EINVAL;
+		if (!pasid_supported(iommu) || dev_is_real_dma_subdevice(dev))
+			return -EOPNOTSUPP;
+		if (domain->dirty_ops)
+			return -EINVAL;
+		if (context_copied(iommu, info->bus, info->devfn))
+			return -EBUSY;
+	}
+	return paging_domain_compatible(domain, dev);
+}
+
 static int intel_iommu_attach_device(struct iommu_domain *domain,
 				     struct device *dev,
 				     struct iommu_domain *old)
@@ -3545,10 +3565,6 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 
 	device_block_translation(dev);
 
-	ret = paging_domain_compatible(domain, dev);
-	if (ret)
-		return ret;
-
 	ret = iopf_for_domain_set(domain, dev);
 	if (ret)
 		return ret;
@@ -4151,22 +4167,6 @@ static int intel_iommu_set_dev_pasid(struct iommu_domain *domain,
 	struct dev_pasid_info *dev_pasid;
 	int ret;
 
-	if (WARN_ON_ONCE(!(domain->type & __IOMMU_DOMAIN_PAGING)))
-		return -EINVAL;
-
-	if (!pasid_supported(iommu) || dev_is_real_dma_subdevice(dev))
-		return -EOPNOTSUPP;
-
-	if (domain->dirty_ops)
-		return -EINVAL;
-
-	if (context_copied(iommu, info->bus, info->devfn))
-		return -EBUSY;
-
-	ret = paging_domain_compatible(domain, dev);
-	if (ret)
-		return ret;
-
 	dev_pasid = domain_add_dev_pasid(domain, dev, pasid);
 	if (IS_ERR(dev_pasid))
 		return PTR_ERR(dev_pasid);
@@ -4178,12 +4178,9 @@ static int intel_iommu_set_dev_pasid(struct iommu_domain *domain,
 	if (intel_domain_is_fs_paging(dmar_domain))
 		ret = domain_setup_first_level(iommu, dmar_domain,
 					       dev, pasid, old);
-	else if (intel_domain_is_ss_paging(dmar_domain))
+	else /* paging_domain_compatible() made sure it's ss_paging */
 		ret = domain_setup_second_level(iommu, dmar_domain,
 						dev, pasid, old);
-	else if (WARN_ON(true))
-		ret = -EINVAL;
-
 	if (ret)
 		goto out_unwind_iopf;
 
@@ -4403,6 +4400,21 @@ static int device_setup_pass_through(struct device *dev)
 				      context_setup_pass_through_cb, dev);
 }
 
+static int identity_domain_test_dev(struct iommu_domain *domain,
+				    struct device *dev, ioasid_t pasid,
+				    struct iommu_domain *old)
+{
+	if (pasid != IOMMU_NO_PASID) {
+		struct device_domain_info *info = dev_iommu_priv_get(dev);
+		struct intel_iommu *iommu = info->iommu;
+
+		if (!pasid_supported(iommu) || dev_is_real_dma_subdevice(dev))
+			return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int identity_domain_attach_dev(struct iommu_domain *domain,
 				      struct device *dev,
 				      struct iommu_domain *old)
@@ -4440,9 +4452,6 @@ static int identity_domain_set_dev_pasid(struct iommu_domain *domain,
 	struct intel_iommu *iommu = info->iommu;
 	int ret;
 
-	if (!pasid_supported(iommu) || dev_is_real_dma_subdevice(dev))
-		return -EOPNOTSUPP;
-
 	ret = iopf_for_domain_replace(domain, old, dev);
 	if (ret)
 		return ret;
@@ -4460,12 +4469,14 @@ static int identity_domain_set_dev_pasid(struct iommu_domain *domain,
 static struct iommu_domain identity_domain = {
 	.type = IOMMU_DOMAIN_IDENTITY,
 	.ops = &(const struct iommu_domain_ops) {
+		.test_dev	= identity_domain_test_dev,
 		.attach_dev	= identity_domain_attach_dev,
 		.set_dev_pasid	= identity_domain_set_dev_pasid,
 	},
 };
 
 const struct iommu_domain_ops intel_fs_paging_domain_ops = {
+	.test_dev = intel_iommu_test_device,
 	.attach_dev = intel_iommu_attach_device,
 	.set_dev_pasid = intel_iommu_set_dev_pasid,
 	.map_pages = intel_iommu_map_pages,
@@ -4479,6 +4490,7 @@ const struct iommu_domain_ops intel_fs_paging_domain_ops = {
 };
 
 const struct iommu_domain_ops intel_ss_paging_domain_ops = {
+	.test_dev = intel_iommu_test_device,
 	.attach_dev = intel_iommu_attach_device,
 	.set_dev_pasid = intel_iommu_set_dev_pasid,
 	.map_pages = intel_iommu_map_pages,
diff --git a/drivers/iommu/intel/nested.c b/drivers/iommu/intel/nested.c
index 760d7aa2ade84..708b8e653d5cd 100644
--- a/drivers/iommu/intel/nested.c
+++ b/drivers/iommu/intel/nested.c
@@ -18,19 +18,17 @@
 #include "iommu.h"
 #include "pasid.h"
 
-static int intel_nested_attach_dev(struct iommu_domain *domain,
-				   struct device *dev, struct iommu_domain *old)
+static int intel_nested_test_dev(struct iommu_domain *domain,
+				 struct device *dev, ioasid_t pasid,
+				 struct iommu_domain *old)
 {
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
 	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
 	struct intel_iommu *iommu = info->iommu;
-	unsigned long flags;
-	int ret = 0;
-
-	device_block_translation(dev);
+	int ret;
 
 	if (iommu->agaw < dmar_domain->s2_domain->agaw) {
-		dev_err_ratelimited(dev, "Adjusted guest address width not compatible\n");
+		dev_dbg_ratelimited(dev, "Adjusted guest address width not compatible\n");
 		return -ENODEV;
 	}
 
@@ -41,10 +39,24 @@ static int intel_nested_attach_dev(struct iommu_domain *domain,
 	 */
 	ret = paging_domain_compatible(&dmar_domain->s2_domain->domain, dev);
 	if (ret) {
-		dev_err_ratelimited(dev, "s2 domain is not compatible\n");
+		dev_dbg_ratelimited(dev, "s2 domain is not compatible\n");
 		return ret;
 	}
 
+	return 0;
+}
+
+static int intel_nested_attach_dev(struct iommu_domain *domain,
+				   struct device *dev, struct iommu_domain *old)
+{
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	struct intel_iommu *iommu = info->iommu;
+	unsigned long flags;
+	int ret = 0;
+
+	device_block_translation(dev);
+
 	ret = domain_attach_iommu(dmar_domain, iommu);
 	if (ret) {
 		dev_err_ratelimited(dev, "Failed to attach domain to iommu\n");
@@ -192,6 +204,7 @@ static int intel_nested_set_dev_pasid(struct iommu_domain *domain,
 }
 
 static const struct iommu_domain_ops intel_nested_domain_ops = {
+	.test_dev		= intel_nested_test_dev,
 	.attach_dev		= intel_nested_attach_dev,
 	.set_dev_pasid		= intel_nested_set_dev_pasid,
 	.free			= intel_nested_domain_free,
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index e147f71f91b72..5901caa4ceebc 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -145,6 +145,12 @@ static int intel_iommu_sva_supported(struct device *dev)
 	return 0;
 }
 
+static int intel_svm_test_dev(struct iommu_domain *domain, struct device *dev,
+			      ioasid_t pasid, struct iommu_domain *old)
+{
+	return intel_iommu_sva_supported(dev);
+}
+
 static int intel_svm_set_dev_pasid(struct iommu_domain *domain,
 				   struct device *dev, ioasid_t pasid,
 				   struct iommu_domain *old)
@@ -156,10 +162,6 @@ static int intel_svm_set_dev_pasid(struct iommu_domain *domain,
 	unsigned long sflags;
 	int ret = 0;
 
-	ret = intel_iommu_sva_supported(dev);
-	if (ret)
-		return ret;
-
 	dev_pasid = domain_add_dev_pasid(domain, dev, pasid);
 	if (IS_ERR(dev_pasid))
 		return PTR_ERR(dev_pasid);
@@ -195,6 +197,7 @@ static void intel_svm_domain_free(struct iommu_domain *domain)
 }
 
 static const struct iommu_domain_ops intel_svm_domain_ops = {
+	.test_dev		= intel_svm_test_dev,
 	.set_dev_pasid		= intel_svm_set_dev_pasid,
 	.free			= intel_svm_domain_free
 };
-- 
2.43.0


