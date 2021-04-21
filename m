Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F75D3675CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 01:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343738AbhDUXix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Apr 2021 19:38:53 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:21769 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343735AbhDUXix (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Apr 2021 19:38:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619048299; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bDLIYF1BF1IcvMFWzZJDmO+0WXbne8Vw3OeioD67y0A=; b=mxjHffodBLJloJkcAQ4hTvktCQcr/HdscPCDtIiU4u9Ej0hLbg6MNgYBaQ/7Ji4LrW9/PwBM
 ECqBUds2dOyq11f75HybVofBEywUsM1LkRcB/xWD6rw6djCKJTyjeNjtDMY48eXWCZ1F4QKF
 /ebafCRWvWPC0kqeGNkDUKdsdBY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6080b75ea817abd39ae0b6f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 23:38:06
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6256C4338A; Wed, 21 Apr 2021 23:38:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85745C433F1;
        Wed, 21 Apr 2021 23:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85745C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] drm/msm/dp: initialize audio_comp when audio starts
Date:   Wed, 21 Apr 2021 16:37:36 -0700
Message-Id: <1619048258-8717-3-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize audio_comp when audio starts and wait for audio_comp at
dp_display_disable(). This will take care of both dongle unplugged
and display off (suspend) cases.

Changes in v2:
-- add dp_display_signal_audio_start()

Changes in v3:
-- restore dp_display_handle_plugged_change() at dp_hpd_unplug_handle().

Changes in v4:
-- none

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++--
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 82a8673..d7e4a39 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -527,6 +527,7 @@ int dp_audio_hw_params(struct device *dev,
 	dp_audio_setup_acr(audio);
 	dp_audio_safe_to_exit_level(audio);
 	dp_audio_enable(audio, true);
+	dp_display_signal_audio_start(dp_display);
 	dp_display->audio_enabled = true;
 
 end:
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0ba71c7..1784e11 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -178,6 +178,15 @@ static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
 	return 0;
 }
 
+void dp_display_signal_audio_start(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	reinit_completion(&dp->audio_comp);
+}
+
 void dp_display_signal_audio_complete(struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
@@ -649,7 +658,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
 	/* signal the disconnect event early to ensure proper teardown */
-	reinit_completion(&dp->audio_comp);
 	dp_display_handle_plugged_change(g_dp_display, false);
 
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
@@ -894,7 +902,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		/* signal the disconnect event */
-		reinit_completion(&dp->audio_comp);
 		dp_display_handle_plugged_change(dp_display, false);
 		if (!wait_for_completion_timeout(&dp->audio_comp,
 				HZ * 5))
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6092ba1..5173c89 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -34,6 +34,7 @@ int dp_display_get_modes(struct msm_dp *dp_display,
 int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
+void dp_display_signal_audio_start(struct msm_dp *dp_display);
 void dp_display_signal_audio_complete(struct msm_dp *dp_display);
 
 #endif /* _DP_DISPLAY_H_ */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

