Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BE13D5C4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbhGZOQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 10:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234841AbhGZOQB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 10:16:01 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935BAC061757;
        Mon, 26 Jul 2021 07:56:30 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so420303pjd.0;
        Mon, 26 Jul 2021 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
        b=JiIaaMCMbRm9mnJqUkFsfhJqfx6YQtWOcgTgsY7B0MQSf2dCUJ6fDDh2OdEKoM29XW
         QE+0jeQMIxKphuKIDCJEOqXn4g1B53buWNFtI5BkjhpBXV6OQP+gMbAR8C2ryOJYkoze
         y97CGRS3CFKLf7T/6IXO/NPSLPSlDBGTDhKQxHUMtAbvZaPl0j0EXA/38rjqUGvVGMeu
         NU2HHPINv2C8My3S0ihjsrW7uxgV62D6Zn650OWpTcTsZNzlWkO/6Kal3lx8L/k1dnTL
         wUCZqmMfk+FiY/cdwpOOnAR2WD2UcH5H2/pexZt3DsNJSOgV6bOtXc4Iw5mprG/7zPtv
         FsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
        b=cXjI6lpFJgIpthbwfLYztc0yANu6LJKc+kWKmCzyqs7UgRHNgiMCjxOEQaD3FexT70
         vxzGthrZ5NeCZO7eaaBbRrSUlqk2bJzKCMGPet/NgrcYbIAPbvSNtSRqYxiY4g9x1Nfq
         U/eRL14c//JxVhg1EdG1ba3ImPymOfxYMndqV4uMHfQPWUCnnqolxsYLxYidg699Kby+
         zrgKQHN5FXDJ6ywUf5EMSdKf1qCfNxbNgu+wl5JMN5kQ3hnh7r/9jioflvXWWE1GnjVt
         NEaG6yuhSPRMkiQnjUgEYvf37HyP6+pvwcs8r/5CMDR1skn0Jf7M/O3d326OOwonPmCf
         WCNg==
X-Gm-Message-State: AOAM531bGCCTxK95he7M9qS1IADMEiqHBCgOXW+4q23klqpUoBxngxk5
        NkAJR32zltJ14iq6WI/KxoE=
X-Google-Smtp-Source: ABdhPJz86h6PCUyD51DoJndCL8qycP19c2HgrDfDXD+QrXL7gt+CAfAJRBeyCjnSVSAo7Xas4LT+qw==
X-Received: by 2002:a05:6a00:1503:b029:395:f05c:e073 with SMTP id q3-20020a056a001503b0290395f05ce073mr6929303pfu.80.1627311390171;
        Mon, 26 Jul 2021 07:56:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id h30sm242101pfr.191.2021.07.26.07.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:56:29 -0700 (PDT)
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
Subject: [PATCH v2 02/12] drm/msm: Small submitqueue creation cleanup
Date:   Mon, 26 Jul 2021 08:00:16 -0700
Message-Id: <20210726150038.2187631-3-robdclark@gmail.com>
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

