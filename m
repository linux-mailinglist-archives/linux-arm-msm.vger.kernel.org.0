Return-Path: <linux-arm-msm+bounces-76897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7BBD0F18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65E853BC898
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF8B271473;
	Mon, 13 Oct 2025 00:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aeEVj4pA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FF26FDA5;
	Mon, 13 Oct 2025 00:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313983; cv=fail; b=Qjo0HHfRQV0W0dOiEiprIwdE1e58TuR3a2JzBIc0eg3izVjdb0wlXry7w2RJmLTi92W1GARMEgKCpcZ3nL9jwEvC+WpwR2SCOHrSNZJCRSGFnbBkcfJMtbe4d7+lGJtvMCT30rovPs2DnRGV5FWWBDQYd73W7TREiOuBU9e0d/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313983; c=relaxed/simple;
	bh=FR3fSbM5SN+XjoTTyoSm8X+lbGWoOMhb6cpTZZi3Jl0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXPdgDIh1CASKuvLO64OF2gWR/WUWGXqZd2X/9r3h51Cu+577IA5rqbj11l9N4zSlUtnEXo7AFBgy1O5DfxB5GPigZi9VDRMnpEW42R+1srxrunARWh1y3b1tcVWIFk1KaHeHANoVMjuus4h24Nfq2pRUDPGjb5Nfa/8kyXKYZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aeEVj4pA; arc=fail smtp.client-ip=40.93.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b51/YPOfTa4cLewM41HOn89CSYuiD2xUGxSLTttbqFUqBw8yNWdUb/ugoQDOnjYIbsNrGMYMge4CR2jhAYKtyvpVKh+8o4KJ21a3ZMljm0tdAMZTRJjpdp95H63Z9lW0eEW/pD3ICwRL7z8sYjdcmtK9eo+egJ7oUi2czzAS7a0q9GCr29r4mMbJYrlRJSh9ENouhw+yQz63PLzssruS9MQofmJMkHpcraJRShpdRPSB/MRln8uFtSVtURVgwZfPwQL8/iL2VTVAXLWurBgdcdiIfvoqtpZRiDVcZWgjaStJr7OpSsCaRIIIsbZ7yTHTTUpQwiZlyvF+NbBGyBRDUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liVdJ3lmKtxB7XC0JNRsBS9QIHy7filVa9RtXT1Cd3M=;
 b=VN5TfV/79sUaCy4lzBNXivH9w0FwLqaWldoRQEC2lALv2RaSaM/mpRd7UuAmh/1g9RtFNSyCH8NWX5JT8xAFl9sj9x4lUOSNNvaNGkYYDOub3nem1ifTcC6vyF6p1yrGUzb07GlAHbf3OR4eQkJQK84W0rNiyxMdlUgLnM4SEFYizN0GPhmoJvdCdweQMSdxspNNsODsWdYb309QPrQMCg+lklD+TQS4utsog55i4RBGZqoPDSqq0knRF8xbRnHi7Qewj/X8KlaSQxQOrOUwBdbiyuZVQ76GdvyFtdcJv3L3OoxRNAGWac59+mYI2dMk7+Bhec3iM5I7ZMkLsAku6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liVdJ3lmKtxB7XC0JNRsBS9QIHy7filVa9RtXT1Cd3M=;
 b=aeEVj4pAySEny5KcdxrtEO8+9ZO/3bbThJjz9fJGwgKrSqZfYtVFbqTEXc/4kmLDS2SfuxSShHtMHHdBD4gkRjjJAst0u+6MvowOHUSXDgA4xJ3o3v7qBsLCLDeoNYXoqShuG74+IFZqJ6GbfjrbipKB/JhP3OPQNS203mvl6he5RYyVvB+rxE8mnzqxS3CjQvBop2g7JPPog9c/zNlQ0RlyVXnZxBcKaMnoPAKGkgVDuMM2Ylp/nzlYEg2QjIExg/IrEyIgRnvqv1oixltUJiC+FfrKoYrGneWb2O8mRQCzHRVICrzcXhu6bTOuSeYzqpR4JhmYzJOP0t++twu1Xg==
