Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB21D6B4756
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 15:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbjCJOuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 09:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjCJOsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 09:48:39 -0500
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6462D12239B;
        Fri, 10 Mar 2023 06:47:39 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id g6-20020a056830308600b0068d4b30536aso3025443ots.9;
        Fri, 10 Mar 2023 06:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=De0I+gp0jvvBU5yajyNpGosHJb+1lemGWKSIFgexoTU=;
        b=Wte0yxarr+N6bNWVekmXIHqF0HnxpKyRkeqz+RFZPJvEr5BmpuOpVEfFwi5ZoWD78z
         qx71psXV5p/oa9fMLQyM1jgYoqKX9f8vsZTov1Pe8ThvkwysAK4M19dgoIc5MPEnHOE5
         YzrGl+cWpVyH9k9xpqaVxlrfFttPNcDzpp/UWUWoyzBfKpByJ6tYdh3W0C++YSYqTBtn
         NBVW4ekwaEnO070yocdysnRVbPzmbkXtAQie+n3XjSSYyFqSm+vCUXroSPXK5uIWOJQ9
         qznVP4bMYEKM2kjhfv08JokcKoRXUwnib0mXEdoN7Bv7rPqx8dKYEG5lM860f4+Ep6Ly
         YLaw==
X-Gm-Message-State: AO0yUKUO3ku7K2MV2WjGBirzMcNDTIU4B4ylTZcgxdMRuhnCl0UMHILI
        AIm6OsFAbn5y2G+zKRyE+g==
X-Google-Smtp-Source: AK7set/ntzmW14qqdxNy7hqCHBPFyi/dFBckcMxYLZsj8GRAJipyUOv4BdYp/DpTEtlKrJHFgZjnoA==
X-Received: by 2002:a9d:387:0:b0:686:50ca:7404 with SMTP id f7-20020a9d0387000000b0068650ca7404mr1271124otf.4.1678459658294;
        Fri, 10 Mar 2023 06:47:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e6-20020a9d4906000000b006884c42a38asm118125otf.41.2023.03.10.06.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:37 -0800 (PST)
Received: (nullmailer pid 1542233 invoked by uid 1000);
        Fri, 10 Mar 2023 14:47:05 -0000
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Emma Anholt <emma@anholt.net>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH] drm: Use of_property_present() for testing DT property presence
Date:   Fri, 10 Mar 2023 08:47:05 -0600
Message-Id: <20230310144705.1542207-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-
 drivers/gpu/drm/drm_mipi_dsi.c                  | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c         | 2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c           | 2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c             | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 9e5f2b4dc2e5..fab139b324af 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -313,7 +313,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		}
 
 		/* specially select the next bridge with companion PXL2DPI */
-		if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
+		if (of_property_present(remote, "fsl,companion-pxl2dpi"))
 			bridge_sel = ep_cnt;
 
 		ep_cnt++;
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index b41aaf2bb9f1..7900a4707d7c 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -329,7 +329,7 @@ int mipi_dsi_host_register(struct mipi_dsi_host *host)
 
 	for_each_available_child_of_node(host->dev->of_node, node) {
 		/* skip nodes without reg property */
-		if (!of_find_property(node, "reg", NULL))
+		if (!of_property_present(node, "reg"))
 			continue;
 		of_mipi_dsi_device_add(host, node);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ce6b76c45b6f..2359dca80492 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -964,7 +964,7 @@ static void adreno_get_pwrlevels(struct device *dev,
 	gpu->fast_rate = 0;
 
 	/* You down with OPP? */
-	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
+	if (!of_property_present(dev->of_node, "operating-points-v2"))
 		ret = adreno_get_legacy_pwrlevels(dev);
 	else {
 		ret = devm_pm_opp_of_add_table(dev);
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 38070fc261f3..b11dbd50d73e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -792,7 +792,7 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 	dev_set_drvdata(dev, backend);
 	spin_lock_init(&backend->frontend_lock);
 
-	if (of_find_property(dev->of_node, "interconnects", NULL)) {
+	if (of_property_present(dev->of_node, "interconnects")) {
 		/*
 		 * This assume we have the same DMA constraints for all our the
 		 * devices in our pipeline (all the backends, but also the
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index bafee05f6b24..11d5244a5aa5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -391,7 +391,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
-	if (of_find_property(dev->of_node, "iommus", NULL)) {
+	if (of_property_present(dev->of_node, "iommus")) {
 		/*
 		 * This assume we have the same DMA constraints for
 		 * all our the mixers in our pipeline. This sounds
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ea22c9bf223a..bec1e0cdddb3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3018,7 +3018,7 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (!of_find_property(dev->of_node, "interrupts", NULL)) {
+	if (!of_property_present(dev->of_node, "interrupts")) {
 		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
 		return 0;
 	}
-- 
2.39.2

