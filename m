Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 486A176CA68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 12:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbjHBKEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 06:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbjHBKEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 06:04:35 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6345B2D5B
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 03:04:33 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so11055065e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970671; x=1691575471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4Aj05TJ5eLvS9QnJkr6lNuPd+o6Ebr7f+TbdB7WX4g=;
        b=LcsSIAH+RiWJhyLLC6tE87HF1ctnHhDEtyD+EuXrAcrTnRXFOjXEEqJwvo9buCuM+A
         5G+gNHrb4k7DMaa+jtW/V5Ru1b4bFjekUI6V3DEcJM2E5wBgG0FtbIOkiWcQp8GypwBf
         ZCesO7SieOCxQsjTH729xCcd8CpKQhd996yn9KGYW13Uh6VKL4NqWlr16wHpAPJyf5Ac
         N1BPfU1B65B3ouXyM0WVdIH3mWyxjsyP/d4gHF+/mx1QtEuyppIVNGVKvSAT4fp+Kq4c
         KRiAi6VtvM959fHModWz1QF8kPPt0qoC3XDFmTXTfUAXP9RSE7XNfyoaqkT/6HDUMGVH
         mp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970671; x=1691575471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4Aj05TJ5eLvS9QnJkr6lNuPd+o6Ebr7f+TbdB7WX4g=;
        b=UDkC48aUrYiszkEO5rcn0j/g6856b7M50z8vjXDCvtUBqri8NrTkbgqBV5yjCm890F
         HsaqmjnaeqaTwk7hD8oUjCKH6Uwsy9lsECe+LHpjUFIahQXCCq24uH88j2O4lY3H2Wgf
         sMFyngmUvJVWmerEsjJHnw1CXPenws72LPTFeDW4dYgT1BOn5dgY/UX0BxAc7COJ+K9X
         QZHNFJ5SRNPQN1jm4AFLpnkoFdS0MKkd2x1InJrX5N38M5zw8yQgH1eddDHMvmtEOP9j
         Ch+krhR6yl1bxc79tX0JevwoI4rn5uAXuRYh7j+4Du61+FazIWzORuio+0As9qjfzODv
         lPrQ==
X-Gm-Message-State: ABy/qLauTtoiRXsm41nXi+gaFiPjiu05JAXThvXPtdroGTknoVgnJbr/
        2jddhyOY+OzO5qtHbzDdY6rHng==
X-Google-Smtp-Source: APBJJlHRlvGV88RlBcBD5bW+Y8xiAUdRdaGvjPY3dJU4ijQs72sQTi/3pvrK5TX+Nmv44bim7mNAUQ==
X-Received: by 2002:a05:6512:6c4:b0:4fe:1ac9:fe5a with SMTP id u4-20020a05651206c400b004fe1ac9fe5amr5133534lff.39.1690970671660;
        Wed, 02 Aug 2023 03:04:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:04:31 -0700 (PDT)
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
Subject: [PATCH v5 6/8] drm/msm/dpu: stop using raw IRQ indices in the kernel output
Date:   Wed,  2 Aug 2023 13:04:24 +0300
Message-Id: <20230802100426.4184892-7-dmitry.baryshkov@linaro.org>
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

