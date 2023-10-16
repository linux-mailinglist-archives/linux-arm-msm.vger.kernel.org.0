Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 595617CB09D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 18:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbjJPQ4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 12:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234349AbjJPQ4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 12:56:41 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9114B324E
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:10 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40566f8a093so47089995e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697475249; x=1698080049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhGTCeJTgvu597dzkwlQwgzYcEyeuUmDXvIZAq5l/4I=;
        b=KIXmQqYeNZ+MQKazc4bVk01kpUUKf4aansqE25G3Y9+IaGJtwLEzmrQ91UzNhb5hA2
         lO0u1A4BpsFA7AgwdgF6R1TJ1HSGfTs02FCtsIJElbx27a+d9pz0QM1Ilmlp/X4ZanX9
         eDnDqDSr/P4mJF1cKtNwxKQKtGvtjfw/cUxp6FpowDpuI/ecljtUkS4s3JnFZ+DAIXKN
         RTypNew6bXAgjGBkLqIJQ/uWH4IZbMnRmOC0HTO70rfZAq/80oNFur/EiydrpmCIxkfI
         VNp1mGX5Rr9BjajfjS25mMA20jdKRxUaQ2t35YUGLmK/q61gK/RKlgUtIU4/3AFfLC5a
         2QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475249; x=1698080049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhGTCeJTgvu597dzkwlQwgzYcEyeuUmDXvIZAq5l/4I=;
        b=PFAb72Os+PI5HUxDtI0WgOi5L8iXm6BXxl9y2hI+0yslhx+PPkUk1tn27xLNq6mWmm
         lAuRey7j8IU+fhTthlTTWMmg+pqCA37R7j+qROiU4XIAWohu9syD4+OMknaa1+JKgZXJ
         r1HKzAgyDpOzNpuWbvp3+ep/xdgWGYO9ms4eku7RFO/51HGHOK1guVzbAfs+JoYMVrER
         fRFydTSoVxFqussJX45q+Yn+POkiG0QqV3cpSuHN/ho/jE3kLGjBhznSZMU0Vm/BkkT3
         zdf3bs//xUGUbGlcfu980TrvO6GB4QKisvlvVlMKvNaFad1xtD4XXg0gHvuzRuXLb1xH
         J9LA==
X-Gm-Message-State: AOJu0Yz+NcP8rjghs/30+E3W6yTixXC4F1FoUqGAq7abMRwVsmEtNndP
        /o2OJhtjLfT2THt03O+vTqH2vg==
X-Google-Smtp-Source: AGHT+IFMc1ydiV35u/i4xaIUD7bB3YsAkS433GNNfx1qmd94WFx7VWq0imHb4rjYzorutlJy9cRnjA==
X-Received: by 2002:a05:600c:4f49:b0:407:8b61:da70 with SMTP id m9-20020a05600c4f4900b004078b61da70mr784351wmq.9.1697475248812;
        Mon, 16 Oct 2023 09:54:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
        by smtp.gmail.com with ESMTPSA id s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:54:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 06/10] drm/bridge: tc358762: add support for manual DSI power control
Date:   Mon, 16 Oct 2023 19:53:51 +0300
Message-ID: <20231016165355.1327217-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
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

Start migrating tc358762 bridge to new manual DSI power control API. If
the tight power control is not available, default to the existing
pre_enable_prev_first flag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/tc358762.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 7b9f05f95fd1..efb1da4487c9 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -72,6 +72,7 @@ struct tc358762 {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct regulator *regulator;
+	struct mipi_dsi_host *dsi_host;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *reset_gpio;
 	struct drm_display_mode mode;
@@ -163,6 +164,8 @@ static void tc358762_post_disable(struct drm_bridge *bridge, struct drm_bridge_s
 
 	ctx->pre_enabled = false;
 
+	mipi_dsi_host_power_down(ctx->dsi_host);
+
 	if (ctx->reset_gpio)
 		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 
@@ -185,6 +188,10 @@ static void tc358762_pre_enable(struct drm_bridge *bridge, struct drm_bridge_sta
 		usleep_range(5000, 10000);
 	}
 
+	ret = mipi_dsi_host_power_up(ctx->dsi_host);
+	if (ret < 0)
+		dev_err(ctx->dev, "error powering up the DSI host (%d)\n", ret);
+
 	ret = tc358762_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
@@ -277,10 +284,16 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
+	ctx->dsi_host = dsi->host;
+
 	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	ctx->bridge.of_node = dev->of_node;
-	ctx->bridge.pre_enable_prev_first = true;
+
+	if (mipi_dsi_host_power_control_available(dsi->host))
+		dsi->mode_flags |= MIPI_DSI_MANUAL_POWERUP;
+	else
+		ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.42.0

