Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8774E7207
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 12:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355001AbiCYLJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 07:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355038AbiCYLIr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 07:08:47 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10310D370A;
        Fri, 25 Mar 2022 04:07:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 53A6CCE2919;
        Fri, 25 Mar 2022 11:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E90C340F0;
        Fri, 25 Mar 2022 11:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648206424;
        bh=3vndtaE9MNcVANrvcQs3TL2U1JfkDsXtzSQ4Rkiht5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MV/5KC/DfS/oKv0p32xd9jtqezJoFI/sI/305hwtJYCpMjg80G33R5xmOkM21XRUo
         4Tf3IWyjgTRWqyr8WbK4LBP81nAAeOcgtQgBVjoDhDx+ftTKumdgnhgNRmwAavnv88
         1cIO1vO+Ef+YM8fSjKTViBFVU44llxaDY+rzVeFEjtlIPviWtPT0Ad/kvBoOmwp73/
         +Q305B4NPaGs9EFlucPHPcs7cls9vcBVh0DOrQyDZbXzFCkmezhTgsCooWGh9mz83I
         LGF4N76RmanikH32HCpikapq2Yvqo+5+8zaOo+DmB/nhVJCHKan4EadtX5zVb+NZfq
         pUdnh+RhPWREw==
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
Subject: [PATCH v5 13/13] drm/msm/dsi: Add support for DSC configuration
Date:   Fri, 25 Mar 2022 16:35:56 +0530
Message-Id: <20220325110556.275490-14-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325110556.275490-1-vkoul@kernel.org>
References: <20220325110556.275490-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When DSC is enabled, we need to configure DSI registers accordingly and
configure the respective stream compression registers.

Add support to calculate the register setting based on DSC params and
timing information and configure these registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h  | 10 ++++
 drivers/gpu/drm/msm/dsi/dsi_host.c | 94 +++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 1 deletion(-)

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
index 438c80750682..0f33e678103f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -908,6 +908,61 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
 }
 
+static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode, u32 hdisplay)
+{
+	struct msm_display_dsc_config *dsc = msm_host->dsc;
+	u32 reg, intf_width, reg_ctrl, reg_ctrl2;
+	u32 slice_per_intf, total_bytes_per_intf;
+
+	/* first calculate dsc parameters and then program
+	 * compress mode registers
+	 */
+	intf_width = hdisplay;
+	slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
+
+	/* If slice_per_pkt is greater than slice_per_intf
+	 * then default to 1. This can happen during partial
+	 * update.
+	 */
+	if (slice_per_intf > dsc->drm->slice_count)
+		dsc->drm->slice_count = 1;
+
+	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
+	dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
+					   dsc->drm->bits_per_pixel, 8);
+
+	dsc->drm->slice_chunk_size = dsc->bytes_in_slice;
+
+	total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
+
+	dsc->eol_byte_num = total_bytes_per_intf % 3;
+	dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
+	dsc->bytes_per_pkt = dsc->bytes_in_slice * dsc->drm->slice_count;
+	dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
+
+	if (is_cmd_mode) /* packet data type */
+		reg = MIPI_DSI_DCS_LONG_WRITE << 8;
+	else
+		reg = MIPI_DSI_COMPRESSED_PIXEL_STREAM << 8;
+
+	reg |= (dsc->pkt_per_line >> 1) << 6;
+	reg |= dsc->eol_byte_num << 4;
+	reg |= 1;
+
+	if (is_cmd_mode) {
+		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
+		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
+
+		reg_ctrl |= reg;
+		reg_ctrl2 |= dsc->bytes_in_slice;
+
+		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
+		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
+	} else {
+		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
+	}
+}
+
 static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	struct drm_display_mode *mode = msm_host->mode;
@@ -940,7 +995,38 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		hdisplay /= 2;
 	}
 
+	if (msm_host->dsc) {
+		struct msm_display_dsc_config *dsc = msm_host->dsc;
+
+		/* update dsc params with timing params */
+		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
+			pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n",
+			       mode->hdisplay, mode->vdisplay);
+			return;
+		}
+
+		dsc->drm->pic_width = mode->hdisplay;
+		dsc->drm->pic_height = mode->vdisplay;
+		DBG("Mode %dx%d\n", dsc->drm->pic_width, dsc->drm->pic_height);
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
+		if (msm_host->dsc)
+			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
+
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
 			DSI_ACTIVE_H_START(ha_start) |
 			DSI_ACTIVE_H_END(ha_end));
@@ -959,8 +1045,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
+		if (msm_host->dsc)
+			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
+
 		/* image data and 1 byte write_memory_start cmd */
-		wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
+		if (!msm_host->dsc)
+			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
+		else
+			wc = mode->hdisplay / 2 + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
-- 
2.34.1

