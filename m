Return-Path: <linux-arm-msm+bounces-76885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B486BD0E6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 043F24E479D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD691487E9;
	Mon, 13 Oct 2025 00:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uRNEemey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DAD4501A;
	Mon, 13 Oct 2025 00:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313956; cv=fail; b=Rbd/X6B5XIEBwsvPvgIz0H10+ha7x7Vpaw5iOEg71Qkp0nHfGsgF6hMtgUnAeIW+2nB8pCHZePkWMcqN0HvFf1UpAAeOcjh9GqzGPjUmOpJ8F4MGARmEDpYYXhB9NdYOVuT6GiZIFt2q4gVnwimAzj5VgVQHUENDYRaCvlf4h2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313956; c=relaxed/simple;
	bh=RoobKIHSyl828zvuovZAVNwTZM+h8LbdIYXTbzC/GKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeaWqHMgkZeQxE2iXIktEsyZiL8nd2HP1rpw4H6G3WkxUWqxuRqsp1/3pO9iYb1TnL0nL0Ww61k0jRYseCulRRRmb9vPuoJMMLLTHRsZGFjsyOoCx1j2pm6xyZMmjAtirc+wKE0v7zLCoEedvThzQrruicH4LTV3cGRTd8W1iGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uRNEemey; arc=fail smtp.client-ip=52.101.61.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Se8Hh/M0aXoxYete/IDn6WFYgN5FDka1chzu2/t7z+3yR5BZFvv/pjidV1nKSDwzDPJ0eVPAL5iYjBerp5UpYVejMW4k56PeaKlN3lN4G2b9PKybxVHuOahmvlsDSC90yFTKsJx5Jbg5XYWBNdA+AMPW90BOO8nwqUWt3EfdYsMnGyavHfVf7D291QWVyRpR2wWJ4VuG6onuHq/XDCIzB9blz6r1l/+tGK4+dY9se1Q9eDzV1yKVYQyFi/LpODx0FX5rb6GA5USq56IHlwF+/k30xc98n6R0JcefI4fGP61nfvU66sp0E+uWT3Op1BplBbQz90m9KV1Jh9tW3+L/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNKTMsPEbIaIAChdOScze58/Psu6Vn6XDzculcfCY1Y=;
 b=c+BybQX5vsSxdoJTAGND1ydXMy3r9mM+lp67uBDRPlhx+6P7w6iS2blMBOv4wTxqz5T4oSp+zkvX9+GqZ3TE/a9iML9jXIHfbNz2LaUOVrVKRIlLrULQU+xCPYA/W7UX7vS5DH97UQmKVSX8MtlKRJklEjvoEM2ROEmSTB2v10c6uBgdF9PVsyUAt9dHz1v5fUrzZV1QmV5QjBAWH2ZhxgdwJx8nsebCxFjlV5yYyejt85O5sy515YgkNIg+gxtBcKzlxW7tI6Tl7XlOwQu0kqyDQU8VWqSPL0u2frUPxdMNIWBLfCcmXgE/Pa2kDUKmkopDBTpfOyNM4bcAbw1X9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNKTMsPEbIaIAChdOScze58/Psu6Vn6XDzculcfCY1Y=;
 b=uRNEemeynl1RBPHgwTYoDoc0x/sNpws7Gv1vV938OHTrkHsIXpOTmBgofhiPxjGtgyq6kB5yayh/Hqn3Ka0BqQxu/2VQzrpZkS7icNNxnMFIqVqvtVKOIt4098EZ/bAUO2O+mX4CdSlZgjysRz/SVqXM67LHbNrWDOy29OrPmZA9P1VZ433tvmeo5/xcXmZQ0YKEGSqGGr2qyWF5Vc8cBnIU2B57L5xL/ZNIGlVad699D7B4muMQeZ54wI1OGvWAlUcbcP2Ao0AFlhq1kyRtpJUl0J0K/5R2+mqAflnt+MpA8PbvbfWz14lLlETVq9m6QG5ta0OK1YKv5k8NHywiYg==
