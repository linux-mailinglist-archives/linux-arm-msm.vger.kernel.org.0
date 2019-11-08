Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C89F59DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 22:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbfKHV3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 16:29:16 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:34522 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfKHV3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 16:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573248551;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=RpCrO/BdsXbNks/Ok4F1Wqjf9N5GuN0H6cCDR5uSLF0=;
        b=igkw4JxgoHqN6InxGnzqHZ9zXYVMq1ZqM8A7zeEnnoM0Ttx0uhl8bkVv7W25FRvbqA
        O1KdbQxItp1KclbpDClQc0gjY91UHXUd+VtZtC5hkBpMdFLiz0SE9k1tYEtcohzp9vfa
        7eelcO7R1RkLb+uGBgg80rYwE/JipvDMyXMKkd/ybe5GUANNnQ4P5bYVqy91D0/mxthj
        O19dGS9cng0vo8BuIZ6vKSNcyoSa+kwzcQe/oRNZochgWN3cSwg7V96ipVeoO+UnrhuG
        vglKx2kBP7TY1eLx4b9gD/hDYy9VVk4EZMkhFeKAX3qKsIUOQEF4XmgGs39N2VwUtJhe
        1n9g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsMnvtxdYcg=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.29.0 AUTH)
        with ESMTPSA id e07688vA8LT6tLL
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 8 Nov 2019 22:29:06 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Hai Li <hali@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Jasper Korten <jja2000@gmail.com>
Subject: [PATCH] drm/msm/dsi: Delay drm_panel_enable() until dsi_mgr_bridge_enable()
Date:   Fri,  8 Nov 2019 22:28:40 +0100
Message-Id: <20191108212840.13586-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At the moment, the MSM DSI driver calls drm_panel_enable() rather early
from the DSI bridge pre_enable() function. At this point, the encoder
(e.g. MDP5) is not enabled, so we have not started transmitting
video data.

However, the drm_panel_funcs documentation states that enable()
should be called on the panel *after* video data is being transmitted:

  The .prepare() function is typically called before the display controller
  starts to transmit video data. [...] After the display controller has
  started transmitting video data, it's safe to call the .enable() function.
  This will typically enable the backlight to make the image on screen visible.

Calling drm_panel_enable() too early causes problems for some panels:
The TFT LCD panel used in the Samsung Galaxy Tab A 9.7 (2015) (APQ8016)
uses the MIPI_DCS_SET_DISPLAY_BRIGHTNESS command to control
backlight/brightness of the screen. The enable sequence is therefore:

  drm_panel_enable()
    drm_panel_funcs.enable():
      backlight_enable()
        backlight_ops.update_status():
          mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);

The panel seems to silently ignore the MIPI_DCS_SET_DISPLAY_BRIGHTNESS
command if it is sent too early. This prevents setting the initial brightness,
causing the display to be enabled with minimum brightness instead.
Adding various delays in the panel initialization code does not result
in any difference.

On the other hand, moving drm_panel_enable() to dsi_mgr_bridge_enable()
fixes the problem, indicating that the panel requires the video stream
to be active before the brightness command is accepted.

Therefore: Move drm_panel_enable() to dsi_mgr_bridge_enable() to
delay calling it until video data is being transmitted.

Move drm_panel_disable() to dsi_mgr_bridge_disable() for similar reasons.
(This is not strictly required for the panel affected above...)

Tested-by: Jasper Korten <jja2000@gmail.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Since this is a core change I thought it would be better to send this
early. I believe Jasper still wants to finish some other changes before
submitting the initial device tree for the Samsung Galaxy Tab A 9.7 (2015). ;)

I also tested it on msm8916-samsung-a5u-eur, its display is working fine
with or without this patch.
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 62 ++++++++++++++++++---------
 1 file changed, 41 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 271aa7bbca92..eea108865cd3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -432,20 +432,8 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 		}
 	}
 
-	if (panel) {
-		ret = drm_panel_enable(panel);
-		if (ret) {
-			pr_err("%s: enable panel %d failed, %d\n", __func__, id,
-									ret);
-			goto panel_en_fail;
-		}
-	}
-
 	return;
 
-panel_en_fail:
-	if (is_dual_dsi && msm_dsi1)
-		msm_dsi_host_disable(msm_dsi1->host);
 host1_en_fail:
 	msm_dsi_host_disable(host);
 host_en_fail:
@@ -464,12 +452,51 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 
 static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
 {
-	DBG("");
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct drm_panel *panel = msm_dsi->panel;
+	bool is_dual_dsi = IS_DUAL_DSI();
+	int ret;
+
+	DBG("id=%d", id);
+	if (!msm_dsi_device_connected(msm_dsi))
+		return;
+
+	/* Do nothing with the host if it is slave-DSI in case of dual DSI */
+	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
+		return;
+
+	if (panel) {
+		ret = drm_panel_enable(panel);
+		if (ret) {
+			pr_err("%s: enable panel %d failed, %d\n", __func__, id,
+									ret);
+		}
+	}
 }
 
 static void dsi_mgr_bridge_disable(struct drm_bridge *bridge)
 {
-	DBG("");
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct drm_panel *panel = msm_dsi->panel;
+	bool is_dual_dsi = IS_DUAL_DSI();
+	int ret;
+
+	DBG("id=%d", id);
+	if (!msm_dsi_device_connected(msm_dsi))
+		return;
+
+	/* Do nothing with the host if it is slave-DSI in case of dual DSI */
+	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
+		return;
+
+	if (panel) {
+		ret = drm_panel_disable(panel);
+		if (ret)
+			pr_err("%s: Panel %d OFF failed, %d\n", __func__, id,
+									ret);
+	}
 }
 
 static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
@@ -495,13 +522,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
 		goto disable_phy;
 
-	if (panel) {
-		ret = drm_panel_disable(panel);
-		if (ret)
-			pr_err("%s: Panel %d OFF failed, %d\n", __func__, id,
-									ret);
-	}
-
 	ret = msm_dsi_host_disable(host);
 	if (ret)
 		pr_err("%s: host %d disable failed, %d\n", __func__, id, ret);
-- 
2.23.0

