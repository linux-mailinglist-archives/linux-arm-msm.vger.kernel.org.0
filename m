Return-Path: <linux-arm-msm+bounces-60385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D20ACF703
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E597B3AF3F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A80327FD50;
	Thu,  5 Jun 2025 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGYeP37j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94C927BF7E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148367; cv=none; b=j1gZIQFOwYLpOLc5Iao4n9cvpvQLHnE7KhvWRPa+p+0LPT7qxEpFiL6L353WSxjEXHNMtrNJMsKqUSiNEOfRiAR8254pxBxmmnWOy2cNVjO5mEUn4GeehQKnFtg1zIITiBNF5PLZRxvZcBftdiMoXy0G76i6LwCTnDQ2M5Dj9Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148367; c=relaxed/simple;
	bh=ZWGDzS9YCfclm19XTmFbFgb6gidJ3pQ4cKWTlbucnbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feXCAj4f152SVAiFkEsupAr0x+Q+6UFhFtqmFb6LyENYvzJ5HfMq/fX7iMmo7WFdhYMg7Zr0GMnMTHoU2LzNWH5/J6c3kAyeQzwiRH1h8k91+FR5aBvgj83QvbLhJKW89w2KJP76JpQK9Cxdz0qZgmiQTD0A0z4HL8HrFfs1aQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGYeP37j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555A0b9K012737
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2z0s9AwdlyH
	joVms9APH/gt8IsWLHs3ePiiKuAF2T9o=; b=VGYeP37jOKKDuCSimADmRRnxvlK
	NRgJUojAp8/CEP2qjIQK7dEet7iABOMLArLS9Of3DsOTP8VsC/7tn70XJgf466hH
	MoGl29cBIL8ve/NBn2CQ1S75BGx9jBJBNkhpTyi5cUcXYM0EA2pmYGaebC7zzpa7
	lbU1XcSe1l6t0nOhtE79VlJapXxQVFcvFT0LBGA5lqfHI2dxNN4zKCdL36BS5WYU
	WLR033Obnr8TspzsvFJFK6dVR9MAQnhB4+BFnGYpWl0y4wBOfc3w1eZu/sRXoJ4z
	IXghyTfI/oniPzFX4rINpgK+GOve2GaTzOQ/y3QM39bWh8t0ZuvD1SNyX2Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be8618b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso1042224b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148362; x=1749753162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2z0s9AwdlyHjoVms9APH/gt8IsWLHs3ePiiKuAF2T9o=;
        b=LEWAaME8ke0DyghDk4OphCYYRuF1nt2oSKtADkibwiDWytP4GZJ6V6/eP4O5uPQvQp
         Ncq9woGUDe6qxfNJac9uaQ9tgbtVtWHAe+x60JO/VlS0aVkthBqHuMDxR/9eADqUKS1x
         15rUfi8k0zry8G4K6y4n9FMNk9JRqbSSd3fOPB5fEYSSNmhoz3GlWERMmLAD2KlVD3NN
         Nm5QdUmTxWyZ9NVJXZUJN5vsOsYo/bph4iZ5s36N0AJCK5hZ09bmK7cNzfGolwWI+CHE
         rFKW5J0bVLId8NDOvfGpWAVTyCq5z1Ko8BVxjEiPzrqpfZDYXZx9fAYaxbm89G9ozs4K
         yLYg==
X-Forwarded-Encrypted: i=1; AJvYcCUp5UTgImhb142FE4T0+IfTdRkTN00eq7EgevYsiwS6H2uDl2cX/Yyk/aqAZbsrJobXbjke+MFiQ0Sev96S@vger.kernel.org
X-Gm-Message-State: AOJu0YwPB79t+qE6Mio6gGps+81C8KFQKuw2GyAlrFiqFTjYXRIfRB11
	fYnLvhH5yr9XgMLlB3cLG46Wldg7srvcRiZPCN9wsZ56zJYWf1ITZ7tsvJRqxDUCXcFtjWHkmgt
	hl/nCV8Uy9ygASh7w+lUvwbzSm71jjP1pnKtE3iGJmkk6SzpCxH4M3xvxMTE94Yg/MJsm
