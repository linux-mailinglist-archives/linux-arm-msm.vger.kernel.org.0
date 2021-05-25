Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6D138FBBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 09:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhEYHdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 03:33:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8271 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbhEYHc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 03:32:59 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 00:31:31 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 00:31:29 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 May 2021 13:00:40 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 3AC7621440; Tue, 25 May 2021 13:00:39 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robdclark@gmail.com, dianders@chromium.org,
        lyude@redhat.com, jani.nikula@intel.com, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        daniel.thompson@linaro.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org
Subject: [v4 4/4] drm/panel-simple: Add Samsung ATNA33XC20
Date:   Tue, 25 May 2021 13:00:31 +0530
Message-Id: <1621927831-29471-5-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Samsung 13.3" FHD eDP AMOLED panel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

Changes in v4:
- New

 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index caed71b..21af794 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3644,6 +3644,37 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode samsung_atna33xc20_mode = {
+	.clock = 138770,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 80,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 8,
+	.vsync_end = 1080 + 8 + 8,
+	.vtotal = 1080 + 8 + 8 + 16,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc samsung_atna33xc20 = {
+	.modes = &samsung_atna33xc20_mode,
+	.num_modes = 1,
+	.bpc = 10,
+	.size = {
+		.width = 294,
+		.height = 165,
+	},
+	.delay = {
+		.disable_to_power_off = 150,
+		.power_to_enable = 150,
+		.hpd_absent_delay = 200,
+		.unprepare = 500,
+	},
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+	.uses_dpcd_backlight = true,
+};
+
 static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
 	.clock = 271560,
 	.hdisplay = 2560,
@@ -4645,6 +4676,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "rocktech,rk101ii01d-ct",
 		.data = &rocktech_rk101ii01d_ct,
 	}, {
+		.compatible = "samsung,atna33xc20",
+		.data = &samsung_atna33xc20,
+	}, {
 		.compatible = "samsung,lsn122dl01-c01",
 		.data = &samsung_lsn122dl01_c01,
 	}, {
-- 
2.7.4

