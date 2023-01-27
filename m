Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A108967DB10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 02:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjA0BJh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 20:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbjA0BJg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 20:09:36 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56F253B24
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 17:09:34 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso3434326pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 17:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S56yI90J6SMsvBPS/eoWABUHdDVHzOi+B+mbBsY/0Y=;
        b=U4D+jpgwO1YI68vRVXAddtAN5r/lxcTAdAbsavlwvB++kS12OVLBsU76+rImeY7j4D
         Vk375gvfV14xmJZ19HwexRQB/nig+uyxyPEKMwWct7WlVK5+ImPlhMo/cNF7BFMDV9m5
         re2upayitnBNwEK1ijTEpOEAD/HcRl270AQjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6S56yI90J6SMsvBPS/eoWABUHdDVHzOi+B+mbBsY/0Y=;
        b=adQEF5QMbjJoc7TeTm+ouKge03fkF1woLK14fkYOPQpzCnbkUg3S/rL0EitsgF317h
         7/H938wiOuxaNyZ/GDcRPnTrBYsb7DJgNmM80osuZ6wXfh22pbasMQHCSqX4X2OR9JU2
         xNki2a8P8USSkvC/EovnHCeDlsZbrLE+VVF31/+nbc6HITGIUdhgHuXrzgFlFJL2LVtO
         paCS72S7aCoDOk3UVNAk+o5sYZxC/yqmPPHTgg5HPu7INzjHR5UacDWGMkhFxFgAr2ud
         9kt2cX1N8i1iKrjOJodunhqMhhidyU6aPSj5ZBegJme7VFxiI6DK8dH/K4eW2oPSyG8l
         UpLQ==
X-Gm-Message-State: AFqh2kr0+vwn04P804ca606M/1BF3zgIJ6sQr6+CSNtY8O1xJQUhLg8F
        rRM62ptOWh48w9t+/YxABjZkqw==
X-Google-Smtp-Source: AMrXdXv7FgmktNBXHeISY4souxeBOnm+cJnvu+7LbuVmDjVWD5KnKjsroFyUs9Bls1B9YtKKLBhZag==
X-Received: by 2002:a17:90a:7a84:b0:214:132a:2bea with SMTP id q4-20020a17090a7a8400b00214132a2beamr40082120pjf.4.1674781774222;
        Thu, 26 Jan 2023 17:09:34 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:d3b5:7433:dc03:ca1f])
        by smtp.gmail.com with ESMTPSA id s10-20020a17090a760a00b0022bbbba9801sm3843981pjk.37.2023.01.26.17.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 17:09:33 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Lyude Paul <lyude@redhat.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/msm/dp: Return IRQ_NONE for unhandled interrupts
Date:   Thu, 26 Jan 2023 17:09:13 -0800
Message-Id: <20230126170745.v2.2.I2d7aec2fadb9c237cd0090a47d6a8ba2054bf0f8@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
References: <20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If our interrupt handler gets called and we don't really handle the
interrupt then we should return IRQ_NONE. The current interrupt
handler didn't do this, so let's fix it.

