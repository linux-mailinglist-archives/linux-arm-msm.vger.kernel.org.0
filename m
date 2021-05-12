Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BB737EFE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 01:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbhELXhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 19:37:12 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54416 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243856AbhELXbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 19:31:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620862213; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=O2cYiN+KrUcYKh171T/sRXsESt8DGfbZH/R05rVBcIA=; b=co5emMTTtWizQL1ggyYFJvClQ01zZXmChT3xPj+EiHvRxoskIqFpI3gYgoLZPe6fBLJ5VHVy
 amDQ6rn+6V6qYu3w6m2MtVuOQ5Ol+wrxgEsbstBimGouSn+1h589IfRazDmvzPNUcpse2PoP
 Wbj3T6nuHbPn6NPNVNbiWvKiA4U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 609c65034a4ae4ec68058de0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 May 2021 23:30:11
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8DB8AC433D3; Wed, 12 May 2021 23:30:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2165C433F1;
        Wed, 12 May 2021 23:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2165C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
Date:   Wed, 12 May 2021 16:29:59 -0700
Message-Id: <1620862199-19514-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

irq_hpd interrupt should be handled after dongle plugged in and
before dongle unplugged. Hence irq_hpd interrupt is enabled at
the end of the plugin handle and disabled at the beginning of
unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
handled same as the dongle unplugged which tears down the mainlink
and disables the phy. This patch fixes this problem by only tearing
down the mainlink but keeping phy enabled at irq_hpd with
sink_count = 0 handle so that next irq_hpe with sink_count =1 can be
handled by setup mainlink only.

Changes in v2:
-- add ctrl->phy_Power_count

Changes in v3:
-- del ctrl->phy_Power_count
-- add phy_power_off to dp_ctrl_off_link_stream()

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  5 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 54 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c | 46 ++++++++++++++++++++++++-------
 4 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b1a9b1b..f4f53f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -582,10 +582,9 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 
 	u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
 
-	/* enable HPD interrupts */
+	/* enable HPD plug and unplug interrupts */
 	dp_catalog_hpd_config_intr(dp_catalog,
-		DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK
-		| DP_DP_HPD_UNPLUG_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
+		DP_DP_HPD_PLUG_INT_MASK | DP_DP_HPD_UNPLUG_INT_MASK, true);
 
 	/* Configure REFTIMER and enable it */
 	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 8d59eb9..41c122c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1811,6 +1811,60 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
+int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
+	int ret = 0;
+
+	if (!dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
+
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
+	if (ret)
+		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	if (ret)
+		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
+
+	phy_power_off(phy);
+	phy_exit(phy);
+
+	/* aux channel down, reinit phy */
+	phy_init(phy);
+
+	DRM_DEBUG_DP("DP off link/stream done\n");
+	return ret;
+}
+
+void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
+
+	if (!dp_ctrl)
+		return;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
+
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	phy_exit(phy);
+
+	DRM_DEBUG_DP("DP off phy done\n");
+}
+
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index a836bd3..25e4f75 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -23,6 +23,8 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
 void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
+int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0ba71c7..c2b2050 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -570,6 +570,10 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
 	}
 
+	/* enable HDP irq_hpd/replug interrupt */
+	dp_catalog_hpd_config_intr(dp->catalog,
+		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
+
 	mutex_unlock(&dp->event_mutex);
 
 	/* uevent will complete connection part */
@@ -619,7 +623,26 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state = dp->hpd_state;
-	if (state == ST_DISCONNECT_PENDING || state == ST_DISCONNECTED) {
+
+	/* disable irq_hpd/replug interrupts */
+	dp_catalog_hpd_config_intr(dp->catalog,
+		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
+
+	/* unplugged, no more irq_hpd handle */
+	dp_del_event(dp, EV_IRQ_HPD_INT);
+
+	if (state == ST_DISCONNECTED) {
+		/* triggered by irq_hdp with sink_count = 0 */
+		if (dp->link->sink_count == 0) {
+			dp_ctrl_off_phy(dp->ctrl);
+			hpd->hpd_high = 0;
+			dp->core_initialized = false;
+		}
+		mutex_unlock(&dp->event_mutex);
+		return 0;
+	}
+
+	if (state == ST_DISCONNECT_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -633,9 +656,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 
 	dp->hpd_state = ST_DISCONNECT_PENDING;
 
-	/* disable HPD plug interrupt until disconnect is done */
-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK
-				| DP_DP_IRQ_HPD_INT_MASK, false);
+	/* disable HPD plug interrupts */
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
 	hpd->hpd_high = 0;
 
@@ -652,8 +674,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	reinit_completion(&dp->audio_comp);
 	dp_display_handle_plugged_change(g_dp_display, false);
 
-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
-					DP_DP_IRQ_HPD_INT_MASK, true);
+	/* enable HDP plug interrupt to prepare for next plugin */
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, true);
 
 	/* uevent will complete disconnection part */
 	mutex_unlock(&dp->event_mutex);
@@ -684,7 +706,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	state =  dp->hpd_state;
-	if (state == ST_DISPLAY_OFF) {
+	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -903,9 +925,13 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	dp_display->audio_enabled = false;
 
-	dp_ctrl_off(dp->ctrl);
-
-	dp->core_initialized = false;
+	/* triggered by irq_hpd with sink_count = 0 */
+	if (dp->link->sink_count == 0) {
+		dp_ctrl_off_link_stream(dp->ctrl);
+	} else {
+		dp_ctrl_off(dp->ctrl);
+		dp->core_initialized = false;
+	}
 
 	dp_display->power_on = false;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

