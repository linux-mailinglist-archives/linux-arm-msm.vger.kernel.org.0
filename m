Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A7A40CE40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 22:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhIOUkz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 16:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhIOUkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 16:40:55 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0147C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 13:39:35 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id p4so5010976qki.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Sep 2021 13:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AsRbP5dRnDOL8jtDrD7xM4MsIESBG338M4ja0G3IYsM=;
        b=BI8eXII0oxt1Xos6KWyJ/4oNvSGLpwTttog3N8S0omjbe3IHD5twyGVXNe7kb3/guI
         PTuyHrXdIZwqWOydF+BDqpvv1wxQaUQ2ybJO4nctrmrnD+4ydTZZYKAZdzbhO7taVe5i
         VZ2ZdsKuoecX1ypc/Z1PVLzqB2cQZl7RqsQa51Ug8D0N2W+qqVye9NdvSokQUt6ohgcl
         iD+kTl/kaa0bq2k9EJ8XkBILOPt39EzK6+58ch6heKsR5Vj6Ox+HBrt9w/UQOIy7vACR
         gBFy/yUrdwoecUkNjDHESzlt+08wSbukaCDwqybAjVIq4rS/PMz8Sd6JqFKAdE2u5NO/
         /ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AsRbP5dRnDOL8jtDrD7xM4MsIESBG338M4ja0G3IYsM=;
        b=7A9sGaaXe8Lf7c+25L3wotvSna3ayHHcVYsfa6qiUJ8G8XoJ/IUlBlz6Xwq9kn4Dlr
         c+St7fybZ9l7F8yr7vRxkfnF46f2uqrQ7ym2SiBHkJ9/NyARUgCdWnOynAc+E7LcDwNS
         lm8TYfOBLfU84k4WBdySTp2wGQ2UHRMz6J0jOLwMyKzy20k1FaJ/e1Sn6CfScVfInUzX
         Dw9QpXw1phlD0GjO4ImGcR/KC41eREx2HJu8Lu0sg93RdWcImdtzonYMFQDS+sEkL9PT
         yrkSUwLZZfk2VHWiNUYlf2S++gDxSPGAlzXjt6t7kd3yRKPchxYYNVYHbJXc04I3GFak
         l3Bg==
X-Gm-Message-State: AOAM533+GCRgTqERFIo0EsCAYI6Rfzpej9L3a7huEotVRRlTPpQLDTkS
        hXwDUYEv3zreujfRvaFulZs2Fw==
X-Google-Smtp-Source: ABdhPJwJTXgEXlT6pejzdXpiSt12aEvNmX8i6tGDb12BIX0/S0yUXdney4DYAFdCzgvDZGRYi7pjJQ==
X-Received: by 2002:a37:6317:: with SMTP id x23mr1900658qkb.432.1631738374963;
        Wed, 15 Sep 2021 13:39:34 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id j2sm765678qtr.4.2021.09.15.13.39.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 13:39:34 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 11/13] drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
Date:   Wed, 15 Sep 2021 16:38:30 -0400
Message-Id: <20210915203834.1439-12-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Audio is initialized last, it should be de-initialized first to match
the order in dp_init_sub_modules().

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1

Changes in v2:
-None
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

