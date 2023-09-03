Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C08790E8C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Sep 2023 23:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbjICVtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 17:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbjICVtk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 17:49:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294D8CC
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 14:49:37 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso1477044e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 14:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693777775; x=1694382575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RH2u3GK5yqrU5VNyFF2xDepXs0ge4/C129Kp+nmuvLg=;
        b=GEz+zQv43Ew1n4vCD1sQW9ehCqRX91oE/w5u55Xwjb6MGamRLqhsP/91+B8BenxXbA
         4nRbNFfSl3rI2Qj8M3W09mc1n5S88663XNPkPh480oyj/AJWufgMjXKaQz7CiX6PBLMK
         dXZ9UGexneB937/ym5YHiNZuS21CCNmbXzddVKb523vxiyStdU7Fbx0ERHbPOGKWrS0F
         +1PhfRY+r2w8YLZDEhxl0jR/KoPpn12ipqY5pED3I8VgC4lzhLcIWo+kEaG3p2jh3G41
         c9RH4Fexp1oE85USdkHckOelBMPhJBtc9JEj2VWiz7MZgrsJegyXCHY0QdTH4m3TiABY
         wKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693777775; x=1694382575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RH2u3GK5yqrU5VNyFF2xDepXs0ge4/C129Kp+nmuvLg=;
        b=RuJUtLyolX5IajwFWnPM3EFwgbJ4h7vUXap20DxHjfpdEWB+1KlNkpHlgTXg+rQWHT
         yXzkCIP1oVq7jZhiFkHNILAhdVWA2wbl2KWdisMF6EvEe+OqJIl0KUZmL80A47qlSBEn
         J37UbHGEu2oSnQEQkyh8HZ2euhCX4loqF1UGurQZlkAnJl3SNDyIg9wxGoQVFK/6Ljgf
         Pm+nCAFsES6R2IYNoVYEZS/f616ZueLwNNNw9bn+XkytgDBA9KZUnHwEaHV6u8s051Sj
         OCIB+CBjrYsabdDuDiohfLKKJOX+AezhIKyy+yQ2mbAr36O71hOHuwrBv98ZFZpAOWg+
         42yA==
X-Gm-Message-State: AOJu0Yz/B5C2FvraQBKM7D4nrK/nCju5QjREkSNlmhFRrtCllaV6yIi6
        UzFITGHFXGxad8WbnRKyFjOvtg==
X-Google-Smtp-Source: AGHT+IFmucroqyzq+FST07tiKTP1u29Ja4cLxaBFTJ2mXP1fQUr4CaH0OYR8G1W472Qv6F9lJvcnFw==
X-Received: by 2002:a19:6402:0:b0:4f8:770f:1b01 with SMTP id y2-20020a196402000000b004f8770f1b01mr4395254lfb.19.1693777775426;
        Sun, 03 Sep 2023 14:49:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x7-20020a19f607000000b004fe4833ca5csm1405609lfe.237.2023.09.03.14.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 14:49:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] drm/bridge-connector: handle subconnector types
Date:   Mon,  4 Sep 2023 00:49:34 +0300
Message-Id: <20230903214934.2877259-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the created connector type supports subconnector type property,
create and attach corresponding it. The default subtype value is 0,
which maps to the DRM_MODE_SUBCONNECTOR_Unknown type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This is a leftover of my previous attempt to implement USB-C DisplayPort
uABI. The idea was dropped, but I consider this part still to be useful,
as it allows one to register corresponding subconnector properties and
also to export the subconnector type.

Changes since v1:
 - Dropped all DP and USB-related patches
 - Dropped the patch adding default subtype to
   drm_connector_attach_dp_subconnector_property()
 - Replaced creation of TV subconnector property with the check that it
   was created beforehand (Neil, Laurent)

---
 drivers/gpu/drm/drm_bridge_connector.c | 29 +++++++++++++++++++++++++-
 include/drm/drm_bridge.h               |  4 ++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index ca255609fb08..74a3164825dd 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -332,6 +332,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
 	const char *path = NULL;
+	enum drm_mode_subconnector subconnector;
 	int connector_type;
 	int ret;
 
@@ -369,8 +370,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			bridge_connector->bridge_modes = bridge;
 
-		if (!drm_bridge_get_next_bridge(bridge))
+		if (!drm_bridge_get_next_bridge(bridge)) {
 			connector_type = bridge->type;
+			subconnector = bridge->subtype;
+		}
 
 		if (!drm_bridge_get_next_bridge(bridge) &&
 		    bridge->of_node)
@@ -418,6 +421,30 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		drm_connector_attach_dp_subconnector_property(connector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
+		ret = drm_mode_create_dvi_i_properties(drm);
+		if (ret)
+			return ERR_PTR(ret);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.dvi_i_subconnector_property,
+					   subconnector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_TV &&
+		   subconnector) {
+		/*
+		 * We do not know which modes are supported by the HW, so the
+		 * property should be created in advance.
+		 */
+		if (!drm->mode_config.tv_subconnector_property)
+			return ERR_PTR(-EINVAL);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.tv_subconnector_property,
+					   subconnector);
+	}
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index afa1de791075..440a8aa91e65 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -738,6 +738,10 @@ struct drm_bridge {
 	 * identifies the type of connected display.
 	 */
 	int type;
+	/**
+	 * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
+	 */
+	enum drm_mode_subconnector subtype;
 	/**
 	 * @interlace_allowed: Indicate that the bridge can handle interlaced
 	 * modes.
-- 
2.39.2

