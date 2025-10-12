Return-Path: <linux-arm-msm+bounces-76877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58EBD0DCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D1C84E21D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 23:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CD22882D6;
	Sun, 12 Oct 2025 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cIOqbfLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C25231827;
	Sun, 12 Oct 2025 23:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313480; cv=fail; b=mc4TtI+jUmfXQrog25VuzfTWzddakJFwQ5DPjrWNUeVE772h4Eg4a0QEpTTiEfjn5Tob+FDP6EyqPMFH6E6MxOPGKLdtSh1QKwDUg7ByACRuuVsjBZYszYeL3H/ivTcHRcMAGLESz8qCAXJJT7kCZXzJCPKOocobmMlQ23QblI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313480; c=relaxed/simple;
	bh=1Bp+GdgwobBnGDovkW0S0VECFu+aQYaHL1OE9cmoSUQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hvLHFgoIEWkxUpy0Gyyhf6sjhy+nQt/u04+WHFTCDs+bvtCCzeWWfvEXeivDsXgzYc6C2LB4Um08Er4eBKHUQLpTCiG3KIwksiZWrP0b/ly3DB3QVdnRly6yQ4+MyDrVoFMZi6YX6A+Ybpd9BvVJpVjglCpNKzeweqUaycxCmgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cIOqbfLi; arc=fail smtp.client-ip=40.107.200.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nummqVh2zhE0fCU8YFx4rzLY+zvh8mN6z83w0HxlYYrEIfDeEvVUkJ6T05500ROWlvPJrNpMNn6NAKncZselWMcx1PN1DVJpCmv+BSigrOuLSAh7LiSC31UqzcZpIYXp8nVnYuhtqbgbBeerQgNcqjgZJ2zfY7XikuPFmLPHmV0dGe5ptCeMymVYuCkwaS3Auhp4wdjd5StUUbsYDpWPbdatbSerEHxEtNKbiE/IeZdlEt1XLO3al/DQKOJvTX3Y0MCJG062/mJl26Gbnpu437WTqJ0+hiKkglpRmLH4z6cVIl2Hc01zMV25qThxl+jKdWAjbe9V5opDUpvzxtNLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AkpFDHqbakSr2VweHMq4HYjY6+8hR7BthW7BwwCjCg=;
 b=YXPiKVTnaxE0zPrGi+nNevuWkhDWwCb1CJmHGp92M3mcNWtYqGb1OpLkGcZVdCGRuZFkR1OeISaJ7Tk6KZe5A+Z/XnP8usEMPxBN7VOL0VjGyNf/FTJMaRPVjBGlBwZ+CWv91xAd4KKCPDoXqO5cC7Tv1Ytj+aA6rHUoWstdgD/RdU62mjz6f97jEpRQkzrdhA+0+/beJli7rZ8HYGmojXVm41cNdkz44vldvVa2LgbboE02Yp2Ydoogc6gl1Y1/kDXvaIs1ovTuu209cY1O41muQ5uvqqH0HI1QkF7ksEBXww/+z14f5OQF2nrdgfdee5Ik0MnCGTRZulObCut/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AkpFDHqbakSr2VweHMq4HYjY6+8hR7BthW7BwwCjCg=;
 b=cIOqbfLiT+Mb9+jl12T+7h3qka9Xo1gBpJE2Vopm8Ro9gmD9XfeHA88puRfex8g/ruCE8PqulMkbvZePNfdcmD/AVIaSWDdfkBmZEsHOW4n34ctkU1FYPyO5nlNRi+SJsku3/dM19SwCAO9lQ9rUnZS1J6OYEtoCoc+YY6IeSMiRvmWHTbNbGjE/k0c2bGuLsd69EIDYzFlQbEtWcAoMqFMmpDBOd7/zfEz9zH7gSMPrEzAK05LS4tW5UOsu3zTKkbqmQA62nE++sNvdtIgV/0e70YgiC5T4VzJ7/pm6huCVxnUh+YNwDcZj3VHxIX0jq+Z3HJL1pE/r5RVsgPug2A==
