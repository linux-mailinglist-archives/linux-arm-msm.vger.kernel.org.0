Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A3A495849
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 03:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245005AbiAUCaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jan 2022 21:30:55 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:36601 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237728AbiAUCaz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jan 2022 21:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642732255; x=1674268255;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=0V+UK9JqSLvNbM9vE9RE59p+vwJj0ZMn3JvtV9K1GI8=;
  b=SaoJNmMB5NoBEonq9s4HjsSuW2sXoyKBXZ7gBv5GdAwo1ZmM+G0PwXmC
   /+mbEHDLvLYxiObCRGY9s6q+YMSFxilGGSYpvpAJYNAAHA8dJbWRpLu+W
   1vC1DdpkNV9ZhMKaey0nxfZOETKHLofMxi1MYKPI0Zbsr/JrZivopB4eA
   o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Jan 2022 18:30:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 18:30:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 18:30:53 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 20 Jan 2022 18:30:52 -0800
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <khsieh@codeaurora.org>,
        <dmitry.baryshkov@linaro.org>, <laurent.pinchart@ideasonboard.com>,
        <daniel@ffwll.ch>
Subject: [RFC PATCH] drm: allow passing a real encoder object for wb connector
Date:   Thu, 20 Jan 2022 18:29:55 -0800
Message-ID: <1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of creating an internal encoder for the writeback
connector to satisfy DRM requirements, allow the clients
to pass a real encoder to it by changing the drm_writeback's
encoder to a pointer.

If a real encoder is not passed, drm_writeback_connector_init
will internally allocate one.

This will help the clients to manage the real encoder states
better as they will allocate and maintain the encoder.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_writeback.c | 11 +++++++----
 include/drm/drm_writeback.h     |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index dccf4504..fdb7381 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -189,8 +189,11 @@ int drm_writeback_connector_init(struct drm_device *dev,
 	if (IS_ERR(blob))
 		return PTR_ERR(blob);
 
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
+	/* allocate the internal drm encoder if a real one wasnt passed */
+	if (!wb_connector->encoder)
+		wb_connector->encoder = devm_kzalloc(dev->dev, sizeof(struct drm_encoder), GFP_KERNEL);
+	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
+	ret = drm_encoder_init(dev, wb_connector->encoder,
 			       &drm_writeback_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
@@ -204,7 +207,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 		goto connector_fail;
 
 	ret = drm_connector_attach_encoder(connector,
-						&wb_connector->encoder);
+						wb_connector->encoder);
 	if (ret)
 		goto attach_fail;
 
@@ -233,7 +236,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 attach_fail:
 	drm_connector_cleanup(connector);
 connector_fail:
-	drm_encoder_cleanup(&wb_connector->encoder);
+	drm_encoder_cleanup(wb_connector->encoder);
 fail:
 	drm_property_blob_put(blob);
 	return ret;
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 9697d27..f0d8147 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -31,7 +31,7 @@ struct drm_writeback_connector {
 	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
 	 * function.
 	 */
-	struct drm_encoder encoder;
+	struct drm_encoder *encoder;
 
 	/**
 	 * @pixel_formats_blob_ptr:
-- 
2.7.4

