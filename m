Return-Path: <linux-arm-msm+bounces-57893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBAAB7245
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 963BD4A3EE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ED6281364;
	Wed, 14 May 2025 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASkb7TW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63151280A57;
	Wed, 14 May 2025 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747242228; cv=none; b=ir97+Ni89/+rKm7QdCztltofl61GAtoGOgp2Oy1bAxt2S2colMABoU01IgLthf15AyPk7SpwPOe/hFINeIreqHVXunJLzeoconKwOGLL0Q6Jma8M0hRTVOP/7aWmGCqvQk4qVwkJzBZirMbd24U3DURfxX3BaC0VrriuYgzaiDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747242228; c=relaxed/simple;
	bh=ZaHKZAq/z/eNpWNhqjzvNMs33X3FsXvex3c08Wmj4FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mA9lW1yGygBVkydaXJtRru64CcrmSWOjI2TIHA7hp26vqc8Ho2cARV51SQa9FftZf0ocWM35Kuq3oUKJavX+nBA9nyViKsXZ8JgZBI25ScSMXyBp9QxArt5vNdyogtwuTuLIYGbp6LiG4SJsVwnO361X0RSiK8FTVa5yeq2bwxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASkb7TW4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so141224b3a.0;
        Wed, 14 May 2025 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747242226; x=1747847026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=ASkb7TW4u71ivc7AnPJcpARNrs1WbYtPkLc+tXYNU8mifb3Sl6PzGGlaJCvVkVRrni
         2hsYNqxpVaNbYs7Ixrd8APg8r8vYhtGiunYiUCyj/9y7WZwVjFcPbuvMuiHK7lUIZffR
         b4tLX9M9aMj5jgmz21qP650QFCDvOyxZxPQeaFXB58uF6oHhXfSeHZ5gU+iiXbVGVKS4
         arPZE8B1Mv/FHYN1ljzDkebuOcSh+igPKJP/6fW4/1C3Y3sKoLM0+wc/h8/k+WCNJDyq
         rJYiCngr7UrANkVXFXtGXVR7DB6AnpDh8jV6vsSiktzuvnhdn66/RVkblVwtgsjiF6UX
         Zy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747242226; x=1747847026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=fDW6o9hmXBA9m5g4KJGy7+mR9PX9p1WAdsM93NV3VwrQegnZsMungDD0zFBDYhNDh7
         3HdhaXrhHiP7Y4COCeOVLSBFTj0qVafaQsg4Kc41HDGueWDiyOEWKcXloFsOEFxrLaN7
         ZUeW3Ij14lJRfvyTwPs+LDigmdoYUxj6ZSTHm1CggR0wOXMQucNTARy80/Na25zaokQn
         K4UPSx8vdX8BVofsidWISBXC92+xMQ1cHgNOC0DijPw5L8qCSQc61LYjuYqyqZSh08Dm
         ta5UWczpa1dfyUYaDQ6DQmgcHgJK+1sn3zj1lasP61QX4dmOUkG5EX3N7alvUYtgIu5t
         d17Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZq+zfWUzXSkwLV7Rkw6TZm49XP1O7YxGxqOlrICcg/295NW3QjEnEPCFFEuqSi4NEN+u7PqLDox20ykPN@vger.kernel.org, AJvYcCVeRr3ZWhNZ5EDceNRdqzFsKHNGxvDdBPC7gIhghH3YhSDdXmubFfKKuLiIFtb7jdczU6FQyIpS2Xwcrp3m@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7CVgJ5JSSTEuH2nY+0weD+haEe/1fV9DyHkQa5UNlJpRjZzt8
	+RuJYXrTOS/YMXl/fA6ZirOZxZYfrOuF5uD0L6FctCnDO0RLencb
X-Gm-Gg: ASbGncu/3hOd4pKAxxHkDmqaCTOyFnmysY3B4sTfA0QbDy8+7csPF0LDWOGvMgASgPk
	tn79MUQGABAfsKuIVcL2v/txW8R8j+yvRlJKCiLLa/WoIoH9q8K5DjEH5Y4/ASda3M4DO3KLcMA
	d66JiDgxL2mDZmEUKYbSRBNtF4UvLzcXUjtsUJiHS6k8MOM+knyFZ9LPLVVRbcP6kydTgHmJ1lC
	ngCE4L066oZ+t9r+gNXPT4+T7NE5wnr5exVGzhUB+A2MK15myxd1XJEXgYnQFerNgrjW9h+th7b
	1lccHMLDsTueWyjZTe4knP51/R5YtXQZto2tz/xSedIoGg/1fIBYXfGlhUS95kNuvZO2k+lrTVa
	XlKxU1YoMDd8kX7vppYPK3Oj9RA==
X-Google-Smtp-Source: AGHT+IEudCs3epNgOzH45zFKhF3wF3KgAJNaSNIjJuJ3OYrje+XY0VybCKKMR36pmLxg8on8O/Cqug==
X-Received: by 2002:a05:6a21:6d88:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-215ff0d4647mr5220628637.17.1747242226550;
        Wed, 14 May 2025 10:03:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349dd1fd8sm9172819a12.26.2025.05.14.10.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:03:45 -0700 (PDT)
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
Subject: [PATCH v4 11/40] drm/msm: Collapse vma close and delete
Date: Wed, 14 May 2025 09:59:10 -0700
Message-ID: <20250514170118.40555-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
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


