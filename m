Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686AD37361E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 10:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbhEEISV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 04:18:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:30256 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbhEEIST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 04:18:19 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 05 May 2021 01:17:23 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 May 2021 01:17:22 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 May 2021 13:46:58 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
        id 84F6F21D5B; Wed,  5 May 2021 13:46:57 +0530 (IST)
From:   Sankeerth Billakanti <sbillaka@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Subject: [PATCH v1 3/3] drm/msm/disp/dpu1: add support for edp encoder
Date:   Wed,  5 May 2021 13:46:19 +0530
Message-Id: <1620202579-19066-4-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change will enable dpu encoder support for the native
eDP interface on next generation snapdragon platforms.

Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 33 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8d94205..9f5185bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2075,7 +2075,12 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		intf_type = INTF_DSI;
 		break;
 	case DRM_MODE_ENCODER_TMDS:
-		intf_type = INTF_DP;
+		if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
+			intf_type = INTF_EDP;
+			/* PSR CMD mode not supported */
+			disp_info->capabilities = MSM_DISPLAY_CAP_VID_MODE;
+		} else
+			intf_type = INTF_DP;
 		break;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 88e9cc3..ecd7dc8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -499,6 +499,33 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	return rc;
 }
 
+static int _dpu_kms_initialize_edp(struct drm_device *dev,
+				    struct msm_drm_private *priv,
+				    struct dpu_kms *dpu_kms)
+{
+	struct drm_encoder *encoder = NULL;
+	int rc = 0;
+
+	if (!priv->edp)
+		return rc;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for eDP display\n");
+		return PTR_ERR(encoder);
+	}
+
+	rc = msm_edp_modeset_init(priv->edp, dev, encoder);
+	if (rc) {
+		DPU_ERROR("modeset_init failed for eDP, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	priv->encoders[priv->num_encoders++] = encoder;
+	return rc;
+}
+
 static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 					    struct msm_drm_private *priv,
 					    struct dpu_kms *dpu_kms)
@@ -546,6 +573,12 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 		return rc;
 	}
 
+	rc = _dpu_kms_initialize_edp(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize_eDP failed, rc = %d\n", rc);
+		return rc;
+	}
+
 	rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
 	if (rc) {
 		DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

