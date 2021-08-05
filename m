Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2093E12F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 12:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240495AbhHEKr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 06:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240378AbhHEKr2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 06:47:28 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F325DC061798
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 03:47:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id go31so8813245ejc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 03:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fC/EAmoj6YexJw+zPVjashZb7GDaw/COXBU45GjF9Ac=;
        b=MN7pbspksKz10+81FOE3trN/U5sKbSIBPH7em0ZCBOj/Y1FzkXL1oYP/m8hSgC/132
         stq2YNlrRF41DaZysPl4dRPUjIH16W2Kl3Uyc6cwU3DrqbIjIVP7HlacdsCVVWN1XWLw
         YgbImO5uWh3ZFshuZvS6R/f3wVt87ST5bsQpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fC/EAmoj6YexJw+zPVjashZb7GDaw/COXBU45GjF9Ac=;
        b=iEKAbkggARfFjoHSjJlG+KnBS+JJC4gReQnKpbxECFso308Q14eIzgJ3P0ifYMK/23
         XmWNjhfAolq+L9XQ2rgXQFhon8zLzisf0NXkW0HSq6PVykmNSbyuxojGJgZxquYCSDqm
         gpRZVYyGkRHaLyy6sG3bwAPdI3eIhQa4L13rOUNWaF6jtAsk/Gz5WgasCSFvWQIvBemW
         VgrlWvKWID3mEaCL6Q/zbqdaZygSzdyDfuh4EzIzdBFGDwhG85vumicgnaUkJRQA6TcW
         jq2nFxpIzJJiXxDo3Y3LGNOP22LO+dkw0GM5U9K+gs28l9RMDPKv30Txc7ki8IaY41Fr
         GL7A==
X-Gm-Message-State: AOAM530zdCG1LKN3Iei4C9hEqjH7zrLZ53z2Ky2KJyDU+eL71P0Oz2Co
        E5kI7i7SrYBAh0KjgbDgdAabwQ==
X-Google-Smtp-Source: ABdhPJz9+W0Fd6alFYJWyAtXBHgsmGsOmeCTZqJWknvhpiCuNjZkNlKXpji5qpwaK4jjI6WcoH07RA==
X-Received: by 2002:a17:906:e24d:: with SMTP id gq13mr4168565ejb.466.1628160432643;
        Thu, 05 Aug 2021 03:47:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 03:47:12 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH v5 02/20] drm/msm: Fix drm/sched point of no return rules
Date:   Thu,  5 Aug 2021 12:46:47 +0200
Message-Id: <20210805104705.862416-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Originally drm_sched_job_init was the point of no return, after which
drivers must submit a job. I've split that up, which allows us to fix
this issue pretty easily.

Only thing we have to take care of is to not skip to error paths after
that. Other drivers do this the same for out-fence and similar things.

Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
Cc: Rob Clark <robdclark@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6d6c44f0e1f3..d0ed4ddc509e 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	/* FIXME: this is way too early */
-	drm_sched_job_arm(&job->base);
-
 	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
 
 	kref_init(&submit->ref);
@@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
 
+	/* point of no return, we _have_ to submit no matter what */
+	drm_sched_job_arm(&submit->base);
+
 	/*
 	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
 	 * to the underlying fence.
@@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
-		goto out;
 	}
 
-	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
+	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		struct sync_file *sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
-			goto out;
+		} else {
+			fd_install(out_fence_fd, sync_file->file);
+			args->fence_fd = out_fence_fd;
 		}
-		fd_install(out_fence_fd, sync_file->file);
-		args->fence_fd = out_fence_fd;
 	}
 
 	submit_attach_object_fences(submit);
-- 
2.32.0

