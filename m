Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5AF3AB56F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 16:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhFQOLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 10:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbhFQOLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 10:11:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A352C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id r198so10713957lff.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OzUCtFpL56mL8rJXQ0AfPLhVM6UQA3/yTiauifyHJjE=;
        b=nDQkwiJN7cZm4E1nbO0KgKL9fUJbzaLdjT0HK8YD+wJEYFrIQqRSRMlic3V2CPUW/c
         RrnqDcJfktXfInWo1sLZzl3Uo1L8KA5iu2ag8O9iN6q9j/F6uUyVanwsrEndF3VKMU7B
         NS41/I5OneJ7ejP6zPLwiyf+5vVJNJqTCvtiHPVa2kkBh8BF6N1BVTtgYVBkOCYWK7Ge
         O2DY2dmxCjyyyA7AXM2Z6LMI09dnc6QhcPPclMAIKYXzMco9lOoOMNllu6pqAZi/L0bX
         MfY2CkTe9TJFbA6tsT+Ac00OZmTbnzf85FmiEX+N7a7HF4XseB102gPuXlfrAXVlwp7o
         53cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzUCtFpL56mL8rJXQ0AfPLhVM6UQA3/yTiauifyHJjE=;
        b=dcDAxwxczLqFCl0A2+qv5ybesAXMX2jolitXOewQbwIl2HPJCi2GGoypkVDw65CXxs
         EDWKp+uxaOxBM8+/S1Y/tEPoel36phm9dgfHPL/Kjil/8W+DBQDes2uLW8vqMW7ZtOcP
         cwx/WKOMFpplZ2NAim+5JnChhHtsECOhMu7LcQ4UDdhkvZ3tPnMn6RvTkz+T2TmchkUl
         vsDyjeIkY9S/fCV1hWq8P6nFsXT7FfRGCAYBRHASNcUYu011B3YGaoPwX2Ftl5xfvnhi
         Wzr5ruFFOZY5C5YJUx19ch/JEmuhkEio0/L9Ug09BPLL4fgBMdrE5uLIeUcFvXlopvyo
         LWDQ==
X-Gm-Message-State: AOAM532dwouSBCXMkKEKmqTTF/1hIPfdFHzzHXetQjYHKzJAnpepyoK5
        QeeS0RhKuOqMVNZTVx4pUnKcvj5rf4AemQ==
X-Google-Smtp-Source: ABdhPJxFUqhb04sFtaNiLOS6jgLZWlty/Gv2H0hq7cD02tYgJf/ujUfJC/BsWGwGEctDE9VOZ3gTgw==
X-Received: by 2002:a05:6512:ba8:: with SMTP id b40mr4449670lfv.588.1623938951326;
        Thu, 17 Jun 2021 07:09:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm592471lfm.128.2021.06.17.07.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:09:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/7] drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts
Date:   Thu, 17 Jun 2021 17:09:02 +0300
Message-Id: <20210617140908.412298-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
References: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With dpu_core_irq being the wrapper around dpu_hw_interrupts, there is
little sense in having them separate. Squash them together to remove
another layer of abstraction (hw_intr ops).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 256 -----------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 269 ++++++++++++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  87 ------
 4 files changed, 214 insertions(+), 399 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 65d86cecb571..54655e459866 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -51,7 +51,6 @@ msm-y := \
 	disp/mdp5/mdp5_mixer.o \
 	disp/mdp5/mdp5_plane.o \
 	disp/mdp5/mdp5_smp.o \
-	disp/dpu1/dpu_core_irq.o \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
 	disp/dpu1/dpu_encoder.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
