Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9433820F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 22:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233459AbhEPUan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 16:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbhEPUam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 16:30:42 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17246C061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:29:27 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v8so775625lft.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nQ0RNViDE9wid39iCFtNijq/IOWNIIlnl1E012JpwiI=;
        b=yRzcNM6mJk0GAwzQ0zeSCaYwz6McCoVYVYna7Gugi/gqFYgMyxCpbg9LHyRAw+DtZL
         W+nxtFew5T+pNwH9Fg0UnKnt+Oc4O8LtwfjYAoOiDw7KnCZSRPVYwL4CXI6bE/KXuVWE
         B666f4YwD7Wut39N2Pg4IU2ks90NPuI2EvVsc6lusLmyQfpr9KW+GWmf9biTKXuQKHfa
         sfxIBuNUg6etOVDBuNOD7l8KN2zZsZ15w5vPY2G3EJvLopG6k6XqmGnmwaO5QC93lEdk
         QlZM77rw6UKOSGSkwTCyo5o+W/ipQ1wchyEHO/t0uYTHdgxvh0eua8vJ7mwSovGKISHP
         uqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nQ0RNViDE9wid39iCFtNijq/IOWNIIlnl1E012JpwiI=;
        b=WZ6Vh0FP3BI0zszotrRpUwUuCKPaiUZ16HUSg9O4nq9yEvNZsG2QnKq5H5cX5ueClW
         qv30CGdzZmN2y+V23Wx/vLCVFolWH8PymYndpPGT7AltE6IvkoZEUEoh26jXmdJks8oq
         J/tGI6oH8B8/qI/WS/w+KBQoS/IAVcULoNCb48/0TcmkcLUNk6TvKwcRejLg6hsDPnQR
         AfNG+eLDjK2GaesC2o2pR2DFb7p+76hcGo9UhSzTJeYGY4FRrhLL1HZZ0IL3ISXYHYbF
         d4u4yA+PPxFZhDDRQpoZeNFgbqUjHh7ldhcfARcarh4BrZztT1fVdDLGi4RFyXoLYfDd
         lyMg==
X-Gm-Message-State: AOAM531dyRtfvYVdgCZQ9z4kwEYzr0hI5Kyw4ndV+UTC4mTtRpz+9w6K
        VwllgstkYwIwlsHuBKgwYNxdSA==
X-Google-Smtp-Source: ABdhPJycao9AYmhzodDzcpTCvqWjVVhmusMNL3rpMJyRzs4RrOCwHPj6Z3iD+ztVKc2q7ET1RnmL5g==
X-Received: by 2002:a19:ed17:: with SMTP id y23mr2795718lfy.373.1621196965545;
        Sun, 16 May 2021 13:29:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l10sm2629795ljc.132.2021.05.16.13.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 13:29:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/msm/dpu: simplify IRQ enabling/disabling
Date:   Sun, 16 May 2021 23:29:11 +0300
Message-Id: <20210516202910.2141079-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Merge dpu_core_irq_enable() into dpu_core_irq_register_callback() and
dpu_core_irq_disable() into dpu_core_irq_unregister_callback(), because
they are called in pairs. There is no need to have separate
enable/disable pair, we can enable hardware IRQ when first callback is
registered and when the last callback is unregistered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 168 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h |  30 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c  |  18 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h    |   8 -
 5 files changed, 27 insertions(+), 199 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 11c0abed21ee..4f110c428b60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -26,10 +26,8 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 
 	pr_debug("irq_idx=%d\n", irq_idx);
 
-	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx])) {
-		DRM_ERROR("no registered cb, idx:%d enable_count:%d\n", irq_idx,
-			atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]));
-	}
+	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx]))
+		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
 
 	atomic_inc(&irq_obj->irq_counts[irq_idx]);
 
@@ -43,127 +41,6 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
 }
 
