Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E0D40B92C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 22:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbhINUYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 16:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234776AbhINUY2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 16:24:28 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE548C0613E6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:40 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d18so135990pll.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vpEXnbBKR0bloKgXMxBkZufR69FGR0namo850/sSuY0=;
        b=QD10I0+TVx4/lj2zfWzAgsFTRCOeUemwh5dNMsa7Dl3/o3jNo71bM29C3c1wQjJnog
         qNHCZT3p5Go/d2liL5u5rqpZiqfFAWm+tSypPxiw4MTgjDCWgYwSGRSX8WkDVu5c5hpg
         eBPZD62X+jCyS9fgUWHAmPz8GUjZK+sepSqD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpEXnbBKR0bloKgXMxBkZufR69FGR0namo850/sSuY0=;
        b=LdQDceNPy92uEgRwCufzjjyoFpyQh9mivdx2aXxfKEaaYThMb9O+Pbc2aDEfmEBexD
         aPioOBoi2hnWe4V+CiqWUavybRnpgmBW8WEBJMTcPSx+9/Q1jytSoOsAql3f6wicidmj
         E/1vFWtHNxhSXTePKcCRzxiFz4UXZFMIYqp5GHSUbVIMo/1f8pMaOA16uWeZFPh9/AF5
         0yH65NWnR7XUc2kKRJvaxwGVOpPPv9+8B5GEJGy4kRpbYf9cQivEwAubbqsghDT4wa7W
         Aoh9IjbH6ly7PqHY8pZTzajjxhtjun/eq9PmGoQ2gcR6rB1aNsdln/eo1M8TxccrbHfQ
         9JqQ==
X-Gm-Message-State: AOAM5321PqiBkAvdIqcNJUKRXW5mfIXWLVZo2H1xRdRfEs1JiNlX08Uk
        EnwA4rR0F00EZedSaECkHF8vKA==
X-Google-Smtp-Source: ABdhPJwPexQPBm3N8BIYYm1w0FBveH0mVeVCcozwvbwFgJXed/YNyR9bZk3JoDvWePbXriTorIBX1Q==
X-Received: by 2002:a17:902:650b:b0:13a:123a:4ef9 with SMTP id b11-20020a170902650b00b0013a123a4ef9mr16501693plk.49.1631650960249;
        Tue, 14 Sep 2021 13:22:40 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
        by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:22:39 -0700 (PDT)
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
Subject: [PATCH v5 13/15] drm/panel-edp: Fix "prepare_to_enable" if panel doesn't handle HPD
Date:   Tue, 14 Sep 2021 13:22:00 -0700
Message-Id: <20210914132020.v5.13.Ia8288d36df4b12770af59ae3ff73ef7e08fb4e2e@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While cleaning up the descriptions of the delay for eDP panels I
realized that we'd have a bug if any panels need the
"prepare_to_enable" but HPD handling isn't happening in the panel
driver. Let's put in a stopgap to at least make us not violate
timings. This is not perfectly optimal but trying to do better is
hard. At the moment only 2 panels specify this delay and only 30 ms is
at stake. These panels are also currently hooked up with "hpd-gpios"
so effectively this "fix" is just a theoretical fix and won't actually
do anything for any devices currently supported in mainline.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v4)

Changes in v4:
- panel-simple-edp => panel-edp

Changes in v3:
- Fix "prepare_to_enable" patch new for v3.

 drivers/gpu/drm/panel/panel-edp.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 80a37a4e5750..a83ef9905ea7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -508,12 +508,32 @@ static int panel_edp_prepare(struct drm_panel *panel)
 static int panel_edp_enable(struct drm_panel *panel)
 {
 	struct panel_edp *p = to_panel_edp(panel);
+	unsigned int delay;
 
 	if (p->enabled)
 		return 0;
 
-	if (p->desc->delay.enable)
-		msleep(p->desc->delay.enable);
+	delay = p->desc->delay.enable;
+
+	/*
+	 * If there is a "prepare_to_enable" delay then that's supposed to be
+	 * the delay from HPD going high until we can turn the backlight on.
+	 * However, we can only count this if HPD is handled by the panel
+	 * driver, not if it goes to a dedicated pin on the controller.
+	 * If we aren't handling the HPD pin ourselves then the best we
+	 * can do is assume that HPD went high immediately before we were
+	 * called (and link training took zero time).
+	 *
+	 * NOTE: if we ever end up in this "if" statement then we're
+	 * guaranteed that the panel_edp_wait() call below will do no delay.
+	 * It already handles that case, though, so we don't need any special
+	 * code for it.
+	 */
+	if (p->desc->delay.prepare_to_enable && !p->hpd_gpio && !p->no_hpd)
+		delay = max(delay, p->desc->delay.prepare_to_enable);
+
+	if (delay)
+		msleep(delay);
 
 	panel_edp_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
 
-- 
2.33.0.309.g3052b89438-goog

