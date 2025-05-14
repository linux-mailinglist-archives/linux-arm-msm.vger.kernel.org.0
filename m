Return-Path: <linux-arm-msm+bounces-57886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46137AB722B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0696A1B67626
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F25280A57;
	Wed, 14 May 2025 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBaSY1sl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67427FD7E;
	Wed, 14 May 2025 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747242195; cv=none; b=hRb0Yi+6awpfVKtLiZ51f0Jb6sfPbxMvuz95IsVn+Tfwy51JyZNDjVPkkMCU1v593/EIXBCDgzCtUlp4VTDrT+Zb5+xnXippeDXf5z1SUQovlOJMifGjEFwZfTnr8xD8GQdzY517OA8na23tx2iAdPUvP4DcIWpDRgVOzBl5WXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747242195; c=relaxed/simple;
	bh=SQFEPFoQGPBF7guU+5g4MGv0tYihRYeOe8cgvGrERpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekLumL/PHn2yzU0H+tQAkddwMOT7avLwhW5DbEepw801mFoe1ok+GnHG0WLOF2LBvVtntTXFQnP3jZ24jnZr7LwGXydXMeo8loirsX+mUCYbL2DwfhHoY6g6tjd1SeOr8qFbe8HUA6N++eT7z5lHnGwO23xt+0cSW2UfLXaAD7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBaSY1sl; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2325c56ebdso6043869a12.1;
        Wed, 14 May 2025 10:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747242193; x=1747846993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
        b=iBaSY1sl50mmuBMcIQKwkcNkkNhd1F9ZiVq+KRPX5bNK1xEHjwvSYVBXZWQpK+xJx3
         5jg+jLwV+ZfwBpU9c18Jx7JOMjjeg+AwbkooH+oIUxNbr3EHHP3tGRCSg61n6ZEuamgR
         j9hoVASvt3vm4+EyLHG8SmpIb1452r+dHPXCP59JwhY6k9XzSHR3iH7dyrPIqwJN4nWl
         jkz0XQN0o97X8W8BJ8FQJsMYz8rZL0aiUF89/mVMInktyJ0nCnqXvHhXGKdATTRd1A3t
         JF2z4boCumybHjCTFmyIQ2GFr6g6tzF3KZPuaYyj3ewcjh5XK0dd/fC4YX0s5tlgQiVW
         wE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747242193; x=1747846993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
        b=VKS2ly8pbRIiVZ6Gz80TvRQ1L0nSlqjy2Obevswx5vrY+dHA4M5PIPXyT+B4Ksewa0
         Fc1vRmb9GR9wu1mh2Zr2w2pWCeqrnyhBhqmAyDHRziKNDH4h+SUcd/C1VwPbgQBb+A24
         1aNMGMw18Ds9GZUIsfOyEKf7TGDyBvRup72xulXCfzi9DR7DSEh+hgXH70rd3s835eBb
         jBc08cXRGTdjm8zTz9/8EUNDpQQ/ZT/ng3EG5uFLAB3XBXJ49nmfmb0B1tlGTw7ctWtn
         NKFJ6PeaXOS6AH2dm1j99Lk64D/NeGri9Ja3CGFx1zrmwSnbsTH9Nn9ayjLIThETvSfT
         SMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSqXmUbYCGxUROUxE69ZA1JlS/RUSbnk5xS2KcxtfMqGez2dq6a3kqIiwbRI4FZeRpMrcnNOr6jt3H+FiB@vger.kernel.org, AJvYcCWJZRBjVvhDaqIxxVm7iANELMgT2HUnOQAaNqHupLj7udRbXjZNiFkFP9PmygXtZ/azrBQJn6hDGJFF/kyy@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJaAZxeiKdxiRIGAReX73zb6FgIcQYboZOb5RlIMwjvG9vmTQ
	e0NDu2OjrDOjc/t9CGfxUiK7ZgN1shRQ9k2ZVjbQbsr8A05cKvw1
