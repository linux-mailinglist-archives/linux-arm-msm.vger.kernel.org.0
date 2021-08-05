Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136F83E1D8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 22:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241359AbhHEUq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 16:46:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59116 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241329AbhHEUq3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 16:46:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628196375; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ZxTP6JRziBe0d3OYdPu+QV7jsMwY92MwIt2M0EBJS6c=; b=RmTgkUrOowByKj6m+7v5Wa0p7M5XPxkYdt1Uji7tzuPn9fBhUVOoOvLI7VHDcJ93cV0BbTha
 bLpbFZOY5o13cd89F4hDDgPN1SRfqqpuJ4XVAFdsO90i7pmKppS4lHyTAUHIQ4rH8Zh/GD9n
 cWXuMYMp8AOZLNeiDMdJmCf/ASY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 610c4e02bcdc32aad3f07122 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 05 Aug 2021 20:45:54
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 02B08C4338A; Thu,  5 Aug 2021 20:45:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F1A1C4338A;
        Thu,  5 Aug 2021 20:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F1A1C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] drm/msm/dp: do not end dp link training until video is ready
Date:   Thu,  5 Aug 2021 13:44:55 -0700
Message-Id: <1628196295-7382-7-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize both pre-emphasis and voltage swing level to 0 before
start link training and do not end link training until video is
ready to reduce the period between end of link training and video
start to meet Link Layer CTS requirement.  Some dongle main link
symbol may become unlocked again if host did not end link training
soon enough after completion of link training 2. Host have to re
train main link if loss of symbol locked detected before end link
training so that the coming video stream can be transmitted to sink
properly. This fixes Link Layer CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3
and 4.3.2.4.

Changes in v3:
-- merge retrain link if loss of symbol locked happen into this patch
-- replace dp_ctrl_loss_symbol_lock() with dp_ctrl_channel_eq_ok()

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 56 +++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 0002805..ffed523 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1484,6 +1484,9 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 
 	dp_ctrl_push_idle(&ctrl->dp_ctrl);
 
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	ret = dp_ctrl_setup_main_link(ctrl, &training_step);
@@ -1636,6 +1639,16 @@ static bool dp_ctrl_clock_recovery_any_ok(
 	return drm_dp_clock_recovery_ok(link_status, reduced_cnt);
 }
 
+static bool dp_ctrl_channel_eq_ok(struct dp_ctrl_private *ctrl)
+{
+	u8 link_status[DP_LINK_STATUS_SIZE];
+	int num_lanes = ctrl->link->link_params.num_lanes;
+
+	dp_ctrl_read_link_status(ctrl, link_status);
+
+	return drm_dp_channel_eq_ok(link_status, num_lanes);
+}
+
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 {
 	int rc = 0;
@@ -1671,6 +1684,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
 
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
 	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (rc)
 		return rc;
@@ -1736,17 +1752,19 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
 		return rc;
 
-	/* stop txing train pattern */
-	dp_ctrl_clear_training_pattern(ctrl);
+	if (rc == 0) {  /* link train successfully */
+		/*
+		 * do not stop train pattern here
+		 * stop link training at on_stream
+		 * to pass compliance test
+		 */
+	} else  {
+		/*
+		 * link training failed
+		 * end txing train pattern here
+		 */
+		dp_ctrl_clear_training_pattern(ctrl);
 
-	/*
-	 * keep transmitting idle pattern until video ready
-	 * to avoid main link from loss of sync
-	 */
-	if (rc == 0)  /* link train successfully */
-		dp_ctrl_push_idle(dp_ctrl);
-	else  {
-		/* link training failed */
 		dp_ctrl_deinitialize_mainlink(ctrl);
 		rc = -ECONNRESET;
 	}
@@ -1754,9 +1772,15 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	return rc;
 }
 
+static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
+{
+	int training_step = DP_TRAINING_NONE;
+
+	return dp_ctrl_setup_main_link(ctrl, &training_step);
+}
+
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 {
-	u32 rate = 0;
 	int ret = 0;
 	bool mainlink_ready = false;
 	struct dp_ctrl_private *ctrl;
@@ -1766,10 +1790,6 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	rate = ctrl->panel->link_info.rate;
-
-	ctrl->link->link_params.rate = rate;
-	ctrl->link->link_params.num_lanes = ctrl->panel->link_info.num_lanes;
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
@@ -1784,6 +1804,12 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 		}
 	}
 
+	if (!dp_ctrl_channel_eq_ok(ctrl))
+		dp_ctrl_link_retrain(ctrl);
+
+	/* stop txing train pattern to end link training */
+	dp_ctrl_clear_training_pattern(ctrl);
+
 	ret = dp_ctrl_enable_stream_clocks(ctrl);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

