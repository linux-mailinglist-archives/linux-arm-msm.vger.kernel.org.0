Return-Path: <linux-arm-msm+bounces-76884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F2BD0E59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82AF24E31CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 00:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BD32A1BF;
	Mon, 13 Oct 2025 00:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ElC5O9xo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C7227732;
	Mon, 13 Oct 2025 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313953; cv=fail; b=t5w/6c03/zOTueeagACyIELJkn0ggcICo1hKLsToeAfOVF2vWw3zcbJgQVZegZteRUsgynsg1R6GXoJz+Aj/5MQW0uPzsg41OoaWEkR1HZ6jlUqiJpCexkrz0fI79X5dIHYe/6aBKYgDZJtEn1m1NkaEAeAsrAONlX4z6qXSuC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313953; c=relaxed/simple;
	bh=gCvMucWOCLL7wFxM3gu80V3JAkFcgELORxILGzsuUjY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LOozVZkAtbBNBwFlVCGZ9+Bu88WjXMxQtjLUYw2JdsWRMHYzwKwNG/Guq2IV1RSa6afc8XAO1bgLX7PkifF8KWNY7Jso1/IJ/oox5TtpP3YT6vuZPAwjT8L0DVt3fjwAzV2L6sEhDa9NYC+TzdJZuaD8ChmfDZomjL+lMcdPzvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ElC5O9xo; arc=fail smtp.client-ip=40.107.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scqSKSuZ/0vOyX3CNylnVdcxwLr4D5ueVVj476B0ZhhQug+mseF65Cc1v/Pvqp1jrQunvQaH0UpZVzyUJENWlRuDHX/vBNmm2SK7UqaLz0ByYjVum+zoSmrJO8QjxKtdsJrPiV71Pt4xAOtiYzzOp/UrhAtyqnklkHY8NmqIGQwzigGROn+IbAi8PAGvvLIvevhQMOQ9+Nc0NJFW/XGPuQG7QGTqDGGJLOk8eB2y7TQETwlpkxXDgDlopZXs6TAxAucoSVl/qBAeI67Zr8/Kz6OKoNUrdfSMYc5wsB32SRzJvAOau7RBVdcQtFrqwSHjzBL7R6AyG++d+lppQr4PCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdBfZsRIiIRC1UZ5XsRlWPEf44+/h+G4key0gza5qAw=;
 b=OTudbYniUod6M0elCDu/EbIcWw2ZahuFT9xnxOg5trfKxOIGMs4NRrLaNH9jbRmc3HG68pYMMxPMzRyWqoahAKrxDEg919rUsIIVV+5enYKxuM8u6v/xhfUb5RbnAtofXLrvLDaHUcI8vAsfya8F6Vuz+hrFCxBfFZHcd7fTIL9CYjxHd1JKfBGhFgFiR/Ft/2DiXuC79VexVFKU355Wlh8Q+ZcxIEZtdI2p0QyA+pZSTIOIVuyGUp3dk9k5YKgzf2tcgqYGl9Hbpo9echC7BbzlDjS6qDC79DRsgZyk7nzwYYlvyC8F6JUsSOIR3AyHXvJPo757PjQuWQHVVE3/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdBfZsRIiIRC1UZ5XsRlWPEf44+/h+G4key0gza5qAw=;
 b=ElC5O9xoo+E5bdKEvVX4Z1qjritKLAUmVhGMHUpoPigOHJdNEHlJuqm5OgjFuOCYEplKH1TcwhyRdAUZ8VnzKVpj/VnaGfeMztXZasHqEfAB1sQhwEK4ykg6JjRAKBww5a1IuPjHJtckzsrtmWzahi/0bQHulZj6zBbkSJlajCqJRGGhaVFkto90Fg+4LcCNFR/v+PouFj9fQDVyNbND8QLPivmtlvY7vkKa77tWygNi0lzUzftShATBAZLxSEdZkGiAw28tI0ZPPOQfgNPjWLz1e8jm5GtyIQ0UThZsutF2eZqrNBDYN6HFP+/a1TmrgNBCcO8rSTWrBYMEGZW9og==
