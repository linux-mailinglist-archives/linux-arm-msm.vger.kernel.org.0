Return-Path: <linux-arm-msm+bounces-57902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF5AB7364
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 057664C0AFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F58F283FF7;
	Wed, 14 May 2025 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTcAv1LC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA1283CBE;
	Wed, 14 May 2025 17:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245360; cv=none; b=HjEmcvCDdJfTRDPDRmKmb6Z9VGBoWVVswdaraLxGA8HMmezqOTKwG9hxb38qSYWvN0stNqYdLktweynxWAKqGf0WT9Csss9qqFdS/kTYtHICP0JBgsfe3xU918mcf6IHWP2/sMTjRMxydTgvE009Kk+zbKtkHWsuhw0orZW9FMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245360; c=relaxed/simple;
	bh=SQFEPFoQGPBF7guU+5g4MGv0tYihRYeOe8cgvGrERpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9KqcrGvD0fM0u2h7e1aXQbUbOq0oGSasEd7zWQ9NBmOjsFhLivRn2VQ/2dfRUjAz3lkX/+re9nGEoK5CCo3vVK4eLNso3M7NasaM7Y6UOq6oQ0f/kjjDsSAN0v71Y0aNzF1hYG+EyjgKVJkfo84ubSU9yN2g4Bpy9akJXT2K1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTcAv1LC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22d95f0dda4so1356305ad.2;
        Wed, 14 May 2025 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245358; x=1747850158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
        b=dTcAv1LCmgWQ4EnOR6GxolML6og3K2joZ3QMb+JWqnb7CtjUPlte5geFY+l4KEyTUW
         Ws0SVfKEQ/LZNB4qqB7e+/1hyFM1Q0ZSQQ8flQQUWduKxGx6yb+NIQLw05p8gGyjAtQy
         AfdpsASEuDv8eURcuSzxYzrt6gmJ5b7DsrIQRtqtyFHN9yxzhTTIKN2RpMgaUZI8MxWP
         yG28sEObzSinYNbBz2UFtTABhmWXkVpHVA+z6QPYvHcMy0nVK8gLpXpzECnz+RcLAln6
         GO5l8IAJUq0C96ZEOgmqUHvmiPFMm+g8zkNoGbLtxQRvfWlFM57Irp5q/za7cR4ew/6v
         z92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245358; x=1747850158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
        b=rsTb4Lbvg4ikMoJSd2OZairkWrKs4Buj0/Ky6agc+ib970azBNVTRyRjO+m7Bzswcc
         ZuykSJ/Y6U7BUAIwy+lF/0elTnjgkguUqgczftRtjnkBYTRa5OwFFUwQgNrtgFGSPWMR
         ELTQtDNfdMzo/Z+wiipd3yQKip5mS5wxWcWvE38H0OKJgLVRLvwHDuj0oLDVr6M1FYUh
         BXvSCfxd6g+HVNCahpQlEdLNWagrFCioeNn6CCvlSu7mzg3DMNMD5DfoWZPT+yGbw5dz
         D3vT+rvAoFYtSbMzrKvsmFhAwOx+mhz+C5GfqiEYcmU86KB8DMTo79OW4V26fHrAJ4qs
         8Bqw==
X-Forwarded-Encrypted: i=1; AJvYcCUaI0DpqDP1a46ZazK34s5Vnl1GO5UkOK17mRPa0o0MUxp3b49bxzVL7VeaJFKRPJN+7z24CpSMb5+qtbQf@vger.kernel.org, AJvYcCVo02VPbVpX/QOzqQDHC+9VMXBK7xNgy/7PXF1vp7s8lH2B4UYbbG5WrdpfNHSElDiwd8FksPnEvv9Cerpb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+2pAS1U9cYCpYQxKj73syN5uI1e0C8Suhwbg3VXV30rSMgOG
	txZvgRiDYGmD8TVqZRFr1gKGCWL/lkyYSSl4iVCf/16utU6hUXEn
X-Gm-Gg: ASbGncubVSiNAdSZCW47fK+jw0/qVfmrPMhUFnsISBHDxJ46xHA/1Tg1mbxYGQuysVY
	RB6OnBAv80ZUz0XuhBLFqZnCApE105z3r8MF1JMPSqv0MBeqNNn8tGc3pe5pxOzX5ihjlcAAfql
	76KZ2KpA6quNAhcFRjt4SkfLKfpxEtXIpaW2/wN+IELxuMChPK0I2mgDqN90I8kD395JnR+3F+9
	tlSaaYZtjujdQ/dWVGxeXHaQw/zhm9pOcOdVKpVRg9MBAHxTKYJEcT3/IjAZVIBgbELdJNf3kNK
	RRji0ycLd4njRVXqOZVL0oNmW42XYws5/dOBuZHZddQoj9/RFbixhap1N/dMJ41VRgK5rA6LOAR
	x7Q7MCwEldsaL/WQG29+IKMe+2g==
X-Google-Smtp-Source: AGHT+IGeuIwlbLn4XSxLpvIuoUnC0w4rSWmWToXdiOncPq/WSXq4zazqkKCjHZ74BIGTTVRJb4K3Mw==
X-Received: by 2002:a17:903:32c6:b0:22e:7c70:ed12 with SMTP id d9443c01a7336-231981521a7mr75758905ad.48.1747245358265;
        Wed, 14 May 2025 10:55:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82c3063sm101844285ad.244.2025.05.14.10.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:55:57 -0700 (PDT)
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
Date: Wed, 14 May 2025 10:53:16 -0700
Message-ID: <20250514175527.42488-3-robdclark@gmail.com>
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


