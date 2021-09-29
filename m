Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE8641C9F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 18:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345539AbhI2QTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 12:19:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:22006 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245195AbhI2QTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 12:19:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632932243; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=NZF3/95G8ydfWP4E8Tlviqhl539BTdjyutBy9YAK7qA=; b=T9PYgFPcRQaar5vdm4fIPUdHgyKgW1hDVwopXSPvbkmv7nQlAscevooMDrOkIZDbI5jIwOIs
 nOTe3muUmGQbE6G4bs1AZaO+OPW1sbyyE7XC+ifgeETX00mtvymm3O12mli8akuP3gdVVBeO
 ETQsW0TjcIgq8XhJOvuJymaN7m8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61549188519bd8dcf0140f67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Sep 2021 16:17:12
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8D8DDC4338F; Wed, 29 Sep 2021 16:17:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 98D13C4338F;
        Wed, 29 Sep 2021 16:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 98D13C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dp: only signal audio when disconnected detected at dp_pm_resume
Date:   Wed, 29 Sep 2021 09:17:04 -0700
Message-Id: <1632932224-25102-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently there is audio not working problem after system resume from suspend
if hdmi monitor stay plugged in at DUT. However this problem does not happen
at normal operation but at a particular test case. The root cause is DP driver
signal audio with connected state at resume which trigger audio trying to setup
audio data path through DP main link but failed due to display port is not setup
and enabled by upper layer framework yet. This patch only have DP driver signal
audio only when DP is in disconnected state so that audio option shows correct
state after system resume. DP driver will not signal audio with connected state
until display enabled executed by upper layer framework where display port is
setup completed and main link is running.

Changes in V2:
-- add details commit text

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

