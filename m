Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E15C7AC540
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 23:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjIWVtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 17:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjIWVtX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 17:49:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAFB180
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 14:49:17 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5043120ffbcso5643869e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695505755; x=1696110555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIiw+rao2ipm3y50isMIvVbh8SRM5miV2bWu7ATEVuo=;
        b=ia9s5fsih9xzx1/aSJXwBqRlyM//qsh3y8TIzdWGLLEVPrpRIeBou13kZm2ouG8U1c
         5P143BkrAcUOrtNLWb74YHOM2ZeiIuA8GTMqvdKEQgstWGJ3iQVdzN/FjngvKUPaXHI/
         b84qW52V6TUiO1w2Fffz68gz4zViY1Rmz4PPFXW0C7g/ixGN98jQTUuZsdw4XHXNWv1s
         jSMCnyj05zgdv2S4FOe7HaD5B5z4xgXtY5odfGAIGXav/wc57ZSMjG8lwl6q3p6SO1+L
         LGKRS250kAcUJklGCU5qnlfKV4Kdu3WOOemYI9sqFt4EduGFyE+1DOAHsD5jN/ZkRNm/
         B/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695505755; x=1696110555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIiw+rao2ipm3y50isMIvVbh8SRM5miV2bWu7ATEVuo=;
        b=rYZ6ZZg45FVYm/VVtp3gx6HhYTin8oBULb+X1tlEI9EZT2QW3J2chWGV8jMNFuy+6m
         P81zbGnjB5ArIx2DQYC8f2tceyFe0Jg7p1dcoYY9Z9c4nrMu5XdIEeIJu1O2BD5HhJ+U
         Ew2HKp+N8/GynMQv7Hjy3FczAMNg7rat6NXjHBG8gNr+hufJ6qaUph1jvm+8CnZqa8zz
         ibtw0ZUSs50XnpFbn3N7Vc/jWBo/Yg9P3AHZ7jV/YP9DVIpxhVqdkddgMfPBbWJBXc3u
         dHA75VlnEwGRuRkBGXLagPRYZ0ybw5aCrDcyjMjBtwOsqE6AsaWBq/qGPEiD4D/ngjD+
         skmA==
X-Gm-Message-State: AOJu0YwJCSzYQ14NvivN23gRKMTYZiMIcZIOKSMyiCn94yMYyYWL927y
        1OaLXtgTAA7wwOpXiBgz4UCZWw==
X-Google-Smtp-Source: AGHT+IEe1C3lFrIRr2sVyCOARPPjsNUYLoNxLk9c7jSnGhTZhld+5od0EViqu/XvmTMMv3pdA4haYQ==
X-Received: by 2002:ac2:532d:0:b0:4ff:7046:984a with SMTP id f13-20020ac2532d000000b004ff7046984amr2406493lfh.7.1695505755379;
        Sat, 23 Sep 2023 14:49:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m12-20020a19520c000000b004fe0760354bsm1196590lfb.275.2023.09.23.14.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 14:49:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 2/3] drm/msm/dpu: add support for MSM8937
Date:   Sun, 24 Sep 2023 00:49:11 +0300
Message-Id: <20230923214912.1095024-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
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

