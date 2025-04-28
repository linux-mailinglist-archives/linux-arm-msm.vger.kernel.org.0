Return-Path: <linux-arm-msm+bounces-55949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147CA9FB07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 376251A8565B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1EF20E031;
	Mon, 28 Apr 2025 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iebi2syf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C33207A18;
	Mon, 28 Apr 2025 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873796; cv=none; b=Oyu/FbcrZSqoCRvIO8EOXstQtbwMl/H9tGrJL4V3xEQw4X32xKqBAxaro/feblW9zQIwsyh5THO1I69dVjrJDl00WJ77BnEF87ogS3Gzygh9NssV+GQOstllgfZhkZzZCrrh2wue8WBQNKBhlDQJvA2w59kgtg8DhD2GtYjF1Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873796; c=relaxed/simple;
	bh=SQFEPFoQGPBF7guU+5g4MGv0tYihRYeOe8cgvGrERpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmb+NzBJJ8kCzww1GCkNGmC173pa3clf/nKA2pzJ08+YPBATwCpDFI2cN6WlYYnfLDz5JdKgZBv8s/mE2Qyc+1FkkPgmbt0+uZrdcDiZiGK8WHG2/daJmqfxDfgNauJtQSrluq5cs9B0LK2DhP9BBo3CkDKf8WZstA5otVqjT9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iebi2syf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223fd89d036so66146895ad.1;
        Mon, 28 Apr 2025 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873795; x=1746478595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
        b=iebi2syfYHplJwQfn/1WXaZdwzRx/DB16v78F3G1MbKaFa8LS7d/ZGpGLtr+/iA2FD
         k25au2Oz61UMY25LShhR2Cll4c3W25vo0tPgeVbpWXH3r4N/UxWFAzARkrqkMBeSgI8L
         FbW6xQPTrkYZpuy7Tf39q/o4vnQVMMdY53bwwxFTF/motM9hDTvaacoHxh7gNtw3ihml
         BOVZOTo+KHHGizClpEWbHUFfo23PYyzpVd/sWnZCIcGWiEDWFfesT0m04iBR/MI+0Ns/
         nhpQBfBSArchFzESAF8Ln3lFq7JrzzsYvcSNsFPM4JrGXAuNiiCYjYF0YCoQ33d/sfeS
         OAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873795; x=1746478595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
        b=udlv3IXLu1+LnRJ/8Y27GzaNtQkeAYHnaJdBmh3ZtHqiJ8nK7Qc11jioYqK0D/bj+H
         97FGnB92V6Krwwogf6JIxU0ajjdNCom5RvqCVgQvTrxea0zMbVgOpxQCjo5cG4T8krk7
         Qcx1PvPnjhECRWTvioH85tpdEn4n5lQCz1ppc6rAAIQ27JUAR8tgaG613JuW33pdu+iP
         UNZNnbrNyAjMAQdf95GA3QWzqvWkUkEmMSs7bd9OqNhBy5fO5HEGJ7RziOpCOT40VNmf
         3OUuHD+plLCu8dhlKQhLM++TvVtcnwbCEef6iHH8FEy5rKb7dVaPrrST/W2s7S0nKGbk
         Bcbg==
X-Forwarded-Encrypted: i=1; AJvYcCWx6MkPmev1bofz27MUIQkjMH4yL7f6EiAFSPhQEJfnVt2R1/HSbNM2AnyfcywAHkI3Qlxu21nJv0/Ie3Or@vger.kernel.org, AJvYcCXtSxvdzCsG1+EjeODE5uiIc+hrf006KWAK/ipulRcT6m0JVM/FgZWxLZal0H+3VI0XAa9ZiyKVkbLOvyRS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj3sUoGnISN8ziHib2TYTWUxoqr+rqX91tvHh0tU5Pw7QUvdnE
	gcyp/UUj2u2oLc+p1Ld8ilEk+aScqlb30FqMjgEI3Q9k7yi907g51lXugA==
X-Gm-Gg: ASbGncuB5dT2rq0ar+9cIe6+G4OuRoPs30CkxXrxMqHYzGc2wzo7HJrQ0Nlvz2pQl3K
	DtigsuV775fA/KgaShYaKVrhbdkfjIYD5yGB1I32XlilM3hm1gPmniNhMQzNOpg7aDzi70V+xPu
	O5CDY1jWD6YeJM4WOH2KNh0ElZBJ0ZCkju/UHf7RpiSBoBtnv62ODDrUcN0RtltlbXvgwP67K20
	hJJVJORYa5RVZdGgYst87lu1os2cEHJu1N/f4JKCBY7R5DoRxwfqTm30e9i0hqd2C8dkKe4BPfb
	KbifgNcVzUqzmPr5RVNXSKK+Z7U+zseVMht1bLYvkWWNsR5ubbIQtSuVOtOstKOkb1yZRCSvpMT
	S2sIAgZyTO47HnuQ=
X-Google-Smtp-Source: AGHT+IGHS/bF9Co5qgug/OnqPeg4Arjq6RJlRxQJskHgD/bjb7pncc78mBfMXMNijqkOO7FjoxdxRA==
X-Received: by 2002:a17:903:228a:b0:223:4d5e:789d with SMTP id d9443c01a7336-22dc6a0013dmr161266665ad.19.1745873794730;
        Mon, 28 Apr 2025 13:56:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm87952955ad.180.2025.04.28.13.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:56:34 -0700 (PDT)
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
Subject: [PATCH v3 02/33] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Mon, 28 Apr 2025 13:54:09 -0700
Message-ID: <20250428205619.227835-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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


