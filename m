Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D287141B390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 18:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241405AbhI1QN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 12:13:26 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54165 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241568AbhI1QN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 12:13:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632845506; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=egQWYMWS1uSTfo5noOmbI+I/vVEdRaRmixsKz9P1yHM=; b=PtYBfIyJ0g9i5UCXTdsyluyBzqaiJxY5LiYNTrZECZS8wsIg5DLxT5e3ogtWDhjQHK4Bx+I1
 /ybuJzqTg5jILi7xniun5ghClVhkEJux4WY4MY+eQS1w9baefvJgtPOUKS5waYjOi3KDX8mG
 DNtcgQDGlBgAMd5mj/ah3W9KmEQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61533ea8519bd8dcf00ec1dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 16:11:20
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D73AC4338F; Tue, 28 Sep 2021 16:11:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4747BC4338F;
        Tue, 28 Sep 2021 16:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4747BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: only signal audio when disconnected detected at dp_pm_resume
Date:   Tue, 28 Sep 2021 09:11:12 -0700
Message-Id: <1632845472-29276-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Only signal audio when disconnected detected at dp_pm_resume since
connected status will be signaled to audio at next plugin handler.

Fixes: 078867ce04ed ("drm/msm/dp: signal audio plugged change at dp_pm_resume")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0e543a03..6f13008 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1356,14 +1356,14 @@ static int dp_pm_resume(struct device *dev)
 	 * can not declared display is connected unless
 	 * HDMI cable is plugged in and sink_count of
 	 * dongle become 1
+	 * also only signal audio when disconnected
 	 */
-	if (dp->link->sink_count)
+	if (dp->link->sink_count) {
 		dp->dp_display.is_connected = true;
-	else
+	} else {
 		dp->dp_display.is_connected = false;
-
-	dp_display_handle_plugged_change(g_dp_display,
-				dp->dp_display.is_connected);
+		dp_display_handle_plugged_change(g_dp_display, false);
+	}
 
 	DRM_DEBUG_DP("After, sink_count=%d is_connected=%d core_inited=%d power_on=%d\n",
 			dp->link->sink_count, dp->dp_display.is_connected,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

