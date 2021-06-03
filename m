Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5992839AEE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 01:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFCXvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 19:51:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63682 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229685AbhFCXvi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 19:51:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622764193; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=o1I/qHRsZyVY+hH5gJnA9ezwSvhf5J73xu0kbc1BX7o=; b=fOOGh435EAmA9W7G8DB0vkzVYsqYo53UyNiJBx1rrlSRynnQJR53qtq61jiSt2S8YNIESGeu
 yMJq2P0Tn/1pavHSEHXB7jFA4XtuTA4PnO+wNH0j+y4SiUivSK9tv9Nd9dg0bM9p9MHvOTO9
 QZaUbZ2yt8SpB71tH36hRFNGL+g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60b96a97ed59bf69cc0a880e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 23:49:43
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 662D0C4360C; Thu,  3 Jun 2021 23:49:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BF34BC433D3;
        Thu,  3 Jun 2021 23:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF34BC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5] drm/msm/dp: power off DP phy at suspend
Date:   Thu,  3 Jun 2021 16:49:34 -0700
Message-Id: <1622764174-10309-1-git-send-email-khsieh@codeaurora.org>
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

Changes in V4:
-- delete changes made at dp_power.c
-- move main link status checking to dp_pm_suspend

Changes in V5:
-- correct commit id at Fixes tag

Fixes: 8dbde399044b ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly)
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++----
 drivers/gpu/drm/msm/dp/dp_display.c |  7 ++++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dbd8943..caf71fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1827,10 +1827,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
-		return ret;
+	if (dp_power_clk_status(ctrl->power, DP_STREAM_PM)) {
+		ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
+		if (ret) {
+			DRM_ERROR("Failed to disable pclk. ret=%d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cdec0a3..9c59def 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1327,8 +1327,13 @@ static int dp_pm_suspend(struct device *dev)
 
 	mutex_lock(&dp->event_mutex);
 
-	if (dp->core_initialized == true)
+	if (dp->core_initialized == true) {
+		/* mainlink enabled */
+		if (dp_power_clk_status(dp->power, DP_CTRL_PM))
+			dp_ctrl_off_link_stream(dp->ctrl);
+
 		dp_display_host_deinit(dp);
+	}
 
 	dp->hpd_state = ST_SUSPENDED;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

