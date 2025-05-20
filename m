Return-Path: <linux-arm-msm+bounces-58762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 080BAABE20C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08624C20F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C731E50B;
	Tue, 20 May 2025 17:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ow4YQylX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EAD21ADA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 17:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763109; cv=none; b=cmjH6tkxFZVjI5JRJZhGMOsTqyuBbJCuX0n09fc4yyOWLpySSKFNu13/ZuWnrg7TNLBzKAHu1gHPzb7EMjcVxsUw6nXD3hNEuodfePNpz2hkWcnD4hKNo2gLs/mkdMgds5Gi+cGLqq4YjfbncYnkUgeqAC2kkGk/P2gAXVxsthY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763109; c=relaxed/simple;
	bh=IRNUvyOjaxw/F2ca+hPqiQkWq4EHwHVBbpQuon23Uj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkcUctJrpewCi8z65OS3FToCujdDZexIP9SBNWL35En8gr0+eyuTG3fcrhW8DO0L554fVh+KVPgMlCfmr373kvQKURMANcvJWvNeMnnpfVvqSAwMkIXMn/1t3QdJNj7f3XOw3RDIESiGKXh0M3JdHgly2nHi7PihD9t5N7ISrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ow4YQylX; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ef0537741dso9051466d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763106; x=1748367906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
        b=Ow4YQylXTCTLtQ2svMzFrei4RsM48TBB28kz1RNq6WP1IX+PCTq0L7IxDz5ZlHrPIn
         bwBEUiiksak71hcK9cPaOUp9aBgHGnh5gRKWfPgsT+C6ZLavYmziZILV8R18kD17C/dO
         kv16W73swDYit0lBOQCrQWsqASrHLYL3yXlu8vkwjNOE8cpHQdfBhB6ueEAsJuJMCfaT
         W9GAPhYbpdXraM9VKG4ADOUInj5DcK0AgZkJgkdqNUTpqg/41wMPaAPgIQk7wJUbqZJq
         c7++zzgDQjsCr1zFtVbTaGJJsn51NZo5NPp0RKi3sii1BAq1AyK7KRZlTMRKfx8kFAAS
         ayOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763106; x=1748367906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
        b=Ow3G+hqO5BqxsFLxj+UkR6I/oodivXSXJNxi0FEMttkXS+dM3OfooUKD3ml6O8iiYJ
         mxZRwi7PX59lIk3gzHuCHcRAVxiwVtB0tCbaTeh7lmkAQ8kksTQVRZ+ol6gz6gFeYbQJ
         YHxFS88pSbM+TeZBlzfnsNaP+D1XLwDiICT4MGueEkCOBulaxaM4za8/B6JNbJsExjRI
         Ffg4/WiHBPe3lufOT+vPHA2nix3TNHvvuCByc8d+8xc8zv+KxPZv20AvnRP6yrn27yfl
         eJG9hS0JXVbxRikXX5/fi1uKZtSxjzN88K9uVbOgZLPJvxG1R3qDHHqAiO/nV/gisc36
         lfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuuuKGNQJlcF6DmQBn8ovp1bQyGhX9s4O4gdnxPZu5OqSjxlfi796g34y8AAH6kMcp53Rv+rcwI81aeu7l@vger.kernel.org
X-Gm-Message-State: AOJu0YykGACNZgxl2uAq24TlQdY5s4xXiCTGtcostjmOQossrDox9wPc
	jX9D0a1hqQdvs33HnGb2DjHGGJkjxfZbaZCNOprO3eBEVm9pq6bqNFAEg+MKeOAa
