Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8015B3CC626
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 22:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235678AbhGQU2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 16:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235649AbhGQU2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 16:28:35 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44E1C061767;
        Sat, 17 Jul 2021 13:25:36 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id a127so12402415pfa.10;
        Sat, 17 Jul 2021 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9gmuykjEPKDqTuNvlNMK4nEJJv2DOZACTKUl13m6imU=;
        b=vgGelrggP7hv02LjbY6rkPLS7Zy/Vh80xhC2sLr/AAFsiC+5BC4CE6X7n/dcfGlAxq
         nN/nCVRthT0BX2R19SA7Gj6DJFPqoKz6XiiAxlsh7gkN7Fw1Mar7gDf9gaLdiys5JDzz
         yw71SFb3exs4b8p0/SP/Fe5OjiZAyp1KPiWWxJrR86eSRLiVA4wfdkUqKS604NK5du83
         gPl4aVi360zvPFDPh8bXayTAt9owPb3iQdjGvPi8lJLkXxhFsAoylASSAePCmRRY7LrM
         x5/ikKJuLcew6JG5Tf+Fa+mi5nRIuR0WAJvGQLU2J+XDC74vQZL/c9auNjIsnmfDdxaU
         usQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9gmuykjEPKDqTuNvlNMK4nEJJv2DOZACTKUl13m6imU=;
        b=HUJL++12d05GpucqoAeaY0KZRUsXHPgJ6WL3VfUareuBEqBL8AWGhhneaThPznzctW
         cTRNrfxAAMXGmtUQsFif0i1iXETIFdkC1DDL7/wq2SbKtdKXSTzp8It24QZeuC5nEZlN
         crEYF5ZkrNmCKFqmGziIqGzw+kjM4GhV0U0xnM31XJxqT0whanU2Z/LLu9Eyeu8TTKS3
         Km2q9o2wVSEvYNBWHxvwBV4X49+KAd3XzGxnqRfVtHAt/yOpDkBOEaH1C4heQL2gIPiV
         nwqQQ8bqTmukJrm7gtBs8FjLTU1dMRkSOayXKe3NaPEKWiFNFgyePxRuaPf879vWmAno
         uDoA==
X-Gm-Message-State: AOAM533WmLURtIY1JBnKLL/sdvNDFZNygZEZ67D4xcaBeYhdnrvIe9Mf
        oFrSVRxe6kwLmPjmg5emOkFXTpr+Xiv+BQ==
X-Google-Smtp-Source: ABdhPJw6oESDC4zy/M+5LFccYFBswnhh9eNEod8Gejd/Q9XDyWIz30frNTaMSPj+BylQYcUMtmdasA==
X-Received: by 2002:a63:cf02:: with SMTP id j2mr16508180pgg.411.1626553536314;
        Sat, 17 Jul 2021 13:25:36 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b19sm11760137pjh.29.2021.07.17.13.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 13:25:34 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/11] drm/msm/submit: Simplify out-fence-fd handling
Date:   Sat, 17 Jul 2021 13:29:07 -0700
Message-Id: <20210717202924.987514-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

No need for this to be split in two parts.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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