deleted file mode 100644
index 18557b9713b6..000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ /dev/null
@@ -1,256 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
- */
-
-#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
-
-#include <linux/debugfs.h>
-#include <linux/irqdomain.h>
-#include <linux/irq.h>
-#include <linux/kthread.h>
-
-#include "dpu_core_irq.h"
-#include "dpu_trace.h"
-
-/**
- * dpu_core_irq_callback_handler - dispatch core interrupts
- * @arg:		private data of callback handler
- * @irq_idx:		interrupt index
- */
-static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
-{
-	struct dpu_kms *dpu_kms = arg;
-	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
-	struct dpu_irq_callback *cb;
-
-	pr_debug("irq_idx=%d\n", irq_idx);
-
-	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx]))
-		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
-
-	atomic_inc(&irq_obj->irq_counts[irq_idx]);
-
-	/*
-	 * Perform registered function callback
-	 */
-	list_for_each_entry(cb, &irq_obj->irq_cb_tbl[irq_idx], list)
-		if (cb->func)
-			cb->func(cb->arg, irq_idx);
-}
-
-u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
-{
-	if (!dpu_kms->hw_intr ||
-			!dpu_kms->hw_intr->ops.get_interrupt_status)
-		return 0;
-
-	if (irq_idx < 0) {
-		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
-				__builtin_return_address(0), irq_idx);
-		return 0;
-	}
-
-	return dpu_kms->hw_intr->ops.get_interrupt_status(dpu_kms->hw_intr,
-			irq_idx, clear);
-}
-
-int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		struct dpu_irq_callback *register_irq_cb)
-{
-	unsigned long irq_flags;
-
-	if (!dpu_kms->irq_obj.irq_cb_tbl) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	if (!register_irq_cb || !register_irq_cb->func) {
-		DPU_ERROR("invalid irq_cb:%d func:%d\n",
-				register_irq_cb != NULL,
-				register_irq_cb ?
-					register_irq_cb->func != NULL : -1);
-		return -EINVAL;
-	}
-
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
-		return -EINVAL;
-	}
-
-	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
-
-	irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
-	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
-	list_del_init(&register_irq_cb->list);
-	list_add_tail(&register_irq_cb->list,
-			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
-	if (list_is_first(&register_irq_cb->list,
-			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
-		int ret = dpu_kms->hw_intr->ops.enable_irq_locked(
-				dpu_kms->hw_intr,
-				irq_idx);
-		if (ret)
-			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
-					irq_idx);
-	}
-	dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
-
-	return 0;
-}
-
-int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
-		struct dpu_irq_callback *register_irq_cb)
-{
-	unsigned long irq_flags;
-
-	if (!dpu_kms->irq_obj.irq_cb_tbl) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	if (!register_irq_cb || !register_irq_cb->func) {
-		DPU_ERROR("invalid irq_cb:%d func:%d\n",
-				register_irq_cb != NULL,
-				register_irq_cb ?
-					register_irq_cb->func != NULL : -1);
-		return -EINVAL;
-	}
-
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
-		return -EINVAL;
-	}
-
-	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
-
-	irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
-	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
-	list_del_init(&register_irq_cb->list);
-	/* empty callback list but interrupt is still enabled */
-	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
-		int ret = dpu_kms->hw_intr->ops.disable_irq_locked(
-				dpu_kms->hw_intr,
-				irq_idx);
-		if (ret)
-			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
-					irq_idx);
-		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
-	}
-	dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
-
-	return 0;
-}
-
-static void dpu_clear_all_irqs(struct dpu_kms *dpu_kms)
-{
-	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.clear_all_irqs)
-		return;
-
-	dpu_kms->hw_intr->ops.clear_all_irqs(dpu_kms->hw_intr);
-}
-
-static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
-{
-	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.disable_all_irqs)
-		return;
-
-	dpu_kms->hw_intr->ops.disable_all_irqs(dpu_kms->hw_intr);
-}
-
-#ifdef CONFIG_DEBUG_FS
-static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
-{
-	struct dpu_kms *dpu_kms = s->private;
-	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
-	struct dpu_irq_callback *cb;
-	unsigned long irq_flags;
-	int i, irq_count, cb_count;
-
-	if (WARN_ON(!irq_obj->irq_cb_tbl))
-		return 0;
-
-	for (i = 0; i < irq_obj->total_irqs; i++) {
-		irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
-		cb_count = 0;
-		irq_count = atomic_read(&irq_obj->irq_counts[i]);
-		list_for_each_entry(cb, &irq_obj->irq_cb_tbl[i], list)
-			cb_count++;
-		dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
-
-		if (irq_count || cb_count)
-			seq_printf(s, "idx:%d irq:%d cb:%d\n",
-					i, irq_count, cb_count);
-	}
-
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_core_irq);
-
-void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
-		struct dentry *parent)
-{
-	debugfs_create_file("core_irq", 0600, parent, dpu_kms,
-		&dpu_debugfs_core_irq_fops);
-}
-#endif
-
-void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
-{
-	int i;
-
-	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	dpu_clear_all_irqs(dpu_kms);
-	dpu_disable_all_irqs(dpu_kms);
-	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-
-	/* Create irq callbacks for all possible irq_idx */
-	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
-	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
-			sizeof(struct list_head), GFP_KERNEL);
-	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
-			sizeof(atomic_t), GFP_KERNEL);
-	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
-		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
-		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
-	}
-}
-
-void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
-{
-	int i;
-
-	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++)
-		if (!list_empty(&dpu_kms->irq_obj.irq_cb_tbl[i]))
-			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
-
-	dpu_clear_all_irqs(dpu_kms);
-	dpu_disable_all_irqs(dpu_kms);
-	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-
-	kfree(dpu_kms->irq_obj.irq_cb_tbl);
-	kfree(dpu_kms->irq_obj.irq_counts);
-	dpu_kms->irq_obj.irq_cb_tbl = NULL;
-	dpu_kms->irq_obj.irq_counts = NULL;
-	dpu_kms->irq_obj.total_irqs = 0;
-}
-
-irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
-{
-	/*
-	 * Dispatch to HW driver to handle interrupt lookup that is being
-	 * fired. When matching interrupt is located, HW driver will call to
-	 * dpu_core_irq_callback_handler with the irq_idx from the lookup table.
-	 * dpu_core_irq_callback_handler will perform the registered function
-	 * callback, and do the interrupt status clearing once the registered
-	 * callback is finished.
-	 * Function will also clear the interrupt status after reading.
-	 */
-	dpu_kms->hw_intr->ops.dispatch_irqs(
-			dpu_kms->hw_intr,
-			dpu_core_irq_callback_handler,
-			dpu_kms);
-
-	return IRQ_HANDLED;
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 2e816f232e85..8e890f981afd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -3,12 +3,15 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/debugfs.h>
 #include <linux/slab.h>
 
+#include "dpu_core_irq.h"
 #include "dpu_kms.h"
 #include "dpu_hw_interrupts.h"
 #include "dpu_hw_util.h"
 #include "dpu_hw_mdss.h"
+#include "dpu_trace.h"
 
 /**
  * Register offsets in MDSS register file for the interrupt registers
@@ -132,10 +135,34 @@ static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
 	wmb();
 }
 
-static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
-		void (*cbfunc)(void *, int),
-		void *arg)
+/**
+ * dpu_core_irq_callback_handler - dispatch core interrupts
+ * @arg:		private data of callback handler
+ * @irq_idx:		interrupt index
+ */
+static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
+	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
+	struct dpu_irq_callback *cb;
+
+	pr_debug("irq_idx=%d\n", irq_idx);
+
+	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx]))
+		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
+
+	atomic_inc(&irq_obj->irq_counts[irq_idx]);
+
+	/*
+	 * Perform registered function callback
+	 */
+	list_for_each_entry(cb, &irq_obj->irq_cb_tbl[irq_idx], list)
+		if (cb->func)
+			cb->func(cb->arg, irq_idx);
+}
+
+irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
+{
+	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
 	int irq_idx;
 	u32 irq_status;
@@ -144,13 +171,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	unsigned long irq_flags;
 
 	if (!intr)
-		return;
+		return IRQ_NONE;
 
-	/*
-	 * The dispatcher will save the IRQ status before calling here.
-	 * Now need to go through each IRQ status and find matching
-	 * irq lookup index.
-	 */
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
 		if (!test_bit(reg_idx, &intr->irq_mask))
@@ -178,15 +200,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		 */
 		while ((bit = ffs(irq_status)) != 0) {
 			irq_idx = DPU_IRQ_IDX(reg_idx, bit - 1);
-			/*
-			 * Once a match on irq mask, perform a callback
-			 * to the given cbfunc. cbfunc will take care
-			 * the interrupt status clearing. If cbfunc is
-			 * not provided, then the interrupt clearing
-			 * is here.
-			 */
-			if (cbfunc)
-				cbfunc(arg, irq_idx);
+
+			dpu_core_irq_callback_handler(dpu_kms, irq_idx);
 
 			dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
 
@@ -203,6 +218,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	wmb();
 
 	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
+
+	return IRQ_HANDLED;
 }
 
 static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
@@ -303,12 +320,13 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	return 0;
 }
 
