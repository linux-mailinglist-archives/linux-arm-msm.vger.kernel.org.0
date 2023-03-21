Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1666C2778
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 02:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjCUBaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 21:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjCUBaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 21:30:12 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE4D2CFCF
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:30:04 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o12so53929537edb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679362202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcuLgUbx7g9v2Vy1Q8jG9BrjLhWzTu+kdHKk66znflY=;
        b=wd1RZG9UfL54vK2DNfvS6h2G3cGZ6tZv+BwxeATqMLCAFT+bql7TPF++rRVs4rdlUQ
         NDi1YKoa6erFg1QmLyGHbKE6vU+BxSb20Cw7vZC6RIN0ojjfANjL9nLC4E7JDbfngji+
         VNH/9Wn35BFWr2PYAma5m9CF1LqXEOL1GDxvSKchsFBVtIhBgpu4p/epyR5sIhEQw9C5
         zbOciT9ome9rUzGtZ8IQukjWizk2HZ02fYP2RwPekzN4/VbWRVNV3XdbCuyq1i4ZOzRL
         qHNCZiAX3Nl9Bsp+tN1ZsPcJqvtcCBkgfIxEfridTnNUtIVGoy5w2fCvf0TXgMaLMHO0
         pnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679362202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcuLgUbx7g9v2Vy1Q8jG9BrjLhWzTu+kdHKk66znflY=;
        b=ViMIhyX8cEQSBtVhbcdzsg/A1oQHyB2i+eZaRlSsfIKaCwgcPUpnLG8uYfK3tA4Acy
         JBHLx7sv3anwNFqBFwophu4baDbtoljpZ+44gn2JAlv/RGXcmQ+bJy7yvKXhMb9puhuG
         utXz2vlgdtErmlJNuIWCM8Vs05Ak8MFk/xINavEJNxYPuacEMjUbHvpLn5bJNx8M8Q8H
         rY4LplBeYr3nT0Fl6UvuOeUfPhJjh4gbQ+bCkuSRyQrBrRnL0vdvWMr067sO7HmsKwyG
         86N0iEmc305/VGx/X+CRD1kkJtOliLDwhOMfJnXn8A9/1gn/8s6+4p+iAuioowWFfF3Q
         qx1A==
X-Gm-Message-State: AO0yUKWUTHHzwEJvdRENswQBBwxgVHgiIhDVUNETOMN0ZtkKFaeOazmN
        gpUORQXAnS1OrMLi53dp5BHsadEQmQofGHACGRzHW3Pn
X-Google-Smtp-Source: AK7set9IJ9TmyxKZuxZzsVQWlCZYAjsOfL+3u41SC10erZpLaPsauXq2bjMI1/usrlKBHJhC2XaaHw==
X-Received: by 2002:ac2:5598:0:b0:4e9:d5e5:3ff2 with SMTP id v24-20020ac25598000000b004e9d5e53ff2mr254745lfg.40.1679361507744;
        Mon, 20 Mar 2023 18:18:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 18:18:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 07/13] drm/msm/dpu: move resource allocation to CRTC
Date:   Tue, 21 Mar 2023 04:18:15 +0300
Message-Id: <20230321011821.635977-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All resource allocation is centered around the LMs. Then other blocks
(except DSCs) are allocated basing on the LMs that was selected, and LM
powers up the CRTC rather than the encoder.

Moreover if at some point the driver supports encoder cloning,
allocating resources from the encoder will be incorrect, as all clones
will have different encoder IDs, while LMs are to be shared by these
encoders.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 76 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 88 +++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 ++
 3 files changed, 94 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 508e5b950e52..77226de54363 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1176,6 +1176,76 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+#define MAX_HDISPLAY_SPLIT 1080
