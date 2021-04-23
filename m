Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF88369789
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243153AbhDWRAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 13:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbhDWRAS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 13:00:18 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BD6C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:59:41 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id lt13so14569989pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v3L6h1BjunVrmn6xM+A7e9Coz57kAQq9sEX0cijBf6I=;
        b=P2YIm80Y/ICCG+y+HzolfGLNXCmFgI3A3HuBx6AvFj28507tePNztOilZzFEIvP4EJ
         AKDvdgT44aEEbjBXK8iZkmiLI1hjnxIYqs7lKUgAOlXm0VgiiteLz94/xpSsRj0OLa+2
         C7ojRlXfaNQK3HnacnO27Njjj+GpLy/0HlSQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3L6h1BjunVrmn6xM+A7e9Coz57kAQq9sEX0cijBf6I=;
        b=SQz8yeXXxm40u9aSs2dr2iDYgRUvXAeQUMRNopRceBXTWqSclDQCquvZz2FKnQApaG
         80WnHqXZqfMkZL+7InLREbw4SIgePVslfkDFprRzJzQofWhl/FHeYB2nCrNyYKsK23ib
         RDSasmMao+/RagdHiow4gdnCKJ67UAD46qbBmljAFzUONeBvse8emFxO662ADUsYDdjc
         03GI+uoutoKOybN55bsUEOBCCqUF+k83wGrA8sk1BK26D0BvI9WbxU3Ausj9Bkj3hCET
         f2zORM9szonkVSsJtTwqZAOhWG5sdXkrHBMvffBTaZDab2rilQ0ez8I4rEEV1pvtn+I6
         QQQg==
X-Gm-Message-State: AOAM531cm7/lG/E8KibcXzDg6gy/5iv5n7PWikRXGEvt6kkeQKMS/DjE
        KdPF9VaRC6ZX7/81nwbLRkGSlg==
X-Google-Smtp-Source: ABdhPJwUVUVBiZpl2STs9t26EmL1yjzkkyP/mrfd3qlMXQIPV2Y6D3kRrmJUXon9H1XxH3F5d1fPZg==
X-Received: by 2002:a17:90a:9f02:: with SMTP id n2mr5439030pjp.151.1619197181372;
        Fri, 23 Apr 2021 09:59:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:41 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/20] drm/panel: panel-simple: Add missing pm_runtime_disable() calls
Date:   Fri, 23 Apr 2021 09:58:47 -0700
Message-Id: <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to
avoid excessive unprepare / prepare") we started using pm_runtime, but
my patch neglected to add the proper pm_runtime_disable(). Doh! Add
them now.

Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Missing pm_runtime_disable() patch new for v5.

 drivers/gpu/drm/panel/panel-simple.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6b22872b3281..9746eda6f675 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -797,12 +797,14 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
-		goto free_ddc;
+		goto disable_pm_runtime;
 
 	drm_panel_add(&panel->base);
 
 	return 0;
 
+disable_pm_runtime:
+	pm_runtime_disable(dev);
 free_ddc:
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
@@ -818,6 +820,7 @@ static int panel_simple_remove(struct device *dev)
 	drm_panel_disable(&panel->base);
 	drm_panel_unprepare(&panel->base);
 
+	pm_runtime_disable(dev);
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

