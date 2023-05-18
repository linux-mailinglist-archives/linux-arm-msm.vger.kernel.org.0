Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D48708B74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjERWWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjERWWu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:50 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDEFE50
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:48 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f122ff663eso2863014e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448566; x=1687040566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8JseUKXWpuc/CckoDttK7Sy0JkMwOH5zx3JHuSisWM=;
        b=k72/ciEv0LMI8jr2jFWeeQmLA4UG2sQgnNDIHc77sX+4HwSZpA+JOttRF8jtAicd58
         bd4xSo1R13Q1fK6oHhH67EUjmJyYSK3A2sUTVAKLN73mw5HxMLm49hQcHVmPGeNQ2gc7
         Fr8Y09p9tKsuEWzBVuPVT1MoMgv3KWvKEmQYm5JBs866qlvFbfsg/w1itzK+mJxwH8ba
         aYUn6llHshWJBWw9GFRtHTxB8jvmqAm3FL1nIlkSBKLgzz5AIS+8A07Fr3WbHQImPMQB
         SV0rszajC2L997VfgiWeaVIJIb46FzUINlVVcQVyuslhtPnuIHDmuFBO9ZBMwgz5lGkN
         4OAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448566; x=1687040566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8JseUKXWpuc/CckoDttK7Sy0JkMwOH5zx3JHuSisWM=;
        b=fyp/+Mi8zF9vnhP8Qj4PL1JdUCZxdxYPsc9ijiV3AHvANmu8xmRLpeCVZg0O7MAEC0
         ZeYN5L73YC2LF+aQp9NdZkRp1UFmuQ9Q6B7djo9v81aPGLvWr+enhHxMGooQujO4aUHX
         bKlqIAfVaXPbzeCKZi8SjYThpfKzOPkdbtjdGqEh6cU3D70oDD03TwOlTZ2GW7t8EJSB
         BQg5f+rrwk52rhWc77tneYzliUDpdL38qjN8sRr9lkE2mPKhH1lhT3UsGHMI0r8YmPTg
         FzROB0EpYSYgkjhWrqoTEtTZyko4Owr6ZAdjN36SyB8J/4Y2yNse7FoTfhrKE3o8Xo+H
         atlQ==
X-Gm-Message-State: AC+VfDzX1eLZU2Qhl9EXKLgyp7vJhbHT24Pfst3y294bbxn2ob6jaU1I
        m8X1LiQW1HwVV7rSJPYwTCdISA==
X-Google-Smtp-Source: ACHHUZ5CjPCT3k2acRkFwvYEsutvL5H7iPXc96a2v6WLQ1hv2cqlZTWch1RCkJTkPccRNYAkyprCfA==
X-Received: by 2002:ac2:5e81:0:b0:4f3:872d:10ff with SMTP id b1-20020ac25e81000000b004f3872d10ffmr82273lfq.64.1684448566688;
        Thu, 18 May 2023 15:22:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: [PATCH v3 9/9] drm/msm/dpu: use common helper for WB and SSPP QoS setup
Date:   Fri, 19 May 2023 01:22:38 +0300
Message-Id: <20230518222238.3815293-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
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

Rework SSPP and WB code to use common helper for programming QoS
settings.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 31 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 19 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 31 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 21 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 29 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 16 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 85 +++++++------------
 8 files changed, 100 insertions(+), 136 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index e7b65f6f53d6..023a9c4ad1db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -102,7 +102,7 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb;
-	struct dpu_hw_wb_qos_cfg qos_cfg;
+	struct dpu_hw_qos_cfg qos_cfg;
 	const struct dpu_mdss_cfg *catalog;
 	const struct dpu_qos_lut_tbl *qos_lut_tb;
 
@@ -115,7 +115,7 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 
 	hw_wb = phys_enc->hw_wb;
 
-	memset(&qos_cfg, 0, sizeof(struct dpu_hw_wb_qos_cfg));
+	memset(&qos_cfg, 0, sizeof(struct dpu_hw_qos_cfg));
 	qos_cfg.danger_safe_en = true;
 	qos_cfg.danger_lut =
 		catalog->perf->danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 1abe1eca4f42..b364cf75bb3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -539,30 +539,15 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 				color);
 }
 
-static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
-			u32 danger_lut,
-			u32 safe_lut)
+static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
+				      struct dpu_hw_qos_cfg *cfg)
 {
-	if (!ctx)
-		return;
-
-	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT, danger_lut);
-	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT, safe_lut);
-}
-
-static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
-			u64 creq_lut)
-{
-	if (!ctx)
+	if (!ctx || !cfg)
 		return;
 
-	if (ctx->cap && test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features)) {
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0, creq_lut);
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1,
-				creq_lut >> 32);
-	} else {
-		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT, creq_lut);
-	}
+	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
+			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
+			      cfg);
 }
 
 static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
