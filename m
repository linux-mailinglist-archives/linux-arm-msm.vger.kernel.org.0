Return-Path: <linux-arm-msm+bounces-76890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18EBD0EAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE4A3BB891
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3234621A459;
	Mon, 13 Oct 2025 00:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FlWiKN1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20831EA7FF;
	Mon, 13 Oct 2025 00:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313972; cv=fail; b=YsYfoSRsJwNhOJA+eDWKZ3zWYIBOxkqHjIhEVhqebNtddek/Ku3upbMy8L9P2bClVtO0JXEmexjyCM/HBcVxI0UhBcMRWL8wYQL0r1/LG8zwTElUpvdndIdfiXQ+EGDgMKu7ITASggsgz2g3/mAhGXsboXbMGMGta8REDiTQAXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313972; c=relaxed/simple;
	bh=1Zh0884xoLP579SPwWOHDUMF3IJSycTL3LCBKeeSDQQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBp3VcbUrHC29rg6A4fUgAac19BUBUwOyk4xbZAVJjI7vWiY+WcuC1WMcrQRGedzzFl4tBh3pm+bfP0HKytr3oVAAYmmnsS79Ixc9W7aJPnRKTzK1fJoeBTW9vkC6L1LSB5/3MHmSZAQRIuhcdZxT906pnPqWgOOgsaqUwTGuQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FlWiKN1X; arc=fail smtp.client-ip=40.93.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWT8NxEzAO0p3WolWsHnX+54S+48WabxVmkW+qS/NN9iETy5alGodAXicADRUogcUH4zddvwoM4Br4031vUToxcK9XmvrXAHinqg5M9BdeIHuHH4SRXqOBABFjLsSeBBO8J5gue9nI3A5wEfuNhM3ClSdzk10V7De65T3zt/gds1jUmaoPytsDsDI+IIBRpkpuvFXH+wqmkmYPTq6meKnow53bfJJvifoWYssmRp1RgaD1TjItYH/sDGYtL5Kq5fkPX8Pj3POra7yMKQso/AA3txE+1Mx3KbWy4yUMX9jYTIB1evwMOiy6iMosFu/3d47RwBjxVz9X+6IL3LVJOpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7anG3zhfXWXNE+6UXk/3bgGhLO5hiGLdukzVRHIlxQI=;
 b=bJ0j4B5FZdFRfbPYEeDGMIE2g/fTTkLBj8J45H+mFro883JsJGp+oRXytAAW1qXEyCH531rvpsUgCRWGUnnVunhwSP2UtnhARANVsovAIid3h7piRSa1eMBn/U2pveCGHYR5MoWmK3nCr/w4+Ulv17ZjUYLGCrFI4DRbbgqwr8Bpl3HVQ4PZAmVS95hEGmBZFPR4muV28RklRyb+puhTqQPX5mLuldCzUYThaDDOVmLR6Sjcmfu7yA/mX1IO+PaJ6cBZi/GGMb44M+6yboT1aaTHZbe05Pzw6KkGYHt2ayba8yPXMeYzLXFuseoNJD9tol3alDJ2cvElxG+lD6iHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7anG3zhfXWXNE+6UXk/3bgGhLO5hiGLdukzVRHIlxQI=;
 b=FlWiKN1XMwAz99MKUO4rx8Z+5h5yKGlCk8YHqfSARTcr9vmscNePeSf4jOgQDVMIwYcwvXe8hvX7RctSpK2aroypUxPktNRB9Y3QbXEyJ9m8QRlncs85lBYwPxiHGH3Oq228Q594hCu+fsGSInubIjHK9eNx0mVdLkJsOXqKx+xlyS0eyuLJnJJM6bdJM47RgTlFkFeNlxUi0r+XbxIGlCDC1xFkp6yFxdhu8A+77+7eCNHToHuQ/5TG0CKs5kyhwfaX4ZWnmnxBseOKnMbRYgP/dNZnLOM6tmjs2FdTdXfL3EydP9T/4O7nbaErwJ7M5YsKQxbWDy+mRNZnawzNAA==
