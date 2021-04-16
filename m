Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8425C362B41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234928AbhDPWl0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbhDPWlZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:25 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20973C06138A
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:40:59 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id h11so1621557pfn.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pcJHDcYMV/GNRvkYvCP6Y5GlcN4y2gUoiu2dtS69kIs=;
        b=ZsInv2JReTrfjCgB8cC2jbctayfltBqBr0jOg/kNzrP6rbjJRuDO2ZT50ZjSe7P511
         6Eiktjk1IJ+Z76JPjdunMQ7+1SGN9m+uWcMd0FXecfowEx7VHM5M9vo76px1rEqZTcAA
         UF90B3xobn+6xQeKqzuNgiZBP9MVJxrOytsJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcJHDcYMV/GNRvkYvCP6Y5GlcN4y2gUoiu2dtS69kIs=;
        b=eeknhKUsGi5i31AYwoC0YZQSTAf6ObPfO8dwGpBdBJsKwJCUXjYGEbLvbsGj54Ksz9
         6JVqUGNg5n9kKvT/Izemsi3dTbxLZ0j9neGUQbnZX+GhaWftAueLqLbKcl7Tcz1sh9AB
         G9pmaTkSAnZIIHSkcj5x1kl5mKvqh2nDfO02+O8M4tRpJEs+zBfH5bIo+/x3QYbivGJL
         UIgpUOJcSR4zIas6ehiWBOHZ7KgNZfA8la6hJKPeu3t6GRFjO64QvNZF1aEPCp7/q3WP
         JHZIiQoOKSGh2bH8UcRiYS/prw9i6f3KENNqiZ0yB2lr9z9M1nLRhhx4/6Jas6/OMP7v
         YD1Q==
X-Gm-Message-State: AOAM532X4rRygGSC4M7dwPdGetQX30efoloDcQpPRFmuX/XokyNJqCEb
        7Wu16N0qP2M29GSzaRJJMITWiQ==
X-Google-Smtp-Source: ABdhPJxsoX7eKSMm+cKUoiLIrtgFQTzsLXBKF76NDygdyZY1gzqdrBnHowzCGvB55KXccagYFL6tdQ==
X-Received: by 2002:aa7:8608:0:b029:258:838a:23bb with SMTP id p8-20020aa786080000b0290258838a23bbmr7797618pfn.37.1618612858730;
        Fri, 16 Apr 2021 15:40:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:40:58 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/27] drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare() to post_disable()
Date:   Fri, 16 Apr 2021 15:39:28 -0700
Message-Id: <20210416153909.v4.5.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We prepared the panel in pre_enable() so we should unprepare it in
post_disable() to match.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v4:
- Reword commit mesage slightly.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c006678c9921..e30460002c48 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -452,8 +452,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
 	/* disable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
-
-	drm_panel_unprepare(pdata->panel);
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
@@ -869,6 +867,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 
+	drm_panel_unprepare(pdata->panel);
+
 	clk_disable_unprepare(pdata->refclk);
 
 	pm_runtime_put_sync(pdata->dev);
-- 
2.31.1.368.gbe11c130af-goog

