Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C772E35CF2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 19:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239716AbhDLRFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 13:05:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51484 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243838AbhDLRDk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 13:03:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618247002; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TTWM4MVoGT/Cank+4XgJKBM2sorLT1dJwiBEtujGX0o=; b=JmY4zmHzGK93JLL2b3dmLQT0JEkwxYUKZwdaBi6JKUq3gnaojufeH/64NuU4uqmTI3pnO4lJ
 gKFp+B6Fl64FA/b3ofCKb5FrjXFGrs2Mg4HyCrGpNqJFynkKnBt9gkkD58UhjfDaD3Bc7M+y
 VF3SpCeynA/YqaVtHW3YgSEn9xw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60747d53f34440a9d4714e0c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Apr 2021 17:03:15
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81C6CC4346B; Mon, 12 Apr 2021 17:03:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5A36C43462;
        Mon, 12 Apr 2021 17:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5A36C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/msm/dp: check sink_count before update is_connected status
Date:   Mon, 12 Apr 2021 10:02:51 -0700
Message-Id: <1618246971-28754-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At pm_resume check link sisnk_count before update is_connected status
base on HPD real time link status. Also print out error message only
when either EV_CONNECT_PENDING_TIMEOUT or EV_DISCONNECT_PENDING_TIMEOUT
happen.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6..4992a049 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -587,7 +587,7 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 
 	state = dp->hpd_state;
 	if (state == ST_CONNECT_PENDING) {
-		dp_display_enable(dp, 0);
+		DRM_ERROR("EV_CONNECT_PENDING_TIMEOUT error\n");
 		dp->hpd_state = ST_CONNECTED;
 	}
 
@@ -670,7 +670,7 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
 
 	state =  dp->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-		dp_display_disable(dp, 0);
+		DRM_ERROR("EV_DISCONNECT_PENDING_TIMEOUT error\n");
 		dp->hpd_state = ST_DISCONNECTED;
 	}
 
@@ -1272,7 +1272,7 @@ static int dp_pm_resume(struct device *dev)
 
 	status = dp_catalog_link_is_connected(dp->catalog);
 
-	if (status)
+	if (status && dp->link->sink_count)
 		dp->dp_display.is_connected = true;
 	else
 		dp->dp_display.is_connected = false;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

