Return-Path: <linux-arm-msm+bounces-78427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D54BFEE9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 418D2352D89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDD423CF12;
	Thu, 23 Oct 2025 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O/14tXr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C92147FB;
	Thu, 23 Oct 2025 02:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761186157; cv=fail; b=KozkqM3TC2Wq2sh9aSQnFSWSmGVD/Vbaflk40ArSTZXsWkQ3kXGjnOi2BjhnwsCd5JMd04Mk1j/g+j9+kHo89JpxjDa6C+pr23urQ3okTHHO/6YdHJDSgKpcMpjJgxHxbTlD/MsyYw8hi8SqdhoJkH6N1RARplJlG5zp+4VVkbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761186157; c=relaxed/simple;
	bh=KLy3Jeht/hYGl44qkDbZQkcaLWaRcjvKHRnv6c+EqLc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oq5hV5+WrNr8dARno1ogxpBjRZEBmhrZ2NKgrb60PHkwzansKBs7lA5PgDaL5c6Z+QJttVhBethfxeNKigfzJl7eHTLS38Bqg0jauYtfoCWIUShL69E3GhsJGM6WO8mO8BrOhXdSHrfbV0+jSIg3EfN7HJtJg01UIs0gQOhlX7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O/14tXr4; arc=fail smtp.client-ip=40.107.209.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bok+2G+mLYWvYOVkto97LNQLvH2yG5wZx6mqru4/TfpEeng+lqgKKkpPDkZXqLe/D6fUGZirXEpFmBPCqyjdQvc+flDT7LrI/mau5nsDv/w0ARO9XKBz+meZpF7oOkinghXRsu5ERtiGLul0SAgrJ1QA/T09Kv5YR7hr9So5OQ+kKV9eD18+Gik/YEDDYVUCOyyqGA5qKIGf811GZYDw7Tge0Jpx6JnXac0Et4v02AFdvR4tw74XrU6sMtJSbZUm41CxknzZ9/xG7YrbCDa/pNfMC8kupqSG4Z+h3NfZIzL1Ln/tZML5qaVcoN1TkOfH8rHowsIJWXm8DMmvkBllrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp+TuEQzjklMeVupU6b/RAB6IdU8vDVmQywKaJbpDnI=;
 b=JFxcBdjv7WLji8/Iqs9L7xkKi7fSmNgepWNOZZTgo/eH4r20xOZEOIzijfzZlEhU1SrD2iVoWoKWKw7nEY3SaHClLyoTB/lXuu0PF3IS1d+ZZvrEyRv2FkmJWIQtmFQOJ/cTa5Scl0o6JAdb06jSI4IZLEZnGCk2ODs0PtfmVDCaD6lNiJE66uwKFJfaJ0bdrlyjfpsIGGZdNl34oIB86fNhAJd6foI9nHtN6oy9HJRl/0dJUsNbRcKZnmq5OUsubt236AeIyTTP/w+dkmj3VZxpWBjocnTYbAIfA/J+qH5mTwvZZRMIbjtkz6lqz5I3Z4Liwq8NemqON4eNj3nWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp+TuEQzjklMeVupU6b/RAB6IdU8vDVmQywKaJbpDnI=;
 b=O/14tXr4yJ1Dos1YrxME9799bd8lCBYOShn77NBuuIZyQGZ5M/USu99CtmryTlZwOM8TDERYvhmYTgcSguUEAHLRXadmaFw9A72oZK4vtXrBIpitdMFvN7aPESr4gEajIKPlY6MoWJDQ3YI1HEmHnHjicIIEdhSJ/4yIRCtv6OEEeUaETGRgCc07tzGL3cfhkSECTsA0zQnMGLNvRGAIZcXgliaK6EAjgAaAgiaFKHf+IhlPZJdCeaOTYmnOTV8gG/cf+T1XWPTL28TbBUnvO24UCv3QZZbLUzUd2p/MyxiGhJrt0boC9h3D5kUO/GEOAV8jkBFQfb4wFGzBLoVSdg==
