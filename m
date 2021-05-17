Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B94F3865F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 22:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237957AbhEQULX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 16:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238128AbhEQULP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 16:11:15 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F47C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:09:58 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id l70so5421497pga.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WlNMhXEMVlZjVUXqmHsr4gjek/M5L9VF2F3wmQwU67I=;
        b=cFRgeXV8NlsiS1oD3xuRnGX2XdP/0u/Kfh3xQWMNBi0KIswi1XczxBDDe4cB0Dbkbq
         Kdak7ghVHhJTL2Jn0niy+ac3uD0OnZQ1KJFuHlQOrBCCMMbiB1NS0QTrfqn9e4OxLATN
         TvogIgE0Q4ZS5kdq7VJwctsxLa5CRIb8fbWGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WlNMhXEMVlZjVUXqmHsr4gjek/M5L9VF2F3wmQwU67I=;
        b=mz+YOR0MRr5KQgVKubIu7sMgaSGhbP15QNlkmlc5ue3Q1kOPjLg8ou06Q/44joRyBB
         oHYePCY1CjyY55sMLsPgPNG8dbh006gRrPFwX1iXsyd8Ff+spVFurGA2qgei+b5SugA2
         umyp4mpwPLFCXLCZSrSJxFfoXweYc0gU7t/h/YY5ExY7ZKFgt7JzAtYWBdtk/SvbbpLX
         U+zqUy41erCgzywKGVMe6ws+LyXVjJVlronES2rpQh4kIYCSMQjTgsrJIvTzlb5VRZ6m
         U5PHwM1DRC+aF8OedTaF9u63hRRlY+8HTy5XH8SL7mAj6C8DMW6iNIoe8LmpCowtbvFx
         sRlw==
X-Gm-Message-State: AOAM5317tCww6OQGlm/SSWVBYSijY0/LNtVlN+tVChp859q2rjwXwk5j
        bVV2mefiqhoLI9OmDxw9u1MjkQ==
X-Google-Smtp-Source: ABdhPJzi1KCO1xj+wYDwMfBGJlV4IAZi3JbQkP29/R/2HZ+M6izq2Ry4gf+aiumrkOUg3ubgLkAhWQ==
X-Received: by 2002:aa7:8a87:0:b029:27d:a1e:bc71 with SMTP id a7-20020aa78a870000b029027d0a1ebc71mr1205648pfc.14.1621282198096;
        Mon, 17 May 2021 13:09:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:bc91:c597:ded0:7930])
        by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:09:57 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, robdclark@chromium.org,
        Steev Klimaszewski <steev@kali.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/10] drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
Date:   Mon, 17 May 2021 13:09:06 -0700
Message-Id: <20210517130450.v7.9.I9330684c25f65bb318eff57f0616500f83eac3cc@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is really just a revert of commit 58074b08c04a ("drm/bridge:
ti-sn65dsi86: Read EDID blob over DDC"), resolving conflicts.

The old code failed to read the EDID properly in a very important
case: before the bridge's pre_enable() was called. The way things need
to work:
1. Read the EDID.
2. Based on the EDID, decide on video settings and pixel clock.
3. Enable the bridge w/ the desired settings.

The way things were working:
1. Try to read the EDID but fail; fall back to hardcoded values.
2. Based on hardcoded values, decide on video settings and pixel clock.
3. Enable the bridge w/ the desired settings.
4. Try again to read the EDID, it works now!
5. Realize that the hardcoded settings weren't quite right.
6. Disable / reenable the bridge w/ the right settings.

The reasons for the failures were twofold:
a) Since we never ran the bridge chip's pre-enable then we never set
   the bit to ignore HPD. This meant the bridge chip didn't even _try_
   to go out on the bus and communicate with the panel.
b) Even if we fixed things to ignore HPD, the EDID still wouldn't read
   if the panel wasn't on.

Instead of reverting the code, we could fix it to set the HPD bit and
also power on the panel. However, it also works nicely to just let the
panel code read the EDID. Now that we've split the driver up we can
expose the DDC AUX channel bus to the panel node. The panel can take
charge of reading the EDID.

NOTE: in order for things to work, anyone that needs to read the EDID
will need to instantiate their panel using the new DP AUX bus (AKA by
listing their panel under the "aux-bus" node of the bridge chip in the
device tree).

In the future if we want to use the bridge chip to provide a full
external DP port (which won't have a panel) then we will have to
conditinally add EDID reading back in.

Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes in v7:
- Adjusted commit message to talk about DP AUX bus.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a59497f7e504..c9311e6e3799 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -126,7 +126,6 @@
  * @connector:    Our connector.
  * @host_node:    Remote DSI node.
  * @dsi:          Our MIPI DSI source.
- * @edid:         Detected EDID of eDP panel.
  * @refclk:       Our reference clock.
  * @panel:        Our panel.
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
@@ -157,7 +156,6 @@ struct ti_sn65dsi86 {
 	struct drm_dp_aux		aux;
 	struct drm_bridge		bridge;
 	struct drm_connector		connector;
-	struct edid			*edid;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
@@ -406,24 +404,6 @@ connector_to_ti_sn65dsi86(struct drm_connector *connector)
 static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = connector_to_ti_sn65dsi86(connector);
-	struct edid *edid = pdata->edid;
-	int num, ret;
-
-	if (!edid) {
-		pm_runtime_get_sync(pdata->dev);
-		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put_autosuspend(pdata->dev);
-	}
-
-	if (edid && drm_edid_is_valid(edid)) {
-		ret = drm_connector_update_edid_property(connector, edid);
-		if (!ret) {
-			num = drm_add_edid_modes(connector, edid);
-			if (num)
-				return num;
-		}
-	}
-
 	return drm_panel_get_modes(pdata->panel, connector);
 }
 
@@ -1354,8 +1334,6 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
 		mipi_dsi_device_unregister(pdata->dsi);
 	}
 
-	kfree(pdata->edid);
-
 	drm_bridge_remove(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
-- 
2.31.1.751.gd2f1c929bd-goog

