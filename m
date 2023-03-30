Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F926D1138
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjC3VyK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjC3VyI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:08 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4715510A82
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c9so15964230lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79S7p9120ulriu+q7mBuTYUAYYzyzxLTVEb3FMyOpZs=;
        b=g/M8/yARFroF7awPeK/Z4msjS6qFnrLvFJjBi4i4jXDwKs0EcCjD2nqoGCDzaRdmGS
         G5RB7eYeDX7V7uhjo2fOI+EMLqCPP7Q/1wFUHA9BTvzMADcOL5st4MyiK1OXxwHpePNp
         74BP2312dyLY4lDq/X/3+wTh9N7hf/qWA70fkF6hB+gVoCHQnshTTENvRJhobRwMAmFA
         8jb26N+8fdZceGZZn88rbCqQKlxF+nrmce7V1re/5loGvNKiLhpnZtcrZnru17NjGCQg
         UNkWsXku11NXEHmrEoZK4NUe1rc86lHqsPzmJlD0NstEJT+GqvqHaDzYLWC3Y+PRI+6a
         ud0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79S7p9120ulriu+q7mBuTYUAYYzyzxLTVEb3FMyOpZs=;
        b=ljyXzff7+XEX/vIl1mMihYSnSRCnR5xtp3/NtkjWMVgGc78RK7tqrOKjYYkawCDabZ
         cpL/WLEgDU9iiD+Cq3CCjUQAtCGT3pkeRQxpcCIQ8DIazXaxYddJSNUy19Kirw1m7zDP
         u9LwkWxwFXF3EgiaZi08bWbIAtTugDRPq0PcoaqwxCNy9vyfcK7+L1g65Bk7dzmFQA+F
         ueczozh8n05tL4xYiQukJwRlSOsMlUOaL8utA98zvc56vTHMz+ekIO7dD0M+8Wrl7LyB
         aUrQ/HoBzS9CXLDxMsplGBUGziq/O36FBZfwPbQuzWALR3xZOYkQWHRKpXRkyutIhr3Z
         88ng==
X-Gm-Message-State: AAQBX9eAK7oVVQLYb1j6KRT8hy/Iuqz5Tv2QEwz5BfCxgclvx34uHumH
        E3a86pEr9/k2U/F56rXY9g+67g==
X-Google-Smtp-Source: AKy350aoYtCz+hiPz+VzwoP0ZyjeGovMhe5YyHJUo4jVU+6Hs/fZRxGJcIj5djNRTfsda0zuogodmA==
X-Received: by 2002:ac2:518d:0:b0:4a4:68b9:66f3 with SMTP id u13-20020ac2518d000000b004a468b966f3mr7005984lfi.62.1680213245602;
        Thu, 30 Mar 2023 14:54:05 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 14/38] drm/msm/dpu: split SC8180X catalog entry to the separate file
Date:   Fri, 31 Mar 2023 00:53:00 +0300
Message-Id: <20230330215324.1853304-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 107 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 105 +----------------
 2 files changed, 108 insertions(+), 104 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
new file mode 100644
index 000000000000..86411eb9f051
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -0,0 +1,107 @@
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
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
+	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
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
index ac996a4fc388..712f090eb3c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -361,20 +361,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_caps sc8180x_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3,
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
@@ -390,11 +376,6 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
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
@@ -447,30 +428,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
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
@@ -1093,16 +1050,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
-static const struct dpu_intf_cfg sc8180x_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
-	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
-	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
-	INTF_BLK("intf_4", INTF_4, 0x6C000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
-	INTF_BLK("intf_5", INTF_5, 0x6C800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
-};
-
 /*************************************************************
  * Writeback blocks config
  *************************************************************/
@@ -1426,33 +1373,6 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
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
@@ -1535,30 +1455,7 @@ static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
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
2.39.2

