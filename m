Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55ED3452AB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 07:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhKPG2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 01:28:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:59310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230413AbhKPG1N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 01:27:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEF4F6113D;
        Tue, 16 Nov 2021 06:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637043854;
        bh=ohbJKt+LiqvofmPVP43TTigLK0nwR1nysKB9VjLMoIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YUGVwivxIkgicSnCsO6dSc7rTUneHg+uvGzcEU1jy10WaMm1CgtfmGuTQiM79UwvP
         JBrSOap/+Qhw1F4KNBh4ZjlMeNTeaLrYdDDwI2m90R8z2zDSRKf+v/4wQY4L5WwtCB
         8HlJv2JZSwbUo9VXRgey02i+Ta1Yj/lELMGfs2jQisnT0su9j94QSwcrMZDwZzgCC/
         n+2XKEIYijq1xtKX2mo5guvdQsuEJWzZg3H2MLd2MTTP0pRb6eE0zYtTlIzaxY5Wku
         kxxeTt5PpJ/JGW0jd58PChoPldddkinRdZkozc+5vR5auLzIdpR9EaIuZ7xspg2kHd
         XXaOrqq6rbC6A==
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
Subject: [PATCH v3 12/13] drm/msm/dsi: Add support for DSC configuration
Date:   Tue, 16 Nov 2021 11:52:55 +0530
Message-Id: <20211116062256.2417186-13-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116062256.2417186-1-vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When DSC is enabled, we need to configure DSI registers accordingly and
configure the respective stream compression registers.

Add support to calculate the register setting based on DSC params and
timing information and configure these registers.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
 drivers/gpu/drm/msm/dsi/dsi_host.c | 113 ++++++++++++++++++++++++++++-
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 49b551ad1bff..c1c85df58c4b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -706,4 +706,14 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
 #define REG_DSI_CPHY_MODE_CTRL					0x000002d4
 
 
+#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL			0x0000029c
+
+#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL2			0x000002a0
+
+#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL			0x000002a4
+
+#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2			0x000002a8
+
+#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL3			0x000002ac
+
 #endif /* DSI_XML */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 31d385d8d834..2c14c36f0b3d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -908,6 +908,20 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
 }
 
+static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
+				  int pic_width, int pic_height)
+{
+	if (!dsc || !pic_width || !pic_height) {
+		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", pic_width, pic_height);
+		return -EINVAL;
+	}
+
+	dsc->drm->pic_width = pic_width;
+	dsc->drm->pic_height = pic_height;
+
+	return 0;
+}
+
 static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	struct drm_display_mode *mode = msm_host->mode;
@@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		hdisplay /= 2;
 	}
 
+	if (msm_host->dsc) {
+		struct msm_display_dsc_config *dsc = msm_host->dsc;
+
+		/* update dsc params with timing params */
+		dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
+		DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width, dsc->drm->pic_height);
+
+		/* we do the calculations for dsc parameters here so that
+		 * panel can use these parameters
+		 */
+		dsi_populate_dsc_params(dsc);
+
+		/* Divide the display by 3 but keep back/font porch and
+		 * pulse width same
+		 */
+		h_total -= hdisplay;
+		hdisplay /= 3;
+		h_total += hdisplay;
+		ha_end = ha_start + hdisplay;
+	}
+
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		if (msm_host->dsc) {
+			struct msm_display_dsc_config *dsc = msm_host->dsc;
+			u32 reg, intf_width, slice_per_intf;
+			u32 total_bytes_per_intf;
+
+			/* first calculate dsc parameters and then program
+			 * compress mode registers
+			 */
+			intf_width = hdisplay;
+			slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
+
+			dsc->drm->slice_count = 1;
+			dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * 8, 8);
+			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
+
+			dsc->eol_byte_num = total_bytes_per_intf % 3;
+			dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
+			dsc->bytes_per_pkt = dsc->bytes_in_slice * dsc->drm->slice_count;
+			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
+
+			reg = dsc->bytes_per_pkt << 16;
+			reg |= (0x0b << 8);    /* dtype of compressed image */
+
+			/* pkt_per_line:
+			 * 0 == 1 pkt
+			 * 1 == 2 pkt
+			 * 2 == 4 pkt
+			 * 3 pkt is not supported
+			 * above translates to ffs() - 1
+			 */
+			reg |= (ffs(dsc->pkt_per_line) - 1) << 6;
+
+			dsc->eol_byte_num = total_bytes_per_intf % 3;
+			reg |= dsc->eol_byte_num << 4;
+			reg |= 1;
+
+			dsi_write(msm_host,
+				  REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
+		}
+
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
 			DSI_ACTIVE_H_START(ha_start) |
 			DSI_ACTIVE_H_END(ha_end));
@@ -959,8 +1034,40 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
+		if (msm_host->dsc) {
+			struct msm_display_dsc_config *dsc = msm_host->dsc;
+			u32 reg, reg_ctrl, reg_ctrl2;
+			u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
+
+			reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
+			reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
+
+			slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
+			bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
+						      dsc->drm->bits_per_pixel, 8);
+			dsc->drm->slice_chunk_size = bytes_in_slice;
+			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
+			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
+
+			reg = 0x39 << 8;
+			reg |= ffs(dsc->pkt_per_line) << 6;
+
+			dsc->eol_byte_num = total_bytes_per_intf % 3;
+			reg |= dsc->eol_byte_num << 4;
+			reg |= 1;
+
+			reg_ctrl |= reg;
+			reg_ctrl2 |= bytes_in_slice;
+
+			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
+			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
+		}
+
 		/* image data and 1 byte write_memory_start cmd */
-		wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
+		if (!msm_host->dsc)
+			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
+		else
+			wc = mode->hdisplay / 2 + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -2051,9 +2158,13 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
+	struct msm_drm_private *priv;
 	int ret;
 
 	msm_host->dev = dev;
+	priv = dev->dev_private;
+	priv->dsc = msm_host->dsc;
+
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
 		pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
-- 
2.31.1

