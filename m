Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E383D30CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 02:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhGVXlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 19:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbhGVXlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 19:41:47 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F91C06179B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:14 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id c11so1167952plg.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gWScQ3RoXdLdJS9t+RJN8kdgO9NRWYfVw++Ppk8gyUQ=;
        b=XqCcX4qSfe4fNA6xqHdCXE7WfptpmrsuVLTgFjOiMco81rVjYmUxtJip9IGSAumy3g
         PY/iX0k4asGRdW1+C7Odrq6m1900W/I8qEao9ifYHDajtZ6v8UJqceHNZnyoQApRRfJL
         AlchELWMfPx3fYJN1EkRqZPAOr9sTG5BTSjCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWScQ3RoXdLdJS9t+RJN8kdgO9NRWYfVw++Ppk8gyUQ=;
        b=d3ZulE6L/9bTMo+qh+6DgjGizduTjO+ZBM8CtE7UOtFajhKD73oNMmZ0wpe9RNBtUs
         c+1tsXjDw4c0ulKfiL+3n9Ak7nHYpR1U0YSNWlwPZ18/xiL9Srbo3y28GkE56Doy9oDr
         TtcdBzRGl11PtQ5gdx6jKgmhMA9EnkAJjCj9a0cvVlfO1GGG/bZRplRF8qy0ZIU4pxPw
         OrilIogRYNHJO508HzWtixHqqLoEfPctZh2v/h+segAUp87f5S4oE00zG1m/cjYL3g3/
         QPTteGWUipvkONgzOYpTEVQEv9M/784H1ExBnLXTjmaMYGenn4thdC9j+iGsPth3AMQ6
         curQ==
X-Gm-Message-State: AOAM530YI6MyPVvmDYmpOCjhhytY+jg2mGmONLcx6jt3tIp+UxCm+s4a
        TO+moSMt6gNxL99KCPKjzjc3WA==
X-Google-Smtp-Source: ABdhPJwHpj2aZr9pdn1A/6Wx4oICGJjmdyIfL+SVJ2uAcEvkUKah5a3ORUThg/UpxLy0oPpE5BTJDA==
X-Received: by 2002:a17:90a:6c61:: with SMTP id x88mr11582187pjj.122.1626999734119;
        Thu, 22 Jul 2021 17:22:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
        by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 17:22:13 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/8] drm/panel-simple: Don't re-read the EDID every time we power off the panel
Date:   Thu, 22 Jul 2021 17:21:42 -0700
Message-Id: <20210722172104.RFC.4.Ib810fb3bebd0bd6763e4609e1a6764d06064081e@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The simple-panel driver is for panels that are not hot-pluggable at
runtime. Let's keep our cached EDID around until driver unload.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b286bd4444f..bcdc84b20827 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -370,9 +370,6 @@ static int panel_simple_suspend(struct device *dev)
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
-	kfree(p->edid);
-	p->edid = NULL;
-
 	return 0;
 }
 
@@ -862,6 +859,9 @@ static int panel_simple_remove(struct device *dev)
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
+	kfree(panel->edid);
+	panel->edid = NULL;
+
 	return 0;
 }
 
-- 
2.32.0.432.gabb21c7263-goog

