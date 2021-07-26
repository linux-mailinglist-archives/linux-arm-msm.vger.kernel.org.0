Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7293C3D5C57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhGZOQT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 10:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234921AbhGZOQS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 10:16:18 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E45C061757;
        Mon, 26 Jul 2021 07:56:46 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mz5-20020a17090b3785b0290176ecf64922so4273887pjb.3;
        Mon, 26 Jul 2021 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
        b=U7csDx7myT7ZEpfOQWHAX021iKmpEkjKFYRgPfZgvKRBYy8LewJELViR3KSW8aeSq3
         S/5wnut7LOrYdI+sIC09WfQ/gPdSbi+7Xv2bziM63HyhVuv36dcqSmFEcng/xuGG8Scx
         6b/PBSEDgRON5lc+pMtOeGcRpamcn+uJ71pQYdZtyiB98EByuDMfnvr1RCfrQQBDe3yH
         pjtLbqQgjNDWgSgMMNUK+b2Px275M8XnQIZCHPcJXNK3akAhID3lg3R5N2O+GXozPD+P
         tpnuNpM6Cg5VdGPAadmE2wUEMHFv1wmJVuUXF1VdmUGpyEVeNxtGJkeWJxqB7Qly6RuS
         +4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
        b=r597tRCfRvQeB6U95RXeURwEFPkG0m05QsWuXMUuvkGVBgA7gAXzTBOAdSccNkMY+B
         VzNuu6lbORtNATuJXWsgPegEYltPzFz7L5Dc5GEwNpQ5mcdk8y2tAPDURbksUCGgVj4o
         fRpwtYooe0VLcvUuF8/lhmy40ExBnogjMBONCt7e+v3/U2baS4/a2xJWyWtHNo61z0dr
         wWaEPwYdsKpfI7jIw56EnEAUOD50Y+erjSBq7KaLzAbIBmUK26JkOgkv9qnI9VHo8rXo
         vVtq5yEtKpvOsNEh/SoHyFMScHrBM5D7k/KmoRFTS/NLWe7yYDyzibMYl180Nm/9ovVP
         n8Cw==
X-Gm-Message-State: AOAM532gyxB8CXfbLDHPmdcRggWG0f1wByUUlsOAWX59fdv6kE5/brYV
        VnibTYRRop/gmT5KUYPOmoI=
X-Google-Smtp-Source: ABdhPJwdeAVDE6ImTV58soarxRWvWOKUps/Kw+CEPEV7+viSnP4dluE7gXh3J6JGkb9liNBgRGiCog==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id mw11mr9162113pjb.122.1627311405833;
        Mon, 26 Jul 2021 07:56:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id w23sm9425588pjn.16.2021.07.26.07.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:56:44 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 05/12] drm/msm/submit: Simplify out-fence-fd handling
Date:   Mon, 26 Jul 2021 08:00:19 -0700
Message-Id: <20210726150038.2187631-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
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

