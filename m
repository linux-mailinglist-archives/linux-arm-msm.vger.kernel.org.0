Return-Path: <linux-arm-msm+bounces-76882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C67BD0E3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB183BD277
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 23:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E5B2F5322;
	Sun, 12 Oct 2025 23:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SE9GwL5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012011.outbound.protection.outlook.com [52.101.53.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA222F5315;
	Sun, 12 Oct 2025 23:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313499; cv=fail; b=fBDNALePyGGHF8jMNa8ITMErJfnv7bQSO8BKUTzetrPxGzAf7uT77NN6rNDE3h+nlUmWHt73oGh9bXWIg5QBigXeuiNzKVN1g+t+AyCFwjVhsEMuRtSb58afbAaxLXLEpBwyXogrA7djwNbvf2U1CQ3nW02lEQTURKfN/pmhsPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313499; c=relaxed/simple;
	bh=kVR1P5jltLu9TQtu31yt7u/PXX9R1bXu1SN2+rupnJw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlnRknK0aBCxL1H+N9nq17UALE7y3ZUbCTxEtBlT27rJX3dEb/ZQFHoAsFworp9m5LIphQMcFBti3IV4kK6pi5D9+x+QIL91ieIGBeYpECRlrWl65m5YKn8DydE0VQmuPhc7MCs5CChT0v/SE/NPVCtCvgr7dRmsuy3M3uFwpEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SE9GwL5o; arc=fail smtp.client-ip=52.101.53.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+c6zkI2Lp5mQU71EZx4FTx/m5i43iBTRRXxjDhEB51v/TYMwVmQ8gNfp0+Bx3Z0K4JBvu8p5hoLbN1xu1NZWWq9eeccp3WcbRP6Sa4/3Jkf8xLqzWRTShwHc0aSZLeh5NDaBzvelkqoPuaBlkkg/kIyIKCp6D8EkmwjMSV6IJsD/sDc3XwKBOO8USV1dVlDz9bIdoA/6FokxApeahIcbGAEUTCWjpcOB49TpJztmnhJnp9WwCOrYYLPe3RDWAsOY+fhBl5v7LAhkm7J2MZwmeJBH5mHjKdZZcvfP62Y7d2GVSR/cHc2LCsjr1AnDgKQrLJ5wt4g0zwIs0kJ36wFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ykJhQ+h2s2vD4oxxv0mUAKfdkPiwe4DMPtCtxtxrkw=;
 b=LKiVoRjXTSYCw9Z29imNRVIRw6Boa5f3wmjJEx50uGhc3s2X5+05oLuUt/bpEDTsHsARM7iBsuOo/ZLhTaM0CxH6qylxERxzUYXjIlr1nVo/YSq9jcwtD4Ymbk+L0jEPFHDvRfNNmQdWQ/xs1FjQvVeEB5ZanCBLD3DFUAl2ACNgDix3DyENKB3h7mon/E3LrYO87QFPVdIM9l/PVBuPp77PUpv38j+OvkQ5g2hAiM/FrFcRYbx9A37l3URXym281/+ZF5WxjV8ou18OkQ1vSYDapSg2qMywp1u4O4dMvbum7VMeTMLrcJZ4Y0KEOHYQaATBoATVCpoOPbpGdx4ESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ykJhQ+h2s2vD4oxxv0mUAKfdkPiwe4DMPtCtxtxrkw=;
 b=SE9GwL5om1okFTnob75cYTCc3u6mIUkSdmQcav93Um8OWBPvQ4tHxEJVVREUgCAIcLwncAlLqFNceKUH3WPXQx6KRYJDeYprm9resGwBuEpMRyjK5deUbXqJ5XIwOfd9zEA4H/qz/YI7/UXWf9wbPIUTameaZv6AzK7l+O055PHxI24Y+4nTKBSpBaKbgAlaT0O5taWcTt+/E6b4ikFU5L9YENJhClwXQ2y4UpuEQOCrIC2eOPGmX/WEsot9MdAnYDQGCtY2NM/n7snbh97mAIO0Tqc40gkv9SCTwdUAnt1b9fWDAmgTzfqxT4j76pOqLkBfZWMqRkc1ClBYSh47Xg==
Received: from PH1PEPF000132F2.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::35)
 by MN6PR12MB8544.namprd12.prod.outlook.com (2603:10b6:208:47f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 23:58:14 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2a01:111:f403:c931::1) by PH1PEPF000132F2.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Sun,
 12 Oct 2025 23:58:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Sun, 12 Oct 2025 23:58:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 12 Oct
 2025 16:58:06 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 12 Oct
 2025 16:58:05 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 12 Oct 2025 16:58:02 -0700
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
Subject: [PATCH v1 5/6] iommu: Do not revert set_domain for the last gdev
Date: Sun, 12 Oct 2025 16:57:41 -0700
Message-ID: <691771cd72daf8d6c813d25067c6c521d834e350.1760312540.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|MN6PR12MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b7da0b-68a0-4b25-f1dd-08de09eb348d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vo97KKZaWyL28eGyTdS6drmu5CXBqyoM7OIw1PwAp/IawEEFLgiS0HisJeNK?=
 =?us-ascii?Q?JoAdDbRq1LHPo5GugCjRCm2tv0w5w0GEIMXu0NFsPNSHuHjTT3vLvVJfw4oR?=
 =?us-ascii?Q?slHMfm0TUnLeZDFaF4Q2ZnZ+kUj8MtgD7pVV+DTMtS1Jsk3DqeH4a/6dqg+e?=
 =?us-ascii?Q?htlpIasqS+6WE1JFNE6RqIGEO3nJL//5YPeo80ayYCx9Usxej4YQWL2KEQ7I?=
 =?us-ascii?Q?I5/FrZx9iabqUKl5d9WUQC9obk1rW5MVEr2W3j3xE/fXMTyEH8oKOSOg7G9W?=
 =?us-ascii?Q?IlDAI04/UnM/p87EN3VJKSPvphN4ex3PpKI7OmOAvHASFMjqDO/APYFj+2YF?=
 =?us-ascii?Q?vnBhuKtc1x98r/oPINW3vhj+S/A4fhfvleJ2CBD+l/qnZxD+TR3ADdRFdk7U?=
 =?us-ascii?Q?b/4pMwDkDB8uHhV1P8OimrtcTaqm/QqP2VUATmU2pPZQqusCRo8fOE8xuybn?=
 =?us-ascii?Q?5+sCgKD5d79/xsPWUpCkUqoCJ4O/flG4/stSPF84kOFeBsQxFa207Aye6P9q?=
 =?us-ascii?Q?HwMQgl2oZELgIbF9fo0ONBRYK1mvC/2ECil8zytMTDDnL3nJc5BK99nFoeS1?=
 =?us-ascii?Q?/johPM2oivWyak2rtYMIkpZCyn5vp4KM5yez8D+QLOoYVUrNQ5w/F69OlAJX?=
 =?us-ascii?Q?Oa6+c9LjpEZd1SaykHIWOzSG9zISgA2XhaMS8ZncnB71jIpqhI9jFDmMn8Hg?=
 =?us-ascii?Q?l7CBdJzeLtBLlU8/qQqh5897AifXbTIgB8Cuq97sQQ66FGHq27Z8zWlzzBQF?=
 =?us-ascii?Q?3QUVp2tH8IKkaNyRYmE0UlMNbJ/jEmJZbYj/GDXF0F9Q5et/+znTHrYDYeO8?=
 =?us-ascii?Q?l900qrVJhsdsXG7zWEGY1yf1qkHtHKwbNZsLAqUo+LjrSkV1BiJSc4MVOae0?=
 =?us-ascii?Q?z18+CjR5T20pkV9VHCGI1EBY57m2E8kV55gWaegeUmBDzBfiW8Bv9LxrAGoR?=
 =?us-ascii?Q?7TyeAoB1qmKkXu4734ZqsT8HgA2YWRO1r4F8baZlHh+6v5xstfGr6OivGxde?=
 =?us-ascii?Q?GsSLJfwsY3EfTJBXXTL1C21PVex34uMgxY+2qhDqI3KqUphDIkagFRlDh5m3?=
 =?us-ascii?Q?vdq/ZuEiWoRA0pXxOhLhcexSJyMJ7uJHZDB1TyFK6BRJDQcxiQjcJgHc7wgW?=
 =?us-ascii?Q?Y+NC0+80QSkpaOZC/d6wgok+/k52LGY+G4febBWB3Iwf1jzoyEKMAfPNoh62?=
 =?us-ascii?Q?b1WlxtAxdkHw1ix2DAZSz6of4oHWjZu6syYiCKd9w/ui9jGDhuAPTuUL2Nwm?=
 =?us-ascii?Q?5KvO9G2rru97q6FfAzlLlpgX0xegH/RwmvAa8hCwdDB2uANXHi1rvopHBrhx?=
 =?us-ascii?Q?YfIwmZQNeiRgqVh7yEmq+qOzN2vZgXBkN0il8ucJvwUAXt23o6ICbT1ngz6D?=
 =?us-ascii?Q?nPvhHH/H44SAyXWyuyrE8LQmaiTdeDGKLA1RHsyzJ5qX+X+/b9hMPn+Do03n?=
 =?us-ascii?Q?EY86L4xzJRuTfiUAuLBOsaGX/HzGMGOioL8mi5m0DDKFr4+n4RjNT6U7f1BQ?=
 =?us-ascii?Q?FNcYqG6ds2DTrCJ9oJt83zDbr+R6xs75vvIymRdqoi+BTB8WPN0ZSuf2oU7V?=
 =?us-ascii?Q?4MDlSpg0t6j7lWAIxKc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 23:58:13.5758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b7da0b-68a0-4b25-f1dd-08de09eb348d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8544

The last gdev is the device that failed the __iommu_device_set_domain().
So, it doesn't need to be reverted, given it's attached to group->domain
already.

This is not a problem currently, since it's a simply re-attach. However,
the core will need to pass in the old domain to __iommu_device_set_domain
so the old domain pointers would be inconsistent between a failed device
and all its prior succeeded devices, as all the prior devices need to be
reverted.

Avoid the re-attach for the last gdev, by breaking before the revert.

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


