Return-Path: <linux-arm-msm+bounces-76903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B73CABD0F7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B12994E8B9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7637A2F28F0;
	Mon, 13 Oct 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IqVF5KlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012071.outbound.protection.outlook.com [40.93.195.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638D02F1FC9;
	Mon, 13 Oct 2025 00:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313996; cv=fail; b=aAEXVznzb0IByud/0VF7urUxiCM6lFl7Ek9X0+2ORbjXUZZG20APCyNA1n2DpDaRue8T2GR0uyMqhxajiPp6UAho+lzWM1n+mdObEpk5va5G9ikfY8gArNHPMl9BfYz5e2KNl7crIva/lCCiXMV0178Djd52m/kpon/do8+AF+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313996; c=relaxed/simple;
	bh=OUabHLRZSXT0Lm8thsOUMEOGaXZNiLFTNmmt61b6fJk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNwNDMlXW7GugnwK3q3XRN4n3w5oqOu2j0RAL5ErnyUdgg/pkGv0r9YTQQSJ67pR4hov1x24EEXDGCec7sGxvfw2avcPF4vrxKCmKFph/2X956szAOA9GhAuO+g+TwS2ar/8OBsN+PSHRj4XMXUr4E12jlTF1OaV8VtX1jIifao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IqVF5KlT; arc=fail smtp.client-ip=40.93.195.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmJpZ+pdGV8/djbNOLfd9UFQbP/9F8ZBMRXsYbKgAUrOpRY9uqPVDcyE8vdDWjRRpi2ysBNc2DC7AZ5gPxrC4Agji6pkZOxHB7HnQ3J/5qWV2c90JjcTDep4MCaztxp8vhjw24rBcHCSOrPjgx/kSc7d9+RC8vdui2CSWsrWHl+c4NgsEc9R/vXX2se9So8c76mVFTALwqYXqw2xtWC91pUy2JNKjtSt9TICiLurylh6sdNb9l2yZtpaqQ6Woa6mRlvD1irpqXxJzJYH8BTf3ighRjluhAdFkvfGUGWXFEjQ8K4NEKFQamKqLMZY4SlmYbGTBGnKPrMOtRqZoPgAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=somBreEhVUn4sAV7/mZH07SvT1J2wmy49TlDh/N3xME=;
 b=XtwvNpXimTWxr/Qayaw29eZwxk5fqfH18gTS91XzE9vDkYFKXcU6gI+tQXu+j2xLCHySNysh7TxGoP05ttzJZXLbIoSCqazpmJMIAtTmbcPioJkpbLjylmzVWmEEeIh+kjD36Jc4R+ejAWztcyYHxd5v4O/QSllCItaotWxUJN4Fe6V306bbUdxd8a/pknpXfPDQAswDIrHINGo1ea4+ImFg92yBXqzz5DUHwks0LvFVihRgGpDJq+fo+LBcMwSw5ISt7E893JDfaTBkLwzY4ns4GhU3lTU0HF2rnRrfcaHvtvZbI6/9aFqk5iDKdkQmJnYAw/wdszVDRPdypsHDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=somBreEhVUn4sAV7/mZH07SvT1J2wmy49TlDh/N3xME=;
 b=IqVF5KlTnAxHs5AaTUzhKEr+UloOou4FaU5OR+Z8HbFIeHLUJ9obyKTGiJauSI1zjpt8rcRu4KdimauK6vaWf0esbGv7ZZ4lfbWJVqZI+u9U3cs/MVJ0nJT3aVySiQO8YOqZWFtouKN3E5An/qQ+JX8PlKzqRnY4EpY9VauCD4+8wFMEfOcU7Nkh0HGS7oMIotd8uxWD8hgZuwVRF3w9U/99TLrCcRIHK8Jof7G0C2YApC4ytaghtf5+IdmiPvjqxmN3AYQ3oBYnoNkRLVZiJKGQ43+mxEYAzP+7DjJfuQBmfZPPj6DxOqQ631F7gr5aZKnSlYFMD6GqKIfF8R3zhw==
Received: from BN0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:408:ee::21)
 by CY3PR12MB9703.namprd12.prod.outlook.com (2603:10b6:930:102::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:06:28 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::9e) by BN0PR04CA0016.outlook.office365.com
 (2603:10b6:408:ee::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:28 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:06:19 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:19 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:16 -0700
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
Subject: [PATCH v1 19/20] iommu/virtio-iommu: Implement viommu_domain_test_dev
Date: Sun, 12 Oct 2025 17:05:16 -0700
Message-ID: <562f5a6c9f55066dd50f95210e5669e256852d36.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|CY3PR12MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ff0e49-a48a-4535-974a-08de09ec5b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tIsNpha0J/T8syGzcUg54ECBkPWdm8IaqKY6Av+DtEGBJIQWPXP0+PSlnv2p?=
 =?us-ascii?Q?2t+UN+dtXd0e+dxefSepkTA4r2/goYJrNOBeMldldk4rgmeOWW25CCTNeODM?=
 =?us-ascii?Q?5i6iiM/Qi2tOkqV3iZQbAWMucaOG8pxJg+5S4CgsRksEfi7syUfY1mwcVJbX?=
 =?us-ascii?Q?vEESY/dK0SAW0mtsVwNkrXr0S0Zp6tMF3uOCzTGuQZgMKq1ws9pTuxQDzGuL?=
 =?us-ascii?Q?+WL1hqkNyRvf2gG7hWAte8zTow4lUkK8Vlh4qp7GWtlp0X8P8uElr25dSeZE?=
 =?us-ascii?Q?FUMGMkll4rHR8dSGRYGcSXPijwLR1RIx/SX2hLXOr//ze+aiSRN7jhFhQ/Cl?=
 =?us-ascii?Q?S6yc8Lac+VDkseExJWW0eWpuKBPsPj0u836HXoBjGFmjTpZAgV6ylqGfxNWA?=
 =?us-ascii?Q?sC4WlKahPvvTFbb+xw3y4Nj34d9GcQX0MJUIQtswiYpshP+LxnrkMWmKEInP?=
 =?us-ascii?Q?J9lat7h54KKPxS0PQ4YX5TMe9N7QMMDEdngZFvPZPyuSr6H2MbTqQcdTupS7?=
 =?us-ascii?Q?CS1jPD7q5EJrrjMeBiMkVOXH7Cv+5dI+GhXsclGdVS9eZn7yEZxqHlyVr7qo?=
 =?us-ascii?Q?xvHjr6/Vts3CeaghlPneput/w0y2bED0Cj/XoSd6wsVt90Kfk1OuS/1djnoT?=
 =?us-ascii?Q?fdxykVcSh0ILWyPbBTuQO3JcrOj5TntZ5mkASTTqsikfK7IBE/JPVuOC00EV?=
 =?us-ascii?Q?jLWKTpRd2TyZuCQlyklVTj6MwlS8MwBDHGDz8VJtgM5ujZXyQUBn4EvYBneb?=
 =?us-ascii?Q?w8o7jm4pCvmYP7fCN4W/9Kox9Fr267MXf54tr/3i2KozLZb+iCoNccMdyrjh?=
 =?us-ascii?Q?GM3UMW6N9p6w7mqpD8kcq2SoJF2xZqZAmTtUuX9dv7vLUuSCUed33f6W06nQ?=
 =?us-ascii?Q?i9+rIj+abmVsPKnq9/07QfFsyYCTFUrLFG6kg7M2vuUuwUZs22+3Jo/g+6m3?=
 =?us-ascii?Q?7m62g62/nYDHYfVuG/xw9xdU5ipZZVSuSMKYflKl6ePXImkGoGKHs7pHcGJY?=
 =?us-ascii?Q?tPI79nQJW9euP86Vr/OdxoTjLI/CK4AklLEVMuZq0EdoCq/gL7MYGVA3xd/J?=
 =?us-ascii?Q?zveVnOfyR2l7Xf4gxFGEFgJA9iV6FJz7UtxKJLNeFajyceCx7xs+w8sFDsrS?=
 =?us-ascii?Q?QNZp5RhXNxGDDgEzrzZG1qIxUdeBjERrZ2S8J32Dj9yCQ4iM1Vt6eYdSL66y?=
 =?us-ascii?Q?av8UDnYNaWODdK/yDUC/uqF/2AXoM2oXUqDMfOzqzgcqw2JjIfKKvlmrBLtk?=
 =?us-ascii?Q?deGnH3ZlqvnxwWF5fmLgwl4hMfDB5HA+sZ4gCnOe/b2KeLQ4ppamPo3yS9uP?=
 =?us-ascii?Q?+A4j5gc9zsykbDfeiUug+JP3HO3jzNMmQxEAUxq/8c2qfG8graFc9V8VYo3j?=
 =?us-ascii?Q?aosS8nzuFqwVczYT/9ljdrRot5U9LuLrEeZ+bWemEbLRom5d0z8cD0hBomO4?=
 =?us-ascii?Q?jYUOdhmprlrdTkGC0Hu9bYu7ROiapAzlq/c6hSVAMkg5sUNau7yeQDXuBKD6?=
 =?us-ascii?Q?yLBBBRuDytnYA02xWMS0WWHGW0xlztLv8rqqyNDQ35ZaNyPOLfuLoDkp9zgf?=
 =?us-ascii?Q?1FQU5+FBXvTq7hipu7U=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:28.4377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ff0e49-a48a-4535-974a-08de09ec5b89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9703

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/virtio-iommu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index d314fa5cd8476..766dded8fc8a6 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -730,6 +730,18 @@ static struct iommu_domain *viommu_domain_alloc_identity(struct device *dev)
 	return domain;
 }
 
+static int viommu_domain_test_dev(struct iommu_domain *domain,
+				  struct device *dev, ioasid_t pasid,
+				  struct iommu_domain *old)
+{
+	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
+	struct viommu_domain *vdomain = to_viommu_domain(domain);
+
+	if (vdomain->viommu != vdev->viommu)
+		return -EINVAL;
+	return 0;
+}
+
 static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev,
 			     struct iommu_domain *old)
 {
@@ -738,9 +750,6 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev,
 	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
 	struct viommu_domain *vdomain = to_viommu_domain(domain);
 
-	if (vdomain->viommu != vdev->viommu)
-		return -EINVAL;
-
 	/*
 	 * In the virtio-iommu device, when attaching the endpoint to a new
 	 * domain, it is detached from the old one and, if as a result the
@@ -1099,6 +1108,7 @@ static const struct iommu_ops viommu_ops = {
 	.of_xlate		= viommu_of_xlate,
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev		= viommu_domain_test_dev,
 		.attach_dev		= viommu_attach_dev,
 		.map_pages		= viommu_map_pages,
 		.unmap_pages		= viommu_unmap_pages,
-- 
2.43.0