X-Gm-Gg: ASbGncuT/0THGlhDxIRUU7BkOUUkAlpYN9hN5ayjELgthomPzBz5Q0KOqh6M/ThQrE5
	jjLIPyOTdHYc6tKCZxnt/JsKHQGzzG5WGWcj9hQQLpxnm2pnPGHr329bJ35/JJS4lVaVb4mn7ci
	89A5cSpaJqU5yi118oIV7FfV1qm2XCMSBBPHHFW3I1hXkOS5YBIxl9jjAQ17RPTDdnkTPXTkQLd
	PH0qt2dcYpP0FTOyrA5ttjlQJc/BVsPpYjJElkecafbhmE8bQEZlu6T3GTEc/EswWLSR5oWNRG0
	dmMi0eFFn/Qc5mCy6hxfKQ==
X-Received: by 2002:a05:6a00:806:b0:742:aecc:c472 with SMTP id d2e1a72fcca58-74827e50d7fmr1030970b3a.2.1749148361243;
        Thu, 05 Jun 2025 11:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb4qmPHaE5TXPcvLLvpAXx1CSZvtVkWUNEKy2+hNwDOe24fvWQyknmwmDlQH31UKnViajZ7w==
X-Received: by 2002:a05:6a00:806:b0:742:aecc:c472 with SMTP id d2e1a72fcca58-74827e50d7fmr1030919b3a.2.1749148360610;
        Thu, 05 Jun 2025 11:32:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd4188sm13090495b3a.128.2025.06.05.11.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:40 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 11/40] drm/msm: drm_gpuvm conversion
Date: Thu,  5 Jun 2025 11:28:56 -0700
Message-ID: <20250605183111.163594-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841e2ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=DWwiU9S3deBeNsXQ0cYA:9
 a=hD0YvAvVATwCeCSz:21 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: v2L7y_C73bIUIVQ7LDydRSsvd_m9fqP4
X-Proofpoint-ORIG-GUID: v2L7y_C73bIUIVQ7LDydRSsvd_m9fqP4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX6NEWlUfF/NGy
 ynf5LFV4zm81FZl4cTWBUM4rew6JTXzb2p3/kj339CBuJLFYoT/PrU/4rImlnjU0I9guuPMvyLd
 Q6jD+Uv7BetO6DKlzGzrI8MwOc9UBwf1xlEilb0slIgXN+cq9G6qI/DL20XcmiLnGFandYMefNt
 6BkJa6nI8aCxTJ9AwFviIr7Ks83M316taUk8IlhCCArzdaW5gzvRErZM3a+AUv7FMuiAjoryp0D
 tXGAd7UaQAEv5ekcorlkai7lFtPUlR9zUaQsZATvUppTnHB/k7GyEgNqv+a2L7hjZNHEaFnids1
 GhIUW4cd+ekc807UQsD9JnX40wSMDH3IcZVFsr4gEAvZzpo3OSsU94t4UeXxVgKMOJM/uSKmhvg
 /Doq/tzlozmFOsCRHuIlQpco7u30UND02l7sYP7cz6OtT1Ty3Z1OX0Ti3TdRbpsi0Nz8HJrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

Now that we've realigned deletion and allocation, switch over to using
drm_gpuvm/drm_gpuva.  This allows us to support multiple VMAs per BO per
VM, to allow mapping different parts of a single BO at different virtual
addresses, which is a key requirement for sparse/VM_BIND.

This prepares us for using drm_gpuvm to translate a batch of MAP/
MAP_NULL/UNMAP operations from userspace into a sequence of map/remap/
unmap steps for updating the page tables.

Since, unlike our prior vm/vma setup, with drm_gpuvm the vm_bo holds a
reference to the GEM object.  To prevent reference loops causing us to
leak all GEM objects, we implicitly tear down the mapping when the GEM
handle is close or when the obj is unpinned.  Which means the submit
needs to also hold a reference to the vm_bo, to prevent the VMA from
being torn down while the submit is in-flight.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig              |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    |   3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  |   7 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |   5 +-
 drivers/gpu/drm/msm/msm_drv.c            |   1 +
 drivers/gpu/drm/msm/msm_gem.c            | 166 +++++++++++++++--------
 drivers/gpu/drm/msm/msm_gem.h            |  90 +++++++++---
 drivers/gpu/drm/msm/msm_gem_submit.c     |   5 +-
 drivers/gpu/drm/msm/msm_gem_vma.c        | 140 +++++++++++++------
 drivers/gpu/drm/msm/msm_kms.c            |   4 +-
 12 files changed, 298 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 974bc7c0ea76..4af7e896c1d4 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -21,6 +21,7 @@ config DRM_MSM
 	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
