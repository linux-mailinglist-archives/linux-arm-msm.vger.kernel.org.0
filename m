Return-Path: <linux-arm-msm+bounces-76892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B92BD0ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3CE01895B53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A33225401;
	Mon, 13 Oct 2025 00:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TvK5ybDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FF8219E8C;
	Mon, 13 Oct 2025 00:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313974; cv=fail; b=dphFJjCpWGOnl+HG17WWGi+zJ+ZYMfDQOXKuV4KgEu0sPqw0slaRY+oKH8e2hPGvKdve53pvH0Ya80kEnkDx/qh28u31k7qWxMZz8OLkuXoQrPi9cnT+bNdrOgHoBe3Y89ZcvkaSbkpEci/5wPAwt2KqBOOxya099W290k85WT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313974; c=relaxed/simple;
	bh=VMhLudar5co6fjR4Sjp7OIriaS4xi/qDiFZQzmp5OhY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0U8MYqg2b/PxK/hEGfH0Z2viK/8VRLBwdO5+vk79hX+XCy3MdijU+B0BASSb4wWaqXMdywOV/wYkDKWQymE3WM993/dIHynWE+KV2J/OEG5Qwx2pjP9766t3FLEv4J3l94AyrkS7LjrxLpf4zxdyzUhnzJpw6jbkXffbcKcnQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TvK5ybDj; arc=fail smtp.client-ip=40.93.195.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CliXhVYDkvoNEM3sdSrB1dmVkY0iS8HRw5H8wS35hONY37Ig80w/eR9Xj77qqcIfOumicdVvrEEVY1QkHZ8ygXaft3QyY3Ub9obd1Rex8MQj428dTogu0j1egsGRDsQR6bO4x+OtogiJe1yVNWboe1qCgtT1wJtz8eZ92bXCrs27OWW1gBd16u+fssyhjwpD8E1DnU2tWarOviJS/H+n4K3WapG2fN64tMvj6kp2TghjPG4kfz82J2bI02RIocEEkLBiigTQyOjRZt8B046KLvW7Q9/YMmOo0cUgdcaXlDFtuatMdNzU5qlzxJNPYCNBSykEs1Ow1pKdnUudYj/FhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOaZ/qF7VgIbia5CytqHeDMo0H9GDDCTtshM44ebBS0=;
 b=rH+QhiAZSUPVzlnUqQMLPIuYB8DHK8eUGr+KNpzu/MFCnIdCxRpDmKA6EEfpduQlw3kB/OQyddo7kmJQxBvMwJjKv4sSfXlnzvodvTKOr/L6PhclfUt7SxM/YXtGCcAMqU2vKXnPM/lizMdikn3S1+ae0lqvdSWk/Z1kKQZXLwRZRHoHZw1dTDYD6v5DsE2K0q9Or7uudrBuohLK5bIeNxRoaKV6C07qAvXNeGlSp4SlkvX6/DBC8nPZOGHKMWi3bzWIarCWKbGvvAXO6eiClGxRDduGOJLRCrfIznJcxE3ts8P0aMvbXKAKqXxu1tbxO5g3jAfLoJ60KJzTh4xAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOaZ/qF7VgIbia5CytqHeDMo0H9GDDCTtshM44ebBS0=;
 b=TvK5ybDjxNrp0YLCAQg1cQIDTmY52XbMjacidWtZVxLJRWS+GHywNOd/tRtCsMPBE7DhVjp/ZHoKcDCOsLtDlc5/eCZ8pnyB+MwPZMyM38hjHG1/GVlSIagzR3ze8u1Gx6QZtJrs2UWumVNE9bNbNewN7L+6gWTYlw2ULT2QB2Fy/gHdY7DlnuaNS/AhcrXJ0ER/CRzmnxhueiZfRG22/QyrRZmEHYfPbY3TfcIkKcAo6fhDWcdtZCcqnPwAj3wiYGqiz2Qk8bafV4KEQvvvn+5/M+9lvkk+zcwMBh56KI4fH1SpvmB0ONkDhiCwgEOl2xmI++H3pQxylggna7bkWw==
