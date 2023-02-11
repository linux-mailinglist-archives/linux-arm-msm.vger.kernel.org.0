Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9729A692CD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjBKCLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjBKCLK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:10 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C4A73942
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:08 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so20236625ejc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJLcP2Z80GU+LLo1r5K4dJgTBd/yDmquGfRT5dA9nZE=;
        b=wEzjQ4FYCxUJGIbYKqqFoOb6kuMi0J/ehNWX+DdQEHSJzsaLTc0QS/TNQfLbSk+cTf
         RBjzlklHmI36ZJQugHWzwcJaoxynIzVJZNJWpFNlzVolm3jz2Mm5nsNarSBJrueXHNT9
         rQM7QyEyjjrYEzrjOWq9g0tSOXFp1hRTTK9e4ZjwE4wBnAlK12neSQ4OdSrCj+99muX+
         RmhtMtJbPINUa7HrbMr1B9k/avnd5z7mcORF2LGR+1e1IsCCszq8hGmKscs1KIQrubtW
         TV3trNEUeWPanxniIYzVd/Ra/nuZFruVy5mN/Qv3YpCnlx2jcnkAjMDlXr3kClLmM9n3
         Amzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJLcP2Z80GU+LLo1r5K4dJgTBd/yDmquGfRT5dA9nZE=;
        b=8N5OC26o043X25VHlLd6s0MI9rz95kxdOo3k3swcouxEq6olmVxmsDjfixNQfhkAkg
         7hgJOuZH6Z4fznOY1sa5kmGZUyBn9SceMEFGDMapHxgja5H9P8ss51AuB1aZyZJeOT40
         3sSYDIh6QZgPoriYZn4EAFnPt9/5PG8x1+nwV/7nGohSqJW88QVq8UAs2R5dC7HXAh6N
         r8GgQhY1QtNtu7IYqlmcPR69SEk4fEX6xEbVlVZ0lXFW22Qq3yMWgK4Jtk6GYO5Krjzt
         Xs9OxcmXLApO9qrUgmUoQ1gm6EW/Ey9j0rA+fL5j/tIoRMKjmRPjLjE+EcsBMF1Suqmg
         CT9A==
X-Gm-Message-State: AO0yUKW0yUJjkrnAeDeCoZN6JReRPeaIfkrdDWQe1fw5epNm8B5msUAc
        iWOOX2zb94uPqcrTNE+5n4ufDg==
X-Google-Smtp-Source: AK7set/d1PMlANbUSxCWCc9Jj67j0RtW+Aoi4Xpo7EyARb9qbVEcPqhJ18TPzVdpwflHwLzjZb2veg==
X-Received: by 2002:a17:906:694a:b0:887:5f45:d688 with SMTP id c10-20020a170906694a00b008875f45d688mr19764535ejs.41.1676081466488;
        Fri, 10 Feb 2023 18:11:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 11/43] drm/msm/dpu: split SC7180 catalog entry to the separate file
Date:   Sat, 11 Feb 2023 04:10:21 +0200
Message-Id: <20230211021053.1078648-12-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 148 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 144 +----------------
 2 files changed, 149 insertions(+), 143 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
new file mode 100644
index 000000000000..6184d82fd9f1
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_6_2_SC7180_H
+#define _DPU_6_2_SC7180_H
+
+static const struct dpu_caps sc7180_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x9,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.highest_bank_bit = 0x3,
+};
+
+static const struct dpu_mdp_cfg sc7180_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+	},
+};
+
+static const struct dpu_ctl_cfg sc7180_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0xe4,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x1200, .len = 0xe4,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x1400, .len = 0xe4,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+};
+
+static const struct dpu_sspp_cfg sc7180_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+		sc7180_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+};
+
+static const struct dpu_lm_cfg sc7180_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
+};
+
+static const struct dpu_dspp_cfg sc7180_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
+};
+
+static const struct dpu_intf_cfg sc7180_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+};
+
+static const struct dpu_perf_cfg sc7180_perf_data = {
+	.max_bw_low = 6800000,
+	.max_bw_high = 6800000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
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
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
+	.caps = &sc7180_dpu_caps,
+	.ubwc = &sc7180_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sc7180_mdp),
+	.mdp = sc7180_mdp,
+	.ctl_count = ARRAY_SIZE(sc7180_ctl),
+	.ctl = sc7180_ctl,
+	.sspp_count = ARRAY_SIZE(sc7180_sspp),
+	.sspp = sc7180_sspp,
+	.mixer_count = ARRAY_SIZE(sc7180_lm),
+	.mixer = sc7180_lm,
+	.dspp_count = ARRAY_SIZE(sc7180_dspp),
+	.dspp = sc7180_dspp,
+	.pingpong_count = ARRAY_SIZE(sc7180_pp),
+	.pingpong = sc7180_pp,
+	.intf_count = ARRAY_SIZE(sc7180_intf),
+	.intf = sc7180_intf,
+	.wb_count = ARRAY_SIZE(sm8250_wb),
+	.wb = sm8250_wb,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sdm845_regdma,
+	.perf = &sc7180_perf_data,
+	.mdss_irqs = IRQ_SC7180_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8936de069014..4a87581a9b20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -331,17 +331,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_caps sc7180_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0x9,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
@@ -395,11 +384,6 @@ static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.highest_bank_bit = 0x3,
-};
-
 static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.highest_bank_bit = 0x2,
