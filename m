Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E7121C147
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 02:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgGKAu3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 20:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgGKAu1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 20:50:27 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE7AC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:50:26 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id g13so5902125qtv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 17:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izNhrC5VtfHpA1GUSqqdzz7c1CzfJZD2D6W22+yRsPM=;
        b=ev+OQ//NinE/lLhKRD9Vpstt6Y2VpBnR4GB/vbiHa5AGsOsBP7uHZfHFp6gM9U0m0v
         F+IhT5vzen3NPGAHNVW5vTKuZuNlSERWTPT4K9Mg50qSJKpfqKqD+x3IbTod98An+PPT
         N3ie3LFgLwnhwl0iN3Wm3ravps6ZCzYcyM7LzGVODi2UJ+w48JTIPrt2+cvZmYyD6vxw
         /zMzIvWkkXAkPH+6Fnad3s62r7DOZxcQ3ANlMMsT7I0cbul8AD5AlsF5nqvOSMr42kGQ
         rWTsr6qAC1AVYUfdiEzFSI15pQITBEp1JneKGSID9cNQgh6KWwjV52CQ76ghs6QV1V6a
         p0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izNhrC5VtfHpA1GUSqqdzz7c1CzfJZD2D6W22+yRsPM=;
        b=FyrKlQqnqvSE/kEnT4g6yyu/Zje9rL9w17iXe7bPhiuE+990NHWCN78EYEw4t7647R
         DmN+JOGHCk5S037/udlWu/3Bz0u2d8QgdY8ELbFOsCT24z8fcbb4g/8MmqxYk68Q5FvF
         o9wRF3Bx1Oiu+l/lxKFrae0lfhF754f9zC3oDkv1aDoIyp938S1+RnUSL1ux/hQ4jXgf
         vozqID8n1Q1CA4VD643oh1Qtwu6WD8diYL7TfSEmbA/sbCBl70C54u3pm6xkwmxYt5Jj
         qTj7yQF9x4yfjK+GC5VjutfaW9zqmsvsD5hUapBJ1UcinSuMb5j0YgzP2QeggZOFlcl4
         asiw==
X-Gm-Message-State: AOAM530IFr/Z+mEZh7XACefDbKK03YKjXU3Rch37EB5pUne2ruCFO0q9
        6skcCqj9E/cynTjL/257gx4fUw==
X-Google-Smtp-Source: ABdhPJwzt4YM6FzL/34OUtgtkT0iU9+6nv739b3N6HVYB0vwqgjsQD7Q8iNbOMqFuhxeTnVULGziew==
X-Received: by 2002:ac8:47ce:: with SMTP id d14mr73559525qtr.285.1594428625422;
        Fri, 10 Jul 2020 17:50:25 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 17:50:25 -0700 (PDT)
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
Subject: [PATCH v2 7/8] drm/msm/dpu: add SM8150 to hw catalog
Date:   Fri, 10 Jul 2020 20:47:30 -0400
Message-Id: <20200711004752.30760-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 148 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
 2 files changed, 150 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1d19c377b096..20f869bbd574 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -92,6 +92,23 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_caps sm8150_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.max_linewidth = 4096,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
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
@@ -183,6 +200,39 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
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
@@ -338,6 +388,23 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
 };
 
+/* SM8150 */
+
+static const struct dpu_lm_cfg sm8150_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
 /*************************************************************
  * DSPP sub blocks config
  *************************************************************/
@@ -357,6 +424,7 @@ static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
 static const struct dpu_dspp_cfg sc7180_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000),
 };
+
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
@@ -399,6 +467,15 @@ static struct dpu_pingpong_cfg sc7180_pp[] = {
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
@@ -424,6 +501,13 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
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
@@ -454,6 +538,10 @@ static const struct dpu_reg_dma_cfg sdm845_regdma = {
 	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
 };
 
+static const struct dpu_reg_dma_cfg sm8150_regdma = {
+	.base = 0x0, .version = 0x00010001, .trigger_sel_off = 0x119c
+};
+
 /*************************************************************
  * PERF data config
  *************************************************************/
@@ -478,6 +566,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
 	{.fl = 0, .lut = 0x0011222222335777},
 };
 
+static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
+	{.fl = 0, .lut = 0x0011222222223357 },
+};
+
 static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
 	{.fl = 10, .lut = 0x344556677},
 	{.fl = 11, .lut = 0x3344556677},
@@ -562,6 +654,31 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
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
@@ -626,9 +743,40 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
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
index 402dc5832361..979fd2c60aa0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -171,6 +171,7 @@ enum dpu_ctl {
 	CTL_2,
 	CTL_3,
 	CTL_4,
+	CTL_5,
 	CTL_MAX
 };
 
@@ -180,6 +181,7 @@ enum dpu_pingpong {
 	PINGPONG_2,
 	PINGPONG_3,
 	PINGPONG_4,
+	PINGPONG_5,
 	PINGPONG_S0,
 	PINGPONG_MAX
 };
-- 
2.26.1

