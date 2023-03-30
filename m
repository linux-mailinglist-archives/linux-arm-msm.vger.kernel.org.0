Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17356D1134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjC3VyI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjC3VyH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471231042E
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:05 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id q16so26365180lfe.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrCR6TaVbl50ICUoXX0RfpX/Tfay8XsVw6TyJQYpCy0=;
        b=XDolYpRFj4mrXxSLJgy2lkocfdXr1Z9m3Y+K51hO2mSyS+5CUyA0WU+VNJXdn9svr6
         qeGREd6nuVYUU6HynLCMhDrzqgRUKiPM82zL8EW6O5nBAvWyO+m7rVHSPvR9ixX2ukUL
         hkIeXn/UXD5gLX22D1wO1FFOmhVblowTGs8BlN1QGw9il3jBeL5qS2RCfyptYv9PrxPq
         YN6esCpG88yX9n4Q0QQ5Fm4eHvK/npiBVlBWRExN1WKbXXdZ5/llGxxvRUb0tcAM8x+6
         MXfyFGD/MtQ9nEbpIzvX6h/+u9xtO/XP00mhkGnGW7IZOBDml/V9PDKvCr/TN37JJVrJ
         97Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrCR6TaVbl50ICUoXX0RfpX/Tfay8XsVw6TyJQYpCy0=;
        b=fOhib/VCb3ZuAjIweZ/qEacNC62EI6DwfryGoNtqxR7Newg4wlf1UyaISabL44eFd6
         JPQO0+QZwcCzxBMw7+fvPAWDyoxu3zRchxu+YyWGnurWUskTsgfTv5oKLQ5Ca5qhbDjJ
         J/PNRqy1VppcR2gP9RQunnRgscZjQ6E/Wu5Y7GCGeV6jZhTKF8ja9dHZJ22BIgmVl/mB
         2xeKCqQ6JKLvPcgmSmL+Wh8hLuubT29CONMgws0vkVvgLOxwOV3l6aCNp+XhxRcp8ZCH
         0oCjLN1OYqisYzK8a6F0D/vJlwWT2kyQg7Uk6T4VdTLlzxt3pPIZqsAm4NPTWKjDGJPP
         ws5g==
X-Gm-Message-State: AAQBX9f9DmqG9Kn6uTsRLbgiyAVeekDz/wv7BTraao6hXJvAOw3201UT
        VjoK7ESNgx+Kw66OWwpLV5LmdA==
X-Google-Smtp-Source: AKy350Zgpwl3q8TWzG3LdpgjSDSWKL7lkL8h+ywo2T1KsfRPVOSUY7Kmg0jU4DNAleyRnYavkgcMFw==
X-Received: by 2002:ac2:4c13:0:b0:4e9:2c0e:c39d with SMTP id t19-20020ac24c13000000b004e92c0ec39dmr5877662lfq.41.1680213243465;
        Thu, 30 Mar 2023 14:54:03 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:03 -0700 (PDT)
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
Subject: [PATCH v3 11/38] drm/msm/dpu: split QCM2290 catalog entry to the separate file
Date:   Fri, 31 Mar 2023 00:52:57 +0300
Message-Id: <20230330215324.1853304-12-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 115 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 107 +---------------
 2 files changed, 116 insertions(+), 106 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
new file mode 100644
index 000000000000..10dd35cd67bc
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_6_5_QCM2290_H
+#define _DPU_6_5_QCM2290_H
+
+static const struct dpu_caps qcm2290_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2160,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
+	.highest_bank_bit = 0x2,
+};
+
+static const struct dpu_mdp_cfg qcm2290_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_ctl_cfg qcm2290_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+};
+
+static const struct dpu_sspp_cfg qcm2290_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
+		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+};
+
+static const struct dpu_lm_cfg qcm2290_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
+		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
+};
+
+static const struct dpu_dspp_cfg qcm2290_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+};
+
+static const struct dpu_intf_cfg qcm2290_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+};
+
+static const struct dpu_perf_cfg qcm2290_perf_data = {
+	.max_bw_low = 2700000,
+	.max_bw_high = 2700000,
+	.min_core_ib = 1300000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xff, 0x0, 0x0},
+	.safe_lut_tbl = {0xfff0, 0x0, 0x0},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(qcm2290_qos_linear),
+		.entries = qcm2290_qos_linear
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
+static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
+	.caps = &qcm2290_dpu_caps,
+	.ubwc = &qcm2290_ubwc_cfg,
+	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
+	.mdp = qcm2290_mdp,
+	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
+	.ctl = qcm2290_ctl,
+	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
+	.sspp = qcm2290_sspp,
+	.mixer_count = ARRAY_SIZE(qcm2290_lm),
+	.mixer = qcm2290_lm,
+	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
+	.dspp = qcm2290_dspp,
+	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
+	.pingpong = qcm2290_pp,
+	.intf_count = ARRAY_SIZE(qcm2290_intf),
+	.intf = qcm2290_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &qcm2290_perf_data,
+	.mdss_irqs = IRQ_SC7180_MASK,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5f5daf46fa7f..89114d24bea5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -333,15 +333,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_caps qcm2290_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
-	.max_mixer_blendstages = 0x4,
-	.has_dim_layer = true,
-	.has_idle_pc = true,
-	.max_linewidth = 2160,
-	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
-};
-
 static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
