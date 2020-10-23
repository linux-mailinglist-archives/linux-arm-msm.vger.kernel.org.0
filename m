Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660FC29752B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752824AbgJWQvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752816AbgJWQvJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:51:09 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE04C0613D2;
        Fri, 23 Oct 2020 09:51:09 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id r3so1169212plo.1;
        Fri, 23 Oct 2020 09:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZButkyF/GaInfh9Hmb9ywY7tT0fYvah1q73Sv4+lT8=;
        b=sXtjrbzfkYQvrfjr3zL0uuJzC9ek8b3OGqkGU2HW1MwDpUR0gg8uMK9y5Lm+q9dOGE
         6o/bQ15eQR3VoOwnM+A01v7WAuxAi8l4FVoSFW/hZD2FonDlwEDPXR4btVVboQJSdcWn
         Y4oekw90qn7FGh+zbLuk6WAgP0cgOw7DGn3lw6cOg8qwYkpB7u2IykkHJ4zdWfBDeuEQ
         C+tXnng8tPUQMfUNHx/1ijmRc2WVx5tdK8MDRHUKEOiXQ7oNy9TNJ2uoGniIVTl3VJ66
         rRHagoab/ceV0VUBgEteX6PzcYosNyRx9tnaTrmogo8Ks9uMkCvJC/clViKNKmTB6NCD
         czvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZButkyF/GaInfh9Hmb9ywY7tT0fYvah1q73Sv4+lT8=;
        b=FaNDORYyZ3Tvz6GsyUOlFaRegwYe8lSxhjfUKpACSxf/8AGWNMKo91zsoXwKkn0ZZI
         8ejj+VHU2Mn8lLxxE7FiOP0dUQ+L9vaJbkWFfv02k+lSOF9kt31+6ggOHfRgIP4Onstk
         dkyhEWnWUBGsdSUIMJQhmtzN0LgV5wT0ZF2mc7VAL+XeMTQifZhbA2O3AHHyErlndUwu
         yqWp9vxrs/7GaTMrQrYk9VVv9uT2MPbz169MCJXiJr9/BFRcUsSKPXjw2f9kMndBWHEe
         BRNL/+1P0n+xX+bHAHxojwH0BPi6m+rV31H3xSFeD+bVHy+4hLjAQ7q0ZYyqMpU/fuvF
         u7Mw==
X-Gm-Message-State: AOAM531K2kX+bZAkqEHrowU7SMJGdl4u0m9lmlggYiSJVKxLMyGDAcrP
        Ktj0RYIvB+LW2LPWFjlX4no=
X-Google-Smtp-Source: ABdhPJz7W7twine0CZiWQPxl1uDo6NOAvvpvr9BrcmqP82wpMVrayYrN0o3GK0pR8TO+1aMw0Xjuow==
X-Received: by 2002:a17:902:ab92:b029:d5:d5f4:5118 with SMTP id f18-20020a170902ab92b02900d5d5f45118mr3297409plr.21.1603471868616;
        Fri, 23 Oct 2020 09:51:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j8sm2696025pfr.121.2020.10.23.09.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:51:07 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 23/23] drm/msm: Don't implicit-sync if only a single ring
Date:   Fri, 23 Oct 2020 09:51:24 -0700
Message-Id: <20201023165136.561680-24-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If there is only a single ring (no-preemption), everything is FIFO order
and there is no need to implicit-sync.

Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
is undefined when fences are not used to synchronize buffer usage across
contexts (which is the only case where multiple different priority rings
could come into play).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d04c349d8112..b6babc7f9bb8 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
+static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
 {
 	int i, ret = 0;
 
@@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		if (!implicit_sync)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
@@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
+	ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
+			!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
 	if (ret)
 		goto out;
 
-- 
2.26.2

