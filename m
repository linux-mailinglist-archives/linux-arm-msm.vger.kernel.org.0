Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D068A65B466
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 16:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235952AbjABPry (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 10:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236217AbjABPrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 10:47:53 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC11A1AB
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 07:47:51 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id e13so26763611ljn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 07:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLlCephsi+ZcIsvxw0u3fPGST2wyuMy+U+R6N4ur7NI=;
        b=rT36Z4eP2UqucB02QhLUySR7iY4YjFgbPIyOkLXw9is5OSzAeC/sbfnHSyLIXWe/53
         7FZuaAOiEQPjO+92W2ihfqzFfcXQc9wfznmQygWgInoGlMxJf6j9CtTDJdQie0pznG5G
         8ohMHFnvdiPxpnASXujhSWK78ak0OG/tsFhdgN7NzHz9PcEXUMEKH0WsTD22HukT3g92
         M8srqfRbBuVz8duBSjvIIuLY/UwiK6AlmlxXDBzPNjyn/HD10AzO0oe/DMcLTlUY4iMj
         KdXF2kYtLOQ5RaYrz9GERkc1TMdwrS0Ou55IgQNvhQcvP7sy5uhaFxgxB50iYjzN1goC
         RgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLlCephsi+ZcIsvxw0u3fPGST2wyuMy+U+R6N4ur7NI=;
        b=ltTPt+MV4l2aAb3EPed8TE2ZK2jaHvaIHJwIkVqBryGnfsu687NYvD36xh4fOkfYaS
         vmxJ3k9beILer8gMSxe5z8sm27JAvxs8P5rDHT0JnuXLjmc+8GkoqZCJsYuI3kHunQTT
         /pk5xcRscfoDKKFPooGQ3iX4HOUI9DXsGwSEeHbJ+rkxeX+uYQY4O4Q154lQiKfdA4Ql
         dYRJkUEYGSCMofvPOJkayijVRjai9ryKLnK3MmfelKOOnZTvkvumtcSncMkMMVocnAxb
         pHD/ut0ubXyuPpNLFlJOQnJgOr3eq/sFaT+qLsTYKHplAeDIsv62gdyzAE3a6qO3N/MW
         bgFw==
X-Gm-Message-State: AFqh2kqyvgn2mVoK0ogRuRtJuEmmeTySBrVvKFQjSLLdvqb/0KgDXJq8
        riwUFSf0JKqKdL/eKV7yZfqafA==
X-Google-Smtp-Source: AMrXdXu+ha+M+5lAEwZHIOT3PrevFVITTwzgjKoYu7Hf+fq5+o+FcGFG1v4LaC2eSan7MAkaCFmiig==
X-Received: by 2002:a05:651c:1992:b0:27f:ae36:83af with SMTP id bx18-20020a05651c199200b0027fae3683afmr13515348ljb.9.1672674470046;
        Mon, 02 Jan 2023 07:47:50 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3290054ljn.30.2023.01.02.07.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 07:47:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: remove CRTC frame event callback registration
Date:   Mon,  2 Jan 2023 17:47:48 +0200
Message-Id: <20230102154748.951328-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The frame event callback is always set to dpu_crtc_frame_event_cb() (or
to NULL) and the data is always either the CRTC itself or NULL
(correpondingly). Thus drop the event callback registration, call the
dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
assigned using dpu_encoder_assign_crtc().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
 5 files changed, 21 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 13ce321283ff..64cd2ec8a0c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -640,18 +640,8 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
 	DPU_ATRACE_END("crtc_frame_event");
 }
 
-/*
- * dpu_crtc_frame_event_cb - crtc frame event callback API. CRTC module
- * registers this API to encoder for all frame event callbacks like
- * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
- * from different context - IRQ, user thread, commit_thread, etc. Each event
- * should be carefully reviewed and should be processed in proper task context
- * to avoid schedulin delay or properly manage the irq context's bottom half
- * processing.
- */
-static void dpu_crtc_frame_event_cb(void *data, u32 event)
+void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
 {
-	struct drm_crtc *crtc = (struct drm_crtc *)data;
 	struct dpu_crtc *dpu_crtc;
 	struct msm_drm_private *priv;
 	struct dpu_crtc_frame_event *fevent;
@@ -1051,9 +1041,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	dpu_core_perf_crtc_update(crtc, 0, true);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
-		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
-
 	memset(cstate->mixers, 0, sizeof(cstate->mixers));
 	cstate->num_mixers = 0;
 
@@ -1089,8 +1076,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 		 */
 		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
 			request_bandwidth = true;
-		dpu_encoder_register_frame_event_callback(encoder,
-				dpu_crtc_frame_event_cb, (void *)crtc);
 	}
 
 	if (request_bandwidth)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b1626a..3aa536d95721 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -300,4 +300,18 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 	return crtc && crtc->state ? RT_CLIENT : NRT_CLIENT;
 }
 
