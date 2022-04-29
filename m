Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289EB51540B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 20:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380077AbiD2Sz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 14:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380082AbiD2Sz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 14:55:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CA7CC50F
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:08 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x33so15641540lfu.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UcCYVcTme16+uWpUP90xtTFpl/uKSWYcTwwPaiNEnH4=;
        b=qM8Xa/+knMRPfLTwlN+fR5Ci35dl6BlRHNoNMYX0hVxDfbUjon+grBnYTYSLc3wpKT
         x4zV6cHCKHtbc51lv2Ah2HUBs9k2H86hvUof04MJ+L1RWBgmtKiX1u9XICgIb4T3AWaJ
         m4FUPRzbY7leMHH75zT6l4BjTs5XX2FRI5CUANIwhQ7zdCt+NFhKOGFTpqUu6dfyHv6E
         E4XiPnOg22O0wCoqh1noIhgC01FYKxIVgoGqmFMWCxjXFP/2gHCiaRjXcYzL5MMYMF4x
         ymA6+KoQHsW5hk1e2FGsMk1QRstd2BiHSgXf9rG9TiNHEwN6aK1f8PzkltynBJS2R4sG
         ms2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UcCYVcTme16+uWpUP90xtTFpl/uKSWYcTwwPaiNEnH4=;
        b=CWYClWhuRVE3jAst2+/fWGXCDOMP3OOfTnB/WZTVosbbLdQbiSJjjj0ipPnbkCJ/zi
         AokhDxlzww/e5q883XA8ilHrloIh+D4ClSdXw0W7niBw14ibhi6tRmvH2smoDEj8p8xr
         qt3zwFYBtEmSC/nnjCFP7mBT4/NPhLDGvablr+nNZc2y3cU7RtQz6GeEse/yombHZaAq
         RhglIwk981fnsbyorRO506U+8bRbEgCaltkFgg4G8nYX4n39X3VGk+WBbt+jDShXJgVi
         wNgadzvbvqsT1wPyBHeqyay0f1S4Ow6UYtUlntpc2Q1SZCnGpyfTKSi4yJaGaF7VV2zP
         0vOw==
X-Gm-Message-State: AOAM532oDz6Vo3qnuntwLWLLb0x7ufgZyaWWtxrCc2SRVN7+jjIzhI/j
        X6tXfj/MlCJWh64kOOeK9igMHP6Pt32fjA==
X-Google-Smtp-Source: ABdhPJxDM1J9ZFOYujHwlnlADYTDFV6bTMCQTzicA80l40xvHlgv3/pXMH1AjfPq7g134d5qn59tqw==
X-Received: by 2002:ac2:52b4:0:b0:445:ba75:7513 with SMTP id r20-20020ac252b4000000b00445ba757513mr442866lfm.248.1651258326717;
        Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
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
Subject: [PATCH v1 7/7] drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
Date:   Fri, 29 Apr 2022 21:51:57 +0300
Message-Id: <20220429185157.3673633-8-dmitry.baryshkov@linaro.org>
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

Now as all drivers stopped calling drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() it is safe to remove them complelely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 25 -------------------------
 include/drm/drm_bridge_connector.h     |  2 --
 2 files changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1592da3b9403..d9c1f61b6fb6 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -128,18 +128,6 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
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
 static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -151,19 +139,6 @@ static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
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
 static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
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