Received: from BL1P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::24)
 by SJ2PR12MB8881.namprd12.prod.outlook.com (2603:10b6:a03:546::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:05:51 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::2d) by BL1P221CA0009.outlook.office365.com
 (2603:10b6:208:2c5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:05:51 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:05:37 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:36 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:34 -0700
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
Subject: [PATCH v1 03/20] iommu/arm-smmu-v3: Implement arm_smmu_domain_test_dev
Date: Sun, 12 Oct 2025 17:05:00 -0700
Message-ID: <f52e8079148a673641d2858700c49fa0c81022aa.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|SJ2PR12MB8881:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac1a793-973b-40e7-9948-08de09ec4549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xhsdQx3rW29xTC6K6kz9QpFrrlAk20RfkCnfvlQo5okLGvQyPS3yiUU+6m1J?=
 =?us-ascii?Q?go8yaUwEWmOjn0Ddoh+9fKpPYCclHk44OC32n9oRMERTm54xqxi9mHOwGeYT?=
 =?us-ascii?Q?4x/5u81B15IbmdjNKMR9gxa8f7z9MdButm4Z6QJR2iAWiVH6V7QZlJwGpoRQ?=
 =?us-ascii?Q?WJheR/x5rIVG484dVCM65NCq4v2YHIMVqHwzeK3tcbNHQK6dYFY1RtGPhFfk?=
 =?us-ascii?Q?NzwbYiQjAo1Kqq1HmR2KXvw+EEEHhdpyfso3oJxONhkOlZCoT0qfMguTEDV5?=
 =?us-ascii?Q?V3RfzikCVDnjni4j1mNsfBCcBFwBYwCopgu7auFRk55OdfLJXfW7xOH8aW3O?=
 =?us-ascii?Q?0jzrXtNpkaVw6wMK4Due6DN3lUtxihFlIQvc4Glf8+D+Z3TAcIZ+MaJiWC/K?=
 =?us-ascii?Q?MwZ/ESgMkgZktBqgM3ElYEGYfxUWuUeX7TURA/X8cXxmJkGcTDhWlRPwHAAK?=
 =?us-ascii?Q?/2KsugD5BPJDvkJFOdaEX6vAVw9XtjJCzY4V7JI2uaor18ey6HJ30LVipK/M?=
 =?us-ascii?Q?oyc/KSL6StVaOd/97I6qZAkjSEfcytF6xgrK76aXN6M+vZUESjfe+U27r6+A?=
 =?us-ascii?Q?Mj3q62CDmddVpzvi/C6/YqnSyspm+i/a9fyCGC44c4ZSSRIP6iJcl8bCwMIi?=
 =?us-ascii?Q?wYT4vXk7O6Z5orKJLtkF9cGMZr6RSWw8yGwW70mhbJGyxzm8ktCMOjLdl7xQ?=
 =?us-ascii?Q?V5iN7cyRY4eZlUZ7lopy7F2WELj/WoIebVlLBwS/C47cv/QZCgGq+QU1QOC6?=
 =?us-ascii?Q?HQ7+cxFqiNi4QqZPbgUYtBC63VRrWNfx4wQ9UT2F4ydLLxSYqlnyPGIeRj4o?=
 =?us-ascii?Q?SH8mzFNIbt305QjTI4GlNOz8FGQYKlTqp2DcjLU1P1enHCLaZPoik7hGC6NX?=
 =?us-ascii?Q?K7hd+jF0c82hyvwmS1hyr4dftIPBo6U1DU9C2/W3fuZ1yPKQmzG2v1P93yy8?=
 =?us-ascii?Q?Xgczy+dQtVXzfFMScgHEr1WSXmoyeH+ySdEgF5hJr9VmAByS0CYln3R59vy2?=
 =?us-ascii?Q?SkIQ3wy5PVQXiSEhHcFUa00ilr9A1+MtSWR+ybdiiQe0PQJttrCSWIle4MFb?=
 =?us-ascii?Q?qN7FDhR4VJlbc8j27nK2mQHNTpcC6QYu3EWrEWe+UYIwm77Y3VBjPVVFUbiA?=
 =?us-ascii?Q?cn7NqH2NivREWKj848d5qFocGBaY1+Xmh8TGREVnWWl8TW5RqpEkjHdRvf3o?=
 =?us-ascii?Q?SjfaIlAFWp0YnFByoa/F0Q9NU6XEnPBe5UZdy+Axo30Fkjivw9rKT5uT1ah4?=
 =?us-ascii?Q?3CsKkR92GFxksgfuCTE4iR1mdVxe+1vRBvhDwLipasdkGx68aBmPH4PrJYn5?=
 =?us-ascii?Q?nBuFvr0yw8t5Qao1O+WKDea45elBMFNQoVNJ43kh9x+j5ybq0PUIGHpY3RkN?=
 =?us-ascii?Q?gshNtTPON3uykwJK6nq6dRmLanbKEC/kI2HddLgE96ogUm+62gjcznFpffCA?=
 =?us-ascii?Q?QC5h3Ol026o/0cGp9YBCQIPT+lLJkg7GfwGGDi764TEj5EEP1tNOgHdUc3ZF?=
 =?us-ascii?Q?A8ABCw3PRINht/eGoDLgIxOdVqhHEVAmAywjj5PFkt8BWd0RKKJULwIYuF6T?=
 =?us-ascii?Q?hEPiLVPudpAiwixk7Tc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:05:51.1083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac1a793-973b-40e7-9948-08de09ec4549
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8881

Move sanity and compatibility tests from the attach_dev callbacks to this
new test_dev callback function. The IOMMU core makes sure an attach_dev()
must be invoked after a successful test_dev callback.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   2 +
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   6 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |   4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 113 +++++++++++-------
 4 files changed, 74 insertions(+), 51 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ae23aacc38402..acb1dbc592cf0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -963,6 +963,8 @@ void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
 			     struct arm_smmu_cd *cdptr,
 			     const struct arm_smmu_cd *target);
 
