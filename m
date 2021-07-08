Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50EE3C1853
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 19:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbhGHRlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 13:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhGHRlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 13:41:07 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740BAC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 10:38:25 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso4575266wmj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
        b=OXWAMqyAm3FBqCmhazvtViPAczIYbDg3o3MhmkkOYXWZo3KasFE7n0nAJn3tBoiheQ
         Uz11jDhuINyDdsI4jhUSXimf8CsgIs+yJX8P1fVDe1tZR1ck2fHGWEufuZbQ6Hyvcg3Y
         SBMM8LmNDEAE4LoiP5rbz1j7aL4QlTe7Ad8Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
        b=ZJGkQgxEXAyhie2DCUfh7S7UkjwJjtJgaxceSLVAmWNJKgCVRCLflWYNBV6RjynxOn
         5b8YByxVUyKGGjBlh1plLXgWpSDg3Ici/HleXfs9MVlqhh+zYPrEpqGX2EiXDqbhspR+
         oyGZ3l66jtIwJGUCQQwJvBHRzHA4k4XLx4m6cLPjewSXeOm+u0Y4zX+Zy7+d4jbdKQRd
         FhxUOP/ldlSAV/SlnaoGG0RYyM75do2MMWhHmFEkIm2Qs7/YyuBTogfEtwEoi85U7V1g
         mC1Of1GAOlhRojR7N2impkVn0v1F5sapfBoYE5f/y+Iy4exFC/ppVQgpJXQ0b/mhlUGB
         APlQ==
X-Gm-Message-State: AOAM5334fsU3+O9bLz9oV7BSOCnj5xCjtRc6Id544Zfsz+ZKe6W5zNgA
        y+hsd4ELLaLw7RQQBfrDg149Uw==
X-Google-Smtp-Source: ABdhPJw1jshJuGMwGuQ/le1CCh7zRdTpRm7R19534t5pFRk1PSYScUvtSH1ZQ65X5JqJpvpszXLP4A==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr6565057wma.37.1625765904147;
        Thu, 08 Jul 2021 10:38:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 10:38:23 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 16/20] drm/msm: always wait for the exclusive fence
Date:   Thu,  8 Jul 2021 19:37:50 +0200
Message-Id: <20210708173754.3877540-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Drivers also need to to sync to the exclusive fence when
a shared one is present.

Signed-off-by: Christian König <christian.koenig@amd.com>
[danvet: Not that hard to compile-test on arm ...]
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 141178754231..d9c4f1deeafb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -812,17 +812,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	struct dma_fence *fence;
 	int i, ret;
 
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_excl_fence(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
+	fence = dma_resv_excl_fence(obj->resv);
+	/* don't need to wait on our own fences, since ring is fifo */
+	if (fence && (fence->context != fctx->context)) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
 	}
 
+	fobj = dma_resv_shared_list(obj->resv);
 	if (!exclusive || !fobj)
 		return 0;
 
-- 
2.32.0

