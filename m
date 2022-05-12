Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DD95255F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 21:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbiELTna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 15:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiELTn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 15:43:29 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935A6666B7;
        Thu, 12 May 2022 12:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652384608; x=1683920608;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=96oVflBv0iDGh4dmL/Pe1lrSs1hsULFMFnDpjN3gQKs=;
  b=xpPRqdDy+MtloIjU+yk3bs+xs+UrJoxGAUlbEaXJwq+V8L5B+PJuBAVH
   50zvX/36Xe97oVlsENKiOvlbmesi1fsVz0y8NsS8G3CNq8J2bx25Bc/a+
   7YrL4b+WiF2JSqMcFkArsHT77icLA9ahKWbqDUKGH1Q7Q6sPetku8w95d
   U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 12 May 2022 12:43:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 12:43:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 12 May 2022 12:43:27 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 12 May 2022 12:43:26 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
        <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
        <airlied@linux.ie>, <agross@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_khsieh@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6] drm/msm/dp: Always clear mask bits to disable interrupts at dp_ctrl_reset_irq_ctrl()
Date:   Thu, 12 May 2022 12:43:18 -0700
Message-ID: <1652384598-21586-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dp_catalog_ctrl_reset() will software reset DP controller. But it will
not reset programmable registers to default value. DP driver still have
to clear mask bits to interrupt status registers to disable interrupts
after software reset of controller.

At current implementation, dp_ctrl_reset_irq_ctrl() will software reset dp
controller but did not call dp_catalog_ctrl_enable_irq(false) to clear hpd
related interrupt mask bits to disable hpd related interrupts due to it
mistakenly think hpd related interrupt mask bits will be cleared by software
reset of dp controller automatically. This mistake may cause system to crash
during suspending procedure due to unexpected irq fired and trigger event
thread to access dp controller registers with controller clocks are disabled.

This patch fixes system crash during suspending problem by removing "enable"
flag condition checking at dp_ctrl_reset_irq_ctrl() so that hpd related
interrupt mask bits are cleared to prevent unexpected from happening.
In addition, this patch also add suspended flag to prevent new events be
added into event Q to wake up event thread after system suspended.

Changes in v2:
-- add more details commit text

Changes in v3:
-- add synchrons_irq()
-- add atomic_t suspended

Changes in v4:
-- correct Fixes's commit ID
-- remove synchrons_irq()

Changes in v5:
-- revise commit text

Changes in v6:
-- add event_lock to protect "suspended"

Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 +++++++--
 drivers/gpu/drm/msm/dp/dp_display.c | 25 ++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index af7a80c..f3e333e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
-	if (enable)
-		dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
+	/*
+	 * all dp controller programmable registers will not
+	 * be reset to default value after DP_SW_RESET
+	 * therefore interrupt mask bits have to be updated
+	 * to enable/disable interrupts
+	 */
+	dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
 }
 
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c388323..ab691aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -98,6 +98,8 @@ struct dp_display_private {
 	struct dp_ctrl    *ctrl;
 	struct dp_debug   *debug;
 
+	bool suspended;
+
 	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
@@ -187,6 +189,11 @@ static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
 	int pndx;
 
 	spin_lock_irqsave(&dp_priv->event_lock, flag);
+	if (dp_priv->suspended) {
+		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+		return -ENOENT;
+	}
+
 	pndx = dp_priv->event_pndx + 1;
 	pndx %= DP_EVENT_Q_MAX;
 	if (pndx == dp_priv->event_gndx) {
@@ -454,7 +461,6 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
 	dp_power_deinit(dp->power);
 	dp->core_initialized = false;
@@ -1112,7 +1118,12 @@ static int hpd_event_thread(void *data)
 			wait_event_interruptible(dp_priv->event_q,
 				(dp_priv->event_pndx != dp_priv->event_gndx));
 		}
+
 		spin_lock_irqsave(&dp_priv->event_lock, flag);
+		if (dp_priv->suspended) {
+			spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+			continue;
+		}
 		todo = &dp_priv->event_list[dp_priv->event_gndx];
 		if (todo->delay) {
 			struct dp_event *todo_next;
@@ -1351,6 +1362,7 @@ static int dp_pm_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_dp *dp_display = platform_get_drvdata(pdev);
 	struct dp_display_private *dp;
+	unsigned long flag;
 	int sink_count = 0;
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
@@ -1362,6 +1374,10 @@ static int dp_pm_resume(struct device *dev)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized, dp_display->power_on);
 
+	spin_lock_irqsave(&dp->event_lock, flag);
+	dp->suspended = false;
+	spin_unlock_irqrestore(&dp->event_lock, flag);
+
 	/* start from disconnected state */
 	dp->hpd_state = ST_DISCONNECTED;
 
@@ -1421,6 +1437,7 @@ static int dp_pm_suspend(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_dp *dp_display = platform_get_drvdata(pdev);
 	struct dp_display_private *dp;
+	unsigned long flag;
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
@@ -1431,6 +1448,12 @@ static int dp_pm_suspend(struct device *dev)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized, dp_display->power_on);
 
+	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
+
+	spin_lock_irqsave(&dp->event_lock, flag);
+	dp->suspended = true;
+	spin_unlock_irqrestore(&dp->event_lock, flag);
+
 	/* mainlink enabled */
 	if (dp_power_clk_status(dp->power, DP_CTRL_PM))
 		dp_ctrl_off_link_stream(dp->ctrl);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

