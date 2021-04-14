Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1540835FCE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 23:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhDNVDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 17:03:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38774 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhDNVDH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 17:03:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618434166; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=NDFPUG8w+QVdc1ZKn+OX2p4Lkw+ii5Hbq+ynLwXvK3s=; b=kjSoBk9soBRvacb+oSQLCzAX/qi+0j3yiYy1dVoUkn5Qa+UDBzAwlInbEbmvROfr1IkPyOVM
 V9whJlRowWtTS5fWJmbj8USsQwVdk8Yr9M6IHsyheSdnN+Shy9VmrucHI9wj/K65fkVWp9ep
 VDBBeB8xn4RlNu/E68MSA9EwQNc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60775875febcffa80fbcc2d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Apr 2021 21:02:45
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61032C43461; Wed, 14 Apr 2021 21:02:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E1B8C433CA;
        Wed, 14 Apr 2021 21:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E1B8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/msm/dp: check sink_count before update is_connected status
Date:   Wed, 14 Apr 2021 14:02:34 -0700
Message-Id: <1618434154-28255-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Link status is different from display connected status in the case
of something like an Apple dongle where the type-c plug can be
connected, and therefore the link is connected, but no sink is
connected until an HDMI cable is plugged into the dongle.
The sink_count of DPCD of dongle will increase to 1 once an HDMI
cable is plugged into the dongle so that display connected status
will become true. This checking also apply at pm_resume.

Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and pm_resume")
Reported-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6..0ba71c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -586,10 +586,8 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
-	if (state == ST_CONNECT_PENDING) {
-		dp_display_enable(dp, 0);
+	if (state == ST_CONNECT_PENDING)
 		dp->hpd_state = ST_CONNECTED;
-	}
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -669,10 +667,8 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
-	if (state == ST_DISCONNECT_PENDING) {
-		dp_display_disable(dp, 0);
+	if (state == ST_DISCONNECT_PENDING)
 		dp->hpd_state = ST_DISCONNECTED;
-	}
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -1272,7 +1268,12 @@ static int dp_pm_resume(struct device *dev)
 
 	status = dp_catalog_link_is_connected(dp->catalog);
 
-	if (status)
+	/*
+	 * can not declared display is connected unless
+	 * HDMI cable is plugged in and sink_count of
+	 * dongle become 1
+	 */
+	if (status && dp->link->sink_count)
 		dp->dp_display.is_connected = true;
 	else
 		dp->dp_display.is_connected = false;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

