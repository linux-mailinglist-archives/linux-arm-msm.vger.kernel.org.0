Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8A2555233
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 19:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377342AbiFVRSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 13:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377345AbiFVRSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 13:18:51 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91343275D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655918328; x=1687454328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ihGSAsJ3cydaFdulsq7GLrj9h4j3XwT25a0FPkAFEYI=;
  b=abXEfS+1Eae1jOkFl0x6gOLfjBe33si5cnfvTOnGuJGoQtM7r10jPf1b
   vD8ZtAEnpIqX3fhTmMWOFRYxI9/ZgTIFsl36TZmv3ZotPWPfT2mISq94L
   VlpugG7zdLylUtd1cGQzpK9kqFy0LK197gnNDwmlVOzs4HRTKhhcwfFmN
   U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jun 2022 10:18:47 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 10:18:47 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:18:45 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 1/4] drm/msm/dpu: Move LM CRC code into separate method
Date:   Wed, 22 Jun 2022 10:18:32 -0700
Message-ID: <20220622171835.7558-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622171835.7558-1-quic_jesszhan@quicinc.com>
References: <20220622171835.7558-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Changes since V1:
- Move common bitmasks to dpu_hw_util.h
- Move common CRC methods to dpu_hw_util.c
- Update copyrights
- Change crcs array to a dynamically allocated array and added it as a
  member of crtc_state

Changes since V2:
- Put changes for hw_util into a separate commit
- Revert crcs array to a static array
- Add else case for set_crc_source to return EINVAL if no valid source
  is selected
- Add DPU_CRTC_MAX_CRC_ENTRIES macro

Changes since V3:
- Move crcs array into dpu_crtc_get_lm_crc
- Remove comment about crcs array in dpu_crtc_state struct
- Revert `lm` rename
- Remove DPU_CRTC_MAX_CRC_ENTRIES macro
- Return EINVAL in dpu_crtc_get_crc if no valid CRC source is set

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 65 +++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  2 +
 2 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b56f777dbd0e..b57140c3671a 100644
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
@@ -146,16 +162,10 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
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
+	else
+		ret = -EINVAL;
 
 cleanup:
 	drm_modeset_unlock(&crtc->mutex);
@@ -174,26 +184,17 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 	return dpu_encoder_get_vsync_count(encoder);
 }
 
-
-static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
+		struct dpu_crtc_state *crtc_state)
 {
-	struct dpu_crtc_state *crtc_state;
 	struct dpu_crtc_mixer *m;
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
 
 		m = &crtc_state->mixers[i];
@@ -214,6 +215,22 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 			drm_crtc_accurate_vblank_count(crtc), crcs);
 }
 
+static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+{
+	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
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
+	return -EINVAL;
+}
+
 static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 					   bool in_vblank_irq,
 					   int *vpos, int *hpos,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c394fcc..20df23fe74ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -201,6 +201,8 @@ struct dpu_crtc {
  * @mixers        : List of active mixers
  * @num_ctls      : Number of ctl paths in use
  * @hw_ctls       : List of active ctl paths
+ * @crc_source    : CRC source
+ * @crc_frame_skip_count: Number of frames skipped before getting CRC
  */
 struct dpu_crtc_state {
 	struct drm_crtc_state base;
-- 
2.35.1

