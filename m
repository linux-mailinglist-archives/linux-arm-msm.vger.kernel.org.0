Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49A8424DE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 09:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240407AbhJGHME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 03:12:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240434AbhJGHL4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 03:11:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 117B660F48;
        Thu,  7 Oct 2021 07:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633590603;
        bh=6JJpkxAXI8XphB+qAfR4aInDl3Smf4m3ajxYJh+7m7o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m+ob9yqtFaDDNH8mfLnLPvDMWnAp8x5xWOjiINnpeoigdheXHhhtQjQ1abRmnEWdG
         HA7O9quqy9wZz9Wi3ZZp/r+bSUTNw7Gj8QeDnecB4Lsh9NfmZfBqDZHjlUUXobKwRh
         bl44JUUbO92vMpgyv1ZfYk2ud9abtzA5SZgiDykAX146AGTL2lTT+ixkUKFNZt5ZXM
         B//TogtH9EBnNtkvDjUVmizGs44m9mQxObtZO7XcJ7Ncbatn44+tnhD0Sax8rcBCRG
         dpXn9iGMkJMthd1Z07CBBtMlbgufqzMaHtA88EbM8x0PVVuKFL6j0/6RV7rtrSysWP
         /KQ1ej60YeEvg==
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
Subject: [PATCH v2 10/11] drm/msm/dsi: Add support for DSC configuration
Date:   Thu,  7 Oct 2021 12:38:59 +0530
Message-Id: <20211007070900.456044-11-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007070900.456044-1-vkoul@kernel.org>
References: <20211007070900.456044-1-vkoul@kernel.org>
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
 drivers/gpu/drm/msm/dsi/dsi_host.c | 123 ++++++++++++++++++++++++++++-
 2 files changed, 132 insertions(+), 1 deletion(-)

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
index ba24458c2e38..86e36a3e97b6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -946,6 +946,26 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
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
+	if ((pic_width % dsc->drm->slice_width) || (pic_height % dsc->drm->slice_height)) {
+		pr_err("DSI: pic_dim %dx%d has to be multiple of slice %dx%d\n",
+		       pic_width, pic_height, dsc->drm->slice_width, dsc->drm->slice_height);
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
@@ -978,7 +998,72 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
+			/* If slice_count > slice_per_intf, then use 1
+			 * This can happen during partial update
+			 */
+				dsc->drm->slice_count = 1;
+
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
@@ -997,8 +1082,40 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
@@ -2074,6 +2191,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
 	struct platform_device *pdev = msm_host->pdev;
+	struct msm_drm_private *priv;
 	int ret;
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
@@ -2093,6 +2211,9 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	}
 
 	msm_host->dev = dev;
+	priv = dev->dev_private;
+	priv->dsc = msm_host->dsc;
+
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
 		pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
-- 
2.31.1