+	select DRM_GPUVM
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_BRIDGE
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 095bae92e3e8..889480aa13ba 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -472,8 +472,7 @@ a2xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
 	struct msm_gem_vm *vm;
 
-	vm = msm_gem_vm_create(mmu, "gpu", SZ_16M,
-		0xfff * SZ_64K);
+	vm = msm_gem_vm_create(gpu->dev, mmu, "gpu", SZ_16M, 0xfff * SZ_64K, true);
 
 	if (IS_ERR(vm) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 848acc382b7d..77d9ff9632d1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1311,7 +1311,7 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 	return 0;
 }
 
-static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
+static int a6xx_gmu_memory_probe(struct drm_device *drm, struct a6xx_gmu *gmu)
 {
 	struct msm_mmu *mmu;
 
@@ -1321,7 +1321,7 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 	if (IS_ERR(mmu))
 		return PTR_ERR(mmu);
 
-	gmu->vm = msm_gem_vm_create(mmu, "gmu", 0x0, 0x80000000);
+	gmu->vm = msm_gem_vm_create(drm, mmu, "gmu", 0x0, 0x80000000, true);
 	if (IS_ERR(gmu->vm))
 		return PTR_ERR(gmu->vm);
 
@@ -1940,7 +1940,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
-	ret = a6xx_gmu_memory_probe(gmu);
+	ret = a6xx_gmu_memory_probe(adreno_gpu->base.dev, gmu);
 	if (ret)
 		goto err_put_device;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f4d9cdbc5602..26d0a863f38c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2271,9 +2271,8 @@ a6xx_create_private_vm(struct msm_gpu *gpu)
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
-	return msm_gem_vm_create(mmu,
-		"gpu", ADRENO_VM_START,
-		adreno_private_vm_size(gpu));
+	return msm_gem_vm_create(gpu->dev, mmu, "gpu", ADRENO_VM_START,
+				 adreno_private_vm_size(gpu), true);
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 35a99c81f7e0..287b032fefe4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -226,7 +226,8 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	start = max_t(u64, SZ_16M, geometry->aperture_start);
 	size = geometry->aperture_end - start + 1;
 
-	vm = msm_gem_vm_create(mmu, "gpu", start & GENMASK_ULL(48, 0), size);
+	vm = msm_gem_vm_create(gpu->dev, mmu, "gpu", start & GENMASK_ULL(48, 0),
+			       size, true);
 
 	if (IS_ERR(vm) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
@@ -418,12 +419,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_VA_START:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->va_start;
+		*value = ctx->vm->base.mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
 		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->vm->va_size;
+		*value = ctx->vm->base.mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 94fbc20b2fbd..d5b5628bee24 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -451,8 +451,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 				"contig buffers for scanout\n");
 		vm = NULL;
 	} else {
-		vm  = msm_gem_vm_create(mmu,
-			"mdp4", 0x1000, 0x100000000 - 0x1000);
+		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
+					0x1000, 0x100000000 - 0x1000,
+					true);
 
 		if (IS_ERR(vm)) {
 			if (!IS_ERR(mmu))
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 978f1d355b42..6ef29bc48bb0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -776,6 +776,7 @@ static const struct file_operations fops = {
 
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_GEM |
+				DRIVER_GEM_GPUVA |
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 50b866dcf439..6f99f9356c5c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -47,9 +47,53 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+
+static void detach_vm(struct drm_gem_object *obj, struct msm_gem_vm *vm)
+{
+	msm_gem_assert_locked(obj);
+
+	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(&vm->base, obj);
+	if (vm_bo) {
+		struct drm_gpuva *vma;
+
+		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+			if (vma->vm != &vm->base)
+				continue;
+			msm_gem_vma_purge(to_msm_vma(vma));
+			msm_gem_vma_close(to_msm_vma(vma));
+			break;
+		}
+
+		drm_gpuvm_bo_put(vm_bo);
+	}
+}
+
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
+	struct msm_context *ctx = file->driver_priv;
+
 	update_ctx_mem(file, -obj->size);
+
+	/*
+	 * If VM isn't created yet, nothing to cleanup.  And in fact calling
+	 * put_iova_spaces() with vm=NULL would be bad, in that it will tear-
+	 * down the mappings of shared buffers in other contexts.
+	 */
+	if (!ctx->vm)
+		return;
+
+	/*
+	 * TODO we might need to kick this to a queue to avoid blocking
+	 * in CLOSE ioctl
+	 */
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
+			      msecs_to_jiffies(1000));
+
+	msm_gem_lock(obj);
+	put_iova_spaces(obj, &ctx->vm->base, true);
+	detach_vm(obj, ctx->vm);
+	msm_gem_unlock(obj);
 }
 
 /*
@@ -171,6 +215,13 @@ static void put_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	/*
+	 * Skip gpuvm in the object free path to avoid a WARN_ON() splat.
+	 * See explaination in msm_gem_assert_locked()
+	 */
+	if (kref_read(&obj->refcount))
+		drm_gpuvm_bo_gem_evict(obj, true);
+
 	if (msm_obj->pages) {
 		if (msm_obj->sgt) {
 			/* For non-cached buffers, ensure the new
@@ -338,16 +389,25 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 }
 
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
+				      struct msm_gem_vm *vm)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct drm_gpuvm_bo *vm_bo;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
-		if (vma->vm == vm)
-			return vma;
+	drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+		struct drm_gpuva *vma;
+
+		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+			if (vma->vm == &vm->base) {
+				/* lookup_vma() should only be used in paths
+				 * with at most one vma per vm
+				 */
+				GEM_WARN_ON(!list_is_singular(&vm_bo->list.gpuva));
+
+				return to_msm_vma(vma);
+			}
+		}
 	}
 
 	return NULL;
