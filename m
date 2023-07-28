Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80789767905
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 01:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbjG1XcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 19:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233512AbjG1XcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 19:32:08 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB383AB1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:32:05 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9cd6a554cso21361311fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690587123; x=1691191923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AqFt/vgcTmHPg7yq9CFdAK4wRAWjfEblVVpbr/Fpo8=;
        b=WYqrfny+V/nHtQD7sWa2/rTXPGWPeAAQEbVKzahJVv5VrysYaKDwBxWKoyWqViDN+x
         O4h3KLWHBMDVrFreT9rUHN1TGMYeDqQVb5SigExVXLalDVlZqnzCi4iaqQRHahhbGLdT
         vLdsqEsEJiAOVM4mIv1JHo6/GqafaL6jk6SqqpJWLxBSK0lkwG0sAw3uxF1OIqHZ2E/M
         7VD/YxVVq8WdfyIzxGDhe1rOoqg0HFIC57+gtAQZ06vEXDmTr5Z7VWhK94QMzJfArYZB
         I6wrXWOlZO2Cr4txewaup3+kdPMzaA1qtgpw4ls9oWYj/ZXOgZoRxCBaf5k+yueb+kfC
         ZbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690587123; x=1691191923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AqFt/vgcTmHPg7yq9CFdAK4wRAWjfEblVVpbr/Fpo8=;
        b=E8mbOZbwzGRwUq3GoJ32T+/V+4EN59UwWFlD3+2PBM2VxQ9XezL0gUfBd+uTV4OQmX
         PajuSnq8XcrGfbHL9IXL+vWu0WMEq9x9qSAw88H08TBt84cWfUbubtLbxdnQFNyBMb3V
         sITZnR/lKnVqfFpnwq0jIextmzVsgTPRqJcELps/uU0ffkquR8k7Xu4dhpi42A5y8Iu5
         TCtJsCQoY0I/QK5w3h8I+RZZHDpusaDD84g5OYLbVvr0bwuEfeNFtcX2NY4nUCPlCqkK
         n1RySeas9UYTs35jrkkR6v+xKM1MI6aCsXN86G6c7csJU5FItb/cZGXI+2093O0MKAlO
         L/aQ==
X-Gm-Message-State: ABy/qLYj7S/WA1Dpu1P15VfiTsBx/7MiNOu3gxChZLcZerLjPPTwPyjY
        X4pVZOjs5LJ9FP2hYRhBH+DQVQ==
X-Google-Smtp-Source: APBJJlG+HLLFgONz6d18N4PKt3uruvCglghUD7znmP46fxsXHrIqrEzUapXBRIGesZzGG5rrrsQrrA==
X-Received: by 2002:a2e:3505:0:b0:2b5:9f54:e290 with SMTP id z5-20020a2e3505000000b002b59f54e290mr2699260ljz.0.1690587123516;
        Fri, 28 Jul 2023 16:32:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x11-20020a2e9dcb000000b002b6c8cf48bfsm1148289ljj.104.2023.07.28.16.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 16:32:03 -0700 (PDT)
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
Subject: [PATCH v3 3/6] drm/msm/dpu: add helper to get IRQ-related data
Date:   Sat, 29 Jul 2023 02:31:57 +0300
Message-Id: <20230728233200.151735-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
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

In preparation to reworking the IRQ indices, move irq_tbl access to
separate helper.

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

