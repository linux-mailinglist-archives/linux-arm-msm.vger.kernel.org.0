Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A821356FC66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 11:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiGKJnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 05:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233341AbiGKJmi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 05:42:38 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122E09CE21
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:21:23 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bf9so7646605lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nRAGEf8g4Cp1qxDJWr3cJJxLbQRvNOY2paQIn9JUATY=;
        b=wdkXQ3io2K4JvD3tDkBGEHr985JNhIDp70T5BxUdNK9RFoNqTZ7j4vYo9TyR2ueP6s
         cOgdiJ2HGjlSE50jUxHpypdAltHngm0LtyE48emYft4l9QniwCTg4cA3uYD9uFljmK2Q
         qur75rxcB8kiHBd0nQ6Hd2+DB4uP8jthW+2hsWomnVsVqSsZ2DKPl70+L5LLXycQlJsN
         P6oF6FnGveWtkA1uI5kUO2uF8EsnTWuJ4JnhMXjz5JvGoucOtWJUZiZXzttftaaxKMlq
         rde6fgM8CUNmX4Trj2ShJbFY6wVQH1To7w3ps04nvohkcQQDq9M4RZ0tweC6h5oafbgp
         N4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nRAGEf8g4Cp1qxDJWr3cJJxLbQRvNOY2paQIn9JUATY=;
        b=Y4To9qy8Zt4V7x1Z6nnMTac4CEZ+5MNTS1ftZXzKx0G4+elQT7dU7laE9rTtXf3X+d
         0PHMyXkCB0rAxkZSAclOA2vMfJoWBrq/h8xHhF/9yiB6txZz3KzCEIdiYfVwPtUWcwaX
         0tQIMnbPMvauGUKX/CSS0GbYH8Zdwl9HJD+ZjgV3ui0l3n/iu4G2NvmVgVAxUbvkiPJX
         86VttY/8ONIImwup9Ip5mXxKBehM0aHoM1OxdEZmkvGeU7gdsRkVuR8HDEgClBL+REmn
         XvgblQWdXFrxpCJLs4e+9Q+tglslpqpNR6Ps6qnV3bsOjltIwv3GqB7cgHucKUM9Bd9+
         fo3A==
X-Gm-Message-State: AJIora80LSs/+4a4lVhyRKmGYFFCeZGISe8UqAAqp+8aYzjFKAZP1OiV
        +YiqIfMySxPs/1tuwCC8FYMncQ==
X-Google-Smtp-Source: AGRyM1sKgnyIT3SuBfPwfGfXobeOpQtlPLenOngZ+ibe0Lkc7eUOAU014BuLedWTWT6TpP7AulsUpg==
X-Received: by 2002:a05:6512:6d4:b0:47f:74b4:4ec4 with SMTP id u20-20020a05651206d400b0047f74b44ec4mr10674049lff.654.1657531280183;
        Mon, 11 Jul 2022 02:21:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c30-20020a05651200de00b00473c87152bcsm1434195lfp.127.2022.07.11.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 02:21:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date:   Mon, 11 Jul 2022 12:21:17 +0300
Message-Id: <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the driver does not depend on pdata->connector, add support for
attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index b362a7bf4d97..369bf72717f6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -698,11 +698,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
-
 	pdata->aux.drm_dev = bridge->dev;
 	ret = drm_dp_aux_register(&pdata->aux);
 	if (ret < 0) {
@@ -710,15 +705,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	/* We never want the next bridge to *also* create a connector: */
-	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
-
-	/* Attach the next bridge */
+	/*
+	 * Attach the next bridge.
+	 * We never want the next bridge to *also* create a connector.
+	 */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-				&pdata->bridge, flags);
+				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_initted_aux;
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
 						     pdata->bridge.encoder);
 	if (IS_ERR(pdata->connector)) {
-- 
2.35.1

