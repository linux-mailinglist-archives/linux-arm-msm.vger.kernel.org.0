Return-Path: <linux-arm-msm+bounces-78426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3053BFEE8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90F4A3A8DCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B501A1F0995;
	Thu, 23 Oct 2025 02:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r7r1Kp63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC312264C8;
	Thu, 23 Oct 2025 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186153; cv=fail; b=TCPXFrTLQyHX6l3e2OwbgV+A+hhpPB02FgM8kzf7ghGWJPkIu/sEIMy8pltoT25Ya2Wgh1z88ECMUcen+AFJ2OlARCUif8HgSG7kH49gOmoEj9ye/ZFMAhiIV/vDl//m5hUVTysgtxSi9SYPXBn0SRDyQduccGpkkQuYQixKaEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186153; c=relaxed/simple;
	bh=82KdmfRolmqEd0ITBZRPpa0z+C0I6ZomrBJb4IpghQk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DnF78Sm1zq2jLOYvtFyz9CKsB20kCX+8qN2u0BSZuZdtAD0kHXp/sv7vUrJb2netTXr2GNaNjVBnL9UlRMWrVHQzZ6xLaYppReBOk9pHBn5wbKDcWPd93SGHo+cbYy61v60RgqSFrneMxeclLjuK7oT+DkJ+VVjhtCGJTvLAl2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r7r1Kp63; arc=fail smtp.client-ip=40.107.209.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgICiOgwtBPGpFLhTTH6ONgEZAUqMntKUCgiXviEzwlL5Tab1mhUgZRLPQyS/15T4s6+y0/MdicpVlQji8Nw42mIOpkFuySoePoSrEaXu/DqYGjXm2YppHN4fcKq/fiZIL+Q/SdGxlaLLjn81yr6jYSgAfhk1N2d+E7LGxRCQZnITc9dZBTTQxbJhMjcpcwlF+A0oialde6nKmhej3+l7ynARk1XMLnCS9fY3gqAreoOBhIb98OWkkwCjzVlcngYKilwXG81Zvsim305AUQRxd8Oo0OlejSoovReN5vZ6XHoWdE7j59daxnZzsyLEM3MdSzHhYBmnRFXhipQGY9y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUREhz3vT+Mpc9qFBGc9hJIZZYufCmzwZ4w/akBbQc0=;
 b=jhL5NC5Nj2P/Dtbehjn9SgMNiOttr22gu9eaD8GTsvSjhrryZhBndhn9OMf5IR+kbY8KiCArKTIWXm2cicmylnXMnGhCVRaHzOHHeK2c8AiALKRikvtpATE5e5usLXaMQJbCNS1U7HtiT/UfT1qyelmJdBd/VFgoivaL8ozoAx+ytVKvtjLlxMR2E4RqNiR9PGdUzaJDaRZ9H+yKTa+d9BNzod/yF6DVyJlMJXNMjCWWnTV7NDHEexarifN+Hm8r53Ylqp3wG0JtT3KPqx+LkVYHEhvW/+Cj/W5Xxs72ywex4UP09VpE1VAlVu2qHlrOE9qNFs+Rkkqqxqlh4OVHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUREhz3vT+Mpc9qFBGc9hJIZZYufCmzwZ4w/akBbQc0=;
 b=r7r1Kp63cpV9Wc1VZzDYwiJ/xuNbTZ7XwRaJIN9kZmALdxXLQ9RJNM3K9rtbRChXrllJ+Jkp5CtHHgsRfK3qERfEw+KAm0FDOKV0dl2p2B7CNZcGznkCsG/AnEaxlaahMUBXllDNabp35xJVI0blGcddD+W8IX7iqkyOQrksiX9gKg1Sk9cxpKPS47QP3xk5eMJDSaPueTGDOLboLwncgHSFkCFdiI7yymDO/YUgjdqK5t4dZ+mwtcLHthR/cEoMg1ry5ySBxIQNUSYTFNZtV7i419rZZrKORBDzuvTKVsdPwhAOMUPD4U34qgcWgmNOOdWX1ZP4ZoaZlzQUWeXAug==