Received: from PH0P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::25)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 23:57:55 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::37) by PH0P220CA0005.outlook.office365.com
 (2603:10b6:510:d3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Sun,
 12 Oct 2025 23:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Sun, 12 Oct 2025 23:57:54 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 16:57:48 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 16:57:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 16:57:44 -0700
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
Subject: [PATCH v1 0/6] iommu: Pass in old_domain pointer to attach_dev
Date: Sun, 12 Oct 2025 16:57:36 -0700
Message-ID: <cover.1760312540.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DM6PR12MB4233:EE_
X-MS-Office365-Filtering-Correlation-Id: 484175a6-fec7-4a2e-792b-08de09eb292d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nBtyWVvqmDXyNr1DLbNcwRL+ZDY1oIIGY1ZzfBYjhSFSTqi1itdkzGXSB81r?=
 =?us-ascii?Q?a+JREGOQXRJ/vrhVhi0Yz5JOytGlBqyzyE2ndvVJjuSI5yehXVpa+UcqTvZB?=
 =?us-ascii?Q?t2Q8OqvBMKxnQMbU6HgxuMxKTY6XWW8A8qGnThy7DngTY0L3g8mTdJ6UXJci?=
 =?us-ascii?Q?CZz7F4bffiQ2xdyx4B2Uw0lCOL7/8xRhgaiUghkzCjRJeZ57K65EWMWjxw6t?=
 =?us-ascii?Q?uqK4zUAL2xdGG++dLAvOxuNFnAhWDv8wT3HPuM1bjdhRpSiuSbIXztYc9tMK?=
 =?us-ascii?Q?DaN1dTmsOoJtksWc8mgeGj2bDm4aP9o2PWfVlWVzslXS7YSHkILX87sDEk3i?=
 =?us-ascii?Q?+jeLwU/GBMkg0k3sSpjCiFxZE8guvQl/qNwjpHSn6/ob4AnDVgaikBFfzdKI?=
 =?us-ascii?Q?Z+5RijUp7n9mNte6dyqeU2ceIeIQERsyABogcF8667bppea9eR40lZwOdCjM?=
 =?us-ascii?Q?3AFgswaxDSYUO7/bKTzb35S3FtR0PecV4UPE8OiDSMPCFN9NtG5HLiUVqU7r?=
 =?us-ascii?Q?KyoNGWNzVbGYKbIazR8+438ewSNl8wwci0TC4laXsLF3zaycVEDOeDRjsYGK?=
 =?us-ascii?Q?3/YQ4eRaRxxjX3Uiv+aKNPy3x0a768HSV4ZZpM8S/U28Eq4KveAPi5uVWPmg?=
 =?us-ascii?Q?vPpcKUBipZK6npLQEsVR2+E/PhOcIQiLRw4DouiZGn5950ej1K1mbyYcyIk9?=
 =?us-ascii?Q?OvjlsZYol0RGIu5pq6802c03g0kMHb/Q2vXbuACbNn2dzhn9D14JdfVzdAox?=
 =?us-ascii?Q?5N//zjO8OSbS12hpOpEDEurJna5FDXuv3PHzGy2Lxw8zqgBIDGcBEATl17eC?=
 =?us-ascii?Q?RJv2HQQE/drUX8tv4elUf3TDtGLBXTy2GdmnkUPVzg6PL3+5exbF5bEYY+1P?=
 =?us-ascii?Q?bnwpkLBhy3HsZvKfCRmwZ2AAMHdCt0Ehw4t/RlYWez6SdLuVNshAxm+lTe/t?=
 =?us-ascii?Q?AMwo2ASt0FbY6Rwo3EcKhQhllqGpUvBoYrtWe7BQ5yFpUl+PmWj/JmffVcu0?=
 =?us-ascii?Q?YxHqoQaSihOm8ek86ERzYDfHz5Qhl3v0X+3hEsw1AZafnx3zb3AHYOAfZO5x?=
 =?us-ascii?Q?fU+E7yk5YBvj2NTJA8H16x3JfHWHURcm3bkSIGJL8tSP9JgORDw1VWTInQRp?=
 =?us-ascii?Q?P2O0PaSaHRJaMqwpnKk8MynlRJVoAwMo27ijRSzqIupAhe9ZCh9mJ2kAQrvr?=
 =?us-ascii?Q?/u+hLd/QemHlixIFxVjMW4KCZB/7n//Q/ygzrNA63Jb8wvbaK5L6rSqmeBVM?=
 =?us-ascii?Q?i0ocDrQMU/3n5zgYD+GA/lODEOtDh3QzkCidO4sgtGcbZpGSbVXDA1MBIg03?=
 =?us-ascii?Q?soGK2UKh6lk0hmLOWpLkTBBpVrBLHDeqMbU70gckUBhYHXqvhf7JO5k7nPhG?=
 =?us-ascii?Q?D1xsVoiyCk+UHmozDkydAmHXNi2UgvXWR7GpXLqpQLbk70jyMFds6o8mnXD3?=
 =?us-ascii?Q?iMKP52652P2QAoHfZM1dM2dFafP0YLvaMG00OjSHwKYD0czxylgT9Az7fDFp?=
 =?us-ascii?Q?R6+Hh/tsHN9D84drke1OcsVtj+ctr/3TnSB9kg+5roukd1aeJ5jI7wOiQAMR?=
 =?us-ascii?Q?zfmGV1uGnAkIKGx86mA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 23:57:54.4861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 484175a6-fec7-4a2e-792b-08de09eb292d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233

Tidy the release_device callbacks in the drivers and switch to the core
managed release_domain.

This allows the core further to pass in the old domain pointer into the
attach_dev callbacks to reduce the use of iommu_get_domain_for_dev().

This is a preparatory series for new iommu_dev_reset APIs:
https://lore.kernel.org/all/cover.1756682135.git.nicolinc@nvidia.com/

This is on github:
https://github.com/nicolinc/iommufd/tree/iommu_attach_old_dom-v1

Jason Gunthorpe (1):
  iommu: Generic support for RMRs during device release

Nicolin Chen (5):
  iommu/arm-smmu-v3: Set release_domain to arm_smmu_blocked_domain
  iommu/exynos-iommu: Set release_domain to exynos_identity_domain
  iommu/amd: Set release_domain to blocked_domain
  iommu: Do not revert set_domain for the last gdev
  iommu: Pass in old domain to attach_dev callback functions

 include/linux/iommu.h                         |  3 +-
 drivers/iommu/amd/iommu.c                     | 21 +++------
 drivers/iommu/apple-dart.c                    |  9 ++--
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  5 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 31 ++++++-------
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  9 ++--
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 11 ++---
 drivers/iommu/exynos-iommu.c                  | 11 ++---
 drivers/iommu/fsl_pamu_domain.c               | 12 ++---
 drivers/iommu/intel/iommu.c                   | 10 +++--
 drivers/iommu/intel/nested.c                  |  2 +-
 drivers/iommu/iommu.c                         | 44 +++++++++++++------
 drivers/iommu/iommufd/selftest.c              |  2 +-
 drivers/iommu/ipmmu-vmsa.c                    | 10 ++---
 drivers/iommu/msm_iommu.c                     | 11 ++---
 drivers/iommu/mtk_iommu.c                     |  8 ++--
 drivers/iommu/mtk_iommu_v1.c                  |  7 ++-
 drivers/iommu/omap-iommu.c                    | 12 ++---
 drivers/iommu/riscv/iommu.c                   |  9 ++--
 drivers/iommu/rockchip-iommu.c                | 20 ++++++---
 drivers/iommu/s390-iommu.c                    |  9 ++--
 drivers/iommu/sprd-iommu.c                    |  3 +-
 drivers/iommu/sun50i-iommu.c                  |  8 ++--
 drivers/iommu/tegra-smmu.c                    | 10 ++---
 drivers/iommu/virtio-iommu.c                  |  6 ++-
 25 files changed, 167 insertions(+), 116 deletions(-)

-- 
2.43.0


