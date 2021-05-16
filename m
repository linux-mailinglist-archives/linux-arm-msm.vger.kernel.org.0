Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABAD3820EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 22:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhEPUal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 16:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233353AbhEPUaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 16:30:39 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4D8C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:29:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u20so4760517ljo.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iiDjTYFHPzCrx79YT0VH93ZqXLjDHHC6gEOhJUadzvE=;
        b=bPxDmuo3kplA7NUhA57RerqfqDmFL8zGi33mqj6vTl6Lx7idwfB0I8w0w9cqZGN4XN
         HyMcvy979esGn3RtaGjXlGPwD+SsKkAcIbofNSa2YeO59Ab/V6gvC1N9F1fqS3Tdd5Dv
         YH46yOG/WGPm4gLYinJKSLlRvxW3KTBwVgGCo/AStK3teXBxxyxNnpzwU6xAz74Fbfik
         c2EVPiX6oPxzVC3f3rTPgKrjSWmtApuhSLRcxvYIIciVfwuyERvx+stnC6oArLIDLhyO
         ocB7n8nGtYem82vOYcgPxfrLxjyLFrZ9JVMe3qFK60IbuiD5Uga92mmAFFDKIc5p3CgE
         spnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iiDjTYFHPzCrx79YT0VH93ZqXLjDHHC6gEOhJUadzvE=;
        b=tYYlVDsKTXsuBHcEKPiA52HwEe068iNoqSgQ46Kjx8wO9iMgUPsDpe2nKjNMrbnEML
         MgrAo1XVzUyL8x4T4d71aZrfZT/Sz8GFBVzpszY7aN11LIp3mA1MK22PCvzENgYxLKTf
         Qa45JeOKgX6yzELGiulXF2Jc+H+b2/b7z3YKcqVihvrdSmtsW5pDQV38QVzHzogWV/Ht
         hH5dRUyiznRE/MjXqaTwaLBZNZTaUFLP+F8KCutInaZTHfdtQp81w0xzjbBHOonufqRX
         GxBdEJT7tYryUBiY7905qzOWoBAI+yu1AXvDeUSSIRV5Eni/b+iF59kt1YctqvNlXBy7
         yu2Q==
X-Gm-Message-State: AOAM5331T8JfAUGICcEQc8mh+WylOhK4HbGRQFCP0ODgbfd3D0CsPfNN
        k8ZjfXZNowXv5/+1JCFzoP1bng==
X-Google-Smtp-Source: ABdhPJx1xv7SC0r5J4XA28cibFfq/7b+5agPW2B8BzYnxWu88aMLZst6aJCHbRtQ5rzJhtFNXEsvbA==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr6861845ljn.23.1621196962268;
        Sun, 16 May 2021 13:29:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l10sm2629795ljc.132.2021.05.16.13.29.21
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
Subject: [PATCH v2 2/6] drm/msm/dpu: hw_intr: always call dpu_hw_intr_clear_intr_status_nolock
Date:   Sun, 16 May 2021 23:29:07 +0300
Message-Id: <20210516202910.2141079-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Always call dpu_hw_intr_clear_intr_status_nolock() from the
dpu_hw_intr_dispatch_irqs(). This simplifies the callback function
(which call clears the interrupts anyway) and enforces clearing the hw
interrupt status.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  9 -----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 39 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  9 -----
 3 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 54b34746a587..fd11a2aeab6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -41,15 +41,6 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 		if (cb->func)
 			cb->func(cb->arg, irq_idx);
 	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
-
-	/*
-	 * Clear pending interrupt status in HW.
-	 * NOTE: dpu_core_irq_callback_handler is protected by top-level
-	 *       spinlock, so it is safe to clear any interrupt status here.
-	 */
-	dpu_kms->hw_intr->ops.clear_intr_status_nolock(
-			dpu_kms->hw_intr,
-			irq_idx);
 }
 
 int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index cf9bfd45aa59..8bd22e060437 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -1362,6 +1362,22 @@ static int dpu_hw_intr_irqidx_lookup(struct dpu_hw_intr *intr,
 	return -EINVAL;
 }
 
+static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
+		int irq_idx)
+{
+	int reg_idx;
+
+	if (!intr)
+		return;
+
+	reg_idx = dpu_irq_map[irq_idx].reg_idx;
+	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+			dpu_irq_map[irq_idx].irq_mask);
+
+	/* ensure register writes go through */
+	wmb();
+}
+
 static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		void (*cbfunc)(void *, int),
 		void *arg)
@@ -1430,9 +1446,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 				 */
 				if (cbfunc)
 					cbfunc(arg, irq_idx);
-				else
-					intr->ops.clear_intr_status_nolock(
-							intr, irq_idx);
+
+				dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
 
 				/*
 				 * When callback finish, clear the irq_status
@@ -1597,23 +1612,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	return 0;
 }
 
-
-static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
-		int irq_idx)
-{
-	int reg_idx;
-
-	if (!intr)
-		return;
-
-	reg_idx = dpu_irq_map[irq_idx].reg_idx;
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
-			dpu_irq_map[irq_idx].irq_mask);
-
-	/* ensure register writes go through */
-	wmb();
-}
-
 static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 		int irq_idx, bool clear)
 {
@@ -1655,7 +1653,6 @@ static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
 	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
 	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
 	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
-	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
 	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 5a1c304ba93f..5bade5637ecc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -142,15 +142,6 @@ struct dpu_hw_intr_ops {
 			void (*cbfunc)(void *arg, int irq_idx),
 			void *arg);
 
-	/**
-	 * clear_intr_status_nolock() - clears the HW interrupts without lock
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 */
-	void (*clear_intr_status_nolock)(
-			struct dpu_hw_intr *intr,
-			int irq_idx);
-
 	/**
 	 * get_interrupt_status - Gets HW interrupt status, and clear if set,
 	 *                        based on given lookup IRQ index.
-- 
2.30.2

