Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70EC250344F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbiDOXuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 19:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiDOXuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 19:50:06 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EA1BAB91;
        Fri, 15 Apr 2022 16:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650066457; x=1681602457;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=vzpvBMBAMFTESZ5vVwZS6d9Di7Ec0/9aDX8w9AZHjno=;
  b=Dh7N0FaqO/CrP1XMNXF0Xlpf0Tk2VJQDntUMy7Z+186MYR7ZC65IGqFe
   rX5pc1ENpDEt30UmkAj9kx3j/0v72DWaFNzE/hiRqd6fhj5dwpuzKGVAx
   V4OwSAnq2GAC3HVlBRCjBwowDcNxkY0Nu3uC5mxVZTDsmDPEphlN3lqC3
   Y=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 15 Apr 2022 16:47:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 16:47:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Apr 2022 16:47:35 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Apr 2022 16:47:34 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_khsieh@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v9] drm/msm/dp: stop event kernel thread when DP unbind
Date:   Fri, 15 Apr 2022 16:47:25 -0700
Message-ID: <1650066445-18186-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current DP driver implementation, event thread is kept running
after DP display is unbind. This patch fix this problem by disabling
DP irq and stop event thread to exit gracefully at dp_display_unbind().

Changes in v2:
-- start event thread at dp_display_bind()

Changes in v3:
-- disable all HDP interrupts at unbind
-- replace dp_hpd_event_setup() with dp_hpd_event_thread_start()
-- replace dp_hpd_event_stop() with dp_hpd_event_thread_stop()
-- move init_waitqueue_head(&dp->event_q) to probe()
-- move spin_lock_init(&dp->event_lock) to probe()

Changes in v4:
-- relocate both dp_display_bind() and dp_display_unbind() to bottom of file

Changes in v5:
-- cancel relocation of both dp_display_bind() and dp_display_unbind()

Changes in v6:
-- move empty event q to dp_event_thread_start()

Changes in v7:
-- call ktheread_stop() directly instead of dp_hpd_event_thread_stop() function

Changes in v8:
-- return error immediately if audio registration failed.

Changes in v9:
-- return error immediately if event thread create failed.

Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 41 +++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 01453db..5b289b9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -113,6 +113,7 @@ struct dp_display_private {
 	u32 hpd_state;
 	u32 event_pndx;
 	u32 event_gndx;
+	struct task_struct *ev_tsk;
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
@@ -230,6 +231,8 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
 	complete_all(&dp->audio_comp);
 }
 
+static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
+
 static int dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -266,9 +269,18 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	}
 
 	rc = dp_register_audio_driver(dev, dp->audio);
-	if (rc)
+	if (rc) {
 		DRM_ERROR("Audio registration Dp failed\n");
+		goto end;
+	}
 
+	rc = dp_hpd_event_thread_start(dp);
+	if (rc) {
+		DRM_ERROR("Event thread create failed\n");
+		goto end;
+	}
+
+	return 0;
 end:
 	return rc;
 }
@@ -280,6 +292,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
 
+	/* disable all HPD interrupts */
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
+
+	kthread_stop(dp->ev_tsk);
+
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
 	priv->dp[dp->id] = NULL;
@@ -1054,7 +1071,7 @@ static int hpd_event_thread(void *data)
 
 	dp_priv = (struct dp_display_private *)data;
 
-	while (1) {
+	while (!kthread_should_stop()) {
 		if (timeout_mode) {
 			wait_event_timeout(dp_priv->event_q,
 				(dp_priv->event_pndx == dp_priv->event_gndx),
@@ -1132,12 +1149,19 @@ static int hpd_event_thread(void *data)
 	return 0;
 }
 
-static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
+static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
 {
-	init_waitqueue_head(&dp_priv->event_q);
-	spin_lock_init(&dp_priv->event_lock);
+	/* set event q to empty */
+	dp_priv->event_gndx = 0;
+	dp_priv->event_pndx = 0;
+
+	dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
+	if (IS_ERR(dp_priv->ev_tsk)) {
+		DRM_ERROR("failed to create DP event thread\n");
+		return PTR_ERR(dp_priv->ev_tsk);
+	}
 
-	kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
+	return 0;
 }
 
 static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
@@ -1266,7 +1290,10 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
+	/* setup event q */
 	mutex_init(&dp->event_mutex);
+	init_waitqueue_head(&dp->event_q);
+	spin_lock_init(&dp->event_lock);
 
 	/* Store DP audio handle inside DP display */
 	dp->dp_display.dp_audio = dp->audio;
@@ -1441,8 +1468,6 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp_hpd_event_setup(dp);
-
 	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

