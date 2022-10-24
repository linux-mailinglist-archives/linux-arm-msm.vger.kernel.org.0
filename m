Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E434460B359
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbiJXRFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235753AbiJXRFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:05:08 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C67BDAC4B
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:40:58 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g7so17374147lfv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caH8bf8ljAti3Iqn2/ffUusX7mem9lzX4QuF6rv2l+k=;
        b=dMVJY+Cb9VtzdDCHUZjAn06H2dioFUyatrkC09DThcAQPNqEao0kik25KnSwI0r5Zw
         sL5lP2FMRmL31OYyaL2EwlUwxzeV3/ip5iY8YDPg6hCHBF4EbUXPc/RizEzF28yaYbJZ
         D2jPxebV1Fn4EUKyqXUjll4Tzu00VEeuv3GzA+bzGJFoOAEt9AZGUBgt43Dl8XLl/gLd
         L8xfWcPaJlxGMMFg+22lgX14kmNgVXPvuIKpndwV2vpvtHSuqTSBMB9KdKzTFTcRmmqA
         cGYmDnpR59N8oJ1Q/UFUJrJoD4UQFb8RjuBFGEC78P4Rui27buRmR5psw0d6ccVvWzmv
         0MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caH8bf8ljAti3Iqn2/ffUusX7mem9lzX4QuF6rv2l+k=;
        b=TEGxzrO+uI8adL1v+pihAxu+7/OP/xr6Xm5wKcsQSBID49pfTA+4uawrKHwtAgo5PL
         9dyub1q/VnUpVW+1mEIlKQ7ssVQd9SynW9kpev6YuMRATMySoG2i7rpad8VrSvrFMvCh
         gwa88E7oyajdbWJVfFrUA0MKWuUpXjzOTs3hheOPRTzarpHeW6w+lgmOQUJRCHTg//8Y
         FTTPIwZSSJzh4H4ibE8kBJfQA73XHFt6oEDOJS4spOmRWxjb5zlmqJS+ti1ZjY/mW8u3
         E/i2s5QeRHC6t98VEhJwNdXNGG9ZZqffS3fMLIT5Ffc0ZQGMcpE4GJtVqhzIR8UVyPJh
         hkYQ==
X-Gm-Message-State: ACrzQf0EAk80lbrAvXaAMxJVIWQju8PRhKOrsd94dp2WAGbe3I+dfYDF
        SBNPozxeS2e6oaS7jarc/d+ARMkLOuVu2HBw
X-Google-Smtp-Source: AMsMyM61cHuSLQ+hwsVCuXuJ2Y6XafRYO+12KFxhVgnlTItSV3fCxBMAdIvZvQVJJ1VyRDqwO1xk4g==
X-Received: by 2002:ac2:429a:0:b0:49f:9c71:50b6 with SMTP id m26-20020ac2429a000000b0049f9c7150b6mr11744947lfh.349.1666625970972;
        Mon, 24 Oct 2022 08:39:30 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:39:30 -0700 (PDT)
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
Subject: [PATCH v2 4/7] drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
Date:   Mon, 24 Oct 2022 18:39:23 +0300
Message-Id: <20221024153926.3222225-5-dmitry.baryshkov@linaro.org>
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

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 4 ----
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 3f5750cc2673..0d8e44f20ec4 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -257,8 +257,6 @@ int dcss_dev_suspend(struct device *dev)
 	struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
 	int ret;
 
-	drm_bridge_connector_disable_hpd(kms->connector);
-
 	drm_mode_config_helper_suspend(ddev);
 
 	if (pm_runtime_suspended(dev))
@@ -292,8 +290,6 @@ int dcss_dev_resume(struct device *dev)
 
 	drm_mode_config_helper_resume(ddev);
 
-	drm_bridge_connector_enable_hpd(kms->connector);
-
 	return 0;
 }
 #endif /* CONFIG_PM_SLEEP */
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index b4f82ebca532..16ef8aa6da37 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -151,7 +151,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	return kms;
 
 cleanup_crtc:
-	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	dcss_crtc_deinit(crtc, drm);
 
@@ -167,7 +166,6 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
 	struct drm_device *drm = &kms->base;
 
 	drm_dev_unregister(drm);
-	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_crtc_vblank_off(&kms->crtc.base);
-- 
2.35.1

