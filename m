Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A6F28E520
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 19:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgJNRMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 13:12:42 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:58926 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbgJNRMm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 13:12:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602695561; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=OuCre6+aS5WFYiwtz7N3qvO2ZE+HL6JDE7p8LkMtjN8=; b=v8wlDLO7eSdjaauPOmlzO15QWaj9wMpKRJSucn4IzDWLXn9Q1kR2mrp8W2okBFEGFY1F7rWb
 vUSRVqPsIiRSjQ/n6niNZLijK0Bu/Z6NXMFhW6oNAljp6zaY3sc4G3SOXNASJ1+fTSjzbzX3
 r80YZozpiqWYqyMPxlB7TcjK88o=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f873143aad2c3cd1c415967 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 17:11:31
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C833C43385; Wed, 14 Oct 2020 17:11:31 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B82DC433C9;
        Wed, 14 Oct 2020 17:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B82DC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/msm/dp: fixes wrong connection state caused by failure of link train
Date:   Wed, 14 Oct 2020 10:11:23 -0700
Message-Id: <20201014171123.30167-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
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
index cb92d0c61a2f..c0665a0a4c78 100644
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
 
@@ -503,7 +503,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
-	if (state == ST_SUSPEND_PENDING) {
+	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -525,14 +525,14 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
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
@@ -577,11 +577,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
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
@@ -608,7 +603,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 */
 	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
 
-	/* start sanity checking */
+	/* start sentinel checking in case of missing uevent */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
 	/* signal the disconnect event early to ensure proper teardown */
@@ -648,7 +643,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	state =  dp->hpd_state;
-	if (state == ST_SUSPEND_PENDING) {
+	if (state == ST_DISPLAY_OFF) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1073,7 +1068,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		}
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			/* delete connect pending event first */
+			/* stop sentinel connect pending checking */
 			dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 		}
@@ -1204,13 +1199,10 @@ static int dp_pm_resume(struct device *dev)
 
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
 
@@ -1232,6 +1224,9 @@ static int dp_pm_suspend(struct device *dev)
 
 	dp->hpd_state = ST_SUSPENDED;
 
+	/* host_init will be called at pm_resume */
+	dp->core_initialized = false;
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
@@ -1361,6 +1356,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
 
 	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
@@ -1379,7 +1375,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	state =  dp_display->hpd_state;
 
-	if (state == ST_SUSPEND_PENDING)
+	if (state == ST_DISPLAY_OFF)
 		dp_display_host_init(dp_display);
 
 	dp_display_enable(dp_display, 0);
@@ -1391,7 +1387,8 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		dp_display_unprepare(dp);
 	}
 
-	if (state == ST_SUSPEND_PENDING)
+	/* manual kick off plug event to train link */
+	if (state == ST_DISPLAY_OFF)
 		dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
 
 	/* completed connection */
@@ -1423,6 +1420,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
 	dp_display_disable(dp_display, 0);
@@ -1436,7 +1434,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
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

base-commit: 22688d4067f675ee180a0ecd36d844d4a6530298
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

