Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48148311345
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 22:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbhBEVQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 16:16:41 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:25493 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232789AbhBETDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 14:03:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612557916; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3BclvZ99xRNsYy0No6aROEDf6otnaYKYIumBhd5Kht8=; b=dsrwSuGWJ0IgjmniPicsSmlKevYphsdPo/YEGpVKZwq/J3DKOiazDNibk07DZpBbBhS9FrUH
 S4pnvGqdBzhHAMbx7NgAZyrmEdtOXTsDZ15OQ0RksI197jk/PT5ELYiHRkwbCllhKFOVVjJ6
 s9ReuqILwOP/WsmuLry49ikksaw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 601dae430bb8f50fb98af5d7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 20:44:51
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81287C43464; Fri,  5 Feb 2021 20:44:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B23E8C433CA;
        Fri,  5 Feb 2021 20:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B23E8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: reset dp controller only at boot up and pm_resume
Date:   Fri,  5 Feb 2021 12:44:38 -0800
Message-Id: <1612557878-19743-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DP_SW_RESET is the global SW reset that is used to initialize DP
controller. If DP_SW_RESET executed during connection setup,
two HPD related side effects may occurred,
1) pending HPD interrupts cleared unexpected
2) re start debounce logic which trigger another interrupt
This patch only issue DP_SW_RESET at boot up and pm_resume.
This patch also reinit video_comp before configure dp controller
to avoid missing VIDEO_READY interrupt.

Fixes: 9fc418430c65 ("drm/msm/dp: unplug interrupt missed after irq_hpd handler")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 22 +++++++++-------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 14 +++++++-------
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 55b7d0e..f8e75e2 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1296,8 +1296,6 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	 * transitioned to PUSH_IDLE. In order to start transmitting
 	 * a link training pattern, we have to first do soft reset.
 	 */
-	if (*training_step == DP_TRAINING_1)
-		dp_catalog_ctrl_reset(ctrl->catalog);
 
 	ret = dp_ctrl_link_train(ctrl, cr, training_step);
 
@@ -1366,7 +1364,7 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
+int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
@@ -1383,6 +1381,9 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
 
 	ctrl->dp_ctrl.orientation = flip;
 
+	if (reset)
+		dp_catalog_ctrl_reset(ctrl->catalog);
+
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
@@ -1492,18 +1493,14 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	return 0;
 }
 
-static void dp_ctrl_link_idle_reset(struct dp_ctrl_private *ctrl)
-{
-	dp_ctrl_push_idle(&ctrl->dp_ctrl);
-	dp_catalog_ctrl_reset(ctrl->catalog);
-}
-
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
 	struct dp_cr_status cr;
 	int training_step = DP_TRAINING_NONE;
 
+	dp_ctrl_push_idle(&ctrl->dp_ctrl);
+
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	ret = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
@@ -1630,7 +1627,6 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_TRAINING) {
 		dp_link_send_test_response(ctrl->link);
-		dp_ctrl_link_idle_reset(ctrl);
 		if (dp_ctrl_link_maintenance(ctrl)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
@@ -1684,7 +1680,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			break;
 		}
 
-		training_step = DP_TRAINING_1;
+		training_step = DP_TRAINING_NONE;
 		rc = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
@@ -1792,14 +1788,14 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 	 * Set up transfer unit values and set controller state to send
 	 * video.
 	 */
+	reinit_completion(&ctrl->video_comp);
+
 	dp_ctrl_configure_source_params(ctrl);
 
 	dp_catalog_ctrl_config_msa(ctrl->catalog,
 		ctrl->link->link_params.rate,
 		ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
 
-	reinit_completion(&ctrl->video_comp);
-
 	dp_ctrl_setup_tr_unit(ctrl);
 
 	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f60ba93..a836bd3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,7 @@ struct dp_ctrl {
 	u32 pixel_rate;
 };
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip);
+int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
 void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d9216f8..5a39da6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -350,7 +350,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	return rc;
 }
 
-static void dp_display_host_init(struct dp_display_private *dp)
+static void dp_display_host_init(struct dp_display_private *dp, int reset)
 {
 	bool flip = false;
 
@@ -365,7 +365,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 	dp_display_set_encoder_mode(dp);
 
 	dp_power_init(dp->power, flip);
-	dp_ctrl_host_init(dp->ctrl, flip);
+	dp_ctrl_host_init(dp->ctrl, flip, reset);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
@@ -403,7 +403,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 		goto end;
 	}
 
-	dp_display_host_init(dp);
+	dp_display_host_init(dp, false);
 
 	/*
 	 * set sink to normal operation mode -- D0
@@ -700,7 +700,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	if (state == ST_CONNECT_PENDING) {
+	if (state == ST_CONNECT_PENDING || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
 		dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
 		mutex_unlock(&dp->event_mutex);
@@ -1012,7 +1012,7 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 static void dp_display_config_hpd(struct dp_display_private *dp)
 {
 
-	dp_display_host_init(dp);
+	dp_display_host_init(dp, true);
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
 	/* Enable interrupt first time
@@ -1266,7 +1266,7 @@ static int dp_pm_resume(struct device *dev)
 	dp->hpd_state = ST_DISCONNECTED;
 
 	/* turn on dp ctrl/phy */
-	dp_display_host_init(dp);
+	dp_display_host_init(dp, true);
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
@@ -1449,7 +1449,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	state =  dp_display->hpd_state;
 
 	if (state == ST_DISPLAY_OFF)
-		dp_display_host_init(dp_display);
+		dp_display_host_init(dp_display, true);
 
 	dp_display_enable(dp_display, 0);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

