Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168A83FE3E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 22:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343895AbhIAUWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 16:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344732AbhIAUWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 16:22:09 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2AAC0611FB
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 13:20:54 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id x16so388268pll.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Sep 2021 13:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DABmu8a7wcOi+LAPS6v0nwHVY/OcrtFrk5J3lvyIla0=;
        b=Os0b+GnEGsF8siu+flMSW4dAYNThKDU3Ww7vE6vKTBh7r6Ux9uPPuEUWDpACEet4TB
         mVp83QdWqU8lPUa+HCK/0vBTS1Kinrh61IFQz72H+1ZnjVa+cEjR1BKLN1/zkW9TObfR
         qMT3e29jfdSpnF+/aK3xNQjTSSsJIXJqhOLNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DABmu8a7wcOi+LAPS6v0nwHVY/OcrtFrk5J3lvyIla0=;
        b=LIW7Aybq3cxm9W+Jwq0R9+4k5J6CBG+FYAmjLPB909nZyz2/+gKVqPcsHBrtpYDLuJ
         fIw36i7c9mcicWg6vvxxLX8WYYYEtvdIw3X/pMItWE42zYmmT2SXVpbWmzsWcSOjrVhc
         Vf/7g6zskS0vv+4tDxaOT3xYdZBu/j0S6kxLNGvfj3laZgPKFyOpZ+/FObA9687EFGbD
         Na+vwNFTaJhVsengaNpajr/m6agA6afs1HtUJizzcxOuhz+M8aCWklplwqEUYSIC3Rs6
         0gDrw4I39VN8Bd29q/K7HKvb2bVhj66dafPkyu/i1hVQk2+ffIh2MUyV1GeSANBdo2R2
         2WIw==
X-Gm-Message-State: AOAM53278YYvlb9DWJUobV1cUofSgV1FxAf6TjZdcQ4bYnucVdz4wND4
        KYdx0UfKXPNrqWXxQ28P2rpMu/e/ApX3Aw==
X-Google-Smtp-Source: ABdhPJxJ7qKxG2VvHK0KF5F5LrDE/YppzmHXKeC1vqvO9uwXp8XtCRHrGZoq8Mmssft1eXHGjc3fIg==
X-Received: by 2002:a17:90a:5882:: with SMTP id j2mr1100326pji.169.1630527654141;
        Wed, 01 Sep 2021 13:20:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:958b:b561:a735:e774])
        by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 13:20:53 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/16] drm/panel-simple-edp: Don't re-read the EDID every time we power off the panel
Date:   Wed,  1 Sep 2021 13:19:33 -0700
Message-Id: <20210901131531.v3.15.Ib810fb3bebd0bd6763e4609e1a6764d06064081e@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The simple-panel driver is for panels that are not hot-pluggable at
runtime. Let's keep our cached EDID around until driver unload.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- ("Don't re-read the EDID every time") moved to eDP only patch.

 drivers/gpu/drm/panel/panel-simple-edp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple-edp.c b/drivers/gpu/drm/panel/panel-simple-edp.c
index 5d58dc25ddf5..90ba146426e4 100644
--- a/drivers/gpu/drm/panel/panel-simple-edp.c
+++ b/drivers/gpu/drm/panel/panel-simple-edp.c
@@ -362,9 +362,6 @@ static int panel_edp_suspend(struct device *dev)
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
-	kfree(p->edid);
-	p->edid = NULL;
-
 	return 0;
 }
 
@@ -758,6 +755,9 @@ static int panel_edp_remove(struct device *dev)
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
+	kfree(panel->edid);
+	panel->edid = NULL;
+
 	return 0;
 }
 
-- 
2.33.0.259.gc128427fd7-goog