Received: from BL1PR13CA0069.namprd13.prod.outlook.com (2603:10b6:208:2b8::14)
 by SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 00:06:15 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::52) by BL1PR13CA0069.outlook.office365.com
 (2603:10b6:208:2b8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 00:06:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:06:06 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:05 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:06:03 -0700
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
Subject: [PATCH v1 14/20] iommu/msm_iommu: Implement msm_iommu_domain_test_dev
Date: Sun, 12 Oct 2025 17:05:11 -0700
Message-ID: <a350943e223c56922060fc1ce758997140c14a88.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|SJ0PR12MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b78e84-93e9-44c5-5cf8-08de09ec53d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GjyT2qU/pFEIEn2G/sf8MfBsoNGi5UIJ6DhhUA21ORFSTOO6Hj4OveBDiF7L?=
 =?us-ascii?Q?U6RG5oLyL+9GC0etI3hWgC0MrlfSj3sn929C30Oz73txiRpw1lUkwnqwMb5Y?=
 =?us-ascii?Q?FqSegZSHDM7ugzDMr/CXD0+zmrMIYFTyJvU5Qge8YUKKJ5CUvv+33rmtHzg9?=
 =?us-ascii?Q?4RlrOCYa08hp9VJUDEDE5Hj0uQms27J4AzdQlzOU1yXqJDukz0S4DOs7pfEG?=
 =?us-ascii?Q?j1VznHCEhsuKM9Ex/Z8s+gR+4WxtkhfJH3M0n6wgcX5TKWmm17hmEACNmMuK?=
 =?us-ascii?Q?UxF6F2hOg/Mce1oSebHstBpPMcOVCtQ5zXFCa947tQf2Jpj8XMbRB6glA4zc?=
 =?us-ascii?Q?5xGEsx5e2cNy+9lJ/rWjZbo328gR4PkscvPPu4ohvH4qJSzAp0EBHM3KeGnj?=
 =?us-ascii?Q?XaK4vY7htstnLRLRbu4KMbvSlmmvZSXIwgI3wmWXOmDbFVlBV+lUVv/QrvD9?=
 =?us-ascii?Q?z8KkQPqO7EujywE23ddLCcyr7wpg8NjhOJ4wSauy2Jz/Ru57zck+DsXbMVfL?=
 =?us-ascii?Q?SnG8DMyYxQnEcnB9CNM2F/FmBVZU28mNE2ba6tFPAQqAYNy3JR9BF+wq6kQX?=
 =?us-ascii?Q?R1ytlffxjiMsM6zbZuaRqdS0BnoUUtYMkpZk8oFCRWqwHbh0aJEDfXAfUPCg?=
 =?us-ascii?Q?dXspsy1QJ0jrmSysxRS4eVy9uhexI6QlZN4T93I1ZgWpAH4LL2wEhBmVO7AO?=
 =?us-ascii?Q?9nPrxZlEYgJpQhkbIHa8MZQPp3wzVeqJyweer6ufqrA1anJxuCPVxYUXZXWA?=
 =?us-ascii?Q?lBCDXCKcf7Az37z8WoLjdJrFsg5By+hjd6SUI/jYx/wFFoAYILXMQkRv1w3i?=
 =?us-ascii?Q?13LJqkBD3as2uypcZvMiN9ATEuv/9FLitwRetue1sVGLb0ONAS4byLoQMtUh?=
 =?us-ascii?Q?NiFo1AsRN8Y7uatVkeEUbdy5+w4uCzji1HCp9UeozCbj2XEfjEhp1vyk+ffE?=
 =?us-ascii?Q?WpLUGRuEo3JmvZwsbxPIKchPVr73QXKTzj1c7xWPWNyeoEuu4MVWXlLfDhMf?=
 =?us-ascii?Q?NqMkI+eUO97Fr1ihYkdplD1xdKaFKyLfQ8KeiUmI9kYA2ydlc9H1dY/0uXSw?=
 =?us-ascii?Q?CPgo/VH28UlOLO1id9r2v8Yh5n7b+y8XoIvOyJeGzQE3mSCBiqo6H5VESH6g?=
 =?us-ascii?Q?NNPbGnpAYWMHlRkiGmN6mfz5qzl8pntUXs5R2YQKep2NAv8z/9ePqPlVH1nh?=
 =?us-ascii?Q?aYRd1glTni0coddp+yEVakm8e4l6vhZMs2vjzemXOkEHgZ2NE5H5NgbysvLk?=
 =?us-ascii?Q?Hq9bHKMDGvp8jRg1Ir5DkWJKxh3wPP/yLENvXlzah4UmXjyTVxHMJJ2Gxu70?=
 =?us-ascii?Q?s+14VbHgkxq+gqylBy73W2Ny/TmGX8J2ndKAob7KIjXhzdfSqcIVDFyLEVWe?=
 =?us-ascii?Q?BZKmZIINzC4PzfiiD+ZNJatazy2lmxjSVpXmWRjpmm9JkgVsfGpCT3QC+Z9K?=
 =?us-ascii?Q?cMpqVguv4voOD/WaIgFC+WNtpJ7CkGuBeAbtJ7DewA6lFkjDihoOObZgsEj+?=
 =?us-ascii?Q?3ELDwXYASikf1vbo1MDTBnHdBbYHnVc8y9Imzm86HvACeIfT/D31Th732maV?=
 =?us-ascii?Q?RFQO2YutQAzcrTinpIo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:15.4873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b78e84-93e9-44c5-5cf8-08de09ec53d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Following the test_dev guideline, replace -EEXIST with -EBUSY.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/msm_iommu.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 819add75a6652..b7b21c97d1bd7 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -391,6 +391,31 @@ static struct iommu_device *msm_iommu_probe_device(struct device *dev)
 	return &iommu->iommu;
 }
 
+static int msm_iommu_domain_test_dev(struct iommu_domain *domain,
+				     struct device *dev, ioasid_t pasid,
+				     struct iommu_domain *old)
+{
+	struct msm_iommu_dev *iommu;
+
+	guard(spinlock_irqsave)(&msm_iommu_lock);
+
+	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
+		struct msm_iommu_ctx_dev *master = list_first_entry(
+			&iommu->ctx_list, struct msm_iommu_ctx_dev, list);
+
+		if (master->of_node != dev->of_node)
+			continue;
+		list_for_each_entry(master, &iommu->ctx_list, list) {
+			if (master->num) {
+				dev_dbg(dev, "domain already attached");
+				return -EBUSY;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev,
 				struct iommu_domain *old)
 {
@@ -414,11 +439,6 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev,
 				goto fail;
 
 			list_for_each_entry(master, &iommu->ctx_list, list) {
-				if (master->num) {
-					dev_err(dev, "domain already attached");
-					ret = -EEXIST;
-					goto fail;
-				}
 				master->num =
 					msm_iommu_alloc_ctx(iommu->context_map,
 							    0, iommu->ncb);
@@ -695,6 +715,7 @@ static struct iommu_ops msm_iommu_ops = {
 	.device_group = generic_device_group,
 	.of_xlate = qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= msm_iommu_domain_test_dev,
 		.attach_dev	= msm_iommu_attach_dev,
 		.map_pages	= msm_iommu_map,
 		.unmap_pages	= msm_iommu_unmap,
-- 
2.43.0


