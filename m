Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60AB70CCCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 23:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbjEVVph (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 17:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbjEVVpf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 17:45:35 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF6EE9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:45:32 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f4b384c09fso1406852e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684791931; x=1687383931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilxpQSvoLf8/84/2nsPt3pyl1KGsODxEKHpMwLXHbNc=;
        b=ejublRXH+eEqvqgOu0RJmC8a6P2d2WpTPzH5LeTIhQtjxNtqUJm+aHIOxbrwWTOM/q
         hlRV07cvGgb5MXuzxdcXiisNbX/zK+6fy7VdeRmDFqXuioG0Cfg9uQsVkneF9rY11gTA
         sMqyU0s2C/BBwCx0CL6AFNnSoNrJdGOjadH0keY8ZhvsJxeEeRjtYmvNDUCpy24FX7sB
         lal5PTqeMNpRRkGKqluxlE9z/q/GwJ9JmelqeHt4YVEur8Nanltdd/zMBmrUx17l24X8
         Sr7HtPVeieVqEdEyo4ZlxEquBiNnnuEjaF2EOMPLsbrAc1K0pjULdPMC4FD6LvuNzv+B
         hdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684791931; x=1687383931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilxpQSvoLf8/84/2nsPt3pyl1KGsODxEKHpMwLXHbNc=;
        b=LhNJ8YzpKyE/cb0ODHxd0o+CBcwEl8hgYtMxt0iEsm4FPtgTukqwf1QwRwTp3djivz
         fPT/WefNfwu40GmfdEpEdSx7qTELTV15VOehqhgZIotQ72b3aBETMZBSlPrESAc1PeuI
         bkfLFphub74VZKHaC9Z9pW2k463fb9goLedAYpHNDK+0QQ7r/c8zqzEYY5/TSogqDTZj
         Lce/hO1YnYcaaHx5BmqX4/KuSrIgAUd8akn3i1dYzbM47QfGXbWzpTCQd82TiZ6X9Zij
         x8NW+ARSiTjr23A0KAdRh/6t8oPTJlapl32vN6K3SiKUCn40tKJj7tZQUrwWJcq0iEYy
         SIMg==
X-Gm-Message-State: AC+VfDx4Q+h/rv6DUTaax4DKZ4PsaeuFtDj+CGi8LY5KoTzDg/5thhb+
        XbDaol7mMFH9r+bHRIqGtMSTBQ==
X-Google-Smtp-Source: ACHHUZ6zuOOX0W66uPwiWuftrW6puDAWBqC9ilZRNWwMWMuwqG7UVGTnnXAMKXym+WrXjqsXOmyE5w==
X-Received: by 2002:ac2:4d04:0:b0:4ef:ef8e:56f1 with SMTP id r4-20020ac24d04000000b004efef8e56f1mr3833468lfi.49.1684791930989;
        Mon, 22 May 2023 14:45:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 14:45:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/msm/dpu: split interrupt address arrays
Date:   Tue, 23 May 2023 00:45:24 +0300
Message-Id: <20230522214527.190054-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no point in having a single enum (and a single array) for both
DPU < 7.0 and DPU >= 7.0 interrupt registers. Instead define a single
enum and two IRQ address arrays.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 82 +++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 28 ++++---
 8 files changed, 79 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 3c1b2c13398d..320cfa4be633 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -15,6 +15,7 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.has_3d_merge = true,
+	.has_7xxx_intr = true,
 	.max_linewidth = 4096,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 5d894cbb0a62..9306c7a115e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.has_7xxx_intr = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index c3f1ae000a21..fc1e17c495f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -15,6 +15,7 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.has_3d_merge = true,
+	.has_7xxx_intr = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 86c2e68ebd2c..eb72411c16db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -14,6 +14,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.has_7xxx_intr = true,
 	.has_3d_merge = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 85dc34458b88..8209ca317bdc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -15,6 +15,7 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.has_3d_merge = true,
+	.has_7xxx_intr = true,
 	.max_linewidth = 5120,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 677048cc3b7d..72530ebb0ae6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -351,6 +351,7 @@ struct dpu_rotation_cfg {
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
  * @has_3d_merge       indicate if 3D merge is supported
+ * @has_7xxx_intr      indicate that INTF/IRQs use addressing for DPU 7.0 and greater
  * @max_linewidth      max linewidth for sspp
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
@@ -364,6 +365,7 @@ struct dpu_caps {
 	bool has_dim_layer;
 	bool has_idle_pc;
 	bool has_3d_merge;
+	bool has_7xxx_intr;
 	/* SSPP limits */
 	u32 max_linewidth;
 	u32 pixel_ram_size;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 0776b0f6df4f..a03d826bb9ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -51,11 +51,9 @@ struct dpu_intr_reg {
 };
 
 /*
- * struct dpu_intr_reg -  List of DPU interrupt registers
- *
- * When making changes be sure to sync with dpu_hw_intr_reg
+ * dpu_intr_set_legacy -  List of DPU interrupt registers for DPU <= 6.x
  */
-static const struct dpu_intr_reg dpu_intr_set[] = {
+static const struct dpu_intr_reg dpu_intr_set_legacy[] = {
 	[MDP_SSPP_TOP0_INTR] = {
 		INTR_CLEAR,
 		INTR_EN,
@@ -121,57 +119,78 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_AD4_INTR_EN_OFF(1),
 		MDP_AD4_INTR_STATUS_OFF(1),
 	},
-	[MDP_INTF0_7xxx_INTR] = {
+};
+
+/*
+ * dpu_intr_set_7xxx -  List of DPU interrupt registers for DPU >= 7.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(0),
 		MDP_INTF_REV_7xxx_INTR_EN(0),
 		MDP_INTF_REV_7xxx_INTR_STATUS(0)
 	},
-	[MDP_INTF1_7xxx_INTR] = {
+	[MDP_INTF1_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(1),
 		MDP_INTF_REV_7xxx_INTR_EN(1),
 		MDP_INTF_REV_7xxx_INTR_STATUS(1)
 	},
-	[MDP_INTF1_7xxx_TEAR_INTR] = {
+	[MDP_INTF1_TEAR_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(1),
 		MDP_INTF_REV_7xxx_INTR_TEAR_EN(1),
 		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(1)
 	},
-	[MDP_INTF2_7xxx_INTR] = {
+	[MDP_INTF2_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(2),
 		MDP_INTF_REV_7xxx_INTR_EN(2),
 		MDP_INTF_REV_7xxx_INTR_STATUS(2)
 	},
-	[MDP_INTF2_7xxx_TEAR_INTR] = {
+	[MDP_INTF2_TEAR_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(2),
 		MDP_INTF_REV_7xxx_INTR_TEAR_EN(2),
 		MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(2)
 	},
-	[MDP_INTF3_7xxx_INTR] = {
+	[MDP_INTF3_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(3),
 		MDP_INTF_REV_7xxx_INTR_EN(3),
 		MDP_INTF_REV_7xxx_INTR_STATUS(3)
 	},
-	[MDP_INTF4_7xxx_INTR] = {
+	[MDP_INTF4_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(4),
 		MDP_INTF_REV_7xxx_INTR_EN(4),
 		MDP_INTF_REV_7xxx_INTR_STATUS(4)
 	},
-	[MDP_INTF5_7xxx_INTR] = {
+	[MDP_INTF5_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(5),
 		MDP_INTF_REV_7xxx_INTR_EN(5),
 		MDP_INTF_REV_7xxx_INTR_STATUS(5)
 	},
-	[MDP_INTF6_7xxx_INTR] = {
+	[MDP_INTF6_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(6),
 		MDP_INTF_REV_7xxx_INTR_EN(6),
 		MDP_INTF_REV_7xxx_INTR_STATUS(6)
 	},
-	[MDP_INTF7_7xxx_INTR] = {
+	[MDP_INTF7_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(7),
 		MDP_INTF_REV_7xxx_INTR_EN(7),
 		MDP_INTF_REV_7xxx_INTR_STATUS(7)
 	},
-	[MDP_INTF8_7xxx_INTR] = {
+	[MDP_INTF8_INTR] = {
 		MDP_INTF_REV_7xxx_INTR_CLEAR(8),
 		MDP_INTF_REV_7xxx_INTR_EN(8),
 		MDP_INTF_REV_7xxx_INTR_STATUS(8)
@@ -216,19 +235,19 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
 		return IRQ_NONE;
 
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
-	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
+	for (reg_idx = 0; reg_idx < MDP_INTR_MAX; reg_idx++) {
 		if (!test_bit(reg_idx, &intr->irq_mask))
 			continue;
 
 		/* Read interrupt status */
-		irq_status = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].status_off);
+		irq_status = DPU_REG_READ(&intr->hw, intr->intr_set[reg_idx].status_off);
 
 		/* Read enable mask */
-		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].en_off);
+		enable_mask = DPU_REG_READ(&intr->hw, intr->intr_set[reg_idx].en_off);
 
 		/* and clear the interrupt */
 		if (irq_status)
-			DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+			DPU_REG_WRITE(&intr->hw, intr->intr_set[reg_idx].clr_off,
 				     irq_status);
 
 		/* Finally update IRQ status based on enable mask */
@@ -285,7 +304,11 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	assert_spin_locked(&intr->irq_lock);
 
 	reg_idx = DPU_IRQ_REG(irq_idx);
-	reg = &dpu_intr_set[reg_idx];
+	reg = &intr->intr_set[reg_idx];
+
+	/* Is this interrupt register supported on the platform */
+	if (WARN_ON(!reg->en_off))
+		return -EINVAL;
 
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
 	if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
@@ -334,7 +357,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	assert_spin_locked(&intr->irq_lock);
 
 	reg_idx = DPU_IRQ_REG(irq_idx);
-	reg = &dpu_intr_set[reg_idx];
+	reg = &intr->intr_set[reg_idx];
 
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
 	if ((cache_irq_mask & DPU_IRQ_MASK(irq_idx)) == 0) {
@@ -368,10 +391,10 @@ static void dpu_clear_irqs(struct dpu_kms *dpu_kms)
 	if (!intr)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+	for (i = 0; i < MDP_INTR_MAX; i++) {
 		if (test_bit(i, &intr->irq_mask))
 			DPU_REG_WRITE(&intr->hw,
-					dpu_intr_set[i].clr_off, 0xffffffff);
+					intr->intr_set[i].clr_off, 0xffffffff);
 	}
 
 	/* ensure register writes go through */
@@ -386,10 +409,10 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	if (!intr)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
+	for (i = 0; i < MDP_INTR_MAX; i++) {
 		if (test_bit(i, &intr->irq_mask))
 			DPU_REG_WRITE(&intr->hw,
-					dpu_intr_set[i].en_off, 0x00000000);
+					intr->intr_set[i].en_off, 0x00000000);
 	}
 
 	/* ensure register writes go through */
