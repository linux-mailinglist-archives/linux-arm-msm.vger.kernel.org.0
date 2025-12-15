Return-Path: <linux-arm-msm+bounces-85183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D210CBC046
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 21:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A20E5300EE64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 20:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B71A283124;
	Sun, 14 Dec 2025 20:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXddaXMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C291A24A067
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745961; cv=none; b=VWirkE+ie8PkUkWWFQOkx3mNX5KyB3jC0jWk6O4iar2xo9OC3PdNvYH/7i/gnuIuEtZDXElgoMwYOYhj1LW2x34RVONLxo6ByYaiauJrGyIyA08WNZi2936tfirLS8P4rGWfHjzgS2ci4MT3Sn6bGmPniyg4gvPp9toTT1JbLZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745961; c=relaxed/simple;
	bh=0KMRYNO4kj0rIWLQR6VXgnYyHz0d7TIs3nmlB9EGS1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rPB8jWeowNFEDxE/iPXdKEF/LYWEaOQ+bXzWwUiCLAlXTT1AhAzLlmOymrGezSaK+at1x2CBZ4aZ+PlhfTThGHylvLeCJlkm7A836VLbQdyPbtOUHj17+NUsH1Yyws4NHcNHLhhRT2sx4PAPtNxxjWHLDGpEbW6k+5rJAh8WDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXddaXMQ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso2940759b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 12:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765745959; x=1766350759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kf8/6K2teDNVpRcuyX4Rd2wH3CZRe6Wcte8AE2g3GNQ=;
        b=SXddaXMQxOQ4u96KatYJUElMin0ONwCofTDTXBVSmAPAnSSM7ILp1EUTjYG+V+tz7U
         OZVVmKrELND6MMEWf5R1+6/FVhKIP5NeIZpLR/jW7WlMWro95HkJeIOJa2OkU/FWk7Nm
         rlWzX6IC5/XVurzw2T4gxowqqeJQk+s/ipfNxcdAy2Ma22Mj5AzD3unCwvwSNko4S+i1
         lEVsMVqOwVQ7xHMh94lZv3N8MG3uuJJ7MqFGoEqPC602AfQKaPzGHOg3m/E+W2pYtGV/
         u92TRPo55xiukZcIMH+mm7Nn3YjJCzApccLA8YQgTkvtJTlpBFGb9Oukjfm5MCrgKMSk
         Jrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765745959; x=1766350759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kf8/6K2teDNVpRcuyX4Rd2wH3CZRe6Wcte8AE2g3GNQ=;
        b=f/+SWvinyL8e4S7DjrfUTc94b3sGJ6rHUtBTl7CG8Of8YuKJMskl6NCth+CgmNj1kW
         X7JhaVj1ho2NHivZtYEdr6loJWyajUon6D+qnvMTvHlVxpto34IwAp4PA4i0DFKyf3MH
         WVrNP0FitIv/JklbznBwg+DliNIDcDI57J0KslWtJZ7oxMMTU3jiD/pBKQo7rKWoPu8T
         SBPecGk5c0FOArP16wEIKg+COUpdTv1hw/4s55Jt6Guo61pywVEr761lCe0tsYJG4+28
         /EEoWsFm6Tci1FDqAgWzZ2LGCd/eM609KsXZK8xuk41LmikYgGLrggBsnYsxVn1B2rvA
         JohA==
X-Forwarded-Encrypted: i=1; AJvYcCWzQyZMPqjSNJk/3ro3xwuVxp5+IJyW1n0s0jEotk7WZP3DhoWkZ1U7HrGAZd+j5OBRYYHi4Pw8LIVcg4uv@vger.kernel.org
X-Gm-Message-State: AOJu0YxsfdwZ+tMdMrsJ/hMnuU1+Is0h9jcxGach8SWr82Oy007DyAB/
	dgNsowg4sTBNcgQC/YEuZY/l+BxwmdajyLv75BDc3m4CLUkbr35ZAoaf
X-Gm-Gg: AY/fxX53nWpV5VIAFG246sYC3Rr7zXnC3oBAGA3+liQODA94vKy2xfTu5P5p82Q0kwi
	YE66DJRM5tNtgSW+wuOko17NyZm/I05qypdvjEy1kgy543BmaxeJZji8V3Oo6JfT5TvGBUSyJm7
	f7KcYl6hHXA8i/0Hv5MZi0H4ZC4Q4JYjFNeEzNdOLp0OzDREr59Q+47TXFxtyY2Mi78WNSlmFJ2
	YF+dcEacnK+y113BCv89X23Gpz6hbH7HaCtxEh3M4l5samZZ0DPnzmVRqXqYMucLHR7Iabh3gVB
	0bJOqqcZmrEOGUupBeNbo2G95nyPlHRT7TFSxSLYRORpswiUJJfAUVgxPKrC75w0zXib8bebMoV
	3UqxBajZxEfVLi85ke9DjbSmZ/tph4+ttIqPcw/Pz0l2kXpCBI+VHUWtgdxJV4RENVZshp9R/zb
	OUNXwfsllySlV0iTL2owk=
