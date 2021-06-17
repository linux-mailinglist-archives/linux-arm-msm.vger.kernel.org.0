Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F24E3ABEC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 00:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhFQWWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 18:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhFQWWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 18:22:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0141DC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:36 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id g13so838597ljj.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KNp0OPc9EcrpV+7/rUdffV4kvYyL0doenjQY0m33Xek=;
        b=GKPeazZu3ajhstJV9HBAvBbKZh7WtwDHEmZKZ8xMOa6IrwH+Xys4bZZYmdxPmxZsry
         7lUeFtWqEliqFfgZFzyB6mQ4EpvsqFlcZH8D2Gy+NDGjbaAK6Y08/42luKEDFmdF9zLl
         onlyR/Usz6n8epZtraMIYmyVlSkYZDVSd1nUty4MjSJfckYY61c6OjPrKXkRkmAwpHjB
         dPcU2qx5pRZ14dAIhfQx5sJGqkQkbs1ip3Nvv46LRHVZn4jJaUH6tXgZiUNQih8xF4Dc
         veDFHf7J8UrlQKb3NWdxKn/ah+/lteXSW/Bt6wpl1bw4YUxn0SVROGbeKuOfxKRbxsVt
         G1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNp0OPc9EcrpV+7/rUdffV4kvYyL0doenjQY0m33Xek=;
        b=L1S8RxqpYN9gNDGk9Fsff75sknsDp4agZZADtWv3hNFd16FIZIIE5dpZYBkaBn/Dzx
         nx3hcSkdDqmTp2CI5hFU5bAjZ55bXHmdpFsReomtBt2Kl7SGX/4hiKRi3iI95z5ygu3F
         WDs5DwkVc1/m8mO9rV9M1pDzHOomgfodlWMK8a0b4jfwH5V/GJnNLZQgcqbAmG36whCS
         +yYT5ylq8uZxIFoz/Bhw7bnec6ZLb1JPVh6VHGfJ9yP+VoFbWwfVI/baFpb2vJ8m6VEo
         1GRcx2D8abxjVs+KY7MVYgVgJndGYZr+fHBvLBLH5WQZOyQtbDP6fnKGT8ZAgTXFM29Q
         F0Fg==
X-Gm-Message-State: AOAM533Pe/9HUhQLgNMvn5XjXSxOcih5FDlAHyON7HJuVYPkKbPvBIK7
        U6x+9jhQ/GpbV3L/eQY81QOueQ==
X-Google-Smtp-Source: ABdhPJwzjzKLz2eGLURMZE6m3sI+7Z+lQaVhKhkSUkL7Ji5I5OwaNlZOyXfXGk/p6yOVJgxDQxkOUQ==
X-Received: by 2002:a2e:a368:: with SMTP id i8mr5160001ljn.426.1623968434344;
        Thu, 17 Jun 2021 15:20:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 15:20:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr
Date:   Fri, 18 Jun 2021 01:20:25 +0300
Message-Id: <20210617222029.463045-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As dpu_core_irq was merged into dpu_hw_intr, merge data structures too,
removing the need for a separate data structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 51 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  5 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       | 13 -----
 3 files changed, 28 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 28e9b0d448db..d2b6dca487e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -127,20 +127,19 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
  */
 static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
-	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
 	struct dpu_irq_callback *cb;
 
 	VERB("irq_idx=%d\n", irq_idx);
 
-	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx]))
+	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]))
 		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
 
-	atomic_inc(&irq_obj->irq_counts[irq_idx]);
+	atomic_inc(&dpu_kms->hw_intr->irq_counts[irq_idx]);
 
 	/*
 	 * Perform registered function callback
 	 */
-	list_for_each_entry(cb, &irq_obj->irq_cb_tbl[irq_idx], list)
+	list_for_each_entry(cb, &dpu_kms->hw_intr->irq_cb_tbl[irq_idx], list)
 		if (cb->func)
 			cb->func(cb->arg, irq_idx);
 }
@@ -420,6 +419,10 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 {
 	if (intr) {
 		kfree(intr->cache_irq_mask);
+
+		kfree(intr->irq_cb_tbl);
+		kfree(intr->irq_counts);
+
 		kfree(intr);
 	}
 }
