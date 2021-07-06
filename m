Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD673BDC2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 19:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhGFRXn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 13:23:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20327 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230429AbhGFRXm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 13:23:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625592064; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OyrktUY8xuBcVLdu8RKhpqeY3cfsxuACo4UgdtkaGzU=; b=hVljp8y7/Csl/s4MppyfNrcyqwT5pWEaaqoTvw2jd/bwwRPNGKJxND29UHdjIu7IALt1WMF3
 EW0cPw0ci944dZ3AFZUSRP5USE8IGcAJ7dz/PTTC4QfmoYyow2idgVe9GVCwIfVj71V/QlDL
 qYoT5C8OxhL95+G6GQtFvhW/KkE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60e490f25e3e57240bcf53a0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 17:20:50
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93BF9C4323A; Tue,  6 Jul 2021 17:20:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72717C43460;
        Tue,  6 Jul 2021 17:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72717C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] drm/msm/dp: do not end dp link training until video is ready
Date:   Tue,  6 Jul 2021 10:20:19 -0700
Message-Id: <1625592020-22658-7-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize both pre-emphasis and voltage swing level to 0 before
start link training and do not end link training until video is
ready to reduce the period between end of link training and video
start to meet Link Layer CTS requirement.  This fixes Link Layer
CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3 and 4.3.2.4.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6f8443d..0cb01a9 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1490,6 +1490,9 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 
 	dp_ctrl_push_idle(&ctrl->dp_ctrl);
 
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	ret = dp_ctrl_setup_main_link(ctrl, cr_status, &training_step);
@@ -1692,6 +1695,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
 
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
 	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (rc)
 		return rc;
@@ -1751,17 +1757,19 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
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
@@ -1771,7 +1779,6 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 {
-	u32 rate = 0;
 	int ret = 0;
 	bool mainlink_ready = false;
 	struct dp_ctrl_private *ctrl;
@@ -1781,10 +1788,6 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	rate = ctrl->panel->link_info.rate;
-
-	ctrl->link->link_params.rate = rate;
-	ctrl->link->link_params.num_lanes = ctrl->panel->link_info.num_lanes;
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
@@ -1799,6 +1802,9 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 		}
 	}
 
+	/* stop txing train pattern to end link training */
+	dp_ctrl_clear_training_pattern(ctrl);
+
 	ret = dp_ctrl_enable_stream_clocks(ctrl);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

