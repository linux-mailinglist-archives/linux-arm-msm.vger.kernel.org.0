Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE386716D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjARJAd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjARI6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:58:48 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB12D72A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:07 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id az20so62188580ejc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EPo30eXxIqiDes4Q3ryePcQbuaNGcUHr9bzE1lqhMk=;
        b=V+M888y0DsTbf8ukmahbdvJjbXld+C3mtg7f28nunecY+1HHOZUPuCcguw6Agwen/e
         zawTVdDGcU+pKKLfpMuuAF8e5dNOtWOFP70kyVbBUQtVxAs1JHDH01KorSMqPKGXMrIO
         iaa5qgvd4GVRUztRgtytC9XKntAMZ9DUi+rH1NSJfeQAO3gpdpFnVHOXAt+akz1JgByT
         2OaqCnTgA2Ut7tzhstjpi3xYGmXcNcJ+CFVSDiFp63YL5WJHmIFcU9nvFpObgYRTDErs
         W9+hUuZ/2uvgPiVZ8TCRak50p6aFoYx652fpuR4goECvO8v2sSDgDG1Pa9nWHOBwO968
         OluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EPo30eXxIqiDes4Q3ryePcQbuaNGcUHr9bzE1lqhMk=;
        b=1FTp9SYrdShNbrlCsgZLmI62tKp36X8RHI5L8UP84WwZBPzEGzLgScY8uhr522pMY9
         jzZCgdO+2gIcn1BqGZeRG+ZfKBIG8zXv2O4jsYxzPGUuADMIELw7mIdWqJ0SeONEH+oj
         8VDpzL5+7g5sejlQX1v5o38B94bJUElgRq9wpwE4OUwn293Uw0y2OCSXyKfetVYuUkWv
         LVImGs9zRJJNTLpNS/tLvEdsOQFl5DB3NMxWdmcB/4mxCm8K31RzPH/Qnb/OvY4M32nF
         AoFemyVzutsHOBSvGzhelPgBfXaRHItrZJfKhcI+uTNXDgdUT01BQqXtAk1ee+6HOCdb
         WKlg==
X-Gm-Message-State: AFqh2kpOSMmWZVgznyo3AJ0djUMm9orCCoszykA6NfnNgZNiv+K/RwQe
        P7YtXFJy3qysxU5RRgh4PriIgA==
X-Google-Smtp-Source: AMrXdXueaqKIjBvQTVPvF1em064T6cm/Li8AuOULGgIZVnUfkC+UD9debypBCj2bvQ0OtCqs5E66Yg==
X-Received: by 2002:a17:906:a24f:b0:873:4ebb:94cd with SMTP id bi15-20020a170906a24f00b008734ebb94cdmr4651244ejb.10.1674029825760;
        Wed, 18 Jan 2023 00:17:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:05 -0800 (PST)
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
Subject: [PATCH 05/13] drm/bridge: lt9611: fix clock calculation
Date:   Wed, 18 Jan 2023 10:16:50 +0200
Message-Id: <20230118081658.2198520-6-dmitry.baryshkov@linaro.org>
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

Instead of having several fixed values for the pcr register, calculate
it before programming. This allows the bridge to support most of the
display modes.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 32 +++++++++++--------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index f377052a45a4..e2799a0df8f8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -192,8 +192,9 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
 }
 
-static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
+static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode, unsigned int postdiv)
 {
+	unsigned int pcr_m = mode->clock * 5 * postdiv / 27000;
 	const struct reg_sequence reg_cfg[] = {
 		{ 0x830b, 0x01 },
 		{ 0x830c, 0x10 },
@@ -236,24 +237,14 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 	else
 		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 
-	switch (mode->hdisplay) {
-	case 640:
-		regmap_write(lt9611->regmap, 0x8326, 0x14);
-		break;
-	case 1920:
-		regmap_write(lt9611->regmap, 0x8326, 0x37);
-		break;
-	case 3840:
-		regmap_write(lt9611->regmap, 0x8326, 0x37);
-		break;
-	}
+	regmap_write(lt9611->regmap, 0x8326, pcr_m);
 
 	/* pcr rst */
 	regmap_write(lt9611->regmap, 0x8011, 0x5a);
 	regmap_write(lt9611->regmap, 0x8011, 0xfa);
 }
 
-static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode)
+static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode *mode, unsigned int *postdiv)
 {
 	unsigned int pclk = mode->clock;
 	const struct reg_sequence reg_cfg[] = {
@@ -271,12 +262,16 @@ static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode
 
 	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 
-	if (pclk > 150000)
+	if (pclk > 150000) {
 		regmap_write(lt9611->regmap, 0x812d, 0x88);
-	else if (pclk > 70000)
+		*postdiv = 1;
+	} else if (pclk > 70000) {
 		regmap_write(lt9611->regmap, 0x812d, 0x99);
-	else
+		*postdiv = 2;
+	} else {
 		regmap_write(lt9611->regmap, 0x812d, 0xaa);
+		*postdiv = 4;
+	}
 
 	/*
 	 * first divide pclk by 2 first
@@ -895,14 +890,15 @@ static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	struct hdmi_avi_infoframe avi_frame;
+	unsigned int postdiv;
 	int ret;
 
 	lt9611_bridge_pre_enable(bridge);
 
 	lt9611_mipi_input_digital(lt9611, mode);
-	lt9611_pll_setup(lt9611, mode);
+	lt9611_pll_setup(lt9611, mode, &postdiv);
 	lt9611_mipi_video_setup(lt9611, mode);
-	lt9611_pcr_setup(lt9611, mode);
+	lt9611_pcr_setup(lt9611, mode, postdiv);
 
 	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
 						       &lt9611->connector,
-- 
2.39.0

