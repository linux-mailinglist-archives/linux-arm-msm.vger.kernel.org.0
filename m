Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88950218024
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 09:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgGHHAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 03:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgGHHAN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 03:00:13 -0400
Received: from localhost.localdomain (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DEA920771;
        Wed,  8 Jul 2020 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594191612;
        bh=rIwQJ9XgMhIS4v7G1h7P96EkZRD4YP9JPOfTgw+cIoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UuF6eIm83gFRGSPVdGCn1wDPNxbsmuI9l0gqDSBrKa6ohCKOxFMCc1sGCi2/1wrwS
         RadZz5K3T7vb3jZJ4mSwf7jvzJOXLveNTDC9dTBvb08lVUhax18ZzA5Rw694Rsmu9q
         KZ8p3DbvAz6U3A/ABXp1Z6cW6NXcukSqn+9UIhv0=
From:   Vinod Koul <vkoul@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH v4 4/4] drm/msm/dsi: attach external bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date:   Wed,  8 Jul 2020 12:29:24 +0530
Message-Id: <20200708065924.59257-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708065924.59257-1-vkoul@kernel.org>
References: <20200708065924.59257-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Modern bridges do not create the connector and expect the display driver
to do so. Hence, create the drm connector in msm display driver and add
use flag DRM_BRIDGE_ATTACH_NO_CONNECTOR to attach bridges

Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  7 +------
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 27 +++++++++++++--------------
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 55ea4bc2ee9c..617075e3e3f0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -219,12 +219,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	/*
-	 * check if the dsi encoder output is connected to a panel or an
-	 * external bridge. We create a connector only if we're connected to a
-	 * drm_panel device. When we're connected to an external bridge, we
-	 * assume that the drm_bridge driver will create the connector itself.
-	 */
+	/* Initialize the internal panel or external bridge */
 	ext_bridge = msm_dsi_host_get_bridge(msm_dsi->host);
 
 	if (ext_bridge)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 4b363bd7ddff..72cfd0a8187b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <drm/drm_bridge_connector.h>
 #include "msm_kms.h"
 #include "dsi.h"
 
@@ -689,7 +690,7 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		goto fail;
 
@@ -709,7 +710,6 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 	struct drm_encoder *encoder;
 	struct drm_bridge *int_bridge, *ext_bridge;
 	struct drm_connector *connector;
-	struct list_head *connector_list;
 
 	int_bridge = msm_dsi->bridge;
 	ext_bridge = msm_dsi->external_bridge =
@@ -717,22 +717,21 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 	encoder = msm_dsi->encoder;
 
-	/* link the internal dsi bridge to the external bridge */
-	drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
-
-	/*
-	 * we need the drm_connector created by the external bridge
-	 * driver (or someone else) to feed it to our driver's
-	 * priv->connector[] list, mainly for msm_fbdev_init()
+	/* link the internal dsi bridge to the external bridge and attach
+	 * the connector, we are supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR
+	 * so always create connector
 	 */
-	connector_list = &dev->mode_config.connector_list;
+	drm_bridge_attach(encoder, ext_bridge, int_bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 
-	list_for_each_entry(connector, connector_list, head) {
-		if (drm_connector_has_possible_encoder(connector, encoder))
-			return connector;
+	connector = drm_bridge_connector_init(dev, encoder);
+	if (IS_ERR(connector)) {
+		DRM_DEV_ERROR(dev->dev, "drm_bridge_connector_init failed: %ld\n",
+			      PTR_ERR(connector));
+		return ERR_PTR(-ENODEV);
 	}
 
-	return ERR_PTR(-ENODEV);
+	drm_connector_attach_encoder(connector, msm_dsi->encoder);
+	return connector;
 }
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
-- 
2.26.2

