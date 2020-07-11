Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A3621C14A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 02:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgGKAug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 20:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgGKAu3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 20:50:29 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA8AC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:50:29 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id b185so7109619qkg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XuKnWcFSgGPyy7W5Q8ckcfqK3DnZHWryFWbqDhKba5s=;
        b=nhfdA00sOP4HeM1eqGTbDiy9hgHHva2H+iOI+mbRMd8gU0X9bPyYzqqHdDc25LMhEc
         Xvmec+YZqRx1RgXtYuA6m10pFaw3+uhCHmpHJTxx1lE+2XY43lvK7kYQwtwv7SLhJ1MB
         /JJCafqgqDkRZuhfgk4cDaz+Qsid/NuECEnb2sa6r0f3t6iE2g6xNf9GX5CUWOUl8c98
         htr9jjRFR4851rYX1RfoyGT/uTEjHAr+pK4sPszaR5wldX90Kr6EZnao0897h+eQOiXE
         XGmXk010Ld8B4tjYsosiQ6zggVW1MN+PrIDt2WD6968z56ULIE1BY4kwIDZ6iSKxPG86
         cQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XuKnWcFSgGPyy7W5Q8ckcfqK3DnZHWryFWbqDhKba5s=;
        b=HCAuOd8+HuGU6GuOswwS4a0bp0jgh7lJm9MWcylJAiPKhYy9UqrKdpRamyqc6wsTBr
         XdW+wl7ANFAHF+lyTnaVZfjLAIg9BFzdEeEqjeN+SsmeX5xIKUzT98aqUAVU5NYeZ3YE
         IlkHO3LE2D+bWEUwI+S8VLZYWbwXa81+ZbRdqhHUH6Mi0Jn/bAWKtDeJDKDJbiL+lwqF
         zt93PN2dhp4iTvjKkNvfVbS+aTSTM1vOF5fNl6JVa7bZazBVUuik56il0AmyI4S+kGug
         wNDnyZrWBWfW2yFACDhPGT1hWIckEFt9xOM+8bJamTU/HwHuT+pUJZjJtYQTv3m8HCee
         2D0A==
X-Gm-Message-State: AOAM530sgHcWvZ85lg9QOMHrdfzDz5c4PmiE+YFikUjlh8wOf/Jim5Xz
        j4uNX8TuaHmoSHWLx2R1BzUicQ==
X-Google-Smtp-Source: ABdhPJw0K/rSJJFuRwVzyDZ7MnP/cQazYup2WzIpRertajcyTfq2AIBidcNxMjFRWsiMqPpX9pQsaw==
X-Received: by 2002:a05:620a:633:: with SMTP id 19mr70729659qkv.372.1594428628616;
        Fri, 10 Jul 2020 17:50:28 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 17:50:28 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 8/8] drm/msm/dpu: add SM8250 to hw catalog
Date:   Fri, 10 Jul 2020 20:47:31 -0400
Message-Id: <20200711004752.30760-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
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
index 20f869bbd574..17e9223e5a2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -109,6 +109,21 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
+static const struct dpu_caps sm8250_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.max_linewidth = 4096,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
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
@@ -151,6 +166,33 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
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
@@ -542,6 +584,14 @@ static const struct dpu_reg_dma_cfg sm8150_regdma = {
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
@@ -679,6 +729,31 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
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
@@ -772,11 +847,42 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
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
index e9458c85e20c..1b7a9213a756 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -429,6 +429,7 @@ enum dpu_clk_ctrl_type {
 	DPU_CLK_CTRL_CURSOR0,
 	DPU_CLK_CTRL_CURSOR1,
 	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
+	DPU_CLK_CTRL_REG_DMA,
 	DPU_CLK_CTRL_MAX,
 };
 
@@ -612,6 +613,8 @@ struct dpu_reg_dma_cfg {
 	DPU_HW_BLK_INFO;
 	u32 version;
 	u32 trigger_sel_off;
+	u32 xin_id;
+	enum dpu_clk_ctrl_type clk_ctrl;
 };
 
 /**
-- 
2.26.1

