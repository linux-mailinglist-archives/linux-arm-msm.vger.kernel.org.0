Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F78395CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 15:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhEaNkH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 09:40:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17006 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhEaNgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 09:36:21 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 31 May 2021 06:34:39 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 May 2021 06:34:37 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 May 2021 19:04:12 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 78CA621485; Mon, 31 May 2021 19:04:11 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, abhinavk@codeaurora.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org, jonathan@marek.ca
Subject: [v1 2/3] drm/msm/dsi: Add PHY configuration for SC7280
Date:   Mon, 31 May 2021 19:03:54 +0530
Message-Id: <1622468035-8453-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver with
different enable|disable regulator loads.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 drivers/gpu/drm/msm/Kconfig               |  6 +++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 ++++++++++++++++++++++
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 10f693e..7c9d9f1 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -114,9 +114,9 @@ config DRM_MSM_DSI_10NM_PHY
 	  Choose this option if DSI PHY on SDM845 is used on the platform.
 
 config DRM_MSM_DSI_7NM_PHY
-	bool "Enable DSI 7nm PHY driver in MSM DRM (used by SM8150/SM8250)"
+	bool "Enable DSI 7nm PHY driver in MSM DRM"
 	depends on DRM_MSM_DSI
 	default y
 	help
-	  Choose this option if DSI PHY on SM8150/SM8250 is used on the
-	  platform.
+	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
+	  the platform.
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index ff7f2ec..2770783 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -593,6 +593,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_7nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-7nm-8150",
 	  .data = &dsi_phy_7nm_8150_cfgs },
+	{ .compatible = "qcom,dsi-phy-7nm-7280",
+	  .data = &dsi_phy_7nm_7280_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 94a77ac..bc91dc8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -51,6 +51,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40..6e30d21 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -998,3 +998,25 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
+	.has_phy_lane = true,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdds", 37550, 0},
+		},
+	},
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+	},
+	.min_pll_rate = 600000000UL,
+	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
+	.io_start = { 0xae94400, 0xae96400 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
+};
-- 
2.7.4

