Return-Path: <linux-arm-msm+bounces-76894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE8BD0EE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C651B3BBBEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB8C23AB95;
	Mon, 13 Oct 2025 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PYU5Uh7t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172D1224AF2;
	Mon, 13 Oct 2025 00:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313976; cv=fail; b=bNyhjXek2hWpE2+j1mtfWqDh6iTEk3KcenvesVHo0MuTKqrSslPWuNNuvkCAIJNL5DI/QGJrgzVmoy7l+v2agYmHTpVDBWcxGVygfrF14CjxW9qQOCOGMapMVILnOfeRTjTFPSJqGZsBfdZnY6LmH78CR08q8sFL5UhOvGXeINg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313976; c=relaxed/simple;
	bh=H1kJOvUqQKkvvHBTIcEhea6V9fI9weg+pZN682/fLl0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ufFDcFCUHlQGCbnPhDzr9Lyrvklyh3lJfwamhxlCsHDds2njZtmQEQ/MOLTNkml+ab22NTEPf30SENKynq3mtTJIul1sVhhH721wRbKtdou/AjmzkUKoPifIrLfywAxD+QHQvLLM2TDw+93jiuxzeY7ffgzAZOLlmAXsWflGL7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PYU5Uh7t; arc=fail smtp.client-ip=40.93.194.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oh9QEX1bZX8qb4U4zz0yzzP/h475xKQwP8Q5I9kHCyWx5DH2h9oId0PQbg5C2OSZU9oMrzMAZT5Ewb4WCqbskK0C6Xq0gsw+1rQBDV4Y+5AJaDxWNHUcxSR2E9n6LVyNCbUEUwN7vhrC1zEp2huF+9daBZirih7b7O2S9qw/FWTEbA2NAVy4jxi/WsihiO53rM+wY8aGyfn5WvWVSewbL8yOaUNaNIg/c0LzIYO/Bo00JSvWNkgcn9hrCADIOeXW7Z8JVizVDhgQe6jOcjmk4VDJMnPCV/rhN5jivBqwzcp2DZ2d5uspPoNepzEQqGc8mMdWfIZdH69FxuACsDwCFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YioBw1WbGEC+USnAlNalOR5OqCuY+pO45w5wjo8tnec=;
 b=qRpCiGecdrbeOQL9LTV8GOPYCT/ieo60Xg3qCKTcRbNQOZtRZU0cqhG2odGLWUU8RA1OX31IrcqZKBepbK+NSmV+g7sHZFp8u88H5lkLMa/1WRXy5ZqzaOpa1AmXmzFU0rITck+peNR6+P+rUFXr8Jf9vuc+syDMoWY4tprt/DdoBaFYQ5ZUEtpjlJfV+oqZ0ZB02sDzwaNUk20Xm5aMyM/XcdqYf+NSy81bI96kvC6oOrZEMEM8gavjpTOjNSxo7HrykrMWIf00a/RRRqRR142xdlilffM7vIa9ly4jbLuba3mprLjHmIO1JUAfM1qoXfQrQ6dDLi39WRD6p3Z3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YioBw1WbGEC+USnAlNalOR5OqCuY+pO45w5wjo8tnec=;
 b=PYU5Uh7t5s5XbZ7gDwwjZ99MMaCEScrTnkK+wf8vqENBX6beq/Puv9eOrGETa8TsRVcJAvCnJTyATapqah/hDoagjfzFH3C4JXcPKD7jASNp1oTDh/UZ4BVfjfD6FGbt07JslL1IUHqiOtJHCrGSl8HWO9BIWGHU48uxCsheMUq20cKCTiTPUnTQGLLyp+fcgje6DiBVzgqLwH7M5bu0b/j8ygkMVHzHcylyaP8kXmGHscL/WQFml3czf/uAPIoWMseC9VJOrB/aJ7PYnCHjBLJGnv4QwwpZASIWtzCGT7s0BF/Q0yum3p2EAjRchGrGoNKV0gaEuj5hXpM0jV81iQ==
