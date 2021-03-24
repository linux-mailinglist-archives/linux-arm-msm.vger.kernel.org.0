Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C4E347B85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbhCXPB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236399AbhCXPBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:01:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E2EC0613DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:01:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b83so32438710lfd.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AET1QWQCuGDwvguQyzk6xCA72n9Vcrqjv6IU3ip+Y3E=;
        b=gPqmJSWZ0695O/tVTGFbsaPlONQ8hS2be7mGgtrqHUEKwDsGIYR72EiezurjB5tt/h
         RL3lTPw5peMqUEWhbYpgs0kng1T+WS+IQ9IaptY0CrpWm27lrhIDK6BC/+NkJDjbHRVS
         RxYsiQBsknToVG+spJAOj5s8yrVBKKT1PISnJcEbkNwyrcT5PBSKyl8GslP6OcUZzeQy
         H6+KP0JNCIcSFzLf59HSTkV1BTYWN3Bv59LUigQ7/IM2bkRanttEKPmxJ8uV/3NkIc0y
         sQ8PaKiQyE8yOddcNYhV7hxR6yzh2CzxKCsyUMDH90HDjLnQq6setE3xjg1b8CeT1VSl
         LTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AET1QWQCuGDwvguQyzk6xCA72n9Vcrqjv6IU3ip+Y3E=;
        b=fUmWnQ/Mz2kfrMYympZ9PsPWQq+tI3Fex2iKzMtHWC+dJWVtOSGH3chdFa5pkXaTwZ
         d5t+XZ3gwWvTa73WGtma7IH+r5HdZVDbNZ/4oXVsNiv7JU5NKiG4SVUy8Ri89RnsWKzN
         5QbqeYd3/FNScJswFskuce3xWdt+JPYp5D2oxF5i2S+tFhJKCWDxxt0EuWWkHXBq2isl
         5u7HbwC44nqQcUCBDzXtH4TvsTBGXgJsq2lq+ZR9BocHGlggGWFtVSl3mnOC9E8Z4FjQ
         Q6a43i+SG6XYKTIn+WfjO6EtXZ6S2IvnLVOC+cnao8gjbf/1ARH33YE2Ck9FWq6peYsr
         b90A==
X-Gm-Message-State: AOAM532zHf4L1vTYHkrW6hzLFQchd9+pCjrNcfta/jeJtPXVuG0mc+YS
        +ak0JzM513w3d/vCRCSePZQl8yp/zpiv1A==
X-Google-Smtp-Source: ABdhPJwy3TuCN5KIkqI6hd0f+p6WRaqdqjWO8JOAo7ZD4wxVSO4J/VqRHx/CBR7QVo6+/mniT6wH/Q==
X-Received: by 2002:a19:946:: with SMTP id 67mr2408949lfj.74.1616598057304;
        Wed, 24 Mar 2021 08:00:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 21/21] drm/msm/dpu: call hw_intr ops directly
Date:   Wed, 24 Mar 2021 18:00:24 +0300
Message-Id: <20210324150024.2768215-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace dpu_hw_intr callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  27 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  36 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 180 +++++++++---------
 3 files changed, 111 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 84ea09d9692f..57c5485c0213 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -47,7 +47,7 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 	 * NOTE: dpu_core_irq_callback_handler is protected by top-level
 	 *       spinlock, so it is safe to clear any interrupt status here.
 	 */
-	dpu_kms->hw_intr->ops.clear_intr_status_nolock(
+	dpu_hw_intr_clear_intr_status_nolock(
 			dpu_kms->hw_intr,
 			irq_idx);
 }
@@ -55,10 +55,10 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
 		enum dpu_intr_type intr_type, u32 instance_idx)
 {
-	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.irq_idx_lookup)
+	if (!dpu_kms->hw_intr)
 		return -EINVAL;
 
-	return dpu_kms->hw_intr->ops.irq_idx_lookup(intr_type,
+	return dpu_hw_intr_irq_idx_lookup(intr_type,
 			instance_idx);
 }
 
