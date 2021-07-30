Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20893DC03F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 23:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbhG3V07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 17:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232460AbhG3V04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 17:26:56 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18BAC0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 14:26:51 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso16194799pjf.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 14:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=37Nacw64+KOiMZmL+vH2rc7D0NFwBJZ1GX41lOzA7sI=;
        b=k3dRWkT1xUJQUM1V3eFMcOCXVOa7G3HDa077JfJ6+aehexe59cOrNfpB0XemFMroc7
         9fP1fXGIEoJ8JUIUXS0nvYt0g7InyqCzjz5uw5aaB6YNXKRPz3KVs6jgRqfLRflWaoNM
         EtrOjelZ44Et6gdFGNEK/YWJ3uD9WIzm5XkIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=37Nacw64+KOiMZmL+vH2rc7D0NFwBJZ1GX41lOzA7sI=;
        b=mEZ/IQHRBk9RgWw4QIHImoWsTLUZk3LxVHBOI3EuJYmaJS5yrrvmzPYwOLN1UzzlPT
         /bVNEGvL/Gqwy4OkM5FEecuaqNplb3UDz0sDFltRLLBmrxXxxAJPAfOauan8Rkasall6
         H23MLNVAiIevE4ow9POppVXxktVlMVkKQ1MR1MzjWcBEurBQqQlerE5utAUGIvIVNcUE
         MD+KyNOrL3IYvjrG69XQCD0hXY2M1r90NyyShmKKu+pOTIpMXXawFCNeXWueL1wcedYj
         0f0SQZvksRYpbzWNnAqwbZ7QKLLgJvEYn8hfNXfeiskAw/kpNE75qzCJgPI6Yh3BBXsw
         4s3Q==
X-Gm-Message-State: AOAM5302R6VTiXlNd+EpdyuuIS0XhDsIaqLDijdfr5fhNeSNxHp1aCy7
        92yAORMSB/5rCHqtx1K2D970cw==
X-Google-Smtp-Source: ABdhPJyd5vlwWOM/HeeHAZX/FPiTwLb2eJnUBso0gVxPSxpB1owLbAxI8YeEzKhk0K0yQ86ZtY/f3Q==
X-Received: by 2002:a63:2308:: with SMTP id j8mr4059101pgj.166.1627680411233;
        Fri, 30 Jul 2021 14:26:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:3424:e0ac:5a92:d061])
        by smtp.gmail.com with ESMTPSA id u21sm3484625pfh.163.2021.07.30.14.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 14:26:50 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] drm/panel-simple: Don't re-read the EDID every time we power off the panel
Date:   Fri, 30 Jul 2021 14:26:23 -0700
Message-Id: <20210730142537.v2.4.Ib810fb3bebd0bd6763e4609e1a6764d06064081e@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730212625.3071831-1-dianders@chromium.org>
References: <20210730212625.3071831-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The simple-panel driver is for panels that are not hot-pluggable at
runtime. Let's keep our cached EDID around until driver unload.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ff8b59471c71..b06bf30c65d0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -350,9 +350,6 @@ static int panel_simple_suspend(struct device *dev)
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
-	kfree(p->edid);
-	p->edid = NULL;
-
 	return 0;
 }
 
@@ -834,6 +831,9 @@ static int panel_simple_remove(struct device *dev)
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
+	kfree(panel->edid);
+	panel->edid = NULL;
+
 	return 0;
 }
 
-- 
2.32.0.554.ge1b32706d8-goog

