Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81C2E515479
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239127AbiD2Tc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 15:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377206AbiD2Tcz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 15:32:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4016DD0809
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:29:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so15823945lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UhpZL5l0f3vh0d/Ml8kKWbY8CArm0yb/cqnRf9hoyzA=;
        b=F2/j3U7fr2mTYgL8YPuSZje27XcsSQgMmjgKSAzTfqA9T5CAdNLeumG2PTdn+ieOM/
         2ldvmQQr+xd7Am4jc74DqiJavKZeVZ/h/9TD8BLFE83MJlyZOKIcAX/6R5c3TNJ0z+W6
         E/RtLlB324Rqa5dX3UH/eXU4tglb9GNG7rkse01iDSlnMvuRO+u+2vp93Jsx/EEdmUGz
         YlBDn8Kwuf0TG7MvwE1CHIYiHH12BVdF8V+ZSR8bNiu68sGsbQOpbgFq/4d4mnKNFshj
         +1HEwZ57Dg+hIH5s4f5VGSCunaMMGh/hgeOf9GQ14p5kQjbZGxIJRuGJRVIlCycTLm/h
         zo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UhpZL5l0f3vh0d/Ml8kKWbY8CArm0yb/cqnRf9hoyzA=;
        b=ybbiN/rVlsKY6O5TU6v2ZqogjZS/sHfHIjNtbRouORv0p9jmephHyADb3/h9ErPLqq
         hzqF1HNPmZcH+XPLvT8gsJ7R+McJUvIrYlp28z3A3myYaCMlLT5buEgFT4/OgbQGmtOU
         VyxpdB1RLI4VoqlspB0ckMlgZZ8Kl5WtEHRv3sIOrPX7hPbdZQ/2ZNr+uBjUWb7VhmXi
         D5mtvP5uT55ZQHy4Kng+rC5tvxGkDUBvqGYAP3rzkVgiWfQwyGN/LdG/kSlSBNUg2BND
         oWov4kEfnpf0/ExrRUziixbCcYafyqkcMetELZAyYB8QBTYP1Z8906H7yJcbCrjaUWlZ
         USHA==
X-Gm-Message-State: AOAM5307gWZYu8W0V9NOzP8l034W5J1zTae3Q2/9ZPB5eL5IgT6+nmS3
        RH9tbTy8LspRqk9t5byXS2iTcCBxuIgD8Q==
X-Google-Smtp-Source: ABdhPJwbRIdOU0t3vyTifaegh0vETKAf/A2nQXHy38LK7MHv/O4wW9W0UzOqCnqyYf5+bPyAVJ6C9Q==
X-Received: by 2002:a05:6512:1509:b0:443:e7fa:1c68 with SMTP id bq9-20020a056512150900b00443e7fa1c68mr541266lfb.58.1651260574586;
        Fri, 29 Apr 2022 12:29:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y10-20020ac24e6a000000b0047255d211e7sm5522lfs.278.2022.04.29.12.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:29:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 4/4] drm/msm/dp: Implement hpd_notify()
Date:   Fri, 29 Apr 2022 22:29:28 +0300
Message-Id: <20220429192928.3697407-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
References: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
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

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The Qualcomm DisplayPort driver contains traces of the necessary
plumbing to hook up USB HPD, in the form of the dp_hpd module and the
dp_usbpd_cb struct. Use this as basis for implementing the
hpd_notify() callback, by amending the dp_hpd module with the
missing logic.

Overall the solution is similar to what's done downstream, but upstream
all the code to disect the HPD notification lives on the calling side of
drm_connector_oob_hotplug_event().

drm_connector_oob_hotplug_event() performs the lookup of the
drm_connector based on fwnode, hence the need to assign the fwnode in
dp_drm_connector_init().

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[DB: rebased to use drm_bridge_connector]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  3 +++
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 drivers/gpu/drm/msm/dp/dp_hpd.c     | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_hpd.h     |  5 +++++
 6 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c38832304353..31540d1409eb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1300,6 +1300,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
+	dp->dp_display.dev = &pdev->dev;
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 	dp->dp_display.connector_type = desc->connector_type;
@@ -1789,3 +1790,13 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	dp_display->dp_mode.h_active_low =
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 }
+
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
+	struct dp_display_private *dp_display = container_of(dp, struct dp_display_private, dp_display);
+
+	dp_display->usbpd->hpd_notify(dp_display->usbpd, status);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4f9fe4d7610b..2d2614bc5a14 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -11,6 +11,7 @@
 #include "disp/msm_disp_snapshot.h"
 
 struct msm_dp {
+	struct device *dev;
 	struct drm_device *drm_dev;
 	struct device *codec_dev;
 	struct drm_bridge *bridge;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 62d58b9c4647..821cfd37b1fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -68,6 +68,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.mode_valid   = dp_bridge_mode_valid,
 	.get_modes    = dp_bridge_get_modes,
 	.detect       = dp_bridge_detect,
+	.hpd_notify   = dp_bridge_hpd_notify,
 };
 
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
@@ -138,6 +139,8 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 	if (IS_ERR(connector))
 		return connector;
 
+	connector->fwnode = fwnode_handle_get(dev_fwnode(dp_display->dev));
+
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
 	return connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index f4b1ed1e24f7..3b7480a86844 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
 			const struct drm_display_mode *adjusted_mode);
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
index db98a1d431eb..40ca91c7dabe 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -7,6 +7,8 @@
 
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_print.h>
 
 #include "dp_hpd.h"
 
@@ -45,6 +47,24 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
 	return rc;
 }
 
+static void dp_hpd_hpd_notify(struct dp_usbpd *dp_usbpd,
+			     enum drm_connector_status status)
+{
+	struct dp_hpd_private *hpd_priv = container_of(dp_usbpd, struct dp_hpd_private, dp_usbpd);
+
+	DRM_DEBUG_DP("status: %d connected: %d\n", status, dp_usbpd->connected);
+
+	if (!dp_usbpd->connected && status == connector_status_connected) {
+		dp_usbpd->connected = true;
+		hpd_priv->dp_cb->configure(hpd_priv->dev);
+	} else if (status != connector_status_connected) {
+		dp_usbpd->connected = false;
+		hpd_priv->dp_cb->disconnect(hpd_priv->dev);
+	} else {
+		hpd_priv->dp_cb->attention(hpd_priv->dev);
+	}
+}
+
 struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
 {
 	struct dp_hpd_private *dp_hpd;
@@ -62,6 +82,7 @@ struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
 	dp_hpd->dp_cb = cb;
 
 	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
+	dp_hpd->dp_usbpd.hpd_notify = dp_hpd_hpd_notify;
 
 	return &dp_hpd->dp_usbpd;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
index 8feec5aa5027..ff40790831a4 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.h
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
@@ -29,7 +29,9 @@ enum plug_orientation {
  * @hpd_irq: Change in the status since last message
  * @alt_mode_cfg_done: bool to specify alt mode status
  * @debug_en: bool to specify debug mode
+ * @connected: cable currently connected
  * @connect: simulate disconnect or connect for debug mode
+ * @hpd_notify: deliver oob event to the usbpd code
  */
 struct dp_usbpd {
 	enum plug_orientation orientation;
@@ -41,8 +43,11 @@ struct dp_usbpd {
 	bool hpd_irq;
 	bool alt_mode_cfg_done;
 	bool debug_en;
+	bool connected;
 
 	int (*connect)(struct dp_usbpd *dp_usbpd, bool hpd);
+	void (*hpd_notify)(struct dp_usbpd *dp_usbpd,
+			  enum drm_connector_status status);
 };
 
 /**
-- 
2.35.1

