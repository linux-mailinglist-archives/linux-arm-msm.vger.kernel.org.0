Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1285CFBFEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 06:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfKNF4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 00:56:49 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:61117 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbfKNF4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 00:56:49 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Nov 2019 11:26:47 +0530
IronPort-SDR: 2nbQ2jeXmIDMIuV9PdKaObubevsHgkvMek8UmORJGLDFKiqdXwYWpuMR+FxL1O8fuHeonkTB0f
 YruQ10YIxz6esnjt35YhgzY+03/X3VzP3ucBfmR0ecGiCRpb3eLGIiE8/vOcaLiNEZblkvIe12
 KlE6BUOMqUaWa8hKjREg6Ndo0jVcaz5IP1IBw47fk1z5b/wXGyaONPtk2tg+Kph8uc8s3QS7AY
 5qP3/K85+0TJvtLjnTYWEwr5FJjzWC8Wo141JMUNLKzV8ZYbFFTulDNysINPTWxe3rvq9/ND62
 FrZRpwVsBqYt833/xodjkvzr
Received: from dhar-linux.qualcomm.com ([10.204.66.25])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Nov 2019 11:26:45 +0530
Received: by dhar-linux.qualcomm.com (Postfix, from userid 2306995)
        id 5D0153AE6; Thu, 14 Nov 2019 11:26:44 +0530 (IST)
From:   Shubhashree Dhar <dhar@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Shubhashree Dhar <dhar@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [v2] msm: disp: dpu1: add support to access hw irqs regs depending on revision
Date:   Thu, 14 Nov 2019 11:26:16 +0530
Message-Id: <1573710976-27551-1-git-send-email-dhar@codeaurora.org>
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

Change-Id: I6052b8237b703a1a9edd53893e04f7bd72223da1
Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 22 +++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  1 +
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 04c8c44..357e15b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -421,6 +421,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
 		.perf = sdm845_perf_data,
+		.mdss_irqs[0] = 0x3ff,
 	};
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ec76b868..def8a3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -646,6 +646,7 @@ struct dpu_perf_cfg {
  * @dma_formats        Supported formats for dma pipe
  * @cursor_formats     Supported formats for cursor pipe
  * @vig_formats        Supported formats for vig pipe
+ * @mdss_irqs          Bitmap with the irqs supported by the target
  */
 struct dpu_mdss_cfg {
 	u32 hwversion;
@@ -684,6 +685,8 @@ struct dpu_mdss_cfg {
 	struct dpu_format_extended *dma_formats;
 	struct dpu_format_extended *cursor_formats;
 	struct dpu_format_extended *vig_formats;
+
+	DECLARE_BITMAP(mdss_irqs, BITS_PER_BYTE * sizeof(long));
 };
 
 struct dpu_mdss_hw_cfg_handler {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 8bfa7d0..2a3634c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -800,7 +800,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		start_idx = reg_idx * 32;
 		end_idx = start_idx + 32;
 
-		if (start_idx >= ARRAY_SIZE(dpu_irq_map) ||
+		if (!test_bit(reg_idx, &intr->irq_mask) ||
+			start_idx >= ARRAY_SIZE(dpu_irq_map) ||
 				end_idx > ARRAY_SIZE(dpu_irq_map))
 			continue;
 
@@ -955,8 +956,11 @@ static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
 	if (!intr)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++)
-		DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].clr_off, 0xffffffff);
+	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+		if(test_bit(i, &intr->irq_mask))
+			DPU_REG_WRITE(&intr->hw,
+					dpu_intr_set[i].clr_off, 0xffffffff);
+	}
 
 	/* ensure register writes go through */
 	wmb();
@@ -971,8 +975,11 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	if (!intr)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++)
-		DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].en_off, 0x00000000);
+	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+		if(test_bit(i, &intr->irq_mask))
+			DPU_REG_WRITE(&intr->hw,
+					dpu_intr_set[i].en_off, 0x00000000);
+	}
 
 	/* ensure register writes go through */
 	wmb();
@@ -991,6 +998,10 @@ static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
 
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+
+		if(!test_bit(i, &intr->irq_mask))
+			continue;
+
 		/* Read interrupt status */
 		intr->save_irq_status[i] = DPU_REG_READ(&intr->hw,
 				dpu_intr_set[i].status_off);
@@ -1115,6 +1126,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	intr->irq_mask = m->mdss_irqs[0];
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

