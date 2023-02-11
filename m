Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978046930F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 13:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjBKM1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 07:27:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjBKM1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 07:27:43 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5313916AEF
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 04:27:22 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id hx15so21812232ejc.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 04:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9M2VsFhD25WL9AwzYvA2lLay5I5/d7XtM9G7VrBBW0=;
        b=WcWlKU1Fg3EDWzQcNGfQkA3D4Q+FwlArk9wSHgc6J1YE0zDp8Rrlw/zOABpkJImn4a
         TgCWirWfgyqHEmL2rkQLjYNcYkIiPX9GlDh0tiyWyyjpvxI6R7+8TJ+cpBrI6K8e0xwz
         XKu727T4PR8oEJQUHvKUoIPuhqLwRN5WGIJJ50kvFu5Eej6B4bB0Mynnstxkd2u+nyeN
         qILP8iViCnyEEeZou054fVhGszZIerjLHVkJb9CAFzjRUEWA+1FmrAx7doiV28FeH9bl
         P8eRJbTRmpygpXtZQuSM+JOlxkxQwv9mk5g2vWkPjr01PjXRMiGHgh/5H2Bk7Px/OoHd
         9c9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9M2VsFhD25WL9AwzYvA2lLay5I5/d7XtM9G7VrBBW0=;
        b=ibv8cevce9vHP94vxd9SRkDvKr3Ipf4WqlEUgq4sHc6fXFmWDgm/njojDID8/4GxCk
         euKylPrOwg1n0E61rK29aVii6CO7xcCOVg8ia3Zy/EG6N9nT4RFOEoUkhDiiRn6rJCrP
         NZgU2vgK5j1GgKJs7oNxWXhaK7ve2ERIwdJmcFt/iie+oeyhex2mTNf962v3IGqNtKxg
         dpfdTqIQi49klfY2xBLJPSBG6qnTKpB5z8ORM4LrAxZxVFNdX4EF/X2KKMX2gjmF9tEZ
         5fVdNWgy8HIkKKiVlp73wPqg8QYNd8/KyDw+z/qqTEu/VjeD6aWdaX9sr4O1SL2dRA/I
         BVIQ==
X-Gm-Message-State: AO0yUKWro5ZF1wykgKiCHZ3MdhfNaqHan5bAX9LdWtXizvVvKXcTcuQ+
        aOe8+xfbe8+iBtDJgVU5zy47Yb8hJ66cTy2x
X-Google-Smtp-Source: AK7set88iDPSII8YxjOQzNPiXX39pWxCyK1k6cVBVHjl1LVAPM7+SssFMyiyCxtrfZ1s+CNfR5osvQ==
X-Received: by 2002:a17:906:3792:b0:88d:5081:e9f8 with SMTP id n18-20020a170906379200b0088d5081e9f8mr18327394ejc.15.1676118440336;
        Sat, 11 Feb 2023 04:27:20 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id mv9-20020a170907838900b0087bd2ebe474sm3767941ejc.208.2023.02.11.04.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 04:27:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Robert Foss <rfoss@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Liu Shixin <liushixin2@huawei.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] drm/msm/dpu: Add SM6375 support
Date:   Sat, 11 Feb 2023 13:26:53 +0100
Message-Id: <20230211122656.1479141-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add basic SM6375 support to the DPU1 driver to enable display output.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 120 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   1 +
 4 files changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ba0bc795e5ff..327aa21f01fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -383,6 +383,24 @@ static const struct dpu_caps sm6350_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_caps sm6375_dpu_caps = {
+	.max_mixer_width = 2048,
+	.max_mixer_blendstages = 0x4,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	/*
+	 * There is *NO* 3DMERGE hw, but we *need* to set this property to true,
+	 * because SM6375 includes newer hardware that requires a different reset
+	 * sequence and it is executed based on this confusingly named variable..
+	 */
+	.has_3d_merge = true,
+	.max_linewidth = 2160,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
 static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
@@ -592,6 +610,19 @@ static const struct dpu_mdp_cfg sm6350_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sm6375_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.highest_bank_bit = 0x1,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+		.reg_off = 0x2ac, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+		.reg_off = 0x2ac, .bit_off = 8},
+	},
+};
+
 static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -1577,6 +1608,19 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
 };
 
