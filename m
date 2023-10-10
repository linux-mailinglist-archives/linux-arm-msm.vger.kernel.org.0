Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5F67C4543
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 01:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjJJXK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 19:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjJJXKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 19:10:25 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C96A4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 16:10:22 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c038a1e2e6so74365221fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 16:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696979421; x=1697584221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fon1QkFJTz8Alr+uiL2KMcvJW4XLlUSBnhLgO79Ihw=;
        b=XkvVn1gqf5sd5RAbYwn3SG18WXCDq8wOXGG9IEV2UOyCouH/wB4P4RciP8ZIJRRiq/
         E2jBocbtxYP4KwflPlQpZ8r8f7unWyhq6qtNFcRiOq4quNIlCmjymilqokxRanDWVUw3
         tU+wFIdv643AiK0oCI92GvH5FFLwR3E9KDBI+guBtfuNKA0uthrSjUG2HMoMGDABZp6J
         C+sFfAPRq7MiSxMuQttPh+CiKIqWsGRVX6YD7RykRFE6KKSXOZP7BwEHK2jBo9bo9Vbh
         v6Yxof2gI6kYY9VdCYdsL+J+eLB6VT9NBGSuYfV3IT6Wuqg8ZHVCdkUYUYFyUZxGhvrg
         2bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696979421; x=1697584221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fon1QkFJTz8Alr+uiL2KMcvJW4XLlUSBnhLgO79Ihw=;
        b=pGOy6HTdaFRD5d0+qqt5Ohg3pJjeRPP+0yXuW6Z1Tzwz5sf+6/ivRco6Gx6s8YEiYc
         TdmBooP6Gq4tx91Ie7EQftmAoadZTN+/0k04CNQvlVH5CyCZpmufgonX4hyxR0cYEYBz
         gmr4//EbUX4Kk2xKwo9CxWhw2kJYZEZ94HkaoPlj1iR2CoYUnHuilX7sH0sBWGHKh6rL
         t0kCy+I5kqIahE7W5usk3QGEjitJPRVks82tuy779OuXcpT/ybdff3b44KKJsABKfeMA
         jN1ul8YI91taMIjIeIVaiXF36L7eM3Kf3lMsopFTUFEH+d0hnhmVWHJp7fObFMiPcoFN
         uKSQ==
X-Gm-Message-State: AOJu0YzP1IdBimnwLSRohjGLdH0i8VjD7hyaF0DO4u9ROQW6OgK2/OyQ
        uW0o6XvSFtNFxVuzwpz97hcTZQ==
X-Google-Smtp-Source: AGHT+IE8yldU0YKRaL0UAn6xrK8h+aIRatkpBSygcidVujCgWwCyRme4sOANOPGpYYSbcwK9jXy9MA==
X-Received: by 2002:a2e:9d19:0:b0:2bc:d6a8:1ef2 with SMTP id t25-20020a2e9d19000000b002bcd6a81ef2mr16154760lji.12.1696979420932;
        Tue, 10 Oct 2023 16:10:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n8-20020a2e8788000000b002bcdbfe36b9sm2658033lji.111.2023.10.10.16.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 16:10:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/3] phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
Date:   Wed, 11 Oct 2023 02:10:17 +0300
Message-Id: <20231010231018.77381-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231010231018.77381-1-dmitry.baryshkov@linaro.org>
References: <20231010231018.77381-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to using the new DRM_AUX_BRIDGE helper to create the
transparent DRM bridge device instead of handcoding corresponding
functionality.

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig              |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 ++---------------------
 2 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index d891058b7c39..b57a0e786a61 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -63,7 +63,7 @@ config PHY_QCOM_QMP_COMBO
 	depends on DRM || DRM=n
 	select GENERIC_PHY
 	select MFD_SYSCON
-	select DRM_PANEL_BRIDGE if DRM
+	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
 	help
 	  Enable this to support the QMP Combo PHY transceiver that is used
 	  with USB3 and DisplayPort controllers on Qualcomm chips.
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 5e6fc8103e9d..fbca9c0fcba4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -21,7 +21,7 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
 
-#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
@@ -1419,8 +1419,6 @@ struct qmp_combo {
 	struct clk_hw dp_link_hw;
 	struct clk_hw dp_pixel_hw;
 
-	struct drm_bridge bridge;
-
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
 };
@@ -3191,44 +3189,6 @@ static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
 }
 #endif
 
-#if IS_ENABLED(CONFIG_DRM)
-static int qmp_combo_bridge_attach(struct drm_bridge *bridge,
-				   enum drm_bridge_attach_flags flags)
-{
-	struct qmp_combo *qmp = container_of(bridge, struct qmp_combo, bridge);
-	struct drm_bridge *next_bridge;
-
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-		return -EINVAL;
-
-	next_bridge = devm_drm_of_get_bridge(qmp->dev, qmp->dev->of_node, 0, 0);
-	if (IS_ERR(next_bridge)) {
-		dev_err(qmp->dev, "failed to acquire drm_bridge: %pe\n", next_bridge);
-		return PTR_ERR(next_bridge);
-	}
-
-	return drm_bridge_attach(bridge->encoder, next_bridge, bridge,
-				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-}
-
-static const struct drm_bridge_funcs qmp_combo_bridge_funcs = {
-	.attach	= qmp_combo_bridge_attach,
-};
-
-static int qmp_combo_dp_register_bridge(struct qmp_combo *qmp)
-{
-	qmp->bridge.funcs = &qmp_combo_bridge_funcs;
-	qmp->bridge.of_node = qmp->dev->of_node;
-
-	return devm_drm_bridge_add(qmp->dev, &qmp->bridge);
-}
-#else
-static int qmp_combo_dp_register_bridge(struct qmp_combo *qmp)
-{
-	return 0;
-}
-#endif
-
 static int qmp_combo_parse_dt_lecacy_dp(struct qmp_combo *qmp, struct device_node *np)
 {
 	struct device *dev = qmp->dev;
@@ -3440,7 +3400,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qmp_combo_dp_register_bridge(qmp);
+	ret = drm_aux_bridge_register(dev);
 	if (ret)
 		return ret;
 
-- 
2.39.2

