Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B49692CD3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjBKCLL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjBKCLK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:10 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E485D75361
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:08 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id gr7so20207236ejb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX680bEhgbBfMIF9rfMRPtu7UvJEfSIXcWmq7q90ehI=;
        b=lfbix4m9FoVUU/baA9qhiHLOKUaDflmPuBFl1yjpwi95q/19sMgdva3DHjZ8fl6I/D
         vS9ZL4AE3NSKnsfxiGxQRqY1oKBpMzfJXAbSaT2kXLYtnMmXLVt2yCBTmVvTD3AWakZp
         +2BK2YcDW/YecJHRHrXy6LoEJPhATUXZ1GmXJ6kDFwcZmZYs4MXaAneyM4Dc4U7HISge
         RtGbrKkzgxBJ+PYAB2Moj3RYATk1agnjsDIT5qLWKm+zMYzuIihmc9Ywo+twP0JznHmh
         JeapMC5xKks02BV/vaFMk8qemzscA3LX3wKraBVWRT47LX+ofXVL65SBHLYvkNaKS/Nz
         AdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX680bEhgbBfMIF9rfMRPtu7UvJEfSIXcWmq7q90ehI=;
        b=itg71wFbk6uJJY9NbCoXnYABwjZbamCaNHE7APxiwRK9om9G6DlK5bAokfUbl10+7u
         2YicWUORg26j87WIsUe0YzHpO2HBewylVXvWgOHZnCbaZTOdfscj1BYD2fPhgYqJTzYA
         228Na3F5hJq0hr8A980WvYXxEGGO5kHUj0HR4jm6fTSYUuL4P0uGjj0cB9mVOqH6bFkT
         i6HvBG66fE5RoQmu1aT76Eu7Bj7niSo2B/+qMf34eDCf2bQSznVBWB3aHnI4haXMbQDY
         cJqQHKMc600PcmT6ex21i+I7jxGqEgiMEX2Zlec/xDvBXd4sbTRvMN+E3NSzRl34pcue
         xxNw==
X-Gm-Message-State: AO0yUKXN9k2errAHWw2qD1Be5AwmmjQ9j2k7aDKlNlCGkTfuIoD0YrW3
        QPPHZduRzaRTZX8nJqVyLeuWSQ==
X-Google-Smtp-Source: AK7set+3A7hpSlfSnKYh6BIszrRyfKBbEsNx4LzU44rjmQCObPC5B2jIjdDUO+jbfIeXCvhg7whcyA==
X-Received: by 2002:a17:906:a00f:b0:878:6755:9089 with SMTP id p15-20020a170906a00f00b0087867559089mr18088191ejy.39.1676081468526;
        Fri, 10 Feb 2023 18:11:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 13/43] drm/msm/dpu: split SC8180X catalog entry to the separate file
Date:   Sat, 11 Feb 2023 04:10:23 +0200
Message-Id: <20230211021053.1078648-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 108 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 106 +----------------
 2 files changed, 109 insertions(+), 105 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
new file mode 100644
index 000000000000..423a47f02a00
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_5_1_SC8180X_H
+#define _DPU_5_1_SC8180X_H
+
+static const struct dpu_caps sc8180x_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 4096,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_30,
+	.highest_bank_bit = 0x3,
+};
+
+static const struct dpu_mdp_cfg sc8180x_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x45c,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_intf_cfg sc8180x_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
+	INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_4", INTF_4, 0x6c000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
+	INTF_BLK("intf_5", INTF_5, 0x6c800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
+};
+
+static const struct dpu_perf_cfg sc8180x_perf_data = {
+	.max_bw_low = 9600000,
+	.max_bw_high = 9600000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
+	.caps = &sc8180x_dpu_caps,
+	.ubwc = &sc8180x_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
+	.mdp = sc8180x_mdp,
+	.ctl_count = ARRAY_SIZE(sm8150_ctl),
+	.ctl = sm8150_ctl,
+	.sspp_count = ARRAY_SIZE(sdm845_sspp),
+	.sspp = sdm845_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.pingpong_count = ARRAY_SIZE(sm8150_pp),
+	.pingpong = sm8150_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
+	.merge_3d = sm8150_merge_3d,
+	.intf_count = ARRAY_SIZE(sc8180x_intf),
+	.intf = sc8180x_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sm8150_regdma,
+	.perf = &sc8180x_perf_data,
+	.mdss_irqs = IRQ_SC8180X_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 731303c31e74..fa542247005a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -346,21 +346,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_caps sc8180x_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-	.has_src_split = true,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.has_3d_merge = true,
-	.max_linewidth = 4096,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-	.max_hdeci_exp = MAX_HORZ_DECIMATION,
-	.max_vdeci_exp = MAX_VERT_DECIMATION,
-};
-
 static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.highest_bank_bit = 0x2,
@@ -376,11 +361,6 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x3,
-};
-
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -433,30 +413,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sc8180x_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x45C,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-			.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-			.reg_off = 0x2B4, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
-			.reg_off = 0x2BC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
-			.reg_off = 0x2C4, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-			.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-			.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
-			.reg_off = 0x2BC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
-			.reg_off = 0x2C4, .bit_off = 8},
-	},
-};
-
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
@@ -1079,16 +1035,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
-static const struct dpu_intf_cfg sc8180x_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-	INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
-	INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
-};
-
 /*************************************************************
  * Writeback blocks config
  *************************************************************/
@@ -1412,33 +1358,6 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sc8180x_perf_data = {
-	.max_bw_low = 9600000,
-	.max_bw_high = 9600000,
-	.min_core_ib = 2400000,
-	.min_llcc_ib = 800000,
-	.min_dram_ib = 800000,
-	.danger_lut_tbl = {0xf, 0xffff, 0x0},
-	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
-		.entries = sc7180_qos_linear
-		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
-		.entries = sc7180_qos_macrotile
-		},
-		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
-		.entries = sc7180_qos_nrt
-		},
-		/* TODO: macrotile-qseed is different from macrotile */
-	},
-	.cdp_cfg = {
-		{.rd_enable = 1, .wr_enable = 1},
-		{.rd_enable = 1, .wr_enable = 0}
-	},
-	.clk_inefficiency_factor = 105,
-	.bw_inefficiency_factor = 120,
-};
-
 /*************************************************************
  * Hardware catalog
  *************************************************************/
@@ -1521,30 +1440,7 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.mdss_irqs = IRQ_SDM845_MASK,
 };
 
-static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
-	.caps = &sc8180x_dpu_caps,
-	.ubwc = &sc8180x_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
-	.mdp = sc8180x_mdp,
-	.ctl_count = ARRAY_SIZE(sm8150_ctl),
-	.ctl = sm8150_ctl,
-	.sspp_count = ARRAY_SIZE(sdm845_sspp),
-	.sspp = sdm845_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.pingpong_count = ARRAY_SIZE(sm8150_pp),
-	.pingpong = sm8150_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-	.merge_3d = sm8150_merge_3d,
-	.intf_count = ARRAY_SIZE(sc8180x_intf),
-	.intf = sc8180x_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sm8150_regdma,
-	.perf = &sc8180x_perf_data,
-	.mdss_irqs = IRQ_SC8180X_MASK,
-};
+#include "catalog/dpu_5_1_sc8180x.h"
 
 #include "catalog/dpu_6_0_sm8250.h"
 #include "catalog/dpu_6_2_sc7180.h"
-- 
2.39.1

