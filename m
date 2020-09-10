Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAE8264E47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 21:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgIJTJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 15:09:01 -0400
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:60572
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725833AbgIJTHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 15:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599764858;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=RkoZ/oXuRtlmzNNOC8LEKn94zfPSofAXL0dmWY+VaUE=;
        b=TuVWTSqnbZYJZGNW6wMrsY++tBRpOuDqywhOumAQ8CGNafZMJakPD2CFiE0lBsyV
        q26nXem9xV/ynbVN7uiSprVmJMQz6kJ59A3b8OS5vOmaSF1k8EgWdIgDCpixIfOzouv
        N73YFfL/nLqB6kc0yNPqVNRHR92UYaWPxcaaYBc8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599764858;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=RkoZ/oXuRtlmzNNOC8LEKn94zfPSofAXL0dmWY+VaUE=;
        b=OiH4mqeg372K0zuVLr1r0LKB+j72pQIiQ+QIeybD927/T6kfogensE574nAB4PRV
        xlkjMnJ47RvusWNdRwJQa86/+vbiVdwEG7D6zvDZzsmv9RBsFtFE2XoN8dFkPyEo3ev
        TmHZRowHI7HJUC2OzCUHgszoqKB3epJqd3uCKGVg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1F53C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        cychiang@chromium.org, khsieh@codeaurora.org,
        vsujithk@codeaurora.org, rohitkr@codeaurora.org
Subject: [PATCH v5 4/5] drm/msm/dp: signal the hotplug disconnect in the event handler
Date:   Thu, 10 Sep 2020 19:07:38 +0000
Message-ID: <01010174796a8550-d55450a4-801a-4832-a478-4fdf0f063bd3-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200910190718.13929-1-abhinavk@codeaurora.org>
References: <20200910190718.13929-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.10-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 43e5240a87ad..59ffdb8a1636 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -541,6 +541,13 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
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
@@ -586,6 +593,9 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* start sanity checking */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
+	/* signal the disconnect event early to ensure proper teardown */
+	dp_display_handle_plugged_change(g_dp_display, false);
+
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
 
@@ -776,13 +786,6 @@ static int dp_display_prepare(struct msm_dp *dp)
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
@@ -1344,8 +1347,6 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	dp_ctrl_push_idle(dp_display->ctrl);
 
-	dp_display_handle_plugged_change(dp, false);
-
 	return 0;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

