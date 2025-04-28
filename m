Return-Path: <linux-arm-msm+bounces-55978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A24A9FB72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D7D4670EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9EF221553;
	Mon, 28 Apr 2025 20:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9GXXwtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533BE220689;
	Mon, 28 Apr 2025 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873879; cv=none; b=Qgk3o1aJ9GW5f2OuRY/kIIl8g6mHV/DudmTCt/9YH4V46EprOc500ewJGvpCBPD8TiJCwx+A/S+wEr9aS0o07CV9MmFxxHMMcEaWqZyI7ZMQCQWn0n0xO7SsVa5oAXUG4qswxja1vD3bKc0gqvax+adt/gjUXVCriC51NHPIBS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873879; c=relaxed/simple;
	bh=Y7N9D3AqwmbVRrFjdZfLrpSxWYVPS3z+OQWscGVQrX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gyVwrnPscV+Vejc4Qbh146C+UbOq642pQm+MVZH/XViZz7YZEwMH6ZIGoAzTIYC7KgWA5v6kviPGmRaY3SmDgiE8JpAC00ErJ+5oWLXmdeQmJ7wrVhNl/guD5AcbpntLIlLhjUf45DX2MaCXVordPDX6WPrqPJF0qm5QMZPGuLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9GXXwtt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223f4c06e9fso46206595ad.1;
        Mon, 28 Apr 2025 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873877; x=1746478677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQFk0+P26UJGoHhif9JrfChUJ94/1exWaUT0hEv6Cu8=;
        b=R9GXXwttXQsIL+bKPwMlLax2WB9tTmfAlSpflvD5Uzz6Gst0BUAlvfXPbqbo0K2y6z
         SS56bElXn7bbN3oRBMfQYjwcCLq3S+P/3MMbEZ4NMf540ANVw52KvmcP+IxUKlFPMNXV
         6f9H41owY1y8bispY/rrxoDxOtjnspRdawcLrjsalicLJT8CuNJGmlTobBZ17XPtXLXA
         f2a6KqtXbORrUtVnrn5I6cwcPU2TDSFDM2kE3O8NO7C9vEeKFcl4Eg1QKZB2q2v5Yrtr
         F/q4O6GX+ULyNrw3UK1L2CgQo5KEeZbBrb/o2hE2r5nQWfakAzPD10YuDA2CJJ+c5BDt
         YtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873877; x=1746478677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQFk0+P26UJGoHhif9JrfChUJ94/1exWaUT0hEv6Cu8=;
        b=jELTqDC6DWQMaCips4JQTlmF49i9PytO7wHTT3vw8kcGTna0Iw944na5z1g2kqtSi3
         60G/duKjmyoT69an6BPuGuZtGWsB7f9/p2tGKK4Ry6oSycV8KP5te3lpouLNhs6G03Jf
         B6VmZjU9QZzEkkwjE3miQX2BCj/E5cJFKb94iMCkz0lWxiZM6u2zntoHWTGAzZAsaJeb
         YGWLUoGAfZPv4+wGYI7Zpm2hovgnLLb1//4jLzjASMrFpnba3udlNnaQMfgQVQ06dy1y
         OPXaYAzyMEFtzn+EZHs03Jl+c2Iqx/1JNkul7RMY99BDAFIDp5XHmSJMheeOX2InHYTe
         m4ag==
X-Forwarded-Encrypted: i=1; AJvYcCU2Ee9mXsIbWBu6/EWBvOegzcswm2Zeig120CjDhgloAg6/cT9mnwPNzQh+gy9YkLWUNin9uQecqV6ctcdz@vger.kernel.org, AJvYcCUmn004WT1ijIWuqAracNFVYwPkzuq+0qQY5xYZ8uOIwtoP6KoENRZsVT/1WK5ulEQzIcYsnosc0x8hRCPU@vger.kernel.org
X-Gm-Message-State: AOJu0YzhT0ORLoZlFcb6xhBIwAX0Z2ZWGhX6RTRd7pT/HMAC7e/vKead
	3gHxm2LGA+dwFeXHrwihCC5jjQwYDwpm8PIiv+6L9tAEetAxpMeV
X-Gm-Gg: ASbGncv5EsiyEFN2mOyvfh2+qbZvAgbK3ZXJyv4IVfxS8iDeWpMy9HPXl+3BVkFF0QA
	tsUaMgaBnsc0ItUVWqf8Sm5K7sFtfQkCuJlYClBRTRSc8woZLU9V/EVNFG9RSNDkOcPRf+A3uAZ
	Ilhg2CmzuMuBJrWGr2Chari3Q+gNkq8vi37vvEFY6ARoV9s2rdLVuTQVmLCp2mve8zlzAlopZdE
	nzKwHxu9I7j7d6+cFW9bZdbBAZeQPlwMs5klPOgNlmg/KZ7FeX4u9I5iqpUAmNeboUtyQel7Ixy
	bpjVsSy9EpDbbGHmqGpk29uUhesy6JKxjND2fIeEdRuDClUz9Q5YDeR055ef/LCDTAhon0Bo9/6
	8u/tpiu7fiElGVVs=
X-Google-Smtp-Source: AGHT+IE/5MBghR8lCcwkhn9gu+bFb0HxyDfSrDxq+iZbaqNrfylG0qsuY2de54f6ebqIP7/HFBTPEw==
X-Received: by 2002:a17:902:e80e:b0:223:5187:a886 with SMTP id d9443c01a7336-22de6c64cbdmr8614175ad.22.1745873877504;
        Mon, 28 Apr 2025 13:57:57 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7676sm88327525ad.137.2025.04.28.13.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:56 -0700 (PDT)
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
Subject: [PATCH v3 31/33] drm/msm: Split out map/unmap ops
Date: Mon, 28 Apr 2025 13:54:38 -0700
Message-ID: <20250428205619.227835-32-robdclark@gmail.com>
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

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 5b8769e152c9..f3903825e0b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,28 +49,45 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
 
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Map and pin vma: */
 int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.49.0


