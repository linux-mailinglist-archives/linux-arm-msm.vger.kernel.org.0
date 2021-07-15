Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FF63C98FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 08:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbhGOGzX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 02:55:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230016AbhGOGzX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 02:55:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70D6361370;
        Thu, 15 Jul 2021 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626331950;
        bh=4Ca89CCWYSxsXSdy1/JtZxdhsT97ErB+7d0UpAenulY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uvyQDp0UFZ5WaTckYjLQ+3KXONBbGv7JNOJ1m0QirSTSg8QQPsk3CaBgoSgEungKj
         Zem3KMAaM0HqRkHvY2dATWeiEee5SDfD5Kaj8APFvdZgGfeQ+Wf8TVnuNtgBykJ8w0
         LtfDXwT8M5NWSvL26evy+3Bxv8XL6PzQkIUocUFyjmq0PFW3LajI4FPJJqzJjTAi01
         asfcsliQjUJkEmPk1lJJxVtQGhMRBFFZravUxC/+9HuOCm7+v1+AbpklntaOLUldjg
         iE+ICrfTkIhwHciRdohTyRERKQeUBFR9+U0V7yoLcul0ZjjR8oVCI2Ewkf4AoNSTu4
         YzJP1ASF45chA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 01/11] drm/msm/dsi: add support for dsc data
