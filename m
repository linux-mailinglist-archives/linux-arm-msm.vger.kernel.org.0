Return-Path: <linux-arm-msm+bounces-51998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B2A6928F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 819D88A7B3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081DF21CA07;
	Wed, 19 Mar 2025 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM5tNO1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437D21C19F;
	Wed, 19 Mar 2025 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396156; cv=none; b=AyobxKPnxgpFsaPATPDOdliMEmL5PzpIIMB24oo9J1EuGHbwtBfeb59ysJaPhpg+vbpATr5p6yxkeppiR7B6ex2xLbVsgSK1qB4ynp9ve67nZh3iBjR46NxF9uaTGU3hsxxB+HMh/H+yZ6P9DlMap4/8StAO3KY3blecCEFEP7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396156; c=relaxed/simple;
	bh=aOgSjVOhEszlfemvyAqw9dIncr8PXvsr22O37Zn2bBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTJapPslLoS+BlQLvgfzVHh09t57SaOdx3QNrWf28f9fJKRr123YoFNgMotx9eJhPuQhabyEuYhd+yQ/oDG+DMzHBffUf1y8pveYanTONqWGgPWkdu5di19J3GVWuEM0roKKWaefF7qtHIUBUtGRJiHIqnK8j/QWG10gwoA28B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HM5tNO1c; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224019ad9edso25558885ad.1;
        Wed, 19 Mar 2025 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396155; x=1743000955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykRZx1zxGai8riCEOFUoLeUcHnk9mI1cgk2cvB/7auU=;
        b=HM5tNO1c5crJl7g5DuysOzGEVhcI3ajLCJaC/LxBC2wxdnbZpeNuX0zPeHws1iFeC2
         JjPwNaeDhJqctN94A1B+gf0iZxYi65M8YFCFQdExO78AAx0fwrW0Fedi+LkG1uwej1sw
         LpO2rYARhWxvI05bDS8k7sF4OBcF9cyBDUTmMMc6incOFeOHRLoC9AAtQ3Nu30oGGse1
         npb/WM5K1Or2HaSdfj6Go6bNNSZ38kMAKcjtqoNMyxzMgohFBOBJvi2rSZCnVZBM9Hl4
         FhXTAVghRBiqXvxHQrA7mBD1I3uTuHQAzPCW/OROToc895V8eJa+Oi07T41xZGHnvJF5
         CEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396155; x=1743000955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykRZx1zxGai8riCEOFUoLeUcHnk9mI1cgk2cvB/7auU=;
        b=smApxQV/bZRMmwCgLUJKbZGg12kuXrPMA+Ouq7sh7+klQ8z8HhavP0sqis0pq8Ggnr
         rXn5Wk9m2alBiaJPAjoJ1g4aTzFXYOULQyKXxltZq5iAWRCeD2KdqKziU+XEYliXRSV3
         P3NBw6n2RorQ0r2fIZuz6R4uQr/Thm70Un6GpvNC5IAh8EvcQ1EQofrwKWzwRjBz+Y67
         asAxiDsBgoczVTfYbwaelNsDQuT2WvrxEx9ckuje1L9stLpIOqSrnLrwh3pGoCtvoATc
         mHztdz4G6DJmOqIFR+KI2BCrXwi/bQm9v75PTjkyUej31qBZVgEBq1NDPc0nCSwT8SMU
         pbqA==
X-Forwarded-Encrypted: i=1; AJvYcCWStEkOvL2xN5qs9m3HjazKNIbbJrYU/GhfPqDXK2qzBDWAwBWpmFAZvIzjjvjZxGbuuLAbQ14VraYo241g@vger.kernel.org, AJvYcCXLRxOCJKer4Jm3zFjKaHx+3RV9aLKicllDDVvNtRhSYXuQnqm8LWFIKcxbKlAggWQa2ePRkUidPfVM+G4f@vger.kernel.org
X-Gm-Message-State: AOJu0YxdKyO1b02lIkpFmhU+mA8N/cSNopbc0mDn5kFR2SVV8tdbD981
	5a66ZddOsRdJcHyxpOsjTFGK08H/DaG0ekUQ083A3Beau/ALnv3w
X-Gm-Gg: ASbGncsISE2w/VVLTxR9HKIxABsfR+ROZRc/odu6zf/NFMYlHxshhYPYPdPG5WFwO6h
	7S4leu9qLDta9rJxeLFq2qFJUTfuD+5XXKXHqAvFQp62nwG+gu6ZdIz/peLNdy8qNIYJ8IEMFmB
	hVLAIjRgZHAL1/TqRHMNwKYVqIM9Kys5b3b6QZnR1xPjOipMZAHe/UMxdMp4i3VgO748NyW4z1j
	E0vT5TMXUv2tfCH6ndLAhj9H3CTrj9H9oDawLN3onBOlI3WewIk5ah2FOZNgOtkKz/qtJRQh3br
	uWprz4l7hBzLk9dMjJ6tU51MktlMX7ta+RIew8wfZI7+pdwyXfoxe0gfJBWmyvaLafG7DiVMEH/
	q/ZIaAdFn0V4wm3nJ4uQ=
