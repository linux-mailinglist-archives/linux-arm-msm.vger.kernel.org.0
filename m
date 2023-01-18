Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924036716E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjARJBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjARI7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:59:13 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F117DEC7E
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:14 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id u19so81226046ejm.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iRO5zobwnMAf5ot44I6NAriyBvIWuLFOAUC1y5raCw=;
        b=HZ0zSZ3Z3w4RqLmp+bGcbuFXjMe+ULnoxR1lS71MHJONksERVhgeDH1V424TBBQWJF
         sQrGFe0DLBnnYuhLmPxAo+GROVgb0S9tFhLcTXOouTg3njsGzcf2mWRuRPreIPLy/8Nj
         hWr09acxJ9mTKpapcibGa6z4zblnnRuKg98zCLAKKIfCJriHQg2oYSUW/R3vD9XY5VKE
         RfaI3bDMRWkSI6JJ98y+mW8fooeVdRIKWJajxqG0tPBpeBSB7roANvEEqCcBuFwmx2Ho
         lEI8qEMRNEVdw9E9pggGWKt04Pa0pbu+QJysjebW62sKM/cEcbuxIwHcjbvHJRs8pXNP
         FI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iRO5zobwnMAf5ot44I6NAriyBvIWuLFOAUC1y5raCw=;
        b=F7DLQKpt/LM5DAVzOKUoK+Ci8p7X+zNcaM4VX0v0UOLlhQ4r5wtNwzb6HUSpgSD61R
         YGoe89Ebfp+y+7Hw7mV8SpCg8VD0RIxI5uf8GanAhKpjX7ecTkRSBT19Ws3quEL0eHrh
         +Sy8m+Mn7/BVNMnKl0aiudszi9BQ/dNK+5jwhuDEF+zEeRW5U9LeAE9L3vTZeA4Ml7nI
         oBtZX7zH1tz+BLKtLvZqRY7753eB182dFT2x8ONOMI8jWBnu87vVL0Kx+IQxVndHY9eX
         MDGTrWl03yoQJ3sFzBonbz4wEpKZ6sajtl+euYffLECwWZanSKrcDUHxSkyFJFjXbmRZ
         gELQ==
X-Gm-Message-State: AFqh2kqdh4LKija+xA3Lyy5Mw1oNmFV9gh5s5kYQHI2BB+/T4y/RPDgC
        Gyxtoa9pVtbRld8XKDP0aPgJgw==
X-Google-Smtp-Source: AMrXdXscwnGp+t9+zLyWaTX06jajtPcXPCxyKDwib+i96HA+T/G9V6Wzq4cxmFXTV7bNN/guIvW9iQ==
X-Received: by 2002:a17:907:2c66:b0:7c4:f752:e959 with SMTP id ib6-20020a1709072c6600b007c4f752e959mr6847828ejc.33.1674029833247;
        Wed, 18 Jan 2023 00:17:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:12 -0800 (PST)
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
Subject: [PATCH 12/13] drm/bridge: lt9611: stop filtering modes via the table
Date:   Wed, 18 Jan 2023 10:16:57 +0200
Message-Id: <20230118081658.2198520-13-dmitry.baryshkov@linaro.org>
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

The lt9611 bridge can support different modes, it makes no sense to list
them in the table. Drop the table and check the number of interfaces
using the fixed value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 49 ++++++-------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 82af1f954cc6..c2cd36d926a0 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -84,24 +84,6 @@ static const struct regmap_config lt9611_regmap_config = {
 	.num_ranges = ARRAY_SIZE(lt9611_ranges),
 };
 
-struct lt9611_mode {
-	u16 hdisplay;
-	u16 vdisplay;
-	u8 vrefresh;
-	u8 lanes;
-	u8 intfs;
-};
-
-static struct lt9611_mode lt9611_modes[] = {
-	{ 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
-	{ 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
-	{ 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
-	{ 1920, 1080, 24, 3, 1 },
-	{ 720, 480, 60, 4, 1 },
-	{ 720, 576, 50, 2, 1 },
-	{ 640, 480, 60, 2, 1 },
-};
-
 static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct lt9611, bridge);
@@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct lt9611 *lt9611)
 	return 0;
 }
 
-static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
-		if (lt9611_modes[i].hdisplay == mode->hdisplay &&
-		    lt9611_modes[i].vdisplay == mode->vdisplay &&
-		    lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
-			return &lt9611_modes[i];
-		}
-	}
-
-	return NULL;
-}
-
 static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
@@ -832,12 +799,20 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_info *info,
 						     const struct drm_display_mode *mode)
 {
-	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	if (!lt9611_mode)
-		return MODE_BAD;
-	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
+	if (mode->hdisplay > 3840)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay > 2160)
+		return MODE_BAD_VVALUE;
+
+	if (mode->hdisplay == 3840 &&
+	    mode->vdisplay == 2160 &&
+	    drm_mode_vrefresh(mode) > 30)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 	else
 		return MODE_OK;
-- 
2.39.0

