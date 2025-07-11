Return-Path: <linux-arm-msm+bounces-64597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640CB01D30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B051188F853
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07734225409;
	Fri, 11 Jul 2025 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I2mbafsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB04239E80
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752239805; cv=fail; b=Sn1ASN2x05YknSP6B4/MCESE9SWD0cf+Z5npMq9sg/GmF2SRSdd8KU6RT/hl2+la/NCG+kbYfz6+C4uYDWdnjWg/Sf8v6T6gCbjq36/a/qfrlYohFOviQvDssL4KIKGPrSjOl7iyMS0HnAaeve9L3/5j9ajFXkkqT4k7iisJ8EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752239805; c=relaxed/simple;
	bh=tDEgbQF5DLCTn2G386CQXFGjgO80qU97a7brZiuOnpI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HzugO6LqHRCxMAUSIQjVmGro3Nmmmv55Zs3vbKBCe4MfHapc8nFKbpRn96YDZRUNVtbzmdI1+E5phd+L33ou2Eveg2mR77uqeb73hPR6MdYgKe2vCURJ4M+431s4mn7vD2qxSlXS3nRZ0k62qZVE8eqW24cbTxPeZQ1oiSY5fTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I2mbafsz; arc=fail smtp.client-ip=40.107.92.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwRpynpmaiYhE3LEsbCxJuGOWeqPJ8seFMG0D0WA8vRktrBoJj/ohe4PmXCtkFFmE/e0NI8yOmI06YxD83gf0AfW/mMB7TxA8JzgQGGpaeXaAKsWjyOqglXNd9R3fSmo+4AwNe3DK6Ri68I+rvrQ9Hb4Lf0OUE01a3+MykJKHnYcKdiF7qO9DfVSbRFzQHo9qj3/hFFiWtNx45NG9RduXTw8ah1TdkN6uVmBGyWeLL3ysBk8WzS3a0eDb/OljvWKhAnOpHUQf++HHpdOxQW6rkm6U6b7n3a+FqwP2/o3Bt3aok+MC5GhV0Ia2vnCzSjo2k+SUeQanHxIB2lhmYQ9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJVI6zpL/jc15fQAtLgnWutgbeyCm9qybL8xs1yOGKE=;
 b=q/esasv0kEENVuz11JQSbFdWjzNG9U7zfLRD1ABYhJ/DjtxNyoOP8osG9KQIpY58BwuljCc5oySIzR7ZBnNmqK7pFnEyttUEGU4p6B4Gunx/7AotwdL57dNbdrsuJiavTBsknW7giQxp/Xxe6ZS15bHgbXRvjsN4YhfBV9kSmjJSVxJFgq15tb8shZKRpjhVm+cgTR7SPyIa5CcgJFB1r1mLRR8qPyUPiJinBG/eZtOQqMCzTpMCDfFB+dCCXyWy8olP933Rk0AyELwHFgDAzKMEadO9kBlh40xRYsnpHJnqWDg1G4E0KTE3SbK1JMk+wqaJgtrLYbQi7w7pTzlpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJVI6zpL/jc15fQAtLgnWutgbeyCm9qybL8xs1yOGKE=;
 b=I2mbafsz9ceazBUY8ObbsLRp5JC6Jdsi3jrUMpaycmhRjnBaQq96hpi827DjB9edGuMiVcCbzENWOVY+9atZBzw0siTqLpy1dOz+gxAjuq4BzcI4a4Epjp2h76W+gv5wAnzzhb6yZy09yv4iFWcObPIGZOTYC76mdxVDpzniDoj/1+9YYAy0xC7IZaaOeYgcetQ/HwosFUSsbwezqaZzR+hrMh/N33hZZfKhMTuefBnSnSVgJEiEje46RDEvSs7EQwlsmZymp+dTTFwtRkXjK/weDn4TdE89O+WTvZdiFd7rTVmhJ28YU+d4VE0wWTOxb6tockqeGz595XFHh9i4yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ0PR12MB8116.namprd12.prod.outlook.com (2603:10b6:a03:4ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 13:16:40 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 13:16:40 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Joerg Roedel <joerg.roedel@amd.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	patches@lists.linux.dev
Subject: [PATCH] iommu/qcom: Fix pgsize_bitmap
Date: Fri, 11 Jul 2025 10:16:38 -0300
Message-ID: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:208:32d::28) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ0PR12MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: 069c3299-c000-42f5-b93c-08ddc07d2c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DocCqOhaZRrelUdTWsilS+t8Jt7JshxPIY4Xj2iGggIFu6pcEncojYMADlOC?=
 =?us-ascii?Q?p/xVQyluV2jARAOtbwG6j6w7RBW8OJP3yo/4eDQaS1xtTNuIumXriVusi4fk?=
 =?us-ascii?Q?EVtFwzl0JhFby4FyXngNNDU9Db2KHuVg87fU2ysyJRHd7Tzgkg1CCJSAtc3K?=
 =?us-ascii?Q?31RRCx1ZrqeXWqQHCe9PuFWJFfbCBebxlRSAYjIcW4CV+A8mcjEexP8AiX9N?=
 =?us-ascii?Q?p5cYe57c5hTGSPHOwENY/itVciKNs/G2UgQXZ5lBAx9YmetuFxV3EXfqHazO?=
 =?us-ascii?Q?YDeWFT/4qD9y003urq0SGyhdICk2rvD0GflKQzMyxTpecTqRB3cqzM+enE0U?=
 =?us-ascii?Q?OK7XVZYv8L0onuNKIyTYTRvL01IQ/vhIIMTgeLiMEfkJPe7nkF1tOnF6bK07?=
 =?us-ascii?Q?A2wkDWFUaNmJuRUdNO0FezW/rO9yb8jsncrPvcTJ93elFFKeKto4LKbgq3Tl?=
 =?us-ascii?Q?3WcbpgvGF8Z3CXFOT8KFGkmcqU4khcauRuaEHjBOa7d+QkyrAGms5nBnOlAs?=
 =?us-ascii?Q?eXA4hVEozA5/uBm0cA1tjfg/RfhutWHWTNQXY1Fu8hRPkEPnZ2gjDW5FSNX3?=
 =?us-ascii?Q?2/C/KKihOsnb/BgWFqIOdf0T1S1ZdOkG+zbfgsHL+Xum0l2Lukm43rf7BXOM?=
 =?us-ascii?Q?uqOTUJXXYafg5oh4QorkFyHCZ3qeAgR/rfsjnDmpK9S3WtghyNoztQHHAqAO?=
 =?us-ascii?Q?vuzgsxnIF8rT+IlWbqze62Bdruz5UAucZzOBqzwErQ0n4zhK0hsKh5EsAzWD?=
 =?us-ascii?Q?ntrVAqk83S2i6N2pa8ebGrNc00PVYNi8x6P2ESqEr1jhrUTlBAykVZGIha5t?=
 =?us-ascii?Q?bB28ns0+nOUiiRxAyN2kF6fhmLe+z7mKDKUUuzBonMldjBxnlNYobS8ryYi5?=
 =?us-ascii?Q?+9nUmNwJvoZVYw1RxxP/lVJF15tW9LMY6bb3+TyBlCMFCFP5pSDsXRWEVvq0?=
 =?us-ascii?Q?Vrtf3JgG5hbrDUephGlB1vhISnQpRTL0RfJIf140s2gFL8zlmJCC8eGSxK5v?=
 =?us-ascii?Q?C6Chm3OGgYZsCvzrS7MK0gk2Ag43/fjQTDxfLs909n8nI7ouFRhn365oe0+W?=
 =?us-ascii?Q?rzR2ROwo8uUTbZ7Fhkdtnv6KJHN1HY1QJbthc03RLtSP9XDU9KPAep4MkNHH?=
 =?us-ascii?Q?dC2ycVRPSHGpOS89db5Py6oKrazmG8ROBD84SUm540awKughvRcrgmYXeJ/9?=
 =?us-ascii?Q?reak2hsmgFt9wI+rdMBFTc9Yo6/mTqSC3nKCA9ESBhjwBHxmhqmujU0tat8s?=
 =?us-ascii?Q?M0BdmsLXmTqb20kPsDNyvm4vZmoXdZsDl+OL8lJrq3FU4BWm2j6ul6/cC5mW?=
 =?us-ascii?Q?ypkhi9imWMxisHJ2W1Ws8lXqjRDTX0dr/Y6zDcOWC/Z52SF8HS6WF9MUNRGz?=
 =?us-ascii?Q?gMn1W0qhOpfsbuQTqYAEy/wtfcTwGuMVQlbkPPX+imk00MhJVQSTcxEst767?=
 =?us-ascii?Q?FMdy5z5PUCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zYVvbO5m4xe5C4ySH66pxqPX7NDLn32PS8XB4Q47659fEHRBCC4ytUSzX/WL?=
 =?us-ascii?Q?rAxJAgxN+MJfJbv2pwAHFlnL8yHvWkkYyJBZ2flDm+FqL60CPvdXEzeFfkf9?=
 =?us-ascii?Q?i+8/lYOjkde5deDjKv0nZ/ZJMoRzlD68unXQJu8No2ybPcD6pM7GYSC6mAG/?=
 =?us-ascii?Q?yE7Oe+Nl5RO4vZxgAUHrgZ4r4njm80QNz4AiikgMvadh5t5Rqy6qoYbEz6Zp?=
 =?us-ascii?Q?CKMFaYKwbZIdZuqJeNMcreBMz6py+FQJj2qrY+Ofte0cOxYOEfLxcDwv7y9p?=
 =?us-ascii?Q?L4JXJ8UQGzbpIiNLN0d02lSXeG7FZvCXeYf0Gk2QdFtql1Lm+JQ3zI3FfR40?=
 =?us-ascii?Q?ndNhOIKEnY+0PInGDD2OQeS0g4K87QRWztOBGbDijTlSRwCCaEC+floc2YId?=
 =?us-ascii?Q?bc4jQefh3BBfedAy+HXYJR6Afz5OBnoEaMNDQ/r7VDa+0HLlSA6xbnZc+hzQ?=
 =?us-ascii?Q?MMdWUCp2lZL8akSIEFjWSWsKFERZnBGaw9QiMIvIfyR9Xdu1tI7eFi13NxHh?=
 =?us-ascii?Q?3AF0/gnsNKfO8x+dMX8mKbPbCCOhpr3Wwm/HhXbzlX01R+HttUGOCtXEEWhT?=
 =?us-ascii?Q?1ZeeGtqWzFXN5g2ya/tEGv9+q3f+kDqiMHtHE3Cc29ITwRKXVUqyyMn3priN?=
 =?us-ascii?Q?cl3oToPHY/85XN5bHl+BAgAsePnBYwcGRv8hQ9rCti1A4Uys3HUkMxFUAK8o?=
 =?us-ascii?Q?YIEmp3ACMyYa46m0L1ZQOQXnmSBZGco0MoLwS4rpdy16mmbUjrPzRVA76T1D?=
 =?us-ascii?Q?UXWZIdDvfvA1zW55jlHKR4pxRCzdM56+KQ3jr9XZkBJRGwbw9Bll5UGgU+N/?=
 =?us-ascii?Q?mirEN7Y3iYj+bzET36wdaI2BGTffsNAO8XRIkNIqFOtv6pvoxcXlxz7Lm/KK?=
 =?us-ascii?Q?EHdzGfxCUs41v+mkyB+NPHKKk2MHEqMfJgVkuyS4f2x6RpYyjb1+PJDUj0Pd?=
 =?us-ascii?Q?Q6cfYNLtSLg10TH8iu80sDKuuzqZ345cVxST9JVEOad16qa6a6DcNN0Aavrg?=
 =?us-ascii?Q?LnTvex7NGZ9yMlj8K/Lcy1ZpT2jmXW8TKJsq5VatUuQU20lHcgdgKTso1IoQ?=
 =?us-ascii?Q?9/YWLsJm8mpTRvoML836iu6W1HnQQdwKNNKhyTXdHfVFyU9UkqsJ13RB4vJw?=
 =?us-ascii?Q?1UjdMARUYUl4Ki1FDPxuQ92kggQoS8pkdtJTWTnNHWJmJg/dYN5Sw0lCMU6B?=
 =?us-ascii?Q?JFhFqqbMPWnimP8jMJ73/hzYlA/vrVd0I212sQaVfv+lF9U8FG8EX+anAgu3?=
 =?us-ascii?Q?cwrmz29NOIw5Sej07IPHSOwhRWE2orwbNibuckluUj+fdeot/ctnc1zqpQY0?=
 =?us-ascii?Q?PuPmbbzWXkIrbLfdvx27tFF82GXrohYJ4fnyXnOLZlXTyhaEPXz0yr+tHJcg?=
 =?us-ascii?Q?d5eIjtyl4k/PJukCYk/PXO/PFpK3cIA3molqDChc6ftwWeSdOwLpJdFaHm6z?=
 =?us-ascii?Q?G32XNVtoYk7zc7jMDEbbtr73iGgPCQoEawNhGi3WIWMT3avSJf/XuRZY+g4G?=
 =?us-ascii?Q?58GVQPFePo3KtJd9Dr0ptEIpIp6bpjNO8kjoL3bWcCIfMFBMN1l1NnEfXeTx?=
 =?us-ascii?Q?kzk3AGf6AEiuveIEy0AMXNkDKI1DRYkpIJQdZjXa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069c3299-c000-42f5-b93c-08ddc07d2c07
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 13:16:40.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FGoe9bbRag2Oyq3oQhbQ9Zpd9XoB6ibpScp/F2WDA2GwS86iXlvzxaM/oHtkmyz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8116

qcom uses the ARM_32_LPAE_S1 format which uses the ARM long descriptor
page table. Eventually arm_32_lpae_alloc_pgtable_s1() will adjust
the pgsize_bitmap with:

	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);

So the current declaration is nonsensical. Fix it to be just SZ_4K which
is what it has actually been using so far. Most likely the qcom driver
copy and pasted the pgsize_bitmap from something using the ARM_V7S format.

Fixes: db64591de4b2 ("iommu/qcom: Remove iommu_ops pgsize_bitmap")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYvif6kDDFar5ZK4Dff3XThSrhaZaJundjQYujaJW978yg@mail.gmail.com/
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Joerg, can you pick this up for your core branch please

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 5891ad5de0d5e2..3163a23fcbaa4f 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -335,7 +335,7 @@ static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&qcom_domain->init_mutex);
 	spin_lock_init(&qcom_domain->pgtbl_lock);
-	qcom_domain->domain.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M;
+	qcom_domain->domain.pgsize_bitmap = SZ_4K;
 
 	return &qcom_domain->domain;
 }

base-commit: 600b96ab916c09a60106c64ba7fbf60c301b98b9
-- 
2.43.0