@@ -468,24 +452,6 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sc7180_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-		.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
-		.reg_off = 0x2C4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
-		.reg_off = 0x3B8, .bit_off = 24},
-	},
-};
-
 static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -607,27 +573,6 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	},
 };
 
-static const struct dpu_ctl_cfg sc7180_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0xE4,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0xE4,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0xE4,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-};
-
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -810,17 +755,6 @@ static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
 static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
 			_VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
 
-static const struct dpu_sspp_cfg sc7180_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-};
-
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
 				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED3LITE);
 
@@ -974,13 +908,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-static const struct dpu_lm_cfg sc7180_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
-};
-
 /* SM8150 */
 
 static const struct dpu_lm_cfg sm8150_lm[] = {
@@ -1043,11 +970,6 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 		 &msm8998_dspp_sblk),
 };
 
-static const struct dpu_dspp_cfg sc7180_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sc7180_dspp_sblk),
-};
-
 static const struct dpu_dspp_cfg sm8150_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
 		 &sm8150_dspp_sblk),
@@ -1125,11 +1047,6 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static const struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
-};
-
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1221,11 +1138,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
-static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-};
-
 static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -1542,34 +1454,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sc7180_perf_data = {
-	.max_bw_low = 6800000,
-	.max_bw_high = 6800000,
-	.min_core_ib = 2400000,
-	.min_llcc_ib = 800000,
-	.min_dram_ib = 1600000,
-	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xff, 0xffff, 0x0},
-	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
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
-	},
-	.cdp_cfg = {
-		{.rd_enable = 1, .wr_enable = 1},
-		{.rd_enable = 1, .wr_enable = 0}
-	},
-	.clk_inefficiency_factor = 105,
-	.bw_inefficiency_factor = 120,
-};
-
 static const struct dpu_perf_cfg sm8150_perf_data = {
 	.max_bw_low = 12800000,
 	.max_bw_high = 12800000,
@@ -1708,33 +1592,6 @@ static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
 	.mdss_irqs = IRQ_SDM845_MASK,
 };
 
-static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
-	.caps = &sc7180_dpu_caps,
-	.ubwc = &sc7180_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc7180_mdp),
-	.mdp = sc7180_mdp,
-	.ctl_count = ARRAY_SIZE(sc7180_ctl),
-	.ctl = sc7180_ctl,
-	.sspp_count = ARRAY_SIZE(sc7180_sspp),
-	.sspp = sc7180_sspp,
-	.mixer_count = ARRAY_SIZE(sc7180_lm),
-	.mixer = sc7180_lm,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
-	.pingpong_count = ARRAY_SIZE(sc7180_pp),
-	.pingpong = sc7180_pp,
-	.intf_count = ARRAY_SIZE(sc7180_intf),
-	.intf = sc7180_intf,
-	.wb_count = ARRAY_SIZE(sm8250_wb),
-	.wb = sm8250_wb,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
-	.perf = &sc7180_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
-};
-
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.ubwc = &sm8150_ubwc_cfg,
@@ -1820,6 +1677,7 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8250_MASK,
 };
 
+#include "catalog/dpu_6_2_sc7180.h"
 #include "catalog/dpu_6_5_qcm2290.h"
 #include "catalog/dpu_6_3_sm6115.h"
 
-- 
2.39.1

