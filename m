Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38E234DED1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhC3CyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhC3CyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:54:13 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586C8C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:13 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id s21so6996599pjq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RTm+OMgZlY4S4hMjr1yPchfjYIhYww8IVvy3C+UG5OA=;
        b=T1ak2WvHBXzGIQK+L+Lq+8Ydsiyy7SAzW87e3YZAJR0P9M2cVBxpRS3kXSX/3+bAS0
         TyMOb6na5z7J4n+mnK9vwZIY4JmI8LfiedI1xE35JhEQDHzTm2Lv0g/CEOrM11JzFBPi
         J7Pzn6F79MaPYrGkaO7mXaxVycYLvdbRyGHns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTm+OMgZlY4S4hMjr1yPchfjYIhYww8IVvy3C+UG5OA=;
        b=ZchhxVDwJPuFGvnmAbQ2CDdTAgdtdv1T6oTGYoCom+tqXYdmqk+wAQSciC3iACwa7K
         7SuB3zBAeDFPj1R38PS1FL6yUnsAPmhjswgc00Lw1PV5k6sMPpVynJ2/wOXqFA8PTdKS
         ikdjiBFrkp3au1cXqA8PxYBZv4uAmDh6FmS1gxgGYKKT1ONZG0qwY0oW0HbDu4m9sDsV
         F349D947gNGNo2zr10KxSQJJZlq6nBPW8EkM9WPMwmnIId//eQkkBECW0WSbe8E+bfqC
         e47w7mH1GPG0YVLCqyKMNnw8EZZLKlBrdYaMM2xa6ggFsbVetKP4O7o20oGKSHvvhnCx
         YP1w==
X-Gm-Message-State: AOAM533jzfzUejTZ+DA8B8142H7M5S5oDfXJRga6KcX8Z2Zjjj4oQcbg
        o9ZRDdmIRzylPjI1Ifm8nRTKzw==
X-Google-Smtp-Source: ABdhPJxPN8enXp1e4HwIU+ZMKYwa4F8Gz+UNfz2Bce7f22QcfvvT37KnbBqNKoBBqjiwxVL9mJjXCA==
X-Received: by 2002:a17:902:f54e:b029:e6:3d74:eb3 with SMTP id h14-20020a170902f54eb02900e63d740eb3mr31652296plf.14.1617072852935;
        Mon, 29 Mar 2021 19:54:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f599:1ca7:742d:6b50])
        by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 19:54:12 -0700 (PDT)
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
Subject: [PATCH v2 07/14] drm/bridge: ti-sn65dsi86: Get rid of the useless detect() function
Date:   Mon, 29 Mar 2021 19:53:38 -0700
Message-Id: <20210329195255.v2.7.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we just leave the detect() function as NULL then the upper layers
assume we're always connected. There's no reason for a stub.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 50a52af8e39f..a0a00dd1187c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -306,20 +306,8 @@ static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
 	.mode_valid = ti_sn_bridge_connector_mode_valid,
 };
 
-static enum drm_connector_status
-ti_sn_bridge_connector_detect(struct drm_connector *connector, bool force)
-{
-	/**
-	 * TODO: Currently if drm_panel is present, then always
-	 * return the status as connected. Need to add support to detect
-	 * device state for hot pluggable scenarios.
-	 */
-	return connector_status_connected;
-}
-
 static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = ti_sn_bridge_connector_detect,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-- 
2.31.0.291.g576ba9dcdaf-goog

