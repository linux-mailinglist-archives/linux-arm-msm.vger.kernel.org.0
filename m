Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78103D7BA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 19:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhG0RHf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 13:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhG0RHf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 13:07:35 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0223DC061757;
        Tue, 27 Jul 2021 10:07:35 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so5740916pji.5;
        Tue, 27 Jul 2021 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
        b=Y26suS2zv/ne/rmL5xGeK7mrZrZekL/BY237YS4TKXBIWvMYtXlM6hv4YcSIfH3JE7
         oKHVEtcK9zuQ3gaRCuTNwGXkowGwD9mTKdZsMZTKy1HJnv3JK6boDHpU17na6ISt69/h
         0Ay0fy1MDrD2ZPV1fDfPrUsYOR5kTQ6sRPsrY2pQ0qBBGRQU/msLnXPKh/4Nxi5kqDvq
         A02h+J8GOh/BKmExs7s4LpXf/mVPKdj2/XL7SGtwhL8JCAOvjiAOW3vXHZ6bGE9hpKEN
         5FoyrXzXAam5Qa4CgVK/5xzcL/xBil5pnhFoKZnsmAD9m2zCnMk/qKtEewop2A+Z6dcJ
         8BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
        b=I43J2jL+ec4DqKL+M66RuB8BsMbeKoKvyCvJ4OGhHcWlxdKm6BVjLWtZgUz0iS2oGm
         swH43hrq8WQKG6j36jLi6vrHOVQKEfHd+ufBbmhdwSfzL6sdnT/lfPpuAB1rBRznIb5O
         KORjEI6JlBOXDPs9F682PDrxOxTODnjYo1nJKuwMTU9UTKpzXPnNYrJM/HMmQZ0wMoFr
         MKMKzaD20Tjfquku4FpDSjoYQvsOkWfL3q+d4pLnQwGrcWn6pf1Yv2/umexkoiSniizT
         OxgayLHFFRKVcErrWmBRidzvRAahLLaiR0ktbV1+58tMdW/qyYHZvQbPfSbo0fZYMRSb
         xZRQ==
X-Gm-Message-State: AOAM532cc6o/OQNrixj9cGcqBEqQpb6Mdqyj09kcCb6OUVaH/KWjPJTK
        dMPLUqll/31Yb1PWLPYx2mg=
X-Google-Smtp-Source: ABdhPJzzUAGDhGif/HDsMRU/cfM3CYj8pqTG9EUxuBzeUsh0jVyUcDWZ27u+jQDf/4zEVRvRe6Is3w==
X-Received: by 2002:a17:902:e8d8:b029:117:8e2c:1ed5 with SMTP id v24-20020a170902e8d8b02901178e2c1ed5mr19663772plg.39.1627405654576;
        Tue, 27 Jul 2021 10:07:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id k5sm4445325pfu.142.2021.07.27.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 10:07:33 -0700 (PDT)
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
Subject: [PATCH v3 02/13] drm/msm: Small submitqueue creation cleanup
Date:   Tue, 27 Jul 2021 10:11:18 -0700
Message-Id: <20210727171143.2549475-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If we don't have a gpu, there is no need to create a submitqueue, which
lets us simplify the error handling and submitqueue creation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index e5eef11ed014..9e9fec61d629 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -66,6 +66,12 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!ctx)
 		return -ENODEV;
 
+	if (!priv->gpu)
+		return -ENODEV;
+
+	if (prio >= priv->gpu->nr_rings)
+		return -EINVAL;
+
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
 
 	if (!queue)
@@ -73,15 +79,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-
-	if (priv->gpu) {
-		if (prio >= priv->gpu->nr_rings) {
-			kfree(queue);
-			return -EINVAL;
-		}
-
-		queue->prio = prio;
-	}
+	queue->prio = prio;
 
 	write_lock(&ctx->queuelock);
 
@@ -107,12 +105,14 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio;
 
+	if (!priv->gpu)
+		return -ENODEV;
+
 	/*
 	 * Select priority 2 as the "default priority" unless nr_rings is less
 	 * than 2 and then pick the lowest priority
 	 */
-	default_prio = priv->gpu ?
-		clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1) : 0;
+	default_prio = clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1);
 
 	INIT_LIST_HEAD(&ctx->submitqueues);
 
-- 
2.31.1

