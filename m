Return-Path: <linux-arm-msm+bounces-51977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C27EFA69200
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 893197A58FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39E9205E3B;
	Wed, 19 Mar 2025 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdfXlEy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E304202971;
	Wed, 19 Mar 2025 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396097; cv=none; b=DNGN8EInhXmTu4ynuBbLiru6YAR4LXiR6ojJf5+gJIssZWsx9ik6su5oR7404hQiu0HdYBQeVwIMswWHmrAEoPhNWKcMeGhM0AxnAFZ5Fo5KAFZb3Zhen0Rr7ZjU+zZB9AYLYeoo8ZkXjZZoQuBlZwXgzb4Jf+znJoDzOFJ+iSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396097; c=relaxed/simple;
	bh=+eT6Npsr5SHhPGIxCHZJzJkTKBj/gMBjlmVRlM7dxPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVE6Hy/ImRlSdhs7DJ8gvvlhlejO01QPL0PbDuupss9Q+g8NzP6xYAk75Q/lCTJ/ZFjy8gIYIvNfoYWYq0duTSJG418gORHg5rpRLcEdjh127Y4e/UrhmQzMxl70DAMqjpUBIiulUWh5ONoU8INvcvbbWk0SwW5qUiMz49AiZno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdfXlEy6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224191d92e4so136460365ad.3;
        Wed, 19 Mar 2025 07:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396094; x=1743000894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ34MCNZ44HhyvI9do4wVGRSqo0NC+oGwftYrjB8b3w=;
        b=KdfXlEy6cmmdcW/JnIDi2y9a8Y/tOp2mx53oICoifG/KkCRN2tqsaZGrcLz5ERBlbj
         WYYxfvCEhUttt2U/MT/uSWaTkWOft5/zKD19/jFZN6M7BTE2pgGmNwE0T1XILmtIo6IB
         hMEidfXB9E9HBdFds3blSwCzfuCO5NJd+bH+f4SwP9vnxJoFE242K9WnT2jGid3Sszjd
         MrwkaMtcGx/IZOa3/mfWsVKO/0bX5qa6P6XAaVe7ZYL2IQE2/1A69z9dN4+XKrXggBRZ
         XBH8Ndbxjc1ejOMfWgm2dR6ufQjXKZBQGNkmR84eaNkRrcXdXU9XlhDFofFqr/P6Gs3c
         i2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396094; x=1743000894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ34MCNZ44HhyvI9do4wVGRSqo0NC+oGwftYrjB8b3w=;
        b=h8fV7m2e08QYMUvEi0x2YisnAVL4WVDFm5Iem4m6L1moerq4xQeeNKmJQBXuaVFpob
         /D84GBnglkvEUxHiyON4x0yIvnjdY6aMOpaQ4V2FlF0oOVRD7wAsN0HwN0m4M3MIK3FV
         +zfOO5jrEaeEcmyDouLR2zo0zMfYCVbvMioUvWzGnQ34gNMqMkcFuWIH643PxMKbPjqP
         2bLpiRU8bboo9Hknd/DSoPQIUrdK0JMFGhXDoVk5VI4lHIPHfpjGy4EUXyxfyuLw1/ne
         l9MqHxXI3qykU5LZysHGsL7RsHv0iarZIT4boZkNOD3os2wfK6/uEmyYeLUhOy3aFFj9
         rHIg==
X-Forwarded-Encrypted: i=1; AJvYcCUYc0wAh5QtYYtOG/ngbps5lZ9iSmFBFDNN1SiVcnWKvKGIrbI9bRQzWdShLlZno/s1CGleyV6H2JITqWhQ@vger.kernel.org, AJvYcCW4KJIq/HMEinmPt7fTbP/DPP+41KmTg5bi01w74E/oW84ogsEUDGHNmiDSbG/VjV6EO82taS5+bl8+0pu7@vger.kernel.org
X-Gm-Message-State: AOJu0YyV2cjg4wwIfWaqcNNFRj3bb1dDZvl4+gkPaVYRPMrUJL5xwzvc
	T1/DdwwQpwZny7ycEliaxN25fzJRQbzjQHjWiGKKLBABo9leL1YD
X-Gm-Gg: ASbGncvwK4lWL1i37c8wt5DwtJA9HMC7n2/7qHCbrXxgJFMGm42c0Mwc95exiTCUgsq
	4ms6Ey2EZnVm/tm/z3B1AUVTADgCAGz51FFNgfFzaUmg8B6dQEkTxtuhtbbiZzHG1bGaJriLRrJ
	wprJ+q9PLw/yqgyB3zMCTBg7ANHEPiba9h3e0zlOt3b2USXL5eX7wh7Mv70E8yToqjdrQ0+SBDQ
	elMAohA+xYyEiyFkGe+rU0vwvcC3UKTEc/CCwleBMWM/EP+8FvIJXiIeFV/SYppXXtxXqaF7vAM
	6VFY33zRY+oQnk0IM3Tw1hod1l2oGI23bx2qN/WWMFkKbXWLHCdd8+VC1xBG8nCBIhroqOWZxaP
	RHUocZRdDT+2cYWJ4KH0=
