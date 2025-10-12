Return-Path: <linux-arm-msm+bounces-76881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E31BD0E16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3EBC74E3241
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 23:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B9E2F3C05;
	Sun, 12 Oct 2025 23:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KQRCLVsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA122F3629;
	Sun, 12 Oct 2025 23:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313493; cv=fail; b=oELRvWosSAdIfGX7LG09vlv6rRaxZPCth2xsmUhYJ0vsTPi1E/Lf/G4IyQV6iVM5U/xfu1SAm73SRY979btexOZcAQ1beeM0skRNkqIYOCEoReQnlQA6xKgVVyvLfTzuYVM38LeVFLIx++Tws/XpgV0OIySjaEznEpD4RhtDGow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313493; c=relaxed/simple;
	bh=1wWmng/dbm1dIY+qI2Pip3LdF/JubjVU0vl3poFoqRA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jTWk0O3jg6at/JTMpltY6QNNdU9TZm67XUyS1Fijlit9HWNipY/Tj4eNgnDoeKkZ2y7O/b7JkZQogAskye52c9JkNnDZY5gZBxvmn5AGaeNvJecNYRa0XK7+9I8GvWqH2pTsC7WEmdvr53me6042p0bWfvrmCZM3R8ku5xJmdas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KQRCLVsQ; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l19Ifqjyx4nfcoTf16qnpP/KTjrPRXkq9/zQ0o4daVNiPfIF9Qx70MWbZR3tIbNa85u903JL4swXiW4S5vCXBp8qZ/1qRXLe3Iyik400LOQqsC8uyvxn7ht/41BDKhxj0mFdMF2jrH92h6F8OY01DSZ2R1sVcYJUJuTEF8hGxX3T64CedW0wftWMIDSHbDHcBVMVSW8taafFuQO75Ujp4R38JQnw7iyuii5rIAFT4gCAV6JPxkaj35vwLYGzBsWpBtQB34+1CtVeauwHyDQO4m9qrqpKwvhK0DTIDz/sdJSCE3tzKz3sLDbfGDovRXeUMrYV6JrSQeSccZrgptvRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC2XylywyGzSg9CgvBBdR9BLHfyJUKGprDQLZHxIsYk=;
 b=wLNiUj0D/5xcC5cCGyv5efLpGm16TEI7liiJOYyYhIlQK9JLeGvsiwL909LOKv3Llai05gjLJReirJH9dFpK3b23JflPTL4YZkPvlP9YfZwKcT95oBqDvEmocDIxUC4RmiruWhS20B0wFGWwPB4QAiLGirSz1JTj8imkeCJoJLyuP8YJNzcLcTHhKuWZ2jIvmya55r0RXUjILRPHqDvdHNx2N60wktjSadCcttSuZ8an+Mt6TwzsTrd/OhgiwyCZNRknNfWVtQQEYPCXmYUGrq6TP7roqerV+mP/qsFv0qROgjiubyhA92g2Zl+zfchc4MrRIWvFWcjCo/sC5BVFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC2XylywyGzSg9CgvBBdR9BLHfyJUKGprDQLZHxIsYk=;
 b=KQRCLVsQrBDSghm/okw9DIVrO0lYvCSedLYgb6FBo9Z9Xla1YXnZ7+mqnq1F/EWvwjLFuPfaRw/DE952qUY07frue+uTz203mPMcSD9atqlvC4+IOAZQWeeBXUseiM8bfrblBeWNrHPcA7p0+yMDMQOx4slVmAukPwIQEBqJIBWQEkNexrKDBBQFWvFl1nUhp+AUb4fuumF1Btnrq66FC+a539bboeV7D5oRJBe6odnF3Ryn69kDC/XojuZoXU+xK+iVrAc2pGQ3/w6R/gfzcQeVFCCMcNtv0fGXAUinHRoj9VskDGsNolxoSiE3n0Scgp1QCj70lFAlhzHNsSfw4w==
