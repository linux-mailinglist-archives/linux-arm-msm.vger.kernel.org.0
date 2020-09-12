Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D111267C7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 23:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgILVIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 17:08:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31480 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgILVIg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 17:08:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599944914; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TSUFtB5gtnposCPj63oq+AuGfEpg2L3r3I5y25fAIDo=; b=u02tC3nnIMFARqtiUkC+ZtYVorgE80Y//EezQDDkT1zF5FGyYOmgQaTs9qgrfoIssKaESK73
 lB0Gn7bEbJw9AnYxdTUK5d9360wT27gMTUB+mZmhSkUngpGxUqy5BvXi3z676kYwizOMVqpw
 phAZjqqQDvf8mBvw5JqcddIWAqs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f5d38d2238e1efa37da658b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 21:08:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49E6FC433F0; Sat, 12 Sep 2020 21:08:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E651C433FF;
        Sat, 12 Sep 2020 21:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0E651C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org
Subject: [PATCH v2 4/4] drm/msm/dp: remove mode hard-coding in case of DP CTS
Date:   Sat, 12 Sep 2020 14:08:15 -0700
Message-Id: <20200912210815.19726-5-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200912210815.19726-1-abhinavk@codeaurora.org>
References: <20200912210815.19726-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No need to fix the number of resolutions to one during the video
pattern CTS test. The userspace test client will handle both
the hotplug as well as picking the right resolution for the test.

Changes in v2: rebase on top of latest patchset of dependency

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  3 --
 drivers/gpu/drm/msm/dp/dp_link.c    |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 46 +----------------------------
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 646303fc2935..1fe951f3d676 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -426,10 +426,7 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
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

