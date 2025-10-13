Return-Path: <linux-arm-msm+bounces-76891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FEBD0EBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434F63BB41D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F25C221264;
	Mon, 13 Oct 2025 00:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c9Fnt8Gr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1106218AA0;
	Mon, 13 Oct 2025 00:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313973; cv=fail; b=TQXgxuP/RTXEltHsLMiWjfmnH3bTlfgCsgw36zuEEEvH8XbKLFqoEg8/r8zII/ALSe+54HbOBvFdC2OAPpsTi9AOHX+8IPe8+FHLG9pNn31vFBHK16M4FH+v2eQlsPQ5qCY/IRtQccrb9ozVNWAeKIBlU0m7YVHP56TFLl2bXJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313973; c=relaxed/simple;
	bh=7iVOeMH61bpMBNiAzBHkAcn8z+dUUQdW09luJRErvCo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OvNCoRGWnXGPzAhiz7QsdbnJ4NUl1ntK4M5RbFm9xez0CcQpMKEXlN6XK9Jblu5KF799sQ1DcEYBEb2M2+v5eSB4N+wrVpOFG7AsS1ZzF8e4EVS+/8IzSrYV3p9JSDDYph8mXVJmc7VhxwypJu4bQcNdryUrvRBfqm5Y9VAmUC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c9Fnt8Gr; arc=fail smtp.client-ip=52.101.52.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeqSjPaS+EE7KT6ECrLz+2ULY+x0uiU+34jlerX5hRtK17rRifQ13PS5HZCJtxDi3Vw1//sWV8pfPW1Un4mDvDi+MaBNFlQjgktomY2+Bo6h6cOuxVT5c/yuxEkZXXjgB3Og6XBtOdlrTn117luDuyYMHoJix2NW5/sSQ/bQdbkn18Fw/i3EcPk5IuCr009dvzlIhOKeFq+7FNEnMtVtcDbYc7rHyrdKn5PYYfKvaNXP9j2Mq3uNzqJdgWfH6mdiTCjMxXpePxdfyDpjYQ3ADZrNvgtZ+wQngzZYsnO78OJZ7MgOjAm2FDlbcwxPdRVc4GLoNaDTY/kA2GHFk6XhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZhnAVkk/Gr9E3NFFvXPlym24B3zW08aSeHSO9JVS1E=;
 b=ObWgWXvpidpYKaNIyvoTmJGKhCBKL4GCWC028bOyjXXvTu6pg68mPHnMTNI6FYvejVUX/QK6XFhEJyQl8Do535ziHRiB0FFkPr3GtJMZd9OAywUfDWVrbMkp23LRo1BRqUkE+cXJfIszcAww9o9hTy1VyrDtnNsPECNGuw8rpp/YqcE3wnVsCK74F08RG56MFQp94PSwPz9lvMoot2sdgXhAuszD33hqDKngWAMeRo8DzIy7i0PSHNZIogqoGC9zXLrOQs910SThonNp4FVAy0Sb40l5Ch4EE63Vs0DwXQ7MMaltO1voS8NRmUhq+KzJk0S0pBuiDQPEGg1DARA9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZhnAVkk/Gr9E3NFFvXPlym24B3zW08aSeHSO9JVS1E=;
 b=c9Fnt8Gr+F7Qm7fQd6NxyNqsHbdw/wfPxh8HZ8fiRjQbIDKEFRliOhKNIYi1Z9x9m+1wzo7Yzus+AnAzdCkc6wyuAOum4GbVxMQIkJjaDsBqHaEwH0gZwA3Ze0z0ro6wN0dzZJQl3GI1RBdoXRUF5j6Sz6HzqNCdhdiWoxRSrQ4qoG2ud5ElMtnUKC/Tzwy6GuHjF9J13p2Imn6asqws484mp8jvjODVQBz290+kFuhSvlMvBYGE3KFkoXYpiUoxqII4wXn9cmhaIYE8s5vRXYbfoGBa58jA0mM91oveXBXE8D+qXIYwaE2j/eDQIIW9wGBW18OEI/WBe0MB81K1ag==
