Return-Path: <linux-arm-msm+bounces-56542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C02AA7804
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9E71BA6500
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A689256C8B;
	Fri,  2 May 2025 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtHNbaA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060251B4240;
	Fri,  2 May 2025 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205642; cv=none; b=PvXAgLskCr0RNim20BYTv1jOY7qq0FaS5ThT8/yoY0zNoFK3zz/aT+limsxHYsExisz3pKvVOnciXPweqzpHpXtdAPxwphRQhsdpmn5ZCfk4Tc1PbAIGw7AmQOOsITZJQoqYHfdBfpQub+1ceP3jZN3Pv/h1PSUS2gQKlw5+RGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205642; c=relaxed/simple;
	bh=SQFEPFoQGPBF7guU+5g4MGv0tYihRYeOe8cgvGrERpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c28G3r0of2KlREr4xh5oR6TLp1d12CQJEQboSLULBlIV7BOjpsVa7FxOIXZmMm2bcrGlWqxDggp+cc8g6dWxcR0b8DFceTFHmHmZIegNtZt5lrzC8jdXdS9rB+QeeXAHS/9SETVGVJ9Yi4aVDJdNh1o/qfoFfSvlTSX9XaeC26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtHNbaA9; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73712952e1cso2551147b3a.1;
        Fri, 02 May 2025 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205640; x=1746810440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
        b=mtHNbaA9vPhT2lwVPmKfneXIGLiSpJzgd2g8U69ae3srO9LB+2y0HgoMFsJqTzxKCL
         SotPXtjKc1Aa682vylyssFD9hgDQfegqWDxDSrbGzoLuqO9UZGtTv1ykRhhM5RPfRWdM
         4oOFmMcJxzMdOMvjjb5f8bLiyu4DwSl3GKoxEXNtWNOUyIunLbYxYOOWeKcsVXBla7/Z
         dIwv6o7qVnvZ+U46xOjdyCak6Scfx3aD+7ir1/iEx4tSnw9P6UUT4keuq5y1fOzkMx28
         qYgoiRLnJ6XHyXexQ/XqGUjrTvXAfhwguaYN0Wkrr1+lUdJLXS+PRMCQLdpT7GSWMxP2
         ZXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205640; x=1746810440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
        b=nJKDQAUBAZnRQyWS5Gxin5xnu0xBGXEAUYOoA31ILU6EeElEA3PZB9rfZefK2BBFQ/
         fgAcsb/Jzv6yJlUPqGd7NqVvejQIegZMBbuRsW5l2fcMEQqQApGWxN0/l66D1eNIEyCJ
         MeyZ/Q/Wp5ZNN6HNkTZQXN7Pc5CLfpAv2Y7OQzu1e4ktCjtZLEauLR+byM3H8ep5R9Gj
         Nt8LWrp4ML4Ul7DFDugoUjNYSUzXFD3c3Yr9Uz3m/q/t8dvY3N6XI8FcaCblze/jkeZh
         rbO+MTpRNQ7WBuPJMiIPqgW5aER31D2uIXe6o7MpgM53rcGCd1VldNFS9BlwW+v0cCTQ
         jE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDPnteGDVb97t50Dsohyf0QOeGnQydWfbB01wVQlJH5/8XMfsVy58LL4suapGL8jpXbVCFFV6h+PH9xegP@vger.kernel.org, AJvYcCXqpT7rXzQQfb5O7O/h5IPM3ma8YXW+xxSbv4+lZsiBfF33jueUlZrTtgoWuVyDJu4WkjtIRja8YIqxtWJh@vger.kernel.org
X-Gm-Message-State: AOJu0YzuIkmvoQZYUs2bKfv0KsnCgOFSCmlJVWpLllxJNUgfG4hyOFeV
	lyMXGGf+6spVmrRUa66wmUk/6NWTDiZOh7P4y41RSVMHxEUa4Sx3
X-Gm-Gg: ASbGnctneWhLE4eWYzNiMUByJOhuC4J+4CcDzzErorG7+6N0XIh0Yku6GzniJILRyHk
	nQiRyXa5AhFGT5Mmkm91+2TePF8jFxseW52zBmcLJXRyslANnrBUAxPuRWxv5a+ASXmydbS6/Gv
	ZQ/ItEIEhqGXyI+5LSh+/XKEUUuObISFRtlLIOywysE16PAm35YsAyGueGD8CGmQ9lcMVB28akU
	Zy8ooAzobfhoBNvX15muucQzJhodj5X2F8lo98KdGDk1ZrcJ8Nhrm6OeP8Mwxvzs9c+Xu/2r6bO
	D1mhjtZkBYJuhBTawqWNyEp+4iyegaFqoAVoIpjfwCKN2ekYJhVQVV0aNeBjOgHbP6sO4Im9ueW
	4rMdOV/89QG7K3KV1YZeqIKscQA==
X-Google-Smtp-Source: AGHT+IFEeJZ3EnWiuIxmkOqDMcisii9mSXm0kF7CDAycTQSMIVM4WTw7dB+vLcm9L8fcoKnbJ4xMUA==
X-Received: by 2002:a05:6a21:c91:b0:1f5:8e94:2e81 with SMTP id adf61e73a8af0-20cde56a4abmr5248023637.9.1746205640139;
        Fri, 02 May 2025 10:07:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3924df3sm911815a12.3.2025.05.02.10.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:07:19 -0700 (PDT)
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
Subject: [PATCH v4 02/33] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Fri,  2 May 2025 09:56:29 -0700
Message-ID: <20250502165831.44850-3-robdclark@gmail.com>
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


