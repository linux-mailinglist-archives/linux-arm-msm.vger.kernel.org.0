Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A50397D35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 01:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbhFAXwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 19:52:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37470 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235217AbhFAXwE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 19:52:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622591422; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9xh6n6GHVdcIYXWa7pi+x0KJzFHvM0ecBCbRhg1PzGs=; b=bGWTRHd5ztiWa4z7C8Ett9rOOms6Kor7qoSBSbv2fN+tx/MSnS8U4b7hpV0ETXOTwmR2LZTW
 3iVf5xw1tPQXjmeE9espRYgB8DV+T2PphhYgj5XZOIqGbZD/4wLBbfSgoiQdA34SJ1o0G7fL
 mpfI6TaL8M5rcZgUvf/sa9Dxpuw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60b6c7b88491191eb3ba32ad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Jun 2021 23:50:16
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F689C43145; Tue,  1 Jun 2021 23:50:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3C59C433F1;
        Tue,  1 Jun 2021 23:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3C59C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/msm/dp: power off DP phy at suspend
Date:   Tue,  1 Jun 2021 16:50:08 -0700
Message-Id: <1622591408-5465-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Normal DP suspend operation contains two steps, display off followed
by dp suspend, to complete system wide suspending cycle if display is
up at that time. In this case, DP phy will be powered off at display
off. However there is an exception case that depending on the timing
of dongle plug in during system wide suspending, sometimes display off
procedure may be skipped and dp suspend was called directly. In this
case, dp phy is stay at powered on (phy->power_count = 1) so that at
next resume dp driver crash at main link clock enable due to phy is
not physically powered on. This patch will call dp_ctrl_off_link_stream()
to tear down main link and power off phy at dp_pm_suspend() if main link
had been brought up.

Changes in V2:
-- stashed changes into dp_ctrl.c
-- add is_phy_on to monitor phy state

Changes in V3:
-- delete is_phy_on
-- call dp_ctrl_off_link_stream() from dp_pm_suspend()

Fixes: 0114f31a2903 ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly)
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
 drivers/gpu/drm/msm/dp/dp_power.c   | 15 +++++++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dbd8943..8324a453 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1414,6 +1414,7 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 	phy = dp_io->phy;
 
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+
 	phy_exit(phy);
 
 	DRM_DEBUG_DP("Host deinitialized successfully\n");
@@ -1457,6 +1458,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 		return ret;
 	}
 	phy_power_off(phy);
+
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
@@ -1488,6 +1490,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	}
 
 	phy_power_off(phy);
+
 	phy_exit(phy);
 
 	return 0;
@@ -1816,12 +1819,16 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret;
+	int ret = 0;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
+	/* main link is off */
+	if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM))
+		return ret;
+
 	/* set dongle to D3 (power off) mode */
 	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
 
@@ -1894,6 +1901,7 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	}
 
 	phy_power_off(phy);
+
 	phy_exit(phy);
 
 	DRM_DEBUG_DP("DP off done\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cdec0a3..5abd769 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1327,8 +1327,10 @@ static int dp_pm_suspend(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
-	if (dp->core_initialized == true)
+	if (dp->core_initialized == true) {
+		dp_ctrl_off_link_stream(dp->ctrl);
 		dp_display_host_deinit(dp);
+	}
 
 	dp->hpd_state = ST_SUSPENDED;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 9c4ea00..980924a9 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -262,6 +262,21 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 			}
 			dp_power->core_clks_on = true;
 		}
+	} else {
+		if (pm_type == DP_CORE_PM && !dp_power->core_clks_on) {
+			DRM_DEBUG_DP("core clks already disabled\n");
+			return 0;
+		}
+
+		if (pm_type == DP_CTRL_PM && !dp_power->link_clks_on) {
+			DRM_DEBUG_DP("links clks already disabled\n");
+			return 0;
+		}
+
+		if (pm_type == DP_STREAM_PM && !dp_power->stream_clks_on) {
+			DRM_DEBUG_DP("pixel clks already disabled\n");
+			return 0;
+		}
 	}
 
 	rc = dp_power_clk_set_rate(power, pm_type, enable);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

