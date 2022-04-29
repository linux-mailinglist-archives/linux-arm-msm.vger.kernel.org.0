Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2238F51540A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 20:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380057AbiD2Sz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 14:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380077AbiD2Sz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 14:55:27 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB7ACFBBB
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so15616769lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
        b=F3fxtRfDEpSVXHZlP/WwK/IVfVqcq/oG9b9SN8h1W8LtnEJd3SM2+7KX3sB4vO1dUx
         fQEA2lTPMWME+JsnR0jbrqc/ctTE7cn8U71pSe7k9OyXsgA3OSD5Ae1vrfquhu6eBrES
         OqI6ACqg2WYTibjed7me1Cxpa+yWlA+E+7V+giepGgw/ynsOm1O3i2Y8ifWhwmukGNcz
         NYmNDlEmtQAoTJmZ2OqeP+H/EGgEPzkn+Ruum//XDh6H1PfwZsLtq2WJQYPf/XgoHdJ7
         9Ed83Eic/hdHtb+ThZ2xuF+jUFKtlSEfOXCJVE341ecOpcRjjDTt6eTzWryIjmSFNZAY
         jgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
        b=zZaQQkTIZLhiePgEMMENLG+fFjcIRIL2MUZzYJzkdgikEBTerOahMKnQYCVUg7c5iA
         xu9xNaH7orZ804wH12SuwTiW99eUALEJxlaxUzkOoB8pSdtY6T7y5oJ3Rbf5WQxSZt1S
         LtRAnRXuKfFRL4sN44lALAC/n0UqEcOGzKB6q9alkW7GdI0mbthaZN85tpvKbcxfEmF+
         Mt+2y8AMKwMeeHF0k+nRHSYfJcdV72AxZZx6lnqq0gM4/dtLC8l8blYPz18TvplL1Mkm
         4ub3aoWRWt5s5Lv3ARcK9Pc1s0DP8hWpSxRNRIFdp6oZIqb+LFToJKqrqeivIPaqKYVJ
         vIGA==
X-Gm-Message-State: AOAM530dkwrtIhQE3IeVQ7DbpP5xfw+lTPgKLMVyyWL/1Fm5nmFszyu1
        OTHrCWSYWzUdLUTgW8/da/AIAQ==
X-Google-Smtp-Source: ABdhPJypKbEZWtx1y5Anvfkf2zXysSjtu5YU/Qrc3Zglyg4silcqJGbTm6SvkihY4hifXkIzm6xk+g==
X-Received: by 2002:a05:6512:39c1:b0:471:b37e:fe5a with SMTP id k1-20020a05651239c100b00471b37efe5amr388736lfu.527.1651258325946;
        Fri, 29 Apr 2022 11:52:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 11:52:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 6/7] drm/omap: stop using drm_bridge_connector_en/disable_hpd()
Date:   Fri, 29 Apr 2022 21:51:56 +0300
Message-Id: <20220429185157.3673633-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
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

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 41 ------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index eaf67b9e5f12..699ed814e021 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -545,44 +545,6 @@ static void omap_modeset_fini(struct drm_device *ddev)
 	drm_mode_config_cleanup(ddev);
 }
 
-/*
- * Enable the HPD in external components if supported
- */
-static void omap_modeset_enable_external_hpd(struct drm_device *ddev)
-{
-	struct omap_drm_private *priv = ddev->dev_private;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_pipes; i++) {
-		struct drm_connector *connector = priv->pipes[i].connector;
-
-		if (!connector)
-			continue;
-
-		if (priv->pipes[i].output->bridge)
-			drm_bridge_connector_enable_hpd(connector);
-	}
-}
-
-/*
- * Disable the HPD in external components if supported
- */
-static void omap_modeset_disable_external_hpd(struct drm_device *ddev)
-{
-	struct omap_drm_private *priv = ddev->dev_private;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_pipes; i++) {
-		struct drm_connector *connector = priv->pipes[i].connector;
-
-		if (!connector)
-			continue;
-
-		if (priv->pipes[i].output->bridge)
-			drm_bridge_connector_disable_hpd(connector);
-	}
-}
-
 /*
  * drm ioctl funcs
  */
@@ -782,7 +744,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_fbdev_init(ddev);
 
 	drm_kms_helper_poll_init(ddev);
-	omap_modeset_enable_external_hpd(ddev);
 
 	/*
 	 * Register the DRM device with the core and the connectors with
@@ -795,7 +756,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	return 0;
 
 err_cleanup_helpers:
-	omap_modeset_disable_external_hpd(ddev);
 	drm_kms_helper_poll_fini(ddev);
 
 	omap_fbdev_fini(ddev);
@@ -822,7 +782,6 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 
 	drm_dev_unregister(ddev);
 
-	omap_modeset_disable_external_hpd(ddev);
 	drm_kms_helper_poll_fini(ddev);
 
 	omap_fbdev_fini(ddev);
-- 
2.35.1