@@ -360,33 +420,29 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma, *tmp;
+	struct drm_gpuvm_bo *vm_bo, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		if (vma->vm) {
-			msm_gem_vma_purge(vma);
-			if (close)
-				msm_gem_vma_close(vma);
-		}
-	}
-}
+	drm_gem_for_each_gpuvm_bo_safe (vm_bo, tmp, obj) {
+		struct drm_gpuva *vma, *vmatmp;
 
-/* Called with msm_obj locked */
-static void
-put_iova_vmas(struct drm_gem_object *obj)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma, *tmp;
+		if (vm && vm_bo->vm != vm)
+			continue;
 
-	msm_gem_assert_locked(obj);
+		drm_gpuvm_bo_get(vm_bo);
+
+		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
+			struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+
+			msm_gem_vma_purge(msm_vma);
+			if (close)
+				msm_gem_vma_close(msm_vma);
+		}
 
-	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		msm_gem_vma_close(vma);
+		drm_gpuvm_bo_put(vm_bo);
 	}
 }
 
@@ -394,7 +450,6 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -403,12 +458,9 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 
 	if (!vma) {
 		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
-		if (IS_ERR(vma))
-			return vma;
-		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
-		GEM_WARN_ON(vma->iova < range_start);
-		GEM_WARN_ON((vma->iova + obj->size) > range_end);
+		GEM_WARN_ON(vma->base.va.addr < range_start);
+		GEM_WARN_ON((vma->base.va.addr + obj->size) > range_end);
 	}
 
 	return vma;
@@ -492,7 +544,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	ret = msm_gem_pin_vma_locked(obj, vma);
 	if (!ret) {
-		*iova = vma->iova;
+		*iova = vma->base.va.addr;
 		pin_obj_locked(obj);
 	}
 
@@ -538,7 +590,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
-		*iova = vma->iova;
+		*iova = vma->base.va.addr;
 	}
 	msm_gem_unlock(obj);
 
@@ -579,7 +631,7 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 		vma = get_vma_locked(obj, vm, iova, iova + obj->size);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);
-		} else if (GEM_WARN_ON(vma->iova != iova)) {
+		} else if (GEM_WARN_ON(vma->base.va.addr != iova)) {
 			clear_iova(obj, vm);
 			ret = -EBUSY;
 		}
@@ -601,9 +653,10 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj,
 
 	msm_gem_lock(obj);
 	vma = lookup_vma(obj, vm);
