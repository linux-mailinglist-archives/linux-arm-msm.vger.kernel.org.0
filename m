Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5862EE6EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 21:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbhAGUcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 15:32:05 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:58506 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbhAGUcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 15:32:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610051504; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YYl290DkREy/lRtl2VM9orfBQXbhw1Z4uAXWYwa7zm0=; b=Ib1jTekcFPMi7DcKh6t6BYZaYTDBfJxDV9/vPBxgOgfyKjv5c/41/kerCK/L1d9M/8Z7bI5q
 mCSbxzUftBP0sgWBdMQmxec681f7IzlHCTGfNXjhSOUdUCf9G6poKs0wCeqoqPwDR5AYq5L1
 G6q6DsexovClLG0gNkWS7eGaMd8=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ff76f8c9f9cd523442555e3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 20:31:08
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A7EFC43461; Thu,  7 Jan 2021 20:31:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5603C433CA;
        Thu,  7 Jan 2021 20:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5603C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection pending state
Date:   Thu,  7 Jan 2021 12:30:24 -0800
Message-Id: <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
References: <y>
 <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

irq_hpd event can only be executed at connected state. Therefore
irq_hpd event should be postponed if it happened at connection
pending state. This patch also make sure both link rate and lane
are valid before start link training.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6e971d5..3bc7ed2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -693,6 +693,13 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
+	if (state == ST_CONNECT_PENDING) {
+		/* wait until ST_CONNECTED */
+		dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		mutex_unlock(&dp->event_mutex);
+		return 0;
+	}
+
 	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
 	if (ret == -ECONNRESET) { /* cable unplugged */
 		dp->core_initialized = false;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 97dca3e..d1780bc 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -167,12 +167,18 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 
 	rc = dp_panel_read_dpcd(dp_panel);
+	if (rc) {
+		DRM_ERROR("read dpcd failed %d\n", rc);
+		return rc;
+	}
+
 	bw_code = drm_dp_link_rate_to_bw_code(dp_panel->link_info.rate);
-	if (rc || !is_link_rate_valid(bw_code) ||
+	if (!is_link_rate_valid(bw_code) ||
 			!is_lane_count_valid(dp_panel->link_info.num_lanes) ||
 			(bw_code > dp_panel->max_bw_code)) {
-		DRM_ERROR("read dpcd failed %d\n", rc);
-		return rc;
+		DRM_ERROR("Illegal link rate=%d lane=%d\n", dp_panel->link_info.rate,
+				dp_panel->link_info.num_lanes);
+		return -EINVAL;
 	}
 
 	if (dp_panel->dfp_present) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

