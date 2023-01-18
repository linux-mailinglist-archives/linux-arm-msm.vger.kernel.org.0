Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 961866716E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjARJBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjARI7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:59:12 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB5C10F4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:12 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id v6so48471226edd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWMWBkiBRp89l37RQ64rpz1WLSSDShciYdrNMM6e18=;
        b=sVIqtz7UvlrtqEpDU+pmxvqmwI1/B0wi02UzxO3FJlR8+mQsX9ZLJ7uUjj5KerlDjG
         osQy343Nal1u8S/ISOWrUjsf2Rwz7V1nzhgH0fHmEcotEPZ4CBgmetRVr8Y6V+Hj18Oz
         NpFUX4hx47xkBaE/SPLRiEwkJ4qEnRN0VH+OzNzwJBugSaGHP+XMmS+Rf80HNI1KKGIG
         bcNukvAsM8RVeHUy8ujxFI1KmE24bkXyBVpFkJn05YF+bISIIBajHKoW7yk13gjlG9pH
         wEfR3FT9wSeGL76QpKdJ6407sICTWYDcP0oWVHyiOXpyGMPSLxV7oKUI0ac1Erk+Klrq
         nPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKWMWBkiBRp89l37RQ64rpz1WLSSDShciYdrNMM6e18=;
        b=k2lSCGDPizFERwt3Nrlb5RC8ETy7OylM1sXMLqb6ZdLN1IpVftny6brF/GL9sanmnq
         G7DcSAt8Br5J0idbjvKAFcLY0bKS7H6sCXpePkdb1ln9NJvn8r2il/Wax+wQ5xniTMR+
         z3SsEX8H65++5T1jUd+xIzHnSsZeSgGH5ayzQ985xXT3uR/JEzG4nTrtmUtcLjFlR5sV
         9ja8fti9ETRbuUhu21xMHP+9hNX6N7Sl7BGuS2U7TifRliMrzfNCgHk9eNJ2AK66tbgO
         gB3OQixXiLLMM5caaoMv4TcxyP/IgXFLKwFDEPnGROE4ZZwb0xA49lh7Wb5iHhLaPeCW
         xAfQ==
X-Gm-Message-State: AFqh2kqo6YHyed9ysyO36uWqzg18FcJruCdVZqK+k4NMFoT9Io64WO3H
        dBUlx/L5l8SIlQnQ9Cf7NL2F7Q==
X-Google-Smtp-Source: AMrXdXvLHdymmreFDJFQdXc4WZTlX5SHLKz8w75pA9lqpebRUNjm+Gfu1+LHBnrg+EUkwF3JkvPZ5Q==
X-Received: by 2002:a05:6402:2289:b0:498:f82c:7068 with SMTP id cw9-20020a056402228900b00498f82c7068mr5001316edb.35.1674029831043;
        Wed, 18 Jan 2023 00:17:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:10 -0800 (PST)
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
Subject: [PATCH 10/13] drm/bridge: lt9611: simplify video timings programming
Date:   Wed, 18 Jan 2023 10:16:55 +0200
Message-Id: <20230118081658.2198520-11-dmitry.baryshkov@linaro.org>
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

Inline calculated values to simplify the calculation in
lt9611_mipi_video_setup().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