-	if (!GEM_WARN_ON(!vma)) {
+	if (vma) {
 		msm_gem_unpin_locked(obj);
 	}
+	detach_vm(obj, vm);
 	msm_gem_unlock(obj);
 }
 
@@ -763,7 +816,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, false);
+	put_iova_spaces(obj, NULL, false);
 
 	msm_gem_vunmap(obj);
 
@@ -771,8 +824,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 
 	put_pages(obj);
 
-	put_iova_vmas(obj);
-
 	mutex_lock(&priv->lru.lock);
 	/* A one-way transition: */
 	msm_obj->madv = __MSM_MADV_PURGED;
@@ -803,7 +854,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, false);
+	put_iova_spaces(obj, NULL, false);
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -869,7 +920,6 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
@@ -912,14 +962,17 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 
 	seq_printf(m, " %08zu %9s %-32s\n", obj->size, madv, msm_obj->name);
 
-	if (!list_empty(&msm_obj->vmas)) {
+	if (!list_empty(&obj->gpuva.list)) {
+		struct drm_gpuvm_bo *vm_bo;
 
 		seq_puts(m, "      vmas:");
 
-		list_for_each_entry(vma, &msm_obj->vmas, list) {
-			const char *name, *comm;
-			if (vma->vm) {
-				struct msm_gem_vm *vm = vma->vm;
+		drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+			struct drm_gpuva *vma;
+
+			drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+				const char *name, *comm;
+				struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 				struct task_struct *task =
 					get_pid_task(vm->pid, PIDTYPE_PID);
 				if (task) {
@@ -928,15 +981,14 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 				} else {
 					comm = NULL;
 				}
-				name = vm->name;
-			} else {
-				name = comm = NULL;
+				name = vm->base.name;
+
+				seq_printf(m, " [%s%s%s: vm=%p, %08llx, %smapped]",
+					   name, comm ? ":" : "", comm ? comm : "",
+					   vma->vm, vma->va.addr,
+					   to_msm_vma(vma)->mapped ? "" : "un");
+				kfree(comm);
 			}
-			seq_printf(m, " [%s%s%s: vm=%p, %08llx,%s]",
-				name, comm ? ":" : "", comm ? comm : "",
-				vma->vm, vma->iova,
-				vma->mapped ? "mapped" : "unmapped");
-			kfree(comm);
 		}
 
 		seq_puts(m, "\n");
@@ -982,7 +1034,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	list_del(&msm_obj->node);
 	mutex_unlock(&priv->obj_lock);
 
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, NULL, true);
 
 	if (obj->import_attach) {
 		GEM_WARN_ON(msm_obj->vaddr);
@@ -992,13 +1044,10 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		 */
 		kvfree(msm_obj->pages);
 
-		put_iova_vmas(obj);
-
 		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
 		msm_gem_vunmap(obj);
 		put_pages(obj);
-		put_iova_vmas(obj);
 	}
 
 	drm_gem_object_release(obj);
@@ -1104,7 +1153,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
 	INIT_LIST_HEAD(&msm_obj->node);
-	INIT_LIST_HEAD(&msm_obj->vmas);
 
 	*obj = &msm_obj->base;
 	(*obj)->funcs = &msm_gem_object_funcs;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9bd78642671c..60769c68d408 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -10,6 +10,7 @@
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
 #include "drm/drm_exec.h"
+#include "drm/drm_gpuvm.h"
 #include "drm/gpu_scheduler.h"
 #include "msm_drv.h"
 
@@ -22,30 +23,67 @@
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
 #define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
+/**
+ * struct msm_gem_vm - VM object
+ *
+ * A VM object representing a GPU (or display or GMU or ...) virtual address
+ * space.
+ *
+ * In the case of GPU, if per-process address spaces are supported, the address
+ * space is split into two VMs, which map to TTBR0 and TTBR1 in the SMMU.  TTBR0
+ * is used for userspace objects, and is unique per msm_context/drm_file, while
+ * TTBR1 is the same for all processes.  (The kernel controlled ringbuffer and
+ * a few other kernel controlled buffers live in TTBR1.)
+ *
+ * The GPU TTBR0 vm can be managed by userspace or by the kernel, depending on
+ * whether userspace supports VM_BIND.  All other vm's are managed by the kernel.
+ * (Managed by kernel means the kernel is responsible for VA allocation.)
+ *
+ * Note that because VM_BIND allows a given BO to be mapped multiple times in
+ * a VM, and therefore have multiple VMA's in a VM, there is an extra object
+ * provided by drm_gpuvm infrastructure.. the drm_gpuvm_bo, which is not
+ * embedded in any larger driver structure.  The GEM object holds a list of
+ * drm_gpuvm_bo, which in turn holds a list of msm_gem_vma.  A linked vma
+ * holds a reference to the vm_bo, and drops it when the vma is unlinked.
+ * So we just need to call drm_gpuvm_bo_obtain() to return a ref to an
+ * existing vm_bo, or create a new one.  Once the vma is linked, the ref
+ * to the vm_bo can be dropped (since the vma is holding one).
+ */
 struct msm_gem_vm {
-	const char *name;
-	/* NOTE: mm managed at the page level, size is in # of pages
-	 * and position mm_node->start is in # of pages:
+	/** @base: Inherit from drm_gpuvm. */
+	struct drm_gpuvm base;
+
+	/**
+	 * @mm: Memory management for kernel managed VA allocations
+	 *
+	 * Only used for kernel managed VMs, unused for user managed VMs.
+	 *
+	 * Protected by @mm_lock.
 	 */
 	struct drm_mm mm;
-	spinlock_t lock; /* Protects drm_mm node allocation/removal */
+
+	/** @mm_lock: protects @mm node allocation/removal */
+	struct spinlock mm_lock;
+
+	/** @vm_lock: protects gpuvm insert/remove/traverse */
+	struct mutex vm_lock;
+
+	/** @mmu: The mmu object which manages the pgtables */
 	struct msm_mmu *mmu;
-	struct kref kref;
 
-	/* For address spaces associated with a specific process, this
+	/**
+	 * @pid: For address spaces associated with a specific process, this
 	 * will be non-NULL:
 	 */
 	struct pid *pid;
 
-	/* @faults: the number of GPU hangs associated with this address space */
+	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
-	/** @va_start: lowest possible address to allocate */
-	uint64_t va_start;
-
-	/** @va_size: the size of the address space (in bytes) */
-	uint64_t va_size;
+	/** @managed: is this a kernel managed VM? */
+	bool managed;
 };
+#define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
 struct msm_gem_vm *
 msm_gem_vm_get(struct msm_gem_vm *vm);
@@ -53,18 +91,33 @@ msm_gem_vm_get(struct msm_gem_vm *vm);
 void msm_gem_vm_put(struct msm_gem_vm *vm);
 
 struct msm_gem_vm *
-msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
-		u64 va_start, u64 size);
+msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
+		  u64 va_start, u64 va_size, bool managed);
 
 struct msm_fence_context;
 
