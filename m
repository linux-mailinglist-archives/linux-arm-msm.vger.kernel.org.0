Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D5938C6EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbhEUMvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:51:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:33738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234634AbhEUMvk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:51:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DCE8613DD;
        Fri, 21 May 2021 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621601417;
        bh=4+MmQy7ngfpHoR3Ye/vZCDRGZwp0ZIwfKlbILCno4hc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UKjQFQDGi+QcgZa1ClVhplIfhxtKJoQjIPJsFlO4XA127uiH5UqjSJZrRzg0Fobcp
         MxFIR6+9eWYFICb1hlLbqymJKrUlQ8afxSyFmFYrbbfuYViYXitphko/+gJvnAMEGG
         w6loKaTB53av3M6lcsFIXQw3svhNjXEMllVjM15VRVSnLOolqlc7S/D6czx1aUOcZZ
         +NG9PGCZL/Vm45XzBdwX9OWA/CFEQJEc1QKjyqSOGBLPQSLK+PNIB3a41xb83IGnDu
         wMA4GqlJyt4hSQd1y5EyS6okR4jLLhf0+/BkJF7nd7bKFHOqIIO67dMua4hHrfjtUD
         jnWey3eUqYnew==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 03/13] drm/msm/dsi: add support for dsc data
Date:   Fri, 21 May 2021 18:19:33 +0530
Message-Id: <20210521124946.3617862-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSC needs some configuration from device tree, add support to read and
store these params and add DSC structures in msm_drv

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 170 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h      |  32 ++++++
 2 files changed, 202 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 8a10e4343281..864d3c655e73 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -156,6 +156,7 @@ struct msm_dsi_host {
 	struct regmap *sfpb;
 
 	struct drm_display_mode *mode;
+	struct msm_display_dsc_config *dsc;
 
 	/* connected device info */
 	struct device_node *device_node;
@@ -1744,6 +1745,168 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	return -EINVAL;
 }
 
+static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
+	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
+	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
+};
+
+/* only 8bpc, 8bpp added */
+static char min_qp[DSC_NUM_BUF_RANGES] = {
+	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
+};
+
+static char max_qp[DSC_NUM_BUF_RANGES] = {
+	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
+};
+
+static char bpg_offset[DSC_NUM_BUF_RANGES] = {
+	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
+};
+
+static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc)
+{
+	int i;
+
+	dsc->drm.rc_model_size = 8192;
+	dsc->drm.first_line_bpg_offset = 15;
+	dsc->drm.rc_edge_factor = 6;
+	dsc->drm.rc_tgt_offset_high = 3;
+	dsc->drm.rc_tgt_offset_low = 3;
+	dsc->drm.simple_422 = 0;
+	dsc->drm.convert_rgb = 1;
+	dsc->drm.vbr_enable = 0;
+
+	/* handle only bpp = bpc = 8 */
+	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
+		dsc->drm.rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
+
+	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
+		dsc->drm.rc_range_params[i].range_min_qp = min_qp[i];
+		dsc->drm.rc_range_params[i].range_max_qp = max_qp[i];
+		dsc->drm.rc_range_params[i].range_bpg_offset = bpg_offset[i];
+	}
+
+	dsc->drm.initial_offset = 6144;
+	dsc->drm.initial_xmit_delay = 512;
+	dsc->drm.initial_scale_value = 32;
+	dsc->drm.first_line_bpg_offset = 12;
+	dsc->drm.line_buf_depth = dsc->drm.bits_per_component + 1;
+
+	/* bpc 8 */
+	dsc->drm.flatness_min_qp = 3;
+	dsc->drm.flatness_max_qp = 12;
+	dsc->det_thresh_flatness = 7;
+	dsc->drm.rc_quant_incr_limit0 = 11;
+	dsc->drm.rc_quant_incr_limit1 = 11;
+	dsc->drm.mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
+
+	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
+	 * params are calculated
+	 */
+
+	i = dsc->drm.slice_width % 3;
+	switch (i) {
+	case 0:
+		dsc->slice_last_group_size = 2;
+		break;
+
+	case 1:
+		dsc->slice_last_group_size = 0;
+		break;
+
+	case 2:
+		dsc->slice_last_group_size = 0;
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int dsi_host_parse_dsc(struct msm_dsi_host *msm_host,
+			      struct device_node *np)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	struct msm_display_dsc_config *dsc;
+	bool is_dsc_enabled;
+	u32 data;
+	int ret;
+
+	is_dsc_enabled = of_property_read_bool(np, "qcom,mdss-dsc-enabled");
+
+	if (!is_dsc_enabled)
+		return 0;
+
+	dsc = kzalloc(sizeof(*dsc), GFP_KERNEL);
+	if (!dsc)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "qcom,mdss-dsc-version", &data);
+	if (ret) {
+		dsc->drm.dsc_version_major = 0x1;
+		dsc->drm.dsc_version_minor = 0x1;
+	} else {
+		dsc->drm.dsc_version_major = (data >> 4) & 0xf;
+		dsc->drm.dsc_version_minor = data & 0xf;
+	}
+
+	ret = of_property_read_u32(np, "qcom,mdss-scr-version", &data);
+	if (ret)
+		dsc->scr_rev = 0;
+	else
+		dsc->scr_rev = data & 0xff;
+
+	ret = of_property_read_u32(np, "qcom,mdss-slice-height", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read dsc slice height\n");
+		goto err;
+	}
+	dsc->drm.slice_height = data;
+
+	ret = of_property_read_u32(np, "qcom,mdss-slice-width", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read dsc slice width\n");
+		goto err;
+	}
+	dsc->drm.slice_width = data;
+
+	ret = of_property_read_u32(np, "qcom,mdss-slice-per-pkt", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read mdss-slice-per-pkt\n");
+		goto err;
+	}
+	dsc->slice_per_pkt = data;
+
+	ret = of_property_read_u32(np, "qcom,mdss-bit-per-component", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read mdss-bit-per-component\n");
+		goto err;
+	}
+	dsc->drm.bits_per_component = data;
+
+	ret = of_property_read_u32(np, "qcom,mdss-bit-per-pixel", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read bit-per-pixel\n");
+		goto err;
+	}
+	dsc->drm.bits_per_pixel = data;
+
+	dsc->drm.block_pred_enable = of_property_read_bool(np,
+			 "qcom,mdss-block-prediction-enable");
+
+	dsi_populate_dsc_params(dsc);
+
+	msm_host->dsc = dsc;
+
+	return 0;
+
+err:
+	kfree(dsc);
+	return ret;
+}
+
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
 	struct device *dev = &msm_host->pdev->dev;