Received: from BN0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:ee::20)
 by CH1PPF946CC24FA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:06:10 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::52) by BN0PR04CA0015.outlook.office365.com
 (2603:10b6:408:ee::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 00:05:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:06:09 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:06:00 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:06:00 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:58 -0700
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
Subject: [PATCH v1 12/20] iommu/sun50i-iommu: Implement sun50i_iommu_domain_test_device
Date: Sun, 12 Oct 2025 17:05:09 -0700
Message-ID: <3f3fc58f88c15120d278f278351acda9de63bfa3.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|CH1PPF946CC24FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 707bbbf8-04d5-44fc-8d33-08de09ec507c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ViA3DslpBT9MgQg0MAhyGB4qp0zTjsdx2nSq6zjvmMLABW8P3A/pGpK/MPKt?=
 =?us-ascii?Q?NZ86fWBX4x8eT1iAOLZWiD+SsmpC8FESUNx2zpvgzk3W9WE+hIFSsfeJmp1X?=
 =?us-ascii?Q?Hg7RNZHT724O2d/z3/M8eAI9aM85OIxXFqRS+oGiKSrkPvSORqeMPRwbqEcG?=
 =?us-ascii?Q?BaWkgqJShmjw8xl8OcV/l2PsAqu8EGkniRIZ902A7Uatfh3Sl0e31Xq79Ybm?=
 =?us-ascii?Q?LmTlLOpnZT8y2K1f9OjrvWhkyn7yE59UI+UedE2o0bo2kzSne5QnrMRl47hx?=
 =?us-ascii?Q?UodbVTIVj5EtqfDuxz63orWraHCtn3gE1x50KhHGJhXYLjm3VZs5cF4aLSMA?=
 =?us-ascii?Q?Tn5cLl6am1jdvTOc8ZNwjXBLXLrn+4fiyGnRzB5wkWfXCc4FkwIt9myS4sZl?=
 =?us-ascii?Q?guDcPDNGV6Clc7Npk98ziwqxJjiWSHn0t20z+vPdn4PDfRk+AH5sSl+S3L50?=
 =?us-ascii?Q?+bUEsUaP/kxGJQZpXTwOa8LbGBJ+NuVzoFkOwih0qWpZb7tDXv+K3bWzUyha?=
 =?us-ascii?Q?LOdj/F2IbbgJ+ngqw2iDkRgylhSlzb+RBfeCju11/vXWlA1rktqIadKyWoXd?=
 =?us-ascii?Q?oucyP70BHVmcvFcPvSthT3Dxz9wEXl8fyfB5WzEKmK+cYa25IInweSRnvn6Z?=
 =?us-ascii?Q?8K0tOfDa3XCjU9mrMRN1sPNsOqgN198NTEclpuBtAxqt1qPSRUUMBm88cFtk?=
 =?us-ascii?Q?nL8YJlZJeWH6178MER/UrWBjnu2nlGhQbA4g/+7gzRMH6ZC6lgmrRekwV/QU?=
 =?us-ascii?Q?vZIAtsmmwDAZhNfnjGjcaifqbShmm4HE1zZE9Uk0JQvyusGjEK0QFCA9fQqC?=
 =?us-ascii?Q?rEXpcgWfL5b/CwaN76RNq3TxJcBzOnhX1rkEaz1UUw8hsRQcOeF6XYnyMpTE?=
 =?us-ascii?Q?2U8/9a4/tTT+LjZpJn9pl/di63PcIFvR7g41+rdZMuNZ0nmyg9zgRkVcetnr?=
 =?us-ascii?Q?QnKxyNDWbe/njYCzU6kiAJSE33+/LmkafVWuoW3mZDAZjSR4QSGkb0V4kcgv?=
 =?us-ascii?Q?y89WeqCE1tW+M3VWemUSfmXkCPCNQKbXcBAAyo+9ovqmjyWrxtK5CbdnH87K?=
 =?us-ascii?Q?C2sHkl1nLlkzfpJ5OSCmmwzx8hj/PYUqqW5fiXtLxthrdBFDSMRASdJu2mkn?=
 =?us-ascii?Q?lKBB9jqHLLtlXcLqQEOR934IVUxwdJzY/IIqnMpLnRl2OajNCBgpUxIE/cyw?=
 =?us-ascii?Q?cyGbuE5n/tFOZiOKmbWoeIHNn1RwZ2TDDo9Y3YvnBGYLd0W4XdnHkHZJFrPB?=
 =?us-ascii?Q?DvTldhHkUFq9Uonl6kmh/Idcrq9k/iU/rmuWXeq15mMxf46q/9SOZkkDFhyI?=
 =?us-ascii?Q?pjKyHXYnIInQ0msVwy9l+rNrZSJbP6FpoozTklAooZrM9s5zkn1CtFtuGM98?=
 =?us-ascii?Q?AuYaV5ZvfV1YtEPKmrgWITKbRQUfasOUqvwqlFmYFbi8CwzOq2XvfzAADt2A?=
 =?us-ascii?Q?46FNGol0K93L9dSagg2mCTT/dxxoaDW2vARMZoJ9DzV1JJmcpv+WW3NT7xOa?=
 =?us-ascii?Q?+BpgXtbwtVXfNyYcwBGDhNzXmsZ13nhSfWJEtRliemJkT4M89ARvaSf+3W5i?=
 =?us-ascii?Q?s5UnvMAHOK27BvQ1Pc0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:06:09.8977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 707bbbf8-04d5-44fc-8d33-08de09ec507c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF946CC24FA

Move sanity and compatibility tests from the attach_dev callback to the
new test_dev callback function. The IOMMU core makes sure an attach_dev
call must be invoked after a successful test_dev call.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/sun50i-iommu.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index d3b190be18b5a..d7517cfb260d5 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -797,16 +797,21 @@ static struct iommu_domain sun50i_iommu_identity_domain = {
 	.ops = &sun50i_iommu_identity_ops,
 };
 
+static int sun50i_iommu_domain_test_device(struct iommu_domain *domain,
+					   struct device *dev, ioasid_t pasid,
+					   struct iommu_domain *old)
+{
+	if (!sun50i_iommu_from_dev(dev))
+		return -ENODEV;
+	return 0;
+}
+
 static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 				      struct device *dev,
 				      struct iommu_domain *old)
 {
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
-	struct sun50i_iommu *iommu;
-
-	iommu = sun50i_iommu_from_dev(dev);
-	if (!iommu)
-		return -ENODEV;
+	struct sun50i_iommu *iommu = sun50i_iommu_from_dev(dev);
 
 	dev_dbg(dev, "Attaching to IOMMU domain\n");
 
@@ -851,6 +856,7 @@ static const struct iommu_ops sun50i_iommu_ops = {
 	.of_xlate	= sun50i_iommu_of_xlate,
 	.probe_device	= sun50i_iommu_probe_device,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.test_dev	= sun50i_iommu_domain_test_device,
 		.attach_dev	= sun50i_iommu_attach_device,
 		.flush_iotlb_all = sun50i_iommu_flush_iotlb_all,
 		.iotlb_sync_map = sun50i_iommu_iotlb_sync_map,
-- 
2.43.0


