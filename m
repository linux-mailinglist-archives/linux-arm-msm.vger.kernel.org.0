Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A36650A2C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389450AbiDUOkJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389438AbiDUOkH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:40:07 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C64540925;
        Thu, 21 Apr 2022 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650551836; x=1682087836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=R5cDg3kYhOcxA4mdgIYALF8qEcQKVKv1OnuEaH88FN8=;
  b=VnFhwVWlALy/PO63m3AeL/DAhbXufiXhl9NDMXjJik5iAgR/cmmCXofZ
   5QxjyNCD9HIcFvk8zb7Gtp0pg9vdt2HNXMLLLKyNszJk8AEMe4S748HOp
   aSLVQQDAWYGKoRdMJH1I2vwwkrEiH9hoSt6Z9rWCojrXhSVnkF9arKnja
   I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 21 Apr 2022 07:37:16 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 07:37:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 07:37:14 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 07:37:08 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_kalyant@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dianders@chromium.org>,
        <quic_khsieh@quicinc.com>, <bjorn.andersson@linaro.org>,
        <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <quic_vproddut@quicinc.com>,
        <quic_aravindh@quicinc.com>, <steev@kali.org>
Subject: [PATCH v8 1/4] drm/msm/dp: Add eDP support via aux_bus
Date:   Thu, 21 Apr 2022 20:06:48 +0530
Message-ID: <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for generic eDP sink through aux_bus. The eDP/DP
controller driver should support aux transactions originating from the
panel-edp driver and hence should be initialized and ready.

The panel bridge supporting the panel should be ready before the bridge
connector is initialized. The generic panel probe needs the controller
resources to be enabled to support the aux transactions originating from
the panel probe.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
Changes in v8:
  - handle corner cases
  - add comment for the bridge ops

Changes in v7:
  - aux_bus is mandatory for eDP
  - connector type check modified to just check for eDP

Changes in v6:
  - Remove initialization
  - Fix aux_bus node leak
  - Split the patches

 drivers/gpu/drm/msm/dp/dp_display.c | 69 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     | 21 ++++++++---
 drivers/gpu/drm/msm/dp/dp_parser.c  | 23 ++-----------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 13 ++++++-
 5 files changed, 97 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d7a19d6..3d03c77 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -10,6 +10,7 @@
 #include <linux/component.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
+#include <drm/dp/drm_dp_aux_bus.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -259,14 +260,12 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	dp->dp_display.drm_dev = drm;
 	priv->dp[dp->id] = &dp->dp_display;
 
-	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
+	rc = dp->parser->parse(dp->parser);
 	if (rc) {
 		DRM_ERROR("device tree parsing failed\n");
 		goto end;
 	}
 
-	dp->dp_display.next_bridge = dp->parser->next_bridge;
-
 	dp->aux->drm_dev = drm;
 	rc = dp_aux_register(dp->aux);
 	if (rc) {
@@ -1319,6 +1318,8 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 	dp->dp_display.connector_type = desc->connector_type;
+	dp->dp_display.is_edp =
+		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
@@ -1508,7 +1509,8 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp_hpd_event_setup(dp);
 
-	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+	if (!dp_display->is_edp)
+		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
@@ -1530,6 +1532,61 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	}
 }
 
+static int dp_display_get_next_bridge(struct msm_dp *dp)
+{
+	int rc;
+	struct dp_display_private *dp_priv;
+	struct device_node *aux_bus;
+	struct device *dev;
+
+	dp_priv = container_of(dp, struct dp_display_private, dp_display);
+	dev = &dp_priv->pdev->dev;
+	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
+
+	if (aux_bus && dp->is_edp) {
+		dp_display_host_init(dp_priv);
+		dp_catalog_ctrl_hpd_config(dp_priv->catalog);
+		dp_display_host_phy_init(dp_priv);
+		enable_irq(dp_priv->irq);
+
+		rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
+		of_node_put(aux_bus);
+		if (rc)
+			goto edp_error;
+	} else if (dp->is_edp) {
+		DRM_ERROR("eDP aux_bus not found\n");
+		rc = -ENODEV;
+		goto error;
+	}
+
+	/*
+	 * External bridges are mandatory for eDP interfaces: one has to
+	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
+	 *
+	 * For DisplayPort interfaces external bridges are optional, so
+	 * silently ignore an error if one is not present (-ENODEV).
+	 */
+	rc = dp_parser_find_next_bridge(dp_priv->parser);
+	if (rc && dp->is_edp) {
+		DRM_ERROR("eDP: cannot find the next bridge, rc = %d\n", rc);
+		goto edp_error;
+	} else if (rc && rc != -ENODEV) {
+		DRM_ERROR("DP: cannot find the next bridge, rc = %d\n", rc);
+		goto error;
+	}
+
+	dp->next_bridge = dp_priv->parser->next_bridge;
+
+	return 0;
+
+edp_error:
+	disable_irq(dp_priv->irq);
+	dp_display_host_phy_exit(dp_priv);
+	dp_display_host_deinit(dp_priv);
+error:
+	return rc;
+}
+
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
@@ -1553,6 +1610,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_display->encoder = encoder;
 
