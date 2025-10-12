Return-Path: <linux-arm-msm+bounces-76880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3DBD0E07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766533B7777
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 23:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF762F25FF;
	Sun, 12 Oct 2025 23:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tO8hvCTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013019.outbound.protection.outlook.com [40.93.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75442ECD1B;
	Sun, 12 Oct 2025 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313489; cv=fail; b=DIF41CgmCYgm/rUEYvgqcfBjRiGKJ84AANAlISZurk3nIXdVqlVZON6I5ov+IkxKdZ+oCpiItWLmK+DsIL8juOvDRd1sM+z21Ualm2n4A39B41oCRws8hpjmjRC4S83BCT5WoGlRaClxv1lkn9kMzRi5U4vpI7fjJNjbip2yEoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313489; c=relaxed/simple;
	bh=QiGloiQps2rvVKK8ogm2wOMu51TAIAw968Zu0/+1fbA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plL0t9Obm9EfBut8YwQzopLx7rdoOVWqShFY6mYhnsQGCAxmkY3VHZzPCGWdkhjWY9Bdpfd3rDZADkWG5wCOLdUp9XCZpYYODrTZl7bWoWGcRi52iDyGQ6v6VKVixQeEvhVP6KkwhxA6oLSowmCvF9LMmjXzJGH83597HSWtPcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tO8hvCTo; arc=fail smtp.client-ip=40.93.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhYA0cclAYLkqJJegWvVcUdpXkFe4k/Wghz9sd2prFvc6sEWU20CVgJfQBaWG6irLz3dYTTon/0FMxoTCic4uvcJ5VGFoYQM2LI/GZq3N93ph9PtbDwE4+t1HVtIIy+cK3coL7nbahzxpeN8jvkeq3NI3ijbDUQvjgRA1nAZY9MdDU9Upy3kJVMO6ZxIFUWFd09WPbdiZgxwHwGXZciVdiALvR+ULxbQaovB4CccA0TIi87qcovUaTjOS2aC0TmKmq4nYgJPEISNqpS2g0NkD3D8CbtTG6ReMkWB2yEYDbqxOKDBQpwKxmdvd8cLEANtRY5GCTh2jtRDKOnXqGggVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YO81xLfBndPql3ksnaEhkhGsOl6ICC/aKHg3dvP550=;
 b=jYcQ4c12esDRwAiE3nrv2C6RxHlhcRnqEam8pwdGHOJxE2HtC/8slPGJEuOrkYhzmXD1mUO+DUQeEWkvFboxvUKPuZuBb2JWdjoOQb4IE6a7xy92/IJWPiSFFE7FApgqt+QK2i3ohh8QAYqVqGatuwh3YL8kc1AFDTHLq/XYtnAhVpdspGr+VfGDm+hHeznkU3SFs/qTuvs/2vPx6+xVvkcvnC6B7yCcKYB4CxSejl4De+9NDBFgOy8GeRaZeAFZegxPG2z+I4O+/A/aPCktAkvgb4quZS1w8v+fY4zSlrzfYyh8D45skXaxMmRhXmk7R1d26zXuGwbtUhbZYl5Nfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YO81xLfBndPql3ksnaEhkhGsOl6ICC/aKHg3dvP550=;
 b=tO8hvCToYmfoodfnL1p+yxG/vZXdBM1s9bC6QkfCR9YqRLnmtlXNfYXNEHmQ2rnDnXDU8aAkjuPOvd7wNldleXPAGwRJIwREWx72TOWuBj/IJntQk+IUbyZV14g49IBkNim6/N7c1DqhAOJup4nOcUb2R2cMzdhiGIE6qb29ivOonT6ygOWHa3WUa3XTzKOQ70rlW6TxR39YpPfHoKfeGPRMDFy3Ous3T6WuDruV5KI3UU4OauY4cLVVMbj3+HJ63Wa7aUiVjCJjIWLK706sHUCngnf/x/x077iEANbcIbdK+eTPOBKfBR3JmOKDvlcqEP3eBIJ8wdlWE2V/6N6YWg==
Received: from BN9PR03CA0502.namprd03.prod.outlook.com (2603:10b6:408:130::27)
 by DS2PR12MB9710.namprd12.prod.outlook.com (2603:10b6:8:276::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 23:58:04 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::33) by BN9PR03CA0502.outlook.office365.com
 (2603:10b6:408:130::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Sun,
 12 Oct 2025 23:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Sun, 12 Oct 2025 23:58:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Sun, 12 Oct
 2025 16:57:55 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 16:57:55 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 16:57:51 -0700
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
Subject: [PATCH v1 2/6] iommu/arm-smmu-v3: Set release_domain to arm_smmu_blocked_domain
Date: Sun, 12 Oct 2025 16:57:38 -0700
Message-ID: <cb0cd5a2d8b68dfd77cf9b94168254f3ae62d8ac.1760312540.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760312540.git.nicolinc@nvidia.com>
References: <cover.1760312540.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DS2PR12MB9710:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be9844b-6c84-47c3-bc2c-08de09eb2ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?63MKpHU8NWs2W/EIQISFsk7cEb5y4JsdrFtiG4yVBXqcVfign3zR9oxCao6l?=
 =?us-ascii?Q?u1QwMfQpfi+AJg9+DxigiQfYzgHSFd0eJHcBeAKj3g71l+Jh28CtznV9+JNR?=
 =?us-ascii?Q?4pzV25LISoOWuB/DEH95MQKDM6qBwgqtd23QHOzreoxOBm5vS9JC78WCWpZC?=
 =?us-ascii?Q?mGdORUGqhx6+zNYKLv6JWPyzA/7L3SbZPTpC9UJycwl3CttsgW+BJC8xmhzO?=
 =?us-ascii?Q?Eq8oyPKrNZXLju5o7WVOOGPnEOb0oPA8TkIPNtdtUSsj77Z7gXSeHk6/HceO?=
 =?us-ascii?Q?GwkfaFY2rPFya6ls1Xw9dBe/vzshXo8QrBvQMU1E1TjlEf0TTWmsEiKLX+4j?=
 =?us-ascii?Q?z7cTKRCPGp8MCgwikZO39zSbZF6sGDyDUfjCll2PVqawYRTBuZynjeI12jqV?=
 =?us-ascii?Q?o6Tu00pGV4Uv0hcn8eAZPy8+fUz4P7MELhS6mopQM8w/knLE2PcuF6u2YnIa?=
 =?us-ascii?Q?230CfShQp/sfGZ9Ky2wLh9Q3km+agXOJDi0+jGH8/Vtd2Tlu56ee5zfPwDx9?=
 =?us-ascii?Q?qFfGVnCNJYzY7Dgiis6DC4hSrEKWfLEqybBET+Pd9nkWyqv6UIlMjTmwJnUk?=
 =?us-ascii?Q?/BtHOf57XirnNu1jLIxqswPOZCC/Whk21+j2xpk9lOfGqiHuqqbtMo5AZ8CV?=
 =?us-ascii?Q?du8FRirzFBQXqC5flqLP6vplhai+pdsJ43IlZjTGVlqJbJJa/e/q3Vo/04ES?=
 =?us-ascii?Q?DBPLvdAsmz3W0a5vMp215GsFa22hemZSX94znl4S7Nj7dkSQRI0cdmG+pP5A?=
 =?us-ascii?Q?LAvQ99osFjJ2f4yBX+rkBbU0mxDgsRMIvUXhSokYP/gIR/C+VnJsg9QGFGo3?=
 =?us-ascii?Q?w7Y4wLLRpaHNrxqHIYWbr/0//BdIo+JT31ov9Xrpd3K3EAWzJvUhzgFTIOpD?=
 =?us-ascii?Q?2m+SNJylM4Tm6f+3zksndD0pqOSp0FuGza1Dm2irJ7AMfA/bG2ShB3G2i8m/?=
 =?us-ascii?Q?apBm5mQiCWAW3LHasqS3n6mREDXQGxnCsIAVYwdEn6HAqm7q0GDnbMYrxYmw?=
 =?us-ascii?Q?4Cq+LiOjQTvT9bzxZH+6omNl0ToJXiKSrbNIDeEan4m6D2Bw5Sb4Dqrfa+9c?=
 =?us-ascii?Q?HKa0WAOCbFawZBZVsRlyWVx3+VY/d+ZBVnBMkYE6HXjvmOKcniimj9Do6Z4r?=
 =?us-ascii?Q?cnpMKIanM4QUfKyM4Kagugid75Pb2kHDD7vKk1HNvSIc21kfPzr6cOCT6I1X?=
 =?us-ascii?Q?Wz2F9LsDwEB5inOFSpCt6NviTgdnyKrn8zPBAoMR3so/jzIpiEp6/H6iKmJq?=
 =?us-ascii?Q?z4aOVW7a2VYT2NhsFDopeafhiCzw88YvgkWIDEoNiBUYFQ0aEwOzq8zq+87Z?=
 =?us-ascii?Q?0ZlxNlsDiA5zk1uz2Pu0wn7PIQdUqfI1ZyReFifQxDT8fmSbNRoSZJK/x1VJ?=
 =?us-ascii?Q?QfZVKOfltmigpOE5djfl3Yd9yWsKLntvBorHp64Rprxpn/bbxucwzhlLqg5o?=
 =?us-ascii?Q?RUQweZKuaWt/EAhX4YuqdLNdg9LV21lnVs58mm2kt10E+97fZYqJhSSHHR5V?=
 =?us-ascii?Q?Z+su6+d6Ng+ZU3ciK4eK+vs0iuKe163cySneGyF0tTSEuHZOJbr2e0rkCSUn?=
 =?us-ascii?Q?6C08L1JsJeib49KwlnI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 23:58:03.6020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be9844b-6c84-47c3-bc2c-08de09eb2ea1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9710

Since the core now takes care of the require_direct case for the release
domain, simply use that via the release_domain op.

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