Received: from PH1PEPF000132F8.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::29)
 by DM4PR12MB7624.namprd12.prod.outlook.com (2603:10b6:8:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 23:58:07 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH1PEPF000132F8.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Sun,
 12 Oct 2025 23:58:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Sun, 12 Oct 2025 23:58:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 16:58:02 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 16:58:02 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 16:57:59 -0700
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
Subject: [PATCH v1 4/6] iommu/amd: Set release_domain to blocked_domain
Date: Sun, 12 Oct 2025 16:57:40 -0700
Message-ID: <cfa34723a0727c9f7ca3964419b26c02200388c0.1760312540.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DM4PR12MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 83160ef4-418c-454a-3729-08de09eb30a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7SZ4tA5ik0iWRX4fFzg29Zap51vE3FR5QCHjAJ//3JzgH2LYpTCsEQitZQD0?=
 =?us-ascii?Q?+8QIVvUn1nEL2KHGb4j1t4+qnvN+l4NJBM/vLFK9/KZ2hPY7b2JNvo+sLLV7?=
 =?us-ascii?Q?lnHsYITPDHBMZAy1IANYgXi04AkEy9oG7Jt84pZF7ECZthT+6n4WXjGNMMvz?=
 =?us-ascii?Q?h7TXqruDxkCdRF3S8B4cRv/xLmNythEH/fZu6lfY1B49JYHRdgLEurQMGGHf?=
 =?us-ascii?Q?yS5P6TdEKdC2lCp73neNGiHeqIUxgi25SpyT2JlXrTBFd0jJJTRkMVRV8cnf?=
 =?us-ascii?Q?kcOlGcJCGbWwIfSEkv7wm22/5+iRdn6Cej/KKD/eGFZguB7vJjSC9fcTk8tK?=
 =?us-ascii?Q?kCcwE4IJj7GuolCrN1NylZTA6cn94MqkY4ALKH/h2wUS12TbaLd/Kb6kdjMh?=
 =?us-ascii?Q?aUMCfoxFU0pTjreqgJpEUrT0ApjBVL5lIgkwnkHUp2T54Sz971oJkQpGYYmv?=
 =?us-ascii?Q?KbyuQCohjiRe8T8xoa0kRm4jyo7YvNIHVOIyNi4j2VpauQnBtOddxKG/k5p7?=
 =?us-ascii?Q?b+TaQRdzXYOy0xMHFLfFc+YjzGv7vEacgBwcCALYw1p0aqVMy9AW01SX3TPr?=
 =?us-ascii?Q?GWpPlNtPjl+VYNUJAs9sYfPnn/CUfulTYWEaCeO4GQHYrqAK5mc/DFFlPsMx?=
 =?us-ascii?Q?2Zy+EMUI0pH7ai8YSGCE5bl2zbie9pR/QKnorXvjXv101tG1yB0ZCZc6sJQ3?=
 =?us-ascii?Q?2VhqdjgoyayZX71cgfbmIf7Kr/L3vpiN2r2Xp5m39yOgMp4a9mBMnAj/r885?=
 =?us-ascii?Q?XTEJdQlkBlmrivoumF9P4CzxXnMhfg9n40zGtzrwafjWMAJrY1lny2aCToxN?=
 =?us-ascii?Q?F/RDMhbXjOYlT21Zd2G93SXs/HQBzOa0WSRlgivhT3S7id1VN6l4N03qtfiC?=
 =?us-ascii?Q?O0+wOEG4Ux7QTa4Jj0IwYc0uojJRdmKPlDcPU3B86ffpZua5xQyqQE1hZfiH?=
 =?us-ascii?Q?kKBD/vsd6cXRz/CFoARehZ6292PL895ZMJetFWwH7U5mVvjQw0LULIpTuy4t?=
 =?us-ascii?Q?gdTOTK9vI1peYUKA0gyKbHjA1R4Bp6klbd0FNnhf/vZHEZhWwzaqII2lf5fD?=
 =?us-ascii?Q?uyTF73FIB9XUIekSIq0iHe9AzDb0pIIuXbV9hYCd9ZmIrRKASMBczDCugIlK?=
 =?us-ascii?Q?Y1W3MYvxrUY7AUxlSI6RouCb93mEmoNqDmqDM0HbyUt3gLsIxOjx76w2+2oJ?=
 =?us-ascii?Q?t8EBK+fx7xrSR820DnTyjInwUjhJ9aaGyLHVnRntC153GRqQT9dX0TXVpZEw?=
 =?us-ascii?Q?nDnDpYd4YRxjo0HYY4KNeqbS8GhRSUdZIGAf7qzdRU5bLYKKZ3F6pqa30bzc?=
 =?us-ascii?Q?//NCLbUAIoaQ8ZVKwW3gCccJYdU6BfdDaHxvgJNg56Tj62nlD9VzjmW3ZCs/?=
 =?us-ascii?Q?3nZOcU6RF8Z2WT8q4ZTVjJAup/ZRkPpda6UwOhBSSOrm9EtOgWToSKi67kk2?=
 =?us-ascii?Q?nTnuqFTlR/as7ET9+BwIk3JwZZVv9sziC24zqC/uDqJL1KXYxuLkGnWWgye4?=
 =?us-ascii?Q?oIvu2+O1Q4BqbDm9rnvJ5SRdDqfhist7QC5Bx8xDN+8d/RdvPKcoNUT1dl04?=
 =?us-ascii?Q?g27O6zS75GTz0kwAT54=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 23:58:07.0206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83160ef4-418c-454a-3729-08de09eb30a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7624

The set_dev_pasid for a release domain never gets called anyhow. So, there
is no point in defining a separate release_domain from the blocked_domain.

Simply reuse the blocked_domain.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
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


