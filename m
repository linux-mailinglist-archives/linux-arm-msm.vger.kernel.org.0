Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE8376828B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 00:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjG2W1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 18:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjG2W1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 18:27:15 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E882D67
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 15:27:14 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9e6cc93d8so371301fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 15:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690669632; x=1691274432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSzZTg0NGy1LkISwWv0vV5hJXartPJReDYXcjvBetNs=;
        b=Jc4Fr1OtIrfVD1d6RzxbdiMZ9nt1AWLsZdfGmF/sJBNmCA2TfuqlzhQ4J1A8u1VQrF
         9b/e1xaY22hRvSOpLUdhY7MMIrDPleBft01GbGBXcFUWuPXnK+pW7dybudLocb30gRuB
         t0CQ/HcNrkv/VFg3P3NZ2w0ii/wgmQVGlVLMbjSoJBmn4gjeOBcZZndNEne1CEDdbtEy
         q52+zpb3bGl2bnWh41OyDZeTmy/ShCikz8+Z9oqnqtBRozD+SfO4lu0oXhEXuIFqIGoE
         ECC/6UDa8btan9e1qqiSkcwG6L87NB/lvNkdXzJvITjjHo7mEITy+P/fKgSdzYq0yJQN
         54tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690669632; x=1691274432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSzZTg0NGy1LkISwWv0vV5hJXartPJReDYXcjvBetNs=;
        b=FclQ2qOUPv2Mi9BwxqBHzC5KzlEB7/kBJNOIZ+SCrS3bAhz3giXVwRoPILVqxt4oZi
         s95hExcsXIRIm2mqGUgw+SvFtFkA/xqRUZlYAmiNkGwyf/Dw0LVU+kdEofYf96wkZzaD
         dcAA8Z2JR2iVnruN2hdfDg86eipkWUKw6RSM9S2i83tG08/0me7nl0MpUvG1qXjuhsGa
         m47eTCKpz/bR5kfhOUTDvUrGf0uKZmh11yh8dZb9W21A0pxLOJXrzdUaSnrEj44Gh/z8
         CaGYB3OplkyrPlC9YFr7spsf/NfaNqv+fhX0xTubPe1xC1iJhD87CbY6Furt9HeF1SrW
         BUUw==
X-Gm-Message-State: ABy/qLZdCghUuPvZSLoJOn4OuvtBoLfVOFCvNArTW5rhtI65QAJBRd4v
        JM0gyzjg3REYj2i+m6vbWL5MZg==
X-Google-Smtp-Source: APBJJlHZCIa9rjVkK5FefvbSPo9Qr6Ab0eBWXulhoCYxIJ8L+dzCezIedF02qLgcVC0TV8ijsi5Ocg==
X-Received: by 2002:a2e:9646:0:b0:2b9:cb50:c1f9 with SMTP id z6-20020a2e9646000000b002b9cb50c1f9mr3794417ljh.32.1690669632542;
        Sat, 29 Jul 2023 15:27:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y9-20020a2e9789000000b002b9ae051ea1sm1734737lji.113.2023.07.29.15.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 15:27:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 3/7] drm/msm/dpu: add helper to get IRQ-related data
Date:   Sun, 30 Jul 2023 01:27:04 +0300
Message-Id: <20230729222708.329265-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
References: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to reworking IRQ indices, move irq_tbl access to
a separate helper.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 48 +++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 12 +++--
 2 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 81d03b6c67d1..14d374de30c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -206,6 +206,12 @@ static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
 	return irq_idx >= 0 && irq_idx < intr->total_irqs;
 }
 
+static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_intr *intr,
+							       int irq_idx)
+{
+	return &intr->irq_tbl[irq_idx];
+}
+
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
  * @dpu_kms:		Pointer to DPU's KMS structure
@@ -213,17 +219,19 @@ static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
  */
 static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
+	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
+
 	VERB("irq_idx=%d\n", irq_idx);
 
-	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
+	if (!irq_entry->cb)
 		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
 
-	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
+	atomic_inc(&irq_entry->count);
 
 	/*
 	 * Perform registered function callback
 	 */
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
+	irq_entry->cb(irq_entry->arg);
 }
 
 irqreturn_t dpu_core_irq(struct msm_kms *kms)
@@ -510,6 +518,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		void (*irq_cb)(void *arg),
 		void *irq_arg)
 {
+	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int ret;
 
@@ -527,15 +536,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
-	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
+	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
+	if (unlikely(WARN_ON(irq_entry->cb))) {
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 		return -EBUSY;
 	}
 
 	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
-	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = irq_arg;
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = irq_cb;
+	irq_entry->arg = irq_arg;
+	irq_entry->cb = irq_cb;
 
 	ret = dpu_hw_intr_enable_irq_locked(
 				dpu_kms->hw_intr,
@@ -552,6 +562,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 
 int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 {
+	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int ret;
 
@@ -570,8 +581,9 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
 					irq_idx, ret);
 
-	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
-	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
+	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
+	irq_entry->cb = NULL;
+	irq_entry->arg = NULL;
 
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
@@ -584,14 +596,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 {
 	struct dpu_kms *dpu_kms = s->private;
+	struct dpu_hw_intr_entry *irq_entry;
 	unsigned long irq_flags;
 	int i, irq_count;
 	void *cb;
 
 	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
-		irq_count = atomic_read(&dpu_kms->hw_intr->irq_tbl[i].count);
-		cb = dpu_kms->hw_intr->irq_tbl[i].cb;
+		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
+		irq_count = atomic_read(&irq_entry->count);
+		cb = irq_entry->cb;
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 		if (irq_count || cb)
@@ -614,6 +628,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct dpu_hw_intr_entry *irq_entry;
 	int i;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -621,22 +636,27 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
-		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
+		atomic_set(&irq_entry->count, 0);
+	}
 }
 
 void dpu_core_irq_uninstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct dpu_hw_intr_entry *irq_entry;
 	int i;
 
 	if (!dpu_kms->hw_intr)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
-		if (dpu_kms->hw_intr->irq_tbl[i].cb)
+	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
+		if (irq_entry->cb)
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
+	}
 
 	dpu_clear_irqs(dpu_kms);
 	dpu_disable_all_irqs(dpu_kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index e2b00dd32619..391fb268ad90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -38,6 +38,12 @@ enum dpu_hw_intr_reg {
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
+struct dpu_hw_intr_entry {
+	void (*cb)(void *arg);
+	void *arg;
+	atomic_t count;
+};
+
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
  * @hw:               virtual address mapping
@@ -57,11 +63,7 @@ struct dpu_hw_intr {
 	unsigned long irq_mask;
 	const struct dpu_intr_reg *intr_set;
 
-	struct {
-		void (*cb)(void *arg);
-		void *arg;
-		atomic_t count;
-	} irq_tbl[];
+	struct dpu_hw_intr_entry irq_tbl[];
 };
 
 /**
-- 
2.39.2

