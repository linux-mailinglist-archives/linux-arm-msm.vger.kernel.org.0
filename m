Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A5935FCEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 23:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhDNVDf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 17:03:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55832 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229974AbhDNVDb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 17:03:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618434189; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZBsaLR2ssrAtJHLK4RRToa5+BuTVs/Oj8QEQl6/nf5c=; b=Lq1lNwBcHfiDXkRavp4zn/62l56Iyx2bgu2+6j9xpOSWCMpIO9AP/IbkJw6GgfzRnRczRie3
 E9Z5r9aD9cDEUBEo+sKJbshslDZXi9AWDWfkfPi3damj5VtGxHtlmvocwMTbhnxOgkWAkemW
 CADXA2MmwyzeFiUSzlBsbjDjGK4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 607758838166b7eff74aa1f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Apr 2021 21:02:59
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6364CC43465; Wed, 14 Apr 2021 21:02:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D6CEC43461;
        Wed, 14 Apr 2021 21:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D6CEC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/msm/dp: initialize audio_comp when audio starts
Date:   Wed, 14 Apr 2021 14:02:50 -0700
Message-Id: <1618434170-28302-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize audio_comp when audio starts and wait for audio_comp at
dp_display_disable(). This will take care of both dongle unplugged
and display off (suspend) cases.

Changes in v2:
-- add dp_display_start_audio()

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 82a8673..52994f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -527,6 +527,7 @@ int dp_audio_hw_params(struct device *dev,
 	dp_audio_setup_acr(audio);
 	dp_audio_safe_to_exit_level(audio);
 	dp_audio_enable(audio, true);
+	dp_display_start_audio(dp_display);
 	dp_display->audio_enabled = true;
 
 end:
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0ba71c7..8a69bcd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -177,6 +177,14 @@ static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
 
 	return 0;
 }
+void dp_display_start_audio(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	reinit_completion(&dp->audio_comp);
+}
 
 void dp_display_signal_audio_complete(struct msm_dp *dp_display)
 {
@@ -648,10 +656,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* start sentinel checking in case of missing uevent */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
-	/* signal the disconnect event early to ensure proper teardown */
-	reinit_completion(&dp->audio_comp);
-	dp_display_handle_plugged_change(g_dp_display, false);
-
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
 
@@ -894,7 +898,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		/* signal the disconnect event */
-		reinit_completion(&dp->audio_comp);
 		dp_display_handle_plugged_change(dp_display, false);
 		if (!wait_for_completion_timeout(&dp->audio_comp,
 				HZ * 5))
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6092ba1..55fe0d4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -34,6 +34,7 @@ int dp_display_get_modes(struct msm_dp *dp_display,
 int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
+void dp_display_start_audio(struct msm_dp *dp_display);
 void dp_display_signal_audio_complete(struct msm_dp *dp_display);
 
 #endif /* _DP_DISPLAY_H_ */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

