Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A402F52F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 20:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbhAMTBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 14:01:44 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:38207 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbhAMTBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 14:01:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610564482; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2qvIDKz7dSKSYNdFgaxyYw/xVvDnRfMTjpt+R3u9K2U=; b=HHu7A8dkHvTodTZyPlcLsrIOEbIL0jAH9IWW95VqbwMHEQ9RtoZzqdVAhJ2v2LpsZLiFDMHx
 1Usy/NjFbj2JTDufZrY9aFjlCq2MyEz8Ffz/OW0WNPsQCyRYmmaNQPjTmUOfv8VF3Z9cR11y
 kKpcQrS225JNzpV1hEdgs3GRUq0=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fff435de53eb5da8c8dab13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 19:00:45
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F05CCC43461; Wed, 13 Jan 2021 19:00:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6FD27C433C6;
        Wed, 13 Jan 2021 19:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6FD27C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/msm/dp: unplug interrupt missed after irq_hpd handler
Date:   Wed, 13 Jan 2021 11:00:00 -0800
Message-Id: <1610564400-29788-3-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
References: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is HPD unplug interrupts missed at scenario of an irq_hpd
followed by unplug interrupts with around 10 ms in between.
Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
irq_hpd handler should not issues either aux or sw reset to avoid
following unplug interrupt be cleared accidentally. This patch
also postpone handling of irq_hpd until connected state if it
happened at connection pending state.

Changes in V2:
-- add postpone handling of irq_hpd until connected state
-- check DP_TRAINING_1 instead of DP_TRAINING_NONE

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |  7 -------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 15 ++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.c |  7 +++++++
 4 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 19b35ae..1c6e1d2 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -336,7 +336,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ssize_t ret;
 	int const aux_cmd_native_max = 16;
 	int const aux_cmd_i2c_max = 128;
-	int const retry_count = 5;
 	struct dp_aux_private *aux = container_of(dp_aux,
 		struct dp_aux_private, dp_aux);
 
@@ -378,12 +377,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ret = dp_aux_cmd_fifo_tx(aux, msg);
 
 	if (ret < 0) {
-		if (aux->native) {
-			aux->retry_cnt++;
-			if (!(aux->retry_cnt % retry_count))
-				dp_catalog_aux_update_cfg(aux->catalog);
-			dp_catalog_aux_reset(aux->catalog);
-		}
 		usleep_range(400, 500); /* at least 400us to next try */
 		goto unlock_exit;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 44f0c57..b1a9b1b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
 	return 0;
 }
 
+/**
+ * dp_catalog_aux_reset() - reset AUX controller
+ *
+ * @aux: DP catalog structure
+ *
+ * return: void
+ *
+ * This function reset AUX controller
+ *
+ * NOTE: reset AUX controller will also clear any pending HPD related interrupts
+ * 
+ */
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
 {
 	u32 aux_ctrl;
@@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 	return 0;
 }
 
+/**
+ * dp_catalog_ctrl_reset() - reset DP controller
+ *
+ * @dp_catalog: DP catalog structure
+ *
+ * return: void
+ *
+ * This function reset the DP controller
+ *
+ * NOTE: reset DP controller will also clear any pending HPD related interrupts
+ * 
+ */
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
 {
 	u32 sw_reset;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e3462f5..5ac155d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	 * transitioned to PUSH_IDLE. In order to start transmitting
 	 * a link training pattern, we have to first do soft reset.
 	 */
-	dp_catalog_ctrl_reset(ctrl->catalog);
+	if (*training_step == DP_TRAINING_1)
+		dp_catalog_ctrl_reset(ctrl->catalog);
 
 	ret = dp_ctrl_link_train(ctrl, cr, training_step);
 
@@ -1491,15 +1492,18 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	return 0;
 }
 
+static void dp_ctrl_link_idle_reset(struct dp_ctrl_private *ctrl)
+{
+	dp_ctrl_push_idle(&ctrl->dp_ctrl);
+	dp_catalog_ctrl_reset(ctrl->catalog);
+}
+
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
 	struct dp_cr_status cr;
 	int training_step = DP_TRAINING_NONE;
 
-	dp_ctrl_push_idle(&ctrl->dp_ctrl);
-	dp_catalog_ctrl_reset(ctrl->catalog);
-
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	ret = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
@@ -1626,6 +1630,7 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_TRAINING) {
 		dp_link_send_test_response(ctrl->link);
+		dp_ctrl_link_idle_reset(ctrl);
 		if (dp_ctrl_link_maintenance(ctrl)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
@@ -1679,7 +1684,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			break;
 		}
 
-		training_step = DP_TRAINING_NONE;
+		training_step = DP_TRAINING_1;
 		rc = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

