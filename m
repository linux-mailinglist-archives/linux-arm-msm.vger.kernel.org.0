Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C1C7CB0A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 18:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234101AbjJPQ47 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 12:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234248AbjJPQ4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 12:56:43 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF58B3C26
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:17 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so46864755e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697475256; x=1698080056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2KAQh5biIaDjy3JspEokfbAFpOptd05O572lVX96aY=;
        b=b16gH0mUBocs5VLOa0oKJnzWyP2wr6PBOpMJgT0H0PPo+joXWMArPcZs8zkRWZrjqP
         hlgpRPTum5bT+FO/P77WqYszXeXNIqZ/i2P5JIGakO8r2xsMw+ln7zsl2V/5XpRjtbjB
         xFz5ULF98c/nQOqFxLdUVeRHCvWPVOBO13hSg0mO9Zrmom2DTpnnt8HkCGGLuiqqQwss
         zVdMa8/WiPzc6ajsaNkfUlOY8UA+BfXOFnGVT4eSdtI7jLnshuWsf+3Um4XYQpzbgtyu
         kTY9J8/td9YqwKK5vlUx3Qz7a8RtPg0eeA9VLAzMLCiHLL96cEaVQWqLn62uE1ci4uR0
         q39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475256; x=1698080056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2KAQh5biIaDjy3JspEokfbAFpOptd05O572lVX96aY=;
        b=Znit8/3GYWb/47hUDOtOfxQaTlJrncOoYtuxJR+Cnw/oZIfl4uEPpXYq0xlggA8Yna
         +1AP1rWBek7kEIffdLBhNjCEaKlxWWaTyx7WT/VyZwa259+RU9B6zguOtke29Vc36/dz
         20w/AsSh6xbot9fzQ6xNE8+JPZoldyYtboxsijkoIDxk3FiSJ0rEIeGoTBiWvTx/k0CM
         W2/N4MEiN7vCdn0a19F+8HAQVH2QRQheDmB1Kq69AszuE9hMDY7XgLzFQqIq8nFS/m8K
         /hH6usNWqm+JkHO0GLhIzk/bSsICCYph6K756K8RWA90nIct6b5On2j1Qfc0Hb30JpnZ
         hzIA==
X-Gm-Message-State: AOJu0YxINA8lEzqL1y4Ckt5XrDg64JLf/dSXH8fIggVe5J7m7EjNS2U6
        gPdiS7gVlLV4fif2DidsC+27wQ==
X-Google-Smtp-Source: AGHT+IEqmnobiCsIMYAdCDeaCtj3AGb0jtlboDlqcQ+Atx1a8i0m4PfESVkAoxvu6F9wIJAh3Bb39A==
X-Received: by 2002:a1c:7711:0:b0:405:959e:dc7c with SMTP id t17-20020a1c7711000000b00405959edc7cmr29757671wmi.30.1697475256293;
        Mon, 16 Oct 2023 09:54:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
        by smtp.gmail.com with ESMTPSA id s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:54:15 -0700 (PDT)
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
Subject: [RFC PATCH 10/10] drm/msm/dsi: drop (again) the ps8640 workaround
Date:   Mon, 16 Oct 2023 19:53:55 +0300
Message-ID: <20231016165355.1327217-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the Parade PS8640 driver sets the MIPI_DSI_MANUAL_POWERUP flag,
drop the workaround enforcing the late DSI link powerup in the case the
next bridge is ps8640.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 2d7040d21239..b6b8171cf382 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -198,29 +198,12 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-/*
- * If the next bridge in the chain is the Parade ps8640 bridge chip then don't
- * power on early since it seems to violate the expectations of the firmware
- * that the bridge chip is running.
- */
-static bool dsi_mgr_next_is_ps8640(struct drm_bridge *bridge)
-{
-	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
-
-	return next_bridge &&
-		next_bridge->of_node &&
-		of_device_is_compatible(next_bridge->of_node, "parade,ps8640");
-}
-
 static bool dsi_mgr_auto_powerup(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct mipi_dsi_host *host = msm_dsi->host;
 
-	if (dsi_mgr_next_is_ps8640(bridge))
-		return true;
-
 	return msm_dsi_host_auto_powerup(host);
 }
 
@@ -230,9 +213,6 @@ static bool dsi_mgr_early_powerup(struct drm_bridge *bridge)
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct mipi_dsi_host *host = msm_dsi->host;
 
-	if (dsi_mgr_next_is_ps8640(bridge))
-		return false;
-
 	return msm_dsi_host_early_powerup(host);
 }
 
-- 
2.42.0

