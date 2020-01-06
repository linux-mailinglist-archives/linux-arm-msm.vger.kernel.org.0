Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC056130CE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 06:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgAFFOc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 00:14:32 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:32358 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725446AbgAFFOc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 00:14:32 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Jan 2020 10:44:28 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Jan 2020 10:44:04 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id AEB2827C8; Mon,  6 Jan 2020 10:44:03 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [v2] drm/msm: add support for 2.4.1 DSI version for sc7180 soc
Date:   Mon,  6 Jan 2020 10:43:49 +0530
Message-Id: <1578287629-26709-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Modify commit text to indicate DSI version and SOC detail

Changes in v1:
	-Modify commit text to indicate DSI version and SOC detail(Jeffrey Hugo).
	-Splitting visionox panel driver code out into a
	 different patch(set), since panel drivers are merged into
	 drm-next via a different tree(Rob Clark).
Changes in v2:
	-Update commit text accordingly(Matthias Kaehlcke).

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index b7b7c1a..7b967dd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -133,6 +133,10 @@ static const char * const dsi_sdm845_bus_clk_names[] = {
 	"iface", "bus",
 };
 
+static const char * const dsi_sc7180_bus_clk_names[] = {
+	"iface", "bus",
+};
+
 static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
@@ -147,6 +151,20 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.num_dsi = 2,
 };
 
+static const struct msm_dsi_config sc7180_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdda", 21800, 4 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_sc7180_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
+	.io_start = { 0xae94000 },
+	.num_dsi = 1,
+};
+
 const static struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_enable = dsi_link_clk_enable_v2,
 	.link_clk_disable = dsi_link_clk_disable_v2,
@@ -201,6 +219,9 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
+		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index e2b7a7d..9919536 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -19,6 +19,7 @@
 #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
 #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
+#define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.7.4