+int arm_smmu_domain_test_dev(struct iommu_domain *domain, struct device *dev,
+			     ioasid_t pasid, struct iommu_domain *old_domain);
 int arm_smmu_set_pasid(struct arm_smmu_master *master,
 		       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
 		       struct arm_smmu_cd *cd, struct iommu_domain *old);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 313201a616991..a253f9c8bb290 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -152,11 +152,6 @@ static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
 	struct arm_smmu_ste ste;
 	int ret;
 
-	if (nested_domain->vsmmu->smmu != master->smmu)
-		return -EINVAL;
-	if (arm_smmu_ssids_in_use(&master->cd_table))
-		return -EBUSY;
-
 	mutex_lock(&arm_smmu_asid_lock);
 	/*
 	 * The VM has to control the actual ATS state at the PCI device because
@@ -187,6 +182,7 @@ static void arm_smmu_domain_nested_free(struct iommu_domain *domain)
 }
 
 static const struct iommu_domain_ops arm_smmu_nested_ops = {
+	.test_dev = arm_smmu_domain_test_dev,
 	.attach_dev = arm_smmu_attach_dev_nested,
 	.free = arm_smmu_domain_nested_free,
 };
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 59a480974d80f..610d9e826c07e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -276,9 +276,6 @@ static int arm_smmu_sva_set_dev_pasid(struct iommu_domain *domain,
 	struct arm_smmu_cd target;
 	int ret;
 
-	if (!(master->smmu->features & ARM_SMMU_FEAT_SVA))
-		return -EOPNOTSUPP;
-
 	/* Prevent arm_smmu_mm_release from being called while we are attaching */
 	if (!mmget_not_zero(domain->mm))
 		return -EINVAL;
@@ -319,6 +316,7 @@ static void arm_smmu_sva_domain_free(struct iommu_domain *domain)
 }
 
 static const struct iommu_domain_ops arm_smmu_sva_domain_ops = {
+	.test_dev		= arm_smmu_domain_test_dev,
 	.set_dev_pasid		= arm_smmu_sva_set_dev_pasid,
 	.free			= arm_smmu_sva_domain_free
 };
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a33fbd12a0dd9..3448e55bbcdbb 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2765,9 +2765,6 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
 
 	iommu_group_mutex_assert(master->dev);
 
-	if (!IS_ENABLED(CONFIG_ARM_SMMU_V3_SVA))
-		return -EOPNOTSUPP;
-
 	/*
 	 * Drivers for devices supporting PRI or stall require iopf others have
 	 * device-specific fault handlers and don't need IOPF, so this is not a
@@ -2776,10 +2773,6 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
 	if (!master->stall_enabled)
 		return 0;
 
-	/* We're not keeping track of SIDs in fault events */
-	if (master->num_streams != 1)
-		return -EOPNOTSUPP;
-
 	if (master->iopf_refcount) {
 		master->iopf_refcount++;
 		master_domain->using_iopf = true;
@@ -2937,14 +2930,6 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
 		 * one of them.
 		 */
 		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
-		if (smmu_domain->enforce_cache_coherency &&
-		    !arm_smmu_master_canwbs(master)) {
-			spin_unlock_irqrestore(&smmu_domain->devices_lock,
-					       flags);
-			ret = -EINVAL;
-			goto err_iopf;
-		}
-
 		if (state->ats_enabled)
 			atomic_inc(&smmu_domain->nr_ats_masters);
 		list_add(&master_domain->devices_elm, &smmu_domain->devices);
@@ -2962,8 +2947,6 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
 	}
 	return 0;
 
-err_iopf:
-	arm_smmu_disable_iopf(master, master_domain);
 err_free_master_domain:
 	kfree(master_domain);
 err_free_vmaster:
@@ -3002,13 +2985,79 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state)
 	master->ats_enabled = state->ats_enabled;
 }
 
