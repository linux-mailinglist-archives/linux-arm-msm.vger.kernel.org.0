Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910684ADE7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 17:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383236AbiBHQmj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 11:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349731AbiBHQmj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 11:42:39 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0837C061578
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 08:42:37 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i15so9438603wrb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=OnzGwHmQo4Fkb+o0hC7nqakf2sPTmLBiv4gzV5IO2HU=;
        b=VpgD60oIcJy3IZ9S0avwU9mk8j/OS1rR8i/TTQrzMgkpizMnzjWrAtc3kEClLW0Yf4
         bJrNLxsSL8OyuX4oeQms+Wbj2GJg8MIw3gvTtnplBuNRFZ68DfnZVzm4ibP9Ko+LkOcA
         hthMaaKigahVXKhouZfJQCsGq6KvDr52QIZFJdyYu5kWPiqFeN5YX2X4kPr9oAaH/zKc
         9EtGJdoNChmkGDT31XuOm3WT+4GWGo2QNlf4beYuqBmgJvzDNY1Wgk3dOSVhZ5lS7cu0
         709V3H4AORmDMJ405jC/HUFqNHUf0HCkYpmspzI/mL5sQHNtQGpm9VdqI92U73qGzitn
         4aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OnzGwHmQo4Fkb+o0hC7nqakf2sPTmLBiv4gzV5IO2HU=;
        b=h/YQUQbOMm4f7IvsgBOlPBJq2jN3yh8amiEIrILJ9IED2C3kBCnVrNp5aFDdCXlezZ
         /iqt5tkn8WBFRMPPMbYfSLN6ss/ujnkPiIvd2okNwcWrMDYufOyyH1OfFZIFVibHSUXN
         esWH7buSzsb6m7fAgTyTvxyH8NDupjx+Mwq1sEjag/wodyTFbDmj36UGPoRbr7xE5Dfi
         ziaD6dZdmmzZ+X0kO7N49khaSRSMBUH6s30mm7JGLJ/SVwSklTKRCtPJgi2Yymv9uhEa
         LVGWoz6fabQyE7ORVMxEcLoJTAGoZZAuaT7WpoMGaEBn+8HgMFCmvHDlVC+Kq3ih6lt9
         36xA==
X-Gm-Message-State: AOAM533aQa4r6wXPvLmrJzRD31uSWnfjKFRbxOFAhQbwMzxvWVBCJobl
        SLhmpNSomIE9ysZHmmt5I20FIQ==
X-Google-Smtp-Source: ABdhPJzD+reesFUgzIAvOdRrPlIxWwiByujUVhruuClqHZPyotM1bwcowcq2BfoVWwBp/1yUEORQQw==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr4157088wrq.564.1644338556029;
        Tue, 08 Feb 2022 08:42:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id o27sm2853202wms.4.2022.02.08.08.42.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Feb 2022 08:42:35 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, dmitry.baryshkov@linaro.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/2] drm/msm: add support for QCM2290 MDSS
Date:   Tue,  8 Feb 2022 17:42:31 +0100
Message-Id: <1644338552-14426-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibility for QCM2290 display subsystem, including
required entries in DPU hw catalog.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: - Add BIT(DPU_SSPP_QOS_8LVL) to qcm2290 vig mask
     - drop qseed_type from dpu caps as there is no scaler
     - rename _QCM2290_VIG_SBLK to _VIG_SBLK_NOSCALE
     - Use sm8150_dspp_sblk instead of cloning it
     - Use sdm845_pp_sblk instead of cloning it
     - Use sdm845_vbif

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 148 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
 drivers/gpu/drm/msm/msm_drv.c                  |   1 +
 4 files changed, 151 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa75991..12392d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -25,6 +25,8 @@
 #define VIG_SM8250_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
+#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
+
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
@@ -251,6 +253,17 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_caps qcm2290_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2160,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -336,6 +349,19 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg qcm2290_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.highest_bank_bit = 0x2,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+		.reg_off = 0x2AC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+		.reg_off = 0x2AC, .bit_off = 8},
+	},
+};
+
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
@@ -459,6 +485,15 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg qcm2290_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1dc,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+};
+
 /*************************************************************
  * SSPP sub blocks config
  *************************************************************/
