Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EBB2F7FC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732218AbhAOPi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732189AbhAOPiz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:38:55 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FB7C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 07:38:15 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id x23so10810713lji.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 07:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=np7NzB7wfkcACJ1os8We+O07848Y4P70nqUkbzUTgDs=;
        b=t00qaEi6lOd+IuwTn4lfivRZr2r6bww6gD0Fm5i2hXcqCPplsPZ/VChC5bjVS6yZIE
         lTofLit9IGQ6aqUuc5rzmtBdptqWyLQaidbIri6PsfD46QhzRIQWga+nhIjYGQPiTh1M
         PiQ1TleNTRqcaEo00y/Ko1IiZ1m5DZHMeTBjbCVw5oR/vUUzOk3XJmD+fqcZG6m8aztb
         6L0eETnrAVTBClTZy1fWMIt4NkheZJxayLY/lJPv+6mpeFMRzTGr1oAlPtyQcxM2Fk+y
         /UMv4WdQ/nH5Dhuuki3mYzK4Gh4RGxkr4+kFyTiYce4XtnrM8LPWtR+LWHX9jS4WkQix
         5qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=np7NzB7wfkcACJ1os8We+O07848Y4P70nqUkbzUTgDs=;
        b=bcPCRgkb/ScB5VzQqpbXi61SnWz/12nTRPdnNCBVyDK+kx0lrKkKLIo30QMIBCi3mX
         0qxojyYDbw+Y1CjIL3Od8G+4XHE4BpmeDv87SweITih6g6fDQ2oxll6DAZPMbOFjiewc
         EPX1RUWE14wwUyskdlcXnZ9lSGaClizN4CHwB34mw9qq4ePwbL2OaigCSa5FjWSrRfWi
         rfTUYJaEAIABrHWA4aZ0t8IrMsBTpJCf4kSzL71mxydYJsxX+lx4aBo1a+YbyP2+zxZS
         Qbr28vBj2u0pxtCES4aHwYM9VAjIbrIbrbdzczlbWqQN/ozXNPK9NgIdkuEYJT/g/fI9
         NXRw==
X-Gm-Message-State: AOAM533NRUqL910Y6nrZkgzDDQn9JtUm6yf7FmTn5Yc17Rq9eLKHCKaq
        L/X0bcetErYZ2TMrEBNZw2ADgw==
X-Google-Smtp-Source: ABdhPJybYqbIGH4asZebBm2bhf5RYRavuBbAwqINxy5qSLno5lRFaX3rIb5PnosZFI/0i0qdmj9yhg==
X-Received: by 2002:a2e:9988:: with SMTP id w8mr5257201lji.107.1610725093780;
        Fri, 15 Jan 2021 07:38:13 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
        by smtp.gmail.com with ESMTPSA id s16sm838281ljj.34.2021.01.15.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:38:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu1: add support for qseed3lite used on sm8250
Date:   Fri, 15 Jan 2021 18:38:11 +0300
Message-Id: <20210115153811.401996-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 has quite unique qseed lut type: qseed3lite, which is a
lightweight version of qseed3 scaler.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 38 +++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 73 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  1 +
 7 files changed, 112 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 90393fe9e59c..93c6184903b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,6 +21,9 @@
 #define VIG_SC7180_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED4))
 
+#define VIG_SM8250_MASK \
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
@@ -185,7 +188,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
+	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
@@ -444,6 +447,34 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+
+static const struct dpu_sspp_cfg sm8250_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
+		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
+		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
+		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+};
+
 /*************************************************************
  * MIXER sub blocks config
  *************************************************************/
@@ -969,9 +1000,8 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.mdp = sm8250_mdp,
 		.ctl_count = ARRAY_SIZE(sm8150_ctl),
 		.ctl = sm8150_ctl,
