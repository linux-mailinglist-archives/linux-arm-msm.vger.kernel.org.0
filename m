Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321266716D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjARJAi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjARI6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:58:53 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34EC7EC2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:09 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id az20so62188819ejc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQXRJpIEx1m5W9dKJ1KEjOKQXiphyajnal/aAWcW0NQ=;
        b=P1lS85P6uArn1vTeO/PQFLeL+/8ELt6sfNZlB9RDTP6xSdQiQaM3r9D+UrPmDshJz0
         Yso1R/mOZ1gRi7vWvEZLU85rOKPtKuHY55DKfY5SN4LE3a1yz0YpTlObcx64NXxmp7Gg
         OJC6dtzegFKeUD8fXiwgmIEt2dOK/I5W3kGXiOHPXnziKkIKDJxHTEj8WlczzYUbdyTm
         8hZgb7iCApyRpn7OSCjdjfuc7ICWvp/jECz8HPmvA9tw8K23Ovi4sgfiEwgjZUYjZ+W0
         zY9/iAfRIbJNVIjUFDMcBE8eQ/CB6Y7PbdPjZk4wnGjAvu/n/gCA4u76Kwltlwf9b7SM
         eo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQXRJpIEx1m5W9dKJ1KEjOKQXiphyajnal/aAWcW0NQ=;
        b=T1Jky3DjKUUGezbSXAoOarU5WSbwtAMDRPs+E70jP89wvkCFXZMpUe4SJm+Lnv9AwZ
         awZJ2pV24Y2HvCHyI9D90NH8b1qC5Rfy5PuNY07xcj6U9lAK3nYMKqVaxq1mIVPWOKnt
         Boae+rs8LyfNExo/xz3lzzfWkfjaJEEo127iRBFyNjsfIqudaq7tCMkyWs+yigl7JPBQ
         xo2Fos3wqRDVS8rWJHhmiiXZ6tJGVAcgCnw6Z9jWQKpuNP2yDCVx15Zy4EUV6rMXokxD
         v4CiUntVwduweW0EliHIxbL0pOyBmbpVr8nucmm6eKxqesBgoFy5nNaaz9uj/hBkjrLa
         WmPA==
X-Gm-Message-State: AFqh2kqJ+Vv+GaaheERoGL7r2MuM73L021fYAfrz+qWdZAlQyCXNyAyW
        JgOGUs0KU1Gfhp7baIT6uUkbCg==
X-Google-Smtp-Source: AMrXdXtHyizRqiSU0MbwJfy1jHviM3YzZgYYKcOteerItybZSiMaqVgTXDPskslOHsB/hYQR++SP+g==
X-Received: by 2002:a17:907:2a53:b0:86f:8ccb:5d1e with SMTP id fe19-20020a1709072a5300b0086f8ccb5d1emr5395021ejc.17.1674029827946;
        Wed, 18 Jan 2023 00:17:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 07/13] drm/bridge: lt9611: rework the mode_set function
Date:   Wed, 18 Jan 2023 10:16:52 +0200
Message-Id: <20230118081658.2198520-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
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

The mode_set callback is deprectated for drm_bridges in favour of using
atomic_enable callback. Move corresponding code into the function
lt9611_bridge_atomic_enable() and turn lt9611_bridge_pre_enable() into
the proper atomic_pre_enable callback.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 61 +++++++++++++++----------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 3b77238ca4af..1b65a573be27 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -713,6 +713,39 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 			    struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *mode;
+	struct hdmi_avi_infoframe avi_frame;
+	unsigned int postdiv;
+	int ret;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	mode = &crtc_state->adjusted_mode;
+
+	lt9611_mipi_input_digital(lt9611, mode);
+	lt9611_pll_setup(lt9611, mode, &postdiv);
+	lt9611_mipi_video_setup(lt9611, mode);
+	lt9611_pcr_setup(lt9611, mode, postdiv);
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
+						       connector,
+						       mode);
+	if (!ret)
+		lt9611->vic = avi_frame.video_code;
 
 	if (lt9611_power_on(lt9611)) {
 		dev_err(lt9611->dev, "power on failed\n");
@@ -856,7 +889,8 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_OK;
 }
 
-static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
+static void lt9611_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	static const struct reg_sequence reg_cfg[] = {
@@ -884,29 +918,6 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	lt9611_sleep_setup(lt9611);
 }
 
-static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
-				   const struct drm_display_mode *mode,
-				   const struct drm_display_mode *adj_mode)
-{
-	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	struct hdmi_avi_infoframe avi_frame;
-	unsigned int postdiv;
-	int ret;
-
-	lt9611_bridge_pre_enable(bridge);
-
-	lt9611_mipi_input_digital(lt9611, mode);
-	lt9611_pll_setup(lt9611, mode, &postdiv);
-	lt9611_mipi_video_setup(lt9611, mode);
-	lt9611_pcr_setup(lt9611, mode, postdiv);
-
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
-						       &lt9611->connector,
-						       mode);
-	if (!ret)
-		lt9611->vic = avi_frame.video_code;
-}
-
 static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
 	return __lt9611_detect(bridge_to_lt9611(bridge));
@@ -957,11 +968,11 @@ lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
-	.mode_set = lt9611_bridge_mode_set,
 	.detect = lt9611_bridge_detect,
 	.get_edid = lt9611_bridge_get_edid,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
+	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,
 	.atomic_post_disable = lt9611_bridge_atomic_post_disable,
-- 
2.39.0

