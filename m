Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12590108D65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 13:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbfKYMAG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 07:00:06 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:11531 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725851AbfKYMAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 07:00:06 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2019 17:29:59 +0530
IronPort-SDR: mHP8TIeEPmXACaVCd2g+CY25YKx70AVI4+CvvDeDyZXVGpecHMiVBOFo+OyCn5XOc9k45K9RLI
 e7Yh8X1N2XxaZoNtNIu5FhP0mmSBDUjCjIQ5SpV+oCM6VT28BBgiC6f1WbK2JjdOGZqHWfJJ9z
 UvYUfmqgu1BYOAi8J9jSdS8/S49e0YIGGVaDPRCtHQu9tNhKUH58F50AmU1ZNiVR+aaqeq4cJw
 OBdtkToQlaz1G4lkoSfI1m5tIeLrGgyJDOnPQI3tNNZWCNjggJJTj6aXD3pcoSF8xSMdBm7Cn4
 CdtZg9JFPkiv8zWc3+5ENz/3
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2019 17:29:40 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 9D039432B; Mon, 25 Nov 2019 17:29:39 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org, dhar@codeaurora.org,
        jsanka@codeaurora.org, chandanu@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH 2/4] msm:disp:dpu1: add support for display for SC7180 target
Date:   Mon, 25 Nov 2019 17:29:27 +0530
Message-Id: <1574683169-19342-3-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
References: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add display hw catalog changes for SC7180 target.

Changes in v1:
 - Configure register offsets and capabilities for the
   display hw blocks.

Changes in v2:
 - mdss_irq data type has changed in the dependent
   patch, accommodate the necessary changes.
 - Add co-developed-by tags in the commit msg (Stephen Boyd).

Changes in v3:
 - fix kernel checkpatch errors in v2

Changes in v4:
 - move documentation into seperate patch (Rob Herring).

This patch has dependency on the below series

https://patchwork.kernel.org/patch/11253647/

Co-developed-by: Shubhashree Dhar <dhar@codeaurora.org>
Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
Co-developed-by: Raviteja Tamatam <travitej@codeaurora.org>
Signed-off-by: Raviteja Tamatam <travitej@codeaurora.org>
Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 189 +++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
 drivers/gpu/drm/msm/msm_drv.c                  |   4 +-
 5 files changed, 188 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 88f2664..1cf4509 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -11,11 +11,17 @@
 #include "dpu_hw_catalog_format.h"
 #include "dpu_kms.h"
 
-#define VIG_SDM845_MASK \
-	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_SCALER_QSEED3) | BIT(DPU_SSPP_QOS) |\
+#define VIG_MASK \
+	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
 	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
 
+#define VIG_SDM845_MASK \
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
+
+#define VIG_SC7180_MASK \
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED4))
+
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
@@ -27,6 +33,9 @@
 #define MIXER_SDM845_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
+#define MIXER_SC7180_MASK \
+	(BIT(DPU_DIM_LAYER))
+
 #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
 
 #define PINGPONG_SDM845_SPLIT_MASK \
@@ -60,6 +69,16 @@
 	.has_idle_pc = true,
 };
 
+static const struct dpu_caps sc7180_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x9,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+};
+
 static struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -85,6 +104,23 @@
 	},
 };
 
+static struct dpu_mdp_cfg sc7180_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.highest_bank_bit = 0x3,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+		.reg_off = 0x2AC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+		.reg_off = 0x2AC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
+		.reg_off = 0x2B4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+		.reg_off = 0x2BC, .bit_off = 8},
+	},
+};
+
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
@@ -116,6 +152,24 @@
 	},
 };
 
+static struct dpu_ctl_cfg sc7180_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0xE4,
+	.features = BIT(DPU_CTL_ACTIVE_CFG)
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x1200, .len = 0xE4,
+	.features = BIT(DPU_CTL_ACTIVE_CFG)
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x1400, .len = 0xE4,
+	.features = BIT(DPU_CTL_ACTIVE_CFG)
+	},
+};
+
 /*************************************************************
  * SSPP sub blocks config
  *************************************************************/
@@ -203,9 +257,23 @@
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static struct dpu_sspp_cfg sc7180_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+};
+
 /*************************************************************
  * MIXER sub blocks config
  *************************************************************/
+
+/* SDM845 */
+
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -215,23 +283,46 @@
 	},
 };
 
-#define LM_BLK(_name, _id, _base, _pp, _lmpair) \
+#define LM_BLK(_name, _id, _base, _fmask, _sblk, _pp, _lmpair) \
 	{ \
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x320, \
-	.features = MIXER_SDM845_MASK, \
-	.sblk = &sdm845_lm_sblk, \
+	.features = _fmask, \
+	.sblk = _sblk, \
 	.pingpong = _pp, \
 	.lm_pair_mask = (1 << _lmpair) \
 	}
 
 static struct dpu_lm_cfg sdm845_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, PINGPONG_0, LM_1),