@@ -89,7 +89,7 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
 	trace_dpu_core_irq_enable_idx(irq_idx, enable_count);
 
 	if (atomic_inc_return(&dpu_kms->irq_obj.enable_counts[irq_idx]) == 1) {
-		ret = dpu_kms->hw_intr->ops.enable_irq(
+		ret = dpu_hw_intr_enable_irq(
 				dpu_kms->hw_intr,
 				irq_idx);
 		if (ret)
@@ -152,7 +152,7 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
 	trace_dpu_core_irq_disable_idx(irq_idx, enable_count);
 
 	if (atomic_dec_return(&dpu_kms->irq_obj.enable_counts[irq_idx]) == 0) {
-		ret = dpu_kms->hw_intr->ops.disable_irq(
+		ret = dpu_hw_intr_disable_irq(
 				dpu_kms->hw_intr,
 				irq_idx);
 		if (ret)
@@ -185,8 +185,7 @@ int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
 
 u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
 {
-	if (!dpu_kms->hw_intr ||
-			!dpu_kms->hw_intr->ops.get_interrupt_status)
+	if (!dpu_kms->hw_intr)
 		return 0;
 
 	if (irq_idx < 0) {
@@ -195,7 +194,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
 		return 0;
 	}
 
-	return dpu_kms->hw_intr->ops.get_interrupt_status(dpu_kms->hw_intr,
+	return dpu_hw_intr_get_interrupt_status(dpu_kms->hw_intr,
 			irq_idx, clear);
 }
 
@@ -273,18 +272,18 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 static void dpu_clear_all_irqs(struct dpu_kms *dpu_kms)
 {
-	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.clear_all_irqs)
+	if (!dpu_kms->hw_intr)
 		return;
 
-	dpu_kms->hw_intr->ops.clear_all_irqs(dpu_kms->hw_intr);
+	dpu_hw_intr_clear_all_irqs(dpu_kms->hw_intr);
 }
 
 static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 {
-	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.disable_all_irqs)
+	if (!dpu_kms->hw_intr)
 		return;
 
-	dpu_kms->hw_intr->ops.disable_all_irqs(dpu_kms->hw_intr);
+	dpu_hw_intr_disable_all_irqs(dpu_kms->hw_intr);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -383,7 +382,7 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 	 * Individual interrupt status bit will only get stored if it
 	 * is enabled.
 	 */
-	dpu_kms->hw_intr->ops.get_interrupt_statuses(dpu_kms->hw_intr);
+	dpu_hw_intr_get_interrupt_statuses(dpu_kms->hw_intr);
 
 	/*
 	 * Dispatch to HW driver to handle interrupt lookup that is being
@@ -393,7 +392,7 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 	 * callback, and do the interrupt status clearing once the registered
 	 * callback is finished.
 	 */
-	dpu_kms->hw_intr->ops.dispatch_irqs(
+	dpu_hw_intr_dispatch_irqs(
 			dpu_kms->hw_intr,
 			dpu_core_irq_callback_handler,
 			dpu_kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5c521de71567..a2db9807b41d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -755,7 +755,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 };
 
-static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
+int dpu_hw_intr_irq_idx_lookup(enum dpu_intr_type intr_type,
 		u32 instance_idx)
 {
 	int i;
@@ -771,7 +771,7 @@ static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
 	return -EINVAL;
 }
 
-static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
+void dpu_hw_intr_dispatch_irqs(struct dpu_hw_intr *intr,
 		void (*cbfunc)(void *, int),
 		void *arg)
 {
@@ -825,7 +825,7 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 				if (cbfunc)
 					cbfunc(arg, irq_idx);
 				else
-					intr->ops.clear_intr_status_nolock(
+					dpu_hw_intr_clear_intr_status_nolock(
 							intr, irq_idx);
 
 				/*
@@ -839,7 +839,7 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
 }
 
-static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
+int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
 {
 	int reg_idx;
 	unsigned long irq_flags;
@@ -886,7 +886,7 @@ static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
+int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
@@ -930,7 +930,7 @@ static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irq(struct dpu_hw_intr *intr, int irq_idx)
+int dpu_hw_intr_disable_irq(struct dpu_hw_intr *intr, int irq_idx)
 {
 	unsigned long irq_flags;
 
@@ -949,7 +949,7 @@ static int dpu_hw_intr_disable_irq(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
+int dpu_hw_intr_clear_all_irqs(struct dpu_hw_intr *intr)
 {
 	int i;
 
@@ -968,7 +968,7 @@ static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
 	return 0;
 }
 
-static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
+int dpu_hw_intr_disable_all_irqs(struct dpu_hw_intr *intr)
 {
 	int i;
 
@@ -987,7 +987,7 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	return 0;
 }
 
-static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
+void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
 {
 	int i;
 	u32 enable_mask;
@@ -1023,7 +1023,7 @@ static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
 	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
 }
 
-static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
+void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
 		int irq_idx)
 {
 	int reg_idx;
@@ -1039,7 +1039,7 @@ static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
 	wmb();
 }
 
-static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
+u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 		int irq_idx, bool clear)
 {
 	int reg_idx;
@@ -1072,19 +1072,6 @@ static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 	return intr_status;
 }
 
-static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
-{
-	ops->irq_idx_lookup = dpu_hw_intr_irqidx_lookup;
-	ops->enable_irq = dpu_hw_intr_enable_irq;
-	ops->disable_irq = dpu_hw_intr_disable_irq;
-	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
-	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
-	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
-	ops->get_interrupt_statuses = dpu_hw_intr_get_interrupt_statuses;
-	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
-	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
-}
-
 static void __intr_offset(struct dpu_mdss_cfg *m,
 		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
 {
@@ -1106,7 +1093,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		return ERR_PTR(-ENOMEM);
 
 	__intr_offset(m, addr, &intr->hw);
-	__setup_intr_ops(&intr->ops);
 
 	intr->irq_idx_tbl_size = ARRAY_SIZE(dpu_irq_map);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index fc9c98617281..17b0f7a862a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -77,99 +77,94 @@ enum dpu_intr_type {
 struct dpu_hw_intr;
 
 /**
- * Interrupt operations.
+ * dpu_hw_intr_irq_idx_lookup - Lookup IRQ index on the HW interrupt type
+ *                 Used for all irq related ops
+ * @intr_type:		Interrupt type defined in dpu_intr_type
+ * @instance_idx:	HW interrupt block instance
+ * @return:		irq_idx or -EINVAL for lookup fail
  */
-struct dpu_hw_intr_ops {
-	/**
-	 * irq_idx_lookup - Lookup IRQ index on the HW interrupt type
-	 *                 Used for all irq related ops
-	 * @intr_type:		Interrupt type defined in dpu_intr_type
-	 * @instance_idx:	HW interrupt block instance
-	 * @return:		irq_idx or -EINVAL for lookup fail
-	 */
-	int (*irq_idx_lookup)(
-			enum dpu_intr_type intr_type,
-			u32 instance_idx);
-
-	/**
-	 * enable_irq - Enable IRQ based on lookup IRQ index
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 * @return:	0 for success, otherwise failure
-	 */
-	int (*enable_irq)(
-			struct dpu_hw_intr *intr,
-			int irq_idx);
-
-	/**
-	 * disable_irq - Disable IRQ based on lookup IRQ index
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 * @return:	0 for success, otherwise failure
-	 */
-	int (*disable_irq)(
-			struct dpu_hw_intr *intr,
-			int irq_idx);
-
-	/**
-	 * clear_all_irqs - Clears all the interrupts (i.e. acknowledges
-	 *                  any asserted IRQs). Useful during reset.
-	 * @intr:	HW interrupt handle
-	 * @return:	0 for success, otherwise failure
-	 */
-	int (*clear_all_irqs)(
-			struct dpu_hw_intr *intr);
-
-	/**
-	 * disable_all_irqs - Disables all the interrupts. Useful during reset.
-	 * @intr:	HW interrupt handle
-	 * @return:	0 for success, otherwise failure
-	 */
-	int (*disable_all_irqs)(
-			struct dpu_hw_intr *intr);
-
-	/**
-	 * dispatch_irqs - IRQ dispatcher will call the given callback
-	 *                 function when a matching interrupt status bit is
-	 *                 found in the irq mapping table.
-	 * @intr:	HW interrupt handle
-	 * @cbfunc:	Callback function pointer
-	 * @arg:	Argument to pass back during callback
-	 */
-	void (*dispatch_irqs)(
-			struct dpu_hw_intr *intr,
-			void (*cbfunc)(void *arg, int irq_idx),
-			void *arg);
-
-	/**
-	 * get_interrupt_statuses - Gets and store value from all interrupt
-	 *                          status registers that are currently fired.
-	 * @intr:	HW interrupt handle
-	 */
-	void (*get_interrupt_statuses)(
-			struct dpu_hw_intr *intr);
-
-	/**
-	 * clear_intr_status_nolock() - clears the HW interrupts without lock
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 */
-	void (*clear_intr_status_nolock)(
-			struct dpu_hw_intr *intr,
-			int irq_idx);
-
-	/**
-	 * get_interrupt_status - Gets HW interrupt status, and clear if set,
-	 *                        based on given lookup IRQ index.
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 * @clear:	True to clear irq after read
-	 */
-	u32 (*get_interrupt_status)(
-			struct dpu_hw_intr *intr,
-			int irq_idx,
-			bool clear);
-};
+int dpu_hw_intr_irq_idx_lookup(
+		enum dpu_intr_type intr_type,
+		u32 instance_idx);
+
+/**
+ * dpu_hw_intr_enable_irq - Enable IRQ based on lookup IRQ index
+ * @intr:	HW interrupt handle
+ * @irq_idx:	Lookup irq index return from irq_idx_lookup
+ * @return:	0 for success, otherwise failure
+ */
+int dpu_hw_intr_enable_irq(
+		struct dpu_hw_intr *intr,
+		int irq_idx);
+
+/**
+ * dpu_hw_intr_disable_irq - Disable IRQ based on lookup IRQ index
+ * @intr:	HW interrupt handle
+ * @irq_idx:	Lookup irq index return from irq_idx_lookup
+ * @return:	0 for success, otherwise failure
+ */
+int dpu_hw_intr_disable_irq(
+		struct dpu_hw_intr *intr,
+		int irq_idx);
+
+/**
+ * dpu_hw_intr_clear_all_irqs - Clears all the interrupts (i.e. acknowledges
+ *                  any asserted IRQs). Useful during reset.
+ * @intr:	HW interrupt handle
+ * @return:	0 for success, otherwise failure
+ */
+int dpu_hw_intr_clear_all_irqs(
+		struct dpu_hw_intr *intr);
+
+/**
+ * dpu_hw_intr_disable_all_irqs - Disables all the interrupts. Useful during reset.
+ * @intr:	HW interrupt handle
+ * @return:	0 for success, otherwise failure
+ */
+int dpu_hw_intr_disable_all_irqs(
+		struct dpu_hw_intr *intr);
+
+/**
+ * dpu_hw_intr_dispatch_irqs - IRQ dispatcher will call the given callback
+ *                 function when a matching interrupt status bit is
+ *                 found in the irq mapping table.
+ * @intr:	HW interrupt handle
+ * @cbfunc:	Callback function pointer
+ * @arg:	Argument to pass back during callback
+ */
+void dpu_hw_intr_dispatch_irqs(
+		struct dpu_hw_intr *intr,
+		void dpu_hw_intr_cbfunc(void *arg, int irq_idx),
+		void *arg);
+
+/**
+ * dpu_hw_intr_get_interrupt_statuses - Gets and store value from all interrupt
+ *                          status registers that are currently fired.
+ * @intr:	HW interrupt handle
+ */
+void dpu_hw_intr_get_interrupt_statuses(
+		struct dpu_hw_intr *intr);
+
+/**
+ * dpu_hw_intr_clear_intr_status_nolock() - clears the HW interrupts without lock
+ * @intr:	HW interrupt handle
+ * @irq_idx:	Lookup irq index return from irq_idx_lookup
+ */
+void dpu_hw_intr_clear_intr_status_nolock(
+		struct dpu_hw_intr *intr,
+		int irq_idx);
+
+/**
+ * dpu_hw_intr_get_interrupt_status - Gets HW interrupt status, and clear if set,
+ *                        based on given lookup IRQ index.
+ * @intr:	HW interrupt handle
+ * @irq_idx:	Lookup irq index return from irq_idx_lookup
+ * @clear:	True to clear irq after read
+ */
+u32 dpu_hw_intr_get_interrupt_status(
+		struct dpu_hw_intr *intr,
+		int irq_idx,
+		bool clear);
 
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
@@ -182,7 +177,6 @@ struct dpu_hw_intr_ops {
  */
 struct dpu_hw_intr {
 	struct dpu_hw_blk_reg_map hw;
-	struct dpu_hw_intr_ops ops;
 	u32 *cache_irq_mask;
 	u32 *save_irq_status;
 	u32 irq_idx_tbl_size;
-- 
2.30.2

