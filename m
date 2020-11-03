Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94DD82A5A53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 23:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730792AbgKCWyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 17:54:02 -0500
Received: from z5.mailgun.us ([104.130.96.5]:15553 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728972AbgKCWyC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 17:54:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604444041; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=55gI89+91wMi2hAGSuNb6Y1Kh4zFoFwgZSRDP0krykw=; b=t7bFwfeRlj7xqPrKR3TdPSnEoUySH0SErDhDaGui1m12L1bo3EhsljxS8GYAIlfGBkFS8EbI
 Mc5aQd4rxv55RSrReqLO1DTPPaF/u7+6Ex0VJjvgA142/juWw7V+PWCBQKfn8o//Ga6cZt/l
 i5fsFtgxhUzG9gPrGnAym6gB1So=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fa1df88b64b1c5b7897b381 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 22:54:00
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B1E5C433C6; Tue,  3 Nov 2020 22:54:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 08F45C433C6;
        Tue,  3 Nov 2020 22:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 08F45C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/msm/dp: fixes wrong connection state caused by failure of link train
Date:   Tue,  3 Nov 2020 14:53:36 -0800
Message-Id: <20201103225336.17141-3-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103225336.17141-1-khsieh@codeaurora.org>
References: <20201103225336.17141-1-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Connection state is not set correctly happen when either failure of link
train due to cable unplugged in the middle of aux channel reading or
cable plugged in while in suspended state. This patch fixes these problems.
This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.

Changes in V2:
-- Add more information to commit message.

Changes in V3:
-- change base

Changes in V4:
-- add Fixes tag

Fixes: 22688d4067f6 (drm/msm/dp: return correct connection status after suspend)
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  5 ++++
 2 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b5e7df481fc5..6e8640f8c69b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -45,7 +45,7 @@ enum {
 	ST_CONNECT_PENDING,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_SUSPEND_PENDING,
+	ST_DISPLAY_OFF,
 	ST_SUSPENDED,
 };
 
@@ -504,7 +504,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
-	if (state == ST_SUSPEND_PENDING) {
+	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -526,14 +526,14 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	hpd->hpd_high = 1;
 
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
-	if (ret) {	/* failed */
+	if (ret) {	/* link train failed */
 		hpd->hpd_high = 0;
 		dp->hpd_state = ST_DISCONNECTED;
+	} else {
+		/* start sentinel checking in case of missing uevent */
+		dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
 	}
 
-	/* start sanity checking */
-	dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
-
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -586,11 +586,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
-	if (state == ST_SUSPEND_PENDING) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_DISCONNECT_PENDING || state == ST_DISCONNECTED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -617,7 +612,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 */
 	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
 
-	/* start sanity checking */
+	/* start sentinel checking in case of missing uevent */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
 	/* signal the disconnect event early to ensure proper teardown */
@@ -657,7 +652,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	state =  dp->hpd_state;
-	if (state == ST_SUSPEND_PENDING) {
+	if (state == ST_DISPLAY_OFF) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1082,7 +1077,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		}
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			/* delete connect pending event first */
+			/* stop sentinel connect pending checking */
 			dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 		}
@@ -1213,13 +1208,10 @@ static int dp_pm_resume(struct device *dev)
 
 	status = dp_catalog_hpd_get_state_status(dp->catalog);
 
-	if (status) {
+	if (status)
 		dp->dp_display.is_connected = true;
-	} else {
+	else
 		dp->dp_display.is_connected = false;
-		/* make sure next resume host_init be called */
-		dp->core_initialized = false;
-	}
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -1241,6 +1233,9 @@ static int dp_pm_suspend(struct device *dev)
 
 	dp->hpd_state = ST_SUSPENDED;
 
+	/* host_init will be called at pm_resume */
+	dp->core_initialized = false;
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
@@ -1370,6 +1365,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
 
 	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
@@ -1388,7 +1384,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	state =  dp_display->hpd_state;
 
-	if (state == ST_SUSPEND_PENDING)
+	if (state == ST_DISPLAY_OFF)
 		dp_display_host_init(dp_display);
 
 	dp_display_enable(dp_display, 0);
@@ -1400,7 +1396,8 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		dp_display_unprepare(dp);
 	}
 
-	if (state == ST_SUSPEND_PENDING)
+	/* manual kick off plug event to train link */
+	if (state == ST_DISPLAY_OFF)
 		dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
 
 	/* completed connection */
@@ -1432,6 +1429,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
 	dp_display_disable(dp_display, 0);
@@ -1445,7 +1443,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 		/* completed disconnection */
 		dp_display->hpd_state = ST_DISCONNECTED;
 	} else {
-		dp_display->hpd_state = ST_SUSPEND_PENDING;
+		dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	mutex_unlock(&dp_display->event_mutex);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 18cec4fc5e0b..1b7a20dc2d8e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -196,6 +196,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 					      &panel->aux->ddc);
 	if (!dp_panel->edid) {
 		DRM_ERROR("panel edid read failed\n");
+		/* check edid read fail is due to unplug */
+		if (!dp_catalog_hpd_get_state_status(panel->catalog)) {
+			rc = -ETIMEDOUT;
+			goto end;
+		}
 
 		/* fail safe edid */
 		mutex_lock(&connector->dev->mode_config.mutex);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

