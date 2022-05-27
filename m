Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A79536731
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 20:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242227AbiE0Syi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 May 2022 14:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354437AbiE0Syg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 May 2022 14:54:36 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93364CD49
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 May 2022 11:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653677673; x=1685213673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GdXSuoeLRNHrQDIxDPsBr+RJlcnfDvRRUC4dxm/jdlc=;
  b=WRAMn4GHKvbNDyXuTyrUSt49fx+L9/e/dJ3P6DLPE7MfymlC2mHChQbj
   xm/U0TeQpGgCTB9iigeZ8kmnvI0FmFfNDeEu3rbnKi1h6ri2S5t4WBKsy
   zc8PvRW0uVP6ksEj0B3ST6yRLtTqmuAfPsOMQ09af+ma+1UBAFtAn1NBt
   A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 May 2022 11:54:33 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 11:54:33 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 27 May 2022 11:54:33 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/3] drm/msm/dpu: Move LM CRC code into separate method
Date:   Fri, 27 May 2022 11:54:05 -0700
Message-ID: <20220527185407.162-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527185407.162-1-quic_jesszhan@quicinc.com>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move layer mixer-specific section of dpu_crtc_get_crc() into a separate
helper method. This way, we can make it easier to get CRCs from other HW
blocks by adding other get_crc helper methods.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 72 +++++++++++++++---------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b56f777dbd0e..ae09466663cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -99,17 +100,32 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
 	return 0;
 }
 
+static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
+{
+	struct dpu_crtc_mixer *m;
+	int i;
+
+	for (i = 0; i < crtc_state->num_mixers; ++i) {
+		m = &crtc_state->mixers[i];
+
+		if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
+			continue;
+
+		/* Calculate MISR over 1 frame */
+		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
+	}
+}
+
 static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
 	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
 	enum dpu_crtc_crc_source current_source;
 	struct dpu_crtc_state *crtc_state;
 	struct drm_device *drm_dev = crtc->dev;
-	struct dpu_crtc_mixer *m;
 
 	bool was_enabled;
 	bool enable = false;
-	int i, ret = 0;
+	int ret = 0;
 
 	if (source < 0) {
 		DRM_DEBUG_DRIVER("Invalid CRC source %s for CRTC%d\n", src_name, crtc->index);
@@ -146,16 +162,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	crtc_state->crc_frame_skip_count = 0;
 
-	for (i = 0; i < crtc_state->num_mixers; ++i) {
-		m = &crtc_state->mixers[i];
-
-		if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
-			continue;
-
-		/* Calculate MISR over 1 frame */
-		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
-	}
-
+	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
+		dpu_crtc_setup_lm_misr(crtc_state);
 
 cleanup:
 	drm_modeset_unlock(&crtc->mutex);
@@ -174,34 +182,24 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 	return dpu_encoder_get_vsync_count(encoder);
 }
 
-
-static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc, struct dpu_crtc_state *crtc_state)
 {
-	struct dpu_crtc_state *crtc_state;
-	struct dpu_crtc_mixer *m;
+	struct dpu_crtc_mixer *lm;
 	u32 crcs[CRTC_DUAL_MIXERS];
 
-	int i = 0;
 	int rc = 0;
-
-	crtc_state = to_dpu_crtc_state(crtc->state);
+	int i;
 
 	BUILD_BUG_ON(ARRAY_SIZE(crcs) != ARRAY_SIZE(crtc_state->mixers));
 
-	/* Skip first 2 frames in case of "uncooked" CRCs */
-	if (crtc_state->crc_frame_skip_count < 2) {
-		crtc_state->crc_frame_skip_count++;
-		return 0;
-	}
-
 	for (i = 0; i < crtc_state->num_mixers; ++i) {
 
-		m = &crtc_state->mixers[i];
+		lm = &crtc_state->mixers[i];
 
-		if (!m->hw_lm || !m->hw_lm->ops.collect_misr)
+		if (!lm->hw_lm || !lm->hw_lm->ops.collect_misr)
 			continue;
 
-		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
+		rc = lm->hw_lm->ops.collect_misr(lm->hw_lm, &crcs[i]);
 
 		if (rc) {
 			if (rc != -ENODATA)
@@ -214,6 +212,24 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 			drm_crtc_accurate_vblank_count(crtc), crcs);
 }
 
+static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+{
+	struct dpu_crtc_state *crtc_state;
+
+	crtc_state = to_dpu_crtc_state(crtc->state);
+
+	/* Skip first 2 frames in case of "uncooked" CRCs */
+	if (crtc_state->crc_frame_skip_count < 2) {
+		crtc_state->crc_frame_skip_count++;
+		return 0;
+	}
+
+	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
+		return dpu_crtc_get_lm_crc(crtc, crtc_state);
+
+	return 0;
+}
+
 static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 					   bool in_vblank_irq,
 					   int *vpos, int *hpos,
-- 
2.35.1