X-Gm-Gg: ASbGncvz4B6696FCxV/hiOYgXkVVoFwhUXx/ysNgoZIx1Vewaa6sjsPtGF8zUevKOw1
	GrMh4cdqYpWUvQsuzFxlvK4BVeC5rrUJXLsntIC4S6krvkHcZlpRn9K8AW/3tgxC645mNHp8WPA
	drjkzPnomZX+co++Ww3kM0kQO3rAXo5DRZCT4JJqyd0Z4M9CTwpDQqkE/aFZ3DUzimze6s+nO2Y
	Qquj0mosRIWFdhwi4q1G2AWpc48g/5voeTpbCT2a8VR1OUApmQxTDVI0/VvHSBZdVjFEHvMJ6ae
	U+D6HvwVVWsTSqxs7qR93ZMjSWGMEZAiM8H5OwtiuJsLWVd87LpeRgr6OTJuCSa+VDUxhHlCuEQ
	t4hF2W32+2ktCM0Q9jxcKrpR4oUEmzqeGG72i
X-Google-Smtp-Source: AGHT+IGP0e/1t+rY7vKORMPwfWNUz/Uslz1/hDTpvMSA09KmiV/ipKMfDI5ZIDJPsIMFdNfzOhK20w==
X-Received: by 2002:a17:903:2d0:b0:215:a179:14ca with SMTP id d9443c01a7336-231980bbf6fmr61743115ad.2.1747242193168;
        Wed, 14 May 2025 10:03:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7548d29sm101268635ad.35.2025.05.14.10.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:03:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 02/40] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Wed, 14 May 2025 09:59:01 -0700
Message-ID: <20250514170118.40555-3-robdclark@gmail.com>
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

Eases migration for drivers where VAs don't hold hard references to
their associated BO, avoiding reference loops.

In particular, msm uses soft references to optimistically keep around
mappings until the BO is distroyed.  Which obviously won't work if the
VA (the mapping) is holding a reference to the BO.

By making this a per-VM flag, we can use normal hard-references for
mappings in a "VM_BIND" managed VM, but soft references in other cases,
such as kernel-internal VMs (for display scanout, etc).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c |  8 ++++++--
 include/drm/drm_gpuvm.h     | 12 ++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1e89a98caad4..f1d521dc1fb0 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1482,7 +1482,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 
 	vm_bo->vm = drm_gpuvm_get(gpuvm);
 	vm_bo->obj = obj;
-	drm_gem_object_get(obj);
+
+	if (!(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF))
+		drm_gem_object_get(obj);
 
 	kref_init(&vm_bo->kref);
 	INIT_LIST_HEAD(&vm_bo->list.gpuva);
@@ -1504,6 +1506,7 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
+	bool unref = !(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
 
 	if (!lock)
 		drm_gpuvm_resv_assert_held(gpuvm);
@@ -1522,7 +1525,8 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 		kfree(vm_bo);
 
 	drm_gpuvm_put(gpuvm);
-	drm_gem_object_put(obj);
+	if (unref)
+		drm_gem_object_put(obj);
 }
 
 /**
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6..13ab087a45fa 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -205,10 +205,18 @@ enum drm_gpuvm_flags {
 	 */
 	DRM_GPUVM_RESV_PROTECTED = BIT(0),
 
+	/**
+	 * @DRM_GPUVM_VA_WEAK_REF:
+	 *
+	 * Flag indicating that the &drm_gpuva (or more correctly, the
+	 * &drm_gpuvm_bo) only holds a weak reference to the &drm_gem_object.
+	 */
+	DRM_GPUVM_VA_WEAK_REF = BIT(1),
+
 	/**
 	 * @DRM_GPUVM_USERBITS: user defined bits
 	 */
-	DRM_GPUVM_USERBITS = BIT(1),
+	DRM_GPUVM_USERBITS = BIT(2),
 };
 
 /**
@@ -651,7 +659,7 @@ struct drm_gpuvm_bo {
 
 	/**
 	 * @obj: The &drm_gem_object being mapped in @vm. This is a reference
-	 * counted pointer.
+	 * counted pointer, unless the &DRM_GPUVM_VA_WEAK_REF flag is set.
 	 */
 	struct drm_gem_object *obj;
 
-- 
2.49.0


