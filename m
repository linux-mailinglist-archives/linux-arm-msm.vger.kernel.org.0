Return-Path: <linux-arm-msm+bounces-58545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF8AABC6C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1A87A1C8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4CE28E57C;
	Mon, 19 May 2025 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rq4QTDYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E9A28DF4E;
	Mon, 19 May 2025 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677526; cv=none; b=MppWhNC6Pok0JMAzWcr0WwH4h5OqlNIPdUtI8Kyx8ruUaB2HESnOU8Ts7eoc4/N8GaqZTlWD6qMJJ/Tww3ozgzKbg5WOMFLltAmLlO6G+T7DotZzzT6IaMAcZsCfqrzOlspN5mSXdlPHWv19VZUFKuW/dDisFIMmIkl2t5K5c/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677526; c=relaxed/simple;
	bh=pnQLoKZ1vywrckNj3NloDzeebCX7xk3jDKnHs/ziE+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=demKfXmd3uf03JeT6EBvbWTHjVwSJc0R5NZN079QXOlJu9N7S0AEquEtvnRv0WWGEebE2uprr+KY8r+hxChdiy5+qxYhmqAW+kKRm78F2kJkujj4M6tYLGGtPs2MWevhEvpU+zWFg0cRUbe97W3ikJM2XMaLWpCuNuFepD5TTcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rq4QTDYN; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso4321484b3a.2;
        Mon, 19 May 2025 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677524; x=1748282324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDifTqtGVvkdBFnZ2aqlffmPu8mY951wNojwhaWPbg0=;
        b=Rq4QTDYN9YuvtRmWV62DPkNbJbfUIgmQbePp/iBVPIJo2PgZD/LbZmy9+YyPNWBon0
         D7cIp+nTFOALoYRBbWvhV/mXYVssNZ/55+f4TcK10jhcIzb+Uw+n3WRZ5zGJrqbrcJCf
         kafGVQUGwV15uR5ELsX3hMVpp5HTLHt3l1WEszW1LlukN675iaigaBdsUmxyOZaw6bUN
         GzdYDPJBv1FLIwaA4UxHzP59heVfQqE6BACm/8rE6quE1JW0aaQWYo/io/tkE9oboIaA
         igrmvKQgCvrB51E3pkf6cx/DYaywljzyWWMWypYvc/sFx4TZJTVNdvziDswiVayzqUTe
         O9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677524; x=1748282324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDifTqtGVvkdBFnZ2aqlffmPu8mY951wNojwhaWPbg0=;
        b=n9v5mdNs94he45Ov1KkDAgLTee+9e0irfJnZIisrOFy1LMNtSRKWFOTPrX7m5Cx06U
         bc970+HWgWQWAOnqxrdvQjKP5QadOIG2J/q3OjFe6kX4AVt7WK/J4nASrsf+yWePrvSa
         ls9WVegMQocIq47FJ7zE5/7vqPhyECk0s7UDh8KsrxVnXplOCZ3ThcWBKkXvJXRQM+Kv
         9txY4YVLwXMgCm2kCgh39rjoF7TbkdawJ58LBSP0mMOL4IceTIMIEcaC9q+kB3jOYOt3
         A8F/DEoQPksvMJ7TitbRfxQh7oN6sLwwNbPNHxKx0sk19dLEbR7nU3zf54kvrU2pJ1l2
         X08Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDehDamlksZRJlqOUATPktCYz4SWj3+ZPmZC/dc/4NRdvAvT1+n+wZ1sF8sGn/B3Lu6lh50S2sAtPrKMvE@vger.kernel.org, AJvYcCXlfPkdxyqRxDtrf9XtLn0KB4FiPz2HXgEp3qUgrWEE8QlQnkZIuBZuv1qK9eh14WwWMBmVOLia2/Inu9tB@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjuakrSv+VqDOK0IcSNU7QHAA+dW8y+81YIWrGhpwQBrgoZSs
	Q0/ea/z9rKm9HotAwYEM3ibRuwEwiFl0FkiDFTPK8Vh90Wyr++6Eh93z
X-Gm-Gg: ASbGncvwEKrQJZ0JWps5Tx2ZKbkgluoyIqEi89jFYhexO3c/gVFKMYWCdGTDOtVZjZA
	pjZa+bhgTRNP62GXbnDECLyKXdv9CBW+fE2tyEbYuJt4e+ggWVwocAviXHqGH4zi8LthsZKcSyW
	sDilwI16NUtP7rGab281Hk95Oqy04MP7ykvhcTiZQZqf/ZqVO312BNXYi6TgSdZ6NhIMz3CbMEq
	Lb5+9OH7fUrkiiKq0YqmBDHoPkVIUlxQuLqfJhUb6TDXL5mZVYq89vrRbuP7DXfXWql2FSBYHZ0
	tAgEZrDTP5MaoBnoqVKFwnapefl0jQdH6fDcPKdhlVmwOt+CO1Pmr0Ulf0oSawvgPAqf2XvxPje
	Ng63lQ/3k7yvkfCvBTW8QfbDzzA==
X-Google-Smtp-Source: AGHT+IGmYHPRNVkZlfycSsEN2aiJ8PCBCc4hbt1q3NPUc/bEuyH3gRv8qHnGFRo+5j3JGV1XMEkfZw==
X-Received: by 2002:a05:6a20:d705:b0:215:de5f:febc with SMTP id adf61e73a8af0-216219bd5fcmr19558870637.27.1747677523827;
        Mon, 19 May 2025 10:58:43 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876788sm6488742b3a.126.2025.05.19.10.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:42 -0700 (PDT)
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
Subject: [PATCH v5 34/40] drm/msm: Split out map/unmap ops
Date: Mon, 19 May 2025 10:57:31 -0700
Message-ID: <20250519175755.13037-22-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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
index 73baa9451ada..a105aed82cae 100644
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
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
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
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
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
@@ -42,7 +88,6 @@ int
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


