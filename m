Return-Path: <linux-arm-msm+bounces-78429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E9BFEEC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB12F1A04084
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90812265CB2;
	Thu, 23 Oct 2025 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GsSxtGEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010046.outbound.protection.outlook.com [40.93.198.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4892652B0;
	Thu, 23 Oct 2025 02:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186166; cv=fail; b=Wp4p7eA5d4iuKVwlE7BpRY8Xui54RoO008hx1e++O+6xy+wMT1VcbLd94Kvq1ws/Ws+eLHAen6uGD4dGDKWkLXrn9lGwACVspF+2vkdScQyY41TQS3qUKmitVBXeR+KTTXfSBxZmOhfJs5+FLgqYH2vNHkKKMsWm6GxoVC/36hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186166; c=relaxed/simple;
	bh=H4EKPXRl2G7sjHhTZQquv1DarkCv+9nKO1k2IdWmw8Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFMDQFI40S6WeohMKnHTNj50HYjGZzB9rySvsI1GyqoxEEDJ2HDNHEy7pbIHneYMaxAD/Zyynsq6VfABS1U1Pbq5iu61/72ol3z6b0x3jn6gPcy+ZlzxHHVuPasg4DvDaNezi45I4+Fl9J86MV7iYViVxAW8yKn3DCnZLrmj+e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GsSxtGEL; arc=fail smtp.client-ip=40.93.198.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPUwM1B/75hYdL9SKAKnVCGJ+qbdcrcsdDYB7A1kuEY3gwjvocfdSSqsTAkcrh38/mh/S5leYqpW+ZmI7hFfxfhIFT0R7iK8GxkvkzNZg3yD5YWiCe12DzbajH4cZsAqWab2s3Cu9gLxkBlWznsD70k6e0qszTLD9I4TtEDp61v2Uj1gCAMBl77fTcue3+aQGcV8EILGOW/qEgL6c6dn85S4+5RIlRCP9zRaCOe4cug6yvZOsQxxPjF8VLQ2Hhdbnsoks28nO5DODJsp0o7ceBzEgfpRdlaIRKz66kx+ERPf7yRm7Tl94Qp0XrsLCFVYUljPS+WX2nu7YGa+5XUThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IAqkPpzlI39c+XOL4gOyv+nhwrtGEJ11u7XEkesv48=;
 b=l6018rCuJmazoRIXE6i9Hya3gCgaL2Dp8jW/DOP7O2NsauH3Gb6awZw33/ON/k3+1SGXkf4xmMvm0Xrm0tuvKOHhQeIT133mD/IHnS2+5A91T1LloVQAW3iR+dL5yxHOqn9pXrndKQtnZpyy914X8+3dCsvXhg3VEzWDQnYZwwU/g4W2WeoTk0Q8r48bsxWP9enMoAhK7vz0KZhFc+sT0viYSwEQFvrBkj2a6ambgDhgIG72XqXn8EdmvfnYNSO4wwRRGpV9VKxpZH6opNmc8yyUXy8XIA7AJrUau1k/v2xP0c3DMssTbEBPFW2MdLT6uMRIgxIf8+qIayaU3aTg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IAqkPpzlI39c+XOL4gOyv+nhwrtGEJ11u7XEkesv48=;
 b=GsSxtGELcFf80EfENUuJD8bTNapyHjUMLjZ8aPVqUGUCp+lVK8uFpJjQGYPCT0bTSvOydhYYnYgFGpKUKfufNecTGp31yE6ZYN9YEmMuT9wXK3gMVGpgkXMA9wDdxles4HN01dYH2N7YDw8vGZwRbdYXWC4+6wq4/9LSCYzhpAIjeN+ti6oHZhh55NxJfYL9NOFOd/g8vTAbLBoqI9mYRZVUa029zvVk54DGC+cwNOmkdgvZlNkCuG6r2l9nZhew1DA+Q0b6X5KzSDlz+9V5ggueqm001ERKT6kSLlqRxrpYWxTB2pZCE88YoKmMWVQmQnqLjlnDqY9OmTfsgAhwSQ==
Received: from PH7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:510:33d::13)
 by MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 02:22:40 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::f3) by PH7PR02CA0007.outlook.office365.com
 (2603:10b6:510:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 02:22:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 02:22:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 22 Oct
 2025 19:22:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 19:22:22 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 19:22:20 -0700
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
Subject: [PATCH v2 5/6] iommu: Do not revert set_domain for the last gdev
Date: Wed, 22 Oct 2025 19:21:08 -0700
Message-ID: <276875013de662fe50f3fdd9e9a5bfbc0f12602e.1761017765.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|MW3PR12MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fc1f26-80da-4e57-258f-08de11db0a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xbgODF92GR+5qY+LMVM+TDSaqi+VrtHJ2pGq3cQNHSBmn7ImMg7trfJf5emG?=
 =?us-ascii?Q?9E5SJZfAQvYzP5pwQ1t5tTbsYXNG7/AZw1Ae4h+fvJsRGUNx0EeJ2xEWQXSV?=
 =?us-ascii?Q?HagHTj69Is5nB+jIBjpM5QxoXXW2GXYgRO1B+/J7JQtFODIBV5ZSxFQbTr4d?=
 =?us-ascii?Q?Y4sQGxTffIc6VjSkrj4/IeKa03CeF6Xjb93+6qlmU4ywiI/ZqTRQ4pdsfaiA?=
 =?us-ascii?Q?DajZi8V2vcDcBqdHVatc1RI1MudAkjG5x656PAgOm8b4gWIbbizMbFgsRlzR?=
 =?us-ascii?Q?6+M/Taltf/ZB9AxTkyp7q/2/OAWnYOtm6Ba06QNzwhYYMHcPjWE9/HV/YjiC?=
 =?us-ascii?Q?wGnW+63XxmXeR/b0kaV9JgqJ8D0FwRhTxyAoBQS5bzA4ydLksoE6ozVJmHKn?=
 =?us-ascii?Q?Zv9wwlbjRwY6MQTWpY3+U8lVbyEP54dibHiaiMgOwarvlCfM7PYxhqm98EH7?=
 =?us-ascii?Q?XkEtcPx4D8CNb4oDoAIMIWUBIzNHCtqoF4LcXFuVF9aMLx1y3Xe8r3yIXWSJ?=
 =?us-ascii?Q?i4QDkkxUkGxxZ+uFTix9IPO/1TI5CcUSTQj0PSbuhzeFlL1ISrvTpuW7ANRS?=
 =?us-ascii?Q?36UmzvKN0Mbdh/Fdp/RxiXhwgXlmp0GYsXE04rfcOwwMXpuLrIsWLFl3EKF3?=
 =?us-ascii?Q?0AgjmRWSfaHgiMoOxBvVfoRDD07iGeiPglGWMpgoQUo8zM2a8oa56bXgmly/?=
 =?us-ascii?Q?8DJ7P02RVnu4HZtL8ei6O0ImnlWjy4VxNWmeDhX1T6Nt49Zw2NOo1SW4ccLg?=
 =?us-ascii?Q?Q3DUEaDuwc3xForscAq6dhry9TqJw6wrlQt4GUyTNDQiPBwRTESNVSW6gTuE?=
 =?us-ascii?Q?k56v6hPY8dT3XajeaMbII5YmAL2GrRTL3xormnhHxj5jX4WtK1IjP6LI6UD+?=
 =?us-ascii?Q?Q5mpcF9yENiA+OZq4IXcLMQTIh6k39escrY6/OBphLsKEEqeS7JGuENE9+QV?=
 =?us-ascii?Q?O9Q1xlmwlp2H4hIc70tBQ0MSehOb6794x5HycmCu1Cl3nsd6d5Gst3F8Fmfm?=
 =?us-ascii?Q?/c4l/m1S6odCNO5DbDtyCJwWbNhK8MJ8xMgmZVeEok7vvpRfVI5ToEP6H5uZ?=
 =?us-ascii?Q?r98OMht6lSRSv/PagOmijDHH93m9ov2LsbqFnSJApd87RK6j1ybS9+hVt4Zc?=
 =?us-ascii?Q?moBSZsi9NL5ljn9ZQbPPve3SLG5wt9Bg2AKA9nyHF+I3+pZrnf2mul/BnKvM?=
 =?us-ascii?Q?ncoIEkmOceHEZLJELV4u8wsiB40ZsksBZmjahle8T1SjXA41vRZUivwnEA5G?=
 =?us-ascii?Q?T3N52EJTvBswJoaM4cl7fKqdG96OA9BfZXdTXxlPxvaKsQAObXkeWhk9w2xh?=
 =?us-ascii?Q?rFwzSNW7phHgHtdRdofcSTEq0jYDFoWzmt6InYATBfWOZ7DAHOw7wT3IiFDT?=
 =?us-ascii?Q?whM71cOVExoZaLx6C8UiUxiCp0agsnKWCRPbnHYmEzyrx5S1Xpun8Yahuan6?=
 =?us-ascii?Q?qvA+/WIxRDwGWsoRhxm0rSZY5Z3CpxX0kxMvzHJ4s0WUDlV70M0MopkXSq4J?=
 =?us-ascii?Q?/JVCmwP+Xqg1wfd5gk4TdYMZ8y118QNBejPnHvW4mnEDwzunJl8XOXajFKgt?=
 =?us-ascii?Q?asH8Z+A+apf5AmlxP6g=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 02:22:39.7542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fc1f26-80da-4e57-258f-08de11db0a22
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492

The last gdev is the device that failed the __iommu_device_set_domain().
So, it doesn't need to be reverted, given it's attached to group->domain
already.

This is not a problem currently, since it's a simply re-attach. However,
the core will need to pass in the old domain to __iommu_device_set_domain
so the old domain pointers would be inconsistent between a failed device
and all its prior succeeded devices, as all the prior devices need to be
reverted.

Avoid the re-attach for the last gdev, by breaking before the revert.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index adef1a37f9311..ce141f095f969 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2403,6 +2403,9 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	 */
 	last_gdev = gdev;
 	for_each_group_device(group, gdev) {
+		/* No need to revert the last gdev that failed to set domain */
+		if (gdev == last_gdev)
+			break;
 		/*
 		 * A NULL domain can happen only for first probe, in which case
 		 * we leave group->domain as NULL and let release clean
@@ -2412,8 +2415,6 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 			WARN_ON(__iommu_device_set_domain(
 				group, gdev->dev, group->domain,
 				IOMMU_SET_DOMAIN_MUST_SUCCEED));
-		if (gdev == last_gdev)
-			break;
 	}
 	return ret;
 }
-- 
2.43.0