Received: from CY5PR17CA0005.namprd17.prod.outlook.com (2603:10b6:930:17::7)
 by IA1PR12MB6356.namprd12.prod.outlook.com (2603:10b6:208:3e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 00:06:03 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::dd) by CY5PR17CA0005.outlook.office365.com
 (2603:10b6:930:17::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:02 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 17:05:42 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:41 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:39 -0700
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
Subject: [PATCH v1 05/20] iommu/amd: Implement test_dev callbacks to domain ops
Date: Sun, 12 Oct 2025 17:05:02 -0700
Message-ID: <6ce261ebacddec3a528c5b303a40476aad422dd5.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|IA1PR12MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bcd165-1730-4bbc-92dc-08de09ec4c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eDA+kHHwXpdFp5fVxnAtbpYocYPc8iElsE7BHAt6bLWDY92qqEr400j231jw?=
 =?us-ascii?Q?uRtEhpZRyQ5mIXhRm0bnbwlddyg34IaO5GS23HtpaJmnpWijp7Pg8IeQdGZW?=
 =?us-ascii?Q?fGSQUNYVxC25Hjj0Mv1EqCi3qZcazq113AoEveLTSmSAF/FWT2WYqbQTnK17?=
 =?us-ascii?Q?e46z9pva7tDsA9q5izgqbQYVWf91g3JrBBTVdLDcW3WrcAlhVXdat8b0bGtx?=
 =?us-ascii?Q?QCWQWDRcNRTOUEBxxpvjfsoDDjirIsUCRsaLopUwzJuXx+6xN6NisF48N3N4?=
 =?us-ascii?Q?NerN2JrUxMpo5fyz1jGWtMnCLS0D2byfjLB9I29ZbNidtRpHS6k83gTvi316?=
 =?us-ascii?Q?ZdwPLlpUxb/xy4ZTtZF4XxgFN9pjf7n0VfQiRwHmCxe9vklONNFO7W9uyr/F?=
 =?us-ascii?Q?fp4Kp8rQBTHuIrhiHqc5AolFYqLAQJREVh8BQn9JlwzNOLiLHIkCV5KOVlPc?=
 =?us-ascii?Q?5eBo9hFGdFnBY1NfGM4WCMh9DXzqLg2WX7ZO6jnUTx1oJnqMHKbaw2ts9vLt?=
 =?us-ascii?Q?5+T9MvPG9Ki+YDhcAqSQdrN3FpjYjW3KJxVWHpNqKvHloVNsw3obiKjbJ8PG?=
 =?us-ascii?Q?TF800DL7dYLS652EikHDHhUgdhIvqUdnPqXtvWP9+QMAI2O58AoJ4jb5jC9v?=
 =?us-ascii?Q?QvbJ0YH0B93HQGF/zEBVYUVUGoe0FJVSdH8ItFL8CNlc3Tf3IApEUam9OYIu?=
 =?us-ascii?Q?LeJfTFj2o/s/iAY/mmcjNvJtM1bywti4j/w5nHKaNSbHm0Sd5J21XQpzAzo5?=
 =?us-ascii?Q?dtXUTV8hFB60jMRiS/iklwtm0Ju07Dn7AV3i6M7BXO2tNxgit8wxZioWZa/2?=
 =?us-ascii?Q?fM16eFhZ+Q1dfN5DuV0Ek6f7IVkVLyMluZrCcKglqKohuWIx7Lx8p/DlqN38?=
 =?us-ascii?Q?kOzjPU0yHguaDI6d863c/k3bdAxB5ZYciwMicOPlH3Qh4pygxeLs06v2cEgX?=
 =?us-ascii?Q?Ur9IAMx/UEFX9leKVAtTrHpmmECqfljQoLJ6Ej0rA53O5pSMssN3t87VLqrQ?=
 =?us-ascii?Q?nCxtgp1B/Sx1oFXcV35jcbGPYDHogAt2g9xO+NWTM2i2hQD8hX/wPCHhPiBA?=
 =?us-ascii?Q?LD+lysCbLnGn4jhEbZd24kxgY+6/WGEoSjXAFvoSjHBN1S5tXvh9Hnb+JqZG?=
 =?us-ascii?Q?b4bmi8D8p72JQwikzyNkGzmZZHt72SUcO0rHmDJnjImH3V56Bc6d9CPVgl3t?=
 =?us-ascii?Q?FNcPygD0TJ5uJmmgUDqUTdTlvFcNKJzQQ7bEBddbyQ+MrGwF7hamnVf1C1Pq?=
 =?us-ascii?Q?3nnRUAG6I4dbaoldGOEnsTgesHrabTLi2jpeGQ2YC9agNNMXerwkcnwqA+/Z?=
 =?us-ascii?Q?weaSyW8GF8hJ/Lj77wA68A1w53KBfBpOPn3KPPR+3Z1CjTitAlBrNiruAuXs?=
 =?us-ascii?Q?VwznAbqAhJZ9r3oGtzRWe892ETHCvRrxKxO8XyKfOW5theO89i1J/KqzuXhd?=
 =?us-ascii?Q?1z41vHLHMOWE4DCm4VfAnzQkPhRiEE2bSXVFwZAuBJCqJdTP5ziYkwuxn9E9?=
 =?us-ascii?Q?klRFeocA/1HtluvFfxuOVTgcTbdG/oOG7Hn1GAkYeO0tdM4mRfT+1sCuBtrY?=
 =?us-ascii?Q?10ik2dFguqcGHuvRCQ4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:02.9886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bcd165-1730-4bbc-92dc-08de09ec4c53
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6356

Move sanity and compatibility tests from the attach_dev callbacks to the
new test_dev callback functions. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Correct the errno upon malloc failure. Also, drop the function prototype
of iommu_sva_set_dev_pasid() from the header and make it static, as only
pasid.c uses it.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/amd/amd_iommu.h |  3 ---
 drivers/iommu/amd/iommu.c     | 27 +++++++++++++++++++--------
 drivers/iommu/amd/pasid.c     | 29 +++++++++++++++++++----------
 3 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index 9b4b589a54b57..f99fa4da34996 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -52,9 +52,6 @@ struct protection_domain *protection_domain_alloc(void);
 struct iommu_domain *amd_iommu_domain_alloc_sva(struct device *dev,
 						struct mm_struct *mm);
 void amd_iommu_domain_free(struct iommu_domain *dom);
-int iommu_sva_set_dev_pasid(struct iommu_domain *domain,
-			    struct device *dev, ioasid_t pasid,
-			    struct iommu_domain *old);
 void amd_iommu_remove_dev_pasid(struct device *dev, ioasid_t pasid,
 				struct iommu_domain *domain);
 
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index e16ad510c8c8a..dc0406427dcf8 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -70,6 +70,8 @@ int amd_iommu_max_glx_val = -1;
  */
 DEFINE_IDA(pdom_ids);
 
+static int amd_iommu_test_device(struct iommu_domain *dom, struct device *dev,
+				 ioasid_t pasid, struct iommu_domain *old);
 static int amd_iommu_attach_device(struct iommu_domain *dom, struct device *dev,
 				   struct iommu_domain *old);
 
@@ -2670,6 +2672,7 @@ static struct iommu_domain blocked_domain = {
 static struct protection_domain identity_domain;
 
 static const struct iommu_domain_ops identity_domain_ops = {
+	.test_dev = amd_iommu_test_device,
 	.attach_dev = amd_iommu_attach_device,
 };
 
@@ -2686,12 +2689,26 @@ void amd_iommu_init_identity_domain(void)
 	protection_domain_init(&identity_domain);
 }
 
+static int amd_iommu_test_device(struct iommu_domain *dom, struct device *dev,
+				 ioasid_t pasid, struct iommu_domain *old)
+{
+	struct amd_iommu *iommu = get_amd_iommu_from_dev(dev);
+
+	/*
+	 * Restrict to devices with compatible IOMMU hardware support
+	 * when enforcement of dirty tracking is enabled.
+	 */
+	if (dom->dirty_ops && !amd_iommu_hd_support(iommu))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int amd_iommu_attach_device(struct iommu_domain *dom, struct device *dev,
 				   struct iommu_domain *old)
 {
 	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
 	struct protection_domain *domain = to_pdomain(dom);
-	struct amd_iommu *iommu = get_amd_iommu_from_dev(dev);
 	int ret;
 
 	/*
@@ -2703,13 +2720,6 @@ static int amd_iommu_attach_device(struct iommu_domain *dom, struct device *dev,
 
 	dev_data->defer_attach = false;
 
-	/*
-	 * Restrict to devices with compatible IOMMU hardware support
-	 * when enforcement of dirty tracking is enabled.
-	 */
-	if (dom->dirty_ops && !amd_iommu_hd_support(iommu))
-		return -EINVAL;
-
 	if (dev_data->domain)
 		detach_device(dev);
 
@@ -3047,6 +3057,7 @@ const struct iommu_ops amd_iommu_ops = {
 	.def_domain_type = amd_iommu_def_domain_type,
 	.page_response = amd_iommu_page_response,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= amd_iommu_test_device,
 		.attach_dev	= amd_iommu_attach_device,
 		.map_pages	= amd_iommu_map_pages,
 		.unmap_pages	= amd_iommu_unmap_pages,
diff --git a/drivers/iommu/amd/pasid.c b/drivers/iommu/amd/pasid.c
index 77c8e9a91cbca..474494a66dd40 100644
--- a/drivers/iommu/amd/pasid.c
+++ b/drivers/iommu/amd/pasid.c
@@ -99,31 +99,39 @@ static const struct mmu_notifier_ops sva_mn = {
 	.release = sva_mn_release,
 };
 
-int iommu_sva_set_dev_pasid(struct iommu_domain *domain,
-			    struct device *dev, ioasid_t pasid,
-			    struct iommu_domain *old)
+static int iommu_sva_test_dev(struct iommu_domain *domain, struct device *dev,
+			      ioasid_t pasid, struct iommu_domain *old)
 {
-	struct pdom_dev_data *pdom_dev_data;
-	struct protection_domain *sva_pdom = to_pdomain(domain);
 	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
-	unsigned long flags;
-	int ret = -EINVAL;
 
 	if (old)
 		return -EOPNOTSUPP;
 
 	/* PASID zero is used for requests from the I/O device without PASID */
 	if (!is_pasid_valid(dev_data, pasid))
-		return ret;
+		return -EINVAL;
 
 	/* Make sure PASID is enabled */
 	if (!is_pasid_enabled(dev_data))
-		return ret;
+		return -EINVAL;
+
+	return 0;
+}
+
+static int iommu_sva_set_dev_pasid(struct iommu_domain *domain,
+				   struct device *dev, ioasid_t pasid,
+				   struct iommu_domain *old)
+{
+	struct iommu_dev_data *dev_data = dev_iommu_priv_get(dev);
+	struct protection_domain *sva_pdom = to_pdomain(domain);
+	struct pdom_dev_data *pdom_dev_data;
+	unsigned long flags;
+	int ret;
 
 	/* Add PASID to protection domain pasid list */
 	pdom_dev_data = kzalloc(sizeof(*pdom_dev_data), GFP_KERNEL);
 	if (pdom_dev_data == NULL)
-		return ret;
+		return -ENOMEM;
 
 	pdom_dev_data->pasid = pasid;
 	pdom_dev_data->dev_data = dev_data;
@@ -175,6 +183,7 @@ static void iommu_sva_domain_free(struct iommu_domain *domain)
 }
 
 static const struct iommu_domain_ops amd_sva_domain_ops = {
+	.test_dev      = iommu_sva_test_dev,
 	.set_dev_pasid = iommu_sva_set_dev_pasid,
 	.free	       = iommu_sva_domain_free
 };
-- 
2.43.0


