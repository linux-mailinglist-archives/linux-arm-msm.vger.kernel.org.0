Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87DB3820E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 22:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbhEPUai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 16:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233353AbhEPUai (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 16:30:38 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A27C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:29:23 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id p12so4779561ljg.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hBcN6D5I8HkbDglazgkRvEH2RudyLg7YlXU13vAjCRE=;
        b=uHAQCt13ZIBi3Mteu/ivWAHjpCxwzcKPdnhcV/+CfwlgovIgrBHeO97r0WLLmlPu9o
         84poDYOmTQiINE8JNPrZ3d0+wDAZsXXoL7WYmXQvNhK3vr6hfDyYmySY49spaBkE/jT2
         j1vjSxv1we8byzoGqc8i2hWgRXfuw/Ac9tT2AHDn8ngjxRlMG//QQdsoUJ8XDOVHercM
         N1Mmt+m7xWinE0SdnAlcCjlMLqGPAiVuQ7+WuFW6rIvVfYo8LmZplR1yriQjVJpvmTX5
         iCdsSAgKNZrIobZFk2VNc/c96mnL1Qq2rPwLS5vRiecx9aWEEMQY5rPyl4cW47w7w9fb
         yTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hBcN6D5I8HkbDglazgkRvEH2RudyLg7YlXU13vAjCRE=;
        b=CyABHqxJF5z4MgUIMIZaDi07iIv3tMMhkkmyZwoNcYFXsQ1kgp+rYU9cUqZ0HB9jr0
         O8UyDxjJFi8ClQ2TJC6VBCOSQrEZrpxjSsvQeZiLQz908Jvmtx8AXebyCybOckkqRSLU
         1MC+EiMdWXi1p5uBULBP9YZ1gz4sLZMpPVoAM0+nKr+mX5BPl7woVjirMIbacUnP/bMB
         LWNWyGqyFMzBksItfgkS3uoB+3Ms1XMVc7a0ftdOnvnsFktPpazCAYIpNS651wmBvrSY
         vwTclLZAFFIP2SCiZQlyImvydA6h3BLGW2ZYQfcAWRDInC6+3VzckZZBy5Z1Q7XqXuDL
         0XeQ==
X-Gm-Message-State: AOAM530bsgh8A3ujuRul1GjvLvNnUBkG3x/ndm6cfg62jjJh2wSbSGNA
        H22uKu4UN0BDesGmrjKKRCtnIg==
X-Google-Smtp-Source: ABdhPJzkaHoTDyC+0TnQ8sbB8GPesl7tWtU78B7OfK02FyaxqLk+X0nMteSq9hLPJIz6otsdIEOdCg==
X-Received: by 2002:a2e:8e21:: with SMTP id r1mr46014461ljk.166.1621196961504;
        Sun, 16 May 2021 13:29:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l10sm2629795ljc.132.2021.05.16.13.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 13:29:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/msm/dpu: merge dpu_hw_intr_get_interrupt_statuses into dpu_hw_intr_dispatch_irqs
Date:   Sun, 16 May 2021 23:29:06 +0300
Message-Id: <20210516202910.2141079-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is little sense in reading interrupt statuses and right after that
going after the array of statuses to dispatch them. Merge both loops
into single function doing read and dispatch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 10 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 66 ++++++-------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  8 ---
 3 files changed, 20 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index cdec3fbe6ff4..54b34746a587 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -376,15 +376,6 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 
 irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 {
-	/*
-	 * Read interrupt status from all sources. Interrupt status are
-	 * stored within hw_intr.
-	 * Function will also clear the interrupt status after reading.
-	 * Individual interrupt status bit will only get stored if it
-	 * is enabled.
-	 */
-	dpu_kms->hw_intr->ops.get_interrupt_statuses(dpu_kms->hw_intr);
-
 	/*
 	 * Dispatch to HW driver to handle interrupt lookup that is being
 	 * fired. When matching interrupt is located, HW driver will call to
@@ -392,6 +383,7 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 	 * dpu_core_irq_callback_handler will perform the registered function
 	 * callback, and do the interrupt status clearing once the registered
 	 * callback is finished.
+	 * Function will also clear the interrupt status after reading.
 	 */
 	dpu_kms->hw_intr->ops.dispatch_irqs(
 			dpu_kms->hw_intr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 48c96b812126..cf9bfd45aa59 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -1371,6 +1371,7 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	int start_idx;
 	int end_idx;
 	u32 irq_status;
+	u32 enable_mask;
 	unsigned long irq_flags;
 
 	if (!intr)
@@ -1383,8 +1384,6 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	 */
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
-		irq_status = intr->save_irq_status[reg_idx];
-
 		/*
 		 * Each Interrupt register has a range of 64 indexes, and
 		 * that is static for dpu_irq_map.
@@ -1396,6 +1395,20 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 			start_idx >= ARRAY_SIZE(dpu_irq_map))
 			continue;
 
+		/* Read interrupt status */
+		irq_status = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].status_off);
+
+		/* Read enable mask */
+		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].en_off);
+
+		/* and clear the interrupt */
+		if (irq_status)
+			DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+				     irq_status);
+
+		/* Finally update IRQ status based on enable mask */
+		irq_status &= enable_mask;
+
 		/*
 		 * Search through matching intr status from irq map.
 		 * start_idx and end_idx defined the search range in
@@ -1429,6 +1442,10 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 				irq_status &= ~dpu_irq_map[irq_idx].irq_mask;
 			}
 	}
+
+	/* ensure register writes go through */
+	wmb();
+
 	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
 }
 
