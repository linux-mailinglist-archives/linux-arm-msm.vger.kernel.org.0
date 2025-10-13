Return-Path: <linux-arm-msm+bounces-76900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394CABD0F3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1A5E3BCAC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB94426FDA5;
	Mon, 13 Oct 2025 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ig/wuYHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE770274669;
	Mon, 13 Oct 2025 00:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313988; cv=fail; b=lpp0zJhGmkmV5d2rNb9NFpCxp86CCO+PPD6FbvaPFMLk37SQG70cZqDtXkqlpHkcWGOTvRo9ddk8lBJrIWhks5xISCgo3MUWYBlJF/oib21qLA8v3HUwWSe7wrJw6zEkqxEoxw/Ncv8MoHIiI1l0VA6VynGgRVTDUjzERQFKdvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313988; c=relaxed/simple;
	bh=I1tmCRvXCmYYFT6o1mEIoZUxHqaEXpJWsc+HrOG8ZRU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TcQ/8vKtfev5ziUiVcAf+jxEN2oc+NR2ijD+MVheIx7vnoPPTkxby2vPWPX6gcKal6iTngcvUYDQ30Rk+MHKoDANUgoYFmHTsddBb7EPFVH9KEJh/Rqloh1DRAaphG6eaIix2SXtY8moL6iZ+VMjJwyXJ8I0BNNhWv32zeSdbxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ig/wuYHX; arc=fail smtp.client-ip=52.101.46.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnhiVv8/gC9VJ4+8qTdkcOVGYsa50PTuRVa5Fysla1eB0Ham64tGzI7Y9e5jhuCiAUjVRo5HnZ4T+O+2+bX0e6MYEhEG7faKcjfjjjyAb2jayVwU6TvFt1pWuPsqyUVZWH3NFMWFXPhTXGNxqSRN673y3iV2Tpbs5TyGCH1vh/N2U8x45jM5LijlPd23hCdg4mE1DGYT3KDUWi4ewXIZaL097uGNqB1aKiHyXCjcucpLtf5luTNwoRcW4AbjgYNeF1muJDgnSqpy1fh42AkH5m9Q1hILSXOFs726mJ41uEa6d2VwRxkPrKN2UgkWaDXhV0Un4QgcKA29SKClOgkreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DujszfjhuPWHDUkFMjPaXs0SzmdJNL6mZ7YOxV4Tnr4=;
 b=nrA2nODpandVh4jim+Z+QGYgEep1eni9M7qkdlAXlQBceT7yvwuyYTo21Crg2QpR+o32PyRbWL8ICM4FMSzz3Ghvio7V0ukIMWMbGoTX8w6ux7vW/bu074ZF/lTvyokDx3v7/pRs/iWplSBfPt0+cWK7F/eqz+mnRSijqi8yGu/eu1enb6Un88Djur67CjPfddqZQ2cp4pTJvxg4oiFENrQawSekA6VJN1Xk8Jtp68WRya9KUhQPGgbxud+qeHH3zN2OB3UEMMGllu6PwK7M3CinsxNboXEYt3ZRN0+5pUmWPwFYngo0uYTmxZa/3rd7NYmHcWuiDw36DLfE023Jlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DujszfjhuPWHDUkFMjPaXs0SzmdJNL6mZ7YOxV4Tnr4=;
 b=ig/wuYHXfxtsn9aKZNW+1CEpNj848gZXvejjXro28t0xbMYnZjBsKIbThFOEXfytwlzLb9GXiOcJtFIb/4FcB4gevoMl4lZZ66y0jK3JmhmufEnyoChzzrFBFVp4bFe7RA5OfMOTP0zh6FypDYlcHkwukNwO+SJ8Vy0M4F3YzhCnhneQGg/91rBN4cqwg1K/qyhVqZOfl/n3V6fk6zOxw/4mbfbeKbibe/Jy++lK6oiKOc8U8AqFncYKr4RHtM0E5Qczl7OUCXGSh6FOZn3fRx3jLKRF82rO/IuCagXaTPQ+JLViWOx2ZzHmtc394OKVnh2bY7v0RpawJL3dqvIGnA==