@@ -411,10 +402,6 @@ static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
-static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.highest_bank_bit = 0x2,
@@ -563,18 +550,6 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
-static const struct dpu_mdp_cfg qcm2290_mdp[] = {
-	{
-	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x494,
-	.features = 0,
-	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-		.reg_off = 0x2AC, .bit_off = 0},
-	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
-		.reg_off = 0x2AC, .bit_off = 8},
-	},
-};
-
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
@@ -704,15 +679,6 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	},
 };
 
-static const struct dpu_ctl_cfg qcm2290_ctl[] = {
-	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
-	},
-};
-
 /*************************************************************
  * SSPP sub blocks config
  *************************************************************/
@@ -943,13 +909,6 @@ static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
 static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0", 2);
 static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
 
-static const struct dpu_sspp_cfg qcm2290_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
-		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
-		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-};
-
 /*************************************************************
  * MIXER sub blocks config
  *************************************************************/
@@ -1061,11 +1020,6 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	},
 };
 
-static const struct dpu_lm_cfg qcm2290_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
-		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
-};
-
 /*************************************************************
  * DSPP sub blocks config
  *************************************************************/
@@ -1117,11 +1071,6 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 		 &sm8150_dspp_sblk),
 };
 
-static const struct dpu_dspp_cfg qcm2290_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
-};
-
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
@@ -1214,12 +1163,6 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			-1),
 };
 
-static const struct dpu_pingpong_cfg qcm2290_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
-		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-};
-
 /*************************************************************
  * MERGE_3D sub blocks config
  *************************************************************/
@@ -1312,11 +1255,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	INTF_BLK("intf_5", INTF_5, 0x6C800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
 };
 
-static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 0, 0),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-};
-
 /*************************************************************
  * Writeback blocks config
  *************************************************************/
@@ -1729,27 +1667,6 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
-static const struct dpu_perf_cfg qcm2290_perf_data = {
-	.max_bw_low = 2700000,
-	.max_bw_high = 2700000,
-	.min_core_ib = 1300000,
-	.min_llcc_ib = 0,
-	.min_dram_ib = 1600000,
-	.min_prefill_lines = 24,
-	.danger_lut_tbl = {0xff, 0x0, 0x0},
-	.safe_lut_tbl = {0xfff0, 0x0, 0x0},
-	.qos_lut_tbl = {
-		{.nentry = ARRAY_SIZE(qcm2290_qos_linear),
-		.entries = qcm2290_qos_linear
-		},
-	},
-	.cdp_cfg = {
-		{.rd_enable = 1, .wr_enable = 1},
-		{.rd_enable = 1, .wr_enable = 0}
-	},
-	.clk_inefficiency_factor = 105,
-	.bw_inefficiency_factor = 120,
-};
 /*************************************************************
  * Hardware catalog
  *************************************************************/
@@ -1915,29 +1832,7 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8250_MASK,
 };
 
-static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
-	.caps = &qcm2290_dpu_caps,
-	.ubwc = &qcm2290_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
-	.mdp = qcm2290_mdp,
-	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
-	.ctl = qcm2290_ctl,
-	.sspp_count = ARRAY_SIZE(qcm2290_sspp),
-	.sspp = qcm2290_sspp,
-	.mixer_count = ARRAY_SIZE(qcm2290_lm),
-	.mixer = qcm2290_lm,
-	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
-	.dspp = qcm2290_dspp,
-	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
-	.pingpong = qcm2290_pp,
-	.intf_count = ARRAY_SIZE(qcm2290_intf),
-	.intf = qcm2290_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
-	.perf = &qcm2290_perf_data,
-	.mdss_irqs = IRQ_SC7180_MASK,
-};
-
+#include "catalog/dpu_6_5_qcm2290.h"
 #include "catalog/dpu_6_3_sm6115.h"
 
 #include "catalog/dpu_7_0_sm8350.h"
-- 
2.39.2