+#define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
+
+/**
+ * struct msm_gem_vma - a VMA mapping
+ *
+ * Represents a combination of a GEM object plus a VM.
+ */
 struct msm_gem_vma {
+	/** @base: inherit from drm_gpuva */
+	struct drm_gpuva base;
+
+	/**
+	 * @node: mm node for VA allocation
+	 *
+	 * Only used by kernel managed VMs
+	 */
 	struct drm_mm_node node;
-	uint64_t iova;
-	struct msm_gem_vm *vm;
-	struct list_head list;    /* node in msm_gem_object::vmas */
+
+	/** @mapped: Is this VMA mapped? */
 	bool mapped;
 };
+#define to_msm_vma(x) container_of(x, struct msm_gem_vma, base)
 
 struct msm_gem_vma *
 msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
@@ -100,8 +153,6 @@ struct msm_gem_object {
 	struct sg_table *sgt;
 	void *vaddr;
 
-	struct list_head vmas;    /* list of msm_gem_vma */
-
 	char name[32]; /* Identifier to print for the debugfs files */
 
 	/* userspace metadata backchannel */
@@ -292,6 +343,7 @@ struct msm_gem_submit {
 			struct drm_gem_object *obj;
 			uint32_t handle;
 		};
+		struct drm_gpuvm_bo *vm_bo;
 		uint64_t iova;
 	} bos[];
 };
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c184b1a1f522..c8e6750e77a3 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -321,7 +321,8 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		submit->bos[i].iova = vma->iova;
+		submit->bos[i].vm_bo = drm_gpuvm_bo_get(vma->base.vm_bo);
+		submit->bos[i].iova = vma->base.va.addr;
 	}
 
 	/*
@@ -474,8 +475,10 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
+		struct drm_gpuvm_bo *vm_bo = submit->bos[i].vm_bo;
 
 		drm_gem_object_put(obj);
+		drm_gpuvm_bo_put(vm_bo);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index ca29e81d79d2..1f4c9b5c2e8f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -5,14 +5,13 @@
  */
 
 #include "msm_drv.h"
