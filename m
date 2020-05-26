Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6C51E19E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 05:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388713AbgEZDXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 23:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388749AbgEZDXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 23:23:12 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FACCC05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 20:23:12 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id w3so13741766qkb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 20:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+bFIbcYsC9fBmbchBO6h5hIPHmAfXi5c5B7gW9XUTV0=;
        b=m3PcL0ZlYs2DMr2VV+60eq1MvSysu9xorywneHryCnresZL/iuIgChg+xtnJ+lqdjV
         kRz0fyVNVuqx+s3N4ic2JLNDv8uQV+WEI8CdigfPQtQFETM8qnVtGDhCBZrIDdnu4hHh
         149NCkXOFp5EiwiLljKHr9INPS2HfsSLgNBl/l09+21Xza9yntWILXDl04IWqyFZs58Y
         WH0+kZVDCuvmX1ZJk/ZhmQaHnFjFjjZ1JvJwyUsZPxtN/09r363VblgOtpP9LAXqBx8c
         1CfPun+IEmC5qbklneUg5yEbQh7yAiDSD1KRxE71KsccaIx5eaKHwqGl+t33vP4xaVDo
         mPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+bFIbcYsC9fBmbchBO6h5hIPHmAfXi5c5B7gW9XUTV0=;
        b=Xy9v3FzHWyiQZzya9fp7a4s4vbB4jOFd/viHVfaBnrHsBYdPIG60bLQUhipE06AMuR
         qSAN3T01SLINmUVepmNriBW08WFeCinbO3zId9thnlCXpG3DJXuPFqakO6HG3UC9nslk
         ceyakNHhRvcJ6uMM/qJRiLqmPa9SF6lntKf1mq9px1sh+QFuXKBlUWZulTEK8+spkxdj
         fVqHGAWP7E1gShJhNPaGaaVIwpj2XmIPJ39Mt16IEprKABbbrxRmuWSBBklGwmagc8RQ
         BmiYBgpNmRD1JqUgFMfaFwwI6FT/g66dHlgUtO2rICM6or6HnRceUfRwB28NkzlwrVPP
         ui/A==
X-Gm-Message-State: AOAM531YbISt0ZrJaNMpncOtr4WxHeBDmrmynIBFmufg1C+K9mSzd+u7
        PlsumCv86sCIr+3NbhbxB+KKoFdkknV93A==
X-Google-Smtp-Source: ABdhPJxqIU2gB4RW099dsUzZeDnAmqA8DR6tsNhFlP32sBFdPQ4YbsPkd6vs3UwNmBDEqeOjeJrQkw==
X-Received: by 2002:a37:a309:: with SMTP id m9mr7033037qke.284.1590463391407;
        Mon, 25 May 2020 20:23:11 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 20:23:11 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 8/8] drm/msm/dpu: add SM8250 to hw catalog
Date:   Mon, 25 May 2020 23:22:15 -0400
Message-Id: <20200526032235.21930-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This brings up basic video mode functionality for SM8250 DPU. Command mode
and dual mixer/intf configurations are not working, future patches will
address this. Scaler functionality and multiple planes is also untested.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 106 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
 2 files changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f99622870676..711ec1e6a543 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -107,6 +107,21 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
+static const struct dpu_caps sm8250_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.max_linewidth = 4096,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2_5,
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 4096,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -149,6 +164,33 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sm8250_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x45C,
+	.features = 0,
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+			.reg_off = 0x2AC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
+			.reg_off = 0x2B4, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
+			.reg_off = 0x2BC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
+			.reg_off = 0x2C4, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+			.reg_off = 0x2AC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
+			.reg_off = 0x2B4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+			.reg_off = 0x2BC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+			.reg_off = 0x2C4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
+			.reg_off = 0x2BC, .bit_off = 20},
+	},
+};
+
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
@@ -519,6 +561,14 @@ static const struct dpu_reg_dma_cfg sm8150_regdma = {
 	.base = 0x0, .version = 0x00010001, .trigger_sel_off = 0x119c
 };
 
+static const struct dpu_reg_dma_cfg sm8250_regdma = {
+	.base = 0x0,
+	.version = 0x00010002,
+	.trigger_sel_off = 0x119c,
+	.xin_id = 7,
+	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
+};
+
 /*************************************************************
  * PERF data config
  *************************************************************/
@@ -656,6 +706,31 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	},
 };
 
+static const struct dpu_perf_cfg sm8250_perf_data = {
+	.max_bw_low = 13700000,
+	.max_bw_high = 16600000,
+	.min_core_ib = 4800000,
+	.min_llcc_ib = 0,
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
+};
+
 /*************************************************************
  * Hardware catalog init
  *************************************************************/
@@ -747,11 +822,42 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 	};
 }
 
+/*
+ * sm8250_cfg_init(): populate sm8250 dpu sub-blocks reg offsets
+ * and instance counts.
+ */
+static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
+{
+	*dpu_cfg = (struct dpu_mdss_cfg){
+		.caps = &sm8250_dpu_caps,
+		.mdp_count = ARRAY_SIZE(sm8250_mdp),
+		.mdp = sm8250_mdp,
+		.ctl_count = ARRAY_SIZE(sm8150_ctl),
+		.ctl = sm8150_ctl,
+		/* TODO: sspp qseed version differs from 845 */
+		.sspp_count = ARRAY_SIZE(sdm845_sspp),
+		.sspp = sdm845_sspp,
+		.mixer_count = ARRAY_SIZE(sm8150_lm),
+		.mixer = sm8150_lm,
+		.pingpong_count = ARRAY_SIZE(sm8150_pp),
+		.pingpong = sm8150_pp,
+		.intf_count = ARRAY_SIZE(sm8150_intf),
+		.intf = sm8150_intf,
+		.vbif_count = ARRAY_SIZE(sdm845_vbif),
+		.vbif = sdm845_vbif,
+		.reg_dma_count = 1,
+		.dma_cfg = sm8250_regdma,
+		.perf = sm8250_perf_data,
+		.mdss_irqs = 0xff,
+	};
+}
+
 static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
 	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
 	{ .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
 	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
+	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
 	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 31ddb2be9c57..cdd200194c4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -408,6 +408,7 @@ enum dpu_clk_ctrl_type {
 	DPU_CLK_CTRL_CURSOR0,
 	DPU_CLK_CTRL_CURSOR1,
 	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
+	DPU_CLK_CTRL_REG_DMA,
 	DPU_CLK_CTRL_MAX,
 };
 
@@ -577,6 +578,8 @@ struct dpu_reg_dma_cfg {
 	DPU_HW_BLK_INFO;
 	u32 version;
 	u32 trigger_sel_off;
+	u32 xin_id;
+	enum dpu_clk_ctrl_type clk_ctrl;
 };
 
 /**
-- 
2.26.1

