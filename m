Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29E6247DCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 07:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgHRFNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 01:13:25 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:56301 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726421AbgHRFNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 01:13:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597727604; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=n1Y61WkQg7cBziVdmHLygNO9WfRRX8uTW1qGmcj4XvM=; b=q43UNKQPNlactOAVZ0byyULDxGMOESGBfKm0u8UqwToBoDfV/l/z++kQj9hFTMm9WJuG2vyG
 RyZ33bwMWwdty0cuQ0my5AtjrZdFEeZXCSJ4XixrcZDaPSq7j3rgS+Zb+fZt96IMOt/GUXma
 Jct9St2khAp0ENGDFq9xUmbrAG8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f3b633991f8def8b20c2c22 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 05:12:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 89B4AC43387; Tue, 18 Aug 2020 05:12:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5244C43387;
        Tue, 18 Aug 2020 05:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5244C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, robdclark@gmail.com
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v11 4/5] drm/msm/dpu: add display port support in DPU
Date:   Mon, 17 Aug 2020 22:11:36 -0700
Message-Id: <20200818051137.21478-5-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818051137.21478-1-tanmay@codeaurora.org>
References: <20200818051137.21478-1-tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeykumar Sankaran <jsanka@codeaurora.org>

Add display port support in DPU by creating hooks
for DP encoder enumeration and encoder mode
initialization.

changes in v2:
	- rebase on [2] (Sean Paul)
	- remove unwanted error checks and
	  switch cases (Jordan Crouse)

[1] https://lwn.net/Articles/768265/
[2] https://lkml.org/lkml/2018/11/17/87

changes in V3:
-- Moved this change as part of the DP driver changes.
-- Addressed compilation issues on the latest code base.

Changes in v6:
-- Fix checkpatch.pl warning

Changes in v7: Remove depends-on tag from commit message.

Changes in v8: None

Changes in v9: None

Signed-off-by: Jeykumar Sankaran <jsanka@codeaurora.org>
Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  8 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 65 +++++++++++++++++----
 2 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8b14d7c42f37..6a9e257d2fe6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2025,7 +2025,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 {
 	int ret = 0;
 	int i = 0;
-	enum dpu_intf_type intf_type;
+	enum dpu_intf_type intf_type = INTF_NONE;
 	struct dpu_enc_phys_init_params phys_params;
 
 	if (!dpu_enc) {
@@ -2047,9 +2047,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	case DRM_MODE_ENCODER_DSI:
 		intf_type = INTF_DSI;
 		break;
-	default:
-		DPU_ERROR_ENC(dpu_enc, "unsupported display interface type\n");
-		return -EINVAL;
+	case DRM_MODE_ENCODER_TMDS:
+		intf_type = INTF_DP;
+		break;
 	}
 
 	WARN_ON(disp_info->num_of_h_tiles < 1);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c0a4d4e16d82..62bc33cb0d3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -479,6 +479,33 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	return rc;
 }
 
+static int _dpu_kms_initialize_displayport(struct drm_device *dev,
+					    struct msm_drm_private *priv,
+					    struct dpu_kms *dpu_kms)
+{
+	struct drm_encoder *encoder = NULL;
+	int rc = 0;
+
+	if (!priv->dp)
+		return rc;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for dsi display\n");
+		return PTR_ERR(encoder);
+	}
+
+	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
+	if (rc) {
+		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	priv->encoders[priv->num_encoders++] = encoder;
+	return rc;
+}
+
 /**
  * _dpu_kms_setup_displays - create encoders, bridges and connectors
  *                           for underlying displays
@@ -491,12 +518,21 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
 {
-	/**
-	 * Extend this function to initialize other
-	 * types of displays
-	 */
+	int rc = 0;
+
+	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize_dsi failed, rc = %d\n", rc);
+		return rc;
+	}
 
-	return _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
+	rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
+		return rc;
+	}
+
+	return rc;
 }
 
 static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
@@ -681,13 +717,20 @@ static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
 	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
 			MSM_DISPLAY_CAP_VID_MODE;
 
-	/* TODO: No support for DSI swap */
-	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-		if (priv->dsi[i]) {
-			info.h_tile_instance[info.num_of_h_tiles] = i;
-			info.num_of_h_tiles++;
+	switch (info.intf_type) {
+	case DRM_MODE_ENCODER_DSI:
+		/* TODO: No support for DSI swap */
+		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+			if (priv->dsi[i]) {
+				info.h_tile_instance[info.num_of_h_tiles] = i;
+				info.num_of_h_tiles++;
+			}
 		}
-	}
+		break;
+	case DRM_MODE_ENCODER_TMDS:
+		info.num_of_h_tiles = 1;
+		break;
+	};
 
 	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
 	if (rc)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

