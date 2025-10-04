Return-Path: <linux-arm-msm+bounces-75965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F86BB8C8B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 13:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 883383C4E58
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 11:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA84218AD1;
	Sat,  4 Oct 2025 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZFuwMC0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461F219EB
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Oct 2025 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759575665; cv=none; b=qxgpAiVhC3FwGe0biB0qDVJ7YyX4XysdBC84xN+1jVtrroqUISX+dXuybYPeksgoAYhm3+g2/GH8RrJBDN/dWbX/9p+g3Syb7xcBu7FVDBwiCOjTMWD4q3LioL65yc+f67UVondp05INgBOYAbJfakoXJOoJbmyxHXvQAiYeYgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759575665; c=relaxed/simple;
	bh=mVhiB3XjjKvwry4rXBNKAAqKtNFxuZaSL16L+E/uJMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBUOviZAjXLRJZmbHM3QBABUw1LJDyvtcRyGL5RYcDOzBvSxHNsI7ZmxCkHNpt46nu9cJd0isiQutiD/iEH8TQYZCCQatP5NXnJusvTNgkmnA8kcWeM7q/i/5l2M4LmnvNuF1z5NKRdiv26Su3HBB0alTf6herple/cW9y+yA4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZFuwMC0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33082aed31dso3570757a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Oct 2025 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759575663; x=1760180463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCTDlQEGUynoAVbLn6xjoRk5lU8FKtAz6xcB6i4LhPk=;
        b=NZFuwMC0p4BRAMKbheVfCeyBIxhIde3fn/HwnYez4jsNqdh0/PJZ9Tsl4t1gfr77FS
         z5KoQ6qd0Qz3riApiXOb9GhdymJUqENbr/rRTRNMg3bhDRphV0RiO/L7QymqN9EgTlHS
         CAc1wgi7ael/frtaPI53b8zt0gX90ol4QEne6pNMq0xyXBqOiUb8GKey7e8tAz7PNyBM
         rcPHWE0bE8gdQBGnCL2dzQoOM8IyE8gTR7y0H+PTxw6LZpsgTIFccEheW3t/hC/PZDqM
         laOR66GlT1iDBFKYa9/ZuYYc58v5CXjsN5h4nhO7PKp+mvgyvZBJyR1EuNEnf+FuFHK3
         SV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759575663; x=1760180463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCTDlQEGUynoAVbLn6xjoRk5lU8FKtAz6xcB6i4LhPk=;
        b=l/+DgFws0yOaICIzZQ31c0BsE1m++t+s0fs3FCy2a5jRLJAcZfgHLCrKPsFMXdc8C0
         JAt82Ok7yFw3oZkUh2+MQ6+AbcciVh8WLp86f+tjAzh1WfJu+BajxQmVuJvssK05TBOM
         Q/lqMj8nTz2XQ/rowz6kNxDdvLMQpyKiY5fsFBvprXsyVv299ZuFv0PYBercN5aIx/m8
         oxW6vJKWtf00QMq6N6O1XEq3shc2e7VoM0K6g9nMsBHo2ZA7JmlDB9K7OELGh8igS3zc
         5KIpMEek46vWUc702odA3Vh/TjyBLt81eh2Sgn4unUNqcbOC8SLXVxuenKYsVsU6E55/
         WpuA==
X-Forwarded-Encrypted: i=1; AJvYcCURVGxpfgGENOyD2PmOM1fo26XyQ3HYS4aCPU8VM0G7GQYvaZlyvZmtL2ozo8kybGDOoByLMqdKz2e/b+cs@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjjBw80bAMxNU9AuQup6ferilByaBJoqaxpWa5JlsZp8XXJN2
	n67j4hGCr026e2l+q1NiwbIXQQjBtkREnFmTQLrRMU8fJfABuYCyBO/Z
X-Gm-Gg: ASbGnct/LCROO2Fj/rEp/wxR/hcqDhsFwp+Yq7GFKeGFRRpio4dZ/DHIEwQ/OrbiFKp
	IQ7p0YX8RUC/7cvPkk67WA3FduRPB3YevT/DdY0oMEp6hvly6QM6YKIZpL1yTTnQFQFRYn84LEs
	bYjn4t0gV7wqGuZZTSoM0Tue4ZsnTLizz9zbqn9+7QrhXP3TGxAq28P5eQ6CLRASfGXYl9nwWBc
	oH+lWHdr+Nd0PIBnko5ihkp3GDi6ENC0Q6jBe4BEnyHhCRg9flBtsNSsKRLcuImXnQyQ+ipIcaP
	UqSeYk754B/K+3eQ0Ioq7MsCxFAAxWD1WPxY1CZOzRnAFfYDyh/We1TwIYmt3oO2MAXJ7aZHAh5
	A59gN4x2yorkN+Xcqub7sYb3nZOl5mDer2uodCe1TY1OIkNrE51bsZECGhfgOfsbGUTD+rLmvrI
	g7EIGAsErwBg8=
