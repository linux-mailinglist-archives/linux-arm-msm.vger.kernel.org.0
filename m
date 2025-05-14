Return-Path: <linux-arm-msm+bounces-57910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C96AB73B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51904E0138
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895AE283FF7;
	Wed, 14 May 2025 17:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQHVIdIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C27283FD0;
	Wed, 14 May 2025 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245386; cv=none; b=Ps3N7+Gb3xdWeOFDiOVY23C1jwFFkowZwB6HMbOOE26WH0z/uzHvfnS6m9BLeeVuhcYaBW16Mn2IpHYEClY2VuKapMe8GleIHcDr6cgz0lGymq3jzKaoBsSGsyNg+g89fqQk11cs8l+Y+5u9gc6lFu3ow+4LjVU6fmInzPoLH68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245386; c=relaxed/simple;
	bh=2WpPjdOnE7lRX5ZCDjp17CsoLPIlDS7/qvt4/yxrQdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/jhGOVDbKkW01yU86JRLKR5M1KbVfa7RHjUz8L2Vy+HgYOWJXnsTOW2CRr1aJk1Ta0Z+TI+aFAVf+s5VeONPiDJhFelUqUtPXtZA4+gbDt0rQJiEcimuE76m2Zt0oc6UcfnFfWcQtoE951s7ejRC6MhfVfZiIrIN7DAmTExPB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQHVIdIe; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso4882512a12.2;
        Wed, 14 May 2025 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245384; x=1747850184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=UQHVIdIewowy/VD14582gsoiRfhGNna8F29FN90gZVvSAaoD7NMs973/jgoOdO+m13
         HQ2uDtTkGNJ8SA6WJ8B5P59MSv9XPRIf8TvtMcp+Vl+4AlyAgyk+04d1A4QAQE6ksmIM
         a4ebzOYeFpPCkRlTZ58aQrP85fHwhd4LS2S5jfXHzw0+yUsffAs7vyli4whQ0g445oC3
         0Lt5d86YarufYDgG598up7FQ+1mtibnCMjvuxXlV+RGTgX9tGcqZSgC29ZZGbnrL4zD7
         PcjYR/UKV44vdFNSF511Wx9ecsfsSnj8SBgv2nsNOTPcOdMXe+eQPd1EsRHm5x14e083
         tNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245384; x=1747850184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=LrqPCcY4bmfLOxuM01/FF+6cSVM0rfloEnvjc+Fh8LZ9fI12QQgBMNPc46GXNboLQ0
         4LgGN1Yc/lXOjTCJDbTc6CZ3XT1ynk4YaDdr7qcSeMgkwy8n4buQapufLrMsZTe2L3/W
         VX95ClOdXQHDEK7jxiuESFYlC+4SW7fHa3Uq2OLpJhnCknbJ4MdvpKczXRfCGV+0xF3v
         k51Z8vxvNXd5A5jv8iZFHhJJL0ll7CDdYEe+A4VWdopOq9H0J7muszxL1/Gw1JUXLfm5
         7FzvjDZkS0/JxLgI4yRr7bm2524xZuFlMhk3uBF/0dCuW2hMOeLfmAZZSSOEqu8X+SeI
         qLhA==
X-Forwarded-Encrypted: i=1; AJvYcCWgyj4QQxqAv4MVNpz7Gb36ezsrBDbhsGxV9bo6OaBIOd06CIHaGqB4rdXWMjXhkHAt7IYSWIqhPLMOk4ok@vger.kernel.org, AJvYcCXkEM6Q426RPhADX/nWuLWHqe3Yjhj8GkZf65a3mDwDJ6Ly5+QfmhQu5nUUbeHtAi34yytLyuBRjmGwLcCn@vger.kernel.org
X-Gm-Message-State: AOJu0YyRcvg+3CFuIkyTb+0voLnpX9GulumxEhSpNCau9pAbuBBKUxbE
	h8kDCjqkRMHQnCHoMqTEmsMl2zZrw1lN5l4i8xxlyGZ1e7edo6r8
X-Gm-Gg: ASbGncuul3/hDSoQ6uXHhEKlq3Z+q1JoTqPtinBQsdbB7FhoAAStwwOb54Jmlv0SVnc
	b0W9QWkGTA+aTwOLIclKwXi9dq+YkZMylVAL+qrnXDw3xOIgdxN8owErLPFD7FnqqDRbb/vEc8t
	pN1QZwpHID+K6I0xke4L4zY+YdTTYmQWCoQExIh6dEdJlAs5gV7wNOHbFAMx6XyFUdzYlxucp5o
	qt2BZTdw7IVWi9BiJ/W8cI+2+/NexmMiz4lMUhdlsJW6UyRoK3FRtYtHaqd9nvI4r56SOEoAj13
	jltOyziTInVuw80iqyij2ASGR4mgf7NzDPXJTVo+H9DSux334zx2pq79c5W/B0nddhID5u8U/hy
	aWPwSj1Y/HWApdlxyGbAJINHQmw==
X-Google-Smtp-Source: AGHT+IHZvBZD3lCV1dVLdZ4bhFoWCcdh4ODc0Xqd3DT1ypEQbe11NO4rlWbxF5S9AjJRi8mVKUo7JA==
X-Received: by 2002:a17:902:e5cc:b0:22e:1a41:a6de with SMTP id d9443c01a7336-231981a2d96mr66019365ad.32.1747245383959;
        Wed, 14 May 2025 10:56:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75490f8sm101786445ad.42.2025.05.14.10.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:56:23 -0700 (PDT)
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
Subject: [PATCH v4 10/40] drm/msm: Collapse vma allocation and initialization
Date: Wed, 14 May 2025 10:53:24 -0700
Message-ID: <20250514175527.42488-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.49.0


