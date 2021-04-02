Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81B1353120
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 00:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbhDBW3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 18:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235888AbhDBW3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 18:29:37 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82E1C061797
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 15:29:34 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id m11so1732411pfc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 15:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LM7RMNcQZM8p5h41F/TtPYKzf6ZXd9Mgd1LpZEG6inw=;
        b=PlyqJUC50sx5zn0/47YDciZkbiyJ8LRzKp3zJwBVfKGSe+VkeZYyiodikasjHz8fsh
         M0mBw/L2StCjYLMNqS4c/zI1Ft92EESt5SGVyWw8A17Ctf1b8SwaTEuWZyPL91cniBKF
         WL2GOJnfjKAQYgR5Dq+tSNuWcyZvd8NjSb6ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LM7RMNcQZM8p5h41F/TtPYKzf6ZXd9Mgd1LpZEG6inw=;
        b=UI4OUwgdBGHoR+KaQ5yDQWUp8rvUhoA8n61qcgoM/7HMTpAhEoXSDByCRP6eus9fuq
         uMgGFFPJpV0JKT7DHqqZHmrGpOgjRuqzrbYurEvbMwiSr3zqSHD+eYCDzzeC7by7Dtvh
         /NM63Elv2Bww67L7etjg0sIzohgXwq9Lh4EkYBk4iCQ7uu497/UP+oV829BREHuOXJmx
         nlXx+fBIVoDe6HDAC9HWkbWfMJbGwkyL6NOS9uh26U9S2m6Ckt6me91N+w1NA0gYiznS
         854vN9l2G2aUOzMeMxyik4n7pNf0dMO0VP7VRXr6nBRjmVp7CZ2nEe86jh7hW2PK0sfD
         /9Wg==
X-Gm-Message-State: AOAM532J77j2m6kR1LcuJbm+jQ66Rre1/S9RdhnREi8hLfQJY3QuA2Dm
        /c8GB6eACv0c8ir7PtK+e3u3DIWWPd0ajX/D
X-Google-Smtp-Source: ABdhPJxWGKyCxGLU83T7rVZlMq20Szif/yIsu/zpitphqaDLhG+i5KKTABmUjLOvxO8CvTXttJ+ZAg==
X-Received: by 2002:a62:7b0b:0:b029:1ef:1999:1d57 with SMTP id w11-20020a627b0b0000b02901ef19991d57mr13977185pfc.19.1617402574407;
        Fri, 02 Apr 2021 15:29:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
        by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 15:29:34 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robdclark@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/12] drm/bridge: ti-sn65dsi86: Remove extra call: drm_connector_update_edid_property()
Date:   Fri,  2 Apr 2021 15:28:41 -0700
Message-Id: <20210402152701.v3.7.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
drm_connector") the drm_get_edid() function calls
drm_connector_update_edid_property() for us. There's no reason for us
to call it again.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 51db30d573c1..6390bc58f29a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -270,7 +270,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
 	struct edid *edid = pdata->edid;
-	int num, ret;
+	int num;
 
 	if (!edid) {
 		pm_runtime_get_sync(pdata->dev);
@@ -279,12 +279,9 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	}
 
 	if (edid && drm_edid_is_valid(edid)) {
-		ret = drm_connector_update_edid_property(connector, edid);
-		if (!ret) {
-			num = drm_add_edid_modes(connector, edid);
-			if (num)
-				return num;
-		}
+		num = drm_add_edid_modes(connector, edid);
+		if (num)
+			return num;
 	}
 
 	return drm_panel_get_modes(pdata->panel, connector);
-- 
2.31.0.208.g409f899ff0-goog

