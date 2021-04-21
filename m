Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B833675BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 01:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343725AbhDUXii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Apr 2021 19:38:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25277 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240968AbhDUXih (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Apr 2021 19:38:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619048283; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=KB6l0sPfRHgrwxPB3k63obMpYNPKc3Zmd4dna03Fo0U=; b=im3hmGWtRLg70nrNOSbu+HqnRO51RK0F7Je6MPOg0G3WervkjM0+Oc1OJC2nEwkIEsqupL6l
 wTr4eLpuEDUTiTcDzH5g+kx2IHidmlxYK01DdBbp9xmQP3b6XI6Ps/qDQ05/vFlW01TGCf3T
 NHK/d+9a9OzPxKr0o/lAh9eN/Ho=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6080b75bc39407c3279d59ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 23:38:03
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF2D5C433D3; Wed, 21 Apr 2021 23:38:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9CBEC433F1;
        Wed, 21 Apr 2021 23:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9CBEC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] drm/msm/dp: check sink_count before update is_connected status
Date:   Wed, 21 Apr 2021 16:37:35 -0700
Message-Id: <1619048258-8717-2-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
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

Changes in v4:
-- none

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