+/**
+ * dpu_crtc_frame_event_cb - crtc frame event callback API
+ * @crtc: Pointer to crtc
+ * @event: Event to process
+ *
+ * CRTC module registers this API to encoder for all frame event callbacks like
+ * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
+ * from different context - IRQ, user thread, commit_thread, etc. Each event
+ * should be carefully reviewed and should be processed in proper task context
+ * to avoid schedulin delay or properly manage the irq context's bottom half
+ * processing.
+ */
+void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 84f8c8a1b049..bf0af5af4306 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -147,8 +147,6 @@ enum dpu_enc_rc_states {
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
  *				busy processing current command.
  *				Bit0 = phys_encs[0] etc.
- * @crtc_frame_event_cb:	callback handler for frame event
- * @crtc_frame_event_cb_data:	callback handler private data
  * @frame_done_timeout_ms:	frame done timeout in ms
  * @frame_done_timer:		watchdog timer for frame done event
  * @vsync_event_timer:		vsync timer
@@ -187,8 +185,6 @@ struct dpu_encoder_virt {
 	struct dentry *debugfs_root;
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
-	void (*crtc_frame_event_cb)(void *, u32 event);
-	void *crtc_frame_event_cb_data;
 
 	atomic_t frame_done_timeout_ms;
 	struct timer_list frame_done_timer;
@@ -1358,28 +1354,6 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
 	}
 }
 
-void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
-		void (*frame_event_cb)(void *, u32 event),
-		void *frame_event_cb_data)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	unsigned long lock_flags;
-	bool enable;
-
-	enable = frame_event_cb ? true : false;
-
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	trace_dpu_enc_frame_event_cb(DRMID(drm_enc), enable);
-
-	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	dpu_enc->crtc_frame_event_cb = frame_event_cb;
-	dpu_enc->crtc_frame_event_cb_data = frame_event_cb_data;
-	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
-}
-
 void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event)
@@ -1418,15 +1392,12 @@ void dpu_encoder_frame_done_callback(
 			dpu_encoder_resource_control(drm_enc,
 					DPU_ENC_RC_EVENT_FRAME_DONE);
 
-			if (dpu_enc->crtc_frame_event_cb)
-				dpu_enc->crtc_frame_event_cb(
-					dpu_enc->crtc_frame_event_cb_data,
-					event);
+			if (dpu_enc->crtc)
+				dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 		}
 	} else {
-		if (dpu_enc->crtc_frame_event_cb)
-			dpu_enc->crtc_frame_event_cb(
-				dpu_enc->crtc_frame_event_cb_data, event);
+		if (dpu_enc->crtc)
+			dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 	}
 }
 
@@ -2367,7 +2338,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 		return;
 	}
 
-	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
+	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc) {
 		DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
 			      DRMID(drm_enc), dpu_enc->frame_busy_mask[0]);
 		return;
@@ -2380,7 +2351,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 	event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
-	dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
+	dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 }
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236ef34e6..dd9cff4f1606 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -57,16 +57,6 @@ void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
 void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *encoder,
 					struct drm_crtc *crtc, bool enable);
 
-/**
- * dpu_encoder_register_frame_event_callback - provide callback to encoder that
- *	will be called after the request is complete, or other events.
- * @encoder:	encoder pointer
- * @cb:		callback pointer, provide NULL to deregister
- * @data:	user data provided to callback
- */
-void dpu_encoder_register_frame_event_callback(struct drm_encoder *encoder,
-		void (*cb)(void *, u32), void *data);
-
 /**
  * dpu_encoder_prepare_for_kickoff - schedule double buffer flip of the ctl
  *	path (i.e. ctl flush and start) at next appropriate time.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 76169f406505..c75b4363bfc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -346,10 +346,6 @@ DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)
 );
-DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_frame_event_cb,
-	TP_PROTO(uint32_t drm_id, bool enable),
-	TP_ARGS(drm_id, enable)
-);
 DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_phys_cmd_connect_te,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)
-- 
2.39.0

