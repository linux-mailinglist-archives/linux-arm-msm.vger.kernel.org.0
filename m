Return-Path: <linux-arm-msm+bounces-56549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E131CAA783D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A6EC3B83AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C55D268FDA;
	Fri,  2 May 2025 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUH/TkbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8044267713;
	Fri,  2 May 2025 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205695; cv=none; b=YiD5zmwQVDpkIcom5Rui4IYCnVnPUxz85XZg+X3dCJYnrvwpIwH9B5npr3c8+i0jsoEZ+UP9c9mKbe65cC1tkqoBF5dWrT50NFtTDgWjQSmi311FsAqfXtkU1aH/NGLVDi5dE5MfXLHeTgMI/uWJqp+HMUuMZaGUfKL6b3MzkC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205695; c=relaxed/simple;
	bh=ZaHKZAq/z/eNpWNhqjzvNMs33X3FsXvex3c08Wmj4FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZYRspKMzVbg534y7M67+IvBMR9N6qRDF6/fgKB+glkExU9bGKGDGpBL0RiS0k/Vikx+zDGwBSrWzZu1ww82UMZG1Lb+rh7olY1qhnzMw/c8rd2bgmKA+0fsGMLr7cd448SaXREVcpvqHS6PAUdyxcswkkyfbAyH2YdlZ3q493E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUH/TkbC; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2381602b3a.0;
        Fri, 02 May 2025 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205693; x=1746810493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=iUH/TkbCwLfi5+FcZP5WwEw6JRW9mbfTWaDwHRg/cycof8qLhlqgEgWCnhRw/jcnq2
         LeVufpNEVQscrvovTojkGt9KDxR7uLVQ4LvwncXiSiE8xjqna+/eD7Qa3OS+YtXDD0OR
         75JSc9e1RZLobc+dvElllI2Xo/Bsr9EFb7udLqWHg0whA4PAD2iCGibsG6G1xY5PyxsZ
         aNxCc9JeWlmVgLhwpQJW6/150JMl1y+lGpM4BdanAeFPsOM0dBGtKDF3Lo4sQ8Mw94x9
         Z85L8z4E8Um8Yqvdx5JvoRCNRzbxBL7glSGUBJnrx/4pXh6nc838LVpqJU1rQqBojWX7
         LNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205693; x=1746810493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=KH9JEPQoFXVlzlmILVXgIYFi2jQFtGvRi7hppnAyeJ1WWKaUHuvQT83RxfU/nNgUWC
         3YjgJjQmTPmlPCFB96+M4i36zBMXYfCLdtBT53DLq8TcZlnS82i6Bo6IWjTEk2QQikif
         8Y6JD3BXLY6/5OXzBx8JxJ4Ub9TNTqff3KE8oB21XBr2pYOxq96eoZZVvKdzDISJOCad
         WGyQ66yfnJinsYhaH0wmh/K8hHz1ehFQ5d6JU2zjkheLq9/FRX8UmS0ljpCYFfn1WrcY
         rHsIjOM/V9sSE3RNX3TFJ1oA8c7m8Oawh1skTXqR5fYUpvyKa9WqHrftquGV2CwXPT/M
         Abyw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Ff+odS2cZBj/LYw57aWmd9+69OnI8YF2K0oLLkaS4bVn2i1GumWbUlUQv7DMmev6+hyZILFKmwtK3L6l@vger.kernel.org, AJvYcCU3bF2ns8ljr/O3pXnnSIXUxbBl00vxNyZfWB/60NK4vGEzNuWYiQmOAGEdghEUF3wft6jsy0xqajlVjdB/@vger.kernel.org
X-Gm-Message-State: AOJu0YzKHs3WcB9DeXkiry8Ck03+LT5TbI5kqqIf0yZo3dhBYrq7NFxP
	qua1Yxx1gi89T/8K7WY6OFPRyfsiB0naY/UsSryuEnc8BadrYqQm
X-Gm-Gg: ASbGncs2LpxN5C/l/6s4RZDSCn8S/JSpENRE+YQaR+UjrnKjWa9oL50hNoVm4qBZse9
	SbBg9vNcQLKS6J+hNg1s4izqNSzHevk71v/UZsuxQtRgZDU2FESYOzVHiiOj4z6LAp0zdQ+VCtE
	/WBV14pVmqY3Sbzml00ek0AUorpZ2qWH7HFvtTvQyKmS5C3PNUGT9Ou3VBlPrPMznws6UUcxqMd
	kWA7c+KGFJzc6eYH1msD7UMTPJTBLS3sJwWUdHNKFO64T3tHJXgTlOi0KoUmdIJ5ig/3YAVH+gh
	kLDJYuZMJWcVpOcn6hkxTczPdc3yd5lP2A82itzaNNT2jPdtW8XRunY9m6jAriuIRmZPwNfSY6a
	0UrDIfNpR+sJKTwM=
X-Google-Smtp-Source: AGHT+IFin7vcvn6cE72mu5NHWdPdir/2ennFF/57da3rq+xksYALjf/lRnD0N7Fwn10FnKXzgkWy2w==
X-Received: by 2002:a17:90b:2ed0:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30a5adf7bc5mr79690a91.4.1746205693034;
        Fri, 02 May 2025 10:08:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3482a35csm5977636a91.44.2025.05.02.10.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:08:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 09/33] drm/msm: Collapse vma close and delete
Date: Fri,  2 May 2025 09:56:36 -0700
Message-ID: <20250502165831.44850-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -372,11 +363,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.49.0