Received: from CH2PR12CA0002.namprd12.prod.outlook.com (2603:10b6:610:57::12)
 by MN0PR12MB5954.namprd12.prod.outlook.com (2603:10b6:208:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 02:22:30 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::20) by CH2PR12CA0002.outlook.office365.com
 (2603:10b6:610:57::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Thu,
 23 Oct 2025 02:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 02:22:30 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 22 Oct
 2025 19:22:17 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 19:22:16 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 19:22:14 -0700
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
Subject: [PATCH v2 3/6] iommu/exynos-iommu: Set release_domain to exynos_identity_domain
Date: Wed, 22 Oct 2025 19:21:06 -0700
Message-ID: <602e44ec402ad6b1dc6c3d3894d90c069093522f.1761017765.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|MN0PR12MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 662bd2e6-395f-4621-c4b8-08de11db0479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?76Dpg7YXch7sc/iWS9jAm3YZnkyhQ2TKmle0o+vzRFqtFXk2QnFmTIvBfo5m?=
 =?us-ascii?Q?25kssGmniFhgJT0VXCZcMMWUnBBmsv9rBi4z/jnQ4BkcuFCaG57tArDlkKnx?=
 =?us-ascii?Q?zCtg60dIZ3fAJBu0Ti573+YtUhy57IcTd15d5+e8nWtQMKdbVGa5EvZ3sHvw?=
 =?us-ascii?Q?5DytxG2np53EBYZ29GHh3n9GaHUP8dPA+Tu+7xocmfHHdHIWl9VkYvu4x9SG?=
 =?us-ascii?Q?p+zKFmD/vdoNC3zT1v1/lAwilIbgnJUWonvXrJwMaKThbrqsDAso+pBifKin?=
 =?us-ascii?Q?Kb1gj+Rk28jhTh3BRuHzcgGZMAbdQIgrX2idLEcdxoufjUa1c/rjbTjUqDi/?=
 =?us-ascii?Q?0p0kZECv1LFVst0/12/H2YXEzYs677E7zmikxhuwsScr04o4pzNoj028Xkfm?=
 =?us-ascii?Q?MBjEVp26752k7oJWbu0La6SWBPGrbHrwioF7BBzUguWHd/4I3GofJezH4la6?=
 =?us-ascii?Q?WYjQ75Ig/GvRbEeP1eD8l25VprP9LmLJfPhOGo/gZ7JZPcRaP7NcFlwA7cZF?=
 =?us-ascii?Q?KFZR3kSsfefW8BvzTwvzvHCnMu/chAjDzLvmysd5t97u+QX62IL8qn+HeL86?=
 =?us-ascii?Q?dSU/lOiDa61+D74GpDALt0HXeI/l5l5eWoY2Me0PswwcFe8MFtI6G3lIPNT3?=
 =?us-ascii?Q?tqlKHmwNuVYI6XqjmSNcSzd25C79knquiOqi1PaVs49r3F/VzWDUxgr8GqgI?=
 =?us-ascii?Q?7xr6Sp0NAtrzHAbv/+1bx31oLcTHWKRUBmQmEOyi2QQyIVKKkxoa0VrQnOaI?=
 =?us-ascii?Q?1wRwJtaKSxhc85GlsHOThOAKmOmyIXZGeO856UXKEKAfacZZhI+GHQorgUY5?=
 =?us-ascii?Q?6yZhisr/JE03e4jE45HvmMKg7lGtVfgHgzLb6RqeicjVXjkkw1ovP+hmH8se?=
 =?us-ascii?Q?Q1Hm/SqQsaqL7eT6xgoY1jI+X/U38qS2XvY4Qx3Ylph9zO5Y9+jDkpjnzGkJ?=
 =?us-ascii?Q?mS2Dynz8wmg4ORJLc4MWfgZndA2eVtZI9SeUi9DeYNBWf9Wk3oiuIWZbqYBe?=
 =?us-ascii?Q?UTJLcdr1dtZywbv+WeXJ4Rr60YcV4MmRPWHAyDenbJ79UrZcmKg9X/iZfyBN?=
 =?us-ascii?Q?oywJSmCrJiyUDlKrb92DPmpdCzzelFIV6X8u2UTaiRm1IDFI3VxPuP/8pZ5t?=
 =?us-ascii?Q?+eyThfNMqtBpqYRThPnb+mhs+JmKd17lZMQhpQFhA6oidsNgy8oGdrATYJ9F?=
 =?us-ascii?Q?x+tS6/cNJ+pnzjQNnv42dbzF81eLSczcp5xrz19s3qihmBeOAeqMSB3nOJLT?=
 =?us-ascii?Q?CP87jWVkZXOOMx7PB+WHHvp/adenf9OySpCEEuYTExxspwg+ALfxnTzCVXZ/?=
 =?us-ascii?Q?AQm6GgnUwNaH207EdT8/n6e0OAdzGg8Givj372n5h06aYePMJwVXIZMAXElW?=
 =?us-ascii?Q?WUuMIaCcbknrwgV/NWyoo139zxFkELHJ1V7d8hzB/texUXlf64Y6ZsWu200d?=
 =?us-ascii?Q?HTvRNKSFDgi2euaQ3xwjZHhnO9uBd4sBuaALL825XurykDWnjDUnOpPjzZjR?=
 =?us-ascii?Q?mhgm184+EZXqg39LnZC2yohDu8R/l3osyHIRk8NcnCesf1niv37KSLM2eulM?=
 =?us-ascii?Q?RNebi0qFuF0crWADRkE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 02:22:30.2704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 662bd2e6-395f-4621-c4b8-08de11db0479
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5954

Following a coming core change to pass in the old domain pointer into the
attach_dev op and its callbacks, exynos_iommu_identity_attach() will need
this new argument too, which the release_device op doesn't provide.

Instead, the core provides a release_domain to attach to the device prior
to invoking the release_device callback. Thus, simply use that.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/exynos-iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index b6edd178fe25e..0857519ca7188 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1429,8 +1429,6 @@ static void exynos_iommu_release_device(struct device *dev)
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
-	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
-
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
 }
@@ -1476,6 +1474,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops exynos_iommu_ops = {
 	.identity_domain = &exynos_identity_domain,
+	.release_domain = &exynos_identity_domain,
 	.domain_alloc_paging = exynos_iommu_domain_alloc_paging,
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
-- 
2.43.0


