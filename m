Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07543D3DF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 18:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhGWQP2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 12:15:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37134 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbhGWQP2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 12:15:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627059361; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4Jh8RB4Zx8Eu8OD654fUwNUoNyzPUDpS4D4lwRoZtLY=; b=t9fW19oSh0TB4OCfLGe5MklcTc41h91lnYC3zgPEpawHrB3q1gaB/W2hQie+acPpnbL4NsSL
 79Nrd5mfN8t8NDk1teqfmDG1mKhYN79FclkXv5qYq7B8wgpiicmDvA09zfUCq0BsI7HTEY4d
 DAlPv+wDSveKiew1+pxJ+xSYnQ0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60faf49496a66e66b2a00849 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 16:55:48
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6836CC43460; Fri, 23 Jul 2021 16:55:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2671BC43151;
        Fri, 23 Jul 2021 16:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2671BC43151
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dp: signal audio plugged change at dp_pm_resume
Date:   Fri, 23 Jul 2021 09:55:39 -0700
Message-Id: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a scenario that dp cable is unplugged from DUT during system
suspended  will cause audio option state does not match real connection
state. Fix this problem by Signaling audio plugged change with realtime
connection status at dp_pm_resume() so that audio option will be in
correct state after system resumed.

Changes in V2:
-- correct Fixes tag commit id.

Fixes: f591dbb5fb8c ("drm/msm/dp: power off DP phy at suspend")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 78c5301..2b660e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1339,6 +1339,10 @@ static int dp_pm_resume(struct device *dev)
 	else
 		dp->dp_display.is_connected = false;
 
+	dp_display_handle_plugged_change(g_dp_display,
+				dp->dp_display.is_connected);
+
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

