Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BA9297536
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752809AbgJWQvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752800AbgJWQu4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:56 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084CBC0613CE;
        Fri, 23 Oct 2020 09:50:56 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id r3so1168890plo.1;
        Fri, 23 Oct 2020 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Df41UALTBav1hw0+WsIt5rNabe6ifDpe4GxP6jKIpnQ=;
        b=DMTsSiYJK25SGd/0+1hIyuxSfglDtzT9Hkhj/i/mQWML3GxA41gGn7MWti3yhltgdp
         3WKCth+stns7x8gcM/2vkx5Ma8KYb69VIwWUJboD6znalztOJMBNstPI7VqO3t5/6ZSi
         lDZghHso4lJJS/fzeTuRGhK9zp8GUJ8hVa5vu1M+pYsZzP6SzKHUvcSh5uxNqwC86MhC
         uZDYTLbpMBNtcLaNYzVhUFrQg4udllwyN0Zg38GVe8mI5XcOSHoU9Z6aQASMsyoxCgFk
         O/UjpkAGM7goFs2v2VpxePXXGty3j2p5COhddrlA2sp2lsCFOsYXAgD45qeaM8wGTt//
         3qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Df41UALTBav1hw0+WsIt5rNabe6ifDpe4GxP6jKIpnQ=;
        b=k1qUjS9bUh693LJjllXaWrm6SfDQiOPDxN27QDgCa5jBVTZb+40Qn5ZU7ipbPANAHe
         QhAScrVJWuma2dZ5DtaHThlvA7y9+k+BkoHsK7gjkwxtHZRJeMrMM1W4Bgn16a9kMOAf
         CsKaMWyEc/9UJPQhlSM8zIJrog79Nd05B4Vv9u5Da4x26ipJfTNWS161eu+UvgUZTW+B
         Wxc7sE59L/yzTm268FIde0N6t1hb7njXduAKLfc7YvPr9SYL+2CADdKtakn3hPKkNpZo
         jNsUwFKlVaTvJpyuqtMeAr7ko8d0D42s3PkpeXMrmH9t5m6xcf7+VpeTM+H9l4jIqPfd
         /xvQ==
X-Gm-Message-State: AOAM530p5+nusjFBT7Nn4XIJxO7ukly82qzc6VPx/gxosAkgl57CWRxC
        2Smi7OMWg2H9yTIhb/UyQB4=
X-Google-Smtp-Source: ABdhPJwacuI4x3hfJSueVi7qQmkhVY3B1dqPHxRyOQifYIc3coSseB3KJNP3ta+ecucFUC9MjAfAFA==
X-Received: by 2002:a17:902:b945:b029:d5:f385:237e with SMTP id h5-20020a170902b945b02900d5f385237emr3183603pls.84.1603471855522;
        Fri, 23 Oct 2020 09:50:55 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id n12sm3100042pjt.16.2020.10.23.09.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:54 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 18/23] drm/msm: Drop struct_mutex from the retire path
Date:   Fri, 23 Oct 2020 09:51:19 -0700
Message-Id: <20201023165136.561680-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that we are not relying on dev->struct_mutex to protect the
ring->submits lists, drop the struct_mutex lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d0f625112a97..30ba3beaad0a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -717,7 +717,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 		msm_gem_active_put(&msm_obj->base);
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
-		drm_gem_object_put_locked(&msm_obj->base);
+		drm_gem_object_put(&msm_obj->base);
 	}
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
@@ -732,11 +732,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 static void retire_submits(struct msm_gpu *gpu)
 {
-	struct drm_device *dev = gpu->dev;
 	int i;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* Retire the commits starting with highest priority */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -766,15 +763,12 @@ static void retire_submits(struct msm_gpu *gpu)
 static void retire_worker(struct work_struct *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, retire_work);
-	struct drm_device *dev = gpu->dev;
 	int i;
 
 	for (i = 0; i < gpu->nr_rings; i++)
 		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
 
-	mutex_lock(&dev->struct_mutex);
 	retire_submits(gpu);
-	mutex_unlock(&dev->struct_mutex);
 }
 
 /* call from irq handler to schedule work to retire bo's */
-- 
2.26.2

