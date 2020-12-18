Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32C72DE899
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 18:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgLRRyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Dec 2020 12:54:43 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:32064 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgLRRyn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Dec 2020 12:54:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608314065; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YYl290DkREy/lRtl2VM9orfBQXbhw1Z4uAXWYwa7zm0=; b=RKIWDHnb2jnk1CbuCdxFqrNKylY6Of4TMbY4+w+ZUsYzMJ/G0JzMCslL/xQbNrVlMTr3Q06B
 YncyJLfouxitvA2/31Exyx9Ov9R/urZFUwoVl7232uA/n1A8GeZ0WK2pLsq10KUzOKWm+FN/
 HQMMv54LKWKwJyli845Po01rAjE=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fdcecb5065be8d835fde261 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 17:53:57
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 03D0CC43467; Fri, 18 Dec 2020 17:53:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B805C433CA;
        Fri, 18 Dec 2020 17:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B805C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        rnayak@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: postpone irq_hpd event during connection pending state
Date:   Fri, 18 Dec 2020 09:53:40 -0800
Message-Id: <1608314020-26791-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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

