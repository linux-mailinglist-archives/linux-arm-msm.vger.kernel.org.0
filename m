Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44211281E0E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Oct 2020 00:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJBWJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 18:09:30 -0400
Received: from z5.mailgun.us ([104.130.96.5]:23841 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgJBWJ3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 18:09:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601676567; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=0j4dQZY0u2LJ/facFzkTgdQ/39lsQWG5m0bKxRloVQ4=; b=SAZV/bR8dFPNCA0fHN/1tThu9MT2Z14eYy6VzqNSIa/FPA4QRi+By3wEEKg0bDwa+TbgDwEx
 3AAS+jsbXcog9yopBdE8GH3j7DLQ6uMMiJ9sFDvMwhAj/WU+S4SAcvnax1yEUlTgdo1XfTAD
 w67flttJnDWY2kSFp9Td/OUPu6k=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f77a517ad37af35ecdebce0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Oct 2020 22:09:27
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3C43C433FE; Fri,  2 Oct 2020 22:09:26 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FB1DC433C8;
        Fri,  2 Oct 2020 22:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FB1DC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: fixes wrong connection state caused by failure of link train
Date:   Fri,  2 Oct 2020 15:09:19 -0700
Message-Id: <20201002220919.17245-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Connection state is set incorrectly happen at either failure of link train
or cable plugged in while suspended. This patch fixes these problems.
This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 52 ++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  5 +++
 2 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 431dff9de797..898c6cc1643a 100644
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
 
@@ -340,8 +340,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	}
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
-
-
 end:
 	return rc;
 }
@@ -489,7 +487,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state =  atomic_read(&dp->hpd_state);
-	if (state == ST_SUSPEND_PENDING) {
+	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -511,14 +509,14 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	hpd->hpd_high = 1;
 
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
-	if (ret) {	/* failed */
+	if (ret) {	/* link train failed */
 		hpd->hpd_high = 0;
 		atomic_set(&dp->hpd_state, ST_DISCONNECTED);
+	} else {
+		/* start sentinel checking in case of missing uevent */
+		dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
 	}
 
-	/* start sanity checking */
-	dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
-
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -563,10 +561,6 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state = atomic_read(&dp->hpd_state);
-	if (state == ST_SUSPEND_PENDING) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
 
 	if (state == ST_DISCONNECT_PENDING || state == ST_DISCONNECTED) {
 		mutex_unlock(&dp->event_mutex);
@@ -594,7 +588,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 */
 	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
 
-	/* start sanity checking */
+	/* start sentinel checking in case of missing uevent */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
 	/* signal the disconnect event early to ensure proper teardown */
@@ -634,7 +628,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	state =  atomic_read(&dp->hpd_state);
-	if (state == ST_SUSPEND_PENDING) {
+	if (state == ST_DISPLAY_OFF) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1067,7 +1061,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		}
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			/* delete connect pending event first */
+			/* delete sentinel connect pending checking */
 			dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 		}
@@ -1186,19 +1180,19 @@ static int dp_pm_resume(struct device *dev)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	/* start from dis connection state */
+	atomic_set(&dp->hpd_state, ST_DISCONNECTED);
+
 	dp_display_host_init(dp);
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
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
 
 	return 0;
 }
@@ -1214,6 +1208,9 @@ static int dp_pm_suspend(struct device *dev)
 	if (dp_display->power_on == true)
 		dp_display_disable(dp, 0);
 
+	/* host_init will be called at pm_resume */
+	dp->core_initialized = false;
+
 	atomic_set(&dp->hpd_state, ST_SUSPENDED);
 
 	return 0;
@@ -1343,6 +1340,9 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	/* delete sentinel checking */
+	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
+
 	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
@@ -1368,9 +1368,8 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		dp_display_unprepare(dp);
 	}
 
-	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
-
-	if (state == ST_SUSPEND_PENDING)
+	/* manual kick off plug event to train link */
+	if (state == ST_DISPLAY_OFF)
 		dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
 
 	/* completed connection */
@@ -1402,20 +1401,21 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	/* delete sentinel checking */
+	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
+
 	dp_display_disable(dp_display, 0);
 
 	rc = dp_display_unprepare(dp);
 	if (rc)
 		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
 
-	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
-
 	state =  atomic_read(&dp_display->hpd_state);
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
 	} else {
-		atomic_set(&dp_display->hpd_state, ST_SUSPEND_PENDING);
+		atomic_set(&dp_display->hpd_state, ST_DISPLAY_OFF);
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

base-commit: 6fa6fd6a3e2cb76f7d54220daa1266a94c13bc4d
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