Received: from CY5PR17CA0025.namprd17.prod.outlook.com (2603:10b6:930:17::16)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:06:07 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::b8) by CY5PR17CA0025.outlook.office365.com
 (2603:10b6:930:17::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:07 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:05:47 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:44 -0700
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
Subject: [PATCH v1 07/20] iommu/qcom_iommu: Implement test_dev callbacks to domain ops
Date: Sun, 12 Oct 2025 17:05:04 -0700
Message-ID: <b95568cf00fd278542b95ffb8687de2a94bfb11b.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 00dd7a17-2c7f-414b-b769-08de09ec4f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GsfHxoZMhQ99zP74mCx3qItBlYpNkXykhvyv6ubSLxzcj2pcHj5GzmomUVhc?=
 =?us-ascii?Q?PUyrvHqtfnLHfWCS1jDrXA39wz7UQ/eb+IKCMQ52MOlu0E50LbxGnQNOjbbW?=
 =?us-ascii?Q?GefRMslnvyXpaPdsBdRlhwsKVrwJEI4+ILKK8VB7TMv9RL8fw5vuZFvKIIqM?=
 =?us-ascii?Q?DqP5Jj6+60znUaLE/XSHlD+1L7Md/Cyme4WgzOh1LCfigAkqWzn/ksFPyDwk?=
 =?us-ascii?Q?S/hH15QjA+i6EZvToxo0CYtsBfQxckMg0D6n81FZ9T+VUYSJl015f9MRA+BF?=
 =?us-ascii?Q?E9tMBJn423xNegT4E9Vod1U6ZawjoCfxeFRxgNa8K81LqHAE5H02OBwEr5nP?=
 =?us-ascii?Q?CcDNxkM1YaK2+OFN9Pxx+e6arcEKsDZZNOdqn9QhcKvu5EHBDMHQKQdQefUb?=
 =?us-ascii?Q?xxJlk/yxoRcGc4MPfODzn/C7dUNriAsWJfdr/ZUQvFfcDvNJSyvFVlOjK+9f?=
 =?us-ascii?Q?p7knsrR8nIztX7BRYgQB0EXFG/Jv0PMwwb/yb81/wQCdOxcjMUM21Das0qXU?=
 =?us-ascii?Q?DtnUpHcixtQ9umSj+fYR8hp7LJlCaFut0Gvz6kzhhbl1g0HNTrtG6NM6DKfc?=
 =?us-ascii?Q?3Iv7fWW+IRAJbPnMWjH4rh2SUejAxJv78T2quWMAfRtkscYM/VYPGYWpt3t/?=
 =?us-ascii?Q?L8XCXa/aQE7a83qFMaYaZv0QBpN3ovPXG4RlDA/j/m4LcTUtfLi0XuO5cdav?=
 =?us-ascii?Q?I8tZYqeDa8do8kZTObGSyozZZS0GJQkK0Sh+DfO8sEiLAGu3kPq1KmiO3F3F?=
 =?us-ascii?Q?sVgccMFb/wZlakoEFQef94NjPKITSbo0yS7IpHJIcJs7tnUbHylpE9ZVcdYA?=
 =?us-ascii?Q?bFmMtZM50usB8oUtkTyLwRre39GTqWbGgfw7qg7usPNQr4oya4k/2Tskva+6?=
 =?us-ascii?Q?gxAGvXbsnbMB97U+iqXtQYtxPW8HXvVVlI0VpPP2oBrcvgMx6tXwMqV+0XZb?=
 =?us-ascii?Q?VBZxOSZQF/nMBUzKRzNrtPb9TZPs9D/cgWopxC9GTLicQWNvPgV4P0itr/E3?=
 =?us-ascii?Q?sROWB3oy47Y+HkH6ZmSdr3m0vMz5rC1hxabHyQdexP3tcDRs23Vrrwxndooz?=
 =?us-ascii?Q?bm5506CUHXv8rZruqEoToQ9UPVMIZrurWn8YY5vTcr0sMa1XtDsAXNyE/GnA?=
 =?us-ascii?Q?PjejC91kCIH3Av9M0gLimptndeFENVFmVm1HLteAl4U9LQ9HQQ4viSZesVYd?=
 =?us-ascii?Q?5YbGoByWNQ1D1DcXA95bUzW19o5WHwefbWNQhIgKFCw4noGE7P6518NJBzF6?=
 =?us-ascii?Q?CzVjXM3MMDkywpR5sZ+fBEsk5Mrnn3L47aFPuuF7wWkd5sy7E6FlEVZkL1py?=
 =?us-ascii?Q?dXRyfg062RwlWyxrmqNArGePs+0KQFLLF9oXBP5rt0+lfcFFCsq4zRx0sVIx?=
 =?us-ascii?Q?O3S+jx9F6IjMc8AuRCrgoNHDvgEm5Ff17dZedYdY36xt9MK7HoEJIJ0X7DNb?=
 =?us-ascii?Q?qpYdbrwS+PDZecRYR2rg7Spaz0GS6sEkmxq5CP5kKcgiYaRDK0NcMT2WJE6D?=
 =?us-ascii?Q?U8Zg8u1oTXn9/PazGoygdtETVZ9YjTnCooWmiT1F9f8RGC5vCEZRqkb1KBwB?=
 =?us-ascii?Q?NIQWvWMn6e/GMbNWj14=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:07.4880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dd7a17-2c7f-414b-b769-08de09ec4f01
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072

Move sanity and compatibility tests from the attach_dev callbacks to the
new test_dev callback functions. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Following the test_dev guideline, replace dev_err with dev_dbg.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 46 ++++++++++++++++++-------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 9222a4a48bb33..53b1c279563ba 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -359,18 +359,36 @@ static void qcom_iommu_domain_free(struct iommu_domain *domain)
 	kfree(qcom_domain);
 }
 
