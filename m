Return-Path: <linux-arm-msm+bounces-55976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDC7A9FB6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182BA1A80BCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFE621E096;
	Mon, 28 Apr 2025 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P616WnjD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1A21D5AF;
	Mon, 28 Apr 2025 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873877; cv=none; b=FENAc0CYQz2LTQwuR4e/tH3LRch8Tr/qrDvs0DpBJZYf5P7r1g1CwrgCEMIomwrG12I4lXQ1zpt0JcPWl13XjhMvGWB4UWTCMeieFv6cq+TOT7RIMHFrAlrWoSsJR4SclQ//GpLy8uQ6HmirI1eQrSYAtTiFXdpXRvBX8TgugKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873877; c=relaxed/simple;
	bh=S20gI1jTVVWo0UV5L1MRkN0bHV1MwLRTb2E3mVQPVEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXgSh+n2xwgO4RE1c50jZziIWpJcVXVnq/cDQdayaFsEi5uJrzXMmPs9mU+L8b2jypKL4gKiqgbQOf1Kn8zw/1ZS7anX4hwnpk7MD9ls8EcEh5WORqGSrpGJtuxxdYZJC9FmyAe+DsqaWuc+LQU+FXxfBkO1MpI75iGRoUyXjfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P616WnjD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224019ad9edso79817375ad.1;
        Mon, 28 Apr 2025 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873873; x=1746478673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j2RUJnwVC+vYKJSWO/0XWvYj35FTt1kwRlO+Xy2fTs=;
        b=P616WnjDtnRJD6Mop+izQ2GSlFrQGq9MjNA/f9Lb8VdgchP/0heres9whO2/WJAyZK
         fmUJ0LnK9TkTYmDfQrDHLJEY7+rRXP8kEVWyCkLC1zCz+/po6uhh09UBDeNUZukCE2gO
         jNvabNcI0J1XyXahxO9ac+e0qwSl7uWBjve9aMJzE7LQg9sDE4p8ZOa86zLu9DlrwfWx
         6icY40mO17LaK+qa6+5gtjMVWU61nQF4C1rnn76qRu3WBxOJh11J+kC2bgrO4VASUVzC
         +MTqXLI6s5KubkCMt4fu7OPt/WVgNPr8CwlfeM2oZIbhO9kJd6lrw9/hbHRUZrUdltXZ
         RyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873873; x=1746478673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1j2RUJnwVC+vYKJSWO/0XWvYj35FTt1kwRlO+Xy2fTs=;
        b=OHbXWpgTNM/3PJY2GbK5CYkGV53ykOajY8OdXgu7m4eemw4mMtwy3x2iNANAvqGjSh
         o4gQR/iqrEO0E7eHJiR2CpwYeGd7/jNe/Q4DUuavemMly/uIYA+J5SEHMX9FE02oxvZm
         38G8VH3p7NU3rH7Z653dWe4RcW8HZctso7f59Myi8BDJ3s7+kfGy/ALuXSSobLbFbV35
         oVJD89H93PdcsKFDC3ZEfs+7TG/6ruSYzdQ/c6Jd2s1fSqG/+kU8MZQIYRGbfx6CHu3Z
         BW9x5y+NTYcLrYypwDkVklYWlYrAPMeUOq7xvymaiq4JUZ7vNqTGkBkn2Zx6qDwKOJnB
         QFJg==
X-Forwarded-Encrypted: i=1; AJvYcCUTtivgFjjIqgY7PJ8YqQD3tYR9YmnAN0pTLy3vAn5vAnj3Xa5WKVJXrwvzZypgBYJpuQuEUZ9VDFvZF2Ew@vger.kernel.org, AJvYcCVEB6Zn4k4ZAIJIIjqIT3rtMADXUaxP8R1Bz5lUymGqFSyr9gvpnXfJBxod95/XgOeNdmbcQiWP/JZioQYb@vger.kernel.org
X-Gm-Message-State: AOJu0YxiW9S24QcnUCAVpvRNdiUU/T8kIJByHcbS4pNYPWi3+7r4UC6H
	913Xo49MPTirsJ6gwk46I+Q/k0KDKsWLfkpCULUL7GJsJ1X4zosg
X-Gm-Gg: ASbGncvqD1BEfF4D6xICE4Jd/L3xw7GExaJCAtGLU58VDwXdBljWO+ncUx7+94XhK1Z
	xJFCNGL1NCdmWhTlINtys0u6pcpbE+EjpcqnKMHPINJ/iBe6dhWGe6Y8nuE+xRMrns7iX7PnDnb
	d9QM0qZms8CYF0NUox2eOeWk0Z+KUM3E2D0tWo4CoyhOoEDYy1vniCEba3Hbn0Q1saa9ssy0s5N
	2ZiCoPB+zA8ieggFSs/YPcmxkzDboOkelL2XS3SFvW6ooNNVWf5xkNQATfnJP9a9mVRQMQqyYbI
	4XJPNxH5DCmrlFC8O17Ebv31uFaZzrYfiAdtjwtHaEiOkMO1Ro99cnSaW6il9ac5RREOacUrgBh
	RVmwTEQfaXunhyqo=
X-Google-Smtp-Source: AGHT+IGj0j4cIVnhPmszKYijPx+TdZT0sVXc2HKRoQohmvTZqeB+6N3kGYgKnyk3T5fZPfKqujD20g==
X-Received: by 2002:a17:902:e5ce:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22de7012487mr6704695ad.32.1745873873408;
        Mon, 28 Apr 2025 13:57:53 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76e21sm88016025ad.45.2025.04.28.13.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 29/33] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Mon, 28 Apr 2025 13:54:36 -0700
Message-ID: <20250428205619.227835-30-robdclark@gmail.com>
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

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b7936b83660f..f4d3210bb8ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2267,7 +2267,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 756bd55ee94f..237d298d0eeb 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN_ON;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c874852b7331..c70c71fb1a4a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.49.0