-/**
- * _dpu_core_irq_enable - enable core interrupt given by the index
- * @dpu_kms:		Pointer to dpu kms context
- * @irq_idx:		interrupt index
- */
-static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
-{
-	unsigned long irq_flags;
-	int ret = 0, enable_count;
-
-	if (!dpu_kms->hw_intr ||
-			!dpu_kms->irq_obj.enable_counts ||
-			!dpu_kms->irq_obj.irq_counts) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
-		return -EINVAL;
-	}
-
-	enable_count = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]);
-	DRM_DEBUG_KMS("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
-	trace_dpu_core_irq_enable_idx(irq_idx, enable_count);
-
-	if (atomic_inc_return(&dpu_kms->irq_obj.enable_counts[irq_idx]) == 1) {
-		ret = dpu_kms->hw_intr->ops.enable_irq(
-				dpu_kms->hw_intr,
-				irq_idx);
-		if (ret)
-			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
-					irq_idx);
-
-		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
-
-		spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
-		/* empty callback list but interrupt is enabled */
-		if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]))
-			DPU_ERROR("irq_idx=%d enabled with no callback\n",
-					irq_idx);
-		spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
-	}
-
-	return ret;
-}
-
-int dpu_core_irq_enable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
-{
-	int i, ret = 0, counts;
-
-	if (!irq_idxs || !irq_count) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	counts = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idxs[0]]);
-	if (counts)
-		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
-
-	for (i = 0; (i < irq_count) && !ret; i++)
-		ret = _dpu_core_irq_enable(dpu_kms, irq_idxs[i]);
-
-	return ret;
-}
-
-/**
- * _dpu_core_irq_disable - disable core interrupt given by the index
- * @dpu_kms:		Pointer to dpu kms context
- * @irq_idx:		interrupt index
- */
-static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
-{
-	int ret = 0, enable_count;
-
-	if (!dpu_kms->hw_intr || !dpu_kms->irq_obj.enable_counts) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
-		return -EINVAL;
-	}
-
-	enable_count = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]);
-	DRM_DEBUG_KMS("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
-	trace_dpu_core_irq_disable_idx(irq_idx, enable_count);
-
-	if (atomic_dec_return(&dpu_kms->irq_obj.enable_counts[irq_idx]) == 0) {
-		ret = dpu_kms->hw_intr->ops.disable_irq(
-				dpu_kms->hw_intr,
-				irq_idx);
-		if (ret)
-			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
-					irq_idx);
-		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
-	}
-
-	return ret;
-}
-
-int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
-{
-	int i, ret = 0, counts;
-
-	if (!irq_idxs || !irq_count) {
-		DPU_ERROR("invalid params\n");
-		return -EINVAL;
-	}
-
-	counts = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idxs[0]]);
-	if (counts == 2)
-		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
-
-	for (i = 0; (i < irq_count) && !ret; i++)
-		ret = _dpu_core_irq_disable(dpu_kms, irq_idxs[i]);
-
-	return ret;
-}
-
 u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
 {
 	if (!dpu_kms->hw_intr ||
@@ -210,6 +87,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	list_del_init(&register_irq_cb->list);
 	list_add_tail(&register_irq_cb->list,
 			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
+	if (list_is_first(&register_irq_cb->list,
+			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
+		int ret = dpu_kms->hw_intr->ops.enable_irq(
+				dpu_kms->hw_intr,
+				irq_idx);
+		if (ret)
+			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
+					irq_idx);
+	}
+
 	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
 
 	return 0;
@@ -244,9 +131,15 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
 	/* empty callback list but interrupt is still enabled */
-	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]) &&
-			atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]))
-		DPU_ERROR("irq_idx=%d enabled with no callback\n", irq_idx);
+	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
+		int ret = dpu_kms->hw_intr->ops.disable_irq(
+				dpu_kms->hw_intr,
+				irq_idx);
+		if (ret)
+			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
+					irq_idx);
+		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
+	}
 	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
 
 	return 0;
@@ -274,23 +167,22 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	struct dpu_irq *irq_obj = s->private;
 	struct dpu_irq_callback *cb;
 	unsigned long irq_flags;
-	int i, irq_count, enable_count, cb_count;
+	int i, irq_count, cb_count;
 
-	if (WARN_ON(!irq_obj->enable_counts || !irq_obj->irq_cb_tbl))
+	if (WARN_ON(!irq_obj->irq_cb_tbl))
 		return 0;
 
 	for (i = 0; i < irq_obj->total_irqs; i++) {
 		spin_lock_irqsave(&irq_obj->cb_lock, irq_flags);
 		cb_count = 0;
 		irq_count = atomic_read(&irq_obj->irq_counts[i]);
-		enable_count = atomic_read(&irq_obj->enable_counts[i]);
 		list_for_each_entry(cb, &irq_obj->irq_cb_tbl[i], list)
 			cb_count++;
 		spin_unlock_irqrestore(&irq_obj->cb_lock, irq_flags);
 
-		if (irq_count || enable_count || cb_count)
-			seq_printf(s, "idx:%d irq:%d enable:%d cb:%d\n",
-					i, irq_count, enable_count, cb_count);
+		if (irq_count || cb_count)
+			seq_printf(s, "idx:%d irq:%d cb:%d\n",
+					i, irq_count, cb_count);
 	}
 
 	return 0;
@@ -321,13 +213,10 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
 	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
 			sizeof(struct list_head), GFP_KERNEL);
-	dpu_kms->irq_obj.enable_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
-			sizeof(atomic_t), GFP_KERNEL);
 	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
 			sizeof(atomic_t), GFP_KERNEL);
 	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
 		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
-		atomic_set(&dpu_kms->irq_obj.enable_counts[i], 0);
 		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
 	}
 }
@@ -338,8 +227,7 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++)
-		if (atomic_read(&dpu_kms->irq_obj.enable_counts[i]) ||
-				!list_empty(&dpu_kms->irq_obj.irq_cb_tbl[i]))
+		if (!list_empty(&dpu_kms->irq_obj.irq_cb_tbl[i]))
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
 
 	dpu_clear_all_irqs(dpu_kms);
