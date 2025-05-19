Return-Path: <linux-arm-msm+bounces-58543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4AABC6BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04347A0F75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDD928DF31;
	Mon, 19 May 2025 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFs/dCCK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E5328DB5D;
	Mon, 19 May 2025 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677523; cv=none; b=WooUo9Qg1bx7i9u2MY9J3r89kJgLU5eD1nHG8CZ/CusCcW7TwIJl41Uhh4JEOco9v/pXmd6OWUc9fHuvydUR6Eu+P+2aHgy9erDMfsRkoKMTaXcdNLqm5UoxZOquYm9a7vo9UkblCP/1PciORqY1N18qTMnt1gPwwqbiGqpxhwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677523; c=relaxed/simple;
	bh=O/nV/ZBdihwESJbKRGMGIMsUx9sBpWSdFb0C10uWsVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKdja4VzipGAcT5KBXZd5E8ecz48er3odg+K8NamyZXEDggoYmI2BeYESWLJZpHa0ZDD2lPENXPe3JL+jjn44VJNQipzXY+BgC+6dBoskuFaT3UiRAFJbkU1Mbx83LtSCltbNEXImoNFtOUdyOdbD3TIQD+HSTYoDQhJ0D0Uczg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFs/dCCK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6067859b3a.2;
        Mon, 19 May 2025 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677521; x=1748282321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsDuMkK6+ntYHJetvzHtNuC1/rYImV4dSwAsx5YSXi4=;
        b=PFs/dCCKUE05HLD5Dzns/eM9XJasJIpdlqca5UMrHckjpEKFkv8mY93VHl0P4YXHoy
         8MpHwX/w4fNHHIqwx8n3odZ0qEXP6D4s92XgtZdST9CGkBJNpibbzCRdtrQspoNpP1Ww
         29g2bM4OZH47BLW3OxUoyycnHnvxU51YcusbBuyDraESJrwMwfUv6j/Yz9mkfeOrpFF2
         Nnu403Ffc2SVH8b/vlprNeOcZuXNpot9R2fb/wTCoNQk29/931XiBUVeNbsY50i28P2x
         HAp6Enm2oADjzkDBKMbY/sG7mGD/veMUIii9vzIVCYQN/tzCSv+9gcvElENncCfbR0rU
         CAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677521; x=1748282321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsDuMkK6+ntYHJetvzHtNuC1/rYImV4dSwAsx5YSXi4=;
        b=eoRP36TxieqXEZO6qw2Wzv9UvAXrQK7Vg/Aq3SW5MOeWbKyDeN0otXaywaUVwUX6mg
         ddedT4mwuZ/HrBDx5AGuPl9OhdqZvVYdDRCUMYv4lh4QbpwScCl7UaFelJsbu6fZBKBL
         2eLVpqDqxBkvxwEGGTGKjrXFJjzjrNJYTvCVh1B55RukvbiGibZay00n6rkIwM+7E0M9
         Tn3uG1dFg+X4v1ODTQh0Ve22aqxaNlF5x0z1edRX3l42rZ6JZkzhT+R5r7CKrgmQ5Cim
         CVD/Zs3oUXP2r0zdtCSGfUyDWZ8eUQJlZMcmM9ENd0bF7IhESscTQ/amn1aHU3GI449L
         /bpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpqk09cO+xrKVECt56t4jSZe0zQh720WqSFqWEP9ospw7wJuNWq4EEBwzpaFmovAKABETL6DTchtt//Htn@vger.kernel.org, AJvYcCVRH+E0FOFLipXLdmeaqxFlk199V4hXEWGt+EC/j3dWHT8M0OcweRik4YJE+qGG8nqG+PhN9a3TdIoxAQlf@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwVt+okyDvwoY2+M0/bjFmLvwZmLFtJtXQmlwmGETpjQ7nmxz
	3BeTHaCmYp77reApMH3AbzFBVEqOVmjJQQ2/A8KvZ9hpy5WKQxfZ3Ya8
X-Gm-Gg: ASbGncs3O2bYq9GTJjEPtfIBsWOw4UjINcc/0k70dOK3ThcCGxXYSV6q4iU8wLuI2LJ
	cllGzTwV46M7ULEmJWZXNa//rpKO0h9EqBHmwKtXSvHiU05gY7DOiPghfdnv+Kq1kRVkE67nomA
	SbVy7nmKTZpW9//HEcamUYsLweCiggyGl7xFY/cXDJRL2KM7v6wzdP8mxLMEg0lewyNqbCPuOz6
	bHFYffPqRTDN3SSWg7OL0JQAtoazIXVqw+e8oM6jy77VcPeoXbWjGguh2m1drZw6NZNAkhGrz31
	f2JIMZD06TvHw9IXsGHfGJQZEPsLz4qZenvVc+lfVlBGbO/IrZZfhQ8QmYkqeg1cUW3+bIjuHsv
	dCNETx4eluJYD+k4jLKro2zIjYw==
X-Google-Smtp-Source: AGHT+IEpPUhsp2Km3MfeKJLcLTe8fytrJtiMjwY97/JiD5mpGxU47A0gjeAM8i2SRnvZ5UivSJVNRw==
X-Received: by 2002:a05:6a00:4fc2:b0:73e:598:7e5b with SMTP id d2e1a72fcca58-742acc906ccmr17537689b3a.1.1747677520798;
        Mon, 19 May 2025 10:58:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm6498324b3a.46.2025.05.19.10.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:40 -0700 (PDT)
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
Subject: [PATCH v5 32/40] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Mon, 19 May 2025 10:57:29 -0700
Message-ID: <20250519175755.13037-20-robdclark@gmail.com>
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
index f0e37733c65d..83fba02ca1df 100644
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