-static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
+static void dpu_clear_irqs(struct dpu_kms *dpu_kms)
 {
+	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int i;
 
 	if (!intr)
-		return -EINVAL;
+		return;
 
 	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
 		if (test_bit(i, &intr->irq_mask))
@@ -318,16 +336,15 @@ static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
 
 	/* ensure register writes go through */
 	wmb();
-
-	return 0;
 }
 
-static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
+static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 {
+	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int i;
 
 	if (!intr)
-		return -EINVAL;
+		return;
 
 	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
 		if (test_bit(i, &intr->irq_mask))
@@ -337,13 +354,11 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 
 	/* ensure register writes go through */
 	wmb();
-
-	return 0;
 }
 
-static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
-		int irq_idx, bool clear)
+u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
 {
+	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
 	unsigned long irq_flags;
 	u32 intr_status;
@@ -351,6 +366,12 @@ static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 	if (!intr)
 		return 0;
 
+	if (irq_idx < 0) {
+		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
+				__builtin_return_address(0), irq_idx);
+		return 0;
+	}
+
 	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return 0;
@@ -374,32 +395,6 @@ static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 	return intr_status;
 }
 
-static unsigned long dpu_hw_intr_lock(struct dpu_hw_intr *intr)
-{
-	unsigned long irq_flags;
-
-	spin_lock_irqsave(&intr->irq_lock, irq_flags);
-
-	return irq_flags;
-}
-
-static void dpu_hw_intr_unlock(struct dpu_hw_intr *intr, unsigned long irq_flags)
-{
-	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
-}
-
-static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
-{
-	ops->enable_irq_locked = dpu_hw_intr_enable_irq_locked;
-	ops->disable_irq_locked = dpu_hw_intr_disable_irq_locked;
-	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
-	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
-	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
-	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
-	ops->lock = dpu_hw_intr_lock;
-	ops->unlock = dpu_hw_intr_unlock;
-}
-
 static void __intr_offset(struct dpu_mdss_cfg *m,
 		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
 {
@@ -421,7 +416,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		return ERR_PTR(-ENOMEM);
 
 	__intr_offset(m, addr, &intr->hw);
-	__setup_intr_ops(&intr->ops);
 
 	intr->total_irqs = ARRAY_SIZE(dpu_intr_set) * 32;
 
@@ -447,3 +441,168 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 	}
 }
 
