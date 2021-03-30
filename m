Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141CD34DED4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhC3CyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbhC3CyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:54:10 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37BAC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:09 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ha17so6994485pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I36IxPptwcREtpot0iJCH+3WfYFhSmpYp5deLinpPgg=;
        b=kPzNiByEkfsePsfPtj6S5YnMKlXu7wXISif9REAqYuFnbIttV4HEzv66lzECdNerwv
         7caDpqP6eV3Ii4qxlTPIHhsdUFLm2GnOWAFy+MOBzjGH9Nz8Z0o0lMCvIAbizAOKHaOR
         PbfqnEFWer573aC3LXsoSyid2BQ7sYqn9l95U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I36IxPptwcREtpot0iJCH+3WfYFhSmpYp5deLinpPgg=;
        b=rPOs5aICGeG9W6Kz/2pNLRQ+ALbptBc/B4EQVXGqGbWLdLygD1mR7J85QKT/K2PCfz
         y5WvKkN33EsXhoEUv9wvi9XQtn5tTv9oA40/LUTmLRyIAZU+vWk/ZrH/2sQ0EYzX1Z2a
         2WaGG+kduGBMH936SVHVa9/HjFtt+zUmmGNkHG2W6cWCUjpxdsZGxuHCUYpVUPnKl8C3
         MxgH8ADygThTpH1E7b/2dOYEVFAa/wF49l52uc6KLz/9j/CC1Wot+QrtZUabmDJOZApL
         mGtsuf0kbpHEve/FClYgj9ddP+tZiML8jmfEuaGxGTSl+KzTdB2XQi4lY0jKwqGdPn2R
         pzFw==
X-Gm-Message-State: AOAM532/nPZvarwFlrICMcLph+ICf26QvLBjkcbfSd5kF/+MF7OeMYUX
        6wspYvYEq/Pz6AfoIrjjZEiCuw==
X-Google-Smtp-Source: ABdhPJzao4hv+1lRc1IJmNX9LkjQKMN0rQjB/u4FznRywuq7j6sWJCoD2wfDN9s9896IQSi9E/Bnug==
X-Received: by 2002:a17:90a:c20a:: with SMTP id e10mr2008412pjt.221.1617072849314;
        Mon, 29 Mar 2021 19:54:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f599:1ca7:742d:6b50])
        by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 19:54:09 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/14] drm/bridge: ti-sn65dsi86: Move MIPI detach() / unregister() to detach()
Date:   Mon, 29 Mar 2021 19:53:36 -0700
Message-Id: <20210329195255.v2.5.I1a9275ffbde1d33ad7a3af819f5fbc0941b7ee02@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The register() / attach() for MIPI happen in the bridge's
attach(). That means that the inverse belongs in the bridge's
detach().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c006678c9921..e8e523b3a16b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -437,7 +437,15 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 
 static void ti_sn_bridge_detach(struct drm_bridge *bridge)
 {
-	drm_dp_aux_unregister(&bridge_to_ti_sn_bridge(bridge)->aux);
+	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+
+
+	if (pdata->dsi) {
+		mipi_dsi_detach(pdata->dsi);
+		mipi_dsi_device_unregister(pdata->dsi);
+	}
+
+	drm_dp_aux_unregister(&pdata->aux);
 }
 
 static void ti_sn_bridge_disable(struct drm_bridge *bridge)
@@ -1315,11 +1323,6 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	if (!pdata)
 		return -EINVAL;
 
-	if (pdata->dsi) {
-		mipi_dsi_detach(pdata->dsi);
-		mipi_dsi_device_unregister(pdata->dsi);
-	}
-
 	kfree(pdata->edid);
 
 	ti_sn_debugfs_remove(pdata);
-- 
2.31.0.291.g576ba9dcdaf-goog

