Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76006613ED
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbjAHH0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjAHH0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:05 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081211D0F6
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:26:05 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b3so8339492lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF5ULjO8Nsom9+kPMKOkmOPhLqLOBqB6rEP7ZLKg/cg=;
        b=v/2A/vsPTdvTXFTL9E1LDjO2javxBUlV9/K3Sa0JIx59p8B8nNxPjKyp0ZdtFR+6ZI
         LL9fFgsxSQJKFgPcqoKoyNEyh9yMfRlYlOgeAokxk5DsI/TvmuLiPuFzFvexSWjTkF++
         MqRVOObJ+UngpE1SYh+si1nH99yyFJd5yuWyvws6YRPn+Q6H2mmXazwJDZ8pj68Bm+Wi
         QgqpIA548qVs5kCrUttLcrU+iWzt6wDxAjO1rXU2weybeRkgzs+huz36U3PVM76IASG2
         dYDN2kR9Nx3gv9ZRX0w161Pwj6ydVCh9fCtsRmICE0N269uZsqRG7Hakj8tyFR8dEo6U
         TGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF5ULjO8Nsom9+kPMKOkmOPhLqLOBqB6rEP7ZLKg/cg=;
        b=cyG5F0MvmTmCQp/3kt1kvIn0m4AD7GzjwImp1XbM2qTQzcGexFLWq506QpltQDZplR
         uCzWhgebTbK+hipJLI7iMIpzZ7oNs5kK48vtYcegRf8FLCyW0EK3QlC3roWzhwVNalt5
         MicyRaoZMp5jg9J7X6Z4EQc0MsypT5PCykKXi5dX7hKtqEAzf8HtlPu1n6eNmMLVOJ3r
         MAT9iMhdqwP5tnLoQECekRI79FaGHNb1Vk2qRFyaV7eGbU+IhhbxzmbsJ8RjAvkxyh1t
         9hAkz8OEuYSLagFoOv4U0WnSFGuvEt1gPZHZ/kBvPZ2krpACXkW4S+w2OB/rxXSgb8l4
         In7g==
X-Gm-Message-State: AFqh2kp3L+l0+rhcGEx6ieQqLeIQwZcHpmHbakbXcNuZh0WSgBKn/GXa
        raESPqr09e/btIQSQo2w3ekrSA==
X-Google-Smtp-Source: AMrXdXsUaIRp+krvPZdiEhnnERxhfp64SsIlVF989J4YcXQCFu4PObfZBjCXQ0+OyVrRFwtxkH84gQ==
X-Received: by 2002:a05:6512:3c2:b0:4cc:5e3a:dd82 with SMTP id w2-20020a05651203c200b004cc5e3add82mr2751180lfp.58.1673162763449;
        Sat, 07 Jan 2023 23:26:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:26:03 -0800 (PST)
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
Subject: [PATCH 10/12] drm/bridge: lt9611: simplify video timings programming
Date:   Sun,  8 Jan 2023 09:25:53 +0200
Message-Id: <20230108072555.2905260-11-dmitry.baryshkov@linaro.org>
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

Inline calculated values to simplify the calculation in
lt9611_mipi_video_setup().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7f9be74acf0d..1396ab081f61 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -155,12 +155,12 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 	hactive = mode->hdisplay;
 	hsync_len = mode->hsync_end - mode->hsync_start;
 	hfront_porch = mode->hsync_start - mode->hdisplay;
-	hsync_porch = hsync_len + mode->htotal - mode->hsync_end;
+	hsync_porch = mode->htotal - mode->hsync_start;
 
 	vactive = mode->vdisplay;
 	vsync_len = mode->vsync_end - mode->vsync_start;
 	vfront_porch = mode->vsync_start - mode->vdisplay;
-	vsync_porch = vsync_len + mode->vtotal - mode->vsync_end;
+	vsync_porch = mode->vtotal - mode->vsync_start;
 
 	regmap_write(lt9611->regmap, 0x830d, (u8)(v_total / 256));
 	regmap_write(lt9611->regmap, 0x830e, (u8)(v_total % 256));
-- 
2.39.0