+
+static struct msm_display_topology dpu_crtc_get_topology(
+			struct drm_crtc *crtc,
+			struct dpu_kms *dpu_kms,
+			struct drm_crtc_state *crtc_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
+		dpu_encoder_update_topology(drm_enc, &topology);
+
+	/*
+	 * Datapath topology selection
+	 *
+	 * Dual display
+	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
+	 * Single display
+	 * 1 LM, 1 INTF
+	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
+	 *
+	 * Add dspps to the reservation requirements if ctm is requested
+	 */
+	if (topology.num_intf == 2)
+		topology.num_lm = 2;
+	else if (topology.num_dsc == 2)
+		topology.num_lm = 2;
+	else if (dpu_kms->catalog->caps->has_3d_merge)
+		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+	else
+		topology.num_lm = 1;
+
+	if (crtc_state->ctm)
+		topology.num_dspp = topology.num_lm;
+
+	return topology;
+}
+
+static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	struct dpu_global_state *global_state;
+	struct msm_display_topology topology;
+	int ret;
+
+	/*
+	 * Release and Allocate resources on every modeset
+	 * Dont allocate when enable is false.
+	 */
+	global_state = dpu_kms_get_global_state(crtc_state->state);
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
+	dpu_rm_release(global_state, crtc);
+
+	if (!crtc_state->enable)
+		return 0;
+
+	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
+	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+			     crtc, &topology);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		struct drm_atomic_state *state)
 {
@@ -1191,6 +1261,12 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		rc = dpu_crtc_assign_resources(crtc, crtc_state);
+		if (rc < 0)
+			return rc;
+	}
+
 	if (!crtc_state->enable || !crtc_state->active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 270c85ea898a..204360485b81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -53,8 +53,6 @@
 
 #define IDLE_SHORT_TIMEOUT	1
 
-#define MAX_HDISPLAY_SPLIT 1080
-
 /* timeout in frames waiting for frame done */
 #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
 
@@ -514,71 +512,28 @@ void dpu_encoder_helper_split_config(
 	}
 }
 
-bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int i, intf_count = 0, num_dsc = 0;
+	int i;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
-			intf_count++;
+			topology->num_intf++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
-
-	return (num_dsc > 0) && (num_dsc > intf_count);
+		topology->num_dsc += 2;
 }
 
-static struct msm_display_topology dpu_encoder_get_topology(
-			struct dpu_encoder_virt *dpu_enc,
-			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode,
-			struct drm_crtc_state *crtc_state)
+bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 {
-	struct msm_display_topology topology = {0};
-	int i, intf_count = 0;
-
-	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
-		if (dpu_enc->phys_encs[i])
-			intf_count++;
-
-	/* Datapath topology selection
-	 *
-	 * Dual display
-	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
-	 *
-	 * Single display
-	 * 1 LM, 1 INTF
-	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
-	 *
-	 * Add dspps to the reservation requirements if ctm is requested
-	 */
-	if (intf_count == 2)
-		topology.num_lm = 2;
-	else if (!dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = 1;
-	else
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-
-	if (crtc_state->ctm)
-		topology.num_dspp = topology.num_lm;
+	struct msm_display_topology topology = { 0 };
 
-	topology.num_intf = intf_count;
+	dpu_encoder_update_topology(drm_enc, &topology);
 
-	if (dpu_enc->dsc) {
-		/*
-		 * In case of Display Stream Compression (DSC), we would use
-		 * 2 DSC encoders, 2 layer mixers and 1 interface
-		 * this is power optimal and can drive up to (including) 4k
-		 * screens
-		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
-	}
-
-	return topology;
+	return (topology.num_dsc > 0) && (topology.num_dsc > topology.num_intf);
 }
 
 static int dpu_encoder_virt_atomic_check(
@@ -587,11 +542,7 @@ static int dpu_encoder_virt_atomic_check(
 		struct drm_connector_state *conn_state)
 {
 	struct dpu_encoder_virt *dpu_enc;
-	struct msm_drm_private *priv;
-	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
-	struct msm_display_topology topology;
-	struct dpu_global_state *global_state;
 	int i = 0;
 	int ret = 0;
 
@@ -604,12 +555,7 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
-	priv = drm_enc->dev->dev_private;
-	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_global_state(crtc_state->state);
-	if (IS_ERR(global_state))
-		return PTR_ERR(global_state);
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
@@ -627,20 +573,6 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
-
-	/*
-	 * Release and Allocate resources on every modeset
-	 * Dont allocate when active is false.
-	 */
-	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-		dpu_rm_release(global_state, crtc_state->crtc);
-
-		if (!crtc_state->active_changed || crtc_state->enable)
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					crtc_state->crtc, &topology);
-	}
-
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236ef34e6..88248b9faf1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -202,6 +202,14 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
  */
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_update_topology - update topology with the requirements for the encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @topology:	Topology to be updated
+ */
+void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
+				 struct msm_display_topology *topology);
+
 /**
  * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
  * @drm_enc:    Pointer to previously created drm encoder structure
-- 
2.30.2

