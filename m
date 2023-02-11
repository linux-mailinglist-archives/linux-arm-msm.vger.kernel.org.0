Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA036934C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjBKXNb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBKXNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:30 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE4813D6B
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:28 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id qw12so23994926ejc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dv+Lurw1/CoBVw4t2m33kmbSWSwkF3q+vhhWfvceUaU=;
        b=j9vKvFz5tj4VZ5Nk9uqnE1FU2jLL28eTzLTWusYrclGJ0ZcmymxXHwW2mouPnS8VdW
         t7vs8zdD42ZiSyYKlGxFQDk8mwBRYSEqlaXYkYfUN1B9LH/NCLR7eWI8jYC3g6JHr6Lr
         aIgpNXCz27soRjjS1PnS/IFtTvEiY7Lmv6eMVXJ/qCG0eUsgALzCLGZg60WCccep/sqM
         AqY4YYBUJ108pQK6zriZRQA6GDxtFLbPfuFvsnl9rshMvESkZZ+wDDqKmNgdsuZW6Rrf
         dLbILSn1Fz4pmjV7zROqipzwYVmcHsjizdCdPVUfdOaDsCGjxtPOqjjGaMYT/ZCd/K/v
         KsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dv+Lurw1/CoBVw4t2m33kmbSWSwkF3q+vhhWfvceUaU=;
        b=ehr2mdc0M4VRp3OyH/48/8/yLLXV6pqw/TaizsVKpSScyEBP6VOBKqlSU6geOJAPD3
         3mMtm3dyY4K5n1C0T3+oGHHVmT0mOAE8QGE/yRY6kLnTLte3zEkXoQERPZyk8FjK8zzG
         zlNYfnTK8tLwJpTG+NvVcajKKiGD+HWwzC78Kz7amTk8OH4KAFQAqxUyLZI/CnM1etno
         akWoxXDNkaNf/F73PxJu8MnFv/bAZr2cObphuWuZxql7qTqHE4RgEt2SWbhxAbyu8lmu
         ZE3L29PCZNijXhY3DpYhfk1aiOGhzj0sRecgA7HhIKJOszEJELZsFFOwwxU1kpJLi1xO
         5Odw==
X-Gm-Message-State: AO0yUKWZlZ0FfmFFnysPbR+MZgMj2WBpuMmci/nfMDDOyx1w8QL+lNPa
        n9Wrd4NGFDdaQWLRjyOMDXdYog==
X-Google-Smtp-Source: AK7set9cbAzXQZvJOWtuDUeicYP/ekUuet2LEuIN8oXNXsnctkMEs4mj8rbkHIrTXYhrkUwMeAk0Rg==
X-Received: by 2002:a17:907:94ca:b0:8aa:be1a:c4bf with SMTP id dn10-20020a17090794ca00b008aabe1ac4bfmr23760746ejc.16.1676157207052;
        Sat, 11 Feb 2023 15:13:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 21/50] drm/msm/dpu: split SC7280 catalog entry to the separate file
Date:   Sun, 12 Feb 2023 01:12:30 +0200
Message-Id: <20230211231259.1308718-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 149 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 145 +----------------
 2 files changed, 151 insertions(+), 143 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