X-Gm-Gg: ASbGncu1Gzy2NsatWWZrurFfgvsxyNnZ98CbNamTjl7aleatlwonoNLT3Hbwxx7oQED
	sLPj1hESm/977rLtSr37uncDqzl/dr15qCCoGea40s4lA54uuU1Ed5EQOXBWjqd5eIiic3V/wbS
	uOvA+G5BYbPEnmCY2t0b17vGcKVu5U8De6/WINdQLaMI1KJAhoLbOjoxWw+LUPs0a9Fxj+feiWB
	x5eEIZrxYajY9GU/dT9g4TYub+iuCe4EdINVtCuqwnozdN+pDlBzrwtmqQOJCmqXc5QB/MmY2Xs
	BOCK5XWKjsL4+W/nkFGaV9toA1W2dFfTYNsmiM4MSIwVyeZMHvS8p8CIIQxUcp1UBYljuCOVAqg
	4E/cLiYnYGOuPS7VvoHU=
X-Google-Smtp-Source: AGHT+IF/kqZXAuJjPUcZYWB5r6Qr7iOAsFvxKah/Zq78HNCB/e2Q26OWxJdFiR2AvAYDpvo1c5xq6w==
X-Received: by 2002:ad4:5941:0:b0:6f4:c603:588c with SMTP id 6a1803df08f44-6f8b087eb22mr85100926d6.7.1747763105993;
        Tue, 20 May 2025 10:45:05 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:05 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:54 -0400
Subject: [PATCH v7 5/7] drm/msm: Delete resume_translation()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-5-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=3387;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=IRNUvyOjaxw/F2ca+hPqiQkWq4EHwHVBbpQuon23Uj4=;
 b=bb1ikhMcSzxMlK/2NMm33STv5kLCmibVErhj4n18dSnT3mDibLINSPR9ac7QKmBAKJFyLjFcr
 bATA0iAywjqCx5qFhoAISP9lr/FgSu8Zo+BxW+MrAxNgLZ4CwVNSho3
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Unused since the previous commit.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c |  5 -----
 drivers/gpu/drm/msm/msm_iommu.c          | 13 -------------
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 39641551eeb66d1441810c9691708ef448192578..4280f71e472a4130a62ba74e936870905ca260bb 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -71,10 +71,6 @@ static int a2xx_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 	return 0;
 }
 
-static void a2xx_gpummu_resume_translation(struct msm_mmu *mmu)
-{
-}
-
 static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
@@ -90,7 +86,6 @@ static const struct msm_mmu_funcs funcs = {
 		.map = a2xx_gpummu_map,
 		.unmap = a2xx_gpummu_unmap,
 		.destroy = a2xx_gpummu_destroy,
-		.resume_translation = a2xx_gpummu_resume_translation,
 };
 
 struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index fd73dcd3f30e75878364cb28dd26475c2ff80a85..aae885d048d0d2fd617d7b2a16833da25f5e84cc 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -345,7 +345,6 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
-	struct msm_mmu *mmu = &iommu->base;
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
 	struct adreno_smmu_fault_info info, *ptr = NULL;
 
@@ -359,9 +358,6 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 
 	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
 
-	if (mmu->funcs->resume_translation)
-		mmu->funcs->resume_translation(mmu);
-
 	return 0;
 }
 
@@ -376,14 +372,6 @@ static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *de
 	return -ENOSYS;
 }
 
-static void msm_iommu_resume_translation(struct msm_mmu *mmu)
-{
-	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
-
-	if (adreno_smmu->resume_translation)
-		adreno_smmu->resume_translation(adreno_smmu->cookie, true);
-}
-
 static void msm_iommu_detach(struct msm_mmu *mmu)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
@@ -431,7 +419,6 @@ static const struct msm_mmu_funcs funcs = {
 		.map = msm_iommu_map,
 		.unmap = msm_iommu_unmap,
 		.destroy = msm_iommu_destroy,
-		.resume_translation = msm_iommu_resume_translation,
 };
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index daf91529e02b6c491d624e9de686173eeef86a9b..c3d17aae88b0a57b3c7d1df3351b39ec39bca60a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -15,7 +15,6 @@ struct msm_mmu_funcs {
 			size_t len, int prot);
 	int (*unmap)(struct msm_mmu *mmu, uint64_t iova, size_t len);
 	void (*destroy)(struct msm_mmu *mmu);
-	void (*resume_translation)(struct msm_mmu *mmu);
 };
 
 enum msm_mmu_type {

-- 
2.47.1


