Return-Path: <linux-arm-msm+bounces-57931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8289BAB73E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BDBD1881969
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7149296735;
	Wed, 14 May 2025 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf5o7oO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0D7296714;
	Wed, 14 May 2025 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245441; cv=none; b=H7P8lIKHkOKnWLvxwicnWJ6lP3mNBQUEA9GjtvnCHc5WcHvP9Jx20wdKb48sse0ZZuceUldH8cgi/utCfP6TJS7VahzfvMWz9yBvY+K7SEgZ387GqDDvwi5ZHre74/phoDfMwlB1ySGEiwgPNgC8/AalvdwmbtrNd681MDCWaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245441; c=relaxed/simple;
	bh=S20gI1jTVVWo0UV5L1MRkN0bHV1MwLRTb2E3mVQPVEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLraYDLrhzNc/bFXATuc8wtsoca13qM36ExnvXjKfcHZLlod08ohSTRCF/4fnUxk6Hrr8GXVfzDKxMSDnM72QsH9TUXUOM9o7F2TCaTWLwLoB5QoQeHkNrg0RHOUNooMicMy84cdCKrcrvJOmIG2daPixcAsbu3yTI0Ad2ET3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf5o7oO0; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b24f986674fso162081a12.0;
        Wed, 14 May 2025 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245439; x=1747850239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j2RUJnwVC+vYKJSWO/0XWvYj35FTt1kwRlO+Xy2fTs=;
        b=Bf5o7oO0nno8VX7OU2oBwS7hMqjbjOYuU8iXsVNslxynsuqS6C6rAWoApXNye7vPzq
         pN5c37oGATJ785D2K8NX6LhjrnO1uOaUD4Q/DAcKrZ+4ySLzR50af9MDvXGGSB2uf3iH
         B6x7ALHNwDwffpZHdYwlLxUZF9kvYxaornKAGIrGoaGLt2UsTM26XS9iuiod5x+Ipq9t
         nUajxix4lJyB01hk4jVX4/nRx+XS+1nBWvUJsCv4EI8k9OKpyzgrWGWDQqvyyyoOItyt
         uWYbvdib/EHBS8bpADEZvnMYaTzKoG88XBIDQSotrgheWcBA7fqbbYQsmQXKWIVhTKZR
         Bdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245439; x=1747850239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1j2RUJnwVC+vYKJSWO/0XWvYj35FTt1kwRlO+Xy2fTs=;
        b=cM3zS0Ls79xMQEdyDOG+fIDJ+icaKiZjVe0+eg6LCY8fqzcc0RMz0H56q1k9xR7ndu
         I/kAbHLs4rf99TUPx7BF5OttUVQ2K3kENGF84FuhfznGeCiwGOweIXXgzWomSgCy5Oa7
         RGsEefd/IjDZLa9dkOoTVlXuYCR3oxJqgTc+eXaPJLE07LbJiHHMo2wH+70NraXHBqNK
         LxL2RfoH9I9iCj7AufHfzl05gOYj0sIvHTuMsplhBdYFBi5E5+XC8XNW7BqWlWimp7kP
         lX/nDQ70st56LZKIlntBJz9KL+2+9Tcvfht8ult2rc+7hySM6pUuCn4qf7gjMYzoooVX
         UQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJmO+YbOtkQxJi0RxvteT0Tnuo+f+LAvGsIU0hCcL2c1IZkt93u4OTNXBheG9OHZmz8L5w51mNGetiMMiK@vger.kernel.org, AJvYcCXpZkgq/+63pF1JMkA7fCZfsFuWekK8Pjb0YTBDlWJVseeT+PEmNs/n2QoZOtZ2cmg9dVGFkPGjJaVAdfnJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/rD6hIyA+Wg+bBwc00DV3QYFJ47p4n+jS1++vk5Ljx71tp1Jv
	587HXhMsmo8a4WHAQHCCEkFXT48es1afBSjCvC9tgXcQhiNW1zqDsyVS
X-Gm-Gg: ASbGncv1WZIx4b8j3nq42LtYZD+nQLQrCcZthOTtjwYIswdMXEaQ9jWzKssx0sF+voC
	KwNFhpoDGug4ysrufw5C2YoU2wSF16TccGJNCTVWkzITGcsBON8odS4dHyPumfPFZYU94DGP2mZ
	i7RpXOeOAgd2+a5sG8HSOMbqpa0lW6Qp2bZjwWmuxflpNd02HQuyKuUzz1W8Nf21hE9Nw6q3RnR
	CUTHI1uJk1s7XWYgdlQyOn3+QkNGuKrWjJfVg6QBbW02QuiwVcAgYYe728jFLzdwyUioKPvmAff
	MVQPlfy98dI8vlgHBrZNkkf4NDdKK0Q50WNOToZgM1Vt+Mmj5+t4R9WwOObChESKh8sEiV/xTJ5
	S3hqYQwX330YgDCsgdLXS7guK6A==
X-Google-Smtp-Source: AGHT+IHsVOmJRx1klnJ2yuJyGk5wMMPErRkcbpwyGTeWCsRdRX6j56CPPLWf/paTis7dcMd3JihKMw==
X-Received: by 2002:a17:903:2451:b0:22e:5a9c:2853 with SMTP id d9443c01a7336-231b3979697mr6528095ad.12.1747245439376;
        Wed, 14 May 2025 10:57:19 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a16afsm102236435ad.225.2025.05.14.10.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:18 -0700 (PDT)
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
Subject: [PATCH v4 32/40] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Wed, 14 May 2025 10:53:46 -0700
Message-ID: <20250514175527.42488-33-robdclark@gmail.com>
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


