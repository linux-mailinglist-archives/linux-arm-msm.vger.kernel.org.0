Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14906716E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjARJB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:01:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjARI7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:59:13 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32FB10A8F
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:15 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so81325187ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpdbxTL1TsJx6ZvxMXDuiLUdcmbkfcCseR/ToR83G3E=;
        b=tp+GZPa1zP8xw8T5zoc1Y19d3dl6rRGGwlW4xjrPET+Yf/26aiJlvcQkApXKAYjq/e
         NG6qItEAedVaaFugJsi7o8QXvOR5GtBq8QOSKb//s/OVBWrfcAmIzhFS5Om38k6bRLaJ
         5SG+jT6LlpQMsVnX0eIg/iIhrTYN0zLp3PngErW8dg2yE7mm8PE2HkGL9Hd9x71HaSHP
         3wKT7FXy7t7zbM84wJ59dkuge1ObHIjnW5vp5+bGaRqayF0SsVJmZC4YjlPCUexAj1G6
         DAe/wJaIKUBEbPNNKJrXWJk61qaXZ+OfhY3vNEp5CX1uHpAlJbrnFfrc7N7lRdeVf7/G
         g2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpdbxTL1TsJx6ZvxMXDuiLUdcmbkfcCseR/ToR83G3E=;
        b=Ndvdlvxb6na0rlEMA0TnViFYKb8Seqn45OG74hekL0BpuSnMnGf2vP1fzgQj3SUdL2
         PwT6+eBt7SgiLcrehnddZcxjzVHPwfZsnIdvX54N4RymbP8BvMnCrAa+gZ6L8cNqh5Ua
         0aAee1CV9aGPhe+poEzgESlDnvHhtJOkJYqbM/N+wwEdPu6BnEqC2qwRkC8lByoyBfRx
         /RWSKp+Dkel8b3KkHkJ5few419/TDEdt2qUE0fPdvNsQZQpVJX0g4aIqg+2ar6FUxF0g
         tuX6npPB5qI6P9et6WLBSnGfytK701T8+0g+H8XZHLi/zi3g9kSPdcspQmi4QIs8GQsm
         TOLA==
X-Gm-Message-State: AFqh2krHTuD1ZO3EWZ5t9m/JseVic0X+3CohnkyCXC93e4vn0d7pEWmK
        brj2kCy+KJGqMG0eaZ/fVEqB/w==
X-Google-Smtp-Source: AMrXdXuucVAB6Mc41A9WbCBTnWWwywaSwMlrRjlBFANbvbNf9GRNLrYFFfdEncxeiQanLo3iYNpyww==
X-Received: by 2002:a17:907:a80b:b0:86f:220e:94af with SMTP id vo11-20020a170907a80b00b0086f220e94afmr15367395ejc.56.1674029834449;
        Wed, 18 Jan 2023 00:17:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:14 -0800 (PST)
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
Subject: [PATCH 13/13] drm/bridge: lt9611: properly program the dual host mode
Date:   Wed, 18 Jan 2023 10:16:58 +0200
Message-Id: <20230118081658.2198520-14-dmitry.baryshkov@linaro.org>
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

If the bridge is connected using both DSI ports, the driver should use
both of them all the time. Correct programming sequence to always use
dual-port mode if both dsi0 and dsi1 are connected.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 28 ++++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index c2cd36d926a0..276c77b273cd 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -118,7 +118,7 @@ static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
 		{ 0x8306, 0x0a },
 	};
 
-	if (mode->hdisplay == 3840)
+	if (lt9611->dsi1_node)
 		reg_cfg[1].def = 0x03;
 
 	return regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
@@ -191,16 +191,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		{ 0x832d, 0x38 },
 		{ 0x8331, 0x08 },
 	};
-	const struct reg_sequence reg_cfg2[] = {
-		{ 0x830b, 0x03 },
-		{ 0x830c, 0xd0 },
-		{ 0x8348, 0x03 },
-		{ 0x8349, 0xe0 },
-		{ 0x8324, 0x72 },
-		{ 0x8325, 0x00 },
-		{ 0x832a, 0x01 },
-		{ 0x834a, 0x10 },
-	};
 	u8 pol = 0x10;
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -209,10 +199,18 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		pol |= 0x1;
 	regmap_write(lt9611->regmap, 0x831d, pol);
 
-	if (mode->hdisplay == 3840)
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
-	else
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	if (lt9611->dsi1_node) {
+		unsigned int hact = mode->hdisplay;
+
+		hact >>= 2;
+		hact += 0x50;
+		hact = min(hact, 0x3e0U);
+		regmap_write(lt9611->regmap, 0x830b, hact / 256);
+		regmap_write(lt9611->regmap, 0x830c, hact % 256);
+		regmap_write(lt9611->regmap, 0x8348, hact / 256);
+		regmap_write(lt9611->regmap, 0x8349, hact % 256);
+	}
 
 	regmap_write(lt9611->regmap, 0x8326, pcr_m);
 
-- 
2.39.0