@@ -595,6 +630,30 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+
+#define _VIG_SBLK_NOSCALE(num, sdma_pri) \
+	{ \
+	.maxdwnscale = SSPP_UNITY_SCALE, \
+	.maxupscale = SSPP_UNITY_SCALE, \
+	.smart_dma_priority = sdma_pri, \
+	.src_blk = {.name = STRCAT("sspp_src_", num), \
+		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
+	.format_list = plane_formats_yuv, \
+	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.virt_format_list = plane_formats, \
+	.virt_num_formats = ARRAY_SIZE(plane_formats), \
+	}
+
+static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0", 2);
+static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
+
+static const struct dpu_sspp_cfg qcm2290_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
+		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+};
+
 /*************************************************************
  * MIXER sub blocks config
  *************************************************************/
@@ -679,6 +738,21 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+/* QCM2290 */
+
+static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
+	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.maxblendstages = 4, /* excluding base layer */
+	.blendstage_base = { /* offsets relative to mixer base */
+		0x20, 0x38, 0x50, 0x68
+	},
+};
+
+static const struct dpu_lm_cfg qcm2290_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
+		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
+};
+
 /*************************************************************
  * DSPP sub blocks config
  *************************************************************/
@@ -716,6 +790,11 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 		 &sm8150_dspp_sblk),
 };
 
+static const struct dpu_dspp_cfg qcm2290_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
 /*************************************************************
  * PINGPONG sub blocks config
  *************************************************************/
@@ -798,6 +877,12 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			-1),
 };
 
+static struct dpu_pingpong_cfg qcm2290_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+};
+
 /*************************************************************
  * MERGE_3D sub blocks config
  *************************************************************/
@@ -861,6 +946,11 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
 };
 
+static const struct dpu_intf_cfg qcm2290_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+};
+
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
@@ -931,6 +1021,10 @@ static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
 	{.fl = 0, .lut = 0x0011222222223357 },
 };
 
+static const struct dpu_qos_lut_entry qcm2290_qos_linear[] = {
+	{.fl = 0, .lut = 0x0011222222335777},
+};
+
 static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
 	{.fl = 10, .lut = 0x344556677},
 	{.fl = 11, .lut = 0x3344556677},
@@ -1102,6 +1196,27 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
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
 /*************************************************************
  * Hardware catalog init
  *************************************************************/
@@ -1255,6 +1370,38 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 	};
 }
 
+
+/*
+ * qcm2290_cfg_init(): populate qcm2290 dpu sub-blocks reg offsets
+ * and instance counts.
+ */
+static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
+{
+	*dpu_cfg = (struct dpu_mdss_cfg){
+		.caps = &qcm2290_dpu_caps,
+		.mdp_count = ARRAY_SIZE(qcm2290_mdp),
+		.mdp = qcm2290_mdp,
+		.ctl_count = ARRAY_SIZE(qcm2290_ctl),
+		.ctl = qcm2290_ctl,
+		.sspp_count = ARRAY_SIZE(qcm2290_sspp),
+		.sspp = qcm2290_sspp,
+		.mixer_count = ARRAY_SIZE(qcm2290_lm),
+		.mixer = qcm2290_lm,
+		.dspp_count = ARRAY_SIZE(qcm2290_dspp),
+		.dspp = qcm2290_dspp,
+		.pingpong_count = ARRAY_SIZE(qcm2290_pp),
+		.pingpong = qcm2290_pp,
+		.intf_count = ARRAY_SIZE(qcm2290_intf),
+		.intf = qcm2290_intf,
+		.vbif_count = ARRAY_SIZE(sdm845_vbif),
+		.vbif = sdm845_vbif,
+		.reg_dma_count = 1,
+		.dma_cfg = sdm845_regdma,
+		.perf = qcm2290_perf_data,
+		.mdss_irqs = IRQ_SC7180_MASK,
+	};
+}
+
 static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
 	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
@@ -1262,6 +1409,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
 	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
 	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
+	{ .hw_rev = DPU_HW_VER_650, .cfg_init = qcm2290_cfg_init},
 	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 31af04a..5b31392 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -41,6 +41,7 @@
 #define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
 #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
 #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
+#define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
 #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
 
 #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a..b816a50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1348,6 +1348,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,qcm2290-dpu", },
 	{ .compatible = "qcom,sdm845-dpu", },
 	{ .compatible = "qcom,sc7180-dpu", },
 	{ .compatible = "qcom,sc7280-dpu", },
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ad35a5d..c8ab6eb 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1438,6 +1438,7 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
+	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
 	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
 	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
 	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
-- 
2.7.4

