Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCC231038C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 12:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbfKTLdD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 06:33:03 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:32820 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727900AbfKTLdC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 06:33:02 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Nov 2019 17:03:00 +0530
IronPort-SDR: H7IAH2QcpxkJu85EOZEfnWXQnzCR4zsjjE7TfiznoPfGGJjHn6qyIoRC+a0h5vQU7B4E6xFlG7
 onMY7tMs9zI0kq/x+CT30kq6UF1kQ3K93c81113BfvZjuPjrunRuX+2+p08Ds54Cv63YFLZ1uD
 GXQmt1l6OJBvs+shM8jIoj/f8/JC67ng9xH5pFNp+3/v1+kO3p5JTz+pIYGaBVuWbl+wHU585q
 s3v3QLmgKtoreObYBJb3IbDnnsgzHxJO8E3Gniq8pNsTwW5nLzO+i/YSs32ixm8Xb6DB0ToEDS
 DRENf4uqL1pzCN2x6pdOM4q2
Received: from dhar-linux.qualcomm.com ([10.204.66.25])
  by ironmsg01-blr.qualcomm.com with ESMTP; 20 Nov 2019 17:02:36 +0530
Received: by dhar-linux.qualcomm.com (Postfix, from userid 2306995)
        id BA2113B25; Wed, 20 Nov 2019 17:02:34 +0530 (IST)
From:   Shubhashree Dhar <dhar@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Shubhashree Dhar <dhar@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH] msm: disp: dpu1: add support to access hw irqs regs depending on revision
Date:   Wed, 20 Nov 2019 17:02:31 +0530
Message-Id: <1574249551-13212-1-git-send-email-dhar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current code assumes that all the irqs registers offsets can be
accessed in all the hw revisions; this is not the case for some
targets that should not access some of the irq registers.
This change adds the support to selectively remove the irqs that
are not supported in some of the hw revisions.

Changes in v1:
 - Add support to selectively remove the hw irqs that are not
   not supported.

Changes in v2:
 - Remove unrelated changes.

Changes in v3:
 - Remove change-id (Stephen Boyd).
 - Add colon in variable description to match kernel-doc (Stephen Boyd).
 - Change macro-y way of variable description (Jordon Crouse).
 - Remove unnecessary if checks (Jordon Crouse).
 - Remove extra blank line (Jordon Crouse).

Changes in v4:
 - Remove checkpatch errors.

Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 22 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  1 +
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 04c8c44..88f2664 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -421,6 +421,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
 		.perf = sdm845_perf_data,
+		.mdss_irqs = 0x3ff,
 	};
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ec76b868..0fd3f50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -646,6 +646,7 @@ struct dpu_perf_cfg {
  * @dma_formats        Supported formats for dma pipe
  * @cursor_formats     Supported formats for cursor pipe
  * @vig_formats        Supported formats for vig pipe
+ * @mdss_irqs:         Bitmap with the irqs supported by the target
  */
 struct dpu_mdss_cfg {
 	u32 hwversion;
@@ -684,6 +685,8 @@ struct dpu_mdss_cfg {
 	struct dpu_format_extended *dma_formats;
 	struct dpu_format_extended *cursor_formats;
 	struct dpu_format_extended *vig_formats;
+
+	unsigned long mdss_irqs;
 };
 
 struct dpu_mdss_hw_cfg_handler {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 8bfa7d0..d84a84f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -800,8 +800,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		start_idx = reg_idx * 32;
 		end_idx = start_idx + 32;
 
-		if (start_idx >= ARRAY_SIZE(dpu_irq_map) ||
-				end_idx > ARRAY_SIZE(dpu_irq_map))
+		if (!test_bit(reg_idx, &intr->irq_mask) ||
+			start_idx >= ARRAY_SIZE(dpu_irq_map))
 			continue;
 
 		/*
@@ -955,8 +955,11 @@ static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
 	if (!intr)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++)
-		DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].clr_off, 0xffffffff);
+	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+		if (test_bit(i, &intr->irq_mask))
+			DPU_REG_WRITE(&intr->hw,
+					dpu_intr_set[i].clr_off, 0xffffffff);
+	}
 
 	/* ensure register writes go through */
 	wmb();
@@ -971,8 +974,11 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	if (!intr)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++)
-		DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].en_off, 0x00000000);
+	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+		if (test_bit(i, &intr->irq_mask))
+			DPU_REG_WRITE(&intr->hw,
+					dpu_intr_set[i].en_off, 0x00000000);
+	}
 
 	/* ensure register writes go through */
 	wmb();
@@ -991,6 +997,9 @@ static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
 
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+		if (!test_bit(i, &intr->irq_mask))
+			continue;
+
 		/* Read interrupt status */
 		intr->save_irq_status[i] = DPU_REG_READ(&intr->hw,
 				dpu_intr_set[i].status_off);
@@ -1115,6 +1124,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	intr->irq_mask = m->mdss_irqs;
 	spin_lock_init(&intr->irq_lock);
 
 	return intr;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 4edcf40..fc9c986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -187,6 +187,7 @@ struct dpu_hw_intr {
 	u32 *save_irq_status;
 	u32 irq_idx_tbl_size;
 	spinlock_t irq_lock;
+	unsigned long irq_mask;
 };
 
 /**
-- 
1.9.1

