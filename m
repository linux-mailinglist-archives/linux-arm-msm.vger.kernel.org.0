Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3BA3E9B62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 01:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbhHKXvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 19:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbhHKXvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 19:51:35 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D0BC06179B;
        Wed, 11 Aug 2021 16:51:09 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id a5so4872482plh.5;
        Wed, 11 Aug 2021 16:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Fb0UCEpX2hncAMMM+CVKUm3ptCtK2quo6PKUWz1gmE=;
        b=KoNiW8+Jp1FOFuNjlM7BjA29+/t2rZrZlR5toKTQrNfCrsL5Db/Pc8SOGuRaMceY3F
         lAcabFH8poaSyRbqMK6WI+p2Pj8xbHJanhgbTKfobbpkxtilQqDyY1HvD+S5x5HU97LD
         XapVHT3sA9RJEhHicGmmAXhe8Rn4r4UceqVnb8te9UnvVBVgS/+ASqrvgwjXzglCIia1
         TN4PbTXuUCvmDQpn+JFl+vqKyJrwAN/14JmdIISl0qnbQ80YiKjXHaU8w3CiSOS/qwm4
         qDugD9sss262vQ6IHOavNfXsxpAfu6XnGqb3Yeob5aF/Ujty0Wk4buM/biQv34vjl+27
         h/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Fb0UCEpX2hncAMMM+CVKUm3ptCtK2quo6PKUWz1gmE=;
        b=OyQF7GoXFPoKiEinR061eeuhHh5/I9ZCjYfAWcK6+RU9WbMqAF6TX6F3P0VmqlVqwv
         ovdHN0cMEDqF8AYOaogtZRVOpg8IJxo4EJySADqKwBArsevbynjU5yeyclflkFD0he9M
         J2Iz1Whc5ltsMDYACcC1hYRR8eDybJlYnNduY7eaCnHUhuzWRx48566WuNDdvwZ+uGa/
         UWCqXYd4h5RAPxjzQQVUHyvsWLIk9b/lFq7JTAJx9OkA3gteZgzTofl3n2+HKAbdgRCE
         UPg8u+qIZ9VX6rQSCOEwOdBK68GCQbqi7kOBt4EweuddAbczJVTVNFlQYI7bP8BgvUxj
         +dFQ==
X-Gm-Message-State: AOAM533Vv9W7SRWfEvrqQBCCXR4w3yn7OB1zmuAE8nWh/bTLnR8rPZAB
        f/kTmVCfbLBUcR0xgvDtqqY=
X-Google-Smtp-Source: ABdhPJwO4Bx01d9wfp9gJdAKnj0Rh7KBf/4YtO0bD4U4QnLVZFytwRCFRg7H3VUCEIf+YQJVPDJ9Og==
X-Received: by 2002:a62:78d0:0:b029:3dd:8fc1:2797 with SMTP id t199-20020a6278d00000b02903dd8fc12797mr1186803pfc.65.1628725869151;
        Wed, 11 Aug 2021 16:51:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id r9sm255420pfh.135.2021.08.11.16.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 16:51:08 -0700 (PDT)
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
Subject: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
Date:   Wed, 11 Aug 2021 16:52:49 -0700
Message-Id: <20210811235253.924867-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811235253.924867-1-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For the brave new world of bridges not creating their own connectors, we
need to implement the max clock limitation via bridge->mode_valid()
instead of connector->mode_valid().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5d3b30b2f547..38dcc49eccaf 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -595,6 +595,15 @@ static struct auxiliary_driver ti_sn_aux_driver = {
 	.id_table = ti_sn_aux_id_table,
 };
 
+static enum drm_mode_status check_mode(const struct drm_display_mode *mode)
+{
+	/* maximum supported resolution is 4K at 60 fps */
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 /* -----------------------------------------------------------------------------
  * DRM Connector Operations
  */
@@ -616,11 +625,7 @@ static enum drm_mode_status
 ti_sn_bridge_connector_mode_valid(struct drm_connector *connector,
 				  struct drm_display_mode *mode)
 {
-	/* maximum supported resolution is 4K at 60 fps */
-	if (mode->clock > 594000)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
+	return check_mode(mode);
 }
 
 static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
@@ -763,6 +768,14 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
 	drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
 }
 
+static enum drm_mode_status
+ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
+			const struct drm_display_info *info,
+			const struct drm_display_mode *mode)
+{
+	return check_mode(mode);
+}
+
 static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
@@ -1118,6 +1131,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
+	.mode_valid = ti_sn_bridge_mode_valid,
 	.pre_enable = ti_sn_bridge_pre_enable,
 	.enable = ti_sn_bridge_enable,
 	.disable = ti_sn_bridge_disable,
-- 
2.31.1

