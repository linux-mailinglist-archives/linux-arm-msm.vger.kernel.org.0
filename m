Return-Path: <linux-arm-msm+bounces-56548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16366AA783A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 895351BA6884
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4693267B86;
	Fri,  2 May 2025 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzrIT0WV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18879267B7D;
	Fri,  2 May 2025 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205693; cv=none; b=F+yWIFfkzdVx1jeqmHcrQMAX1PHZ9N5WWyb9w3i9RnEDh6JWiJvEDGE0uwsFc9wa1gGf+FYY5Bh8iM1raIyEfcL1lrx9r2B36bVWCnM7JIe1sNQLOjuzaLF+5LooFkZgLrAg1hj18sSpniOLneHtDhq01oT7/rFAGsHuRddeIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205693; c=relaxed/simple;
	bh=2WpPjdOnE7lRX5ZCDjp17CsoLPIlDS7/qvt4/yxrQdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5Yt8mm/ViGtWe07urz4sPxQNSQOTlnJOnJ7TN18bkBtPv8cKdzEfzqk0HrA3sCDJjk4CmKn8IpzytrQmBRHN4MqDUjTFmSPxY2kgm80dVkTWpqyZeQNQ6iAYJkHjUNEIiVafCbZDTO19Pc2TqWYN1+y6Y9rJ652gDpiLlBwRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzrIT0WV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223f4c06e9fso22488875ad.1;
        Fri, 02 May 2025 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205691; x=1746810491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=SzrIT0WVvoIyKh6+w10RN+AN/7hcWI2wrdk6T8rVlz9Fk6uQ8osw4I/Ri5GONGnHqj
         yzyPhI4gEqsR7yIQGZ4/n+500McGKMYVThh/vGXzWqZFs22HabBXyl5h4xA5/S1qLppY
         dQtXXvWQgiW86KAJr7knNNDNMGdZpOhlcgU0cw82rWJqcwdecQm8Y2JiTUZ1qeFYnWGX
         0y98NuPE3u0s0N5cNq68Sp9SuPsJceiddjuqZLw5BdITNiHy3a2y+vOZfSNcB1Xchds9
         pmSZAhSNG6k6z9FWY+wMTHCaMN0qi5AU4Anq1kXXuWSYsSvMW/hERVE6jbdIP1R3l2Si
         gHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205691; x=1746810491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=N/D6HGGWizmm+itompo43gk8wi+a8Jeyy/dIWeSuqc0XetaEdMQ1AYxB2MJbYfstC3
         vmp0nVetv5J5+0T7OlaqvCMFO5PkQAA1AfD4mEEwYsZ1Xr157T3ot+4YQoriJdilDk4l
         NLTgStNKKLxoXG01Bk9uBcLVJuuhHkOk4E2/svoos4dQNgvdGO5G1XUGPgUYoA04YEi5
         +9iHvh0AWqCfeOkdKDNMRRULSHe5wYSOrdvxL7GhQM5CLVyXNB7hKkUunFHnoHjereH+
         +qgTv2qJaL6kHH7Ev4OZ+DimjsLzOh/vQCGmPZJFsBld5uryXmORWiq5I92rNpg5THA6
         7hGg==
X-Forwarded-Encrypted: i=1; AJvYcCWBtVjZwdGAPqf1faurV5uVPaNLwdIz5Tj8LORszUro9ggYTgbDJm501ohNe8/0bqyPsyeqgFPByGrVepOs@vger.kernel.org, AJvYcCWhJcmSZmuC6cnjGcqyYJ+EzJBl/1ogRzV9IzpYd+8zgyNSNW4DNla6rOsbjf8bLyZyVdCDiNIhcV+0yPD9@vger.kernel.org
X-Gm-Message-State: AOJu0YxxVkQ0BquyGa/efsWTEdFiF+LoFvMxWV5W/Ir/u59yF+BCGnzO
	I/zXjPQ7h7IlzLVRRU/KTI3wQtVir+bM281OKNhXYgtdZXMNOC0o
X-Gm-Gg: ASbGnct9aORPWv403k+/8ZDe2PpWjZ2psuBR5dhSIMSdUXyF54ccNVdwdiZ4hkW5tR/
	Vyeg3xT/GcR8N0wgolBklRHd4D/cr44MZzuz8H3UqAuAQ2Va165yunpXslao4pxU8tR8xrQCMUQ
	99D8i+G2BRe/5Cg21tm/54p8xjyH/PIk8njEsNSANnDZTmaXtDYvNC7xT5+EW050l0PacZOc8iY
	PWFvd4hV2X5I2bYMWY/BjRq6P+gwOvHxolRdHI5GRa2usBGttL7/bSIO/nZ6tagOoQZdwvnBZH8
	gKX+cgKTzszc71Jelb0mNNr136Kn3hP+mOzEYNovHByPuilGh9UJYnPoxdaICgvF5tUQ2QMQGfH
	gR05J058QMcHe9oGioeDHoRgFPg==
X-Google-Smtp-Source: AGHT+IFpBYk4mB3RRUSfLeMDpVzLkjlz0wda7XIHVCUCA36C4QGIPjXvGxUROTT1MMds4FTnVPX1OQ==
X-Received: by 2002:a17:902:cecf:b0:21f:58fd:d215 with SMTP id d9443c01a7336-22e0842fbf7mr101387605ad.11.1746205691217;
        Fri, 02 May 2025 10:08:11 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eadfcsm10178815ad.32.2025.05.02.10.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:08:10 -0700 (PDT)
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
Subject: [PATCH v4 08/33] drm/msm: Collapse vma allocation and initialization
Date: Fri,  2 May 2025 09:56:35 -0700
Message-ID: <20250502165831.44850-9-robdclark@gmail.com>
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