@@ -429,7 +432,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 {
 	unsigned long irq_flags;
 
-	if (!dpu_kms->irq_obj.irq_cb_tbl) {
+	if (!dpu_kms->hw_intr->irq_cb_tbl) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -453,9 +456,9 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
 	list_add_tail(&register_irq_cb->list,
-			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
+			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]);
 	if (list_is_first(&register_irq_cb->list,
-			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
+			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
 		int ret = dpu_hw_intr_enable_irq_locked(
 				dpu_kms->hw_intr,
 				irq_idx);
@@ -473,7 +476,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 {
 	unsigned long irq_flags;
 
-	if (!dpu_kms->irq_obj.irq_cb_tbl) {
+	if (!dpu_kms->hw_intr->irq_cb_tbl) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -497,7 +500,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
 	/* empty callback list but interrupt is still enabled */
-	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
+	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
 		int ret = dpu_hw_intr_disable_irq_locked(
 				dpu_kms->hw_intr,
 				irq_idx);
@@ -515,19 +518,18 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 {
 	struct dpu_kms *dpu_kms = s->private;
-	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
 	struct dpu_irq_callback *cb;
 	unsigned long irq_flags;
 	int i, irq_count, cb_count;
 
-	if (WARN_ON(!irq_obj->irq_cb_tbl))
+	if (WARN_ON(!dpu_kms->hw_intr->irq_cb_tbl))
 		return 0;
 
-	for (i = 0; i < irq_obj->total_irqs; i++) {
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 		cb_count = 0;
-		irq_count = atomic_read(&irq_obj->irq_counts[i]);
-		list_for_each_entry(cb, &irq_obj->irq_cb_tbl[i], list)
+		irq_count = atomic_read(&dpu_kms->hw_intr->irq_counts[i]);
+		list_for_each_entry(cb, &dpu_kms->hw_intr->irq_cb_tbl[i], list)
 			cb_count++;
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
@@ -559,14 +561,13 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
 	/* Create irq callbacks for all possible irq_idx */
-	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
-	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
+	dpu_kms->hw_intr->irq_cb_tbl = kcalloc(dpu_kms->hw_intr->total_irqs,
 			sizeof(struct list_head), GFP_KERNEL);
-	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
+	dpu_kms->hw_intr->irq_counts = kcalloc(dpu_kms->hw_intr->total_irqs,
 			sizeof(atomic_t), GFP_KERNEL);
-	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
-		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
-		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+		INIT_LIST_HEAD(&dpu_kms->hw_intr->irq_cb_tbl[i]);
+		atomic_set(&dpu_kms->hw_intr->irq_counts[i], 0);
 	}
 }
 
@@ -575,17 +576,11 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++)
-		if (!list_empty(&dpu_kms->irq_obj.irq_cb_tbl[i]))
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
+		if (!list_empty(&dpu_kms->hw_intr->irq_cb_tbl[i]))
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
 
 	dpu_clear_irqs(dpu_kms);
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-
-	kfree(dpu_kms->irq_obj.irq_cb_tbl);
-	kfree(dpu_kms->irq_obj.irq_counts);
-	dpu_kms->irq_obj.irq_cb_tbl = NULL;
-	dpu_kms->irq_obj.irq_counts = NULL;
-	dpu_kms->irq_obj.total_irqs = 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 99ab01f54aa6..d50e78c9f148 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -40,6 +40,8 @@ enum dpu_hw_intr_reg {
  * @save_irq_status:  array of IRQ status reg storage created during init
  * @total_irqs: total number of irq_idx mapped in the hw_interrupts
  * @irq_lock:         spinlock for accessing IRQ resources
+ * @irq_cb_tbl:       array of IRQ callbacks lists
+ * @irq_counts:       array of IRQ counts
  */
 struct dpu_hw_intr {
 	struct dpu_hw_blk_reg_map hw;
@@ -48,6 +50,9 @@ struct dpu_hw_intr {
 	u32 total_irqs;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
+
+	struct list_head *irq_cb_tbl;
+	atomic_t *irq_counts;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 323a6bce9e64..775bcbda860f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -78,18 +78,6 @@ struct dpu_irq_callback {
 	void *arg;
 };
 
-/**
- * struct dpu_irq: IRQ structure contains callback registration info
- * @total_irq:    total number of irq_idx obtained from HW interrupts mapping
- * @irq_cb_tbl:   array of IRQ callbacks setting
- * @debugfs_file: debugfs file for irq statistics
- */
-struct dpu_irq {
-	u32 total_irqs;
-	struct list_head *irq_cb_tbl;
-	atomic_t *irq_counts;
-};
-
 struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
@@ -104,7 +92,6 @@ struct dpu_kms {
 	struct regulator *venus;
 
 	struct dpu_hw_intr *hw_intr;
-	struct dpu_irq irq_obj;
 
 	struct dpu_core_perf perf;
 
-- 
2.30.2

