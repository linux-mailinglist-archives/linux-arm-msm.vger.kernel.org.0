Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43F7709D64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 19:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjESRFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 13:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjESRFR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 13:05:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3BF1720
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 10:04:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f2676d62a2so3884783e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684515886; x=1687107886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfW9/fi5SuuUPxdHMufs3cjpEy23njGDAJML0qW/4gw=;
        b=g9lXO31s73jB7KfuLGmTG+WenFgPB27fcUGACQVduUKdwWHyLdAwgt2KO/2i/shu5M
         zhwgJggVw3QU4tmz3xLgSMbUvtAq3ta7USYcUWSPu3FmoUrha7Yv8Ysfh27Wfezw1mHm
         kZTmGUJYZbq8KncDUTRd+QfRBBWwKGgTpopxCVmVE1aiMr47Awpe/j3XxkVzRntBcoou
         LrxVeinYqk1ldxOEWmEbPbUozy8zWPCAfYh+UTVKniivNMg1ka0nvWolT7YRD9duGEWJ
         jelyYjMeRs012hoKVkyE9BNFtdjOxqOZUCcwTETJssH7Dz/1zcqSrnlG362+LIk/Sg2R
         lRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684515886; x=1687107886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfW9/fi5SuuUPxdHMufs3cjpEy23njGDAJML0qW/4gw=;
        b=KoqbEjxnmoRLvoTfQY14/FspGigDCvXITCKarcf27JD4b9SvB6CTewURT/zHc6ESem
         tAPvnB5rMXufi6BRGzcA9M2LJJ65SOLQwtv5jo03YOdZZ0gjqbRpRcQc1Sw0HaJ1Nytq
         kHKGi8/EFYWCPLYSk3IxIrGUed9BKMC9FakIh1S+1RnTXeiJznojy4CW1IhzFo1oJ4cm
         joABWcq4z3wo/4zWFwOAhHlL0cBdIzGE6cj6n4yFBGHfcI5svnvfJotFKZfE0hh6hS/D
         tTtERyBS8LKuriyqyQOW14+Kx2jD+KOV4oTfT+14VrqErow4rBn6Rqu6ZfOiuUrd6dRc
         LhLw==
X-Gm-Message-State: AC+VfDw3vuDVr/06OCHKzhNvKa1CnU5r8ciKWuSjA6qw8348sLd/khAo
        8P8oenvijhr0a3S4w88p9Dx8pA==
X-Google-Smtp-Source: ACHHUZ5ufiivw7E7r2k2D3mv7AvA+TMAQZpnElA8lJTlXNqYvOZEbsI4TSzI/jQcM4ueq2X1clxfzg==
X-Received: by 2002:ac2:4846:0:b0:4dc:8192:c5e6 with SMTP id 6-20020ac24846000000b004dc8192c5e6mr925066lfy.13.1684515886548;
        Fri, 19 May 2023 10:04:46 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b004f38260f196sm654478lff.218.2023.05.19.10.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:04:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 19 May 2023 19:04:29 +0200
Subject: [PATCH v4 08/12] drm/msm/dpu: Add SM6375 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v4-8-68e7e25d70e1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684515870; l=7490;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EHCd7rxYqWd4K8OPe4c07JXBY+0m2epxbCjM8CCGMoY=;
 b=n9BgwFD6kAjQ1kAJZhJd/Mi/ZmNCjOKjrADL1DnfhIgJyCNHX5IxkcbuWW2IVAxJFhZPhTIgG
 H7f0R8q0ZLTAfDN65F7kBHbYv5Jz1r3GBo7ToZpYOW/7p2dh+5HUv72
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add basic SM6375 support to the DPU1 driver to enable display output.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 153 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 4 files changed, 156 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
new file mode 100644
index 000000000000..5085e7409ff6
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -0,0 +1,153 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DPU_6_9_SM6375_H
+#define _DPU_6_9_SM6375_H
+
+static const struct dpu_caps sm6375_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2160,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.ubwc_swizzle = 6,
+	.highest_bank_bit = 1,
+};
+
+static const struct dpu_mdp_cfg sm6375_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_ctl_cfg sm6375_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+};
+
+static const struct dpu_sspp_cfg sm6375_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
+		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+};
+
+static const struct dpu_lm_cfg sm6375_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
+		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
+};
+
+static const struct dpu_dspp_cfg sm6375_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		&sm8150_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg sm6375_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		-1),
+};
+
+static const struct dpu_intf_cfg sm6375_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2c0, INTF_NONE, 0, 0, 0, 0, 0),
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
+};
+
+static const struct dpu_vbif_cfg sm6375_vbif[] = {
+	{
+	.name = "vbif_0", .id = VBIF_RT,
+	.base = 0, .len = 0x2008,
+	.features = BIT(DPU_VBIF_QOS_REMAP),
+	.xin_halt_timeout = 0x4000,
+	.qos_rp_remap_size = 0x40,
+	.qos_rt_tbl = {
+		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
+		.priority_lvl = sdm845_rt_pri_lvl,
+		},
+	.qos_nrt_tbl = {
+		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
+		.priority_lvl = sdm845_nrt_pri_lvl,
+		},
+	.memtype_count = 14,
+	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
+	},
+};
+
+static const struct dpu_perf_cfg sm6375_perf_data = {
+	.max_bw_low = 5200000,
+	.max_bw_high = 6200000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0, /* No LLCC on this SoC */
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
+	/* TODO: confirm danger_lut_tbl */
+	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
+		.entries = sm6350_qos_linear_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
+		.entries = sm6350_qos_linear_macrotile
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
+const struct dpu_mdss_cfg dpu_sm6375_cfg = {
+	.caps = &sm6375_dpu_caps,
+	.ubwc = &sm6375_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(sm6375_mdp),
+	.mdp = sm6375_mdp,
+	.ctl_count = ARRAY_SIZE(sm6375_ctl),
+	.ctl = sm6375_ctl,
+	.sspp_count = ARRAY_SIZE(sm6375_sspp),
+	.sspp = sm6375_sspp,
+	.mixer_count = ARRAY_SIZE(sm6375_lm),
+	.mixer = sm6375_lm,
+	.dspp_count = ARRAY_SIZE(sm6375_dspp),
+	.dspp = sm6375_dspp,
+	.pingpong_count = ARRAY_SIZE(sm6375_pp),
+	.pingpong = sm6375_pp,
+	.intf_count = ARRAY_SIZE(sm6375_intf),
+	.intf = sm6375_intf,
+	.vbif_count = ARRAY_SIZE(sm6375_vbif),
+	.vbif = sm6375_vbif,
+	.perf = &sm6375_perf_data,
+	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
+		     BIT(MDP_SSPP_TOP0_INTR2) | \
+		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+		     BIT(MDP_INTF1_INTR) | \
+		     BIT(MDP_INTF1_TEAR_INTR),
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5ef1dffc27dc..7577572a5ef4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -809,6 +809,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_6_3_sm6115.h"
 #include "catalog/dpu_6_4_sm6350.h"
 #include "catalog/dpu_6_5_qcm2290.h"
+#include "catalog/dpu_6_9_sm6375.h"
 
 #include "catalog/dpu_7_0_sm8350.h"
 #include "catalog/dpu_7_2_sc7280.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 67ff78e7bc99..3d35fcfaf446 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -882,6 +882,7 @@ extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
 extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
 extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
 extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
+extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
 extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
 extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 46be7ad8d615..980c3c8f8269 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1287,6 +1287,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
 	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
 	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
+	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
 	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
 	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
 	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },

-- 
2.40.1