In preparation to reworking IRQ indcies, stop using raw IRQ indices in
kernel output (both printk and debugfs). Instead use a pair of register
index and bit. This corresponds closer to the values in HW catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 26 +++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 51 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +
 3 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 051447a3620c..b464df7a2dcf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -351,7 +351,7 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 		u32 irq_idx, struct dpu_encoder_wait_info *info);
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		int irq,
+		int irq_idx,
 		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info)
 {
@@ -366,36 +366,36 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 
 	/* return EWOULDBLOCK since we know the wait isn't necessary */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
-		DRM_ERROR("encoder is disabled id=%u, callback=%ps, irq=%d\n",
+		DRM_ERROR("encoder is disabled id=%u, callback=%ps, IRQ=[%d, %d]\n",
 			  DRMID(phys_enc->parent), func,
-			  irq);
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EWOULDBLOCK;
 	}
 
-	if (irq < 0) {
+	if (irq_idx < 0) {
 		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
 			      DRMID(phys_enc->parent), func);
 		return 0;
 	}
 
-	DRM_DEBUG_KMS("id=%u, callback=%ps, irq=%d, pp=%d, pending_cnt=%d\n",
+	DRM_DEBUG_KMS("id=%u, callback=%ps, IRQ=[%d, %d], pp=%d, pending_cnt=%d\n",
 		      DRMID(phys_enc->parent), func,
-		      irq, phys_enc->hw_pp->idx - PINGPONG_0,
+		      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), phys_enc->hw_pp->idx - PINGPONG_0,
 		      atomic_read(wait_info->atomic_cnt));
 
 	ret = dpu_encoder_helper_wait_event_timeout(
 			DRMID(phys_enc->parent),
-			irq,
+			irq_idx,
 			wait_info);
 
 	if (ret <= 0) {
-		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq);
+		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq_idx);
 		if (irq_status) {
 			unsigned long flags;
 
-			DRM_DEBUG_KMS("irq not triggered id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d\n",
+			DRM_DEBUG_KMS("IRQ=[%d, %d] not triggered id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
+				      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
 				      DRMID(phys_enc->parent), func,
-				      irq,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 			local_irq_save(flags);
@@ -404,16 +404,16 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-			DRM_DEBUG_KMS("irq timeout id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d\n",
+			DRM_DEBUG_KMS("IRQ=[%d, %d] timeout id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
+				      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
 				      DRMID(phys_enc->parent), func,
-				      irq,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 		}
 	} else {
 		ret = 0;
 		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
-			func, irq,
+			func, irq_idx,
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			atomic_read(wait_info->atomic_cnt));
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 3d6d13407dde..c413e9917d7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -197,8 +197,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
-#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
-#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+#define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(int irq_idx)
 {
@@ -220,10 +219,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
 
-	VERB("irq_idx=%d\n", irq_idx);
+	VERB("IRQ=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	if (!irq_entry->cb)
-		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
+		DRM_ERROR("no registered cb, IRQ=[%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	atomic_inc(&irq_entry->count);
 
@@ -305,7 +305,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		return -EINVAL;
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ=[%d, %d]\n",
+		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
@@ -341,7 +342,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("DPU IRQ %d %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
+	pr_debug("DPU IRQ=[%d, %d] %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",
+		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
@@ -358,7 +360,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		return -EINVAL;
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ=[%d, %d]\n",
+		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
@@ -390,7 +393,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("DPU IRQ %d %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
+	pr_debug("DPU IRQ=[%d, %d] %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",
+		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
@@ -443,7 +447,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 		return 0;
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		pr_err("invalid IRQ index: [%d]\n", irq_idx);
+		pr_err("invalid IRQ=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return 0;
 	}
 
@@ -519,16 +523,19 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 	int ret;
 
 	if (!irq_cb) {
-		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
+		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
 		return -EINVAL;
 	}
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
+		DPU_ERROR("invalid IRQ=[%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
-	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+	VERB("[%pS] IRQ=[%d, %d]\n", __builtin_return_address(0),
+	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
@@ -547,8 +554,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 				dpu_kms->hw_intr,
 				irq_idx);
 	if (ret)
-		DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
-					irq_idx);
+		DPU_ERROR("Failed/ to enable IRQ=[%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 	trace_dpu_irq_register_success(irq_idx);
@@ -563,19 +570,21 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 	int ret;
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
+		DPU_ERROR("invalid IRQ=[%d, %d]\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
-	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
+	VERB("[%pS] IRQ=[%d, %d]\n", __builtin_return_address(0),
+	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
 	trace_dpu_core_irq_unregister_callback(irq_idx);
 
 	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
 	if (ret)
-		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
-					irq_idx, ret);
+		DPU_ERROR("Failed to disable IRQ=[%d, %d]: %d\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), ret);
 
 	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
 	irq_entry->cb = NULL;
@@ -605,7 +614,8 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
 		if (irq_count || cb)
-			seq_printf(s, "idx:%d irq:%d cb:%ps\n", i, irq_count, cb);
+			seq_printf(s, "IRQ=[%d, %d] count:%d cb:%ps\n",
+				   DPU_IRQ_REG(i), DPU_IRQ_BIT(i), irq_count, cb);
 	}
 
 	return 0;
@@ -651,7 +661,8 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 	for (i = 0; i < DPU_NUM_IRQS; i++) {
 		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
 		if (irq_entry->cb)
-			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
+			DPU_ERROR("IRQ=[%d, %d] still enabled/registered\n",
+				  DPU_IRQ_REG(i), DPU_IRQ_BIT(i));
 	}
 
 	dpu_clear_irqs(dpu_kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index bb775b6a2432..9df5d6e737a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -37,6 +37,8 @@ enum dpu_hw_intr_reg {
 #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
+#define DPU_IRQ_BIT(irq_idx)	(irq_idx % 32)
 
 #define DPU_NUM_IRQS		(MDP_INTR_MAX * 32)
 
-- 
2.39.2