Experimental support for MSM8937, which has MDP5 v1.14. It looks like
trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
etc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_1_14_msm8937.h  | 213 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 216 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
new file mode 100644
index 000000000000..1018d38f8ace
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -0,0 +1,213 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DPU_1_14_MSM8937_H
+#define _DPU_1_14_MSM8937_H
+
+static const struct dpu_caps msm8937_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
+	.pixel_ram_size = 40 * 1024,
+	.max_hdeci_exp = MAX_HORZ_DECIMATION,
+	.max_vdeci_exp = MAX_VERT_DECIMATION,
+};
+
+static const struct dpu_mdp_cfg msm8937_mdp[] = {
+	{
+		.name = "top_0",
+		.base = 0x0, .len = 0x454,
+		.features = BIT(DPU_MDP_VSYNC_SEL),
+		.clk_ctrls = {
+			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
+			[DPU_CLK_CTRL_RGB1] = { .reg_off = 0x2b4, .bit_off = 4 },
+			[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+			[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x3a8, .bit_off = 16 },
+		},
+	},
+};
+
+static const struct dpu_ctl_cfg msm8937_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x64,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+};
+
+static const struct dpu_sspp_cfg msm8937_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x150,
+		.features = VIG_MSM8953_MASK,
+		.sblk = &dpu_vig_sblk_qseed2,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_4", .id = SSPP_RGB0,
+		.base = 0x14000, .len = 0x150,
+		.features = RGB_MSM8953_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB0,
+	}, {
+		.name = "sspp_5", .id = SSPP_RGB1,
+		.base = 0x16000, .len = 0x150,
+		.features = RGB_MSM8953_MASK,
+		.sblk = &dpu_rgb_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_RGB,
+		.clk_ctrl = DPU_CLK_CTRL_RGB1,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x150,
+		.features = DMA_MSM8953_MASK | BIT(DPU_SSPP_CURSOR),
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 2,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	},
+};
+
+static const struct dpu_lm_cfg msm8937_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.sblk = &msm8998_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+	},
+};
+
+static const struct dpu_pingpong_cfg msm8937_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x70000, .len = 0xd4,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x70800, .len = 0xd4,
+		.features = PINGPONG_MSM8996_MASK,
+		.sblk = &msm8996_pp_sblk,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
+	},
+};
+
+static const struct dpu_dspp_cfg msm8937_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &msm8998_dspp_sblk,
+	},
+};
+
+static const struct dpu_intf_cfg msm8937_intf[] = {
+	{
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x6a800, .len = 0x268,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 14,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = -1,
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x6b000, .len = 0x268,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 14,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = -1,
+	},
+};
+
+static const struct dpu_perf_cfg msm8937_perf_data = {
+	.max_bw_low = 3100000,
+	.max_bw_high = 3100000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 0, /* No LLCC on this SoC */
+	.min_dram_ib = 800000,
+	.undersized_prefill_lines = 2,
+	.xtra_prefill_lines = 2,
+	.dest_scale_prefill_lines = 3,
+	.macrotile_prefill_lines = 4,
+	.yuv_nv12_prefill_lines = 8,
+	.linear_prefill_lines = 1,
+	.downscaling_prefill_lines = 1,
+	.amortizable_threshold = 25,
+	.min_prefill_lines = 14,
+	.danger_lut_tbl = {0xf, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfffc, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(msm8998_qos_linear),
+		.entries = msm8998_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(msm8998_qos_macrotile),
+		.entries = msm8998_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(msm8998_qos_nrt),
+		.entries = msm8998_qos_nrt
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
+static const struct dpu_mdss_version msm8937_mdss_ver = {
+	.core_major_ver = 1,
+	.core_minor_ver = 14,
+};
+
+const struct dpu_mdss_cfg dpu_msm8937_cfg = {
+	.mdss_ver = &msm8937_mdss_ver,
+	.caps = &msm8937_dpu_caps,
+	.mdp = msm8937_mdp,
+	.ctl_count = ARRAY_SIZE(msm8937_ctl),
+	.ctl = msm8937_ctl,
+	.sspp_count = ARRAY_SIZE(msm8937_sspp),
+	.sspp = msm8937_sspp,
+	.mixer_count = ARRAY_SIZE(msm8937_lm),
+	.mixer = msm8937_lm,
+	.dspp_count = ARRAY_SIZE(msm8937_dspp),
+	.dspp = msm8937_dspp,
+	.pingpong_count = ARRAY_SIZE(msm8937_pp),
+	.pingpong = msm8937_pp,
+	.intf_count = ARRAY_SIZE(msm8937_intf),
+	.intf = msm8937_intf,
+	.vbif_count = ARRAY_SIZE(msm8996_vbif),
+	.vbif = msm8996_vbif,
+	.perf = &msm8937_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 20e31115e26d..392ba30d30b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -716,6 +716,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
  *************************************************************/
 
 #include "catalog/dpu_1_7_msm8996.h"
+#include "catalog/dpu_1_14_msm8937.h"
 #include "catalog/dpu_1_16_msm8953.h"
 
 #include "catalog/dpu_3_0_msm8998.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 58891a19d2b0..a9a12580c8c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -822,6 +822,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 };
 
+extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5099618bfe11..cebfa6945e9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1415,6 +1415,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,msm8937-mdp5", .data = &dpu_msm8937_cfg, },
 	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },
 	{ .compatible = "qcom,msm8996-mdp5", .data = &dpu_msm8996_cfg, },
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
-- 
2.39.2

