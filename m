Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291C63E9B60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 01:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhHKXvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 19:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232970AbhHKXvb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 19:51:31 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A862C0613D5;
        Wed, 11 Aug 2021 16:51:07 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mq2-20020a17090b3802b0290178911d298bso7767434pjb.1;
        Wed, 11 Aug 2021 16:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ajYbf81Yqy3WxYtrc+qNAd59M/DxRn0eX+jpAiWAdzU=;
        b=HFa/GpEZhGjw8e5u9UpZtdUaZYDPO2CUPmZsSq+o19AivoJl2fWAXdhJLHqwoU2Vbj
         pf+blzLQRJqfn6OKrZ7rZ9hFlKndZI7QB+4VDlmybyxpp65HOEwjPmnfWVEctyGnfgVC
         /KgKffkOHKtTyfKuQ3G5nDdjP7xBJcQYYlEppSLRxGTdveSrsvfHyHzD7qq2U+2bGI9D
         EaoFeDOBDuGbqjGtnbkkLnvtAbz3DE8P4ae8+Y2VyvLIdP4Tpo0/VND24bgkW1Nv3f62
         Fj9Gb18fb6qwsNg3d6wn4HblHs4yo99aXnJEBr6hy5pbu8gh4Y9mUjnUaiJsikpIP8HS
         9aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ajYbf81Yqy3WxYtrc+qNAd59M/DxRn0eX+jpAiWAdzU=;
        b=nWgbjMx1viF+FUYFakqrc/V1X24KMHtfIYxHqBMhkNKeQMDftwuxs3D0QraLyC3x0F
         5GFXQce4ZEvF4aBQxkl/DPcTZ52llTfihYEYsai8zEePoCc3j9Fc+b3ySGrCauvR6YSS
         Q3YvadB3lT6W9EUTo0OezgxWnuYyf/z15yfwH8wsqya+WuAczOqF1/LYiBgQLEY7bL5F
         I1gGV72eexd6mjxq2If2J4byG9XyiAPdeJEECpCuQyS1nVt0THUp+Kt6wMCB3ybELLV6
         7YJWyJDVqo1YqhgppkmtSkoYxU1/dOjo+NPIfZ4RQR8dhH5zTbUu38i8d0OMUXEImdXK
         31eg==
X-Gm-Message-State: AOAM531kV3OIMhrEmeu0qvM+3Vl2vIIgEo+2bQsCqnjqbM87Mi9YhCyG
        8dMbdug8tXx0FET8pudJ5kI=
X-Google-Smtp-Source: ABdhPJytzYhLMXUKv84A3eQfW76ypTSusumRwm/ejokVZS9tslD/F13P648Qt7+qeAfTTfxweVZ69w==
X-Received: by 2002:a17:902:7889:b029:12b:cf54:4bf1 with SMTP id q9-20020a1709027889b029012bcf544bf1mr1233174pll.85.1628725867120;
        Wed, 11 Aug 2021 16:51:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 21sm714109pfh.103.2021.08.11.16.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 16:51:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] drm/msm/dsi: Support NO_CONNECTOR bridges
Date:   Wed, 11 Aug 2021 16:52:48 -0700
Message-Id: <20210811235253.924867-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811235253.924867-1-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For now, since we have a mix of bridges which support this flag, which
which do *not* support this flag, or work both ways, try it once with
NO_CONNECTOR and then fall back to the old way if that doesn't work.
Eventually we can drop the fallback path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/Kconfig           |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 ++++++++++++++++++---------
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e9c6af78b1d7..36e5ba3ccc28 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -14,6 +14,8 @@ config DRM_MSM
 	select REGULATOR
 	select DRM_KMS_HELPER
 	select DRM_PANEL
+	select DRM_BRIDGE
+	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
 	select SHMEM
 	select TMPFS
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index c41d39f5b7cf..1fd1cf93abbf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include "drm/drm_bridge_connector.h"
+
 #include "msm_kms.h"
 #include "dsi.h"
 
@@ -690,8 +692,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 	struct drm_device *dev = msm_dsi->dev;
 	struct drm_encoder *encoder;
 	struct drm_bridge *int_bridge, *ext_bridge;
-	struct drm_connector *connector;
-	struct list_head *connector_list;
+	int ret;
 
 	int_bridge = msm_dsi->bridge;
 	ext_bridge = msm_dsi->external_bridge =
@@ -699,22 +700,36 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 	encoder = msm_dsi->encoder;
 
-	/* link the internal dsi bridge to the external bridge */
-	drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
-
 	/*
-	 * we need the drm_connector created by the external bridge
-	 * driver (or someone else) to feed it to our driver's
-	 * priv->connector[] list, mainly for msm_fbdev_init()
+	 * Try first to create the bridge without it creating it's own
+	 * connector.. currently some bridges support this, and others
+	 * do not (and some support both modes)
 	 */
-	connector_list = &dev->mode_config.connector_list;
+	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
+			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret == -EINVAL) {
+		struct drm_connector *connector;
+		struct list_head *connector_list;
+
+		/* link the internal dsi bridge to the external bridge */
+		drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
+
+		/*
+		 * we need the drm_connector created by the external bridge
+		 * driver (or someone else) to feed it to our driver's
+		 * priv->connector[] list, mainly for msm_fbdev_init()
+		 */
+		connector_list = &dev->mode_config.connector_list;
+
+		list_for_each_entry(connector, connector_list, head) {
+			if (drm_connector_has_possible_encoder(connector, encoder))
+				return connector;
+		}
 
-	list_for_each_entry(connector, connector_list, head) {
-		if (drm_connector_has_possible_encoder(connector, encoder))
-			return connector;
+		return ERR_PTR(-ENODEV);
 	}
 
-	return ERR_PTR(-ENODEV);
+	return drm_bridge_connector_init(dev, encoder);
 }
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
-- 
2.31.1