X-Google-Smtp-Source: AGHT+IHF24o2Ly7Mr/lxjtc1FrISspaWeGMsZpBG3wLNV1EITlc6cCBdDneNg0BsjDKnEHLcA8k40Q==
X-Received: by 2002:a05:6a21:33a9:b0:363:b976:8f79 with SMTP id adf61e73a8af0-369b6aa5600mr9846654637.43.1765745958939;
        Sun, 14 Dec 2025 12:59:18 -0800 (PST)
Received: from LilGuy ([2409:40c2:105b:dc88:1107:395c:23c0:2b1b])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c0c2589d4f7sm10584880a12.3.2025.12.14.12.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 12:59:18 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] drm/msm: Replace custom dumb_map_offset with generic helper
Date: Mon, 15 Dec 2025 02:28:50 +0000
Message-ID: <20251215022850.12358-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msm driver implements a custom dumb_map_offset callback. This
implementation acquires the msm_gem_lock, but the underlying
drm_gem_create_mmap_offset() function is already thread-safe regarding
the VMA offset manager (it acquires the mgr->vm_lock internally).

Switching to the generic drm_gem_dumb_map_offset() helper provides
several benefits:
1. Removes the unnecessary locking overhead (locking leftovers).
2. Adds a missing check to reject mapping of imported objects, which is
   invalid for dumb buffers.
3. Allows for the removal of the msm_gem_dumb_map_offset() wrapper and
   the msm_gem_mmap_offset() helper function.

The logic from msm_gem_mmap_offset() has been inlined into
msm_ioctl_gem_info() to maintain functionality without the separate
helper.

This addresses the TODO:
"Documentation/gpu/todo.rst: Remove custom dumb_map_offset implementations"

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---

 Compile-tested only.

 drivers/gpu/drm/msm/msm_drv.c |  8 +++---
 drivers/gpu/drm/msm/msm_gem.c | 49 -----------------------------------
 drivers/gpu/drm/msm/msm_gem.h |  3 ---
 3 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100..bf20550c5814 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -588,7 +588,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,

 	switch (args->info) {
 	case MSM_INFO_GET_OFFSET:
-		args->value = msm_gem_mmap_offset(obj);
+		ret = drm_gem_create_mmap_offset(obj);
+		if (ret == 0)
+		    args->value = drm_vma_node_offset_addr(&obj->vma_node);
 		break;
 	case MSM_INFO_GET_IOVA:
 		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
@@ -836,7 +838,7 @@ static const struct drm_driver msm_driver = {
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.dumb_map_offset    = drm_gem_dumb_map_offset,
 	.gem_prime_import   = msm_gem_prime_import,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
@@ -859,7 +861,7 @@ static const struct drm_driver msm_kms_driver = {
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.dumb_map_offset    = drm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 017411a0bf45..da74f1413f94 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -375,34 +375,6 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	return ret;
 }

-/** get mmap offset */
-static uint64_t mmap_offset(struct drm_gem_object *obj)
-{
-	struct drm_device *dev = obj->dev;
-	int ret;
-
-	msm_gem_assert_locked(obj);
-
-	/* Make it mmapable */
-	ret = drm_gem_create_mmap_offset(obj);
-
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "could not allocate mmap offset\n");
-		return 0;
-	}
-
-	return drm_vma_node_offset_addr(&obj->vma_node);
-}
-
-uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
-{
-	uint64_t offset;
-
-	msm_gem_lock(obj);
-	offset = mmap_offset(obj);
-	msm_gem_unlock(obj);
-	return offset;
-}

 static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
 				    struct drm_gpuvm *vm)
@@ -730,27 +702,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
 }

-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset)
-{
-	struct drm_gem_object *obj;
-	int ret = 0;
-
-	/* GEM does all our handle to object mapping */
-	obj = drm_gem_object_lookup(file, handle);
-	if (obj == NULL) {
-		ret = -ENOENT;
-		goto fail;
-	}
-
-	*offset = msm_gem_mmap_offset(obj);
-
-	drm_gem_object_put(obj);
-
-fail:
-	return ret;
-}
-
 static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a4cf31853c50..92ada1d69250 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -262,7 +262,6 @@ struct msm_gem_object {
 void msm_gem_vma_get(struct drm_gem_object *obj);
 void msm_gem_vma_put(struct drm_gem_object *obj);

-uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
@@ -285,8 +284,6 @@ struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset);
 void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
--
2.52.0


