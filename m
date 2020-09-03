Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE53825CDF8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgICWos (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:44:48 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46265 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729318AbgICWor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:44:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599173086; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9JPxwE1RsWBBeDdNQgXEeWaibZ66lXnQpU+8hZ0Goy4=; b=F5UsaX36Pq76i0RKEZkW3EIp00G+LVLZX4c0tG5GweEUJRIbWKLoY7XaXi9AQeawQr+qwxOL
 90NFHZa/5QswIcwwswjJybzf//H29ijNSMkiLir7f61K1ExqV2vwf4CDXDbWr9dD+vOP5fm/
 iHD2bZMSrv6fphZ+/h9LNpTzpVc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f5171a773afa3417e2dcd33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 22:43:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48AD4C43391; Thu,  3 Sep 2020 22:43:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 253F8C433A1;
        Thu,  3 Sep 2020 22:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 253F8C433A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org
Subject: [PATCH 4/4] drm/msm/dp: remove mode hard-coding in case of DP CTS
Date:   Thu,  3 Sep 2020 15:43:28 -0700
Message-Id: <20200903224328.26452-5-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200903224328.26452-1-abhinavk@codeaurora.org>
References: <20200903224328.26452-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No need to fix the number of resolutions to one during the video
pattern CTS test. The userspace test client will handle both
the hotplug as well as picking the right resolution for the test.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  3 --
 drivers/gpu/drm/msm/dp/dp_link.c    |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 46 +----------------------------
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2c20898ce77b..bc6560e875aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -419,10 +419,7 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 static void dp_display_handle_video_request(struct dp_display_private *dp)
 {
 	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN) {
-		/* force disconnect followed by connect */
-		dp->usbpd->connect(dp->usbpd, false);
 		dp->panel->video_test = true;
-		dp->usbpd->connect(dp->usbpd, true);
 		dp_link_send_test_response(dp->link);
 	}
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 3cbae92deff0..ac0e1daea913 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1059,8 +1059,8 @@ int dp_link_process_request(struct dp_link *dp_link)
 	}
 
 	if (dp_link_is_video_pattern_requested(link)) {
+		ret = 0;
 		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
-		return -EINVAL;
 	}
 
 	if (dp_link_is_audio_pattern_requested(link)) {
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7cdf37c525d8..1515217395a4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -128,46 +128,6 @@ static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
 	return bpp;
 }
 
-static void dp_panel_set_test_mode(struct dp_panel_private *panel,
-		struct dp_display_mode *mode)
-{
-	struct drm_display_mode *drm_mode = NULL;
-	struct dp_link_test_video *test_info = NULL;
-
-	drm_mode = &mode->drm_mode;
-	test_info = &panel->link->test_video;
-
-	drm_mode->hdisplay = test_info->test_h_width;
-	drm_mode->hsync_start = drm_mode->hdisplay + test_info->test_h_total -
-			(test_info->test_h_start + test_info->test_h_width);
-	drm_mode->hsync_end = drm_mode->hsync_start +
-				test_info->test_hsync_width;
-	drm_mode->htotal = drm_mode->hsync_end + test_info->test_h_start -
-						test_info->test_hsync_width;
-
-	drm_mode->vdisplay = test_info->test_v_height;
-	drm_mode->vsync_start = drm_mode->vdisplay + test_info->test_v_total -
-			(test_info->test_v_start + test_info->test_v_height);
-	drm_mode->vsync_end = drm_mode->vsync_start +
-				test_info->test_vsync_width;
-	drm_mode->vtotal = drm_mode->vsync_end + test_info->test_v_start -
-						test_info->test_vsync_width;
-
-	drm_mode->clock = test_info->test_h_total *
-		test_info->test_v_total * test_info->test_rr_n;
-
-	drm_mode->type = 0x48;
-	drm_mode_set_name(drm_mode);
-
-	if (test_info->test_rr_d == 0)
-		drm_mode->clock /= 1000;
-	else
-		drm_mode->clock /= 1001;
-
-	if (test_info->test_h_width == 640)
-		drm_mode->clock = 25170;
-}
-
 static int dp_panel_update_modes(struct drm_connector *connector,
 	struct edid *edid)
 {
@@ -294,12 +254,8 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
 
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 
-	if (dp_panel->video_test) {
-		dp_panel_set_test_mode(panel, mode);
-		return 1;
-	} else if (dp_panel->edid) {
+	if (dp_panel->edid)
 		return dp_panel_update_modes(connector, dp_panel->edid);
-	}
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