X-Google-Smtp-Source: AGHT+IEVSY7Gut4/GrsN86Y6Sp1q/BM0Hd+KvVhzTdD7P8COT0VA6pKX3430prcbrjpzaGzHmvnQdw==
X-Received: by 2002:a17:903:4407:b0:223:397f:46be with SMTP id d9443c01a7336-22649ca8f5cmr48378535ad.47.1742396154522;
        Wed, 19 Mar 2025 07:55:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-226273e1459sm42742005ad.145.2025.03.19.07.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 25/34] drm/msm: Pre-allocate VMAs
Date: Wed, 19 Mar 2025 07:52:37 -0700
Message-ID: <20250319145425.51935-26-robdclark@gmail.com>
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

Pre-allocate the VMA objects that we will need in the vm bind job.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        |  9 +++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  5 +++
 drivers/gpu/drm/msm/msm_gem_vma.c    | 60 ++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1622d557ea1f..cb76959fa8a8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -115,6 +115,9 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
 
+void msm_vma_job_prepare(struct msm_gem_submit *submit);
+void msm_vma_job_cleanup(struct msm_gem_submit *submit);
+
 struct msm_fence_context;
 
 /**
@@ -339,6 +342,12 @@ struct msm_gem_submit {
 
 	int fence_id;       /* key into queue->fence_idr */
 	struct msm_gpu_submitqueue *queue;
+
+	/* List of pre-allocated msm_gem_vma's, used to avoid memory allocation
+	 * in fence signalling path.
+	 */
+	struct list_head preallocated_vmas;
+
 	struct pid *pid;    /* submitting process */
 	bool bos_pinned : 1;
 	bool fault_dumped:1;/* Limit devcoredump dumping to one per submit */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 39a6e0418bdf..a9b3e6692db3 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -80,6 +80,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->ident = atomic_inc_return(&ident) - 1;
 
 	INIT_LIST_HEAD(&submit->node);
+	INIT_LIST_HEAD(&submit->preallocated_vmas);
 
 	return submit;
 }
@@ -584,6 +585,9 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 {
 	int i;
 
+	if (submit_is_vmbind(submit))
+		msm_vma_job_cleanup(submit);
+
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
@@ -912,6 +916,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (submit_is_vmbind(submit)) {
+		msm_vma_job_prepare(submit);
 		ret = submit_get_pages(submit);
 	} else {
 		ret = submit_pin_vmas(submit);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 7d40b151aa95..5c7d44b004fb 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -258,6 +258,66 @@ static const struct drm_sched_backend_ops msm_vm_bind_ops = {
 	.free_job = msm_vma_job_free
 };
 
+/**
+ * msm_vma_job_prepare() - VM_BIND job setup
+ * @submit: the VM_BIND job
+ *
+ * Prepare for a VM_BIND job by pre-allocating various memory that will
+ * be required once the job runs.  Memory allocations cannot happen in
+ * the fence signalling path (ie. from job->run()) as that could recurse
+ * into the shrinker and potentially block waiting on the fence that is
+ * signalled when this job completes (ie. deadlock).
+ *
+ * Called after BOs are locked.
+ */
+void
+msm_vma_job_prepare(struct msm_gem_submit *submit)
+{
+	unsigned num_prealloc_vmas = 0;
+
+	for (int i = 0; i < submit->nr_bos; i++) {
+		unsigned op = submit->bos[i].flags & MSM_SUBMIT_BO_OP_MASK;
+
+		if (submit->bos[i].obj)
+			msm_gem_assert_locked(submit->bos[i].obj);
+
+		/*
+		 * OP_MAP/OP_MAP_NULL has one new VMA for the new mapping,
+		 * and potentially remaps with a prev and next VMA, for a
+		 * total of 3 new VMAs.
+		 *
+		 * OP_UNMAP could trigger a remap with either a prev or
+		 * next VMA, but not both.
+		 */
+		num_prealloc_vmas += (op == MSM_SUBMIT_BO_OP_UNMAP) ? 1 : 3;
+	}
+
+	while (num_prealloc_vmas-- > 0) {
+		struct msm_gem_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+		list_add_tail(&vma->base.rb.entry, &submit->preallocated_vmas);
+	}
+}
+
+/**
+ * msm_vma_job_cleanup() - cleanup after a VM_BIND job
+ * @submit: the VM_BIND job
+ *
+ * The counterpoint to msm_vma_job_prepare().
+ */
+void
+msm_vma_job_cleanup(struct msm_gem_submit *submit)
+{
+	struct drm_gpuva *vma;
+
+	while (!list_empty(&submit->preallocated_vmas)) {
+		vma = list_first_entry(&submit->preallocated_vmas,
+				       struct drm_gpuva,
+				       rb.entry);
+		list_del(&vma->rb.entry);
+		kfree(to_msm_vma(vma));
+	}
+}
+
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
-- 
2.48.1