Received: from BL1PR13CA0022.namprd13.prod.outlook.com (2603:10b6:208:256::27)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:05:46 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::a2) by BL1PR13CA0022.outlook.office365.com
 (2603:10b6:208:256::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 00:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 00:05:45 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 17:05:28 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 17:05:28 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 17:05:25 -0700
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
Subject: [PATCH v1 00/20] iommu: Introduce and roll out test_dev domain op
Date: Sun, 12 Oct 2025 17:04:57 -0700
Message-ID: <cover.1760312725.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: ab18c537-9971-4475-dacf-08de09ec422e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UevVKGCRpOnWEK3tM/CXPhMi+wK1RFJoUUOqYdxl/9SMF51BQwEAWXu1BH9L?=
 =?us-ascii?Q?67OHyBrnD9UH5hm6KMrbmLrlC2039v6Z9rsWDQcrH/stbUpLG+e+XjPq8d6S?=
 =?us-ascii?Q?PyG0SnBsGMmi4mESreuoXhpySqu82nZJ1gZVI1sRe0iZu+qeucoGQTH/DxLp?=
 =?us-ascii?Q?uekktXluAxgB/UnPTY6AqHpv/gGFv/LVojgRHc+MEA6UTvO5YwqNn1+FzV4b?=
 =?us-ascii?Q?yHHFPYgku/7Jl62nkKqL2GBA3d0UMotNysWBZP4k9TtvE8ZYTCRl2I1oAXMy?=
 =?us-ascii?Q?rU5qiPbD7lFy+ymXSXXT8N1bzxBjEGdxR7bLAlT0ywwznx+XX++dcFAlqmuJ?=
 =?us-ascii?Q?FSnGtE8W8BoDr99We9PnvCg0gwUQBCKg8GYDsjI6389vyGQP3DlQtqAd4M+a?=
 =?us-ascii?Q?CS9DWo2G890qFWv7VUF0bh/UfYQBOkVfOdiKBnNXeaQyVSYraEGBzPeFaBig?=
 =?us-ascii?Q?NwkmG1bYY2NEGHp3ge58bDYjfZNMK5RUDN9mJ4c8VRLbAIgGQpkXStxSq7sj?=
 =?us-ascii?Q?0MCFI8pCaOmw6Mh2eun9mULAV5ACkJae3+Z/I0MgkCkJiWHMZvVKMf+WgdrA?=
 =?us-ascii?Q?giG+AoN4q42UOYwtPkYkgG3e635F8orT5P2b78eBvdv1g2APe96FmOPam5rm?=
 =?us-ascii?Q?BB9HOX6wojMBFGHO7rm/nGQkeuyIZneVtuLhNmPtqadl3ynOCRyZ6P/8FQcg?=
 =?us-ascii?Q?ASF9OnZ6vzqn6boi+K4KecuJikH6KThtbNHTuGTJux3q/i1IDnu78Ti6Na7W?=
 =?us-ascii?Q?OVs6WGX1VIfZ+UysjesTLthdOiIYdgfvFnTyWqq8KAE4P5XIHZzLDKg13IYa?=
 =?us-ascii?Q?bKOJS+Am1Q+vejtOgcXGe/+uqP5ABFu6yyEQ+6H3O3xnQkwtqELe1UNl2jvH?=
 =?us-ascii?Q?GLuq5vvacWB6gq43lH9HOU7nO2sy0eQo3+8JVrIC7brp5DxtZLgv0N4dH4ZF?=
 =?us-ascii?Q?zzq3Cyg+bDQFWmN5aSA5o+4qkEci775qzJP7Qaj8tfhpUsniuOavzjSmJbb3?=
 =?us-ascii?Q?8Z7pc6M8rPET6dJowprfAbg+V/0ekoMRO5iAu33WINiNSTStBlzZwblMGF3g?=
 =?us-ascii?Q?SzHh26cVda+iuFnwYqiuFtyIAHgX1chRj2dvzc4nzlH3WIahVTO3yd43XS9n?=
 =?us-ascii?Q?oJLcRn2C9M/ElvqX6V5GFjec9C4XjO6nMSfv+DlShasHYTI4lSeh5IiQkbQp?=
 =?us-ascii?Q?3ha4AtlCj1bgvjRgt0nDlJZn6+BjrTgTmgpvlEWQ+eHzva/DTq0PhoSSGKfa?=
 =?us-ascii?Q?/99x/iSokSlJSXPBbnbDCQYO06UkchXm5TqlpkNzd/PDlIYeP91KPsTyBmE5?=
 =?us-ascii?Q?DLXFXPt5Q5ZPH/J0V3T2Q9Z61aZDsBsY+Y8sELsksusEd+APyeC6fvVP+vPd?=
 =?us-ascii?Q?T5QnpkeWQu6hQ/O4i3+q0f3PW0XpyhyxRw/pTC0Xgpbci7IxUv4IpE8hwK6G?=
 =?us-ascii?Q?mP1HKKPeayrV5eE8kvVwKHQFk3grEtRAtXicHEq2HDL/iiXlHAkbLY3pfvlv?=
 =?us-ascii?Q?P5SK2TAQmUGzy8C12xjP2k2740T6lSQuVzzVSj3WoK/f8/laASHWOXHNtuwn?=
 =?us-ascii?Q?aiHnXU1s080FDG0laN4cHO7hQMYchhm3H/PzgA0q?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:05:45.8999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab18c537-9971-4475-dacf-08de09ec422e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377

Add a new test_dev domain op for drivers to run a compatibility test prior
to the actual attachment at the driver level. Any incompatible attachment
will be rejected early, allowing the iommu core to postpone any concurrent
attachment during a device reset state.

This is a preparatory series for new iommu_dev_reset APIs:
https://lore.kernel.org/all/cover.1756682135.git.nicolinc@nvidia.com/

The change is a must to keep attach uAPI behavior consistent.

This is on github:
https://github.com/nicolinc/iommufd/tree/iommu_test_dev-v1

Nicolin Chen (20):
  iommu: Lock group->mutex in iommu_deferred_attach()
  iommu: Introduce a test_dev domain op and an internal helper
  iommu/arm-smmu-v3: Implement arm_smmu_domain_test_dev
  iommu/intel: Implement test_dev callbacks to domain ops
  iommu/amd: Implement test_dev callbacks to domain ops
  iommu/arm-smmu: Implement arm_smmu_test_dev
  iommu/qcom_iommu: Implement test_dev callbacks to domain ops
  iommu/riscv: Implement riscv_iommu_test_paging_domain
  iommu/mkt_iommu: Implement mtk_iommu_test_device
  iommu/apple-dart: Implement test_dev callbacks to domain ops
  iommu/ipmmu-vmsa: Implement ipmmu_domain_test_device
  iommu/sun50i-iommu: Implement sun50i_iommu_domain_test_device
  iommu/rockchip-iommu: Implement rk_iommu_identity_test_dev
  iommu/msm_iommu: Implement msm_iommu_domain_test_dev
  iommu/fsl_pamu_domain: Implement fsl_pamu_domain_test_device
  iommu/omap-iommu: Implement omap_iommu_domain_test_dev
  iommu/s390-iommu: Implement s390_iommu_domain_test_device
  iommufd/selftest: Implement mock_domain_nop_test
  iommu/virtio-iommu: Implement viommu_domain_test_dev
  iommu/tegra-smmu: Implement tegra_smmu_domain_test_dev

 drivers/iommu/amd/amd_iommu.h                 |   3 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   2 +
 include/linux/iommu.h                         |  17 ++-
 drivers/iommu/amd/iommu.c                     |  27 ++--
 drivers/iommu/amd/pasid.c                     |  29 ++--
 drivers/iommu/apple-dart.c                    |  50 +++++--
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   6 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |   4 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 113 ++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 116 +++++++++-------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       |  46 +++++--
 drivers/iommu/fsl_pamu_domain.c               |  50 +++++--
 drivers/iommu/intel/iommu.c                   |  66 ++++++----
 drivers/iommu/intel/nested.c                  |  29 ++--
 drivers/iommu/intel/svm.c                     |  11 +-
 drivers/iommu/iommu.c                         | 124 +++++++++++++-----
 drivers/iommu/iommufd/selftest.c              |  45 +++++--
 drivers/iommu/ipmmu-vmsa.c                    |  38 ++++--
 drivers/iommu/msm_iommu.c                     |  31 ++++-
 drivers/iommu/mtk_iommu.c                     |  17 ++-
 drivers/iommu/omap-iommu.c                    |  41 +++---
 drivers/iommu/riscv/iommu.c                   |  16 ++-
 drivers/iommu/rockchip-iommu.c                |  18 ++-
 drivers/iommu/s390-iommu.c                    |  22 +++-
 drivers/iommu/sun50i-iommu.c                  |  16 ++-
 drivers/iommu/tegra-smmu.c                    |  23 ++--
 drivers/iommu/virtio-iommu.c                  |  16 ++-
 27 files changed, 671 insertions(+), 305 deletions(-)

-- 
2.43.0


