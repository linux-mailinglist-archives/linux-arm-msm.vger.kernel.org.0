Return-Path: <linux-arm-msm+bounces-78428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FAEBFEEB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94587353317
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB77E255F2C;
	Thu, 23 Oct 2025 02:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fqw8/VNV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013006.outbound.protection.outlook.com [40.93.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36ED2153D2;
	Thu, 23 Oct 2025 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186159; cv=fail; b=V43CKzVF4fjwu9QMOLSmNfRjNj0JPKmFPN83wwWpy7Ib0UlDWme4M4YBpUpGAR7e7+9StvNXkNUUwzBnt/9OGXlXg5VifRKfQgC95N4PdijbAm8dWSKK+8s4V98o5ub86V62dAZPt+qDrvRvPYb36fEsB0O4awvwYHgHXArex8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186159; c=relaxed/simple;
	bh=DgsnmNuL4H3jJDrlYeKMaB65ETt6W8rN3jWKvRg875o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbIA8F4M7T+DVo1tNq6mDNsZzyheFty7bupEUVQ8ouAMsAF2Z4K2reuQGNiJ08vO3Xz3EZL2E0aFeIYYwRIa5W/I6J3y9aIN4kAoxsrS0UqSBmPvJR7RGqFnOLk8pi7EiQRrdWfObKWO0GlVbWgLNiH5mTCHPb6/ubeHiXL42Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fqw8/VNV; arc=fail smtp.client-ip=40.93.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiwdKpr8udhPHN6QzH3U9Q/QXWE7lp4UBu0XFSAjoPBL0NQfKzy8cuvxDwtfaahl2LXafDt2v4mnlcwwKhltysPkN6O/YUsmcDshwPoTcHat8xWg1HFdXILylUqC2UP6LAK3Qt7gYV1HxV0wQln082qJ40W3LSdMWmvO/j4fFw4DBJkWCsyvhyJkT4siOzapF1DSRYNPj/SNR+0MVhQkbK4Iog7I3MNCbdj9bluavAf+Z2v6g4p3TxW862ehv1rexzj3f0wYGpwxWB3xl4RBUoaePn2vieupA3YXKUcYBW2Mtb/RO3HR+SGqRZ9uzXpkO7xCrfi7q29UNPLypMQGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/l1DoHWiDWO8nuNN6vhG8TwlWRXqnkw4z104DXGzyk=;
 b=DEhdtg2JjaTqDgsBp+pgWe5/Xc4zstegf7vlnA7m96j5pk/xVhqrijUKPY0/Kl/hkVlLTLeqv1CDmC5hCP9EAg2boUa7P0ZgTeK9XJusCzV2zNSOdKkjhcjxwCNKIpD4TssonoYCofoQS3/xlQIWBeHGJFSgA6zfAb3Y143PQyd/U9aeqyThtYVVsqpxgb6hCr5QUqNbqFJYaely0yNac28ecuYOIUP7/+K9lOE970YnEH0MzF6ewk/Hb17Lr1B8X3qD9qV3rgeZZugDC647UvuO0ZhECfm7LUkbAmIHBPhTs7o0tWZ2W9ZYHhaiyl8oATeT2zILJTl/2cBR1sSdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/l1DoHWiDWO8nuNN6vhG8TwlWRXqnkw4z104DXGzyk=;
 b=fqw8/VNVRMI0kzPVW4wCbDDr2oRtdfVC55lJVe6SgKrJvgL8yVmxtBzNwbgkVuXHjLl4Y+XWn3fcKfcBekwHpIEv7SWBEsE61q8Ef82+gfyNcgY9Es6sc5E0fsujmqs/65EHMN0LXZngE7f/yYahKf65526xDsDOoFWmTu6BFwW60SGXPY01sL1eHhLwE0oHOTo4q89uroYSGWmwXfnyxNjNu/96+TktMdd+tliwN65C6j+repTYr1In9HVDx8deFiAL1+yVq2Ii+ODKwbzkuXPDS+RaPtxtam9jpE17R6VHvUxl2ftnWdr+GHotrnK2Hy0wikn1j0JNoapB8AlJqA==
Received: from CH0PR03CA0348.namprd03.prod.outlook.com (2603:10b6:610:11a::23)
 by CH3PR12MB7762.namprd12.prod.outlook.com (2603:10b6:610:151::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 02:22:33 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::c2) by CH0PR03CA0348.outlook.office365.com
 (2603:10b6:610:11a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Thu,
 23 Oct 2025 02:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 02:22:33 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 22 Oct
 2025 19:22:20 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 19:22:20 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 19:22:17 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<robin.clark@oss.qualcomm.com>, <m.szyprowski@samsung.com>,
	<krzk@kernel.org>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <schnelle@linux.ibm.com>, <mjrosato@linux.ibm.com>,
	<orsonzhai@gmail.com>, <baolin.wang@linux.alibaba.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jean-philippe@linaro.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<patches@lists.linux.dev>
Subject: [PATCH v2 4/6] iommu/amd: Set release_domain to blocked_domain
Date: Wed, 22 Oct 2025 19:21:07 -0700
Message-ID: <c1ffdeb056eb168800f108c8e4e8564e9589f7f9.1761017765.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761017765.git.nicolinc@nvidia.com>
References: <cover.1761017765.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|CH3PR12MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 3628c1bd-9727-488a-2ce9-08de11db0695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hWrcS/Ecdppaajtz1bqC0jZ6hoo0+TwnZoPJyI+v23Tt58NAHE3j8tAeCIJ7?=
 =?us-ascii?Q?ksON/GiM8MhCthNDmcitQh/h18DCpEjU92/Kg6tUkrqBnuo9VbQjbv9Qv9Mj?=
 =?us-ascii?Q?pssTBaHXMHNbRz3PJIvZ/mp0frRVCRcySNdc9/Qkj5pYvCHuRLkSFARQn3Qo?=
 =?us-ascii?Q?iXlyJhIVxnaopkC8IQifjDTjgPwGxuE45Sk0wNdi0YIhn9f5P77Ijvp00tay?=
 =?us-ascii?Q?hs+CEeb0Ef+fzMda6Vs+1aRr3RHKUqipZuwh/v2D4ff1DP2Kx4pLplyD9JjO?=
 =?us-ascii?Q?fqIrh+oXhJuIIXFkQrjKn8w4iPW2WN2PriWN0GvTRjcUCr7k88PAdTzg4u9y?=
 =?us-ascii?Q?Vz0cBLLhBWJ+c7gIe4FiM+r8VGHiFj75P0ZWi7kVkBfWxSt2j5eZ0IOWGYop?=
 =?us-ascii?Q?QlSvQx6nycwDM3oKTT105Rsc8x0UZA2unoZShN+07DodpUKmR9bzQIKkpxLH?=
 =?us-ascii?Q?feEmP5wbbkndLn7kEr2LCbSlBbSI00vIzWScxn/b88nGSQ2rLfgyF6UJehY4?=
 =?us-ascii?Q?7jbpi0lJnJ6SBJOggqr/jaWWEkG5xu0AJ0Wmd1roXYSYag/d6k8XDTDhAka/?=
 =?us-ascii?Q?Xx5udicJjUxCnPY+dwzANKzq74xB+R5VvMZpKNFCXEUvos5whJL1CnyHxG2T?=
 =?us-ascii?Q?Xhj1ppL7yy/5UdHmvyJF9n5KMV9JV+y5IlQnO3RnfjvrHQzRdFAbc1Jref3R?=
 =?us-ascii?Q?EusYjIRRW9/9K7y9O9SwTmksm+FR58WQUXRFxastE9oyr37mRPGmi5+DuPE2?=
 =?us-ascii?Q?GfxIvevjCW91htJyNmzcM6OJyhaX5ahMYwCiyFUqQBn7bULTGrUukD0mCe5G?=
 =?us-ascii?Q?6mrj1waA2v74l1tHNPCWHF3aOxQAhDXrELa+aWtOsezRho2kOhmXjIxFiBJl?=
 =?us-ascii?Q?mYAZ0htuVKkbxjZfgJgO884ch/WNbb7ImWKraxHXWLVHB9IfYsDhglXgpICQ?=
 =?us-ascii?Q?Q6NJ5eq82UZNhcQxPK6x1kLBJQX7gz6hvEXzeZyPxLZv30XpK1H8SPl4Z2jp?=
 =?us-ascii?Q?hojMkATRKo3ZQ85i1WvzgYOiR8m8HUoONDTle53oSzTlmmglKoCp3xNFHPvP?=
 =?us-ascii?Q?jk7FFylzNSZKpfNUYMOQ+TIkzpswtvGBJpzBf65ULL6uYW5lqgTifGwSlUyI?=
 =?us-ascii?Q?OK9b8ytlFpF10Inp1n3hkLH4hXE6gfiJX9rbmSXDEOkMxgKQEit7ZgSN1XTz?=
 =?us-ascii?Q?AkOt3ral9ijwuiKwgiEuwOWxJqzMbWtMSuWVRgiXJsXdf+R1c9tglrY5FfI1?=
 =?us-ascii?Q?sVnj8a+s4YPvaa3UwYkupqp/Plz0tn6J0TKvImWuGGTvbcPyp550nFOrBMI3?=
 =?us-ascii?Q?+ZtokBReRGWQfAqU+yejmG/1Ywlj+x0HbxMngl2hNj1x4OFQOs53fpchVUA4?=
 =?us-ascii?Q?IiYd+MIr9t0lyzNecdindMNVIVcwFuW13H5mUsRMzIkbC3TBryCw/xb0ENE5?=
 =?us-ascii?Q?leupxRMNC/RPn/hGy/adufauA2T8g3bbEiPebhQzJzo0UpnGHiuYIifUAN/N?=
 =?us-ascii?Q?dB6Xb2OPXu5InP1OaVrKGAxaL/a9sybPGtNuFX5RkBP6oHXpkdnGKHrM98tn?=
 =?us-ascii?Q?EqWbo1ZA3lYVG31ubYM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 02:22:33.8010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3628c1bd-9727-488a-2ce9-08de11db0695
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7762

The set_dev_pasid for a release domain never gets called anyhow. So, there
is no point in defining a separate release_domain from the blocked_domain.

Simply reuse the blocked_domain.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/amd/iommu.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 2e1865daa1cee..6f4559eb5121a 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2685,14 +2685,6 @@ void amd_iommu_init_identity_domain(void)
 	protection_domain_init(&identity_domain);
 }
 
-/* Same as blocked domain except it supports only ops->attach_dev() */
-static struct iommu_domain release_domain = {
-	.type = IOMMU_DOMAIN_BLOCKED,
-	.ops = &(const struct iommu_domain_ops) {
-		.attach_dev     = blocked_domain_attach_device,
-	}
-};
-
 static int amd_iommu_attach_device(struct iommu_domain *dom,
 				   struct device *dev)
 {
@@ -3042,7 +3034,7 @@ static const struct iommu_dirty_ops amd_dirty_ops = {
 const struct iommu_ops amd_iommu_ops = {
 	.capable = amd_iommu_capable,
 	.blocked_domain = &blocked_domain,
-	.release_domain = &release_domain,
+	.release_domain = &blocked_domain,
 	.identity_domain = &identity_domain.domain,
 	.domain_alloc_paging_flags = amd_iommu_domain_alloc_paging_flags,
 	.domain_alloc_sva = amd_iommu_domain_alloc_sva,
-- 
2.43.0


