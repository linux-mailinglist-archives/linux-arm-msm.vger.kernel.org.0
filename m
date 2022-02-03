Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD7434A806C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 09:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349053AbiBCI0i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 03:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349516AbiBCI0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 03:26:30 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF92C06175B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 00:26:20 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id bx31so2858528ljb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 00:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HdSi3nMWEr1dk9VcTiRx+6Kl9ilPXNam2bjJyEs5WlA=;
        b=nMOrvXInD9QfJLdb/fan79KuA0cxJYB6CDwub/cuX1SUSIeZ+jIpwZahuXcvPktQwu
         Z0mAaho/2/1bci/Xm75jRn2cEky6fuaNHfAOGXZdClCX4darf6w9bHhB/naAOele0tcW
         b8uXzNCi0mD+iRnSKS5zN5ymyUbIohC8Og8ZVG0QTVvInuNJVBAxhJDFv/DOcHaPiYy+
         a0dhNYtEaOJKBpdyIC5RBtaT2zD+IKRuWGN0QA/LujXjVPQBXDVbcrwbLsc7ySVQE3+u
         nLCaoELd4H56aGuHnRcR9/BUOswSiYtfdn/AVyP96qMgQsovvldxT2C1uOzjC4QSe17B
         y8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HdSi3nMWEr1dk9VcTiRx+6Kl9ilPXNam2bjJyEs5WlA=;
        b=VVCkzs13A0SitDf1YDU+wog85VTZB4a4ioUyjSYPmJ4swreT5UXa03PC7cwDInvJNq
         W6p2WFFXh8qfhcyb06V721fYFbkbYOLI8ORbUhworKF5V9V9y8jlNJUmZjxDfffOhGUS
         g8wtDKLdlenXJrZRtNagyb1EQI7/JnneUYvRMCd9ztw5y+jcOxwjKhnKNEKpgdGpXa+V
         ovunSSO8LoIqPiZMG1DuJFtBxr8xzowVbAn9s5zoXql/JgTT2Hc/F9SmKPcpBjspFJgS
         b6hHOTbLYpJ/NvHyGCv7C/zbcHwNY/u5TQ6BQZHJvqSV0gaD58lmCOFVf7I6RR8EydST
         JTBw==
X-Gm-Message-State: AOAM530gLgsc7iAfjBK4YXaQI90bCqQFU4ybhY4EiLyZlQjSNIXjLQg7
        KfG1J4onh3qD9pqHHcuiXCJShQ==
X-Google-Smtp-Source: ABdhPJzJcKaoSRnA+SCXMUX/6l5BWhp7iUNyYhdEWRGhXgy4rGgcRuKmwU0Df+HMNSoxlOiwey9EQw==
X-Received: by 2002:a2e:b703:: with SMTP id j3mr22061476ljo.228.1643876778587;
        Thu, 03 Feb 2022 00:26:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 00:26:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 7/7] drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt
Date:   Thu,  3 Feb 2022 11:26:11 +0300
Message-Id: <20220203082611.2654810-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All physical encoders used by virtual encoder share the same connector,
so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 11 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 --
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1462c426c14c..afafdaf48aea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -143,6 +143,7 @@ enum dpu_enc_rc_states {
  *			link between encoder/crtc. However in this case we need
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
+ * @connector:		If a mode is set, cached pointer to the active connector
  * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
  *				all CTL paths
  * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
@@ -183,6 +184,7 @@ struct dpu_encoder_virt {
 	bool intfs_swapped;
 
 	struct drm_crtc *crtc;
+	struct drm_connector *connector;
 
 	struct dentry *debugfs_root;
 	struct mutex enc_lock;
@@ -993,6 +995,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	cstate->num_mixers = num_lm;
 
+	dpu_enc->connector = conn_state->connector;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		int num_blk;
 		struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
@@ -1030,7 +1034,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->connector = conn_state->connector;
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
@@ -1064,7 +1067,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
-		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
+		unsigned bpc = dpu_enc->connector->display_info.bpc;
 		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
 			if (!dpu_enc->hw_pp[i])
 				continue;
@@ -1168,9 +1171,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_STOP);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		dpu_enc->phys_encs[i]->connector = NULL;
-	}
+	dpu_enc->connector = NULL;
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6e80321b13c5..5093810f6663 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -174,7 +174,6 @@ struct dpu_encoder_irq {
  *	tied to a specific panel / sub-panel. Abstract type, sub-classed by
  *	phys_vid or phys_cmd for video mode or command mode encs respectively.
  * @parent:		Pointer to the containing virtual encoder
- * @connector:		If a mode is set, cached pointer to the active connector
  * @ops:		Operations exposed to the virtual encoder
  * @parent_ops:		Callbacks exposed by the parent to the phys_enc
  * @hw_mdptop:		Hardware interface to the top registers
@@ -203,7 +202,6 @@ struct dpu_encoder_irq {
  */
 struct dpu_encoder_phys {
 	struct drm_encoder *parent;
-	struct drm_connector *connector;
 	struct dpu_encoder_phys_ops ops;
 	const struct dpu_encoder_virt_ops *parent_ops;
 	struct dpu_hw_mdp *hw_mdptop;
-- 
2.34.1

