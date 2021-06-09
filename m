Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53673A209E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 01:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhFIXRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 19:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhFIXRx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 19:17:53 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D50C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jun 2021 16:15:57 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so12046131otk.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 16:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+qXEuKMwT/Oi1kda+1x77Hj9YustkgX0B7x2oE+wko=;
        b=CozgERK9mWAGLeGbIgbK6FIiUpzN01bkJbwK/Zks7x8ccKbLRkaESJ+H+Bv0lV1ePV
         dbhEAWHlvCAqC2pwJYqmctisuPGwGCFbgCRbogD7A1URYsQ7XV4UqRNeR8OZd9pw7HI4
         gZc2e7RJqgb+buc8mmmKN7uVQ7SKLU6mAqMimjUVONpqRm0dHhYt9Buly5JHj8Ey1gKN
         jNlJ98Iyw4/az9+JOYoZ0CWndTp61RM5JRav4t4eySFXtEw1f6P4mdM3uiFK0CfM4M+e
         aTr/6qgDHcAzvKEB9/MCEbGW9PuU/pQa0+Oms0AB95wq/z033XlgOyecmdFXtOcmmR1P
         /cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+qXEuKMwT/Oi1kda+1x77Hj9YustkgX0B7x2oE+wko=;
        b=kS2W/Qwo79k4PyDMPFV9PnAV7gte10xN9qW9EdAOE2e0XX/F7iKr5MVZSiS6cokRcb
         xVf8YAMZwgA7mTChEjw7guteRz6iMpUEmMXTN2wT3HmjVYydFR0K9te2bp5Q9bws2eM6
         F7UabB4jiN3EwOfRbHq0U6TK91Ge6T7JcxTeIJzVt7b7QPzhNvwjWDhghaEKmIgSduvB
         AL7He1btbMOpPHynSWWASYMeQpEsAgiSP8Lbr7RhhXlulj4rM47aHG2Zfj14O+skfxTh
         0wDpxBVOIYoM+Q4hIYAEpgNsY18m66tR9Q0ZDl2+TYwrFGdfg5khv71C7hLFuJkhDMdS
         pf5Q==
X-Gm-Message-State: AOAM532xs4cUeH7owkErDGUy5f4GTYD3y5A2SE3S4GBnGtYqRUTf6vXd
        qOaSLI4MSqWySABjrbTjJAfdGw==
X-Google-Smtp-Source: ABdhPJzooXnp7EQxQROOT+sxrgNDDlaYzFNFLhSLck9XXChNXHZU8TVmbfVi32Cje1OtodPD0qw5ow==
X-Received: by 2002:a9d:1b63:: with SMTP id l90mr1519714otl.219.1623280556395;
        Wed, 09 Jun 2021 16:15:56 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f19sm299960ots.41.2021.06.09.16.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 16:15:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Avoid ABBA deadlock between IRQ modules
Date:   Wed,  9 Jun 2021 16:15:07 -0700
Message-Id: <20210609231507.3031904-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Handling of the interrupt callback lists is done in dpu_core_irq.c,
under the "cb_lock" spinlock. When these operations results in the need
for enableing or disabling the IRQ in the hardware the code jumps to
dpu_hw_interrupts.c, which protects its operations with "irq_lock"
spinlock.

When an interrupt fires, dpu_hw_intr_dispatch_irq() inspects the
hardware state while holding the "irq_lock" spinlock and jumps to
dpu_core_irq_callback_handler() to invoke the registered handlers, which
traverses the callback list under the "cb_lock" spinlock.

As such, in the event that these happens concurrently we'll end up with
a deadlock.

Prior to '1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")'
the enable/disable of the hardware interrupt was done outside the
"cb_lock" region, optimitically by using an atomic enable-counter for
each interrupt and an warning print if someone changed the list between
the atomic_read and the time the operation concluded.

Rather than re-introducing the large array of atomics, serialize the
register/unregister operations under a single mutex.

Fixes: 1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 10 +++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 4f110c428b60..62bbe35eff7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -82,11 +82,13 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
+	mutex_lock(&dpu_kms->irq_obj.hw_enable_lock);
 	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
 	list_add_tail(&register_irq_cb->list,
 			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
+	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	if (list_is_first(&register_irq_cb->list,
 			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
 		int ret = dpu_kms->hw_intr->ops.enable_irq(
@@ -96,8 +98,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
 					irq_idx);
 	}
-
-	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
+	mutex_unlock(&dpu_kms->irq_obj.hw_enable_lock);
 
 	return 0;
 }
@@ -127,9 +128,11 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
 
+	mutex_lock(&dpu_kms->irq_obj.hw_enable_lock);
 	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
 	list_del_init(&register_irq_cb->list);
+	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
 	/* empty callback list but interrupt is still enabled */
 	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
 		int ret = dpu_kms->hw_intr->ops.disable_irq(
@@ -140,7 +143,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 					irq_idx);
 		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
 	}
-	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
+	mutex_unlock(&dpu_kms->irq_obj.hw_enable_lock);
 
 	return 0;
 }
@@ -207,6 +210,7 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
+	mutex_init(&dpu_kms->irq_obj.hw_enable_lock);
 	spin_lock_init(&dpu_kms->irq_obj.cb_lock);
 
 	/* Create irq callbacks for all possible irq_idx */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index f6840b1af6e4..5a162caea29d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -83,6 +83,7 @@ struct dpu_irq_callback {
  * @total_irq:    total number of irq_idx obtained from HW interrupts mapping
  * @irq_cb_tbl:   array of IRQ callbacks setting
  * @cb_lock:      callback lock
+ * @hw_enable_lock: lock to synchronize callback register and unregister
  * @debugfs_file: debugfs file for irq statistics
  */
 struct dpu_irq {
@@ -90,6 +91,7 @@ struct dpu_irq {
 	struct list_head *irq_cb_tbl;
 	atomic_t *irq_counts;
 	spinlock_t cb_lock;
+	struct mutex hw_enable_lock;
 };
 
 struct dpu_kms {
-- 
2.29.2