-	LM_BLK("lm_1", LM_1, 0x45000, PINGPONG_1, LM_0),
-	LM_BLK("lm_2", LM_2, 0x46000, PINGPONG_2, LM_5),
-	LM_BLK("lm_3", LM_3, 0x0, PINGPONG_MAX, 0),
-	LM_BLK("lm_4", LM_4, 0x0, PINGPONG_MAX, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, PINGPONG_3, LM_2),
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_5),
+	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_MAX, 0),
+	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_MAX, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2),
+};
+
+/* SC7180 */
+
+static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
+	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.maxblendstages = 7, /* excluding base layer */
+	.blendstage_base = { /* offsets relative to mixer base */
+		0x20, 0x38, 0x50, 0x68, 0x80, 0x98, 0xb0
+	},
+};
+
+static struct dpu_lm_cfg sc7180_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
+		&sc7180_lm_sblk, PINGPONG_0, LM_1),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SC7180_MASK,
+		&sc7180_lm_sblk, PINGPONG_1, LM_0),
 };
 
 /*************************************************************
@@ -271,6 +362,11 @@
 	PP_BLK("pingpong_3", PINGPONG_3, 0x71800),
 };
 
+static struct dpu_pingpong_cfg sc7180_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800),
+};
+
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -290,6 +386,11 @@
 	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1),
 };
 
+static struct dpu_intf_cfg sc7180_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0),
+};
+
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
@@ -340,6 +441,10 @@
 	{.fl = 0, .lut = 0x11222222223357}
 };
 
+static struct dpu_qos_lut_entry sc7180_qos_linear[] = {
+	{.fl = 0, .lut = 0x0011222222335777},
+};
+
 static struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
 	{.fl = 10, .lut = 0x344556677},
 	{.fl = 11, .lut = 0x3344556677},
@@ -349,10 +454,18 @@
 	{.fl = 0, .lut = 0x112233344556677},
 };
 
+static struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
+	{.fl = 0, .lut = 0x0011223344556677},
+};
+
 static struct dpu_qos_lut_entry sdm845_qos_nrt[] = {
 	{.fl = 0, .lut = 0x0},
 };
 
+static struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
+	{.fl = 0, .lut = 0x0},
+};
+
 static struct dpu_perf_cfg sdm845_perf_data = {
 	.max_bw_low = 6800000,
 	.max_bw_high = 6800000,
@@ -392,6 +505,30 @@
 	},
 };
 
+static struct dpu_perf_cfg sc7180_perf_data = {
+	.max_bw_low = 3900000,
+	.max_bw_high = 5500000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.danger_lut_tbl = {0xff, 0xffff, 0x0},
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
@@ -425,9 +562,39 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 	};
 }
 
+/*
+ * sc7180_cfg_init(): populate sc7180 dpu sub-blocks reg offsets
+ * and instance counts.
+ */
+static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
+{
+	*dpu_cfg = (struct dpu_mdss_cfg){
+		.caps = &sc7180_dpu_caps,
+		.mdp_count = ARRAY_SIZE(sc7180_mdp),
+		.mdp = sc7180_mdp,
+		.ctl_count = ARRAY_SIZE(sc7180_ctl),
+		.ctl = sc7180_ctl,
+		.sspp_count = ARRAY_SIZE(sc7180_sspp),
+		.sspp = sc7180_sspp,
+		.mixer_count = ARRAY_SIZE(sc7180_lm),
+		.mixer = sc7180_lm,
+		.pingpong_count = ARRAY_SIZE(sc7180_pp),
+		.pingpong = sc7180_pp,
+		.intf_count = ARRAY_SIZE(sc7180_intf),
+		.intf = sc7180_intf,
+		.vbif_count = ARRAY_SIZE(sdm845_vbif),
+		.vbif = sdm845_vbif,
+		.reg_dma_count = 1,
+		.dma_cfg = sdm845_regdma,
+		.perf = sc7180_perf_data,
+		.mdss_irqs = 0x3f,
+	};
+}
+
 static struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
 	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
+	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
 };
 
 void dpu_hw_catalog_deinit(struct dpu_mdss_cfg *dpu_cfg)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0fd3f50..2607ef3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,6 +38,7 @@
 #define DPU_HW_VER_401	DPU_HW_VER(4, 0, 1) /* sdm845 v2.0 */
 #define DPU_HW_VER_410	DPU_HW_VER(4, 1, 0) /* sdm670 v1.0 */
 #define DPU_HW_VER_500	DPU_HW_VER(5, 0, 0) /* sdm855 v1.0 */
+#define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
 
 
 #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
@@ -45,6 +46,7 @@
 #define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
 #define IS_SDM670_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_410)
 #define IS_SDM855_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_500)
+#define IS_SC7180_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_620)
 
 
 #define DPU_HW_BLK_NAME_LEN	16
@@ -110,6 +112,7 @@ enum {
 	DPU_SSPP_SRC = 0x1,
 	DPU_SSPP_SCALER_QSEED2,
 	DPU_SSPP_SCALER_QSEED3,
+	DPU_SSPP_SCALER_QSEED4,
 	DPU_SSPP_SCALER_RGB,
 	DPU_SSPP_CSC,
 	DPU_SSPP_CSC_10BIT,
@@ -166,6 +169,7 @@ enum {
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
+	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 5bc39ba..50ee90e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -152,7 +152,8 @@ static void _setup_mixer_ops(struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (IS_SDM845_TARGET(m->hwversion) || IS_SDM670_TARGET(m->hwversion))
+	if (IS_SDM845_TARGET(m->hwversion) || IS_SDM670_TARGET(m->hwversion)
+	    || IS_SC7180_TARGET(m->hwversion))
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
 	else
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 58b0485..ee93ba3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1111,6 +1111,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dpu", },
+	{ .compatible = "qcom,sc7180-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8..f50fefb 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1192,7 +1192,8 @@ static int add_display_components(struct device *dev,
 	 * the interfaces to our components list.
 	 */
 	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss")) {
+	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
+	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
 		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
@@ -1317,6 +1318,7 @@ static int msm_pdev_remove(struct platform_device *pdev)
 	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
 	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
1.9.1