NOTE: for some of the cases it's clear that we should return IRQ_NONE
and some cases it's clear that we should return IRQ_HANDLED. However,
there are a few that fall somewhere in between. Specifically, the
documentation for when to return IRQ_NONE vs. IRQ_HANDLED is probably
best spelled out in the commit message of commit d9e4ad5badf4
("Document that IRQ_NONE should be returned when IRQ not actually
handled"). That commit makes it clear that we should return
IRQ_HANDLED if we've done something to make the interrupt stop
happening.

The case where it's unclear is, for instance, in dp_aux_isr() after
we've read the interrupt using dp_catalog_aux_get_irq() and confirmed
that "isr" is non-zero. The function dp_catalog_aux_get_irq() not only
reads the interrupts but it also "ack"s all the interrupts that are
returned. For an "unknown" interrupt this has a very good chance of
actually stopping the interrupt from happening. That would mean we've
identified that it's our device and done something to stop them from
happening and should return IRQ_HANDLED. Specifically, it should be
noted that most interrupts that need "ack"ing are ones that are
one-time events and doing an "ack" is enough to clear them. However,
since these interrupts are unknown then, by definition, it's unknown
if "ack"ing them is truly enough to clear them. It's possible that we
also need to remove the original source of the interrupt. In this
case, IRQ_NONE would be a better choice.

Given that returning an occasional IRQ_NONE isn't the absolute end of
the world, however, let's choose that course of action. The IRQ
framework will forgive a few IRQ_NONE returns now and again (and it
won't even log them, which is why we have to log them ourselves). This
means that if we _do_ end hitting an interrupt where "ack"ing isn't
enough the kernel will eventually detect the problem and shut our
device down.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/msm/dp/dp_aux.c     | 12 +++++++-----
 drivers/gpu/drm/msm/dp/dp_aux.h     |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  8 +++++---
 5 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 84f9e3e5f964..8e3b677f35e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -368,14 +368,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	return ret;
 }
 
-void dp_aux_isr(struct drm_dp_aux *dp_aux)
+irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
 {
 	u32 isr;
 	struct dp_aux_private *aux;
 
 	if (!dp_aux) {
 		DRM_ERROR("invalid input\n");
-		return;
+		return IRQ_NONE;
 	}
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
@@ -384,11 +384,11 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 
 	/* no interrupts pending, return immediately */
 	if (!isr)
-		return;
+		return IRQ_NONE;
 
 	if (!aux->cmd_busy) {
 		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
-		return;
+		return IRQ_NONE;
 	}
 
 	/*
@@ -420,10 +420,12 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 		aux->aux_error_num = DP_AUX_ERR_NONE;
 	} else {
 		DRM_WARN("Unexpected interrupt: %#010x\n", isr);
-		return;
+		return IRQ_NONE;
 	}
 
 	complete(&aux->comp);
+
+	return IRQ_HANDLED;
 }
 
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index e930974bcb5b..511305da4f66 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -11,7 +11,7 @@
 
 int dp_aux_register(struct drm_dp_aux *dp_aux);
 void dp_aux_unregister(struct drm_dp_aux *dp_aux);
-void dp_aux_isr(struct drm_dp_aux *dp_aux);
+irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux);
 void dp_aux_init(struct drm_dp_aux *dp_aux);
 void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dd26ca651a05..1a5377ef1967 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1979,27 +1979,33 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
-void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
+irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	u32 isr;
+	irqreturn_t ret = IRQ_NONE;
 
 	if (!dp_ctrl)
-		return;
+		return IRQ_NONE;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
 	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
 
+
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
 		complete(&ctrl->video_comp);
+		ret = IRQ_HANDLED;
 	}
 
 	if (isr & DP_CTRL_INTR_IDLE_PATTERN_SENT) {
 		drm_dbg_dp(ctrl->drm_dev, "idle_patterns_sent\n");
 		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
 	}
+
+	return ret;
 }
 
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9f29734af81c..c3af06dc87b1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -25,7 +25,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
+irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bde1a7ce442f..b5343c9f1c1e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1204,7 +1204,7 @@ static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
 static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct dp_display_private *dp = dev_id;
-	irqreturn_t ret = IRQ_HANDLED;
+	irqreturn_t ret = IRQ_NONE;
 	u32 hpd_isr_status;
 
 	if (!dp) {
@@ -1232,13 +1232,15 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
 			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+		ret = IRQ_HANDLED;
 	}
 
 	/* DP controller isr */
-	dp_ctrl_isr(dp->ctrl);
+	ret |= dp_ctrl_isr(dp->ctrl);
 
 	/* DP aux isr */
-	dp_aux_isr(dp->aux);
+	ret |= dp_aux_isr(dp->aux);
 
 	return ret;
 }
-- 
2.39.1.456.gfc5497dd1b-goog