-#include "msm_fence.h"
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
 static void
-msm_gem_vm_destroy(struct kref *kref)
+msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
-	struct msm_gem_vm *vm = container_of(kref, struct msm_gem_vm, kref);
+	struct msm_gem_vm *vm = container_of(gpuvm, struct msm_gem_vm, base);
 
 	drm_mm_takedown(&vm->mm);
 	if (vm->mmu)
@@ -25,14 +24,14 @@ msm_gem_vm_destroy(struct kref *kref)
 void msm_gem_vm_put(struct msm_gem_vm *vm)
 {
 	if (vm)
-		kref_put(&vm->kref, msm_gem_vm_destroy);
+		drm_gpuvm_put(&vm->base);
 }
 
 struct msm_gem_vm *
 msm_gem_vm_get(struct msm_gem_vm *vm)
 {
 	if (!IS_ERR_OR_NULL(vm))
-		kref_get(&vm->kref);
+		drm_gpuvm_get(&vm->base);
 
 	return vm;
 }
@@ -40,14 +39,14 @@ msm_gem_vm_get(struct msm_gem_vm *vm)
 /* Actually unmap memory for the vma */
 void msm_gem_vma_purge(struct msm_gem_vma *vma)
 {
-	struct msm_gem_vm *vm = vma->vm;
-	unsigned size = vma->node.size;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
+	unsigned size = vma->base.va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->iova, size);
+	vm->mmu->funcs->unmap(vm->mmu, vma->base.va.addr, size);
 
 	vma->mapped = false;
 }
@@ -57,10 +56,10 @@ int
 msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 		struct sg_table *sgt, int size)
 {
-	struct msm_gem_vm *vm = vma->vm;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
 	int ret;
 
-	if (GEM_WARN_ON(!vma->iova))
+	if (GEM_WARN_ON(!vma->base.va.addr))
 		return -EINVAL;
 
 	if (vma->mapped)
@@ -68,9 +67,6 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 
 	vma->mapped = true;
 
-	if (!vm)
-		return 0;
-
 	/*
 	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
@@ -80,7 +76,7 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->iova, sgt, size, prot);
+	ret = vm->mmu->funcs->map(vm->mmu, vma->base.va.addr, sgt, size, prot);
 
 	if (ret) {
 		vma->mapped = false;
@@ -92,19 +88,20 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 /* Close an iova.  Warn if it is still in use */
 void msm_gem_vma_close(struct msm_gem_vma *vma)
 {
-	struct msm_gem_vm *vm = vma->vm;
+	struct msm_gem_vm *vm = to_msm_vm(vma->base.vm);
 
 	GEM_WARN_ON(vma->mapped);
 
-	spin_lock(&vm->lock);
-	if (vma->iova)
+	spin_lock(&vm->mm_lock);
+	if (vma->base.va.addr)
 		drm_mm_remove_node(&vma->node);
-	spin_unlock(&vm->lock);
+	spin_unlock(&vm->mm_lock);
 
-	vma->iova = 0;
-	list_del(&vma->list);
+	mutex_lock(&vm->vm_lock);
+	drm_gpuva_remove(&vma->base);
+	drm_gpuva_unlink(&vma->base);
+	mutex_unlock(&vm->vm_lock);
 
-	msm_gem_vm_put(vm);
 	kfree(vma);
 }
 
@@ -113,6 +110,7 @@ struct msm_gem_vma *
 msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end)
 {
+	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
 	int ret;
 
@@ -120,36 +118,83 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
-	vma->vm = vm;
+	if (vm->managed) {
+		spin_lock(&vm->mm_lock);
+		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
+						obj->size, PAGE_SIZE, 0,
+						range_start, range_end, 0);
+		spin_unlock(&vm->mm_lock);
 
-	spin_lock(&vm->lock);
-	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  obj->size, PAGE_SIZE, 0,
-					  range_start, range_end, 0);
-	spin_unlock(&vm->lock);
+		if (ret)
+			goto err_free_vma;
 
