Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5601616B95
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiKBSHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiKBSHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:07:11 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E238D23BF8
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:07:10 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p8so29457160lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caH8bf8ljAti3Iqn2/ffUusX7mem9lzX4QuF6rv2l+k=;
        b=M4Miu7t/weJqZa+rd0xqd/pvcKbBCL+CCFLSP5Gjj8AhcAVtRTWLjFllOFGwdAFauW
         VOYUlzQNHwWOYbXn3BbKjqXiu9BUHPcHJ82nuCi1vrytWgsoB/iPcUeBeTRHh6DurOYv
         ay88f/dVrfXfDo1NQWpElH9L7eSqIfdZLZwcA2C00ABgDbqJr6vFiQVr66UpfemGOrc+
         aumehGsCwdJ+hadRYcvG3Bguw9C0uGigVJRtmW3Hi1nOTw6fQqWMUrUbk2QSdz0vUgOl
         q0nunDf0CWd8i9JP5HAXrwyiZ+O8iLx8svQNbjo60cv1xQIVOwDYbnzHSYdlI8aoRNVo
         EfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caH8bf8ljAti3Iqn2/ffUusX7mem9lzX4QuF6rv2l+k=;
        b=mZcYCh6ChEHVsWo6vHo7p+asK1dRODL2gduHVfmjrLhVtfXpU46EQ7uVsaC3SBs1Zj
         9sTDrYW2g8SY8UB+p5qjFcIxW508HOIKh5IZyg1T95xbKG+qIb00SrNBgqz0Fojn0Hze
         LOXa34On8su8ztqrQTf5KRY6IL5Vip/ygS9Zg08yAs8A4jGMTo64GzM2+o9/4L10oUbp
         3/aTt1S54NN36C5AiHBhyadovT0hKzg5z7FWaaDkZ7KwW3GMmZMBMzsRiQXifhOPwo7t
         scsGsR9NfH6XrCrtT5bwMfFw2OtL7dd3azhpAYgTaydPMId2V0g8wGmhNdA31dY3hE2j
         9CzQ==
X-Gm-Message-State: ACrzQf0J0+Qn3FKPCo7WUMPR2a9fA0NbLmb/crWoFkVZ1GPyTOwJ5BOr
        1zLo2Tgd23jNSJAeGZD9PbWT2g==
X-Google-Smtp-Source: AMsMyM7lr3pt+hR6OTjw8GGDV87W40UMzCRnSnEMVhQ6Wvq7PxsdKmr0R33IAhL2J5nDdfBpBa493Q==
X-Received: by 2002:a05:6512:10c6:b0:4a2:abd1:868c with SMTP id k6-20020a05651210c600b004a2abd1868cmr10081673lfg.454.1667412429244;
        Wed, 02 Nov 2022 11:07:09 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:07:08 -0700 (PDT)
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
Subject: [PATCH v3 4/7] drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
Date:   Wed,  2 Nov 2022 21:07:02 +0300
Message-Id: <20221102180705.459294-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
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

