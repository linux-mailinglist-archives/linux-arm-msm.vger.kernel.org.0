Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923473F849B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 11:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240955AbhHZJe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 05:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbhHZJe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 05:34:28 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876B9C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 02:33:41 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso6395018wmc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JJwF0PYPmqolDQLzp/yyP0Yq0kNRDALRe2iRCTul0qQ=;
        b=SH0mRD4lFXjf5zfnArdRmdr/H92IkTiRG83+lu46nthRk6g7hsBLFtgm+PlV987nZb
         8qS0NSbfSQEVvJHrd9UuRQQZyRYMk9Om3DXftZgrjCWaMM58LLL7moZvaOPhHV2P6OQY
         zlQ0dHofnwILHwlhcoYEc4vFcvIjxdR6txsQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JJwF0PYPmqolDQLzp/yyP0Yq0kNRDALRe2iRCTul0qQ=;
        b=bymRQtbhvKdoyWMgBE/FIFdZ/pPQUnp44jwTUAFi9epp3t3jLlRkjQXV94GVFpR6Gg
         Huyiws0RQP8yrEfNyAc5zR+I2/JuGrfrKNBaLAD/cmI1rDqpG1HIzsdJgtLPWD+gst6O
         B2lDHBGLLp7U0NSLP/468asImvNS1As8raeKUHDY6/PdUr61dqwAjOdV/ly0mCXXIPvU
         mEVAGJd7pQuthLUpwsew5NdhMq/mGf546DJdmgzNcra/ig5CbxZaWWk70CVMGzm1QDAv
         +jIWq3jrcQK5WXg5lx/W65ipJndfY24NwzsLmb1oMv3kH1IiraxsBaDPbTLHbjZNrwQk
         hm6g==
X-Gm-Message-State: AOAM531aVmBtCvSfNpkBaamkbmtvlLRTD3uYzSlsBNB6NrZObq2E4NC0
        0V/0iPj5EmrYpw8Nw/rqROlA6g==
X-Google-Smtp-Source: ABdhPJzc23DuJoTC8nNJ25VQNbiKhhUYQ5XEsHa4ESe0XB/c1un0JqfR7O83A2HYXCq/etCBggdOqg==
X-Received: by 2002:a05:600c:1d27:: with SMTP id l39mr2677127wms.146.1629970420205;
        Thu, 26 Aug 2021 02:33:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z6sm2088220wmp.1.2021.08.26.02.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 02:33:39 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Improve drm/sched point of no return rules
Date:   Thu, 26 Aug 2021 11:33:34 +0200
Message-Id: <20210826093334.1117944-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817085308.3557257-1-daniel.vetter@ffwll.ch>
References: <20210817085308.3557257-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Originally drm_sched_job_init was the point of no return, after which
drivers really should submit a job. I've split that up, which allows
us to fix this issue pretty easily.

Only thing we have to take care of is to not skip to error paths after
that. Other drivers do this the same for out-fence and similar things.

v2: It's not really a bugfix, just an improvement, since all
drm_sched_job_arm does is reserve the fence number. And gaps should be
fine, as long as the drm_sched_job doesn't escape anywhere at all.

For robustness it's still better to align with other drivers here and
not bail out after job_arm().

v3: I misplaced drm_sched_job_arm by _one_ line! Thanks to Rob for
testing and debug help.

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
 drivers/gpu/drm/msm/msm_gem_submit.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 4d1c4d5f6a2a..71b8c8f752a3 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	drm_sched_job_arm(&job->base);
-
 	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
 
 	kref_init(&submit->ref);
@@ -880,6 +878,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->nr_cmds = i;
 
+	drm_sched_job_arm(&submit->base);
+
 	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
 
 	/*
@@ -891,17 +891,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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

