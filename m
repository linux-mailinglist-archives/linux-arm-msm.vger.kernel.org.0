Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3CB6613E6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbjAHH0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjAHH0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:02 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BFA1D0F6
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:26:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bq39so8370842lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MojOF/93S3oRnJzgKxf5e9Ahv/idd5WHTFRxpckdje4=;
        b=y8Wlk6GZX25Kumr1IZr7HR3n/P5fsUN9/SQeJbUzi+ubexFu3PE3t5fwrdQevn1QTM
         FmrewR4dmUHwJiJ+4TRb/bI9wqzqNxxav8+LMR1BRaSIaew3PtLN5E3eHO9F6oS8IMbs
         jD9nogvLB4pm6ZhR8omo1oT55mzD7zNwPnT9/jf9XvKfbBHyEDXCZPASyYMqO0V/a2xk
         3QrQZsWJZoSyVNATiC+AdMO1YW1olo1ZnpMg2F0RczhWpd6lVvSnW1eUcNCwu9wKQYbf
         6IRw2RceQUATc+LhAHlM1zCdq2PDk8Pzzcs8lSadEj36mSSKRryJp3LnlO9GwvUx0du2
         K5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MojOF/93S3oRnJzgKxf5e9Ahv/idd5WHTFRxpckdje4=;
        b=omhGqzu+kfyathJ3j409/Byfv8Fec0F1Y9BXPiGQA3jLbr77quvPcGJTpq2mAjiQpf
         CN5mmm2z5gHi8uc9/2F8xxBDveR/hhdG+HuvftoqGhld3FNJ6G2eF005+pdVmLYb+PTW
         mjuMqZr3RSwwrxz7xjDkoUOhElPu91/2ToEQ9/vSwr3wMnj+1uYgx9U7tLVUeDmeC3Y5
         hE/7n9P7LqZtypfTelZNvkDMUddCwm12zHqJlqAfplIFmaGD5sahJ6wf/q08Bkx7jlPj
         94S2GBqt8HxYbfU7rtjChHRhUvQLD5QLrBsm6nBo2u1S1cvBeUrhTYdWKmwPT/o8Na7t
         pITA==
X-Gm-Message-State: AFqh2kqIXQ7tP8IUb5uD5b5H8bwKYcR4qZo+VuASytssMa5oiS3Ch//8
        9lBxbTcN10zJE/H223NiU/FG/A==
X-Google-Smtp-Source: AMrXdXtQyqcg9qK49gf+njlh8RAH/3piH8mYKaqr1bwvc3f32iElChmBrkVB9yjNaYcPgOnEF7LI4w==
X-Received: by 2002:a05:6512:2344:b0:4cb:430b:c6b with SMTP id p4-20020a056512234400b004cb430b0c6bmr5231018lfu.29.1673162760087;
        Sat, 07 Jan 2023 23:26:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:25:59 -0800 (PST)
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
Subject: [PATCH 05/12] drm/bridge: lt9611: fix clock calculation
Date:   Sun,  8 Jan 2023 09:25:48 +0200
Message-Id: <20230108072555.2905260-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
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

