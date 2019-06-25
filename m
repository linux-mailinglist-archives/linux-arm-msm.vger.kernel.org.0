Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0690E55933
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 22:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfFYUmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 16:42:17 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44988 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfFYUmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 16:42:17 -0400
Received: by mail-ed1-f67.google.com with SMTP id k8so29050177edr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 13:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dTa7pMjmG8OazW16jHzeTKzzSmzFeuNnJmiuYsQc45s=;
        b=KNgeM6/NzCoejkijml2vqQBkXIiW87xIA+QMyI6j3rN6pajeCjOHMvYaa1Oqwp9y60
         3YFyyU7v7gLr4tWZ1N40CCqpJ6+dfK2cKoUBqiR35iXn7opLIHsu/xHwkfvXwqLjE7w7
         Q5MBNvRCijY/n0RIK0bfjOqJqd3YgrV2TZbd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dTa7pMjmG8OazW16jHzeTKzzSmzFeuNnJmiuYsQc45s=;
        b=c1g2y7M75SY6CUzu6VgNL2nh+yBveDuhIFDJUKFv+2r9pPja2zhP/WgxcsLK7p7I/7
         twot/l1kSfZoNUM2Mq7EW3Zt/P4Odw1R3UHWSEaICUJWHi9+FQNBLgMgzaf6MpdNkPqP
         x8vijtxqstI8VaOe+Ai+17TPI0ZJl4K5okGsCsNz+eVW2HWr0txkyqOJo2rjSH1gXYjw
         3aO1YvNDoZEFivXg2BJ6BZlZsVrT4xrksZ6XWSD0qz8V1rEXh9dDncPNil/I2tjfoFcK
         OQvFXx12e34s0ftYirO8yWJMETEJ2QR8j0fp7sJ3aHyFqz5j0f/ws0V3qr5fnm/yTEjv
         nNMA==
X-Gm-Message-State: APjAAAVDKof5WRgWWxEyoy3BUEZrutoUjinU3q2MrlfDGn9DWC3MdUfi
        xkG+ZUAQYiCQUrfuLXCyjNfagA==
X-Google-Smtp-Source: APXvYqxqgAFX7h/8CFlC51HYmuHaJTKWDbvFFvJaZcVNio3W/AxPjv66qVseaEMNWlAm0fJAVy+EBg==
X-Received: by 2002:a50:b343:: with SMTP id r3mr562199edd.16.1561495335832;
        Tue, 25 Jun 2019 13:42:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id u9sm5187262edm.71.2019.06.25.13.42.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 13:42:15 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Eric Anholt <eric@anholt.net>,
        Emil Velikov <emil.velikov@collabora.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Fritz Koenig <frkoenig@google.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/7] drm/msm: Use drm_gem_fb_prepare_fb
Date:   Tue, 25 Jun 2019 22:42:03 +0200
Message-Id: <20190625204208.5614-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm has switched over to drm_fb->obj[] a while ago already, so we can
just use the helper.

v2: Make it compile ... oops.

Cc: Eric Anholt <eric@anholt.net>
Cc: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Bruce Wang <bzwang@chromium.org>
Cc: Fritz Koenig <frkoenig@google.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 ++------
 drivers/gpu/drm/msm/msm_atomic.c          | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 44a72da71482..cc08f4366bdd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -11,6 +11,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include "msm_drv.h"
 #include "dpu_kms.h"
@@ -763,8 +764,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
 	struct dpu_hw_fmt_layout layout;
-	struct drm_gem_object *obj;
-	struct dma_fence *fence;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -781,10 +780,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	 *       we can use msm_atomic_prepare_fb() instead of doing the
 	 *       implicit fence and fb prepare by hand here.
 	 */
-	obj = msm_framebuffer_bo(new_state->fb, 0);
-	fence = reservation_object_get_excl_rcu(obj->resv);
-	if (fence)
-		drm_atomic_set_fence_for_plane(new_state, fence);
+	drm_gem_fb_prepare_fb(plane, new_state);
 
 	if (pstate->aspace) {
 		ret = msm_framebuffer_prepare(new_state->fb,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index dd16babdd8c0..169d5f915e68 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include "msm_drv.h"
 #include "msm_gem.h"
@@ -37,16 +38,11 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
 {
 	struct msm_drm_private *priv = plane->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	struct drm_gem_object *obj;
-	struct dma_fence *fence;
 
 	if (!new_state->fb)
 		return 0;
 
-	obj = msm_framebuffer_bo(new_state->fb, 0);
-	fence = reservation_object_get_excl_rcu(obj->resv);
-
-	drm_atomic_set_fence_for_plane(new_state, fence);
+	drm_gem_fb_prepare_fb(plane, new_state);
 
 	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
 }
-- 
2.20.1