@@ -604,9 +589,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
 
 	if (test_bit(DPU_SSPP_QOS, &features)) {
-		c->ops.setup_danger_safe_lut =
-			dpu_hw_sspp_setup_danger_safe_lut;
-		c->ops.setup_creq_lut = dpu_hw_sspp_setup_creq_lut;
+		c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
 		c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4278c421b6ac..085f34bc6b88 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -254,25 +254,14 @@ struct dpu_hw_sspp_ops {
 	void (*setup_sharpening)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_sharp_cfg *cfg);
 
-	/**
-	 * setup_danger_safe_lut - setup danger safe LUTs
-	 * @ctx: Pointer to pipe context
-	 * @danger_lut: LUT for generate danger level based on fill level
-	 * @safe_lut: LUT for generate safe level based on fill level
-	 *
-	 */
-	void (*setup_danger_safe_lut)(struct dpu_hw_sspp *ctx,
-			u32 danger_lut,
-			u32 safe_lut);
 
 	/**
-	 * setup_creq_lut - setup CREQ LUT
+	 * setup_qos_lut - setup QoS LUTs
 	 * @ctx: Pointer to pipe context
-	 * @creq_lut: LUT for generate creq level based on fill level
-	 *
+	 * @cfg: LUT configuration
 	 */
-	void (*setup_creq_lut)(struct dpu_hw_sspp *ctx,
-			u64 creq_lut);
+	void (*setup_qos_lut)(struct dpu_hw_sspp *ctx,
+			struct dpu_hw_qos_cfg *cfg);
 
 	/**
 	 * setup_qos_ctrl - setup QoS control
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 95d20b9a3f2f..9d2273fd2fed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -73,6 +73,19 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
 #define QSEED3LITE_SEP_LUT_SIZE \
 	        (QSEED3LITE_LUT_SIZE * QSEED3LITE_SEPARABLE_LUTS * sizeof(u32))
 
+/* QOS_LUT */
+#define QOS_DANGER_LUT                    0x00
+#define QOS_SAFE_LUT                      0x04
+#define QOS_CREQ_LUT                      0x08
+#define QOS_QOS_CTRL                      0x0C
+#define QOS_CREQ_LUT_0                    0x14
+#define QOS_CREQ_LUT_1                    0x18
+
+/* QOS_QOS_CTRL */
+#define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
+#define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
+#define QOS_QOS_CTRL_VBLANK_EN            BIT(16)
+#define QOS_QOS_CTRL_CREQ_VBLANK_MASK     GENMASK(21, 20)
 
 void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
 		u32 reg_off,
@@ -450,6 +463,24 @@ u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 	return 0;
 }
 
+void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
+			   bool qos_8lvl,
+			   const struct dpu_hw_qos_cfg *cfg)
+{
+	DPU_REG_WRITE(c, offset + QOS_DANGER_LUT, cfg->danger_lut);
+	DPU_REG_WRITE(c, offset + QOS_SAFE_LUT, cfg->safe_lut);
+
+	if (qos_8lvl) {
+		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT_0, cfg->creq_lut);
+		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT_1, cfg->creq_lut >> 32);
+	} else {
+		DPU_REG_WRITE(c, offset + QOS_CREQ_LUT, cfg->creq_lut);
+	}
+
+	DPU_REG_WRITE(c, offset + QOS_QOS_CTRL,
+		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
+}
+
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,
 		bool enable, u32 frame_count)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index dc6e3b795aef..1f6079f47071 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -305,6 +305,23 @@ struct dpu_drm_scaler_v2 {
 	struct dpu_drm_de_v1 de;
 };
 
+/**
+ * struct dpu_hw_qos_cfg: pipe QoS configuration
+ * @danger_lut: LUT for generate danger level based on fill level
+ * @safe_lut: LUT for generate safe level based on fill level
+ * @creq_lut: LUT for generate creq level based on fill level
+ * @creq_vblank: creq value generated to vbif during vertical blanking
+ * @danger_vblank: danger value generated during vertical blanking
+ * @vblank_en: enable creq_vblank and danger_vblank during vblank
+ * @danger_safe_en: enable danger safe generation
+ */
+struct dpu_hw_qos_cfg {
+	u32 danger_lut;
+	u32 safe_lut;
+	u64 creq_lut;
+	bool danger_safe_en;
+};
+
 u32 *dpu_hw_util_get_log_mask_ptr(void);
 
 void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
@@ -336,6 +353,10 @@ void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
 u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
 		u32 total_fl);
 