Received: from BL1PR13CA0078.namprd13.prod.outlook.com (2603:10b6:208:2b8::23)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:06:06 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::a2) by BL1PR13CA0078.outlook.office365.com
 (2603:10b6:208:2b8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 00:06:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:05 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:05:53 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:52 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:50 -0700
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
Subject: [PATCH v1 09/20] iommu/mkt_iommu: Implement mtk_iommu_test_device
Date: Sun, 12 Oct 2025 17:05:06 -0700
Message-ID: <42368f4fb509f19681681cbc41e5ef1d2b320437.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed24eb3-349b-47dd-6a46-08de09ec4df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q9zldhU6rWmBVtb01h7e6yKmmFmVYjUMMcKQ6m5sYMgLVDz2jaoMWBYPQz0d?=
 =?us-ascii?Q?DWHWWz8xXaCBgFYws/butmCEbDhEa7J5QFYLqQymeo+KMMxNVU9xvRNNTbya?=
 =?us-ascii?Q?T8aq724TVZzJ+vZk+apWwKN7XA/RGU7twx3UYlDkH1fv1goc16QCgfCCeKEL?=
 =?us-ascii?Q?O4nqd97VxXLaP7aaMYi1Hr0pcj8DVSB42qbw+beJV4Y+XGMhkHEQTLkKR1GV?=
 =?us-ascii?Q?IqPwJxeBUceedn1RnWkwrz8htl4LMveD74ZSy9viun5PXCIjQpf25WDOITre?=
 =?us-ascii?Q?/EEJ9mSfypFe/AILEWaA7/OS02oCgJjoWQD4NQT2SEIdJ9qxjRsNGsWW1pzq?=
 =?us-ascii?Q?8xqmsYyzI3oo1MQyhkeU3o2f/ICZv2j21xrLEKCWZcfGLYx+glpeZnFYLXtb?=
 =?us-ascii?Q?15TNSxAZFLSE0z1X+I9Jn0Kkp1qJetv9DLR6AI7ket2hD1iAqDMA+5RAAuE3?=
 =?us-ascii?Q?jZD45l5Xz+Vc/KUQmrodem6YyJnOeAOm8WlbqpzJYJ249STVBjib/4S8pAJY?=
 =?us-ascii?Q?mtaYkNFRPugfAkowSUOy7jU4JFHuJz4eF1MJrlexNYIFwqmvVwj/RMLOT/Bt?=
 =?us-ascii?Q?yEH0UdgvVwgT1qJp+p2o5x/ArmhpWIVBQxUBRxu5qnIX/PzV/0o3lyG0n/o0?=
 =?us-ascii?Q?tHaiyFlxSSW5EED9PWXNcNwfo0NqfY5L7/hrvfF6XFXyeUMqb3/6FplicaMY?=
 =?us-ascii?Q?6nG43AO2FtBGkAuuDBDIyUZUItn3U++ho4E5Y/k5iJCr5XhlrpRZaG8Xe4AH?=
 =?us-ascii?Q?DjRwL+00qntxZpvbyO+5Kf0pyD4FI4XfnSl/f8Wx54MvDZCVgZhDu6iuhRr1?=
 =?us-ascii?Q?DDIczvDaYhrw1EWQNScAtL98UTsqp2QRCYGtgGKwbt7umLJoGTU0f4CWlp44?=
 =?us-ascii?Q?o3uqKfOn/cfBZH6pWRlQ+eG214Kn6W+zVLnFiajAF8dOl7zvkXho4E0yYchU?=
 =?us-ascii?Q?Ia3dGrUt5e426UMQSzWe1LU6VjxNuUQTbuY4FKRIhTxNfKj0LYMSoOX8Y3cN?=
 =?us-ascii?Q?8eiHElvAtNDtqyq1wJ9oWt3+4pbC3QCd9sPxABVuzGh1AG2FoSAhl9fHsDxm?=
 =?us-ascii?Q?xtNb+6VqsRurboMLskrkhQTNPK+LPahg5ECzHuh0x3KVQjGTNsdXpb4swWaX?=
 =?us-ascii?Q?N6JyEuwAeopllaZm9jGir/8/4QtNFXGT0JW7V4u48pM8VSWYtiLzDtB5wJs8?=
 =?us-ascii?Q?oTA6SKCtEuWgduMTu23z4R0TS4yjPQ70ysC4CyfzZxscDRFS3P8zvFa4/9Jz?=
 =?us-ascii?Q?jit2k/g6U45cLKCZqT95zIEykq7Bs15x2IjfjJN5MF8xdUUJeK4fYMkJQlt8?=
 =?us-ascii?Q?tAtd/tWOtGGZb3HloOodlEa/Hl1TyKoNlqI0vSyBa/RLwZAk53SzQ0b6GeO/?=
 =?us-ascii?Q?y8Ypq5ZEX9U35pS54y4i6OzDXWji37yH2X55/vMcnIiPWaX/j7rM7ZjNlBl1?=
 =?us-ascii?Q?RkURI6KG16om1KtUYzdyCFIbseZF6WUHJVOUTRssbKVz5xEDYOVSBCxi2T+2?=
 =?us-ascii?Q?rU7UD+Csjk1beBv73ZrLJDXg/s79yoVZ0cIP61nEkL7ZESvPpvbBmXeUTSCm?=
 =?us-ascii?Q?8FS1FYnft4S/PRM0dRk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:05.6446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed24eb3-349b-47dd-6a46-08de09ec4df3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 9747ef1644138..0cfcd0d08ae64 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -704,6 +704,20 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
 	kfree(to_mtk_domain(domain));
 }
 
+static int mtk_iommu_test_device(struct iommu_domain *domain,
+				 struct device *dev, ioasid_t pasid,
+				 struct iommu_domain *old)
+{
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+	int region_id;
+
+	region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
+	if (region_id < 0)
+		return region_id;
+
+	return 0;
+}
+
 static int mtk_iommu_attach_device(struct iommu_domain *domain,
 				   struct device *dev, struct iommu_domain *old)
 {
@@ -716,8 +730,6 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	int ret, region_id;
 
 	region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
-	if (region_id < 0)
-		return region_id;
 
 	bankid = mtk_iommu_get_bank_id(dev, data->plat_data);
 	mutex_lock(&dom->mutex);
@@ -1019,6 +1031,7 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.get_resv_regions = mtk_iommu_get_resv_regions,
 	.owner		= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= mtk_iommu_test_device,
 		.attach_dev	= mtk_iommu_attach_device,
 		.map_pages	= mtk_iommu_map,
 		.unmap_pages	= mtk_iommu_unmap,
-- 
2.43.0


