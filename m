Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235C06716DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjARJAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjARI6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:58:48 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF59355B5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:04 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id u19so81225087ejm.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBfCqrDR4MpJFEnebR6McOavUtbCVSzMNuhuevH6nB0=;
        b=CIGRp+wi2KsKMXXI/Fr+WhpcoI96+VtHe0oNYw438BSi2i9PPSRrZpzg4pztss+1PS
         KLtjg7S4NJzirTkchGwnCVwN/eSaZU+aP5h4kIfNufZ1fLCgXjIOb35hwkjyHIcFZiMr
         t4Qh3dD4vxUusLQbjyqEf2p7udMf1ZgSwHuqjngaTuy/BMRGuPK2kEvTfr4NOZ4vJvte
         V8uOU9KArSDi0tK9cvyIkP45ZqlCZeOlRVLUrEo9ShaDDKB5m3BxSuK08jkTqHzkRu8H
         85s7AOzJ8Y9fuINuBgThauZJw5rcGG/99DB/44OAJOGChkxVLm0AjPcHmwrccKqRHg7c
         Sprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBfCqrDR4MpJFEnebR6McOavUtbCVSzMNuhuevH6nB0=;
        b=q6wI7I5o8TeQu4HFEoUS18/AhJKoxo97Z2GT6Q4EKBE3b/31xkzVUh5Q8LDYc58+Zl
         qB6hFjvJ0h/G6gZrombl4QI465Cpuvj6RLlzAJ8neee6ZD5YCk+2pXq5J92GNjVGyDPl
         TuGHWnPu90MoXcF1QMYgZIonFRs6OL+liYkXa1Ae3th2RJZiZDEaYsAz6FOx1oLPXFSw
         ml6fbyqPRdtqs0afyp+2ILosRyXKjpkf9hp0Evzon7YTpNojE9xa4Q9IQmDTpo+nDe5I
         mV2G+al15gjZ9FcUQMBnBOED4nnJS5YtsWAi6FtGVOxXqgM6l0eblxC/DN5Ve5YTEIr9
         41Xw==
X-Gm-Message-State: AFqh2kqALVEtPkr+c1XmQzKlFuUEK/GBsuw9mhtSwK1GvDVRg+owz/ep
        PY7ddNJUlgNX7YDNfZW6Z26RHQ==
X-Google-Smtp-Source: AMrXdXujXPrQ+U3YPkv1Up45oc0vaV+q3Os8LYgZ1Fvx09I8JVuo7j5nIjHce/ZSu1JaB5xDm0OR6Q==
X-Received: by 2002:a17:906:d8a8:b0:84b:b481:6188 with SMTP id qc8-20020a170906d8a800b0084bb4816188mr2050170ejb.64.1674029823456;
        Wed, 18 Jan 2023 00:17:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:03 -0800 (PST)
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
Subject: [PATCH 03/13] drm/bridge: lt9611: fix polarity programming
Date:   Wed, 18 Jan 2023 10:16:48 +0200
Message-Id: <20230118081658.2198520-4-dmitry.baryshkov@linaro.org>
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

Fix programming of hsync and vsync polarities

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 58f39b279217..deb503ca956a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -207,7 +207,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 
 		/* stage 2 */
 		{ 0x834a, 0x40 },
-		{ 0x831d, 0x10 },
 
 		/* MK limit */
 		{ 0x832d, 0x38 },
@@ -222,11 +221,19 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		{ 0x8325, 0x00 },
 		{ 0x832a, 0x01 },
 		{ 0x834a, 0x10 },
-		{ 0x831d, 0x10 },
-		{ 0x8326, 0x37 },
 	};
+	u8 pol = 0x10;
 
-	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		pol |= 0x2;
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		pol |= 0x1;
+	regmap_write(lt9611->regmap, 0x831d, pol);
+
+	if (mode->hdisplay == 3840)
+		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
+	else
+		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	switch (mode->hdisplay) {
 	case 640:
@@ -236,7 +243,7 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		regmap_write(lt9611->regmap, 0x8326, 0x37);
 		break;
 	case 3840:
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
+		regmap_write(lt9611->regmap, 0x8326, 0x37);
 		break;
 	}
 
-- 
2.39.0

