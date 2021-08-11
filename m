Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1169C3E9B63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 01:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhHKXvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 19:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232948AbhHKXvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 19:51:35 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962FBC061765;
        Wed, 11 Aug 2021 16:51:11 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a8so6267167pjk.4;
        Wed, 11 Aug 2021 16:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04WJj5s3tctrSwR8Sz6N1WyD9Un9NfxweT900BICdVM=;
        b=ne9DzUb+oQO4z6rDjwVGCE9QmlLYsujxft75FhYrqw6dKpJVnnuAf4c+a7U+3CE3Pp
         M3V3z9TSE50E4H12+sSkPYWgBiqNmOoMkuu+FNSVD/NZeWsuCd1cfMoFsyBB//ayEBs7
         CuIy1Znix+tRa6+ApM51ahJCVzMkSVP/gmo31jYDk6A/WOM973ZXwqTw/Fr27pYWm5PT
         widI0YQHAsDmBpolqOAz/YkViZfW5A82VJAQlrge7gYXZWdPJBOis8uzM20JYDlnFvBl
         2n/qcGeZfV7jPa0C87rAdjZyN98MpEVZ+U4qwM3wtDsSx52nbMtuu/9s0ffZQEHGJShG
         wmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04WJj5s3tctrSwR8Sz6N1WyD9Un9NfxweT900BICdVM=;
        b=GRNOjAZgnY7r4b2XtVd9M46vkZdEHOtBXeYHhWpyxTyNkcfh7Vp41bz82oeqtoT3bk
         kRd1NLT3B7zG6E+BOYMMb4nZg8zwKwj5o33V9GJYt27gYRRPlDYwiX4Z8sjXgs7n58LF
         Onl/Ho7AheusZzrz94IRdUCnRdM3WO+DRSjcKu7BdFFx/6UJ2UBslDHT9HXgZJZRjLRc
         yNmn1iOcR3Hi8heOxyeAQ2mc49sTNGr9JZHOxTIuhsuxDW5iqd2mLGBWYX2cYgowW6/l
         JK+tlMF4DZlBmKsw4q/uCeP41m/UOpC93lUF0r4zHWhx91Ub34x0kx2Km67u0jnBGIds
         ExAg==
X-Gm-Message-State: AOAM533K/2it8XiSWqGHlMXl8aPyzf9XGHO9vNgLmtgBexpXquWIUlhe
        sb9CHFQ1pAp9u0USZWEdmkY=
X-Google-Smtp-Source: ABdhPJw1q2RqS/5nMBmm9zC4l9pNzGk/XZcfLbMnn089P0iE1maQfoZnavDOwU1JF/CdkIXCuGM6Xw==
X-Received: by 2002:a65:6441:: with SMTP id s1mr1164917pgv.214.1628725871203;
        Wed, 11 Aug 2021 16:51:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j16sm727463pfi.165.2021.08.11.16.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 16:51:10 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Date:   Wed, 11 Aug 2021 16:52:50 -0700
Message-Id: <20210811235253.924867-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811235253.924867-1-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Slightly awkward to fish out the display_info when we aren't creating
own connector.  But I don't see an obvious better way.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 34 +++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 38dcc49eccaf..dc8112bab3d3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -693,9 +693,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
-	ret = ti_sn_bridge_connector_init(pdata);
-	if (ret < 0)
-		goto err_conn_init;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		ret = ti_sn_bridge_connector_init(pdata);
+		if (ret < 0)
+			goto err_conn_init;
+	}
 
 	/*
 	 * TODO: ideally finding host resource and dsi dev registration needs
@@ -757,7 +759,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 err_dsi_attach:
 	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
-	drm_connector_cleanup(&pdata->connector);
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		drm_connector_cleanup(&pdata->connector);
 err_conn_init:
 	drm_dp_aux_unregister(&pdata->aux);
 	return ret;
@@ -806,9 +809,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
 	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
 }
 
+/*
+ * Find the connector and fish out the bpc from display_info.  It would
+ * be nice if we could get this instead from drm_bridge_state, but that
+ * doesn't yet appear to be the case.
+ */
 static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
 {
-	if (pdata->connector.display_info.bpc <= 6)
+	struct drm_bridge *bridge = &pdata->bridge;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	unsigned bpc = 0;
+
+	drm_connector_list_iter_begin(bridge->dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
+			bpc = connector->display_info.bpc;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	WARN_ON(bpc == 0);
+
+	if (bpc <= 6)
 		return 18;
 	else
 		return 24;
-- 
2.31.1

