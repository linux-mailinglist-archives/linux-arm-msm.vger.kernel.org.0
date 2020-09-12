Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886C6267C56
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 22:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgILUtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 16:49:55 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:63755 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725923AbgILUty (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 16:49:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599943793; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=EPGaxl9u3MncdDEJRKxKWdv0uToAnC3cEFQxwb+DE/s=; b=VT08bbBuOFuvi6FGZU8hpIrlwkDrGY7O0jw5xyWWSoJ8eufX9EjM/DvFAhuwrh2KFLviS9o2
 /qqWkMHu1qRqgJBjjROjU291PWbKbkwp7nDt6uUzbGE0cH2bX6BA1YSlYWC/DMxvnmmxVmu0
 mUJvmSmfQjs10o7dxyRVBVoMauw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f5d34717f21d51b308ef8bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 20:49:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E52AC43391; Sat, 12 Sep 2020 20:49:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CD846C433AF;
        Sat, 12 Sep 2020 20:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CD846C433AF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, cychiang@chromium.org,
        khsieh@codeaurora.org, vsujithk@codeaurora.org,
        rohitkr@codeaurora.org
Subject: [PATCH v6 4/5] drm/msm/dp: signal the hotplug disconnect in the event handler
Date:   Sat, 12 Sep 2020 13:49:31 -0700
Message-Id: <20200912204932.21232-5-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200912204932.21232-1-abhinavk@codeaurora.org>
References: <20200912204932.21232-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signal the hotplug disconnect event to the audio side in the
event handler so that they are notified earlier and have more
time to process the disconnect event.

Changes in v2: none
Changes in v3: none
Changes in v4: rebase on top of latest patchset of dependency
Changes in v5: rebase on top of latest patchset of dependency
Changes in v6: none

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f88ebfdf08bb..e3ad8793fd3f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -545,6 +545,13 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
+static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
+		bool plugged)
+{
+	if (dp_display->plugged_cb && dp_display->codec_dev)
+		dp_display->plugged_cb(dp_display->codec_dev, plugged);
+}
+
 static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 {
 	struct dp_usbpd *hpd = dp->usbpd;
@@ -590,6 +597,9 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* start sanity checking */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
+	/* signal the disconnect event early to ensure proper teardown */
+	dp_display_handle_plugged_change(g_dp_display, false);
+
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
 
@@ -780,13 +790,6 @@ static int dp_display_prepare(struct msm_dp *dp)
 	return 0;
 }
 
-static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
-		bool plugged)
-{
-	if (dp_display->plugged_cb && dp_display->codec_dev)
-		dp_display->plugged_cb(dp_display->codec_dev, plugged);
-}
-
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
@@ -1372,8 +1375,6 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	dp_ctrl_push_idle(dp_display->ctrl);
 
-	dp_display_handle_plugged_change(dp, false);
-
 	return 0;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

