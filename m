Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5129B1E19E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 05:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388727AbgEZDXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 23:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388729AbgEZDXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 23:23:08 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E6DC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 20:23:08 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id j32so206819qte.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 20:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tX4/SOOHdtEBAXGt+8LIJm1+5qFzsrBwpaCGEZw6nRw=;
        b=UNLxE+mDn+q2tmS4uLWwdPj4+WtnND1k3JgokzR7xU4Y1acEB3LLRYLuaHcvuuOiEt
         ldRbGT7GIzvozwTnCA3w/vlHXn8xGHRDJfif3C8fKakEfxhioT9Ra7FJWwR6R2RNxyoy
         mosULfNbE5Qm0sRtrFczknS8vPz9jxf5GvI3LFYugOhoo+F1fc4rKMMEC4OYxmpgAVRA
         lla1QY3XJQya5clLQ0aa4iRspk2WkWPtVcZ0iAbTKjzZs9DAbipc28XaHxXqgW26D5ui
         2HFnhW648s8OjacUr2CSq3ofTgZC3YBWhZHUWFKVr9MVFJhAhA24tTMJiWVJPUh1S3I5
         QLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tX4/SOOHdtEBAXGt+8LIJm1+5qFzsrBwpaCGEZw6nRw=;
        b=W6da3Yqe0cCQkurDLk4cdpJJwIBHVmxEubQvHLXmt/ogVeGQBxpGlf5SsFIkJrgI9i
         nDprOJk0eI2KLUkMCwiaxdOpAJ5pkcA1zCIkNbcWGXuzeV0IG70iMO8N9S2OWxbmenZG
         kgjDpEGSrWMBUzbF4zP80jcnxY0Y1H8hACyGD8O5gC9s+WJkmVR+FfxsT+dXb8YEECch
         TgBqsMMtyO6dnZk1vXRwZbx7s3gD2k4GCVSCz8WFtuhzl0gCQtPivSAKn8cR95uTF1iu
         cBQRz1gpiE1moCJSBBOY8WJKdBULHQIfJcgTUJOlEHx6t1JtPOcFVzDaYnN10L6Cakxg
         opbg==
X-Gm-Message-State: AOAM530IDz2dooSQMkInQk+8Xt168NvTQ5KfIhDPUqdNgpF2hTE7YYtP
        U2lB44o7VSiDaL8Ixdk1wC84Dw==
X-Google-Smtp-Source: ABdhPJxU8PXfn4Dz6rW+vswyrNUoY21P9/JWAg5CyX+vanQ23rP8zceEqPLSXOQxraLO58F+eY5l0A==
X-Received: by 2002:aed:34c7:: with SMTP id x65mr12431775qtd.340.1590463388017;
        Mon, 25 May 2020 20:23:08 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 20:23:07 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/8] drm/msm/dpu: add SM8150 to hw catalog
Date:   Mon, 25 May 2020 23:22:14 -0400
Message-Id: <20200526032235.21930-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This brings up basic video mode functionality for SM8150 DPU. Command mode
and dual mixer/intf configurations are not working, future patches will
address this. Scaler functionality and multiple planes is also untested.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 147 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
 2 files changed, 149 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1e64fa08c219..f99622870676 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,6 +90,23 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_caps sm8150_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.max_linewidth = 4096,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2_5,
+	.ubwc_version = DPU_HW_UBWC_VER_30,
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
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -181,6 +198,39 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg sm8150_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY)
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x1200, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY)
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x1400, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG)
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x1600, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG)
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x1800, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG)
+	},
+	{
+	.name = "ctl_5", .id = CTL_5,
+	.base = 0x1a00, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG)
+	},
+};
+
 /*************************************************************
  * SSPP sub blocks config
  *************************************************************/
@@ -335,6 +385,23 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_1, LM_0),
 };
 
+/* SM8150 */
+
+static const struct dpu_lm_cfg sm8150_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4),
+};
+
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
@@ -377,6 +444,15 @@ static struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800),
 };
 
+static const struct dpu_pingpong_cfg sm8150_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800),
+	PP_BLK("pingpong_4", PINGPONG_4, 0x72000),
+	PP_BLK("pingpong_5", PINGPONG_5, 0x72800),
+};
+
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -402,6 +478,13 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SC7180_MASK),
 };
 
+static const struct dpu_intf_cfg sm8150_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SC7180_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SC7180_MASK),
+	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, INTF_SC7180_MASK),
+	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, INTF_SC7180_MASK),
+};
+
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
@@ -432,6 +515,10 @@ static const struct dpu_reg_dma_cfg sdm845_regdma = {
 	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
 };
 
+static const struct dpu_reg_dma_cfg sm8150_regdma = {
+	.base = 0x0, .version = 0x00010001, .trigger_sel_off = 0x119c
+};
+
 /*************************************************************
  * PERF data config
  *************************************************************/
@@ -456,6 +543,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
 	{.fl = 0, .lut = 0x0011222222335777},
 };
 
+static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
+	{.fl = 0, .lut = 0x0011222222223357 },
+};
+
 static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
 	{.fl = 10, .lut = 0x344556677},
 	{.fl = 11, .lut = 0x3344556677},
@@ -540,6 +631,31 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 	},
 };
 
+static const struct dpu_perf_cfg sm8150_perf_data = {
+	.max_bw_low = 12800000,
+	.max_bw_high = 12800000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
+		.entries = sm8150_qos_linear
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
@@ -602,9 +718,40 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 	};
 }
 
+/*
+ * sm8150_cfg_init(): populate sm8150 dpu sub-blocks reg offsets
+ * and instance counts.
+ */
+static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
+{
+	*dpu_cfg = (struct dpu_mdss_cfg){
+		.caps = &sm8150_dpu_caps,
+		.mdp_count = ARRAY_SIZE(sdm845_mdp),
+		.mdp = sdm845_mdp,
+		.ctl_count = ARRAY_SIZE(sm8150_ctl),
+		.ctl = sm8150_ctl,
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
+		.dma_cfg = sm8150_regdma,
+		.perf = sm8150_perf_data,
+		.mdss_irqs = 0x3ff,
+	};
+}
+
 static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
 	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
+	{ .hw_rev = DPU_HW_VER_500, .cfg_init = sm8150_cfg_init},
+	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
 	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 686882132bf6..d5a7db81ae24 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -170,6 +170,7 @@ enum dpu_ctl {
 	CTL_2,
 	CTL_3,
 	CTL_4,
+	CTL_5,
 	CTL_MAX
 };
 
@@ -179,6 +180,7 @@ enum dpu_pingpong {
 	PINGPONG_2,
 	PINGPONG_3,
 	PINGPONG_4,
+	PINGPONG_5,
 	PINGPONG_S0,
 	PINGPONG_MAX
 };
-- 
2.26.1