@@ -421,10 +444,10 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 
 	reg_idx = DPU_IRQ_REG(irq_idx);
 	intr_status = DPU_REG_READ(&intr->hw,
-			dpu_intr_set[reg_idx].status_off) &
+			intr->intr_set[reg_idx].status_off) &
 		DPU_IRQ_MASK(irq_idx);
 	if (intr_status)
-		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+		DPU_REG_WRITE(&intr->hw, intr->intr_set[reg_idx].clr_off,
 				intr_status);
 
 	/* ensure register writes go through */
@@ -448,6 +471,11 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
+	if (m->caps->has_7xxx_intr)
+		intr->intr_set = dpu_intr_set_7xxx;
+	else
+		intr->intr_set = dpu_intr_set_legacy;
+
 	intr->hw.blk_addr = addr + m->mdp[0].base;
 
 	intr->total_irqs = nirq;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1f2dabc54c22..f329d6d7f646 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -23,24 +23,29 @@ enum dpu_hw_intr_reg {
 	MDP_INTF3_INTR,
 	MDP_INTF4_INTR,
 	MDP_INTF5_INTR,
+	MDP_INTF6_INTR,
+	MDP_INTF7_INTR,
+	MDP_INTF8_INTR,
 	MDP_INTF1_TEAR_INTR,
 	MDP_INTF2_TEAR_INTR,
 	MDP_AD4_0_INTR,
 	MDP_AD4_1_INTR,
-	MDP_INTF0_7xxx_INTR,
-	MDP_INTF1_7xxx_INTR,
-	MDP_INTF1_7xxx_TEAR_INTR,
-	MDP_INTF2_7xxx_INTR,
-	MDP_INTF2_7xxx_TEAR_INTR,
-	MDP_INTF3_7xxx_INTR,
-	MDP_INTF4_7xxx_INTR,
-	MDP_INTF5_7xxx_INTR,
-	MDP_INTF6_7xxx_INTR,
-	MDP_INTF7_7xxx_INTR,
-	MDP_INTF8_7xxx_INTR,
 	MDP_INTR_MAX,
 };
 
+/* compatibility */
+#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
+#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
+#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
+#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
+#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
+#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
+#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
+#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
+#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
+#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
+#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
+
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
 
 /**
@@ -60,6 +65,7 @@ struct dpu_hw_intr {
 	u32 total_irqs;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
+	const struct dpu_intr_reg *intr_set;
 
 	struct {
 		void (*cb)(void *arg, int irq_idx);
-- 
2.39.2

