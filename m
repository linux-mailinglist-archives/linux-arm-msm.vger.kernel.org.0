Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5F3353124
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 00:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235786AbhDBW3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 18:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235888AbhDBW3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 18:29:40 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C25AC0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 15:29:38 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id h25so4342331pgm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 15:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FtJPrWnxvy9nNmxs8bKL7DfV5E8REgE/CuweSYK12YI=;
        b=ADz4iZI0UBUy5Wgf7Wwt/rhv7XZcSPwsjZ/BiPy3B3JDfBcLDHbctBQwLTNBbC1pz6
         g4k+0i88k6d2fc8sNquHG/uIfTy/gd27MVhfmMN9ZddZa1EAbaRGkghaDmTziNgPp1Ro
         8IXzOvLZDfwIo5UUfhzQmhgws3B/vfTnq9H90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FtJPrWnxvy9nNmxs8bKL7DfV5E8REgE/CuweSYK12YI=;
        b=Efub4klQnX6qPqemHftTxDeFu5IIqkljW582PSZuU7dGgvE5QgiYMcX+xphtxGh5M8
         QJkI+E+rwx2Lc4Lq14XtJIAPReV8y5hd/llfqDSw/NIA/EUpnFqSPhS2ElKSSYdUtEqf
         KSAVDeBVMd38mXk1vFlqmOqUwKoneVZLQosF30dE/VCAtX02WYSlWM/yt1D7yOdShAlo
         cRZXTYz7svsOx0/DEfDI5/GMvHVEZ5PZHGBMbW3GfMjFh9Tk29lGFFUdifpImzgj2hAc
         7r//+IEu0LoRvmyt7rk/kUicQunjManXFaBxHQ14aX/78kaC+D34BgaDUBv1eES64x8g
         o8/A==
X-Gm-Message-State: AOAM5338G7l/XbePJvZ9fURT+u+IA/m5h65fiYACy59cuOab/7od8d5N
        7bVQyFuF/AsrYe6NAOiG9KJIGA==
X-Google-Smtp-Source: ABdhPJxgA9idcvNYzBZWn5xNFxDlF2IAIYBIQdD07MjVFFMOqyHn9gYAPHAYrsH14tOnDwgGEQcmBw==
X-Received: by 2002:a63:4415:: with SMTP id r21mr13635650pga.222.1617402577644;
        Fri, 02 Apr 2021 15:29:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
        by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 15:29:37 -0700 (PDT)
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
Subject: [PATCH v3 10/12] drm/bridge: ti-sn65dsi86: Read the EDID only if refclk was provided
Date:   Fri,  2 Apr 2021 15:28:44 -0700
Message-Id: <20210402152701.v3.10.I7a8708139ae993f30f51eec7d065a1906c31a4bc@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Though I don't have access to any hardware that uses ti-sn65dsi86 and
_doesn't_ provide a "refclk", I believe that we'll have trouble
reading the EDID at bootup in that case. Specifically I believe that
if there's no "refclk" we need the MIPI source clock to be active
before we can successfully read the EDID. My evidence here is that, in
testing, I couldn't read the EDID until I turned on the DPPLL in the
bridge chip and that the DPPLL needs the input clock to be active.

Since this is hard to support, let's punt trying to read the EDID if
there's no "refclk".

I don't believe there are any users of the ti-sn65dsi86 bridge chip
that _don't_ use "refclk". The bridge chip is _very_ inflexible in
that mode. The only time I've seen that mode used was for some really
early prototype hardware that was thrown in the e-waste bin years ago
when we realized how inflexible it was.

Even if someone is using the bridge chip without the "refclk" they're
in no worse shape than they were before the (fairly recent) commit
58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a76cac93cb46..fb50f9f95b0f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -275,6 +275,18 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	bool was_enabled;
 	int num;
 
+	/*
+	 * Don't try to read the EDID if no refclk. In theory it is possible
+	 * to make this work but it's tricky. I believe that we need to get
+	 * our upstream MIPI source to provide a pixel clock before we can
+	 * do AUX transations but we need to be able to read the EDID before
+	 * we've picked a display mode. The bridge is already super limited
+	 * if you try to use it without a refclk so presumably limiting to
+	 * the fixed modes our downstream panel reports is fine.
+	 */
+	if (!pdata->refclk)
+		goto exit;
+
 	if (!edid) {
 		was_enabled = pdata->pre_enabled;
 
@@ -291,6 +303,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 			return num;
 	}
 
+exit:
 	return drm_panel_get_modes(pdata->panel, connector);
 }
 
-- 
2.31.0.208.g409f899ff0-goog

