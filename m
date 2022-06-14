Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D7B54BC9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 23:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241409AbiFNVN5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 17:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241509AbiFNVNx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 17:13:53 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE944FC7D
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655241232; x=1686777232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PrXVr0Aaa+LrCCYvHc+q7kcrZfqw54mijXT8Ycb4B84=;
  b=cfYnPwaPL6Q9TN38albU4eCr8g2SS4wIDIC5XcWfF+h41IU/TsA5VHkV
   E4AU5hv9qap3DqONUY8/FuLvl2um2N82s9vLfkSq3h4/E0Bb5zDo0mSGS
   5SKjHF4QNla5tnJtqfpjjX2t2qWEzg4daKlnbg7bUe14IQzMn0sDrecR4
   4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Jun 2022 14:13:51 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 14:13:51 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 14 Jun 2022 14:13:51 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 3/3] drm/msm/dpu: Add interface support for CRC debugfs
Date:   Tue, 14 Jun 2022 14:13:28 -0700
Message-ID: <20220614211328.216-4-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614211328.216-1-quic_jesszhan@quicinc.com>
References: <20220614211328.216-1-quic_jesszhan@quicinc.com>
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

Add support for writing CRC values for the interface block to
the debugfs by calling the necessary MISR setup/collect methods.

Changes since V1:
- Set values_cnt to only include phys with backing hw_intf
- Loop over all drm_encs connected to crtc

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 49 ++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 64 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 +++++++
 4 files changed, 134 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 16742a66878e..8c9933b2337f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
 	if (!strcmp(src_name, "auto") ||
 	    !strcmp(src_name, "lm"))
 		return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
+	if (!strcmp(src_name, "intf"))
+		return DPU_CRTC_CRC_SOURCE_INTF;
 
 	return DPU_CRTC_CRC_SOURCE_INVALID;
 }
@@ -99,8 +101,14 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
 		return -EINVAL;
 	}
 
-	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
+	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
 		*values_cnt = crtc_state->num_mixers;
+	} else if (source == DPU_CRTC_CRC_SOURCE_INTF) {
+		struct drm_encoder *drm_enc;
+
+		drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
+			*values_cnt += dpu_encoder_get_num_phys(drm_enc);
+	}
 
 	crtc_state->crcs = kcalloc(*values_cnt, sizeof(crtc_state->crcs), GFP_KERNEL);
 
@@ -123,6 +131,14 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
 	}
 }
 
+static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
+{
+	struct drm_encoder *drm_enc;
+
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
+		dpu_encoder_setup_misr(drm_enc);
+}
+
 static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
 	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
@@ -175,6 +191,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
 		dpu_crtc_setup_lm_misr(crtc_state);
+	else if (source == DPU_CRTC_CRC_SOURCE_INTF)
+		dpu_crtc_setup_encoder_misr(crtc);
 
 cleanup:
 	drm_modeset_unlock(&crtc->mutex);
@@ -220,11 +238,31 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc, struct dpu_crtc_state *crt
 			drm_crtc_accurate_vblank_count(crtc), crtc_state->crcs);
 }
 
-static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
 {
-	struct dpu_crtc_state *crtc_state;
+	struct drm_encoder *drm_enc;
+	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
+	int rc, pos = 0;
 
-	crtc_state = to_dpu_crtc_state(crtc->state);
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask) {
+		rc = dpu_encoder_get_crc(drm_enc, crtc_state->crcs, pos);
+		if (rc < 0) {
+			if (rc != -ENODATA)
+				DRM_DEBUG_DRIVER("MISR read failed\n");
+
+			return rc;
+		}
+
+		pos += rc;
+	}
+
+	return drm_crtc_add_crc_entry(crtc, true,
+			drm_crtc_accurate_vblank_count(crtc), crtc_state->crcs);
+}
+
+static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+{
+	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
 
 	/* Skip first 2 frames in case of "uncooked" CRCs */
 	if (crtc_state->crc_frame_skip_count < 2) {
@@ -235,6 +273,9 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
 		return dpu_crtc_get_lm_crc(crtc, crtc_state);
 
+	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_INTF)
+		return dpu_crtc_get_encoder_crc(crtc);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 4bf45e3343ef..5db84ea796db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -73,11 +74,13 @@ struct dpu_crtc_smmu_state_data {
  * enum dpu_crtc_crc_source: CRC source
  * @DPU_CRTC_CRC_SOURCE_NONE: no source set
  * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
+ * @DPU_CRTC_CRC_SOURCE_INTF: CRC in phys interface
  * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
  */
 enum dpu_crtc_crc_source {
 	DPU_CRTC_CRC_SOURCE_NONE = 0,
 	DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
+	DPU_CRTC_CRC_SOURCE_INTF,
 	DPU_CRTC_CRC_SOURCE_MAX,
 	DPU_CRTC_CRC_SOURCE_INVALID = -1
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52516eb20cb8..2cbfed5c627e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
+#include <drm/drm_vblank.h>
 #include <drm/drm_probe_helper.h>
 
 #include "msm_drv.h"
@@ -225,6 +226,69 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 	return dpu_enc->wide_bus_en;
 }
 
+int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	int i, num_intf = 0;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (phys->hw_intf)
+			num_intf++;
+	}
+
+	return num_intf;
+}
+
+void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+
+	int i;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
+			continue;
+
+		phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
+	}
+}
+
+int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos)
+{
+	struct dpu_encoder_virt *dpu_enc;
+
+	int i, rc = 0, entries_added = 0;
+
+	if (!drm_enc->crtc) {
+		DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
+		return -EINVAL;
+	}
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
+			continue;
+
+		rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[pos + i]);
+		if (rc)
+			return rc;
+		entries_added++;
+	}
+
+	return entries_added;
+}
+
 static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
 {
 	struct dpu_hw_dither_cfg dither_cfg = { 0 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 781d41c91994..375370029cb9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -174,6 +175,27 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_get_num_phys - get number of physical encoders contained in virtual
+ *                            encoder
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * Returns:     Number of physical encoders for given drm encoder
+ */
+int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc);
+
+/**
+ * dpu_encoder_setup_misr - enable misr calculations
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
+
+/**
+ * dpu_encoder_get_crc - get the crc value from interface blocks
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * Returns:     0 on success, error otherwise
+ */
+int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
+
 /**
  * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
  * @drm_enc:    Pointer to previously created drm encoder structure
-- 
2.35.1

