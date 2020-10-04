Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54799282D2D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgJDTVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgJDTVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6139C0613CF;
        Sun,  4 Oct 2020 12:21:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id u3so3954473pjr.3;
        Sun, 04 Oct 2020 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jz4QzEAhEdO6lBCU1QoQ4yhqxZSfud3TeRKgBoZBDXA=;
        b=h0DfyK2y1SjSYpaHFHMtPvB92RnRZePuaoTdB5xxz0thjvfqQP7Siztchi+qNfr4kh
         XMePXwcGcvYZ+5xcurEpjvcLycdlS3PkbdwN3GgdoTeg5o2zHEqBoKFBjwaam79OQGXg
         3YoqTN7w5QcQlTdvJyKGPEx2vewYpRKJpHdYKgYk5qXv2dLNGdQN5Ug8dVe1Vf09jaWa
         NctNaw/rVfTU56JuSIPI8q6JSzSqM17jP4t3Fpdxje/RKaFKiBrXrXzEuykq0DVxP2l3
         GMla73CBHlbIm/VNXUwZuVh1Zx19xRbr6TLqFSD9lxsm9VBldSRUEQJziY11Qj8hC0OK
         /iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jz4QzEAhEdO6lBCU1QoQ4yhqxZSfud3TeRKgBoZBDXA=;
        b=bHKldv1UBs3kSEqQ8LPCOxUjNmBCnnHNqZ13zA94EqfM42Ny+6xKDYgXfLd+PT7Wx+
         Tp10A9RGxtRWyFARuYnJr5ZpGIY2HDOkuURbG7rjgU830xTOTIH6KLQRMb6l9XUcQ9bl
         xP3sgsuSmVuBYYKD4t6trwo2asiKX0urW5olUlB6ZDU29PDJ5+uNLvrFCXU4NltBD2ht
         +PjbedtMR502K+YYfOY54pBhwZncIFMskg64Nkc/2Fc3tGFKdXGCeqnMiGO/JhcOPuVh
         Oj+hnj/zaLhUdWXIiXYucgFlOPBRYaTEYbPZV56DL9tFc3p9Ocr6qdqMPN2M0lkm5VdT
         evmg==
X-Gm-Message-State: AOAM5303vjyy4xT1n8w/BdGqQYB2fasoI5GR9redeLiRl+9TRy+hfMF4
        QAYXj9jJo2niPmFN3jKGGjE=
X-Google-Smtp-Source: ABdhPJzwbgfNqafM3y1Sgaak5gfe9bX33DwTRFupIpYNwim2i/Q2fWIh4YBVZQi0LAKdXb4VGj5dHw==
X-Received: by 2002:a17:90a:c501:: with SMTP id k1mr13719865pjt.170.1601839299184;
        Sun, 04 Oct 2020 12:21:39 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z28sm9952148pfq.81.2020.10.04.12.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:38 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 14/14] drm/msm: Don't implicit-sync if only a single ring
Date:   Sun,  4 Oct 2020 12:21:46 -0700
Message-Id: <20201004192152.3298573-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Any cross-device sync use-cases *must* use explicit sync.  And if there
is only a single ring (no-preemption), everything is FIFO order and
there is no need to implicit-sync.

Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
is undefined when fences are not used to synchronize buffer usage across
contexts (which is the only case where multiple different priority rings
could come into play).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 7d653bdc92dc..b9b68153b7b2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -219,7 +219,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
+static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
 {
 	int i, ret = 0;
 
@@ -239,7 +239,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		if (!implicit_sync)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
@@ -704,7 +704,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
+	ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
+			!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
 	if (ret)
 		goto out;
 
-- 
2.26.2