X-Google-Smtp-Source: AGHT+IE6G7DIcnAdTSdExbPC+8+93hGLx1fXkyPdgmB7cZhx/aYrLajLhcpobRKo4yKxYRpHbccXEw==
X-Received: by 2002:a17:902:d50e:b0:223:628c:199 with SMTP id d9443c01a7336-22649cc360amr41186675ad.52.1742396094339;
        Wed, 19 Mar 2025 07:54:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c688da8csm115390165ad.48.2025.03.19.07.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:54:53 -0700 (PDT)
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
Subject: [PATCH v2 04/34] drm/gpuvm: Add drm_gpuvm_sm_unmap_va()
Date: Wed, 19 Mar 2025 07:52:16 -0700
Message-ID: <20250319145425.51935-5-robdclark@gmail.com>
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

Add drm_gpuvm_sm_unmap_va(), which works similarly to
drm_gpuvm_sm_unmap(), except that it operates on a single VA
at a time.

This is needed by drm/msm, where due to locking ordering we
cannot reuse drm_gpuvm_sm_unmap() as-is.  This helper lets us
reuse the logic about remaps vs unmaps cases.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 123 ++++++++++++++++++++++++------------
 include/drm/drm_gpuvm.h     |   2 +
 2 files changed, 85 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 681dc58e9160..7267fcaa8f50 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2244,6 +2244,56 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			 req_obj, req_offset);
 }
 
+static int
+__drm_gpuvm_sm_unmap_va(struct drm_gpuva *va, const struct drm_gpuvm_ops *ops,
+			void *priv, u64 req_addr, u64 req_range)
+{
+	struct drm_gpuva_op_map prev = {}, next = {};
+	bool prev_split = false, next_split = false;
+	struct drm_gem_object *obj = va->gem.obj;
+	u64 req_end = req_addr + req_range;
+	u64 offset = va->gem.offset;
+	u64 addr = va->va.addr;
+	u64 range = va->va.range;
+	u64 end = addr + range;
+	int ret;
+
+	if (addr < req_addr) {
+		prev.va.addr = addr;
+		prev.va.range = req_addr - addr;
+		prev.gem.obj = obj;
+		prev.gem.offset = offset;
+
+		prev_split = true;
+	}
+
+	if (end > req_end) {
+		next.va.addr = req_end;
+		next.va.range = end - req_end;
+		next.gem.obj = obj;
+		next.gem.offset = offset + (req_end - addr);
+
+		next_split = true;
+	}
+
+	if (prev_split || next_split) {
+		struct drm_gpuva_op_unmap unmap = { .va = va };
+
+		ret = op_remap_cb(ops, priv,
+				  prev_split ? &prev : NULL,
+				  next_split ? &next : NULL,
+				  &unmap);
+		if (ret)
+			return ret;
+	} else {
+		ret = op_unmap_cb(ops, priv, va, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int
 __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 		     const struct drm_gpuvm_ops *ops, void *priv,
@@ -2257,46 +2307,9 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 		return -EINVAL;
 
 	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
-		struct drm_gpuva_op_map prev = {}, next = {};
-		bool prev_split = false, next_split = false;
-		struct drm_gem_object *obj = va->gem.obj;
-		u64 offset = va->gem.offset;
-		u64 addr = va->va.addr;
-		u64 range = va->va.range;
-		u64 end = addr + range;
-
-		if (addr < req_addr) {
-			prev.va.addr = addr;
-			prev.va.range = req_addr - addr;
-			prev.gem.obj = obj;
-			prev.gem.offset = offset;
-
-			prev_split = true;
-		}
-
-		if (end > req_end) {
-			next.va.addr = req_end;
-			next.va.range = end - req_end;
-			next.gem.obj = obj;
-			next.gem.offset = offset + (req_end - addr);
-
-			next_split = true;
-		}
-
-		if (prev_split || next_split) {
-			struct drm_gpuva_op_unmap unmap = { .va = va };
-
-			ret = op_remap_cb(ops, priv,
-					  prev_split ? &prev : NULL,
-					  next_split ? &next : NULL,
-					  &unmap);
-			if (ret)
-				return ret;
-		} else {
-			ret = op_unmap_cb(ops, priv, va, false);
-			if (ret)
-				return ret;
-		}
+		ret = __drm_gpuvm_sm_unmap_va(va, ops, priv, req_addr, req_range);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -2394,6 +2407,36 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
+/**
+ * drm_gpuvm_sm_unmap_va() - like drm_gpuvm_sm_unmap() but operating on a single VA
+ * @va: the &drm_gpuva to unmap from
+ * @priv: pointer to a driver private data structure
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function iterates the range of a single VA. It utilizes the
+ * &drm_gpuvm_ops to call back into the driver providing the operations to
+ * unmap and, if required, split the existent mapping.
+ *
+ * There can be at most one unmap or remap operation, depending on whether the
+ * requested unmap range fully covers or partially covers the specified VA.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_va(struct drm_gpuva *va, void *priv,
+		      u64 req_addr, u64 req_range)
+{
+	const struct drm_gpuvm_ops *ops = va->vm->ops;
+
+	if (unlikely(!(ops && ops->sm_step_remap &&
+			ops->sm_step_unmap)))
+		return -EINVAL;
+
+	return __drm_gpuvm_sm_unmap_va(va, ops, priv, req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_va);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 13ab087a45fa..e1f488eb714e 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1213,6 +1213,8 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
+int drm_gpuvm_sm_unmap_va(struct drm_gpuva *va, void *priv,
+			  u64 req_addr, u64 req_range);
 
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
-- 
2.48.1


