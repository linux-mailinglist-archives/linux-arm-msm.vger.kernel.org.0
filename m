Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E299319C2B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 15:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388579AbgDBNcI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 09:32:08 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:52202 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387752AbgDBNcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 09:32:08 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Apr 2020 19:01:00 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Apr 2020 19:00:42 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id DA6EC45BF; Thu,  2 Apr 2020 19:00:40 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v3 1/3] [Do not pick] drm/msm/dpu: add support for clk and bw scaling for display
Date:   Thu,  2 Apr 2020 19:00:37 +0530
Message-Id: <1585834239-8895-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not pick this patch as this patch was added by
mistake. This patch is already uploaded in the
patchwork link mentioned below.

https://patchwork.kernel.org/patch/11468783/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  | 106 +++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  37 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c       |   9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  82 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   4 +
 8 files changed, 228 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 11f2beb..24874f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -29,6 +29,73 @@ enum dpu_perf_mode {
 	DPU_PERF_MODE_MAX
 };
 
+/**
+ * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
+ * @kms -  pointer to the dpu_kms
+ * @crtc - pointer to a crtc
+ * Return: returns aggregated BW for all planes in crtc.
+ */
+static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
+		struct drm_crtc *crtc)
+{
+	struct drm_plane *plane;
+	struct dpu_plane_state *pstate;
+	u64 crtc_plane_bw = 0;
+	u32 bw_factor;
+
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		pstate = to_dpu_plane_state(plane->state);
+
+		if (!pstate)
+			continue;
+
+		crtc_plane_bw += pstate->plane_fetch_bw;
+	}
+
+	bw_factor = kms->catalog->perf.bw_inefficiency_factor;
+	if (bw_factor)
+		crtc_plane_bw = mult_frac(crtc_plane_bw, bw_factor, 100);
+
+	return crtc_plane_bw;
+}
+
+/**
+ * _dpu_core_perf_calc_clk() - to calculate clock per crtc
+ * @kms -  pointer to the dpu_kms
+ * @crtc - pointer to a crtc
+ * @state - pointer to a crtc state
+ * Return: returns max clk for all planes in crtc.
+ */
+static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
+		struct drm_crtc *crtc, struct drm_crtc_state *state)
+{
+	struct drm_plane *plane;
+	struct dpu_plane_state *pstate;
+	struct drm_display_mode *mode;
+	u64 crtc_clk;
+	u32 clk_factor;
+
+	mode = &state->adjusted_mode;
+
+	crtc_clk = mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
+
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		pstate = to_dpu_plane_state(plane->state);
+
+		if (!pstate)
+			continue;
+
+		crtc_clk = max(pstate->plane_clk, crtc_clk);
+	}
+
+	clk_factor = kms->catalog->perf.clk_inefficiency_factor;
+	if (clk_factor)
+		crtc_clk = mult_frac(crtc_clk, clk_factor, 100);
+
+	return crtc_clk;
+}
+
+
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
 	struct msm_drm_private *priv;
@@ -67,12 +134,7 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 	dpu_cstate = to_dpu_crtc_state(state);
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
-	if (!dpu_cstate->bw_control) {
-		perf->bw_ctl = kms->catalog->perf.max_bw_high *
-					1000ULL;
-		perf->max_per_pipe_ib = perf->bw_ctl;
-		perf->core_clk_rate = kms->perf.max_core_clk_rate;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
 		perf->bw_ctl = 0;
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
@@ -80,6 +142,10 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		perf->bw_ctl = kms->perf.fix_core_ab_vote;
 		perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
 		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
+	} else {
+		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
+		perf->max_per_pipe_ib = kms->catalog->perf.min_dram_ib;
+		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 	}
 
 	DPU_DEBUG(
@@ -132,11 +198,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 			DPU_DEBUG("crtc:%d bw:%llu ctrl:%d\n",
 				tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
 				tmp_cstate->bw_control);
-			/*
-			 * For bw check only use the bw if the
-			 * atomic property has been already set
-			 */
-			if (tmp_cstate->bw_control)
+
 				bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
 		}
 
@@ -152,9 +214,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 		DPU_DEBUG("final threshold bw limit = %d\n", threshold);
 