Received: from PH7P220CA0126.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::11)
 by PH7PR12MB9176.namprd12.prod.outlook.com (2603:10b6:510:2e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:06:23 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::89) by PH7P220CA0126.outlook.office365.com
 (2603:10b6:510:327::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:06:12 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:10 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:08 -0700
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
Subject: [PATCH v1 16/20] iommu/omap-iommu: Implement omap_iommu_domain_test_dev
Date: Sun, 12 Oct 2025 17:05:13 -0700
Message-ID: <dbd15c7ba6c601289e3d1102653e827beecd1d34.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH7PR12MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: bbac575b-5806-481b-3825-08de09ec5846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zbeZn6ZLc4VzEl3wNlk67oGQL0JRZ0MFGTker9QsujdLiLjNlCoiaf6bdWhv?=
 =?us-ascii?Q?MMDDZ0rRDRw5INoLYY6M9TCK8cHnL8kwH5wG3rQnxB6Gc7BUbMiU7UJpAagH?=
 =?us-ascii?Q?jjpOmdsZFkcx9rzAAGuSR17jVth6madiC1q58fYQTwdyfGq4FKGe7V3LcXxZ?=
 =?us-ascii?Q?YlWD3KpkOim8qROXzr1EDzXaMDYFOPwF7E//hscpZHwYt7R0UoehDiCuWTGb?=
 =?us-ascii?Q?sy8n+oI1Jk9WJdbYd7tRN2JH/dyKRs+Vx/FeW9H8LQjbqNh9ycZ1LATHGPQW?=
 =?us-ascii?Q?RWl2w6Kta0YUtWsbE6pKYkGKnR88hEl4z2+m2OwwV/Y77v8Ee54z32Khg6W0?=
 =?us-ascii?Q?LP6r0eNA6f5u+vy5R2BZt0GgLWUEpMXlbztxQ9ZTaPPkJmWrIx7LXvYrO+ri?=
 =?us-ascii?Q?psoOK7PanwnaRmN4JoUDcqhX6GG0t48gzkvURcGPhy9mOg7y+Q09GYl1nqP1?=
 =?us-ascii?Q?MQ9H8EseSck12ZCkhqEFhg5tl2w3dbhOyCu4iKZMvuFBS+gHnlxRQXox+/ys?=
 =?us-ascii?Q?VHecgNZsbKTc892Pe6Iz33jGM3mB/TNvYdHD5XtEu8WH8rEeVmj9LqU/2ayG?=
 =?us-ascii?Q?KLhxin7hf4zDKA1JNaMM1BE2H1DU9DG6oLJWqPmY9bPDrHNFh5VMYl8r0MdM?=
 =?us-ascii?Q?/icN4qrfvcPHz6wlkxtAHpqlhkKqVw696PmTiygUYlu9eCVktZU21e7Zcmh6?=
 =?us-ascii?Q?5hfQjmJbNGdGgxV8YMvpqmojLsAf5D2n7dRhKUGtLtghIriTy8AwLHVWa8Xx?=
 =?us-ascii?Q?crv7feeNS30wCaPdTPaNQpcWK7vYybAQUtghN7bsvewz5jYPNmD/iWIxeKP0?=
 =?us-ascii?Q?VgRqgVULTqUtN0eh6Jl9yhmSetuX+N/7hNvejssi/+LDOlf+WmRl5a7dzmp3?=
 =?us-ascii?Q?VBNsBnzpBnOUzsjIxvnrCsEHBC10Zgieq+X9qcBVfF5STuFlBzKMpCQ0vcss?=
 =?us-ascii?Q?A9gE05RLGTeRDGEcPU1XkByvM5uldZ5teUwAZUF311vAc+60tD/3E/5JpcID?=
 =?us-ascii?Q?Ni4X5jBsntfF7PxRF+D4+BC7vtRKW033mOt/dd4CVZiHdEP/xLZSY9niB2t+?=
 =?us-ascii?Q?zab+mzC30mAArfOrSIyADQUTrJvWeU54b85sughdt5obU19j2Y1AoGryLV2c?=
 =?us-ascii?Q?VBH73SUzaiBhYcQfW+Cphd+JO9o+T8gr3XSPnlA/eFmW7jA9BDbOIU+Xa2WY?=
 =?us-ascii?Q?AtuYgWw5w+koqbY6/W8OOLCfq1HUVp4NuhX3Zw0Ajb2jbA3O6GXcLyN9Zv4c?=
 =?us-ascii?Q?tNhGv2O71Hh3+c/xFX4lOTSch+BoMfDgPaFYZTK/vXsgjr9N8MoWOkjA6tOP?=
 =?us-ascii?Q?z8fNURd7f8xwKR9kScRa5zXnpevbkFz49vvxcRpf2BFYqkV7OdxlaEKUE59/?=
 =?us-ascii?Q?KY9j6aIwbsdpxOezPcG0tzUwDhE4y0WF/ICIV3Hcm1XGoMEddIQPpqYm0y4R?=
 =?us-ascii?Q?miKiPDL2/rupbr6tg7+ZcFcFZYF+s4lTf5vvDfi8sWlB869Lb1vlc/xecSU2?=
 =?us-ascii?Q?R5boFznJdCLUInMBhm01epMKcbt6s4sCXiJ+Pvxr27hg7JjQ1utPnHIWC6EP?=
 =?us-ascii?Q?OPlIaXLcZEVSnHdZxu8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:23.0369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbac575b-5806-481b-3825-08de09ec5846
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9176

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Following the test_dev guideline, replace dev_err with dev_dbg.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/omap-iommu.c | 41 ++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 9f0057ccea573..26a7803e4144f 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1392,9 +1392,6 @@ static int omap_iommu_attach_init(struct device *dev,
 	int i;
 
 	odomain->num_iommus = omap_iommu_count(dev);
-	if (!odomain->num_iommus)
-		return -ENODEV;
-
 	odomain->iommus = kcalloc(odomain->num_iommus, sizeof(*iommu),
 				  GFP_ATOMIC);
 	if (!odomain->iommus)
@@ -1431,6 +1428,31 @@ static void omap_iommu_detach_fini(struct omap_iommu_domain *odomain)
 	odomain->iommus = NULL;
 }
 
+static int omap_iommu_domain_test_dev(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid,
+				      struct iommu_domain *old)
+{
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
+	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
+
+	if (!arch_data || !arch_data->iommu_dev) {
+		dev_dbg(dev, "device doesn't have an associated iommu\n");
+		return -ENODEV;
+	}
+
+	scoped_guard(spinlock, &omap_domain->lock) {
+		/* only a single client device can be attached to a domain */
+		if (omap_domain->dev) {
+			dev_dbg(dev, "iommu domain is already attached\n");
+			return -EINVAL;
+		}
+		if (!omap_iommu_count(dev))
+			return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int omap_iommu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev, struct iommu_domain *old)
 {
@@ -1441,20 +1463,8 @@ static int omap_iommu_attach_dev(struct iommu_domain *domain,
 	int ret = 0;
 	int i;
 
-	if (!arch_data || !arch_data->iommu_dev) {
-		dev_err(dev, "device doesn't have an associated iommu\n");
-		return -ENODEV;
-	}
-
 	spin_lock(&omap_domain->lock);
 
-	/* only a single client device can be attached to a domain */
-	if (omap_domain->dev) {
-		dev_err(dev, "iommu domain is already attached\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
 	ret = omap_iommu_attach_init(dev, omap_domain);
 	if (ret) {
 		dev_err(dev, "failed to allocate required iommu data %d\n",
@@ -1724,6 +1734,7 @@ static const struct iommu_ops omap_iommu_ops = {
 	.device_group	= generic_single_device_group,
 	.of_xlate	= omap_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= omap_iommu_domain_test_dev,
 		.attach_dev	= omap_iommu_attach_dev,
 		.map_pages	= omap_iommu_map,
 		.unmap_pages	= omap_iommu_unmap,
-- 
2.43.0


