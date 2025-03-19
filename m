Return-Path: <linux-arm-msm+bounces-51976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC24CA69232
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E624A466927
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486D01F8743;
	Wed, 19 Mar 2025 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzRXiELe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD41F4CB1;
	Wed, 19 Mar 2025 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396095; cv=none; b=sC4p+Cxm1zsTxxJHhrKr0Hllk6+vGy2ycZUqmOrowATqCU/VNs6hZrtAthHoWFEDWTZx3cXiFFfpXDf5uyqvjYD8itA5MJgX/7S1i5EPNl0nTGHURQEcXmesDVERW20jqk6/UPVDRgwPac5SZlIQrwh6rdE0HgG8FFM8QXJMKkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396095; c=relaxed/simple;
	bh=aSPg41vptR/fA49IY6bYFn2eKpyGI/cwfHbFUsufpLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmAktU5C3+Qke/Q/iEBDGaPKfsWZbuXpoNZI+/BIjMZIjSbH+pER9dSffjKTblJije4pRe6suLr696o1Acv1GFIC6aMCyp9GSwKtH5YENVkeKXRVYJEDgIf0imxsC0gbzN9E2Q4SPtR+Ohzrwl+I2rzwq8OisFG/KDrLUptHPzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzRXiELe; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224191d92e4so136458825ad.3;
        Wed, 19 Mar 2025 07:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396093; x=1743000893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=536eHDinsv2rHSZhePOzHHVrQvHoKFomdEbAY4A5Vvs=;
        b=EzRXiELe0SPfjUrRXg0kPbFecUPli/te5yhtkg0bc5+jxhLitvzMaAAZmf+jntB+jc
         BJsEnVO3tsh7yUWl5xkMlrbmQYmRWNtm4qzc+BwAoCC9j881zk8FYKHHifYl9tJl7OJp
         fjvx6fc6EsS68f7/jwt8hEGxmiMJ9s7QMZ4eFNnk1nxyhrW0JmU6ZRr4X4sGE5pKtFMb
         BJDYbNCWxs/dsWaI//f2L49aJMgeRhvOJX3Uyu0/KXbGeRGuQC6STx4M5PUKf4uMNtWz
         hC0CmKitYXggQ8xa/S2FCkD0JAzz1AmzIHcv21KQEe2a7iqXcd7gUbxMCTJLvqppOtRC
         b2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396093; x=1743000893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=536eHDinsv2rHSZhePOzHHVrQvHoKFomdEbAY4A5Vvs=;
        b=VAvFA93asQWsYUMlXmO5yeH9alY/uoJ6J2XRjaVGsu9v+7fIHb38zBkwcTpIOi+pDO
         /U2U1OmsA5fSY1a76zEIEFWLo2OUhJsh4/fgZGpilA74aHTb3NEX1XOGlbP4VJ1GUvSC
         cB/VO82UNQrcUs7ngU0uA76Sb2TNsNd/OlbmvJ7+zHWVHZ2dXWui00yjIvwZxgYluM4z
         6h3cf9169aBdZgutVRt7ctIaJakQeLvaMhC4Y//aPuO6tkEqNI8UOUkSTHPvrZsEgy+p
         Hu+KnElV9Kw8SgyYq4SHekOIc6sGOT+JLOyyMUdkgvzCr+iNmlKtg3TbmeTFf+0KFmbJ
         6CrA==
X-Forwarded-Encrypted: i=1; AJvYcCWAhNdhc8wRFbBLldgwvECvgrdKgUCLaAyaWhI+I1qfW5GwF8rTX5rVgC0lDHgdwPdfqlqIQaZOCI8C2z21@vger.kernel.org, AJvYcCXZcFLBn6c+bKGtmrOg+Vh0h6FwODlUhw54+D2vkFtPzn13ArSbmzTss5YYmJtBCxjFN4aXllmg1nnKdowT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bGO6jvWLhbVbQ4hqcVk1bXETT3qUsVYyTl835+8kg6CC8cI3
	SgZMPJAswCVBcgzM/81YcPGB2pT1xvnijWoRzzosU1iqmV9Yc/yjPy5NIA==
X-Gm-Gg: ASbGnctBE4doTNsV9ri/n7QRPyJrOAWYPgsBNOTl6qd9nHDdOClj0V6+DKFLKZUGQyo
	aIRUFb37XgL9S/mWs8wc7bK9nn59iEgtNGDRx2wsgQke9KarbpSw5exG/S13dkejY1FD1IYMbGX
	W7kXrxyQmm62m4kmsCQvCBfc/7oWXXEZ1JAUkIvP6TLw5XAVmEnek8tVsBTwLyn99Ej4ZiObnj8
	QCJ8n06hzD6ucICC5bVfKeTFm6NJ2jt8ZgV3l8g+SuERdg76CYAvo/eNrYffajX292BP+Zz52XE
	Klr8NzPeIB7OYUQIq7wgAvGetnRatLzu7WCGjAbvH4XrJ63JlTgH1Mntiqf5bu77QqsOAWsiusR
	wunuhDP6PtbocdfOvrhM=
X-Google-Smtp-Source: AGHT+IHjbDJd+YwV/LQ8c+2MFP6BWpYrXhPpV6rGxA6gur8Vc2Grke7zFns7JUKb3AONdquwD1Yzig==
X-Received: by 2002:a05:6a20:2d23:b0:1f5:93cd:59b5 with SMTP id adf61e73a8af0-1fbecd481ebmr5327032637.28.1742396092914;
        Wed, 19 Mar 2025 07:54:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9e5d47sm10937642a12.32.2025.03.19.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:54:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 03/34] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Wed, 19 Mar 2025 07:52:15 -0700
Message-ID: <20250319145425.51935-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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
index c9bf18119a86..681dc58e9160 100644
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
 
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
@@ -1519,7 +1522,8 @@ drm_gpuvm_bo_destroy(struct kref *kref)
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
2.48.1