-	if (ret)
-		goto err_free_vma;
+		range_start = vma->node.start;
+		range_end   = range_start + obj->size;
+	}
 
-	vma->iova = vma->node.start;
+	GEM_WARN_ON((range_end - range_start) > obj->size);
+
+	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
 	vma->mapped = false;
 
-	INIT_LIST_HEAD(&vma->list);
+	mutex_lock(&vm->vm_lock);
+	ret = drm_gpuva_insert(&vm->base, &vma->base);
+	mutex_unlock(&vm->vm_lock);
+	if (ret)
+		goto err_free_range;
 
-	kref_get(&vm->kref);
+	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
+	if (IS_ERR(vm_bo)) {
+		ret = PTR_ERR(vm_bo);
+		goto err_va_remove;
+	}
+
+	mutex_lock(&vm->vm_lock);
+	drm_gpuvm_bo_extobj_add(vm_bo);
+	drm_gpuva_link(&vma->base, vm_bo);
+	mutex_unlock(&vm->vm_lock);
+	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
 	return vma;
 
+err_va_remove:
+	mutex_lock(&vm->vm_lock);
+	drm_gpuva_remove(&vma->base);
+	mutex_unlock(&vm->vm_lock);
+err_free_range:
+	if (vm->managed)
+		drm_mm_remove_node(&vma->node);
 err_free_vma:
 	kfree(vma);
 	return ERR_PTR(ret);
 }
 
+static const struct drm_gpuvm_ops msm_gpuvm_ops = {
+	.vm_free = msm_gem_vm_free,
+};
+
+/**
+ * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
+ * @drm: the drm device
+ * @mmu: the backing MMU objects handling mapping/unmapping
+ * @name: the name of the VM
+ * @va_start: the start offset of the VA space
+ * @va_size: the size of the VA space
+ * @managed: is it a kernel managed VM?
+ *
+ * In a kernel managed VM, the kernel handles address allocation, and only
+ * synchronous operations are supported.  In a user managed VM, userspace
+ * handles virtual address allocation, and both async and sync operations
+ * are supported.
+ */
 struct msm_gem_vm *
-msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
-		u64 va_start, u64 size)
+msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
+		  u64 va_start, u64 va_size, bool managed)
 {
+	enum drm_gpuvm_flags flags = 0;
 	struct msm_gem_vm *vm;
+	struct drm_gem_object *dummy_gem;
+	int ret = 0;
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
@@ -158,15 +203,28 @@ msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
 	if (!vm)
 		return ERR_PTR(-ENOMEM);
 
-	spin_lock_init(&vm->lock);
-	vm->name = name;
-	vm->mmu = mmu;
-	vm->va_start = va_start;
-	vm->va_size  = size;
+	dummy_gem = drm_gpuvm_resv_object_alloc(drm);
+	if (!dummy_gem) {
+		ret = -ENOMEM;
+		goto err_free_vm;
+	}
+
+	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
+		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
+	drm_gem_object_put(dummy_gem);
+
+	spin_lock_init(&vm->mm_lock);
+	mutex_init(&vm->vm_lock);
 
-	drm_mm_init(&vm->mm, va_start, size);
+	vm->mmu = mmu;
+	vm->managed = managed;
 
-	kref_init(&vm->kref);
+	drm_mm_init(&vm->mm, va_start, va_size);
 
 	return vm;
+
+err_free_vm:
+	kfree(vm);
+	return ERR_PTR(ret);
+
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 88504c4b842f..6458bd82a0cd 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -204,8 +204,8 @@ struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
 		return NULL;
 	}
 
-	vm = msm_gem_vm_create(mmu, "mdp_kms",
-		0x1000, 0x100000000 - 0x1000);
+	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",
+			       0x1000, 0x100000000 - 0x1000, true);
 	if (IS_ERR(vm)) {
 		dev_err(mdp_dev, "vm create, error %pe\n", vm);
 		mmu->funcs->destroy(mmu);
-- 
2.49.0


