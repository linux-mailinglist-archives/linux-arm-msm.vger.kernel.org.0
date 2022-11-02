Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1D12616B94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiKBSHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbiKBSHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:07:11 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6522E696
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:07:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id d6so29510711lfs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njFUM8grNBCWhY7+2MQ0vp+r8NhDVi4GL0ALpm64CQc=;
        b=FnZf6NTADaSe0PkC86OPtYawsEUrWL0oiGDdYkE/H6elSvrKnb3/EXr4SBV9nhl+7A
         B5f1pZMFNNNOb76MlRM+I2gpUlRPwrKIN+epl1/zpPwcKw18qsIMMW3AZDokb4FPt/eb
         9H4/C5Ates7fv/Uq6bjTt+gMEdsRYFnSauejLx1eYDLHOAjNjuU5DP4F3BWp4YKrV6Yv
         tLJLJXOhaKGOUELcx5E9ykC31Mw66jfIHCBr4zydP8DKjy18pH45hDjckSQavtVdtnGc
         MkCoafW8sPaYFOOSJsMw+RoEpvA2dFQiTfy2QboDWlELd0XAKjqpd9w03ts6YhRq9AbF
         z12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njFUM8grNBCWhY7+2MQ0vp+r8NhDVi4GL0ALpm64CQc=;
        b=OyoEHKhZlVfNUyQeyFDaFDZB/DJblzH1Q36CfjyM1GxcbOYzYxTVO4VDlIqOcn9Flf
         SovfKwqKQ3R9K2hPa/fgQiP1FFHkNnEPBef3hX1CGE6sg1N0Qz84L1C262Avr8umMFG1
         7Pnhr06fIjjwTr7xnYF+fT9aottTzpAFCkuROjy+J0OJnpJdguJm1iaWSvU0oBpM/71l
         c7nIx8WU0tgcfzUpUobW2h0KVUkCs9bCGCL+iXC/9GDWKJBIyKHFngSPBVC+O7vr11Ze
         zrWDeUuLXC64eaQlRo9JgBfJY+q8+PPE/1vxgpnTKpx9nnFlbmzlWACTvA8ODCNzCTOi
         X7ug==
X-Gm-Message-State: ACrzQf0Eyg9cGWG89sbu6/Tnrg8PtaNygKGePblrdScvdMGZV9Ef4M5H
        MLEg+fjyhzIFjdvMmOeLvLfHHA==
X-Google-Smtp-Source: AMsMyM5/YWavo37aOvKzpmvgdmkVEaZu35sKTu0ADp1oLjSun+G/nXyR+D74r6QrPi65ndlPWZjeQw==
X-Received: by 2002:a05:6512:308d:b0:4a2:33d3:b8f1 with SMTP id z13-20020a056512308d00b004a233d3b8f1mr10157528lfd.133.1667412428417;
        Wed, 02 Nov 2022 11:07:08 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.07
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
Subject: [PATCH v3 3/7] drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
Date:   Wed,  2 Nov 2022 21:07:01 +0300
Message-Id: <20221102180705.459294-4-dmitry.baryshkov@linaro.org>
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

Use drm_connector's helpers enable_hpd and disable_hpd to enable and
disable HPD automatically by the means of drm_kms_helper_poll_*
functions. As the drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() functions are now unused, replace
them with stubs to ease driver migration.

Enabling the HPD from drm_bridge_connector_init() can happen too early,
before the driver is prepared to handle HPD events. As the
drm_bridge_connector_enable_hpd() is empty anyway, drop this call
anyway.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1c7d936523df..0e13bc87a6ac 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -136,6 +136,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
  * This is typically used by display drivers in their resume handler.
  */
 void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
+{
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
+
+static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -145,7 +150,6 @@ void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 		drm_bridge_hpd_enable(hpd, drm_bridge_connector_hpd_cb,
 				      bridge_connector);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
 
 /**
  * drm_bridge_connector_disable_hpd - Disable hot-plug detection for the
@@ -156,6 +160,11 @@ EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
  * This is typically used by display drivers in their suspend handler.
  */
 void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
+{
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
+
+static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -164,7 +173,6 @@ void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 	if (hpd)
 		drm_bridge_hpd_disable(hpd);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
 
 /* -----------------------------------------------------------------------------
  * Bridge Connector Functions
@@ -305,6 +313,8 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.enable_hpd = _drm_bridge_connector_enable_hpd,
+	.disable_hpd = _drm_bridge_connector_disable_hpd,
 };
 
 /* -----------------------------------------------------------------------------
@@ -387,10 +397,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				    connector_type, ddc);
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
-	if (bridge_connector->bridge_hpd) {
+	if (bridge_connector->bridge_hpd)
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
-		drm_bridge_connector_enable_hpd(connector);
-	}
 	else if (bridge_connector->bridge_detect)
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
-- 
2.35.1

