Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F7A34A49F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 10:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhCZJhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 05:37:14 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14561 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhCZJg6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 05:36:58 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6GyR5pPzzPn9d;
        Fri, 26 Mar 2021 17:34:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 17:36:49 +0800
From:   Zhiqi Song <songzhiqi1@huawei.com>
To:     <will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
        <robdclark@gmail.com>
CC:     <iommu@lists.linux-foundation.org>,
        <linux-arm-msm@vger.kernel.org>, <wangzhou1@hisilicon.com>,
        <fanghao11@huawei.com>, <shenyang39@huawei.com>
Subject: [PATCH 1/3] drivers: iommu - coding style fix
Date:   Fri, 26 Mar 2021 17:37:15 +0800
Message-ID: <1616751437-59956-2-git-send-email-songzhiqi1@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
References: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixed following checkpatch error:
- space required after ','

Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>
---
 drivers/iommu/io-pgtable-arm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 87def58..3bf880f 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -37,7 +37,7 @@
  * Calculate the right shift amount to get to the portion describing level l
  * in a virtual address mapped by the pagetable in d.
  */
-#define ARM_LPAE_LVL_SHIFT(l,d)						\
+#define ARM_LPAE_LVL_SHIFT(l, d)					\
 	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
 	ilog2(sizeof(arm_lpae_iopte)))

@@ -50,15 +50,15 @@
  * Calculate the index at level l used to map virtual address a using the
  * pagetable in d.
  */
-#define ARM_LPAE_PGD_IDX(l,d)						\
+#define ARM_LPAE_PGD_IDX(l, d)						\
 	((l) == (d)->start_level ? (d)->pgd_bits - (d)->bits_per_level : 0)

-#define ARM_LPAE_LVL_IDX(a,l,d)						\
-	(((u64)(a) >> ARM_LPAE_LVL_SHIFT(l,d)) &			\
-	 ((1 << ((d)->bits_per_level + ARM_LPAE_PGD_IDX(l,d))) - 1))
+#define ARM_LPAE_LVL_IDX(a, l, d)					\
+	(((u64)(a) >> ARM_LPAE_LVL_SHIFT(l, d)) &			\
+	 ((1 << ((d)->bits_per_level + ARM_LPAE_PGD_IDX(l, d))) - 1))

 /* Calculate the block/page mapping size at level l for pagetable in d. */
-#define ARM_LPAE_BLOCK_SIZE(l,d)	(1ULL << ARM_LPAE_LVL_SHIFT(l,d))
+#define ARM_LPAE_BLOCK_SIZE(l, d)	(1ULL << ARM_LPAE_LVL_SHIFT(l, d))

 /* Page table bits */
 #define ARM_LPAE_PTE_TYPE_SHIFT		0
@@ -68,7 +68,7 @@
 #define ARM_LPAE_PTE_TYPE_TABLE		3
 #define ARM_LPAE_PTE_TYPE_PAGE		3

-#define ARM_LPAE_PTE_ADDR_MASK		GENMASK_ULL(47,12)
+#define ARM_LPAE_PTE_ADDR_MASK		GENMASK_ULL(47, 12)

 #define ARM_LPAE_PTE_NSTABLE		(((arm_lpae_iopte)1) << 63)
 #define ARM_LPAE_PTE_XN			(((arm_lpae_iopte)3) << 53)
@@ -128,7 +128,7 @@
 #define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL

 /* IOPTE accessors */
-#define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
+#define iopte_deref(pte, d) __va(iopte_to_paddr(pte, d))

 #define iopte_type(pte)					\
 	(((pte) >> ARM_LPAE_PTE_TYPE_SHIFT) & ARM_LPAE_PTE_TYPE_MASK)
--
2.7.4

