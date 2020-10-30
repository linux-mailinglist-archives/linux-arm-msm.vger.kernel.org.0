Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9572A117D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Oct 2020 00:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgJ3XXF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 19:23:05 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:53736 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725681AbgJ3XXF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 19:23:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604100184; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=BLdO/YyUeVr9H8mVh5lP1ZN3Iw/7BuwJ8Kl9rrPhSww=; b=NrW6vF9C9uv/3o/vIY3Qugae0q4XWC6YzviKv4zbvF+XKljqidfag5cQBFE+VycOwPd9BX0F
 tKfmzXDklHdruLZctXG3+TScz4TuiK1RKqNfahcM2P0/DYZCDPF+BXDobvWTueB4swrlVG42
 eufeL6dnCdAIkxAsbgh2j9RgQDk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f9ca056d306da067489b46b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 23:23:02
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 284E1C433C6; Fri, 30 Oct 2020 23:23:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DACFC433C8;
        Fri, 30 Oct 2020 23:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DACFC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        rnayak@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: deinitialize mainlink if link training failedo
Date:   Fri, 30 Oct 2020 16:22:53 -0700
Message-Id: <20201030232253.11049-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DP compo phy have to be enable to start link training. When
link training failed phy need to be disabled so that next
link trainng can be proceed smoothly at next plug in. This
patch de initialize mainlink to disable phy if link training
failed. This prevent system crash due to
disp_cc_mdss_dp_link_intf_clk stuck at "off" state.  This patch
also perform checking power_on flag at dp_display_enable() and
dp_display_disable() to avoid crashing when unplug cable while
display is off.

Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused by failure of link train

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 34 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cee161c8ecc6..904698dfc7f7 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1468,6 +1468,29 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
+static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
+{
+	struct dp_io *dp_io;
+	struct phy *phy;
+	int ret = 0;
+
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
+
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	if (ret)
+		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
+
+	phy_power_off(phy);
+	phy_exit(phy);
+
+	return -ECONNRESET;
+}
+
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
@@ -1648,8 +1671,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	if (rc)
 		return rc;
 
-	while (--link_train_max_retries &&
-		!atomic_read(&ctrl->dp_ctrl.aborted)) {
+	while (--link_train_max_retries) {
 		rc = dp_ctrl_reinitialize_mainlink(ctrl);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n",
@@ -1664,6 +1686,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
+			if (!dp_catalog_hpd_get_state_status(ctrl->catalog))
+				break;		/* link cable unplugged */
+
 			rc = dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
 				if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
@@ -1683,6 +1708,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			}
 		} else if (training_step == DP_TRAINING_2) {
 			/* link train_2 failed, lower lane rate */
+			if (!dp_catalog_hpd_get_state_status(ctrl->catalog))
+				break;		/* link cable unplugged */
+
 			rc = dp_ctrl_link_lane_down_shift(ctrl);
 			if (rc < 0) {
 				/* end with failure */
@@ -1703,6 +1731,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	 */
 	if (rc == 0)  /* link train successfully */
 		dp_ctrl_push_idle(dp_ctrl);
+	else
+		rc = dp_ctrl_deinitialize_mainlink(ctrl);
 
 	return rc;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3eb0d428abf7..13b66266cd69 100644
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
+		return -EINVAL;
+
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		if (!wait_for_completion_timeout(&dp->audio_comp,

base-commit: fd4a29bed29b3d8f15942fdf77e7a0a52796d836
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

