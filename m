Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2586830610F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 17:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343703AbhA0Qan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 11:30:43 -0500
Received: from foss.arm.com ([217.140.110.172]:53992 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343903AbhA0QaY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 11:30:24 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47F7511FB;
        Wed, 27 Jan 2021 08:29:38 -0800 (PST)
Received: from DESKTOP-VLO843J.arm.com (unknown [10.57.47.135])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BAA8E3F66E;
        Wed, 27 Jan 2021 08:29:36 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     will@kernel.org
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org,
        architt@codeaurora.org, srinivas.kandagatla@linaro.org,
        bjorn.andersson@linaro.org
Subject: [PATCH 2/2] iommu/io-pgtable: Remove TLBI_ON_MAP quirk
Date:   Wed, 27 Jan 2021 16:29:29 +0000
Message-Id: <5abb80bba3a7c371d5ffb7e59c05586deddb9a91.1611764372.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <e95223a0abf129230a0bec6743f837075f0a2fcb.1611764372.git.robin.murphy@arm.com>
References: <e95223a0abf129230a0bec6743f837075f0a2fcb.1611764372.git.robin.murphy@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IO_PGTABLE_QUIRK_TLBI_ON_MAP is now fully superseded by the
core API's iotlb_sync_map callback.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 8 +-------
 include/linux/io-pgtable.h         | 5 -----
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 1d92ac948db7..3a92f06aad43 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -535,12 +535,7 @@ static int arm_v7s_map(struct io_pgtable_ops *ops, unsigned long iova,
 	 * Synchronise all PTE updates for the new mapping before there's
 	 * a chance for anything to kick off a table walk for the new iova.
 	 */
-	if (iop->cfg.quirks & IO_PGTABLE_QUIRK_TLBI_ON_MAP) {
-		io_pgtable_tlb_flush_walk(iop, iova, size,
-					  ARM_V7S_BLOCK_SIZE(2));
-	} else {
-		wmb();
-	}
+	wmb();
 
 	return ret;
 }
@@ -759,7 +754,6 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_NO_PERMS |
-			    IO_PGTABLE_QUIRK_TLBI_ON_MAP |
 			    IO_PGTABLE_QUIRK_ARM_MTK_EXT |
 			    IO_PGTABLE_QUIRK_NON_STRICT))
 		return NULL;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 2a5686ca2ba3..06753323a15e 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -68,10 +68,6 @@ struct io_pgtable_cfg {
 	 *	hardware which does not implement the permissions of a given
 	 *	format, and/or requires some format-specific default value.
 	 *
-	 * IO_PGTABLE_QUIRK_TLBI_ON_MAP: If the format forbids caching invalid
-	 *	(unmapped) entries but the hardware might do so anyway, perform
-	 *	TLB maintenance when mapping as well as when unmapping.
-	 *
 	 * IO_PGTABLE_QUIRK_ARM_MTK_EXT: (ARM v7s format) MediaTek IOMMUs extend
 	 *	to support up to 34 bits PA where the bit32 and bit33 are
 	 *	encoded in the bit9 and bit4 of the PTE respectively.
@@ -88,7 +84,6 @@ struct io_pgtable_cfg {
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
-	#define IO_PGTABLE_QUIRK_TLBI_ON_MAP	BIT(2)
 	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
 	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
 	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
-- 
2.17.1