+int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
+		struct dpu_irq_callback *register_irq_cb)
+{
+	unsigned long irq_flags;
+
+	if (!dpu_kms->irq_obj.irq_cb_tbl) {
+		DPU_ERROR("invalid params\n");
+		return -EINVAL;
+	}
+
+	if (!register_irq_cb || !register_irq_cb->func) {
+		DPU_ERROR("invalid irq_cb:%d func:%d\n",
+				register_irq_cb != NULL,
+				register_irq_cb ?
+					register_irq_cb->func != NULL : -1);
+		return -EINVAL;
+	}
+
+	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
+		return -EINVAL;
+	}
+
+	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+
+	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
+	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
+	list_del_init(&register_irq_cb->list);
+	list_add_tail(&register_irq_cb->list,
+			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
+	if (list_is_first(&register_irq_cb->list,
+			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
+		int ret = dpu_hw_intr_enable_irq_locked(
+				dpu_kms->hw_intr,
+				irq_idx);
+		if (ret)
+			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
+					irq_idx);
+	}
+	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
+
+	return 0;
+}
+
+int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
+		struct dpu_irq_callback *register_irq_cb)
+{
+	unsigned long irq_flags;
+
+	if (!dpu_kms->irq_obj.irq_cb_tbl) {
+		DPU_ERROR("invalid params\n");
+		return -EINVAL;
+	}
+
+	if (!register_irq_cb || !register_irq_cb->func) {
+		DPU_ERROR("invalid irq_cb:%d func:%d\n",
+				register_irq_cb != NULL,
+				register_irq_cb ?
+					register_irq_cb->func != NULL : -1);
+		return -EINVAL;
+	}
+
+	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
+		return -EINVAL;
+	}
+
+	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+
+	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
+	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
+	list_del_init(&register_irq_cb->list);
+	/* empty callback list but interrupt is still enabled */
+	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
+		int ret = dpu_hw_intr_disable_irq_locked(
+				dpu_kms->hw_intr,
+				irq_idx);
+		if (ret)
+			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
+					irq_idx);
+		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
+	}
+	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
+{
+	struct dpu_kms *dpu_kms = s->private;
+	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
+	struct dpu_irq_callback *cb;
+	unsigned long irq_flags;
+	int i, irq_count, cb_count;
+
+	if (WARN_ON(!irq_obj->irq_cb_tbl))
+		return 0;
+
+	for (i = 0; i < irq_obj->total_irqs; i++) {
+		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
+		cb_count = 0;
+		irq_count = atomic_read(&irq_obj->irq_counts[i]);
+		list_for_each_entry(cb, &irq_obj->irq_cb_tbl[i], list)
+			cb_count++;
+		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
+
+		if (irq_count || cb_count)
+			seq_printf(s, "idx:%d irq:%d cb:%d\n",
+					i, irq_count, cb_count);
+	}
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_core_irq);
+
+void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
+		struct dentry *parent)
+{
+	debugfs_create_file("core_irq", 0600, parent, dpu_kms,
+		&dpu_debugfs_core_irq_fops);
+}
+#endif
+
+void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
+{
+	int i;
+
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
+	dpu_clear_irqs(dpu_kms);
+	dpu_disable_all_irqs(dpu_kms);
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
+
+	/* Create irq callbacks for all possible irq_idx */
+	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
+	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
+			sizeof(struct list_head), GFP_KERNEL);
+	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
+			sizeof(atomic_t), GFP_KERNEL);
+	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
+		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
+		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
+	}
+}
+
+void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
+{
+	int i;
+
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
+	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++)
+		if (!list_empty(&dpu_kms->irq_obj.irq_cb_tbl[i]))
+			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
+
+	dpu_clear_irqs(dpu_kms);
+	dpu_disable_all_irqs(dpu_kms);
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
+
+	kfree(dpu_kms->irq_obj.irq_cb_tbl);
+	kfree(dpu_kms->irq_obj.irq_counts);
+	dpu_kms->irq_obj.irq_cb_tbl = NULL;
+	dpu_kms->irq_obj.irq_counts = NULL;
+	dpu_kms->irq_obj.total_irqs = 0;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index ac83c1159815..99ab01f54aa6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -32,92 +32,6 @@ enum dpu_hw_intr_reg {
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
-struct dpu_hw_intr;
-
-/**
- * Interrupt operations.
- */
-struct dpu_hw_intr_ops {
-
-	/**
-	 * enable_irq - Enable IRQ based on lookup IRQ index
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 * @return:	0 for success, otherwise failure
-	 */
-	int (*enable_irq_locked)(
-			struct dpu_hw_intr *intr,
-			int irq_idx);
-
-	/**
-	 * disable_irq - Disable IRQ based on lookup IRQ index
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 * @return:	0 for success, otherwise failure
-	 */
-	int (*disable_irq_locked)(
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
-
-	/**
-	 * lock - take the IRQ lock
-	 * @intr:	HW interrupt handle
-	 * @return:	irq_flags for the taken spinlock
-	 */
-	unsigned long (*lock)(
-			struct dpu_hw_intr *intr);
-
-	/**
-	 * unlock - take the IRQ lock
-	 * @intr:	HW interrupt handle
-	 * @irq_flags:  the irq_flags returned from lock
-	 */
-	void (*unlock)(
-			struct dpu_hw_intr *intr, unsigned long irq_flags);
-};
-
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
  * @hw:               virtual address mapping
@@ -129,7 +43,6 @@ struct dpu_hw_intr_ops {
  */
 struct dpu_hw_intr {
 	struct dpu_hw_blk_reg_map hw;
-	struct dpu_hw_intr_ops ops;
 	u32 *cache_irq_mask;
 	u32 *save_irq_status;
 	u32 total_irqs;
-- 
2.30.2

