Return-Path: <linux-arm-msm+bounces-58778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E461EABE369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23E048A42B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A03C2820B8;
	Tue, 20 May 2025 19:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8jVaKzj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C8281343
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768148; cv=none; b=ChoeBvOqXx2JmgR2P2WUrvISiapwK8tN9b40zi9znIarXeg+6dPSAkidmaFn6Ki0j1AxlaFZ1G9xc2F/6UsCa9EDtTxduc6UH+Xvi3xiMpMXckwTCaV4Jx95Mh3BVRDCli/WlhWblu6Tb7pWhxTcdBZ/PlTfMgiJk+7EzL4+qu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768148; c=relaxed/simple;
	bh=IRNUvyOjaxw/F2ca+hPqiQkWq4EHwHVBbpQuon23Uj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVZ66V1L3zXTdURSb+iEyFXRzVUpvxh+irWqE5ym5eTlK1h4gHo4BTp0X569g/Ag9vhzh8tHRUkZg5h41YaawvSEdX8vf1+JLv4vRKfMMge05N8CLfwlPhWHLjU7o2hhEXGGbGlcpHNYS4o+VuVY2KaJPgpzXWEtsWzfgl2WNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8jVaKzj; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47675dc7c79so3046141cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768146; x=1748372946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
        b=Q8jVaKzjo/f52rALveH69+17x1z6GluZA7LqBNu4uDp7Q1QqWT0z6fqsoRL5zqXQbc
         J/+CgLJHQ257sAVwleVwKKAC9e0nxYkvIV3xW5okaV4ZcV6aJnR1INqLYNDdvkuSsvKg
         gMmOKa/5yB39KxE0Zm8FE8+qxPAD2ujZlSEQPHV4hq3aYHr8f/yT9u184jfj7oYr/VKg
         YaF3oF7ytjejX6dqPwb4BCCvz7+rZq1YnOpxfZRGjBQR6ILHUy5M+ER4C7C80HoE8KLv
         jtWT+NsHFN62NUanflv8g0G/zZwhyGzT++YVHoehP/ryjA2INDcrEsKY9WUkkSkX3aOs
         6DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768146; x=1748372946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cADqZ1V/EGiLXKG6qQOYNjFrT4sU1TPLVJeXzQQLmA0=;
        b=M1/B2p1lahy//NPsSXAGmYn6Q9psHz8h42kzQFqr8cjsAiJrWRG9CuN6vSa2l+wUh4
         Gn1dCWJh2ht1upndQGqybFucIrjHUaixWHm09ChjN0UYQ6Ob8SRTDIdFEazWUnoAL1oX
         J8V804Yjv89f5QYTY9sUVkqrAvjHvVR9eSfH3uAGIIY0kmGV5dEdn/9MtGcDYdMQKGM8
         nf5pXkQmd7w+LJci1FAYcBqPqRlyG85Jjp49/JyumfNfcz8HctULMT5yDgmYIjhW31s3
         B8MxfypIhczunOXH8YFE8Sq1MuMrGrACmnCDWrPTCUny54NHKpYj4BqaEWFhdBwumO7t
         +9Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWY3L22X1+AxNIpU9sMeYGLnZa1huLkE3th6zFQzkN+RCKD74ZikobZlN4+26It26wAAUPZ8eKE/iB1Q1vL@vger.kernel.org
X-Gm-Message-State: AOJu0YzrtrveFn9cuQwD/6K58uECyYIEcG4R4SqBn+vvT3U6F6sCsvT0
	6Ijy4cWoB8i2fK6gbV/t4THzPHpBkeesitXgEACpBUwToe5YxgO7vKHW
X-Gm-Gg: ASbGncsXFOx+ZtO+4HOqS4Kf5vNR1gnlSqMmZ3cTyRBkh+GMB9lW7ve1x6oXMlbd4e+
	CK0JCGNgM+4iT732p7iGD1jKhxyl5pyrYlsPPUeFrv0I5ZuYL5PkK03SXhpsSa15Su1K4TgxMcE
	BeBbxV79aA9bY6RBk3BfB5uVY2JPyRkrJbMEp7mQuMFYtvnNb445+myH5ZSec30BL1DHvV2nKvH
	nxjQO6bkMx+02W7MHO0n6C0FNRD5iHL2yBT9rb9LW+j7N7JtB4lcKL4Qu9+48g0m0KizaG3GEMM
	Q0SMABwzkgNPD76XUjtSbbCgwH1H6Pnk6sp6oaO3rquAIu0ai1a3LRSVZXSWzSXqSHNNd9kFJVM
	WqG6J4egLctbYGTShHBI=
X-Google-Smtp-Source: AGHT+IH/sySa48mHF1j+xGqwAb4OUN56/osDwaowVOBbvnddvZtTNPPLhnoNhpJNu3NLmENNp9KeEA==
X-Received: by 2002:a05:622a:295:b0:474:e213:7480 with SMTP id d75a77b69052e-494ae4557f3mr113963491cf.15.1747768145897;
        Tue, 20 May 2025 12:09:05 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:05 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:08:58 -0400
Subject: [PATCH v8 5/7] drm/msm: Delete resume_translation()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-5-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=3387;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=IRNUvyOjaxw/F2ca+hPqiQkWq4EHwHVBbpQuon23Uj4=;
 b=5d0rxfRs5HCrkUIw2Arap8ZqFIuAGJ4FzZ6nBN1RaYGc2iwrZQL0YnVpt1p+/vjsJdBWdGDLK
 wKpde4hDDxRAJWeKAxM6zuLjWRz2y2+sHM1RYmSEmKQLnJbDbCP4lc7
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