+int arm_smmu_domain_test_dev(struct iommu_domain *domain, struct device *dev,
+			     ioasid_t pasid, struct iommu_domain *old_domain)
+{
+	struct arm_smmu_domain *device_domain = to_smmu_domain_devices(domain);
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+
+	if (!dev_iommu_fwspec_get(dev))
+		return -ENOENT;
+
+	switch (domain->type) {
+	case IOMMU_DOMAIN_NESTED: {
+		struct arm_smmu_nested_domain *nested_domain =
+			to_smmu_nested_domain(domain);
+
+		if (WARN_ON(pasid != IOMMU_NO_PASID))
+			return -EOPNOTSUPP;
+		if (nested_domain->vsmmu->smmu != master->smmu)
+			return -EINVAL;
+		if (arm_smmu_ssids_in_use(&master->cd_table))
+			return -EBUSY;
+		break;
+	}
+	case IOMMU_DOMAIN_SVA:
+		if (!(master->smmu->features & ARM_SMMU_FEAT_SVA))
+			return -EOPNOTSUPP;
+		break;
+	default: {
+		struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+
+		if (smmu_domain->smmu != master->smmu)
+			return -EINVAL;
+		if (smmu_domain->stage == ARM_SMMU_DOMAIN_S2 &&
+		    arm_smmu_ssids_in_use(&master->cd_table))
+			return -EBUSY;
+		if (pasid != IOMMU_NO_PASID) {
+			struct iommu_domain *sid_domain =
+				iommu_get_domain_for_dev(master->dev);
+
+			if (smmu_domain->stage != ARM_SMMU_DOMAIN_S1)
+				return -EINVAL;
+			if (!master->cd_table.in_ste &&
+			    sid_domain->type != IOMMU_DOMAIN_IDENTITY &&
+			    sid_domain->type != IOMMU_DOMAIN_BLOCKED)
+				return -EINVAL;
+		}
+		break;
+	}
+	}
+
+	if (domain->iopf_handler) {
+		if (!IS_ENABLED(CONFIG_ARM_SMMU_V3_SVA))
+			return -EOPNOTSUPP;
+		/* We're not keeping track of SIDs in fault events */
+		if (master->stall_enabled && master->num_streams != 1)
+			return -EOPNOTSUPP;
+	}
+
+	if (device_domain) {
+		scoped_guard(spinlock_irqsave, &device_domain->devices_lock) {
+			if (device_domain->enforce_cache_coherency &&
+			    !arm_smmu_master_canwbs(master))
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
 			       struct iommu_domain *old_domain)
 {
 	int ret = 0;
 	struct arm_smmu_ste target;
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_device *smmu;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_attach_state state = {
 		.old_domain = old_domain,
@@ -3017,21 +3066,13 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
 	struct arm_smmu_master *master;
 	struct arm_smmu_cd *cdptr;
 
-	if (!fwspec)
-		return -ENOENT;
-
 	state.master = master = dev_iommu_priv_get(dev);
-	smmu = master->smmu;
-
-	if (smmu_domain->smmu != smmu)
-		return -EINVAL;
 
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		cdptr = arm_smmu_alloc_cd_ptr(master, IOMMU_NO_PASID);
 		if (!cdptr)
 			return -ENOMEM;
-	} else if (arm_smmu_ssids_in_use(&master->cd_table))
-		return -EBUSY;
+	}
 
 	/*
 	 * Prevent arm_smmu_share_asid() from trying to change the ASID
@@ -3078,15 +3119,8 @@ static int arm_smmu_s1_set_dev_pasid(struct iommu_domain *domain,
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
-	struct arm_smmu_device *smmu = master->smmu;
 	struct arm_smmu_cd target_cd;
 
-	if (smmu_domain->smmu != smmu)
-		return -EINVAL;
-
-	if (smmu_domain->stage != ARM_SMMU_DOMAIN_S1)
-		return -EINVAL;
-
 	/*
 	 * We can read cd.asid outside the lock because arm_smmu_set_pasid()
 	 * will fix it
@@ -3136,14 +3170,6 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
 
 	/* The core code validates pasid */
 
-	if (smmu_domain->smmu != master->smmu)
-		return -EINVAL;
-
-	if (!master->cd_table.in_ste &&
-	    sid_domain->type != IOMMU_DOMAIN_IDENTITY &&
-	    sid_domain->type != IOMMU_DOMAIN_BLOCKED)
-		return -EINVAL;
-
 	cdptr = arm_smmu_alloc_cd_ptr(master, pasid);
 	if (!cdptr)
 		return -ENOMEM;
@@ -3695,6 +3721,7 @@ static const struct iommu_ops arm_smmu_ops = {
 	.user_pasid_table	= 1,
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev		= arm_smmu_domain_test_dev,
 		.attach_dev		= arm_smmu_attach_dev,
 		.enforce_cache_coherency = arm_smmu_enforce_cache_coherency,
 		.set_dev_pasid		= arm_smmu_s1_set_dev_pasid,
-- 
2.43.0