+static const struct dpu_lm_sub_blks sm6375_lm_sblk = {
+	.maxwidth = 2048,
+	.maxblendstages = 4, /* excluding base layer */
+	.blendstage_base = { /* offsets relative to mixer base */
+		0x20, 0x38, 0x50, 0x68
+	},
+};
+
+static const struct dpu_lm_cfg sm6375_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
+		&sm6375_lm_sblk, PINGPONG_0, 0, DSPP_0),
+};
+
 /* SM8150 */
 
 static const struct dpu_lm_cfg sm8150_lm[] = {
@@ -1984,6 +2028,11 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
 	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
 };
 
+static const struct dpu_intf_cfg sm6375_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x00000, 0x2c0, INTF_NONE, 0, 0, 0, 0, 0, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+};
+
 static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -2171,6 +2220,26 @@ static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
 	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
 };
 
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
 static const struct dpu_reg_dma_cfg sdm845_regdma = {
 	.base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
 };
@@ -2460,6 +2529,34 @@ static const struct dpu_perf_cfg sm6350_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_perf_cfg sm6375_perf_data = {
+	.max_bw_low = 5200000,
+	.max_bw_high = 6200000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
+	/* TODO: confirm danger_lut_tbl */
+	.danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sm6350_qos_linear),
+		.entries = sm6350_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sm6350_qos_macrotile),
+		.entries = sm6350_qos_macrotile
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
 static const struct dpu_perf_cfg sm8150_perf_data = {
 	.max_bw_low = 12800000,
 	.max_bw_high = 12800000,
@@ -2804,6 +2901,28 @@ static const struct dpu_mdss_cfg sm6350_dpu_cfg = {
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
 
+static const struct dpu_mdss_cfg sm6375_dpu_cfg = {
+	.caps = &sm6350_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sm6375_mdp),
+	.mdp = sm6375_mdp,
+	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
+	.ctl = qcm2290_ctl,
+	.sspp_count = ARRAY_SIZE(sm6115_sspp),
+	.sspp = sm6115_sspp,
+	.mixer_count = ARRAY_SIZE(sm6375_lm),
+	.mixer = sm6375_lm,
+	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
+	.dspp = qcm2290_dspp,
+	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
+	.pingpong = qcm2290_pp,
+	.intf_count = ARRAY_SIZE(sm6375_intf),
+	.intf = sm6375_intf,
+	.vbif_count = ARRAY_SIZE(sm6375_vbif),
+	.vbif = sm6375_vbif,
+	.perf = &sm6375_perf_data,
+	.mdss_irqs = IRQ_SC7180_MASK,
+};
+
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
@@ -3049,6 +3168,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_630, .dpu_cfg = &sm6115_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_640, .dpu_cfg = &sm6350_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_690, .dpu_cfg = &sm6375_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_700, .dpu_cfg = &sm8350_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_800, .dpu_cfg = &sc8280xp_dpu_cfg},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cbf21613e121..a22b5965acfe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -47,6 +47,7 @@
 #define DPU_HW_VER_630	DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
 #define DPU_HW_VER_640	DPU_HW_VER(6, 4, 0) /* sm6350 */
 #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
+#define DPU_HW_VER_690	DPU_HW_VER(6, 9, 0) /* sm6375 */
 #define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350 */
 #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
 #define DPU_HW_VER_800	DPU_HW_VER(8, 0, 0) /* sc8280xp */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ebfbbd2d105e..fd561974a6b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1307,6 +1307,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-dpu", },
 	{ .compatible = "qcom,sm6115-dpu", },
 	{ .compatible = "qcom,sm6350-dpu", },
+	{ .compatible = "qcom,sm6375-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
 	{ .compatible = "qcom,sm8350-dpu", },
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 841016f3983a..fedc1a1fc289 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss" },
 	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
+	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sm8350-mdss" },
-- 
2.39.1