Date:   Thu, 15 Jul 2021 12:21:53 +0530
Message-Id: <20210715065203.709914-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715065203.709914-1-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Display Stream Compression (DSC) parameters need to be calculated. Add
helpers and struct msm_display_dsc_config in msm_drv for this
msm_display_dsc_config uses drm_dsc_config for DSC parameters.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since RFC:
 - Drop the DT parsing code
 - Port dsc param calculation from downstream

 drivers/gpu/drm/msm/dsi/dsi_host.c | 133 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h      |  21 +++++
 2 files changed, 154 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 8a10e4343281..e1e5d91809b5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -30,6 +30,8 @@
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
+static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc);
+
 static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
 {
 	u32 ver;
@@ -156,6 +158,7 @@ struct msm_dsi_host {
 	struct regmap *sfpb;
 
 	struct drm_display_mode *mode;
+	struct msm_display_dsc_config *dsc;
 
 	/* connected device info */
 	struct device_node *device_node;
@@ -1744,6 +1747,136 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
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
+	int mux_words_size;
+	int groups_per_line, groups_total;
+	int min_rate_buffer_size;
+	int hrd_delay;
+	int pre_num_extra_mux_bits, num_extra_mux_bits;
+	int slice_bits;
+	int target_bpp_x16;
+	int data;
+	int final_value, final_scale;
+	int i;
+
+	dsc->drm->rc_model_size = 8192;
+	dsc->drm->first_line_bpg_offset = 12;
+	dsc->drm->rc_edge_factor = 6;
+	dsc->drm->rc_tgt_offset_high = 3;
+	dsc->drm->rc_tgt_offset_low = 3;
+	dsc->drm->simple_422 = 0;
+	dsc->drm->convert_rgb = 1;
+	dsc->drm->vbr_enable = 0;
+
+	/* handle only bpp = bpc = 8 */
+	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
+		dsc->drm->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
+
+	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
+		dsc->drm->rc_range_params[i].range_min_qp = min_qp[i];
+		dsc->drm->rc_range_params[i].range_max_qp = max_qp[i];
+		dsc->drm->rc_range_params[i].range_bpg_offset = bpg_offset[i];
+	}
+
+	dsc->drm->initial_offset = 6144; /* Not bpp 12 */
+	if (dsc->drm->bits_per_pixel != 8)
+		dsc->drm->initial_offset = 2048;	/* bpp = 12 */
+
+	mux_words_size = 48;		/* bpc == 8/10 */
+	if (dsc->drm->bits_per_component == 12)
+		mux_words_size = 64;
+
+	dsc->drm->initial_xmit_delay = 512;
+	dsc->drm->initial_scale_value = 32;
+	dsc->drm->first_line_bpg_offset = 12;
+	dsc->drm->line_buf_depth = dsc->drm->bits_per_component + 1;
+
+	/* bpc 8 */
+	dsc->drm->flatness_min_qp = 3;
+	dsc->drm->flatness_max_qp = 12;
+	dsc->det_thresh_flatness = 7 + 2 * (dsc->drm->bits_per_component - 8);
+	dsc->drm->rc_quant_incr_limit0 = 11;
+	dsc->drm->rc_quant_incr_limit1 = 11;
+	dsc->drm->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
+
+	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
+	 * params are calculated
+	 */
+	dsc->slice_last_group_size = 3 - (dsc->drm->slice_width % 3);
+	groups_per_line = DIV_ROUND_UP(dsc->drm->slice_width, 3);
+	dsc->drm->slice_chunk_size = dsc->drm->slice_width * dsc->drm->bits_per_pixel / 8;
+	if ((dsc->drm->slice_width * dsc->drm->bits_per_pixel) % 8)
+		dsc->drm->slice_chunk_size++;
+
+	/* rbs-min */
+	min_rate_buffer_size =  dsc->drm->rc_model_size - dsc->drm->initial_offset +
+				dsc->drm->initial_xmit_delay * dsc->drm->bits_per_pixel +
+				groups_per_line * dsc->drm->first_line_bpg_offset;
+
+	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->drm->bits_per_pixel);
+
+	dsc->drm->initial_dec_delay = hrd_delay - dsc->drm->initial_xmit_delay;
+
+	dsc->drm->initial_scale_value = 8 * dsc->drm->rc_model_size /
+				       (dsc->drm->rc_model_size - dsc->drm->initial_offset);
+
+	slice_bits = 8 * dsc->drm->slice_chunk_size * dsc->drm->slice_height;
+
+	groups_total = groups_per_line * dsc->drm->slice_height;
+
+	data = dsc->drm->first_line_bpg_offset * 2048;
+
+	dsc->drm->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->drm->slice_height - 1));
+
+	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 * dsc->drm->bits_per_component + 4) - 2);
+
+	num_extra_mux_bits = pre_num_extra_mux_bits - (mux_words_size -
+			     ((slice_bits - pre_num_extra_mux_bits) % mux_words_size));
+
+	data = 2048 * (dsc->drm->rc_model_size - dsc->drm->initial_offset + num_extra_mux_bits);
+	dsc->drm->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
+
+	/* bpp * 16 + 0.5 */
+	data = dsc->drm->bits_per_pixel * 16;
+	data *= 2;
+	data++;
+	data /= 2;
+	target_bpp_x16 = data;
+
+	data = (dsc->drm->initial_xmit_delay * target_bpp_x16) / 16;
+	final_value =  dsc->drm->rc_model_size - data + num_extra_mux_bits;
+	dsc->drm->final_offset = final_value;
+
+	final_scale = 8 * dsc->drm->rc_model_size / (dsc->drm->rc_model_size - final_value);
+
+
+	data = (final_scale - 9) * (dsc->drm->nfl_bpg_offset + dsc->drm->slice_bpg_offset);
+	dsc->drm->scale_increment_interval = (2048 * dsc->drm->final_offset) / data;
+
+	dsc->drm->scale_decrement_interval = groups_per_line / (dsc->drm->initial_scale_value - 8);
+
+	return 0;
+}
+
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
 	struct device *dev = &msm_host->pdev->dev;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2668941df529..65bff0176b66 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -30,6 +30,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_dsc.h>
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
 
@@ -134,6 +135,23 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
+/* DSC config */
+struct msm_display_dsc_config {
+	struct drm_dsc_config *drm;
+	u8 scr_rev;
+
+	u32 initial_lines;
+	u32 pkt_per_line;
+	u32 bytes_in_slice;
+	u32 bytes_per_pkt;
+	u32 eol_byte_num;
+	u32 pclk_per_line;
+	u32 slice_last_group_size;
+	u32 det_thresh_flatness;
+	u32 extra_width;
+	u32 pps_delay_ms;
+};
+
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -227,6 +245,9 @@ struct msm_drm_private {
 	/* Properties */
 	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
 
+	/* DSC configuration */
+	struct msm_display_dsc_config *dsc;
+
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.31.1