-		/* TODO: sspp qseed version differs from 845 */
-		.sspp_count = ARRAY_SIZE(sdm845_sspp),
-		.sspp = sdm845_sspp,
+		.sspp_count = ARRAY_SIZE(sm8250_sspp),
+		.sspp = sm8250_sspp,
 		.mixer_count = ARRAY_SIZE(sm8150_lm),
 		.mixer = sm8150_lm,
 		.dspp_count = ARRAY_SIZE(sm8150_dspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index eaef99db2d2f..ea4647d21a20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -95,6 +95,7 @@ enum {
  * @DPU_SSPP_SRC             Src and fetch part of the pipes,
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
  * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
+ * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
  * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
  * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
  * @DPU_SSPP_CSC,            Support of Color space converion
@@ -114,6 +115,7 @@ enum {
 	DPU_SSPP_SRC = 0x1,
 	DPU_SSPP_SCALER_QSEED2,
 	DPU_SSPP_SCALER_QSEED3,
+	DPU_SSPP_SCALER_QSEED3LITE,
 	DPU_SSPP_SCALER_QSEED4,
 	DPU_SSPP_SCALER_RGB,
 	DPU_SSPP_CSC,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 2c2ca5335aa8..34d81aa16041 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -673,6 +673,7 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
+			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
 			test_bit(DPU_SSPP_SCALER_QSEED4, &features)) {
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
 		c->ops.get_scaler_ver = _dpu_hw_sspp_get_scaler3_ver;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 85b018a9b03c..fdfd4b46e2c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -28,6 +28,7 @@ struct dpu_hw_pipe;
 #define DPU_SSPP_SCALER ((1UL << DPU_SSPP_SCALER_RGB) | \
 	(1UL << DPU_SSPP_SCALER_QSEED2) | \
 	 (1UL << DPU_SSPP_SCALER_QSEED3) | \
+	 (1UL << DPU_SSPP_SCALER_QSEED3LITE) | \
 	  (1UL << DPU_SSPP_SCALER_QSEED4))
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 84e9875994a8..f94584c982cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -59,6 +59,19 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
 #define QSEED3_SEP_LUT_SIZE \
 	(QSEED3_LUT_SIZE * QSEED3_SEPARABLE_LUTS * sizeof(u32))
 
+/* DPU_SCALER_QSEED3LITE */
+#define QSEED3LITE_COEF_LUT_Y_SEP_BIT         4
+#define QSEED3LITE_COEF_LUT_UV_SEP_BIT        5
+#define QSEED3LITE_COEF_LUT_CTRL              0x4C
+#define QSEED3LITE_COEF_LUT_SWAP_BIT          0
+#define QSEED3LITE_DIR_FILTER_WEIGHT          0x60
+#define QSEED3LITE_FILTERS                 2
+#define QSEED3LITE_SEPARABLE_LUTS             10
+#define QSEED3LITE_LUT_SIZE                   33
+#define QSEED3LITE_SEP_LUT_SIZE \
+	        (QSEED3LITE_LUT_SIZE * QSEED3LITE_SEPARABLE_LUTS * sizeof(u32))
+
+
 void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
 		u32 reg_off,
 		u32 val,
@@ -156,6 +169,57 @@ static void _dpu_hw_setup_scaler3_lut(struct dpu_hw_blk_reg_map *c,
 
 }
 
+static void _dpu_hw_setup_scaler3lite_lut(struct dpu_hw_blk_reg_map *c,
+		struct dpu_hw_scaler3_cfg *scaler3_cfg, u32 offset)
+{
+	int j, filter;
+	int config_lut = 0x0;
+	unsigned long lut_flags;
+	u32 lut_addr, lut_offset;
+	u32 *lut[QSEED3LITE_FILTERS] = {NULL, NULL};
+	static const uint32_t off_tbl[QSEED3_FILTERS] = { 0x000, 0x200 };
+
+	DPU_REG_WRITE(c, QSEED3LITE_DIR_FILTER_WEIGHT + offset, scaler3_cfg->dir_weight);
+
+	if (!scaler3_cfg->sep_lut)
+		return;
+
+	lut_flags = (unsigned long) scaler3_cfg->lut_flag;
+	if (test_bit(QSEED3_COEF_LUT_Y_SEP_BIT, &lut_flags) &&
+		(scaler3_cfg->y_rgb_sep_lut_idx < QSEED3LITE_SEPARABLE_LUTS) &&
+		(scaler3_cfg->sep_len == QSEED3LITE_SEP_LUT_SIZE)) {
+		lut[0] = scaler3_cfg->sep_lut +
+			scaler3_cfg->y_rgb_sep_lut_idx * QSEED3LITE_LUT_SIZE;
+		config_lut = 1;
+	}
+	if (test_bit(QSEED3_COEF_LUT_UV_SEP_BIT, &lut_flags) &&
+		(scaler3_cfg->uv_sep_lut_idx < QSEED3LITE_SEPARABLE_LUTS) &&
+		(scaler3_cfg->sep_len == QSEED3LITE_SEP_LUT_SIZE)) {
+		lut[1] = scaler3_cfg->sep_lut +
+			scaler3_cfg->uv_sep_lut_idx * QSEED3LITE_LUT_SIZE;
+		config_lut = 1;
+	}
+
+	if (config_lut) {
+		for (filter = 0; filter < QSEED3LITE_FILTERS; filter++) {
+			if (!lut[filter])
+				continue;
+			lut_offset = 0;
+			lut_addr = QSEED3_COEF_LUT + offset + off_tbl[filter];
+			for (j = 0; j < QSEED3LITE_LUT_SIZE; j++) {
+				DPU_REG_WRITE(c,
+					lut_addr,
+					(lut[filter])[lut_offset++]);
+				lut_addr += 4;
+			}
+		}
+	}
+
+	if (test_bit(QSEED3_COEF_LUT_SWAP_BIT, &lut_flags))
+		DPU_REG_WRITE(c, QSEED3_COEF_LUT_CTRL + offset, BIT(0));
+
+}
+
 static void _dpu_hw_setup_scaler3_de(struct dpu_hw_blk_reg_map *c,
 		struct dpu_hw_scaler3_de_cfg *de_cfg, u32 offset)
 {
@@ -242,9 +306,12 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 		op_mode |= BIT(8);
 	}
 
-	if (scaler3_cfg->lut_flag)
-		_dpu_hw_setup_scaler3_lut(c, scaler3_cfg,
-								scaler_offset);
+	if (scaler3_cfg->lut_flag) {
+		if (scaler_version < 0x2004)
+			_dpu_hw_setup_scaler3_lut(c, scaler3_cfg, scaler_offset);
+		else
+			_dpu_hw_setup_scaler3lite_lut(c, scaler3_cfg, scaler_offset);
+	}
 
 	if (scaler_version == 0x1002) {
 		phase_init =
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 234eb7d65753..ff3cffde84cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -97,6 +97,7 @@ struct dpu_hw_scaler3_de_cfg {
  * @ cir_lut:      pointer to circular filter LUT
  * @ sep_lut:      pointer to separable filter LUT
  * @ de: detail enhancer configuration
+ * @ dir_weight:   Directional weight
  */
 struct dpu_hw_scaler3_cfg {
 	u32 enable;
@@ -137,6 +138,8 @@ struct dpu_hw_scaler3_cfg {
 	 * Detail enhancer settings
 	 */
 	struct dpu_hw_scaler3_de_cfg de;
+
+	u32 dir_weight;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index bc0231a50132..f898a8f67b7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1465,6 +1465,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 			pdpu->debugfs_root, &pdpu->debugfs_src);
 
 	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
+			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
 			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
 			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4)) {
 		dpu_debugfs_setup_regset32(&pdpu->debugfs_scaler,
-- 
2.29.2