+void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
+			   bool qos_8lvl,
+			   const struct dpu_hw_qos_cfg *cfg);
+
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,
 		bool enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index a6de4b82a188..dcffd6cc47fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -49,9 +49,6 @@
 #define WB_OUT_IMAGE_SIZE                     0x2C0
 #define WB_OUT_XY                             0x2C4
 
-/* WB_QOS_CTRL */
-#define WB_QOS_CTRL_DANGER_SAFE_EN            BIT(0)
-
 static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
 		struct dpu_hw_wb_cfg *data)
 {
@@ -135,32 +132,14 @@ static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct dpu_hw_wb_cfg *wb)
 }
 
 static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
-		struct dpu_hw_wb_qos_cfg *cfg)
+		struct dpu_hw_qos_cfg *cfg)
 {
-	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	u32 qos_ctrl = 0;
-
 	if (!ctx || !cfg)
 		return;
 
-	DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
-	DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
-
-	/*
-	 * for chipsets not using DPU_WB_QOS_8LVL but still using DPU
-	 * driver such as msm8998, the reset value of WB_CREQ_LUT is
-	 * sufficient for writeback to work. SW doesn't need to explicitly
-	 * program a value.
-	 */
-	if (ctx->caps && test_bit(DPU_WB_QOS_8LVL, &ctx->caps->features)) {
-		DPU_REG_WRITE(c, WB_CREQ_LUT_0, cfg->creq_lut);
-		DPU_REG_WRITE(c, WB_CREQ_LUT_1, cfg->creq_lut >> 32);
-	}
-
-	if (cfg->danger_safe_en)
-		qos_ctrl |= WB_QOS_CTRL_DANGER_SAFE_EN;
-
-	DPU_REG_WRITE(c, WB_QOS_CTRL, qos_ctrl);
+	_dpu_hw_setup_qos_lut(&ctx->hw, WB_DANGER_LUT,
+			      test_bit(DPU_WB_QOS_8LVL, &ctx->caps->features),
+			      cfg);
 }
 
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index ab3541856258..c7f792eeb55c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -21,20 +21,6 @@ struct dpu_hw_wb_cfg {
 	struct drm_rect crop;
 };
 
-/**
- * struct dpu_hw_wb_qos_cfg : Writeback pipe QoS configuration
- * @danger_lut: LUT for generate danger level based on fill level
- * @safe_lut: LUT for generate safe level based on fill level
- * @creq_lut: LUT for generate creq level based on fill level
- * @danger_safe_en: enable danger safe generation
- */
-struct dpu_hw_wb_qos_cfg {
-	u32 danger_lut;
-	u32 safe_lut;
-	u64 creq_lut;
-	bool danger_safe_en;
-};
-
 /**
  *
  * struct dpu_hw_wb_ops : Interface to the wb hw driver functions
@@ -56,7 +42,7 @@ struct dpu_hw_wb_ops {
 			struct dpu_hw_wb_cfg *wb);
 
 	void (*setup_qos_lut)(struct dpu_hw_wb *ctx,
-			struct dpu_hw_wb_qos_cfg *cfg);
+			struct dpu_hw_qos_cfg *cfg);
 
 	void (*setup_cdp)(struct dpu_hw_wb *ctx,
 			  const struct dpu_format *fmt,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c8837d0aa0c3..d66745115917 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -190,12 +190,14 @@ static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
  * _dpu_plane_calc_fill_level - calculate fill level of the given source format
  * @plane:		Pointer to drm plane
  * @pipe:		Pointer to software pipe
+ * @lut_usage:		LUT usecase
  * @fmt:		Pointer to source buffer format
  * @src_width:		width of source buffer
  * Return: fill level corresponding to the source buffer/format or 0 if error
  */
 static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		struct dpu_sw_pipe *pipe,
+		enum dpu_qos_lut_usage lut_usage,
 		const struct dpu_format *fmt, u32 src_width)
 {
 	struct dpu_plane *pdpu;
@@ -207,6 +209,9 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		return 0;
 	}
 
+	if (lut_usage == DPU_QOS_LUT_USAGE_NRT)
+		return 0;
+
 	pdpu = to_dpu_plane(plane);
 	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
 
@@ -252,83 +257,58 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 		const struct dpu_format *fmt, struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	u64 qos_lut;
-	u32 total_fl = 0, lut_usage;
+	struct dpu_hw_qos_cfg cfg;
+	u32 total_fl, lut_usage;
 
 	if (!pdpu->is_rt_pipe) {
 		lut_usage = DPU_QOS_LUT_USAGE_NRT;
 	} else {
-		total_fl = _dpu_plane_calc_fill_level(plane, pipe, fmt,
-				drm_rect_width(&pipe_cfg->src_rect));
-
 		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
 			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
 		else
 			lut_usage = DPU_QOS_LUT_USAGE_MACROTILE;
 	}
 
