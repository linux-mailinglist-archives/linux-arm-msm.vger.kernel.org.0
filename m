Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BB83C1852
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 19:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhGHRlG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 13:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhGHRlG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 13:41:06 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76371C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 10:38:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id a13so8505354wrf.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 10:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=InVnPLy1h+Gn4xVBn/fC7AZt6grH88jqC7oOozTIXb8=;
        b=b9NfiRDV4PWMagsuaIW/0pNvT/uy7ZDQf5JndjvR8JML4iEvYQWZQL7cwk7QnkWdah
         oBfpqwwuzxFNgBz0aEff+3SB9zAzKpnDR1DMFi43W07iORhzR0ARnRNGrCQ3kjPtlJLd
         IJh73WUh20UIq5aO+hBu1ga1TfA/5tOncbrXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=InVnPLy1h+Gn4xVBn/fC7AZt6grH88jqC7oOozTIXb8=;
        b=AD/QldTQJ/l4n8pmkj5bKVblFWxhx7DePCnyCDlsC88YfnoG1M05hYZdCfh53UrdX+
         H0JWGYHSGP+CW9gZMrmPR0kyOQvtETe3y0+KgSwLQcy9DlI/ZHsJFpFJWfhrlRzUVRoe
         w9aJjRPu6Ml4rSy3+ctK5jV8kqMVJO21Dvu98r2omH0/uI8vmoMReQdOUWhXFpIG6Yez
         1jh/q5I5iNKFhPDYyfVcDW3KUWpB+xk6Es22Rq3+xnUvkSWZl0fkualbEc7k6l1IzxVh
         qpiVrY7uJmB0m8bRi1BTHqYWbNchil1DMC4osrfZeXXBL5Xb/rF5+c2mCef9D+t6KgAh
         0oDg==
X-Gm-Message-State: AOAM5302Ex5aYtAHcedRfblArddGzikLoiVZLANj7ectb7vVQH9giFwH
        sFlihM9zA2Wpm4DWmo1KMJcVQw==
X-Google-Smtp-Source: ABdhPJxD6PJ66owVmAWX8E6gbp7rigz0P4Z2yONzVbgd61fH6Zjzia6NQcSAsJ1vQHjng6a+fpD+Dw==
X-Received: by 2002:a5d:4912:: with SMTP id x18mr4269311wrq.310.1625765903128;
        Thu, 08 Jul 2021 10:38:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 10:38:22 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 15/20] drm/msm: Don't break exclusive fence ordering
Date:   Thu,  8 Jul 2021 19:37:49 +0200
Message-Id: <20210708173754.3877540-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's only one exclusive slot, and we must not break the ordering.

Adding a new exclusive fence drops all previous fences from the
dma_resv. To avoid violating the signalling order we err on the side of
over-synchronizing by waiting for the existing fences, even if
userspace asked us to ignore them.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but
- msm has a synchronous dma_fence_wait for anything from another
  context, so doesn't seem to care much,
- and it probably makes sense to lift this into dma-resv.c code as a
  proper concept, so that drivers don't have to hack up their own
  solution each on their own.

v2: Improve commit message per Lucas' suggestion.

Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b71da71a3dd8..edd0051d849f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		/* exclusive fences must be ordered */
+		if (no_implicit && !write)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
-- 
2.32.0

