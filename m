Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AB035CF30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 19:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243785AbhDLRFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 13:05:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:63408 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244125AbhDLREI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 13:04:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618247030; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3l8HW1rNzvaQs+RTHspb+EbKaL0TMdVmEqx1yLOrbCU=; b=jpC0+pNAizsb5moltP/ym8jelDDaIlWhbzSMbOkXhQxMgVjZORSrAsijEyuK3bbuMWTzhAVb
 wubNCaA/bh+jkn5mC2dkPRurBAOihMy6gCCjfXc3qeV4kg/nD2ynNJW6zTY0fkj8buk/jEhc
 1RCaFeYAPu+h8/TvMM8DN/keZHY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60747d648166b7eff75d6e0b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Apr 2021 17:03:32
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76E3AC43465; Mon, 12 Apr 2021 17:03:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 932BFC43461;
        Mon, 12 Apr 2021 17:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 932BFC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=khsieh@codeaurora.org
From:   Kuogee Hsieh <khsieh@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/msm/dp: do not re initialize of audio_comp
Date:   Mon, 12 Apr 2021 10:03:23 -0700
Message-Id: <1618247003-28821-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At dp_display_disable(), do not re initialize audio_comp if
hdp_state == ST_DISCONNECT_PENDING (unplug event) to avoid
race condition which cause 5 second timeout expired. Also
add abort mechanism to reduce time spinning at dp_aux_transfer()
during dpcd read if type-c connection had been broken.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
 drivers/gpu/drm/msm/dp/dp_link.c    | 20 +++++++++++++++-----
 4 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 7c22bfe..e5ece8c 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -28,6 +28,7 @@ struct dp_aux_private {
 	u32 offset;
 	u32 segment;
 	u32 isr;
+	atomic_t aborted;
 
 	struct drm_dp_aux dp_aux;
 };
@@ -343,6 +344,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 
 	mutex_lock(&aux->mutex);
 
+	if (atomic_read(&aux->aborted)) {
+		ret = -ETIMEDOUT;
+		goto unlock_exit;
+	}
+
 	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
 
 	/* Ignore address only message */
@@ -533,3 +539,15 @@ void dp_aux_put(struct drm_dp_aux *dp_aux)
 
 	devm_kfree(aux->dev, aux);
 }
+
+void dp_aux_abort(struct drm_dp_aux *dp_aux, bool abort)
+{
+	struct dp_aux_private *aux;
+
+	if (!dp_aux)
+		return;
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	atomic_set(&aux->aborted, abort);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index f8b8ba9..c17df7f 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -23,6 +23,7 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux);
 void dp_aux_init(struct drm_dp_aux *dp_aux);
 void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
+void dp_aux_abort(struct drm_dp_aux *dp_aux, bool abort);
 
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog);
 void dp_aux_put(struct drm_dp_aux *aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4992a049..8960333 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -898,8 +898,10 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		/* signal the disconnect event */
-		reinit_completion(&dp->audio_comp);
-		dp_display_handle_plugged_change(dp_display, false);
+		if (dp->hpd_state != ST_DISCONNECT_PENDING) {
+			reinit_completion(&dp->audio_comp);
+			dp_display_handle_plugged_change(dp_display, false);
+		}
 		if (!wait_for_completion_timeout(&dp->audio_comp,
 				HZ * 5))
 			DRM_ERROR("audio comp timeout\n");
@@ -1137,20 +1139,26 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK ||
 			hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
+			dp_aux_abort(dp->aux, false);
 			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 		}
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
 			/* stop sentinel connect pending checking */
+			dp_aux_abort(dp->aux, false);
 			dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 		}
 
-		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK)
+		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
+			dp_aux_abort(dp->aux, false);
 			dp_add_event(dp, EV_HPD_REPLUG_INT, 0, 0);
+		}
 
-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) {
+			dp_aux_abort(dp->aux, true);
 			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		}
 	}
 
 	/* DP controller isr */
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da..d35b18e 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -737,18 +737,25 @@ static int dp_link_parse_sink_count(struct dp_link *dp_link)
 	return 0;
 }
 
-static void dp_link_parse_sink_status_field(struct dp_link_private *link)
+static int dp_link_parse_sink_status_field(struct dp_link_private *link)
 {
 	int len = 0;
 
 	link->prev_sink_count = link->dp_link.sink_count;
-	dp_link_parse_sink_count(&link->dp_link);
+	len = dp_link_parse_sink_count(&link->dp_link);
+	if (len < 0) {
+		DRM_ERROR("DP lparse sink count failed\n");
+		return len;
+	}
 
 	len = drm_dp_dpcd_read_link_status(link->aux,
 		link->link_status);
-	if (len < DP_LINK_STATUS_SIZE)
+	if (len < DP_LINK_STATUS_SIZE) {
 		DRM_ERROR("DP link status read failed\n");
-	dp_link_parse_request(link);
+		return len;
+	}
+
+	return dp_link_parse_request(link);
 }
 
 /**
@@ -1032,7 +1039,10 @@ int dp_link_process_request(struct dp_link *dp_link)
 
 	dp_link_reset_data(link);
 
-	dp_link_parse_sink_status_field(link);
+	ret = dp_link_parse_sink_status_field(link);
+	if (ret) {
+		return ret;
+	}
 
 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