+	ret = dp_display_get_next_bridge(dp_display);
+	if (ret)
+		return ret;
+
 	dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
 	if (IS_ERR(dp_display->bridge)) {
 		ret = PTR_ERR(dp_display->bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 49a1d89..1377cc3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -21,6 +21,7 @@ struct msm_dp {
 	bool audio_enabled;
 	bool power_on;
 	unsigned int connector_type;
+	bool is_edp;
 
 	hdmi_codec_plugged_cb plugged_cb;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 7ce1aca..8a75c55 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -114,10 +114,23 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 	bridge->funcs = &dp_bridge_ops;
 	bridge->type = dp_display->connector_type;
 
-	bridge->ops =
-		DRM_BRIDGE_OP_DETECT |
-		DRM_BRIDGE_OP_HPD |
-		DRM_BRIDGE_OP_MODES;
+	/*
+	 * Many ops only make sense for DP. Why?
+	 * - Detect/HPD are used by DRM to know if a display is _physically_
+	 *   there, not whether the display is powered on / finished initting.
+	 *   On eDP we assume the display is always there because you can't
+	 *   know until power is applied. If we don't implement the ops DRM will
+	 *   assume our display is always there.
+	 * - Currently eDP mode reading is driven by the panel driver. This
+	 *   allows the panel driver to properly power itself on to read the
+	 *   modes.
+	 */
+	if (!dp_display->is_edp) {
+		bridge->ops =
+			DRM_BRIDGE_OP_DETECT |
+			DRM_BRIDGE_OP_HPD |
+			DRM_BRIDGE_OP_MODES;
+	}
 
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 1056b8d..4bdbf91 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -265,7 +265,7 @@ static int dp_parser_clock(struct dp_parser *parser)
 	return 0;
 }
 
-static int dp_parser_find_next_bridge(struct dp_parser *parser)
+int dp_parser_find_next_bridge(struct dp_parser *parser)
 {
 	struct device *dev = &parser->pdev->dev;
 	struct drm_bridge *bridge;
@@ -279,7 +279,7 @@ static int dp_parser_find_next_bridge(struct dp_parser *parser)
 	return 0;
 }
 
-static int dp_parser_parse(struct dp_parser *parser, int connector_type)
+static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
 
@@ -300,25 +300,6 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
 	if (rc)
 		return rc;
 
-	/*
-	 * External bridges are mandatory for eDP interfaces: one has to
-	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
-	 *
-	 * For DisplayPort interfaces external bridges are optional, so
-	 * silently ignore an error if one is not present (-ENODEV).
-	 */
-	rc = dp_parser_find_next_bridge(parser);
-	if (rc == -ENODEV) {
-		if (connector_type == DRM_MODE_CONNECTOR_eDP) {
-			DRM_ERROR("eDP: next bridge is not present\n");
-			return rc;
-		}
-	} else if (rc) {
-		if (rc != -EPROBE_DEFER)
-			DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
-		return rc;
-	}
-
 	/* Map the corresponding regulator information according to
 	 * version. Currently, since we only have one supported platform,
 	 * mapping the regulator directly.
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index d371bae..950416c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -125,7 +125,7 @@ struct dp_parser {
 	u32 max_dp_lanes;
 	struct drm_bridge *next_bridge;
 
-	int (*parse)(struct dp_parser *parser, int connector_type);
+	int (*parse)(struct dp_parser *parser);
 };
 
 /**
@@ -141,4 +141,15 @@ struct dp_parser {
  */
 struct dp_parser *dp_parser_get(struct platform_device *pdev);
 
+/**
+ * dp_parser_find_next_bridge() - find an additional bridge to DP
+ *
+ * @parser: dp_parser data from client
+ * return: 0 if able to get the bridge else return an error code
+ *
+ * This function is used to find any additional bridge attached to
+ * the DP controller. The eDP interface requires a panel bridge.
+ */
+int dp_parser_find_next_bridge(struct dp_parser *parser);
+
 #endif
-- 
2.7.4