-static int qcom_iommu_attach_dev(struct iommu_domain *domain,
-				 struct device *dev, struct iommu_domain *old)
+static int qcom_iommu_domain_test_dev(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid,
+				      struct iommu_domain *old)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_iommu_priv_get(dev);
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
-	int ret;
 
 	if (!qcom_iommu) {
-		dev_err(dev, "cannot attach to IOMMU, is it on the same bus?\n");
+		dev_dbg(dev, "cannot attach to IOMMU, is it on the same bus?\n");
 		return -ENXIO;
 	}
 
+	scoped_guard(mutex, &qcom_domain->init_mutex) {
+		/*
+		 * Sanity check the domain. We don't support domains across
+		 * different IOMMUs.
+		 */
+		if (qcom_domain->iommu && qcom_domain->iommu != qcom_iommu)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qcom_iommu_attach_dev(struct iommu_domain *domain,
+				 struct device *dev, struct iommu_domain *old)
+{
+	struct qcom_iommu_dev *qcom_iommu = dev_iommu_priv_get(dev);
+	int ret;
+
 	/* Ensure that the domain is finalized */
 	pm_runtime_get_sync(qcom_iommu->dev);
 	ret = qcom_iommu_init_domain(domain, qcom_iommu, dev);
@@ -378,13 +396,17 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain,
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Sanity check the domain. We don't support domains across
-	 * different IOMMUs.
-	 */
-	if (qcom_domain->iommu != qcom_iommu)
-		return -EINVAL;
+	return 0;
+}
 
+static int qcom_iommu_identity_test(struct iommu_domain *identity_domain,
+				    struct device *dev, ioasid_t pasid,
+				    struct iommu_domain *old)
+{
+	if (old == identity_domain || !old)
+		return 0;
+	if (WARN_ON(!to_qcom_iommu_domain(old)->iommu))
+		return -EINVAL;
 	return 0;
 }
 
@@ -401,8 +423,6 @@ static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
 		return 0;
 
 	qcom_domain = to_qcom_iommu_domain(old);
-	if (WARN_ON(!qcom_domain->iommu))
-		return -EINVAL;
 
 	pm_runtime_get_sync(qcom_iommu->dev);
 	for (i = 0; i < fwspec->num_ids; i++) {
@@ -418,6 +438,7 @@ static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
 }
 
 static struct iommu_domain_ops qcom_iommu_identity_ops = {
+	.test_dev = qcom_iommu_identity_test,
 	.attach_dev = qcom_iommu_identity_attach,
 };
 
@@ -599,6 +620,7 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= qcom_iommu_domain_test_dev,
 		.attach_dev	= qcom_iommu_attach_dev,
 		.map_pages	= qcom_iommu_map,
 		.unmap_pages	= qcom_iommu_unmap,
-- 
2.43.0


