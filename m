Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1093D8506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 03:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234251AbhG1BCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 21:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234270AbhG1BCq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 21:02:46 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF867C061764;
        Tue, 27 Jul 2021 18:02:45 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n10so671993plf.4;
        Tue, 27 Jul 2021 18:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
        b=b9NxSnxk1VxZqiDCi1AAks8K5iBqV1c1t7XZVCJ9vakTpEjvZaK8BBRIcUg/BRnqJk
         aCT9lROfSKWsz7nPb/wSb64Q8AnsR0uxxILmf1mCsR4FcSBfPy+Pu+TlDTLGtgribXLc
         u7E8al/VyNXx5XPBjZh/EO852CfSDoxB6KxMVgFqdBL6u+hYOtVX6hPDYOOl3t8G8say
         9iEeywnaDwDPHaqpssKef1fYt9uDWBGU9jM6OJJawWCeBlNJRSGpUFEXxV9vTavGONrk
         FpmeT9bS2WPE0yBx6sEPD6fFPipfs8n+Pnk4fpRXZ2LBeXpU0rIOAH0Rqam3iCn1cok5
         f6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
        b=DHrYGKpkXs0BCdvmmweDS7FncmdunclshZVQZktWcUlOhOJF4BCFGisbG/bJa6gN8B
         yBKuSD3Cv61A49q3YLLqwM2cDxjr97ATILTqDMCIAHhOfsqEAkyLZBvu17FtxqPieSYs
         ZdA03fRkvtAy1g3IgLahsRprVq0UZ3n9Gkw8AB7GLXu6L7xjZgfFe9fAnN2Fv66fu83H
         Q+HqbrZrnt/S4BYVjuwzSnVj76VoAY9HK/RI5eOwehfdkhlBRDQJFVlHyDjx1s94B1Yh
         bh8GJE2iT9VcChHjUYxAherv9SQxl1EHMwFmPUHEW618p1Ag7tle2Jb3m+tMF7BYO7NA
         7bpg==
X-Gm-Message-State: AOAM531UFLwn5UWWJmythO8gXoMRlNj9WsjDydCqUYuo27jzJKgiC77c
        qErCKj+8wQBCpTaAMYwu9ec=
X-Google-Smtp-Source: ABdhPJxf4kY3lxTv4tUsiUdlIXHzAi46C6zsptRacAUprOM2gYJZ21r1BHXZK3QxacjqN/ze/FqE3g==
X-Received: by 2002:a62:4e0e:0:b029:39a:56d1:6d47 with SMTP id c14-20020a624e0e0000b029039a56d16d47mr11775335pfb.1.1627434165297;
        Tue, 27 Jul 2021 18:02:45 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b3sm5081459pfi.179.2021.07.27.18.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:02:44 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 05/13] drm/msm/submit: Simplify out-fence-fd handling
Date:   Tue, 27 Jul 2021 18:06:10 -0700
Message-Id: <20210728010632.2633470-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

No need for this to be split in two parts.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e789f68d5be1..8abd743adfb0 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -645,7 +645,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_file_private *ctx = file->driver_priv;
 	struct msm_gem_submit *submit;
 	struct msm_gpu *gpu = priv->gpu;
-	struct sync_file *sync_file = NULL;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
@@ -824,22 +823,19 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		sync_file = sync_file_create(submit->fence);
+		struct sync_file *sync_file = sync_file_create(submit->fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 			goto out;
 		}
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
 	}
 
 	msm_gpu_submit(gpu, submit);
 
 	args->fence = submit->fence->seqno;
 
-	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		fd_install(out_fence_fd, sync_file->file);
-		args->fence_fd = out_fence_fd;
-	}
-
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
 	                      submit->fence);
-- 
2.31.1

