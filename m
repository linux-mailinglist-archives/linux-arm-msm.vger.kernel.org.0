Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08AB6362B7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235296AbhDPWmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235301AbhDPWlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:47 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A6AC061346
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:20 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so17162769pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kqCE/xXwxSoeWBOMvLwmwliZjmAMKUs0iLtp6BlgVsU=;
        b=SwjfziIWqNniWGnfQA4Mu9tN3w07oIjFMhMJDpgQMVkY9zzzyf1m8I7IfYBBZCxP1O
         8hs0Yz3kOQHlTLcDe4RwuqefzyQ+6JvpjfVwjccNBeAkXijAdbDdgJumCmrVHR6T9bOa
         zEwpNcvqr1c327XIB8ruFAbdGbim8yXUKpjF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kqCE/xXwxSoeWBOMvLwmwliZjmAMKUs0iLtp6BlgVsU=;
        b=JEXumvHyl63tgvvQ+42La9b5paRgoKmC15rQpe9rprIdhuqbHN9hrK3ihhBxbapHXO
         ndcdXVa+88mjI8Fi7bLD1fOrNR6DcuQOsy+9qdltFq6P91kzKpspDwhSxq7BrIbU56kS
         kjfVREKFBDkKJQJBCW0TfDURoFgKLSGOdOJZjzoY3vUAiqcTkZ0u5kzpN2ZyPw673+8a
         MSAX8uM1/QxzKF6ipj3CNy/BNyqSxvrTRualXq1VK7l7oBKIlSMShqD5TCTVVG7lbg0a
         No/0rDMJo6yxUUihG8YgL9QO2SkfGhMfdlcAZaUyx97zmRhR75E6rjHv4aZPr2ZKO7ST
         SB5A==
X-Gm-Message-State: AOAM530O01ctVdSQUaOxKTu95/28WB1AAX/4I4TlYrtgxXwWu23BxdbB
        vGKuC6qr6NGlSboOwxtfSWQO1w==
X-Google-Smtp-Source: ABdhPJyNa8K4Z+U1V2ZBtvt6ba2rIHE8o2uaEmGGR6q6Rp/xY+91l1mtNiWyNtlTxQDUlQv9OPyMGg==
X-Received: by 2002:a17:90a:c203:: with SMTP id e3mr11762665pjt.173.1618612880550;
        Fri, 16 Apr 2021 15:41:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:20 -0700 (PDT)
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
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 25/27] drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
Date:   Fri, 16 Apr 2021 15:39:48 -0700
Message-Id: <20210416153909.v4.25.I9330684c25f65bb318eff57f0616500f83eac3cc@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
will need to add something that looks like this to their panel in the
dts:
  ddc-i2c-bus = <&sn65dsi86_bridge>;

Presumably it's OK to land this without waiting for users to add the
dts property since the EDID reading was a bit broken anyway, was
"recently" added, and we know we must have the fallback mode to use
(since the EDID reading was a bit broken).

Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8253098bcdbf..62904dfdee0a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -125,7 +125,6 @@
  * @connector:    Our connector.
  * @host_node:    Remote DSI node.
  * @dsi:          Our MIPI DSI source.
- * @edid:         Detected EDID of eDP panel.
  * @refclk:       Our reference clock.
  * @panel:        Our panel.
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
@@ -156,7 +155,6 @@ struct ti_sn65dsi86 {
 	struct drm_dp_aux		aux;
 	struct drm_bridge		bridge;
 	struct drm_connector		connector;
-	struct edid			*edid;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
@@ -404,24 +402,6 @@ connector_to_ti_sn65dsi86(struct drm_connector *connector)
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
 
@@ -1330,8 +1310,6 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
 		mipi_dsi_device_unregister(pdata->dsi);
 	}
 
-	kfree(pdata->edid);
-
 	drm_bridge_remove(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
-- 
2.31.1.368.gbe11c130af-goog