@@ -347,10 +235,8 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
 	kfree(dpu_kms->irq_obj.irq_cb_tbl);
-	kfree(dpu_kms->irq_obj.enable_counts);
 	kfree(dpu_kms->irq_obj.irq_counts);
 	dpu_kms->irq_obj.irq_cb_tbl = NULL;
-	dpu_kms->irq_obj.enable_counts = NULL;
 	dpu_kms->irq_obj.irq_counts = NULL;
 	dpu_kms->irq_obj.total_irqs = 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index d147784d5531..90ae6c9ccc95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -29,36 +29,6 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms);
  */
 irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms);
 
-/**
- * dpu_core_irq_enable - IRQ helper function for enabling one or more IRQs
- * @dpu_kms:		DPU handle
- * @irq_idxs:		Array of irq index
- * @irq_count:		Number of irq_idx provided in the array
- * @return:		0 for success enabling IRQ, otherwise failure
- *
- * This function increments count on each enable and decrements on each
- * disable.  Interrupts is enabled if count is 0 before increment.
- */
-int dpu_core_irq_enable(
-		struct dpu_kms *dpu_kms,
-		int *irq_idxs,
-		uint32_t irq_count);
-
-/**
- * dpu_core_irq_disable - IRQ helper function for disabling one of more IRQs
- * @dpu_kms:		DPU handle
- * @irq_idxs:		Array of irq index
- * @irq_count:		Number of irq_idx provided in the array
- * @return:		0 for success disabling IRQ, otherwise failure
- *
- * This function increments count on each enable and decrements on each
- * disable.  Interrupts is disabled if count is 0 after decrement.
- */
-int dpu_core_irq_disable(
-		struct dpu_kms *dpu_kms,
-		int *irq_idxs,
-		uint32_t irq_count);
-
 /**
  * dpu_core_irq_read - IRQ helper function for reading IRQ status
  * @dpu_kms:		DPU handle
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8a9d01e3b664..18c410433bb4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -360,17 +360,6 @@ int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
 		return ret;
 	}
 
-	ret = dpu_core_irq_enable(phys_enc->dpu_kms, &irq->irq_idx, 1);
-	if (ret) {
-		DRM_ERROR("enable failed id=%u, intr=%d, irq=%d",
-			  DRMID(phys_enc->parent), intr_idx,
-			  irq->irq_idx);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				irq->irq_idx, &irq->cb);
-		irq->irq_idx = -EINVAL;
-		return ret;
-	}
-
 	trace_dpu_enc_irq_register_success(DRMID(phys_enc->parent), intr_idx,
 				irq->irq_idx);
 
@@ -393,13 +382,6 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
 		return 0;
 	}
 
-	ret = dpu_core_irq_disable(phys_enc->dpu_kms, &irq->irq_idx, 1);
-	if (ret) {
-		DRM_ERROR("disable failed id=%u, intr=%d, irq=%d ret=%d",
-			  DRMID(phys_enc->parent), intr_idx,
-			  irq->irq_idx, ret);
-	}
-
 	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, irq->irq_idx,
 			&irq->cb);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d6717d6672f7..f6840b1af6e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -82,14 +82,12 @@ struct dpu_irq_callback {
  * struct dpu_irq: IRQ structure contains callback registration info
  * @total_irq:    total number of irq_idx obtained from HW interrupts mapping
  * @irq_cb_tbl:   array of IRQ callbacks setting
- * @enable_counts array of IRQ enable counts
  * @cb_lock:      callback lock
  * @debugfs_file: debugfs file for irq statistics
  */
 struct dpu_irq {
 	u32 total_irqs;
 	struct list_head *irq_cb_tbl;
-	atomic_t *enable_counts;
 	atomic_t *irq_counts;
 	spinlock_t cb_lock;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index e349ea78a49d..00b43959f631 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -891,14 +891,6 @@ DECLARE_EVENT_CLASS(dpu_core_irq_idx_cnt_template,
 	TP_printk("irq_idx:%d enable_count:%u", __entry->irq_idx,
 		  __entry->enable_count)
 );
-DEFINE_EVENT(dpu_core_irq_idx_cnt_template, dpu_core_irq_enable_idx,
-	TP_PROTO(int irq_idx, int enable_count),
-	TP_ARGS(irq_idx, enable_count)
-);
-DEFINE_EVENT(dpu_core_irq_idx_cnt_template, dpu_core_irq_disable_idx,
-	TP_PROTO(int irq_idx, int enable_count),
-	TP_ARGS(irq_idx, enable_count)
-);
 
 DECLARE_EVENT_CLASS(dpu_core_irq_callback_template,
 	TP_PROTO(int irq_idx, struct dpu_irq_callback *callback),
-- 
2.30.2