X-Google-Smtp-Source: AGHT+IF6KW+o3hALRSt3TlfMffAw7CjzidHyGOok+NoPUVDP1KnNL8mme1hIyP6Bkou2nnamx1XkdQ==
X-Received: by 2002:a17:90b:4f4c:b0:32e:a54a:be53 with SMTP id 98e67ed59e1d1-339c27348f6mr7738086a91.16.1759575662886;
        Sat, 04 Oct 2025 04:01:02 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099b1cf08sm7046135a12.22.2025.10.04.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 04:01:02 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH RFT] drm/msm: Add NULL check in vm_op_enqueue()
Date: Sat,  4 Oct 2025 16:30:04 +0530
Message-ID: <20251004110044.204269-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917184616.85797-1-krishnagopi487@gmail.com>
References: <20250917184616.85797-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vm_op_enqueue() allocates an msm_vm_op struct with kmalloc,
but the return value is not checked for NULL value which
can be returned by kmalloc under low-memory conditions.
This can result in NULL pointer dereference when the pointer
is dereferenced.

Add NULL check after the allocation and propagate -ENOMEM back
to the caller in case of a failure.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

This patch is marked as RFT since the changes haven't been tested. 

 drivers/gpu/drm/msm/msm_gem_vma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..639425849d86 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -455,15 +455,20 @@ struct op_arg {
 	bool kept;
 };
 
-static void
+static int
 vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
 {
 	struct msm_vm_op *op = kmalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
 	*op = _op;
 	list_add_tail(&op->node, &arg->job->vm_ops);
 
 	if (op->obj)
 		drm_gem_object_get(op->obj);
+
+	return 0;
 }
 
 static struct drm_gpuva *
@@ -482,6 +487,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
 	unsigned prot;
+	int ret;
 
 	if (arg->kept)
 		return 0;
@@ -493,8 +499,6 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
 
-	vma->flags = ((struct op_arg *)arg)->flags;
-
 	if (obj) {
 		sgt = to_msm_bo(obj)->sgt;
 		prot = msm_gem_prot(obj);
@@ -503,7 +507,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 		prot = IOMMU_READ | IOMMU_WRITE;
 	}
 
-	vm_op_enqueue(arg, (struct msm_vm_op){
+	ret = vm_op_enqueue(arg, (struct msm_vm_op){
 		.op = MSM_VM_OP_MAP,
 		.map = {
 			.sgt = sgt,
@@ -516,6 +520,10 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 		.obj = vma->gem.obj,
 	});
 
+	if (ret)
+		return ret;
+
+	vma->flags = ((struct op_arg *)arg)->flags;
 	to_msm_vma(vma)->mapped = true;
 
 	return 0;
@@ -531,6 +539,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
 	bool mapped = to_msm_vma(orig_vma)->mapped;
 	unsigned flags;
+	int ret;
 
 	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
 	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
@@ -540,7 +549,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 
 		drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
 
-		vm_op_enqueue(arg, (struct msm_vm_op){
+		ret = vm_op_enqueue(arg, (struct msm_vm_op){
 			.op = MSM_VM_OP_UNMAP,
 			.unmap = {
 				.iova = unmap_start,
@@ -550,6 +559,9 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 			.obj = orig_vma->gem.obj,
 		});
 
+		if (ret)
+			return ret;
+
 		/*
 		 * Part of this GEM obj is still mapped, but we're going to kill the
 		 * existing VMA and replace it with one or two new ones (ie. two if
@@ -611,6 +623,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+	int ret;
 
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
@@ -643,7 +656,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 	if (!msm_vma->mapped)
 		goto out_close;
 
-	vm_op_enqueue(arg, (struct msm_vm_op){
+	ret = vm_op_enqueue(arg, (struct msm_vm_op){
 		.op = MSM_VM_OP_UNMAP,
 		.unmap = {
 			.iova = vma->va.addr,
@@ -653,6 +666,9 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 		.obj = vma->gem.obj,
 	});
 
+	if (ret)
+		return ret;
+
 	msm_vma->mapped = false;
 
 out_close:
-- 
2.43.0


