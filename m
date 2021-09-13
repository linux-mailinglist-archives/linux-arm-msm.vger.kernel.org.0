Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4D8409B7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 19:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344584AbhIMSAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 14:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344413AbhIMR77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 13:59:59 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146FEC061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:43 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id a10so11497445qka.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5lJyWPQ/3+Xa5evtg9nYe6ccWuKsIvtWNw1YcJwpQdU=;
        b=Xr1Q5VlWqMOrRJGpm88EVkf81ekfN0id2HBb+gbilUvJ/UzjqmrcXin/oSnRTQhSFx
         89xx306m11zx5BW8YhhuFIU30ek7MZQkW5Ks2FrR4IcHkqtiCMjEMeHe4KadCKBXPx0L
         IhV0u7evV9Tvlzsx74UiU7dTDPJMRs5GUf8dC2P79Scrur9oB/GC/cFfqjcC+ajqK8cm
         tX5l4cqZUkkv5nY6ZC4nKlgTj2fOL95uezodFGSvILTLcHIJvwFgOf+3giB0jk54qRZw
         zEjGmWFVbVeg9ypwmqbagenhuXo+WOQKuhRfnY+ynvEyfbK6WrUCt0JpgNVoSbAQ5bCR
         QqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5lJyWPQ/3+Xa5evtg9nYe6ccWuKsIvtWNw1YcJwpQdU=;
        b=LDercAGcMYGg1WY9/7jQJWMtiyuMx2whr5UIVUdAhu3WkgYJcSeZRNVTDbKkHFW+9K
         CQn9rd8DdTZX3mz2FPNp0om3BE/RcPv7o/nEluBUz3KmKVFuAqmVurvvWkqjcin/fk/Z
         u0eXthsZXZg4Rj3UkXkJIXEcvKxW22HU6kod6b+WVhvsAqxwTS2R8NMXNPyLs2Of4O3P
         EyMzTc+J2mDnZ8/OOe6JzMs+JqZ3MtrqABjIZYSTNZO5YZLOJl04YiAYZgCKnYjL0ebu
         Jk+ZEUDFp8XnKS5NF8Cpf3mE6Kh4XxPKS6cuGxcGZL+RHXfyUk5lKNTS6Ll4GKFeiiGP
         ptwg==
X-Gm-Message-State: AOAM5307/mgtCtVW4JJAoJ0vKwTK0SOPKNCTmOm+TFxUUWsOlhqFn9Og
        5D/PSF6R8u9EonhW+Ea5iihOSw==
X-Google-Smtp-Source: ABdhPJyj9+8POv3KXdcDALh9BjOuMmM6UpBZnrQNonh08bvRuIHEBH3SBlVEgxBetgmq4r9y2Knvkg==
X-Received: by 2002:a37:e301:: with SMTP id y1mr795704qki.475.1631555922254;
        Mon, 13 Sep 2021 10:58:42 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id j3sm5739505qki.104.2021.09.13.10.58.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 10:58:42 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 11/14] drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
Date:   Mon, 13 Sep 2021 13:57:42 -0400
Message-Id: <20210913175747.47456-12-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Audio is initialized last, it should be de-initialized first to match
the order in dp_init_sub_modules().

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fbe4c2cd52a3..19946024e235 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -714,9 +714,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
 	dp_debug_put(dp->debug);
+	dp_audio_put(dp->audio);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
-	dp_audio_put(dp->audio);
 }
 
 static int dp_init_sub_modules(struct dp_display_private *dp)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

