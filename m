Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3023865D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 22:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237584AbhEQULH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 16:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236853AbhEQULG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 16:11:06 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E083C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:09:48 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id i5so5446420pgm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 13:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Od89iO9K7b3a0mIXVinRw4ty+isZRxmi2wE6XqdNOk=;
        b=TtUzhEsImHEcyrdQGMv96nCuysYgEsi3cNO4UegmgRhdA1F8TACbuVBLqp/QdKqQaf
         UAtp6s4WuAUNwtNHz8bz9UudmLTCHxM6xHX4DvbM/OUI/MRDYHTHfgOj3vROVbiMG17d
         UARJMKUM6A4voepduG2ek9sL/YpvPRkECaI7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Od89iO9K7b3a0mIXVinRw4ty+isZRxmi2wE6XqdNOk=;
        b=Mm4wujVQEqlkURxEpmS672Ad8eZCHfwWqPkmH+3vkjYPY4tvCS+ImHh8uJjzYFQ4s9
         3YbPW7Ef2R9Yb8LfnEQXyLZILc3/JhHIo03a7CwQcE2DkkspPozXUMhp6LgtXPr9Kojw
         5t5HTBtNaq8nTQIspX1HkN6u7RdboC5r2CY/N9Qkt0JYvNlD6fg8rqqaxShEGBtU91ZP
         o54ZVshpBxg4JDQHrwwNThBjw/6e44IhzqiW3jwOSwl1NzX6jHfkziZh3yOEPBkk4O9j
         5Q0bvBK8R1K79+QCQ82Xsk+Y0wkgN1XFwQhjdKXpyUwHMph5MRB1wkQ1GAGn+4ER9/eY
         jRxw==
X-Gm-Message-State: AOAM531gBbNJ7e2FAmej1xo1VXOsdRo3nCQ1/m8D9a1l52akzmXTt5Jg
        fqN3MXvp8Yq4KAYCGVeWVsntpw==
X-Google-Smtp-Source: ABdhPJzM48ZbURkxPit3OBuzXEszo4hQUmrav6Fobpm8X3kMTwn8gRXetNU7W9BoueB/crKw8VmEDg==
X-Received: by 2002:a63:36c1:: with SMTP id d184mr1219542pga.47.1621282188016;
        Mon, 17 May 2021 13:09:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:bc91:c597:ded0:7930])
        by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 13:09:47 -0700 (PDT)
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/10] drm/panel: panel-simple: Add missing pm_runtime_dont_use_autosuspend() calls
Date:   Mon, 17 May 2021 13:08:58 -0700
Message-Id: <20210517130450.v7.1.I9e947183e95c9bd067c9c1d51208ac6a96385139@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM Runtime docs specifically call out the need to call
pm_runtime_dont_use_autosuspend() in the remove() callback if
pm_runtime_use_autosuspend() was called in probe():

> Drivers in ->remove() callback should undo the runtime PM changes done
> in ->probe(). Usually this means calling pm_runtime_disable(),
> pm_runtime_dont_use_autosuspend() etc.

We should do this. This fixes a warning splat that I saw when I was
testing out the panel-simple's remove().

Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v7:
- pm_runtime_dont_use_autosuspend() fix new for v7.

 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9be050ab372f..21939d4352cf 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -798,6 +798,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	return 0;
 
 disable_pm_runtime:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 free_ddc:
 	if (panel->ddc)
@@ -814,6 +815,7 @@ static int panel_simple_remove(struct device *dev)
 	drm_panel_disable(&panel->base);
 	drm_panel_unprepare(&panel->base);
 
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
-- 
2.31.1.751.gd2f1c929bd-goog