@@ -1580,41 +1597,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	return 0;
 }
 
-static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
-{
-	int i;
-	u32 enable_mask;
-	unsigned long irq_flags;
-
-	if (!intr)
-		return;
-
-	spin_lock_irqsave(&intr->irq_lock, irq_flags);
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
-		if (!test_bit(i, &intr->irq_mask))
-			continue;
-
-		/* Read interrupt status */
-		intr->save_irq_status[i] = DPU_REG_READ(&intr->hw,
-				dpu_intr_set[i].status_off);
-
-		/* Read enable mask */
-		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[i].en_off);
-
-		/* and clear the interrupt */
-		if (intr->save_irq_status[i])
-			DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].clr_off,
-					intr->save_irq_status[i]);
-
-		/* Finally update IRQ status based on enable mask */
-		intr->save_irq_status[i] &= enable_mask;
-	}
-
-	/* ensure register writes go through */
-	wmb();
-
-	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
-}
 
 static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
 		int irq_idx)
@@ -1673,7 +1655,6 @@ static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
 	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
 	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
 	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
-	ops->get_interrupt_statuses = dpu_hw_intr_get_interrupt_statuses;
 	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
 	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
 }
@@ -1710,14 +1691,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	intr->save_irq_status = kcalloc(ARRAY_SIZE(dpu_intr_set), sizeof(u32),
-			GFP_KERNEL);
-	if (intr->save_irq_status == NULL) {
-		kfree(intr->cache_irq_mask);
-		kfree(intr);
-		return ERR_PTR(-ENOMEM);
-	}
-
 	intr->irq_mask = m->mdss_irqs;
 	intr->obsolete_irq = m->obsolete_irq;
 
@@ -1730,7 +1703,6 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 {
 	if (intr) {
 		kfree(intr->cache_irq_mask);
-		kfree(intr->save_irq_status);
 		kfree(intr);
 	}
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 5d6f9a7a5195..5a1c304ba93f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -142,14 +142,6 @@ struct dpu_hw_intr_ops {
 			void (*cbfunc)(void *arg, int irq_idx),
 			void *arg);
 
-	/**
-	 * get_interrupt_statuses - Gets and store value from all interrupt
-	 *                          status registers that are currently fired.
-	 * @intr:	HW interrupt handle
-	 */
-	void (*get_interrupt_statuses)(
-			struct dpu_hw_intr *intr);
-
 	/**
 	 * clear_intr_status_nolock() - clears the HW interrupts without lock
 	 * @intr:	HW interrupt handle
-- 
2.30.2

