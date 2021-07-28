Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706A63D84FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 03:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhG1BCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 21:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbhG1BCa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 21:02:30 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B13C061757;
        Tue, 27 Jul 2021 18:02:28 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ca5so2588400pjb.5;
        Tue, 27 Jul 2021 18:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
        b=t5Wepi5tj1bkE6GOdqqACip3pBBRrwi6TWI4YHUir3fDkwJG/Y90aB/7pCuXLVMaXG
         xcXfnHNtzQ94G3qtgrioXrXCQARLs+bDk4+/Mw0eXmzmCamoyR2wYp8vF1zRjM/W5r4C
         s3qD6Z2hOp6lkz2zxzhespg6qHGuVSoE8qKfi8FT6itW6WIAr1j0Bz3ot/4RfIUJg1Pr
         X90MwzsSlQ42X3B2yDIhmJFDC0KdBbugb3XRBnQT6LAvu6R6pFv/JELl/bvsqnQDPvzw
         zU9GjeAe43U4n7sKvbRzp+1JU/8eSEYiy9N4W+slm0kSfZeOISMcZF8LuWfUZ4GFgp9P
         TBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
        b=bD4rVphDOJxGNDYjaC/MoJtuAtYSUmA3KuzqcaCTgQDOFkJGvzNQKLJ8g0SuJ0j/sk
         C/jyIRfN+JvTwq7+6nE6ivxbzJ8wJCHYEaO3JKQf4ihKyxGE73TnHfD5omrRKzVuA/M4
         Wnk1GTvTeS8zd/arM7jlFF/YHA3EW2arX6pg7fa4SEDeg/TpzYsrrnPMdzN6+Y5sF+HM
         wJzTE8KeJ7zlF15YhuDwsh+LS3oXY7lo7sHt1SJBXD8nrP2ZJm4FZG0NhFKcak5rfCWN
         mpxPA8v97lXiXCr7o780YJXu+CEXpGZRYlyFwStx6ER/JUN51Rc7IPQMdTCCkTdyZE4N
         Kzzw==
X-Gm-Message-State: AOAM532MX7cUuNH8BbU8Q2US6p3b3g3qa+GUegdqo81fK1CzQtirK2mF
        Dq3MeGvv02Y71+5C2+K/8kE=
X-Google-Smtp-Source: ABdhPJytSJSEEESLfU0x+zsROI8dDqa9EpfmSYbyQiCyOZ1Lqgg+3Kh2J/NL9/Hikz/+IK8k8yGBXg==
X-Received: by 2002:a17:902:da8d:b029:12c:5241:c24e with SMTP id j13-20020a170902da8db029012c5241c24emr2766852plx.35.1627434147978;
        Tue, 27 Jul 2021 18:02:27 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id p17sm4086712pjg.54.2021.07.27.18.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:02:27 -0700 (PDT)
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
Subject: [PATCH v4 02/13] drm/msm: Small submitqueue creation cleanup
Date:   Tue, 27 Jul 2021 18:06:07 -0700
Message-Id: <20210728010632.2633470-3-robdclark@gmail.com>
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

