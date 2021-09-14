Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D7440B928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 22:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234701AbhINUYj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 16:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbhINUY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 16:24:29 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA7BC0613DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:42 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id b7so435078pfo.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dJXTwqS7PuPIT9CX0XVjRt+gK42F+FHMqbBg2Uj5BR4=;
        b=TqWvXeuyHuOSheemL0zyn3JHr5nZAS/bX+S2paShRs7l85FXpUjcDkt+1hQOqYJpwi
         Y5Pc8CsKF9F/Z3fUcl0iqJM4OIkeo1KmeN5dAWId8xYA37vSflKYmLAll37niHOfXqGS
         PN/VU9P8n26x9bxoXaxT8PyNNp5eteYT3LZqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dJXTwqS7PuPIT9CX0XVjRt+gK42F+FHMqbBg2Uj5BR4=;
        b=CN/RL9wwBgaSJfVjyBQmjnnjc02fVSy2SOmyezjRlZTiuzot/y2m+T6TJPWWtRV+8R
         bNFtL0L1Ki22ts21qWOuLwG8R8Ci3uEx9UL4q/VYsRfT25eCXWmSvdedM1FdN/jAy8MD
         bk5VQNXYHNdE78JU5tmBhSHCZlGolwI/YMQJsU8H3jO2Yr2e0LMNgeCE1dU3gOh3ltDw
         0yEjW+fcHr6CHKw2o58Ln1D9kBN6dQiC0MhL00NfbpV0Joo6Meueejn3hCv1IwHFLGXe
         vvJS2vStvHw7RoNLIlzQnr/oojaGF8s74uEln97dtpHl+KGQPXsjK+sMoidM+M2/JpYA
         Gj2w==
X-Gm-Message-State: AOAM5301GkgSNpMHiIhVAwqI3lVOKzJI5dKFQelSY3eKBUgABh0ra6aB
        q7MKF1qk2MEJPUM5SKcXWK916A==
X-Google-Smtp-Source: ABdhPJyDGeNjSKE64qgG3//L1RREy4RmX89o+nEgvz2C87yHljnSuXQt+fd9GBedSnhIztUqyUoGfA==
X-Received: by 2002:a63:6d89:: with SMTP id i131mr16955280pgc.235.1631650961596;
        Tue, 14 Sep 2021 13:22:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
        by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:22:41 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/15] drm/panel-edp: Don't re-read the EDID every time we power off the panel
Date:   Tue, 14 Sep 2021 13:22:01 -0700
Message-Id: <20210914132020.v5.14.Ib810fb3bebd0bd6763e4609e1a6764d06064081e@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The simple-panel driver is for panels that are not hot-pluggable at
runtime. Let's keep our cached EDID around until driver unload.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v4)

Changes in v4:
- panel-simple-edp => panel-edp

Changes in v3:
- ("Don't re-read the EDID every time") moved to eDP only patch.

 drivers/gpu/drm/panel/panel-edp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a83ef9905ea7..817c60858ef8 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
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
2.33.0.309.g3052b89438-goog