-	qos_lut = _dpu_hw_get_qos_lut(
-			&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
+	total_fl = _dpu_plane_calc_fill_level(plane, pipe, lut_usage, fmt,
+				drm_rect_width(&pipe_cfg->src_rect));
+
+	cfg.creq_lut = _dpu_hw_get_qos_lut(&pdpu->catalog->perf->qos_lut_tbl[lut_usage], total_fl);
+	cfg.danger_lut = pdpu->catalog->perf->danger_lut_tbl[lut_usage];
+	cfg.safe_lut = pdpu->catalog->perf->safe_lut_tbl[lut_usage];
+
+	if (pipe->sspp->idx != SSPP_CURSOR0 &&
+	    pipe->sspp->idx != SSPP_CURSOR1 &&
+	    pdpu->is_rt_pipe)
+		cfg.danger_safe_en = true;
+
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
+		pdpu->pipe - SSPP_VIG0,
+		cfg.danger_safe_en,
+		pdpu->is_rt_pipe);
 
 	trace_dpu_perf_set_qos_luts(pipe->sspp->idx - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
-			pdpu->is_rt_pipe, total_fl, qos_lut, lut_usage);
+			pdpu->is_rt_pipe, total_fl, cfg.creq_lut, lut_usage);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s rt:%d fl:%u lut:0x%llx\n",
 			pdpu->pipe - SSPP_VIG0,
 			fmt ? (char *)&fmt->base.pixel_format : NULL,
-			pdpu->is_rt_pipe, total_fl, qos_lut);
-
-	pipe->sspp->ops.setup_creq_lut(pipe->sspp, qos_lut);
-}
-
-/**
- * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
- * @plane:		Pointer to drm plane
- * @pipe:		Pointer to software pipe
- * @fmt:		Pointer to source buffer format
- */
-static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
-		struct dpu_sw_pipe *pipe,
-		const struct dpu_format *fmt)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	u32 danger_lut, safe_lut;
-
-	if (!pdpu->is_rt_pipe) {
-		danger_lut = pdpu->catalog->perf->danger_lut_tbl
-				[DPU_QOS_LUT_USAGE_NRT];
-		safe_lut = pdpu->catalog->perf->safe_lut_tbl
-				[DPU_QOS_LUT_USAGE_NRT];
-	} else {
-		if (fmt && DPU_FORMAT_IS_LINEAR(fmt)) {
-			danger_lut = pdpu->catalog->perf->danger_lut_tbl
-					[DPU_QOS_LUT_USAGE_LINEAR];
-			safe_lut = pdpu->catalog->perf->safe_lut_tbl
-					[DPU_QOS_LUT_USAGE_LINEAR];
-		} else {
-			danger_lut = pdpu->catalog->perf->danger_lut_tbl
-					[DPU_QOS_LUT_USAGE_MACROTILE];
-			safe_lut = pdpu->catalog->perf->safe_lut_tbl
-					[DPU_QOS_LUT_USAGE_MACROTILE];
-		}
-	}
+			pdpu->is_rt_pipe, total_fl, cfg.creq_lut);
 
 	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
 			(fmt) ? fmt->base.pixel_format : 0,
 			(fmt) ? fmt->fetch_mode : 0,
-			danger_lut,
-			safe_lut);
+			cfg.danger_lut,
+			cfg.safe_lut);
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
 		pdpu->pipe - SSPP_VIG0,
 		fmt ? (char *)&fmt->base.pixel_format : NULL,
 		fmt ? fmt->fetch_mode : -1,
-		danger_lut,
-		safe_lut);
+		cfg.danger_lut,
+		cfg.safe_lut);
 
-	pipe->sspp->ops.setup_danger_safe_lut(pipe->sspp,
-			danger_lut, safe_lut);
+	pipe->sspp->ops.setup_qos_lut(pipe->sspp, &cfg);
 }
 
 /**
@@ -336,7 +316,6 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
  * @plane:		Pointer to drm plane
  * @pipe:		Pointer to software pipe
  * @enable:		true to enable QoS control
- * @flags:		QoS control mode (enum dpu_plane_qos)
  */
 static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	struct dpu_sw_pipe *pipe,
@@ -1086,10 +1065,6 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	}
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
-	_dpu_plane_set_danger_lut(plane, pipe, fmt);
-	_dpu_plane_set_qos_ctrl(plane, pipe,
-				pipe->sspp->idx != SSPP_CURSOR0 &&
-				pipe->sspp->idx != SSPP_CURSOR1);
 
 	if (pipe->sspp->idx != SSPP_CURSOR0 &&
 	    pipe->sspp->idx != SSPP_CURSOR1)
-- 
2.39.2

