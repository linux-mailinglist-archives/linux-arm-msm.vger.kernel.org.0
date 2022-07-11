Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF0656D6EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 09:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiGKHhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 03:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiGKHhj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 03:37:39 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEE91BE9D
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:37:38 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id w2so5191482ljj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Jx23BXNRzAtXr/Cw0BJqhbbh1daaSzoYbxG/gLxa+A=;
        b=f70NiVYS+umzzkFh0P+3FRA5lsihIzIG2s+Bbx03NvVLIdOfsogs+ynwYUi0QDd3Z+
         vgp1+J1PNIXaWpyPj1AWC82fsb7//9cFe9SdPWHm8c6jYxr7JTWgQx74TDSLGivKEYWh
         bvU/gmOtgIOEZNNnlXEQ3txidNGEWUqTjVJsNTa/58uDy46olnLtXJy9NLmcvARQNbz+
         hULXcVxxUOL+9wDQsGOKl/WEY6+u9mGG2klfCPoPEDthEIxjIJEGx1BXusmH7jRIgj+M
         cHZgNQK+x3X190XNGykgOvjCRkoSNpBDHoK5ahZDgnMDox4EYnfHBWr4GSCx4waGvGEz
         lOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Jx23BXNRzAtXr/Cw0BJqhbbh1daaSzoYbxG/gLxa+A=;
        b=X2Q/dqnca9Sr4obZ/fVLq6jJyK0ausWlbwN7xCX2hDwFFCIGFw86EOvIQVIj8SPsVm
         mOexSDotmjdUSGbZznGXauOWZ4W0kcBHU/rulWUg2U+Nf5cgj4cBgNzqd3nkBEZYU2Fj
         a+/ajLvr2GiPbodqRS6PhsvebxMlFHuqbef/k4qFxE5U+62taGZKr8vD9xZnWeXqePlT
         39xaRoBeLFLLozpj0RdnADKGK468yvZ55ziXjB5Bj6EOvN9H7KH9Pp8FnF5xtTobccJR
         oQF4DtKAfwf2RG8x4wbXb6/LKtff+wdC22qJWOZ8flEzerClNbeaaAjz5Sddbnm3GjT2
         ilQA==
X-Gm-Message-State: AJIora8rFH4nkdG9HwewlZYs9IX233PkQJbHhHb+6xXtR5ejf3uQNQcC
        WyKm3MFxoJCnjwbgSOCLNMwXrA==
X-Google-Smtp-Source: AGRyM1uVbP0YaIMvlcxxyU8gdoKylutO21bCoQu+nYctBpbujHbs/JgX0FJ2rgQ0imTEcjAeHM8SgQ==
X-Received: by 2002:a2e:9355:0:b0:25a:9192:6c47 with SMTP id m21-20020a2e9355000000b0025a91926c47mr9366670ljh.190.1657525056628;
        Mon, 11 Jul 2022 00:37:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j8-20020a056512344800b00489e64dcf75sm149439lfr.204.2022.07.11.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:37:36 -0700 (PDT)
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
Subject: [RFC PATCH v2 2/2] drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date:   Mon, 11 Jul 2022 10:37:33 +0300
Message-Id: <20220711073733.312266-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
References: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
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
index b1b6ed3a8acc..314a814da6cc 100644
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

