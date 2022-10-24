Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF1460BD88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 00:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbiJXWhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 18:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbiJXWgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 18:36:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F6B12E0C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 13:59:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id m15so33432615edb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 13:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIWyUY4t9cfdrarJHXAihf6iaXZwwU1KNPGYvwDevnI=;
        b=hS5i8UZBkR/cWj7VdSCfhcZKWLJhvP+Yqs1xKuuN8w73PHUNmH+W+a+DtygO+0pIO3
         AGfjPZQDOBxkhNP5JNwTJYiZaDMfeESjqM6Sy1cMCLgP2cp86iDH6e0corRVIB2HTe0x
         rMHreFF81+15JY2fIDWo+1kQBqXEqLTdn6eRzBu2QomiHVdik+AakT4XeNrkCwcDBH1x
         THY39eVf8aN6zKnq6moNdoLRqJ7annrOBPqyJ1+GC92I5xtKwGcUC5ef/S8Ts1/WKSZ6
         YsphFSlNWbYTFnX38QvDfVkXTA79Km28KwVXjuRnFCNGgoNnLaVIgTLbXICw7NmT4lU2
         lEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIWyUY4t9cfdrarJHXAihf6iaXZwwU1KNPGYvwDevnI=;
        b=dpjqNGvNl62ogFpf0vb11lkaHVg0KIVJJOcoC4cnmoXduyXbYKTeX9DrI5kYfbkpKH
         FZ6w9vKSS1PI4ZFIcsRoWx/h7STSsGFyJn5U3QuBCAHkbqxGsgJguhwnGr0OzSHzRUc5
         wgkyeTSvhpB+i/vw8OboqyVTvD9bx7nHLrOlQq3aTnJUVXJOWkGu2oWIcYnz6hVYKnyb
         bdKhwh5Pxbukw4UXIhMCQJOsilG0LD17tuiCokcAVCvUQXMCm/tAmL5W80aGo78Ftd9l
         ifkytsCnihanJJpucVkBPE6bwThCrq2Ci2fT+L6LSt0BhPIHydz0jJz5Mfp488pOmd/X
         sZSQ==
X-Gm-Message-State: ACrzQf2nB0WX5QEgg3r/ayOFwLuf1KqYUBaxmP8r066QuW+n/yjIVCja
        R7c3qURySCzVgw/EEo6DfkP+SKdGuknHzenm
X-Google-Smtp-Source: AMsMyM5WEAHjNOOpUszBjpDmkcITZcI2lt2J48qkcMN91xWhoQZqc10tvY/Iw/Q6xGPKjuSkKLzbzQ==
X-Received: by 2002:a05:6512:2a98:b0:4a2:d66f:c57c with SMTP id dt24-20020a0565122a9800b004a2d66fc57cmr11628757lfb.506.1666625973239;
        Mon, 24 Oct 2022 08:39:33 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:39:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
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
Subject: [PATCH v2 7/7] drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
Date:   Mon, 24 Oct 2022 18:39:26 +0300
Message-Id: <20221024153926.3222225-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
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

Now as all drivers stopped calling drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() it is safe to remove them complelely.
Rename our internal helpers to remove the underscore prefix.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 33 ++++----------------------
 include/drm/drm_bridge_connector.h     |  2 --
 2 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0e13bc87a6ac..19ae4a177ac3 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -128,19 +128,7 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
-/**
- * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
- * @connector: The DRM bridge connector
- *
- * This function enables hot-plug detection for the given bridge connector.
- * This is typically used by display drivers in their resume handler.
- */
-void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
-{
-}
-EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
-
-static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
+static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -151,20 +139,7 @@ static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 				      bridge_connector);
 }
 
-/**
- * drm_bridge_connector_disable_hpd - Disable hot-plug detection for the
- * connector
- * @connector: The DRM bridge connector
- *
- * This function disables hot-plug detection for the given bridge connector.
- * This is typically used by display drivers in their suspend handler.
- */
-void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
-{
-}
-EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
-
-static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
+static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -313,8 +288,8 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	/* No need for .mode_valid(), the bridges are checked by the core. */
-	.enable_hpd = _drm_bridge_connector_enable_hpd,
-	.disable_hpd = _drm_bridge_connector_disable_hpd,
+	.enable_hpd = drm_bridge_connector_enable_hpd,
+	.disable_hpd = drm_bridge_connector_disable_hpd,
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
index 33f6c3bbdb4a..69630815fb09 100644
--- a/include/drm/drm_bridge_connector.h
+++ b/include/drm/drm_bridge_connector.h
@@ -10,8 +10,6 @@ struct drm_connector;
 struct drm_device;
 struct drm_encoder;
 
-void drm_bridge_connector_enable_hpd(struct drm_connector *connector);
-void drm_bridge_connector_disable_hpd(struct drm_connector *connector);
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 						struct drm_encoder *encoder);
 
-- 
2.35.1

