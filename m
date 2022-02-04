Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68264AA22F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 22:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242562AbiBDVTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 16:19:42 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:57664 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241779AbiBDVTb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 16:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644009571; x=1675545571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=n1xVUNDOHmq0oLGLcvjb2F/t/eFRcX9+JI9/b4KU46c=;
  b=vCPPe2MKhsuVnJcSmenR0Xp89Jqazyg3Qt5pURiHZfE3eEkouwxACmIp
   p8dfReADXN4h9BpPXY1a3V+8pKqRqOzBZ0vxDULzXfAZ8fQ6NrPHPQzWQ
   GNKkLg4x0sy1HOIeSCgDVmMm6fhs+G+ysJrObTqeOu+GdF8LjW8DpEf4u
   E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Feb 2022 13:18:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:18:02 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:18:02 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:18:02 -0800
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <markyacoub@chromium.org>,
        <quic_jesszhan@quicinc.com>
Subject: [PATCH 10/12] drm/msm/dpu: initialize dpu encoder and connector for writeback
Date:   Fri, 4 Feb 2022 13:17:23 -0800
Message-ID: <1644009445-17320-11-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize dpu encoder and connector for writeback if the
target supports it in the catalog.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 37 ++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 62 +++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b51a677..3746432 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2066,7 +2066,7 @@ static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
 }
 
 static int dpu_encoder_virt_add_phys_encs(
-		u32 display_caps,
+		struct msm_display_info *disp_info,
 		struct dpu_encoder_virt *dpu_enc,
 		struct dpu_enc_phys_init_params *params)
 {
@@ -2085,7 +2085,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		return -EINVAL;
 	}
 
-	if (display_caps & MSM_DISPLAY_CAP_VID_MODE) {
+	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
 		enc = dpu_encoder_phys_vid_init(params);
 
 		if (IS_ERR_OR_NULL(enc)) {
@@ -2098,7 +2098,7 @@ static int dpu_encoder_virt_add_phys_encs(
 		++dpu_enc->num_phys_encs;
 	}
 
-	if (display_caps & MSM_DISPLAY_CAP_CMD_MODE) {
+	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
 		enc = dpu_encoder_phys_cmd_init(params);
 
 		if (IS_ERR_OR_NULL(enc)) {
@@ -2111,6 +2111,19 @@ static int dpu_encoder_virt_add_phys_encs(
 		++dpu_enc->num_phys_encs;
 	}
 
+	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
+		enc = dpu_encoder_phys_wb_init(params);
+
+		if (IS_ERR_OR_NULL(enc)) {
+			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
+					PTR_ERR(enc));
+			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+		}
+
+		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
+		++dpu_enc->num_phys_encs;
+	}
+
 	if (params->split_role == ENC_ROLE_SLAVE)
 		dpu_enc->cur_slave = enc;
 	else
@@ -2199,9 +2212,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		}
 
 		if (!ret) {
-			ret = dpu_encoder_virt_add_phys_encs(disp_info->capabilities,
-												 dpu_enc,
-												 &phys_params);
+			ret = dpu_encoder_virt_add_phys_encs(disp_info,
+					dpu_enc, &phys_params);
 			if (ret)
 				DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
 		}
@@ -2317,11 +2329,14 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	if (!dpu_enc)
 		return ERR_PTR(-ENOMEM);
 
-	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
-			drm_enc_mode, NULL);
-	if (rc) {
-		devm_kfree(dev->dev, dpu_enc);
-		return ERR_PTR(rc);
+	/* this is handled by drm_writeback_connector_init for virtual encoder */
+	if (drm_enc_mode != DRM_MODE_ENCODER_VIRTUAL) {
+		rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
+							  drm_enc_mode, NULL);
+		if (rc) {
+			devm_kfree(dev->dev, dpu_enc);
+			return ERR_PTR(rc);
+		}
 	}
 
 	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a..6327ba9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -15,6 +16,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_writeback.h>
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
@@ -29,6 +31,7 @@
 #include "dpu_kms.h"
 #include "dpu_plane.h"
 #include "dpu_vbif.h"
+#include "dpu_writeback.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
@@ -642,6 +645,56 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	return 0;
 }
 
+static int _dpu_kms_initialize_writeback(struct drm_device *dev,
+		struct msm_drm_private *priv, struct dpu_kms *dpu_kms)
+{
+	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
+	int rc, i;
+	const u32 *wb_formats;
+	int n_formats;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for dsi display\n");
+		return PTR_ERR(encoder);
+	}
+
+	memset(&info, 0, sizeof(info));
+
+	for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
+		if (dpu_kms->catalog->wb[i].id == WB_2) {
+			wb_formats = dpu_kms->catalog->wb[i].format_list;
+			n_formats = dpu_kms->catalog->wb[i].num_formats;
+		}
+	}
+
+	rc = dpu_writeback_init(dev, encoder, encoder->helper_private, wb_formats,
+			n_formats);
+	if (rc) {
+		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	priv->encoders[priv->num_encoders++] = encoder;
+
+	info.num_of_h_tiles = 1;
+	/* use only WB idx 2 instance for DPU */
+	info.h_tile_instance[0] = WB_2;
+	info.capabilities = MSM_DISPLAY_CAP_HOT_PLUG | MSM_DISPLAY_CAP_EDID;
+	info.intf_type = encoder->encoder_type;
+
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc) {
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+				  encoder->base.id, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
 /**
  * _dpu_kms_setup_displays - create encoders, bridges and connectors
  *                           for underlying displays
@@ -668,6 +721,15 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 		return rc;
 	}
 
+	/* Since WB isn't a driver check the catalog before initializing */
+	if (dpu_kms->catalog->wb_count) {
+		rc = _dpu_kms_initialize_writeback(dev, priv, dpu_kms);
+		if (rc) {
+			DPU_ERROR("initialize_WB failed, rc = %d\n", rc);
+			return rc;
+		}
+	}
+
 	return rc;
 }
 
-- 
2.7.4

