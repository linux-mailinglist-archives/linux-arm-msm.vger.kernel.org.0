Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A813FE3DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 22:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344756AbhIAUWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 16:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344778AbhIAUV4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 16:21:56 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3789FC0612A9
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 13:20:51 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so536503pjc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Sep 2021 13:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dXkXwd4vEP4bwY9rQawnEqC6kwS+NIIDi4QUwZ6cGtQ=;
        b=EjRpUS2pwumz9y0I78cbBHrql1evvQsWCNm51l0dM73D/8WNx855hwhFYSzlErwRHk
         YcS15dy5jZkeq0WUu21+obBJn5yMCRcK32TO3GSQKrmQRdNaYUdDMSuuyR8WI30GWU4g
         JqjwHgBivWnaa1uyreX+etFVlEzjH/1onRP3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dXkXwd4vEP4bwY9rQawnEqC6kwS+NIIDi4QUwZ6cGtQ=;
        b=UFJLhS3JLm/RgSMojFn6eBQywArVpfSBhUFyi76VktliAL7yAxBd/um1J4XiaC1GXs
         lBspFJ8Peync+9hHViTEef8yeeQl0uPFJT6Vxo+3Ow0QOCL/xEcU4CuOav+JVEZxe5Rg
         2GBgCaYwBbpPdTruq48lwcWDkDZ/w8eU4f5kfS2ILfXMZTK/yEjz4pP9+S0+WaXClnQk
         Bqxy2TDRd4CfA7TYf+gfWKWFAkXmeJHDHKPOKnovQi46zwIl6o9u5Q6BoG9w4uP5ms+2
         3ZnIDpqk7fKfOFGwNc1KkQ1Mmknoa5rXiMGkk9eLMsnBtZ/PgrHkWXXWZd2Zl6K4beUN
         SCkg==
X-Gm-Message-State: AOAM530X52ag34nXX9yHr2aS0slhTT05SsH4xUwNYMtOzP1b1qE2XQBG
        5G0yaFVSqrlvmSczK1TTCB3mJA==
X-Google-Smtp-Source: ABdhPJwL4AOuiR68h4fnDH1vn8eNeonNevqm7uEBhMAzmdJMIoUAPeb/6W9tokMMB5TvMjAgjvxvgQ==
X-Received: by 2002:a17:902:c406:b0:138:c28f:a779 with SMTP id k6-20020a170902c40600b00138c28fa779mr833921plk.1.1630527650785;
        Wed, 01 Sep 2021 13:20:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:958b:b561:a735:e774])
        by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 13:20:50 -0700 (PDT)
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
Subject: [PATCH v3 13/16] drm/panel-simple-edp: hpd_reliable shouldn't be subtraced from hpd_absent
Date:   Wed,  1 Sep 2021 13:19:31 -0700
Message-Id: <20210901131531.v3.13.I2522235fca3aa6790ede0bf22a93d79a1f694e6b@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the delays are named / described with eDP-centric names, it
becomes clear that we should really specify the "hpd_reliable" and
"hpd_absent" separately without taking the other into account. Let's
fix it.

This should be a no-op change and just adjust how we specify
things. The actual delays should be the same before and after for the
one panel that currently species both "hpd_reliable" and "hpd_absent".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple-edp.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple-edp.c b/drivers/gpu/drm/panel/panel-simple-edp.c
index ede5e3e4920b..762589ef66c3 100644
--- a/drivers/gpu/drm/panel/panel-simple-edp.c
+++ b/drivers/gpu/drm/panel/panel-simple-edp.c
@@ -423,7 +423,7 @@ static int panel_edp_prepare_once(struct panel_edp *p)
 
 	delay = p->desc->delay.hpd_reliable;
 	if (p->no_hpd)
-		delay += p->desc->delay.hpd_absent;
+		delay = max(delay, p->desc->delay.hpd_absent);
 	if (delay)
 		msleep(delay);
 
@@ -1039,15 +1039,13 @@ static const struct panel_desc boe_nv133fhm_n61 = {
 		 * spike on the HPD line.  It was explained that this spike
 		 * was until the TCON data download was complete.  On
 		 * one system this was measured at 8 ms.  We'll put 15 ms
-		 * in the prepare delay just to be safe and take it away
-		 * from the hpd_absent (which would otherwise be 200 ms)
-		 * to handle this.  That means:
+		 * in the prepare delay just to be safe.  That means:
 		 * - If HPD isn't hooked up you still have 200 ms delay.
 		 * - If HPD is hooked up we won't try to look at it for the
 		 *   first 15 ms.
 		 */
 		.hpd_reliable = 15,
-		.hpd_absent = 185,
+		.hpd_absent = 200,
 
 		.unprepare = 500,
 	},
-- 
2.33.0.259.gc128427fd7-goog

