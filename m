Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5377D2A5811
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 22:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732674AbgKCVsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 16:48:06 -0500
Received: from z5.mailgun.us ([104.130.96.5]:37364 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731850AbgKCUuq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 15:50:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604436645; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5kRPA0+9PXFcXYSZG2PKqN9+S/QTlTDWFVisCpDorbk=; b=eK70JBp4Gg0kSoHmrUbjo1xReP94qWUfbDJTBznB3mQFp1GVMBPE+gSJiXiACTQHyEuUDwKJ
 6Sftk+Y8qAQ0Ov6eXqCxK6qXRv5V3UC35ecgfxe5DCt+d5+3TgsFSIap8eonvaSWTuIbuHHE
 R3e48KxMbim1/ztKAPDBVA643ac=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fa1c25db79ce7b2cdb15504 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 20:49:33
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A1E7C384F9; Tue,  3 Nov 2020 20:49:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 333A8C384F2;
        Tue,  3 Nov 2020 20:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 333A8C384F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/msm/dp: deinitialize mainlink if link training failed
Date:   Tue,  3 Nov 2020 12:49:00 -0800
Message-Id: <20201103204902.11899-2-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103204902.11899-1-khsieh@codeaurora.org>
References: <20201103204902.11899-1-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DP compo phy have to be enable to start link training. When
link training failed phy need to be disabled so that next
link traning can be proceed smoothly at next plug in. This
patch de-initialize mainlink to disable phy if link training
failed. This prevent system crash due to
disp_cc_mdss_dp_link_intf_clk stuck at "off" state.  This patch
also perform checking power_on flag at dp_display_enable() and
dp_display_disable() to avoid crashing when unplug cable while
display is off.

Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused by failure of link training)
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 40 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 5 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4963bfe6a472..c2fe0009b092 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -572,7 +572,7 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
-u32 dp_catalog_hpd_get_state_status(struct dp_catalog *dp_catalog)
+u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6d257dbebf29..176a9020a520 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -97,7 +97,7 @@ void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 			u32 intr_mask, bool en);
 void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
-u32 dp_catalog_hpd_get_state_status(struct dp_catalog *dp_catalog);
+u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
 int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cee161c8ecc6..c7af040ce252 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1468,6 +1468,30 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
+static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
+{
+	struct dp_io *dp_io;
+	struct phy *phy;
+	int ret;
+
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
+
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	if (ret) {
+		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
+	}
+
+	phy_power_off(phy);
+	phy_exit(phy);
+
+	return 0;
+}
+
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
@@ -1648,8 +1672,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	if (rc)
 		return rc;
 
-	while (--link_train_max_retries &&
-		!atomic_read(&ctrl->dp_ctrl.aborted)) {
+	while (--link_train_max_retries) {
 		rc = dp_ctrl_reinitialize_mainlink(ctrl);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n",
@@ -1664,6 +1687,10 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
+			if (!dp_catalog_link_is_connected(ctrl->catalog)) {
+				break;
+			}
+
 			rc = dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
 				if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
@@ -1683,6 +1710,10 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			}
 		} else if (training_step == DP_TRAINING_2) {
 			/* link train_2 failed, lower lane rate */
+			if (!dp_catalog_link_is_connected(ctrl->catalog)) {
+				break;
+			}
+
 			rc = dp_ctrl_link_lane_down_shift(ctrl);
 			if (rc < 0) {
 				/* end with failure */
@@ -1703,6 +1734,11 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	 */
 	if (rc == 0)  /* link train successfully */
 		dp_ctrl_push_idle(dp_ctrl);
+	else  {
+		/* link training failed */
+		dp_ctrl_deinitialize_mainlink(ctrl);
+		rc = -ECONNRESET;
+	}
 
 	return rc;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3eb0d428abf7..0c0573ad34e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -529,6 +529,11 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	if (ret) {	/* link train failed */
 		hpd->hpd_high = 0;
 		dp->hpd_state = ST_DISCONNECTED;
+
+		if (ret == -ECONNRESET) { /* cable unplugged */
+			dp->core_initialized = false;
+		}
+
 	} else {
 		/* start sentinel checking in case of missing uevent */
 		dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
@@ -794,6 +799,11 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
+	if (dp_display->power_on) {
+		DRM_DEBUG_DP("Link already setup, return\n");
+		return 0;
+	}
+
 	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		dp_display->power_on = true;
@@ -826,6 +836,9 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
+	if (!dp_display->power_on)
+		return 0;
+
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		if (!wait_for_completion_timeout(&dp->audio_comp,
@@ -1198,7 +1211,7 @@ static int dp_pm_resume(struct device *dev)
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
-	status = dp_catalog_hpd_get_state_status(dp->catalog);
+	status = dp_catalog_link_is_connected(dp->catalog);
 
 	if (status)
 		dp->dp_display.is_connected = true;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 1b7a20dc2d8e..97dca3e378b7 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -197,7 +197,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	if (!dp_panel->edid) {
 		DRM_ERROR("panel edid read failed\n");
 		/* check edid read fail is due to unplug */
-		if (!dp_catalog_hpd_get_state_status(panel->catalog)) {
+		if (!dp_catalog_link_is_connected(panel->catalog)) {
 			rc = -ETIMEDOUT;
 			goto end;
 		}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

