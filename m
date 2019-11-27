Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3710D10AD5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 11:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfK0KOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 05:14:47 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:62512 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726194AbfK0KOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 05:14:47 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Nov 2019 15:44:41 +0530
IronPort-SDR: OjeLSeKxqZJDKOn+jHfn9L2iiTiZ5GzCQ39WQkShVImSP8mcFG9R5/L/Nv9Ff78Qd6DZ12xQk0
 mP9y2MUSGxGHICILBYLEZKFpxHkDkMe/eId3nkwIRASH2d0QPulXtwgGWoRFYZwNQ1+xhWgXlv
 pTaRJYZO7g5NvF51eu+R3zATLNrvPqQcYlyrnOtIrgSHeaXScj2x4tiF0DCwOWjFNOmG9rRMwe
 79Q/Ahtbf25BYTVFQgapXKL2TLFHgMuZL7mf/ospL9JY9Hjj2gWuK6ZV84YIs5ZgjD5vwH1OG7
 LEj2FDopUPb0JjLbihfLm3UZ
Received: from dhar-linux.qualcomm.com ([10.204.66.25])
  by ironmsg02-blr.qualcomm.com with ESMTP; 27 Nov 2019 15:44:16 +0530
Received: by dhar-linux.qualcomm.com (Postfix, from userid 2306995)
        id EB87A3B5B; Wed, 27 Nov 2019 15:44:15 +0530 (IST)
From:   Shubhashree Dhar <dhar@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Shubhashree Dhar <dhar@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org,
        Raviteja Tamatam <travitej@codeaurora.org>
Subject: [PATCH] msm:disp:dpu1: add scaler support on SC7180 display
Date:   Wed, 27 Nov 2019 15:44:12 +0530
Message-Id: <1574849652-5429-1-git-send-email-dhar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add scaler support for display driver.

This patch has dependency on the below series

https://patchwork.kernel.org/patch/11260267/

Co-developed-by: Raviteja Tamatam <travitej@codeaurora.org>
Signed-off-by: Raviteja Tamatam <travitej@codeaurora.org>
Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 21 ++++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 20 +++++++++++++++++---
 5 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1f2ac6e..89df411 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -182,7 +182,7 @@
 	.maxvdeciexp = MAX_VERT_DECIMATION,
 };
 
-#define _VIG_SBLK(num, sdma_pri) \
+#define _VIG_SBLK(num, sdma_pri, qseed_ver) \
 	{ \
 	.common = &sdm845_sspp_common, \
 	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
@@ -191,7 +191,7 @@
 	.src_blk = {.name = STRCAT("sspp_src_", num), \
 		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
 	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
-		.id = DPU_SSPP_SCALER_QSEED3, \
+		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = STRCAT("sspp_csc", num), \
 		.id = DPU_SSPP_CSC_10BIT, \
@@ -216,10 +216,14 @@
 	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 = _VIG_SBLK("0", 5);
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 = _VIG_SBLK("1", 6);
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 = _VIG_SBLK("2", 7);
-static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 = _VIG_SBLK("3", 8);
+static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3);
+static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3);
+static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3);
+static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
 
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK("8", 1);
 static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
@@ -257,9 +261,12 @@
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
+				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED4);
+
 static struct dpu_sspp_cfg sc7180_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e7e731b..a5b124d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -94,6 +94,7 @@ enum {
  * @DPU_SSPP_SRC             Src and fetch part of the pipes,
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
  * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
+ * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
  * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
  * @DPU_SSPP_CSC,            Support of Color space converion
  * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
@@ -324,6 +325,7 @@ struct dpu_sspp_blks_common {
  * @maxupscale:  maxupscale ratio supported
  * @smart_dma_priority: hw priority of rect1 of multirect pipe
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
+ * @qseed_ver: qseed version
  * @src_blk:
  * @scaler_blk:
  * @csc_blk:
@@ -344,6 +346,7 @@ struct dpu_sspp_sub_blks {
 	u32 maxupscale;
 	u32 smart_dma_priority;
 	u32 max_per_pipe_bw;
+	u32 qseed_ver;
 	struct dpu_src_blk src_blk;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 4f8b813..a8e30de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -132,6 +132,7 @@
 /* traffic shaper clock in Hz */
 #define TS_CLK			19200000
 
+
 static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
 		int s_id,
 		u32 *idx)
@@ -657,7 +658,8 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
 		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
 		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
 
-	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features)) {
+	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
+			test_bit(DPU_SSPP_SCALER_QSEED4, &features)) {
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
 		c->ops.get_scaler_ver = _dpu_hw_sspp_get_scaler3_ver;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index a3680b4..ed7a3bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -27,7 +27,8 @@
  */
 #define DPU_SSPP_SCALER ((1UL << DPU_SSPP_SCALER_RGB) | \
 	(1UL << DPU_SSPP_SCALER_QSEED2) | \
-	(1UL << DPU_SSPP_SCALER_QSEED3))
+	 (1UL << DPU_SSPP_SCALER_QSEED3) | \
+	  (1UL << DPU_SSPP_SCALER_QSEED4))
 
 /**
  * Component indices
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 58d5acb..3914753 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -53,8 +53,13 @@ enum {
 	R_MAX
 };
 
+/*
+ * Default Preload Values
+ */
 #define DPU_QSEED3_DEFAULT_PRELOAD_H 0x4
 #define DPU_QSEED3_DEFAULT_PRELOAD_V 0x3
+#define DPU_QSEED4_DEFAULT_PRELOAD_V 0x2
+#define DPU_QSEED4_DEFAULT_PRELOAD_H 0x4
 
 #define DEFAULT_REFRESH_RATE	60
 
@@ -477,8 +482,16 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
 			scale_cfg->src_width[i] /= chroma_subsmpl_h;
 			scale_cfg->src_height[i] /= chroma_subsmpl_v;
 		}
-		scale_cfg->preload_x[i] = DPU_QSEED3_DEFAULT_PRELOAD_H;
-		scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
+
+		if (pdpu->pipe_hw->cap->features &
+			BIT(DPU_SSPP_SCALER_QSEED4)) {
+			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
+			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
+		} else {
+			scale_cfg->preload_x[i] = DPU_QSEED3_DEFAULT_PRELOAD_H;
+			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
+		}
+
 		pstate->pixel_ext.num_ext_pxls_top[i] =
 			scale_cfg->src_height[i];
 		pstate->pixel_ext.num_ext_pxls_left[i] =
@@ -1337,7 +1350,8 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 			pdpu->debugfs_root, &pdpu->debugfs_src);
 
 	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2)) {
+			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
+			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4)) {
 		dpu_debugfs_setup_regset32(&pdpu->debugfs_scaler,
 				sblk->scaler_blk.base + cfg->base,
 				sblk->scaler_blk.len,
-- 
1.9.1

