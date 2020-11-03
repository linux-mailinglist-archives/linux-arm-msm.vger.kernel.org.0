Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC0B2A5A01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 23:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729956AbgKCWVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 17:21:31 -0500
Received: from z5.mailgun.us ([104.130.96.5]:60365 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730219AbgKCWV3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 17:21:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604442089; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=W0KP3S/rQP1lRv49psq9hErusdS4mmhVznrrJG6JMis=; b=Xf+Qec+Q2U3vAUmcQlyLtOC8uty5h27ELHxLr1ytZ9EFniLda4Sno/YfITbl8FbWq4LURGNd
 U2b5hK2p/KkYt0KVJ+h1tylalCbVfvRkUlcwpPFfNTZ0cXvBg09bGU3Zf4atRuE7KpMqDc13
 8pY8gq/+a+qwkqWlqJXlGBky19U=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fa1d7af50440018cb8938ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 22:20:31
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73449C433FE; Tue,  3 Nov 2020 22:20:30 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 105BAC433F0;
        Tue,  3 Nov 2020 22:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 105BAC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 3/3] FROMLIST: drm/msm/dp: fixes wrong connection state caused by failure of link train
Date:   Tue,  3 Nov 2020 14:19:53 -0800
Message-Id: <20201103221953.3920-4-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103221953.3920-1-khsieh@codeaurora.org>
References: <20201103221953.3920-1-khsieh@codeaurora.org>
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

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
(am from https://lore.kernel.org/patchwork/patch/1320896/)
(also found at https://lore.kernel.org/r/20201013233544.5324-1-khsieh@codeaurora.org)

BUG=b:166844571, b:148864048, b:170279524
TEST=Connect and disconnect DP cable quick and slow with USE="debug"
     kernel on Lazor, see that the UI doesn't get confused and think it
     is connected when it isn't

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Change-Id: I00bfacc681a1685cf580841c7f066841363af450
Reviewed-on: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2447191
Reviewed-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Rob Clark <robdclark@chromium.org>
Commit-Queue: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 40 ++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  5 ++++
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index edae497da937..6e8640f8c69b 100644
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

