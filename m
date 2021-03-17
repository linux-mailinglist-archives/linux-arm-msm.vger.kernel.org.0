Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE21A33F5BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 17:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhCQQj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 12:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbhCQQjY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 12:39:24 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D357C06174A;
        Wed, 17 Mar 2021 09:39:24 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 205so8120546pgh.9;
        Wed, 17 Mar 2021 09:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJKz2h+X44Nyjc70D1nl6aYjywkrSYx9D4C8krqE5s4=;
        b=gd+e3pDXZbLRr7OHs+dQNTQNYZjTE9SpwbtkhLTG6XdDc7DyYOSisEkNNqZU6WqmDr
         SCANy+scFCynXXAgg5ILVsnWZCFS+TzUGbVrzDFuocEIGPojXLI/+AJbZDfbA/es7RnX
         MT4ina1sLUOIX5Dr+/TS0OgO/vG5131jIPjclMFjTkeuVNcOaRKJ0TUsGWow47WLAkP6
         Nh42/l2OIO0xjCZfZA40hUJ8uit9u+Kw39vxa1av8U4PvgmUULXF/p8CJEie9aPujZPD
         5pK+P2kIymqyVSOnP+Qk1Xd+TMP2aDoFPFIUpztfiSbBHevuxPHZGKNLhbYehyF+cU83
         6mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJKz2h+X44Nyjc70D1nl6aYjywkrSYx9D4C8krqE5s4=;
        b=Eo8OGfdMNejThjDOgj6NqPQcTqFU/QQhFaDF741DZS5ASJnm5vbXgamPKguSnHZrSG
         jijysnDexyDLARKcGTE4JpMDqnLRcI6CIb3cRjMAxY2K3+G4poLnoBjcBbh7KSyRTGbE
         F9RKSjLYZqM64cnXMqavUuQ8slRErUA38jHmvvD3sE6O/6nAGiSCnvQpNkvgL5VtRoI5
         6reDtAvwiGF2Rrttv8zTxUc530aiK7Wz8+XOPMQae1MoOMFWFf+uQPcmi4ki2OEDg7MF
         ZZ+fJM5Cv+pN8cH7bQCAyvsQilWzVLuCne7U4zJkdXlGNayZCVLRi6vZ8OL2Aer73qoD
         g/6A==
X-Gm-Message-State: AOAM533hJwElqbzRytXXkVDyJ+iWxG0z+pX9UI3vQmieMc0LE8YSD0vs
        vegSJ7BMXQ3/kOX537eKQMiiszmqhrc=
X-Google-Smtp-Source: ABdhPJwwOq0vwgcZGgWOETf0gCZOIdapKzgtw7LIGnEIxTYxUm7egBbqaGJZOUQ1e4gvOxBkLPpErw==
X-Received: by 2002:a63:2345:: with SMTP id u5mr3462213pgm.326.1615999163670;
        Wed, 17 Mar 2021 09:39:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id i17sm22008783pfq.135.2021.03.17.09.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:39:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Ratelimit invalid-fence message
Date:   Wed, 17 Mar 2021 09:42:39 -0700
Message-Id: <20210317164239.1007776-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We have seen a couple cases where low memory situations cause something
bad to happen, followed by a flood of these messages obscuring the root
cause.  Lets ratelimit the dmesg spam so that next time it happens we
don't loose the kernel traces leading up to this.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index ad2703698b05..cd59a5918038 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -45,7 +45,7 @@ int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
 	int ret;
 
 	if (fence > fctx->last_fence) {
-		DRM_ERROR("%s: waiting on invalid fence: %u (of %u)\n",
+		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
 				fctx->name, fence, fctx->last_fence);
 		return -EINVAL;
 	}
-- 
2.29.2