-		if (!dpu_cstate->bw_control) {
-			DPU_DEBUG("bypass bandwidth check\n");
-		} else if (!threshold) {
+		if (!threshold) {
 			DPU_ERROR("no bandwidth limits specified\n");
 			return -E2BIG;
 		} else if (bw > threshold) {
@@ -175,7 +235,8 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 					= dpu_crtc_get_client_type(crtc);
 	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int ret = 0;
+	int i, ret = 0;
+	u64 avg_bw;
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
@@ -186,10 +247,21 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
 					dpu_cstate->new_perf.max_per_pipe_ib);
 
-			DPU_DEBUG("crtc=%d bw=%llu\n", tmp_crtc->base.id,
-					dpu_cstate->new_perf.bw_ctl);
+			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
+
+			DPU_DEBUG("crtc=%d bw=%llu paths:%d\n",
+				  tmp_crtc->base.id,
+				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
 		}
 	}
+
+	avg_bw = kms->num_paths ?
+			perf.bw_ctl / kms->num_paths : 0;
+
+	for (i = 0; i < kms->num_paths; i++)
+		icc_set_bw(kms->path[i],
+			Bps_to_icc(avg_bw), (perf.max_per_pipe_ib));
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c567917..9c6b10a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -519,7 +519,8 @@
 	.max_bw_high = 5500000,
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
-	.min_dram_ib = 800000,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xff, 0xffff, 0x0},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
@@ -536,6 +537,8 @@
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 09df7d8..b47e0e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -616,6 +616,8 @@ struct dpu_perf_cdp_cfg {
  * @downscaling_prefill_lines  downscaling latency in lines
  * @amortizable_theshold minimum y position for traffic shaping prefill
  * @min_prefill_lines  minimum pipeline latency in lines
+ * @clk_inefficiency_factor DPU src clock inefficiency factor
+ * @bw_inefficiency_factor DPU axi bus bw inefficiency factor
  * @safe_lut_tbl: LUT tables for safe signals
  * @danger_lut_tbl: LUT tables for danger signals
  * @qos_lut_tbl: LUT tables for QoS signals
@@ -640,6 +642,8 @@ struct dpu_perf_cfg {
 	u32 downscaling_prefill_lines;
 	u32 amortizable_threshold;
 	u32 min_prefill_lines;
+	u32 clk_inefficiency_factor;
+	u32 bw_inefficiency_factor;
 	u32 safe_lut_tbl[DPU_QOS_LUT_USAGE_MAX];
 	u32 danger_lut_tbl[DPU_QOS_LUT_USAGE_MAX];
 	struct dpu_qos_lut_tbl qos_lut_tbl[DPU_QOS_LUT_USAGE_MAX];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index cb08faf..3c3a838 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -228,6 +228,28 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 }
 #endif
 
+static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
+{
+	struct icc_path *path0;
+	struct icc_path *path1;
+	struct drm_device *dev = dpu_kms->dev;
+
+	path0 = of_icc_get(dev->dev, "mdp0-mem");
+	path1 = of_icc_get(dev->dev, "mdp1-mem");
+
+	if (IS_ERR_OR_NULL(path0))
+		return PTR_ERR_OR_ZERO(path0);
+
+	dpu_kms->path[0] = path0;
+	dpu_kms->num_paths = 1;
+
+	if (!IS_ERR_OR_NULL(path1)) {
+		dpu_kms->path[1] = path1;
+		dpu_kms->num_paths++;
+	}
+	return 0;
+}
+
 static int dpu_kms_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc)
 {
 	return dpu_crtc_vblank(crtc, true);
@@ -910,6 +932,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_vbif_init_memtypes(dpu_kms);
 
+	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
+		dpu_kms_parse_data_bus_icc_path(dpu_kms);
+
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 
 	return 0;
@@ -1015,7 +1040,7 @@ static int dpu_dev_remove(struct platform_device *pdev)
 
 static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 {
-	int rc = -1;
+	int i, rc = -1;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
 	struct drm_device *ddev;
@@ -1026,6 +1051,9 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	if (rc)
 		DPU_ERROR("clock disable failed rc:%d\n", rc);
 
+	for (i = 0; i < dpu_kms->num_paths; i++)
+		icc_set_bw(dpu_kms->path[i], 0, 0);
+
 	return rc;
 }
 
@@ -1037,8 +1065,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 	struct drm_encoder *encoder;
 	struct drm_device *ddev;
 	struct dss_module_power *mp = &dpu_kms->mp;
+	int i;
 
 	ddev = dpu_kms->dev;
+
+	/* Min vote of BW is required before turning on AXI clk */
+	for (i = 0; i < dpu_kms->num_paths; i++)
+		icc_set_bw(dpu_kms->path[i], 0,
+			dpu_kms->catalog->perf.min_dram_ib);
+
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
 	if (rc) {
 		DPU_ERROR("clock enable failed rc:%d\n", rc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index c6169e7..fc1d303 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -8,6 +8,8 @@
 #ifndef __DPU_KMS_H__
 #define __DPU_KMS_H__
 
+#include <linux/interconnect.h>
+
 #include <drm/drm_drv.h>
 
 #include "msm_drv.h"
@@ -130,6 +132,8 @@ struct dpu_kms {
 	 * when disabled.
 	 */
 	atomic_t bandwidth_ref;
+	struct icc_path *path[2];
+	u32 num_paths;
 };
 
 struct vsync_info {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 80d3cfc..df0a983 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -8,7 +8,6 @@
 #include <linux/irqdesc.h>
 #include <linux/irqchip/chained_irq.h>
 #include "dpu_kms.h"
-#include <linux/interconnect.h>
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
 
@@ -315,9 +314,11 @@ int dpu_mdss_init(struct drm_device *dev)
 	}
 	dpu_mdss->mmio_len = resource_size(res);
 
-	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
-	if (ret)
-		return ret;
+	if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
+		ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
+		if (ret)
+			return ret;
+	}
 
 	mp = &dpu_mdss->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3b9c33e..c2a6e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -132,6 +132,84 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
 }
 
 /**
+ * _dpu_plane_calc_bw - calculate bandwidth required for a plane
+ * @Plane: Pointer to drm plane.
+ * Result: Updates calculated bandwidth in the plane state.
+ * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
+ * Prefill BW Equation: line src bytes * line_time
+ */
+static void _dpu_plane_calc_bw(struct drm_plane *plane,
+	struct drm_framebuffer *fb)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate;
+	struct drm_display_mode *mode;
+	const struct dpu_format *fmt = NULL;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	int src_width, src_height, dst_height, fps;
+	u64 plane_prefill_bw;
+	u64 plane_bw;
+	u32 hw_latency_lines;
+	u32 scale_factor;
+	int vbp, vpw;
+
+	pstate = to_dpu_plane_state(plane->state);
+	mode = &plane->state->crtc->mode;
+
+	fmt = dpu_get_dpu_format_ext(fb->format->format, fb->modifier);
+
+	src_width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
+	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
+	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
+	fps = drm_mode_vrefresh(mode);
+	vbp = mode->vtotal - mode->vsync_end;
+	vpw = mode->vsync_end - mode->vsync_start;
+	hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
+	scale_factor = src_height > dst_height ?
+		mult_frac(src_height, 1, dst_height) : 1;
+
+	plane_bw =
+		src_width * mode->vtotal * fps * fmt->bpp * scale_factor;
+
+	plane_prefill_bw =
+		src_width * hw_latency_lines * fps * fmt->bpp * scale_factor;
+
+	plane_prefill_bw = mult_frac(plane_prefill_bw, mode->vtotal, (vbp+vpw));
+
+	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
+}
+
+
+/**
+ * _dpu_plane_calc_clk - calculate clock required for a plane
+ * @Plane: Pointer to drm plane.
+ * Result: Updates calculated clock in the plane state.
+ * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
+ */
+static void _dpu_plane_calc_clk(struct drm_plane *plane)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate;
+	struct drm_display_mode *mode;
+	int dst_width, src_height, dst_height, fps;
+
+	pstate = to_dpu_plane_state(plane->state);
+	mode = &plane->state->crtc->mode;
+
+	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
+	dst_width = drm_rect_width(&pdpu->pipe_cfg.dst_rect);
+	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
+	fps = drm_mode_vrefresh(mode);
+
+	pstate->plane_clk =
+		dst_width * mode->vtotal * fps;
+
+	if (src_height > dst_height)
+		pstate->plane_clk = mult_frac(pstate->plane_clk,
+					src_height, dst_height);
+}
+
+/**
  * _dpu_plane_calc_fill_level - calculate fill level of the given source format
  * @plane:		Pointer to drm plane
  * @fmt:		Pointer to source buffer format
@@ -1102,6 +1180,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	}
 
 	_dpu_plane_set_qos_remap(plane);
+
+	_dpu_plane_calc_bw(plane, fb);
+
+	_dpu_plane_calc_clk(plane);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 4569497..ca83b87 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -25,6 +25,8 @@
  * @scaler3_cfg: configuration data for scaler3
  * @pixel_ext: configuration data for pixel extensions
  * @cdp_cfg:	CDP configuration
+ * @plane_fetch_bw: calculated BW per plane
+ * @plane_clk: calculated clk per plane
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -39,6 +41,8 @@ struct dpu_plane_state {
 	struct dpu_hw_pixel_ext pixel_ext;
 
 	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
+	u64 plane_fetch_bw;
+	u64 plane_clk;
 };
 
 /**
-- 
1.9.1