Received: from DM6PR05CA0046.namprd05.prod.outlook.com (2603:10b6:5:335::15)
 by IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 02:22:26 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::f) by DM6PR05CA0046.outlook.office365.com
 (2603:10b6:5:335::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 02:22:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 02:22:26 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 22 Oct
 2025 19:22:14 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 19:22:13 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 19:22:11 -0700
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
Subject: [PATCH v2 2/6] iommu/arm-smmu-v3: Set release_domain to arm_smmu_blocked_domain
Date: Wed, 22 Oct 2025 19:21:05 -0700
Message-ID: <3ba67dcf4ebfaecaceb05767627b827793227eb0.1761017765.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|IA1PR12MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa9c909-ac2a-4836-3ed4-08de11db020b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6v9bhqTqzL8u3ql9GWwnI/BQT3czCut3IF7F98nHQxpiR8mxjdluiY6sg5lS?=
 =?us-ascii?Q?3s1YkyR8rtg9egruBMGcx48kK0NCB/XS1G15m6mHxs6YT9JquZuyt/HRbnyb?=
 =?us-ascii?Q?vxNfZX8IkREL729vDLMgscM+M/JZS0KOCf8XfHkI+boXzX6FdsUcsvzot76D?=
 =?us-ascii?Q?J4MrSf0Rq7hKsq56LdOqAR7Y2dgIawyuDZQjs88o8YZWzbbSMlSBJ9lQ0axN?=
 =?us-ascii?Q?nHgWu5+a2Bv7E1A1aPxp3jwkV/P+Af5MkOZqphZhHQq3fYegbqnxga3VXUmg?=
 =?us-ascii?Q?AsUtS0oyA9UebyIm3wOv2oXkO7O0rbKJQCHpszCfQr+8DK0X0lEGrwIVfDhS?=
 =?us-ascii?Q?pMznG1VCNbGIFPW4C7wzg8wDJTnBUZx+et1qgzFAx9sSB1sxguMlQ/VZ25wl?=
 =?us-ascii?Q?GmZW7e1mLjk7sss3cZmMOmb5KE2mgc9HOLONUUAiedANryovp9H5m/Aggy5S?=
 =?us-ascii?Q?8Ft87ZTEAdy5wYeaB4piip2yS/pwceAgMUMzMKLsQwbDO2ZUWR3jJHfO92D9?=
 =?us-ascii?Q?fSg9sN5Lu/7lPmdFUBt5bAfYe/0+kp2afsksAhLwYDfQ7DcCs10jkVVgZvON?=
 =?us-ascii?Q?FmcwxHYFNZKyKhz5lmHMbq7nQU6jWpPK48MQ5abGKCKcGN2Tb4et4udAYkSo?=
 =?us-ascii?Q?VU0gkHaBX80XG42iXG/8HlNoUqXqiBsjBJg7vKwce6mGfGcWvUaTgO4wzyuq?=
 =?us-ascii?Q?DHgFWZ81msH01iKWoKPhGguSzIyxUGZhEdKEawRBLciRY2daNwJ+2YBwiTR/?=
 =?us-ascii?Q?o2lYyWFjfXH/z4FCNoj68KZdmSTS6soT2+s5Pprx5X/sw1AZO69+W18eHBvF?=
 =?us-ascii?Q?zUMRgVnuXqv0BMZVQwWwVgdS8CXJl0wM/BPrNU9WsdKt56S7jCGehjgWLjsG?=
 =?us-ascii?Q?sm0s5fvCvlk6BjewMeHanqx/IR2AIpgSW3xS8roj7zzMNY6XW1P2jsyK4kg0?=
 =?us-ascii?Q?aClTIsWAh1bzqH1d4z7B7thZIT4t+AqOfRrbbHHhnBk9BrG+47otWSEhlCqm?=
 =?us-ascii?Q?V/JRqFvRkOZK9xtBkBOiO2QSe7sB+IHr86QCwkQjvBKk/ysFtkBVOenAU+Ch?=
 =?us-ascii?Q?rmOb/Rcp3PHE4/syxEkGq7rxp2IWoTUmMg1fd9LrPg7gFxr7HRUx6z+dza3U?=
 =?us-ascii?Q?M2qlLkT3wr/f1UFtoOttF99/vE+tSI3x/JKpjZmlAVM/2U8Q7IDXQM18nsqr?=
 =?us-ascii?Q?EaNXrIiIpc/CqgrJLG910dN58HnzddIvF1CdGLq0JRRwix6Eq1lAgeZX2Ade?=
 =?us-ascii?Q?AxFNWmDNGRx5TlEUzSdmysWA8PPx5kQt/wWYCTwSr02MYAqtkEK+IE1O4SVH?=
 =?us-ascii?Q?f0EZdxATBiT7aEqaYxK4S7I6LClcD/GDTsi0PUhbvZ5s51K9Ze8Vyd/3I8JV?=
 =?us-ascii?Q?zMIbZR9S3pxt02raMuKTcU3RfcueW80fknZJtaVtyaiJn8hIDnADOXfOEwHx?=
 =?us-ascii?Q?iOQQm1G3X0IGIy9TWvkWybaSecL09RFdamj8ZvSAyCBgzWGyfQLZSfwwVjDs?=
 =?us-ascii?Q?tjnG474oivcXQ7qSHuyWRstFQR8nqj+d2bUL7efLtKA7KnkbhhaSMvqflULn?=
 =?us-ascii?Q?z9ZE6tdkCfOSjBVlBBg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 02:22:26.1917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa9c909-ac2a-4836-3ed4-08de11db020b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8407

Since the core now takes care of the require_direct case for the release
domain, simply use that via the release_domain op.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a8b46b948f05..2125ebfc9a70e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3582,12 +3582,6 @@ static void arm_smmu_release_device(struct device *dev)
 
 	WARN_ON(master->iopf_refcount);
 
-	/* Put the STE back to what arm_smmu_init_strtab() sets */
-	if (dev->iommu->require_direct)
-		arm_smmu_attach_dev_identity(&arm_smmu_identity_domain, dev);
-	else
-		arm_smmu_attach_dev_blocked(&arm_smmu_blocked_domain, dev);
-
 	arm_smmu_disable_pasid(master);
 	arm_smmu_remove_master(master);
 	if (arm_smmu_cdtab_allocated(&master->cd_table))
@@ -3678,6 +3672,7 @@ static int arm_smmu_def_domain_type(struct device *dev)
 static const struct iommu_ops arm_smmu_ops = {
 	.identity_domain	= &arm_smmu_identity_domain,
 	.blocked_domain		= &arm_smmu_blocked_domain,
+	.release_domain		= &arm_smmu_blocked_domain,
 	.capable		= arm_smmu_capable,
 	.hw_info		= arm_smmu_hw_info,
 	.domain_alloc_sva       = arm_smmu_sva_domain_alloc,
-- 
2.43.0