@@ -1763,6 +1926,13 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		return 0;
 	}
 
+	ret = dsi_host_parse_dsc(msm_host, np);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: invalid dsc configuration %d\n", __func__, ret);
+		ret = -EINVAL;
+		goto err;
+	}
+
 	ret = dsi_host_parse_lane_data(msm_host, endpoint);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: invalid lane configuration %d\n",
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2668941df529..26661dd43936 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -30,6 +30,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_dsc.h>
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
 
@@ -70,6 +71,16 @@ enum msm_mdp_plane_property {
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
+/**
+ * enum msm_display_compression_type - compression method used for pixel stream
+ * @MSM_DISPLAY_COMPRESSION_NONE:	Pixel data is not compressed
+ * @MSM_DISPLAY_COMPRESSION_DSC:	DSC compresison is used
+ */
+enum msm_display_compression_type {
+	MSM_DISPLAY_COMPRESSION_NONE,
+	MSM_DISPLAY_COMPRESSION_DSC,
+};
+
 /**
  * enum msm_display_caps - features/capabilities supported by displays
  * @MSM_DISPLAY_CAP_VID_MODE:           Video or "active" mode supported
@@ -134,6 +145,24 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
+/* DSC config */
+struct msm_display_dsc_config {
+	struct drm_dsc_config drm;
+	u8 scr_rev;
+
+	u32 initial_lines;
+	u32 pkt_per_line;
+	u32 bytes_in_slice;
+	u32 bytes_per_pkt;
+	u32 eol_byte_num;
+	u32 pclk_per_line;
+	u32 slice_last_group_size;
+	u32 slice_per_pkt;
+	u32 det_thresh_flatness;
+	u32 extra_width;
+	u32 pps_delay_ms;
+};
+
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -227,6 +256,9 @@ struct msm_drm_private {
 	/* Properties */
 	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
 
+	/* DSC configuration */
+	struct msm_display_dsc_config *dsc;
+
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.26.3