new file mode 100644
index 000000000000..8977878890f1
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_7_2_SC7280_H
+#define _DPU_7_2_SC7280_H
+
+static const struct dpu_caps sc7280_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x7,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2400,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_30,
+	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x6,
+};
+
+static const struct dpu_mdp_cfg sc7280_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x2014,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_ctl_cfg sc7280_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x1e8,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+};
+
+static const struct dpu_sspp_cfg sc7280_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK,
+		sc7280_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+};
+
+static const struct dpu_lm_cfg sc7280_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
+};
+
+static const struct dpu_pingpong_cfg sc7280_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+};
+
+static const struct dpu_intf_cfg sc7280_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
+};
+
+static const struct dpu_perf_cfg sc7280_perf_data = {
+	.max_bw_low = 4700000,
+	.max_bw_high = 8800000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
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
+static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
+	.caps = &sc7280_dpu_caps,
+	.ubwc = &sc7280_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sc7280_mdp),
+	.mdp = sc7280_mdp,
+	.ctl_count = ARRAY_SIZE(sc7280_ctl),
+	.ctl = sc7280_ctl,
+	.sspp_count = ARRAY_SIZE(sc7280_sspp),
+	.sspp = sc7280_sspp,
+	.dspp_count = ARRAY_SIZE(sc7180_dspp),
+	.dspp = sc7180_dspp,
+	.mixer_count = ARRAY_SIZE(sc7280_lm),
+	.mixer = sc7280_lm,
+	.pingpong_count = ARRAY_SIZE(sc7280_pp),
+	.pingpong = sc7280_pp,
+	.intf_count = ARRAY_SIZE(sc7280_intf),
+	.intf = sc7280_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sc7280_perf_data,
+	.mdss_irqs = IRQ_SC7280_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 637bc85d8a2c..d5f6b3e48770 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -416,17 +416,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_caps sc7280_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
-	.max_mixer_blendstages = 0x7,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.max_linewidth = 2400,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.highest_bank_bit = 0x2,
@@ -473,12 +462,6 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 };
 
-static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -639,21 +622,6 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg sc7280_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x2014,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-		.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-		.reg_off = 0x2B4, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
-		.reg_off = 0x2C4, .bit_off = 8},
-	},
-};
-
 static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -834,33 +802,6 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	},
 };
 
-static const struct dpu_ctl_cfg sc7280_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
-	},
-	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
-	},
-	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x1E8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
-	},
-};
-
 static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -1082,17 +1023,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
-static const struct dpu_sspp_cfg sc7280_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK,
-		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
-		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-};
-
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
 				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
@@ -1226,15 +1156,6 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
-static const struct dpu_lm_cfg sc7280_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
-};
-
 /* QCM2290 */
 
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
@@ -1419,13 +1340,6 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 			-1),
 };
 
-static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
-};
-
 static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1520,12 +1434,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
-static const struct dpu_intf_cfg sc7280_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
-	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
-};
-
 static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -1989,34 +1897,6 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg sc7280_perf_data = {
-	.max_bw_low = 4700000,
-	.max_bw_high = 8800000,
-	.min_core_ib = 2500000,
-	.min_llcc_ib = 0,
-	.min_dram_ib = 1600000,
-	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
-	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
-	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
-		.entries = sc7180_qos_macrotile
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
 static const struct dpu_perf_cfg sm8350_perf_data = {
 	.max_bw_low = 11800000,
 	.max_bw_high = 15500000,
@@ -2283,29 +2163,6 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8350_MASK,
 };
 
-static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
-	.caps = &sc7280_dpu_caps,
-	.ubwc = &sc7280_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sc7280_mdp),
-	.mdp = sc7280_mdp,
-	.ctl_count = ARRAY_SIZE(sc7280_ctl),
-	.ctl = sc7280_ctl,
-	.sspp_count = ARRAY_SIZE(sc7280_sspp),
-	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
-	.mixer_count = ARRAY_SIZE(sc7280_lm),
-	.mixer = sc7280_lm,
-	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-	.pingpong = sc7280_pp,
-	.intf_count = ARRAY_SIZE(sc7280_intf),
-	.intf = sc7280_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.perf = &sc7280_perf_data,
-	.mdss_irqs = IRQ_SC7280_MASK,
-};
-
 static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.ubwc = &qcm2290_ubwc_cfg,
@@ -2329,6 +2186,8 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
 
+#include "catalog/dpu_7_2_sc7280.h"
+
 #include "catalog/dpu_8_0_sc8280xp.h"
 #include "catalog/dpu_8_1_sm8450.h"
 
-- 
2.39.1

