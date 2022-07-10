Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329E656D0D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 20:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiGJSpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 14:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiGJSpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 14:45:46 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C30F588
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 11:45:44 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id bn33so3932642ljb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wVSMnS8t45CZD8juYdlJJPJTb5XNiXWgo6MEV6vD4LI=;
        b=gYLBv2KXlYas4icGyDhTOyDps6lgVFSE1iGw867dEXwyTI07bPLSqt0NARMcx8izZP
         tggJh1oQYqPUCt1znBDXxnKF3VRB8BVCEiSk7JeRhoiDxvukbn1ok30/arV6K3fqUEv2
         WPZID05nhykAs08D0G9eXZgbr1bJUEzkYjOfnpys6AZSxWWKfeBZOT1Fsrz35W6nKIej
         muVA8bdxdbSYhYLrq8NMht5kvZGvaTg0Rb+5L6Jf12xeibYCfoiS+Hep0w6KcqDxPSFy
         q0QgWRkfkZCnBD24XwYul4yODoY3/r1Uqbn/pcT58PF0vHEd0Pay5yr2IPAI3HsGDuM9
         FLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wVSMnS8t45CZD8juYdlJJPJTb5XNiXWgo6MEV6vD4LI=;
        b=w3bAcMXtqdEpauUiU+FsJHYZpW13wHf9iaP1Fg7+NPzVKF/G799LPnsylsmaPigEYp
         hPLh8ZeoSixEa/abbLjhF/sHsWJbxWhyVCz6voct3XJjssml02O1lRY/aQLI8Ae7EoLJ
         /s/5Ny3ZvjjDXnhuOFYSPtY68JUYFzF0a91B8XwbBwOoJSaGMwW9x0kwuKlU+TQk/3VG
         It9kvv9U+coSW02kbBulJhuioOax394JfwkPI5XcqIA8EsprhdLqg0+3rq8pbuSlA6bm
         yPlGc8GYFR9hzvpMJx1DVflqIa9tK4pVZ1t30RigMURCkiQbfq4SzHmeXs0z3GdTQecd
         JvAA==
X-Gm-Message-State: AJIora8ov6wQctfj8WuLfnQG2V4wTIHomYTGOr2U+NjuJUfJSvsxZnr/
        BAd8/ycV0bNeabScUaDRoczfGA==
X-Google-Smtp-Source: AGRyM1tV4KZxmsBcDzaDEkhgLgkD2idVTnQsNeakd0mWVCD3tClU5A2YAoyDh0V+PEo8fOZPZ5K76w==
X-Received: by 2002:a2e:a989:0:b0:25d:5d7c:f3e7 with SMTP id x9-20020a2ea989000000b0025d5d7cf3e7mr5811903ljq.392.1657478742554;
        Sun, 10 Jul 2022 11:45:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 11:45:42 -0700 (PDT)
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
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 3/3] drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date:   Sun, 10 Jul 2022 21:45:36 +0300
Message-Id: <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index df08207d6223..9bca4615f71b 100644
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
@@ -710,15 +705,15 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	/* We never want the next bridge to *also* create a connector: */
-	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
-
-	/* Attach the next bridge */
+	/* Attach the next bridge, We never want the next bridge to *also* create a connector. */
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

