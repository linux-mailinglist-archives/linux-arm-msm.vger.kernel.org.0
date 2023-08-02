Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF0E176CA66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 12:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234208AbjHBKEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 06:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbjHBKEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 06:04:35 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976732D53
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 03:04:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe44955decso956984e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970671; x=1691575471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Xf6B0xwF/vs7G7duNfzXI+bolY8TdjxVjJ7liwXexU=;
        b=PtznGShx9Y/Y4dxexe8sbyC63w4oNw0PAMiRPd+HhjstvFW+lYFVJCiwdy8k6DyURv
         H3KbFlv+djbgO3rgCyrxGOaZLSUnWjdkT7oodofb2msv0iWNMNuzLoN5h42N52FaHn0Q
         cdUIcqLSl/al3OZxKFPreR7BpiV0tp6fY67ANobt2Ju5gCRLoAK+INRwolxkH83yXD3J
         ASq8S7ImvZMCEmKO7SxGo8oIKRr1RfBnseuWM4KAoC5LgMrCIb71lZf2IT0iSq1Q8Cws
         FZf8UNKocD+mCQsMJf1fJwQb886DfRrQ8WB7oAsIgu+R7UwhKRHttopBDAEcTfmcD4nY
         BaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970671; x=1691575471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Xf6B0xwF/vs7G7duNfzXI+bolY8TdjxVjJ7liwXexU=;
        b=eo9cxk9qASZsGnllFdMK6p6/Gntu0M2EGk4ijk3xgk/Q8hXSdVlORJw4b9sfvFBwpD
         FufTU/vIUQhld/PKqXqI0aaKIwongpjmQLIkYBTWXRRzAE1Bz9E5sY7xxRs5MQvIuAMA
         tPyriqe8FsluDCWLfkXlWRQ8V1pnLHDcVQtYhrhoj4+c6totSw2JRW8hYK6molnCLkiR
         gx+/WMAMBBuGBF8Z7Btg6pk+3ubkdIxnn4T8snixvKD0WJ0zaafdIm5OtsARek62V8S3
         ahjg3TS1jceCF+iNfbA7wy3La13k+t9xaOmq7DXe59tE9QvxCDYRMWvC+4y8lsAZmhyN
         lAEQ==
X-Gm-Message-State: ABy/qLYbdhjeT5lTxjF4h+L49kDHsw3Xl10MTWyQt8pwISzzLz0yB0SI
        khRG7X9p+IEjHhu6SHdwK7czRnOiV2tMQgpQ6J4=
X-Google-Smtp-Source: APBJJlFHv6+QigZC/aOb7hKGdy/y7Z+oe3c/20cZMqscZqPRCTaoXhLy2m+RRd+T2Q4HUmcVpJHfVw==
X-Received: by 2002:ac2:4301:0:b0:4fe:32cd:481f with SMTP id l1-20020ac24301000000b004fe32cd481fmr2011490lfh.1.1690970670930;
        Wed, 02 Aug 2023 03:04:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:04:30 -0700 (PDT)
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
Subject: [PATCH v5 5/8] drm/msm/dpu: make the irq table size static
Date:   Wed,  2 Aug 2023 13:04:23 +0300
Message-Id: <20230802100426.4184892-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The size of the irq table is static, it has MDP_INTR_MAX * 32 interrupt
entries. Provide the fixed length and drop struct_size() statement.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 26 ++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 ++---
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 14d374de30c5..3d6d13407dde 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -200,10 +200,9 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
 #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
 
-static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
-					 int irq_idx)
+static inline bool dpu_core_irq_is_valid(int irq_idx)
 {
-	return irq_idx >= 0 && irq_idx < intr->total_irqs;
+	return irq_idx >= 0 && irq_idx < DPU_NUM_IRQS;
 }
 
 static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_intr *intr,
@@ -305,7 +304,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
+	if (!dpu_core_irq_is_valid(irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -358,7 +357,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
+	if (!dpu_core_irq_is_valid(irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -443,7 +442,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	if (!intr)
 		return 0;
 
-	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
+	if (!dpu_core_irq_is_valid(irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return 0;
 	}
@@ -470,13 +469,12 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_intr *intr;
-	int nirq = MDP_INTR_MAX * 32;
 	unsigned int i;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
 
-	intr = kzalloc(struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
+	intr = kzalloc(sizeof(*intr), GFP_KERNEL);
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
@@ -487,8 +485,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 	intr->hw.blk_addr = addr + m->mdp[0].base;
 
-	intr->total_irqs = nirq;
-
 	intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
 			 BIT(MDP_SSPP_TOP0_INTR2) |
 			 BIT(MDP_SSPP_TOP0_HIST_INTR);
@@ -527,7 +523,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
+	if (!dpu_core_irq_is_valid(irq_idx)) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -566,7 +562,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 	unsigned long irq_flags;
 	int ret;
 
-	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
+	if (!dpu_core_irq_is_valid(irq_idx)) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -601,7 +597,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 	int i, irq_count;
 	void *cb;
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		irq_count = atomic_read(&irq_entry->count);
@@ -636,7 +632,7 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	dpu_disable_all_irqs(dpu_kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		atomic_set(&irq_entry->count, 0);
 	}
@@ -652,7 +648,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
+	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		if (irq_entry->cb)
 			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 391fb268ad90..bb775b6a2432 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -38,6 +38,8 @@ enum dpu_hw_intr_reg {
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
+#define DPU_NUM_IRQS		(MDP_INTR_MAX * 32)
+
 struct dpu_hw_intr_entry {
 	void (*cb)(void *arg);
 	void *arg;
@@ -50,7 +52,6 @@ struct dpu_hw_intr_entry {
  * @ops:              function pointer mapping for IRQ handling
  * @cache_irq_mask:   array of IRQ enable masks reg storage created during init
  * @save_irq_status:  array of IRQ status reg storage created during init
- * @total_irqs: total number of irq_idx mapped in the hw_interrupts
  * @irq_lock:         spinlock for accessing IRQ resources
  * @irq_cb_tbl:       array of IRQ callbacks
  */
@@ -58,12 +59,11 @@ struct dpu_hw_intr {
 	struct dpu_hw_blk_reg_map hw;
 	u32 cache_irq_mask[MDP_INTR_MAX];
 	u32 *save_irq_status;
-	u32 total_irqs;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
 	const struct dpu_intr_reg *intr_set;
 
-	struct dpu_hw_intr_entry irq_tbl[];
+	struct dpu_hw_intr_entry irq_tbl[DPU_NUM_IRQS];
 };
 
 /**
-- 
2.39.2

