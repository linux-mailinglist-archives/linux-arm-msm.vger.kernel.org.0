Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A053901DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 15:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbhEYNOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 09:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbhEYNOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 09:14:50 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91388C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:20 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w7so24689280lji.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j5KrzNiLkEZ7U9hbHrWEVr0lVINK2iN1124OgJJTqJA=;
        b=q9rxBoOKQtZeh7mPEbFoNf7mSDDUN77dp1k+9wiOKLfYn/mpwMtYrNRFMtbVUv0rxk
         O73NTGeM4qzA0qKeZGi++ZIrwWdOxqtsWT9FokqRqDFYyZG/bBnEBrgD6/Gw6MepZ+hz
         1NTd4jHlBsGaRydFIcvH7vV3M4zmKbrqs2OJl9kVBqS5YxlX/h3EuG49cvC3Sq/iPOOI
         tSWZuy0xRCPzpSghvM/TsDPLQyAoVUMjxMtVcAULEukAtsQhNYhYnLYQdum8umkeWDgL
         7A88iVaPBGwFiG0loCmxONvWt5A1rIlAz8sAS/85n8SVSxtJZFvChm5fpvaxFFs5FDg2
         gZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j5KrzNiLkEZ7U9hbHrWEVr0lVINK2iN1124OgJJTqJA=;
        b=uCb9NRNR5pa+JNXet36pxnHgN/9Po8HxOTb/w25Uhbmd0HxRuz+u2u1cnM96yxbIRf
         77DQhJBs6wQe5XyygUYQOmLvIZ8easIXk92/7cVjHi6qd+e7OcmL/ea/i1gCM0U9PGbs
         u+yerZFL5TQE1/EzxSq82sjtVeKfCLr1+P/0QH6D4vnrg6Ws8YUgO3ZF/V3YUec5vNbI
         LktH/fUGfBoqw+wZXWMWjYL4MBu6xWbH1+orOYN4t6TgbrztjjyEgf0V/UbIPOgsW/Gp
         fhF4MiJGfZb/dwG12GofJDEdZi7N+j/nlnbrMRX1bHUDO9Y0sAr66TLaSQss9fZPlfJy
         wMiA==
X-Gm-Message-State: AOAM5323Vb3ODGO1aUWTFiZ6r0QvHLZapVk2pwOwnzYA0VtN1RCyyD1e
        VbDkdEu8vgPhwJ02f3agtzV40w==
X-Google-Smtp-Source: ABdhPJzCiFO10NhUwXxzr+XwOQfj1bjdW6iWRs5pJDqSUZ5iAcpPEuflaOWSfphJJYfC8bkbZxE6ZA==
X-Received: by 2002:a05:651c:3cf:: with SMTP id f15mr19851585ljp.404.1621948398936;
        Tue, 25 May 2021 06:13:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:13:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/7] drm/msm/mdp5: use drm atomic helpers to handle base drm plane state
Date:   Tue, 25 May 2021 16:13:10 +0300
Message-Id: <20210525131316.3117809-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use generic helpers code to manage drm_plane_state part of mdp5_plane
state instead of manually coding all the details.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 8c9f2f492178..8c29026d770d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -176,8 +176,8 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 {
 	struct mdp5_plane_state *mdp5_state;
 
-	if (plane->state && plane->state->fb)
-		drm_framebuffer_put(plane->state->fb);
+	if (plane->state)
+		__drm_atomic_helper_plane_destroy_state(plane->state);
 
 	kfree(to_mdp5_plane_state(plane->state));
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
@@ -191,9 +191,7 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 	else
 		mdp5_state->zpos = STAGE0 + drm_plane_index(plane);
 
-	mdp5_state->base.plane = plane;
-
-	plane->state = &mdp5_state->base;
+	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
 }
 
 static struct drm_plane_state *
-- 
2.30.2

