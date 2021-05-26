Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38851391EB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 20:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhEZSKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 14:10:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34029 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232141AbhEZSKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 14:10:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622052518; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HxYk/lGdOlTsW5690GzfF2FHmdp5htr82R0uRAzcAZ8=; b=n6NYRfAB/Z9OE82rwp6SDJCgLpq7sFxiBnNcaVGBQuhOeIO/cSf+ZBU/Bf2O7/muGeCNc2fE
 dLrlqQK/Ng7OH5e8Z2D++JUeHjfs4oJOLzehwZMFgTg7Oj71cbbugrwwR/HuO5KsxQBfFpjw
 KSwzIrZB9CT9XKoL3f0M0w8rLRs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60ae8ea2ceebd0e932c8659b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 May 2021 18:08:34
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9C713C433F1; Wed, 26 May 2021 18:08:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1A4CC4338A;
        Wed, 26 May 2021 18:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1A4CC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: power off DP phy base on mainlink status at suspend
Date:   Wed, 26 May 2021 11:08:23 -0700
Message-Id: <1622052503-21158-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DP mainlink can be either enabled or disabled at the time of suspend
happen. Therefore DP phy teared down at suspend should base on mainlink
status at that instance.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 5 ++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    | 2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++++++-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dbd8943..5115c05 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1398,7 +1398,7 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
  * Perform required steps to uninitialize DP controller
  * and its resources.
  */
-void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl, bool mainlink_on)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
@@ -1414,6 +1414,9 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 	phy = dp_io->phy;
 
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+	if (mainlink_on)
+		phy_power_off(phy);
+
 	phy_exit(phy);
 
 	DRM_DEBUG_DP("Host deinitialized successfully\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 25e4f75..a23ee2b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -20,7 +20,7 @@ struct dp_ctrl {
 };
 
 int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
-void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl, bool mainlink_on);
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cdec0a3..88eeeb5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -104,6 +104,8 @@ struct dp_display_private {
 
 	bool encoder_mode_set;
 
+	bool mainlink_on;
+
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
@@ -353,11 +355,14 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	dp_link_reset_phy_params_vx_px(dp->link);
+
+	dp->mainlink_on = false;
 	rc = dp_ctrl_on_link(dp->ctrl);
 	if (rc) {
 		DRM_ERROR("failed to complete DP link training\n");
 		goto end;
 	}
+	dp->mainlink_on = true;
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -392,7 +397,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		return;
 	}
 
-	dp_ctrl_host_deinit(dp->ctrl);
+	dp_ctrl_host_deinit(dp->ctrl, dp->mainlink_on);
 	dp_aux_deinit(dp->aux);
 	dp_power_deinit(dp->power);
 
@@ -941,6 +946,8 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 		dp->core_initialized = false;
 	}
 
+	dp->mainlink_on = false;
+
 	dp_display->power_on = false;
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

