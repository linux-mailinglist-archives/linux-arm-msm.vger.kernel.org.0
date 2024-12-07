Return-Path: <linux-arm-msm+bounces-40863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441E9E80D3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29D0E283050
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F4514EC5B;
	Sat,  7 Dec 2024 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CipV+6c/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C914D2A0;
	Sat,  7 Dec 2024 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588264; cv=none; b=G1IcJTAfHUiOk1jbJ9fBTCbyOL7QwgfGf4LvI+dJbl0kE6ku2SdBk/pHwmh5/MFSEl9YbyzzYCH7RsLv04wBNZy15z5+21a+5+3VX5mm3nahUy4ez7IGcapCg6zgMHreo/Wj0HPvBfxfZ7O7oXZbFV0wc6uuTHKRK2EUXI+mKbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588264; c=relaxed/simple;
	bh=x2eJNUPqAUAEo+jV6YnnQWps7oZnemmFJ0myfOOSvUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfBiah9P3cr/oVwbHY42o6rTjNBBp8auMoqSXYh66K9YCpGmrHIC3+IKSbt7VawGWxcVJ+x7XFIBYhk3oZHpBuNCzLSFWv19+Qavxidj+cI/IcpWajggxLPPyrxXqOyYgIjqw0cx+Hfk4a3s9lZutx7BevMubXLdEAb7BqOtbOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CipV+6c/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725dbdf380aso190927b3a.3;
        Sat, 07 Dec 2024 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588259; x=1734193059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBltBfbzYC8e4urfh/RR4ynd84ldUvC9PpEd6BoRpFs=;
        b=CipV+6c/2lFyCWoGj/yo0XqWAno40KuNkeu1UGG8JyhjY1HZnTszW9a9Hpf66/jwqc
         2yLFdV//sMLOnuHS4sgYXYBNu2dVUsLDQJcWUhrCEinjzKm+TtGgT5ToJvKRmxo6vdeW
         aDN71abu1S8CPxR+jmDvMT6BCjd1GQevSOlpgGO0YRiBoeuf5QZDI3OIZJB48YpxSJif
         P/l1146iSywQWfN029hVFk/YOJd0Y9FeLhGyF80U0QZSwMU6br1y1JsYMr46mNiMkhtp
         lccUa1D5bXmF1nSVrqb0ISj9IrWpDPUT7cchLTDGXxqtr7lDppLwuPzMLCPlRR2q22Yf
         n5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588259; x=1734193059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBltBfbzYC8e4urfh/RR4ynd84ldUvC9PpEd6BoRpFs=;
        b=k+E8aKr0i/nrAv7hLEl/NXHFZZWE74pipnyrBEd4C7EiOCp1DldghEk02OsvYf1oRB
         /MuxyPqgSNgT2cqpO1Ylbm6UGUqt7anV2S4GzyWJGUk3HiMEEwfuuvBVFYf9x9PWtHHz
         lTSx73IGFazUiE3PoYMlQyPdyUu8pHiHT7Dau67mGRzOJwGe2jaGSCWEmcCJ0H1YuLFA
         zJtkPPOkeE2qhMQCSYtDTi5dwdGB2atsyoQc24vOB7XrtceEJZHuf7OhFZMh6Wam92nY
         COkant9UorrEgdhrVjrpubvklZ/8tMz7KgXRxy2UGF5O1NOaahxgxcZqPSg8GZo1qER0
         2uRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJK00r3wlF1EE18sHg0g6Nx85415tGNVucOYnyg+6PwU9Gh956w8hVjc7KUb4HDkJSzOxjt4Yiu7CyZuI+@vger.kernel.org, AJvYcCX2BNijFJ4hrTb7uaFbFBbOJwlgrudwP5uB3ATUplyItEcI8l4WBng97gCnOHAlagadoWx6TOSoVuK9BeYQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0x0I26fYQ/S80iAkKbxBd+yp6mUsXBOSjCkLFpVmPe4wD2d2j
	5c1UfgmBW2M+W3GjpgH1sPCvL2HFUcgQwFrK7ijJWraPbrcPgeRg
X-Gm-Gg: ASbGncvE8B/nRyxKZiQ6h/LxqLRZ+mRpv9paYLIqXWEwa30Ui+KdBiVvVB5+MYJOrUe
	CQAUryKCWCkGkg5UA1WnyIW/2jMaUYrtTeEJP4ypS0Uqf6eLVKYJgcXRusuF7IiH00RQpRoqfwc
	6VhkYpcNCTvWp/VB8PrwJdePsvWsYrIuhJIjRz/zIGkNrbRzwsDgQpLfoPGNJ3FKKJ5o6JUMaXv
	2NIzDXdSkCIwS/Dl84OH9JrN0r2Zuk4XPjzs1ETf5E1xnthj/W5Fn/AD1x4SLYeRfmFNYlWb1kV
	B+SpdwCm
X-Google-Smtp-Source: AGHT+IF0b+c48LSCHEbO8/ozrKW3bm9Q0STbv75TXxpBScxGkH3WHbmlb+c46qQbN2yEe7q2qk64og==
X-Received: by 2002:a05:6a00:4603:b0:71e:69e:596b with SMTP id d2e1a72fcca58-725b81dda50mr10539532b3a.17.1733588258972;
        Sat, 07 Dec 2024 08:17:38 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2ca8954sm4652115b3a.133.2024.12.07.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:38 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paloma Arellano <quic_parellan@quicinc.com>,
	Jani Nikula <jani.nikula@intel.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Jun Nie <jun.nie@linaro.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 06/24] drm/msm: Rename msm_gem_address_space -> msm_gem_vm
Date: Sat,  7 Dec 2024 08:15:06 -0800
Message-ID: <20241207161651.410556-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Re-aligning naming to better match drm_gpuvm terminology will make
things less confusing at the end of the drm_gpuvm conversion.

This is just rename churn, no functional change.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         | 18 ++--
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  4 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 22 ++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     | 10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 26 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 45 +++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |  6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     | 10 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 43 +++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 18 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 18 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 18 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      | 24 ++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 12 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 18 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 12 +--
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 14 +--
 drivers/gpu/drm/msm/msm_drv.c                 |  8 +-
 drivers/gpu/drm/msm/msm_drv.h                 | 10 +-
 drivers/gpu/drm/msm/msm_fb.c                  | 10 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                 | 74 +++++++--------
 drivers/gpu/drm/msm/msm_gem.h                 | 34 +++----
 drivers/gpu/drm/msm/msm_gem_submit.c          |  6 +-
 drivers/gpu/drm/msm/msm_gem_vma.c             | 93 +++++++++----------
 drivers/gpu/drm/msm/msm_gpu.c                 | 46 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h                 | 16 ++--
 drivers/gpu/drm/msm/msm_kms.c                 | 12 +--
 drivers/gpu/drm/msm/msm_kms.h                 |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |  4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  2 +-
 41 files changed, 344 insertions(+), 349 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 379a3d346c30..5eb063ed0b46 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -113,7 +113,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	uint32_t *ptr, len;
 	int i, ret;
 
-	a2xx_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
+	a2xx_gpummu_params(gpu->vm->mmu, &pt_base, &tran_error);
 
 	DBG("%s", gpu->name);
 
@@ -466,19 +466,19 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
-static struct msm_gem_address_space *
-a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+static struct msm_gem_vm *
+a2xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 
-	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
+	vm = msm_gem_vm_create(mmu, "gpu", SZ_16M,
 		0xfff * SZ_64K);
 
-	if (IS_ERR(aspace) && !IS_ERR(mmu))
+	if (IS_ERR(vm) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
 
-	return aspace;
+	return vm;
 }
 
 static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
@@ -504,7 +504,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.gpu_state_get = a2xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
-		.create_address_space = a2xx_create_address_space,
+		.create_vm = a2xx_create_vm,
 		.get_rptr = a2xx_get_rptr,
 	},
 };
@@ -551,7 +551,7 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	else
 		adreno_gpu->registers = a220_registers;
 
-	if (!gpu->aspace) {
+	if (!gpu->vm) {
 		dev_err(dev->dev, "No memory protection without MMU\n");
 		if (!allow_vram_carveout) {
 			ret = -ENXIO;
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index b6df115bb567..434e6ededf83 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -526,7 +526,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_busy = a3xx_gpu_busy,
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
-		.create_address_space = adreno_create_address_space,
+		.create_vm = adreno_create_vm,
 		.get_rptr = a3xx_get_rptr,
 	},
 };
@@ -581,7 +581,7 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 			goto fail;
 	}
 
-	if (!gpu->aspace) {
+	if (!gpu->vm) {
 		/* TODO we think it is possible to configure the GPU to
 		 * restrict access to VRAM carveout.  But the required
 		 * registers are unknown.  For now just bail out and
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index f1b18a6663f7..2c75debcfd84 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -645,7 +645,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_busy = a4xx_gpu_busy,
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
-		.create_address_space = adreno_create_address_space,
+		.create_vm = adreno_create_vm,
 		.get_rptr = a4xx_get_rptr,
 	},
 	.get_timestamp = a4xx_get_timestamp,
@@ -695,7 +695,7 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
 
-	if (!gpu->aspace) {
+	if (!gpu->vm) {
 		/* TODO we think it is possible to configure the GPU to
 		 * restrict access to VRAM carveout.  But the required
 		 * registers are unknown.  For now just bail out and
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 169b8fe688f8..625a4e787d8f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -116,13 +116,13 @@ reset_set(void *data, u64 val)
 	adreno_gpu->fw[ADRENO_FW_PFP] = NULL;
 
 	if (a5xx_gpu->pm4_bo) {
-		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->aspace);
+		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->vm);
 		drm_gem_object_put(a5xx_gpu->pm4_bo);
 		a5xx_gpu->pm4_bo = NULL;
 	}
 
 	if (a5xx_gpu->pfp_bo) {
-		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->aspace);
+		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->vm);
 		drm_gem_object_put(a5xx_gpu->pfp_bo);
 		a5xx_gpu->pfp_bo = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index caf2c0a7a29f..4814c470e3a1 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -620,7 +620,7 @@ static int a5xx_ucode_load(struct msm_gpu *gpu)
 			a5xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
 				sizeof(u32) * gpu->nr_rings,
 				MSM_BO_WC | MSM_BO_MAP_PRIV,
-				gpu->aspace, &a5xx_gpu->shadow_bo,
+				gpu->vm, &a5xx_gpu->shadow_bo,
 				&a5xx_gpu->shadow_iova);
 
 			if (IS_ERR(a5xx_gpu->shadow))
@@ -1040,22 +1040,22 @@ static void a5xx_destroy(struct msm_gpu *gpu)
 	a5xx_preempt_fini(gpu);
 
 	if (a5xx_gpu->pm4_bo) {
-		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->aspace);
+		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->vm);
 		drm_gem_object_put(a5xx_gpu->pm4_bo);
 	}
 
 	if (a5xx_gpu->pfp_bo) {
-		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->aspace);
+		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->vm);
 		drm_gem_object_put(a5xx_gpu->pfp_bo);
 	}
 
 	if (a5xx_gpu->gpmu_bo) {
-		msm_gem_unpin_iova(a5xx_gpu->gpmu_bo, gpu->aspace);
+		msm_gem_unpin_iova(a5xx_gpu->gpmu_bo, gpu->vm);
 		drm_gem_object_put(a5xx_gpu->gpmu_bo);
 	}
 
 	if (a5xx_gpu->shadow_bo) {
-		msm_gem_unpin_iova(a5xx_gpu->shadow_bo, gpu->aspace);
+		msm_gem_unpin_iova(a5xx_gpu->shadow_bo, gpu->vm);
 		drm_gem_object_put(a5xx_gpu->shadow_bo);
 	}
 
@@ -1455,7 +1455,7 @@ static int a5xx_crashdumper_init(struct msm_gpu *gpu,
 		struct a5xx_crashdumper *dumper)
 {
 	dumper->ptr = msm_gem_kernel_new(gpu->dev,
-		SZ_1M, MSM_BO_WC, gpu->aspace,
+		SZ_1M, MSM_BO_WC, gpu->vm,
 		&dumper->bo, &dumper->iova);
 
 	if (!IS_ERR(dumper->ptr))
@@ -1555,7 +1555,7 @@ static void a5xx_gpu_state_get_hlsq_regs(struct msm_gpu *gpu,
 
 	if (a5xx_crashdumper_run(gpu, &dumper)) {
 		kfree(a5xx_state->hlsqregs);
-		msm_gem_kernel_put(dumper.bo, gpu->aspace);
+		msm_gem_kernel_put(dumper.bo, gpu->vm);
 		return;
 	}
 
@@ -1563,7 +1563,7 @@ static void a5xx_gpu_state_get_hlsq_regs(struct msm_gpu *gpu,
 	memcpy(a5xx_state->hlsqregs, dumper.ptr + (256 * SZ_1K),
 		count * sizeof(u32));
 
-	msm_gem_kernel_put(dumper.bo, gpu->aspace);
+	msm_gem_kernel_put(dumper.bo, gpu->vm);
 }
 
 static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
@@ -1711,7 +1711,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_busy = a5xx_gpu_busy,
 		.gpu_state_get = a5xx_gpu_state_get,
 		.gpu_state_put = a5xx_gpu_state_put,
-		.create_address_space = adreno_create_address_space,
+		.create_vm = adreno_create_vm,
 		.get_rptr = a5xx_get_rptr,
 	},
 	.get_timestamp = a5xx_get_timestamp,
@@ -1789,8 +1789,8 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (gpu->aspace)
-		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu, a5xx_fault_handler);
+	if (gpu->vm)
+		msm_mmu_set_fault_handler(gpu->vm->mmu, gpu, a5xx_fault_handler);
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
 	a5xx_preempt_init(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index 6b91e0bd1514..d6da7351cfbb 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -363,7 +363,7 @@ void a5xx_gpmu_ucode_init(struct msm_gpu *gpu)
 	bosize = (cmds_size + (cmds_size / TYPE4_MAX_PAYLOAD) + 1) << 2;
 
 	ptr = msm_gem_kernel_new(drm, bosize,
-		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace,
+		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->vm,
 		&a5xx_gpu->gpmu_bo, &a5xx_gpu->gpmu_iova);
 	if (IS_ERR(ptr))
 		return;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 0469fea55010..5f9e2eb80a2c 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -254,7 +254,7 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
 
 	ptr = msm_gem_kernel_new(gpu->dev,
 		A5XX_PREEMPT_RECORD_SIZE + A5XX_PREEMPT_COUNTER_SIZE,
-		MSM_BO_WC | MSM_BO_MAP_PRIV, gpu->aspace, &bo, &iova);
+		MSM_BO_WC | MSM_BO_MAP_PRIV, gpu->vm, &bo, &iova);
 
 	if (IS_ERR(ptr))
 		return PTR_ERR(ptr);
@@ -262,9 +262,9 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
 	/* The buffer to store counters needs to be unprivileged */
 	counters = msm_gem_kernel_new(gpu->dev,
 		A5XX_PREEMPT_COUNTER_SIZE,
-		MSM_BO_WC, gpu->aspace, &counters_bo, &counters_iova);
+		MSM_BO_WC, gpu->vm, &counters_bo, &counters_iova);
 	if (IS_ERR(counters)) {
-		msm_gem_kernel_put(bo, gpu->aspace);
+		msm_gem_kernel_put(bo, gpu->vm);
 		return PTR_ERR(counters);
 	}
 
@@ -295,8 +295,8 @@ void a5xx_preempt_fini(struct msm_gpu *gpu)
 	int i;
 
 	for (i = 0; i < gpu->nr_rings; i++) {
-		msm_gem_kernel_put(a5xx_gpu->preempt_bo[i], gpu->aspace);
-		msm_gem_kernel_put(a5xx_gpu->preempt_counters_bo[i], gpu->aspace);
+		msm_gem_kernel_put(a5xx_gpu->preempt_bo[i], gpu->vm);
+		msm_gem_kernel_put(a5xx_gpu->preempt_counters_bo[i], gpu->vm);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14db7376c712..31cceb9eb51a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1218,15 +1218,15 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 
 static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 {
-	msm_gem_kernel_put(gmu->hfi.obj, gmu->aspace);
-	msm_gem_kernel_put(gmu->debug.obj, gmu->aspace);
-	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace);
-	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace);
-	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace);
-	msm_gem_kernel_put(gmu->log.obj, gmu->aspace);
-
-	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
-	msm_gem_address_space_put(gmu->aspace);
+	msm_gem_kernel_put(gmu->hfi.obj, gmu->vm);
+	msm_gem_kernel_put(gmu->debug.obj, gmu->vm);
+	msm_gem_kernel_put(gmu->icache.obj, gmu->vm);
+	msm_gem_kernel_put(gmu->dcache.obj, gmu->vm);
+	msm_gem_kernel_put(gmu->dummy.obj, gmu->vm);
+	msm_gem_kernel_put(gmu->log.obj, gmu->vm);
+
+	gmu->vm->mmu->funcs->detach(gmu->vm->mmu);
+	msm_gem_vm_put(gmu->vm);
 }
 
 static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
@@ -1255,7 +1255,7 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 	if (IS_ERR(bo->obj))
 		return PTR_ERR(bo->obj);
 
-	ret = msm_gem_get_and_pin_iova_range(bo->obj, gmu->aspace, &bo->iova,
+	ret = msm_gem_get_and_pin_iova_range(bo->obj, gmu->vm, &bo->iova,
 					     range_start, range_end);
 	if (ret) {
 		drm_gem_object_put(bo->obj);
@@ -1280,9 +1280,9 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 	if (IS_ERR(mmu))
 		return PTR_ERR(mmu);
 
-	gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x80000000);
-	if (IS_ERR(gmu->aspace))
-		return PTR_ERR(gmu->aspace);
+	gmu->vm = msm_gem_vm_create(mmu, "gmu", 0x0, 0x80000000);
+	if (IS_ERR(gmu->vm))
+		return PTR_ERR(gmu->vm);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b4a79f88ccf4..5ffabc16e35a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -50,7 +50,7 @@ struct a6xx_gmu {
 	/* For serializing communication with the GMU: */
 	struct mutex lock;
 
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 
 	void __iomem *mmio;
 	void __iomem *rscc;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 867c6161ef1f..6b961267614f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -120,7 +120,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
-	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
+	if (msm_iommu_pagetable_params(ctx->vm->mmu, &ttbr, &asid))
 		return;
 
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
@@ -945,7 +945,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 
 		msm_gem_object_set_name(a6xx_gpu->sqe_bo, "sqefw");
 		if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo)) {
-			msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
+			msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->vm);
 			drm_gem_object_put(a6xx_gpu->sqe_bo);
 
 			a6xx_gpu->sqe_bo = NULL;
@@ -962,7 +962,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
 						      sizeof(u32) * gpu->nr_rings,
 						      MSM_BO_WC | MSM_BO_MAP_PRIV,
-						      gpu->aspace, &a6xx_gpu->shadow_bo,
+						      gpu->vm, &a6xx_gpu->shadow_bo,
 						      &a6xx_gpu->shadow_iova);
 
 		if (IS_ERR(a6xx_gpu->shadow))
@@ -973,7 +973,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 
 	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
 							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
-							 gpu->aspace, &a6xx_gpu->pwrup_reglist_bo,
+							 gpu->vm, &a6xx_gpu->pwrup_reglist_bo,
 							 &a6xx_gpu->pwrup_reglist_iova);
 
 	if (IS_ERR(a6xx_gpu->pwrup_reglist_ptr))
@@ -2186,12 +2186,12 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	if (a6xx_gpu->sqe_bo) {
-		msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
+		msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->vm);
 		drm_gem_object_put(a6xx_gpu->sqe_bo);
 	}
 
 	if (a6xx_gpu->shadow_bo) {
-		msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->aspace);
+		msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
 		drm_gem_object_put(a6xx_gpu->shadow_bo);
 	}
 
@@ -2231,8 +2231,8 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 }
 
-static struct msm_gem_address_space *
-a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+static struct msm_gem_vm *
+a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -2246,22 +2246,22 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_CACHE_COHERENCY))
 		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
 
-	return adreno_iommu_create_address_space(gpu, pdev, quirks);
+	return adreno_iommu_create_vm(gpu, pdev, quirks);
 }
 
-static struct msm_gem_address_space *
-a6xx_create_private_address_space(struct msm_gpu *gpu)
+static struct msm_gem_vm *
+a6xx_create_private_vm(struct msm_gpu *gpu)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
+	mmu = msm_iommu_pagetable_create(gpu->vm->mmu);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
-	return msm_gem_address_space_create(mmu,
+	return msm_gem_vm_create(mmu,
 		"gpu", 0x100000000ULL,
-		adreno_private_address_space_size(gpu));
+		adreno_private_vm_size(gpu));
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
@@ -2378,8 +2378,8 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
-		.create_address_space = a6xx_create_address_space,
-		.create_private_address_space = a6xx_create_private_address_space,
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
 	},
@@ -2407,8 +2407,8 @@ static const struct adreno_gpu_funcs funcs_gmuwrapper = {
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
-		.create_address_space = a6xx_create_address_space,
-		.create_private_address_space = a6xx_create_private_address_space,
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
 	},
@@ -2438,8 +2438,8 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
-		.create_address_space = a6xx_create_address_space,
-		.create_private_address_space = a6xx_create_private_address_space,
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
 	},
@@ -2535,9 +2535,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
-	if (gpu->aspace)
-		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
-				a6xx_fault_handler);
+	if (gpu->vm)
+		msm_mmu_set_fault_handler(gpu->vm->mmu, gpu, a6xx_fault_handler);
 
 	a6xx_calc_ubwc_config(adreno_gpu);
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 0fcae53c0b14..a73613551493 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -132,7 +132,7 @@ static int a6xx_crashdumper_init(struct msm_gpu *gpu,
 		struct a6xx_crashdumper *dumper)
 {
 	dumper->ptr = msm_gem_kernel_new(gpu->dev,
-		SZ_1M, MSM_BO_WC, gpu->aspace,
+		SZ_1M, MSM_BO_WC, gpu->vm,
 		&dumper->bo, &dumper->iova);
 
 	if (!IS_ERR(dumper->ptr))
@@ -1610,7 +1610,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 			a7xx_get_clusters(gpu, a6xx_state, dumper);
 			a7xx_get_dbgahb_clusters(gpu, a6xx_state, dumper);
 
-			msm_gem_kernel_put(dumper->bo, gpu->aspace);
+			msm_gem_kernel_put(dumper->bo, gpu->vm);
 		}
 
 		a7xx_get_post_crashdumper_registers(gpu, a6xx_state);
@@ -1622,7 +1622,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 			a6xx_get_clusters(gpu, a6xx_state, dumper);
 			a6xx_get_dbgahb_clusters(gpu, a6xx_state, dumper);
 
-			msm_gem_kernel_put(dumper->bo, gpu->aspace);
+			msm_gem_kernel_put(dumper->bo, gpu->vm);
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 2fd4e39f618f..41229c60aa06 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -343,7 +343,7 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
 
 	ptr = msm_gem_kernel_new(gpu->dev,
 		PREEMPT_RECORD_SIZE(adreno_gpu),
-		MSM_BO_WC | MSM_BO_MAP_PRIV, gpu->aspace, &bo, &iova);
+		MSM_BO_WC | MSM_BO_MAP_PRIV, gpu->vm, &bo, &iova);
 
 	if (IS_ERR(ptr))
 		return PTR_ERR(ptr);
@@ -361,7 +361,7 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
 	ptr = msm_gem_kernel_new(gpu->dev,
 		PREEMPT_SMMU_INFO_SIZE,
 		MSM_BO_WC | MSM_BO_MAP_PRIV | MSM_BO_GPU_READONLY,
-		gpu->aspace, &bo, &iova);
+		gpu->vm, &bo, &iova);
 
 	if (IS_ERR(ptr))
 		return PTR_ERR(ptr);
@@ -376,7 +376,7 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
 
 	struct a7xx_cp_smmu_info *smmu_info_ptr = ptr;
 
-	msm_iommu_pagetable_params(gpu->aspace->mmu, &ttbr, &asid);
+	msm_iommu_pagetable_params(gpu->vm->mmu, &ttbr, &asid);
 
 	smmu_info_ptr->magic = GEN7_CP_SMMU_INFO_MAGIC;
 	smmu_info_ptr->ttbr0 = ttbr;
@@ -404,7 +404,7 @@ void a6xx_preempt_fini(struct msm_gpu *gpu)
 	int i;
 
 	for (i = 0; i < gpu->nr_rings; i++)
-		msm_gem_kernel_put(a6xx_gpu->preempt_bo[i], gpu->aspace);
+		msm_gem_kernel_put(a6xx_gpu->preempt_bo[i], gpu->vm);
 }
 
 void a6xx_preempt_init(struct msm_gpu *gpu)
@@ -430,7 +430,7 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
 	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
 			PAGE_SIZE,
 			MSM_BO_WC | MSM_BO_MAP_PRIV | MSM_BO_GPU_READONLY,
-			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
+			gpu->vm, &a6xx_gpu->preempt_postamble_bo,
 			&a6xx_gpu->preempt_postamble_iova);
 
 	preempt_prepare_postamble(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 719abefecb6f..14ac1900f031 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -191,21 +191,21 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-struct msm_gem_address_space *
-adreno_create_address_space(struct msm_gpu *gpu,
-			    struct platform_device *pdev)
+struct msm_gem_vm *
+adreno_create_vm(struct msm_gpu *gpu,
+		 struct platform_device *pdev)
 {
-	return adreno_iommu_create_address_space(gpu, pdev, 0);
+	return adreno_iommu_create_vm(gpu, pdev, 0);
 }
 
-struct msm_gem_address_space *
-adreno_iommu_create_address_space(struct msm_gpu *gpu,
-				  struct platform_device *pdev,
-				  unsigned long quirks)
+struct msm_gem_vm *
+adreno_iommu_create_vm(struct msm_gpu *gpu,
+		       struct platform_device *pdev,
+		       unsigned long quirks)
 {
 	struct iommu_domain_geometry *geometry;
 	struct msm_mmu *mmu;
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 	u64 start, size;
 
 	mmu = msm_iommu_gpu_new(&pdev->dev, gpu, quirks);
@@ -224,16 +224,15 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	start = max_t(u64, SZ_16M, geometry->aperture_start);
 	size = geometry->aperture_end - start + 1;
 
-	aspace = msm_gem_address_space_create(mmu, "gpu",
-		start & GENMASK_ULL(48, 0), size);
+	vm = msm_gem_vm_create(mmu, "gpu", start & GENMASK_ULL(48, 0), size);
 
-	if (IS_ERR(aspace) && !IS_ERR(mmu))
+	if (IS_ERR(vm) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
 
-	return aspace;
+	return vm;
 }
 
-u64 adreno_private_address_space_size(struct msm_gpu *gpu)
+u64 adreno_private_vm_size(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 
@@ -262,7 +261,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	 * it now.
 	 */
 	if (!do_devcoredump) {
-		gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+		gpu->vm->mmu->funcs->resume_translation(gpu->vm->mmu);
 	}
 
 	/*
@@ -356,8 +355,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = 0;
 		return 0;
 	case MSM_PARAM_FAULTS:
-		if (ctx->aspace)
-			*value = gpu->global_faults + ctx->aspace->faults;
+		if (ctx->vm)
+			*value = gpu->global_faults + ctx->vm->faults;
 		else
 			*value = gpu->global_faults;
 		return 0;
@@ -365,14 +364,14 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = gpu->suspend_count;
 		return 0;
 	case MSM_PARAM_VA_START:
-		if (ctx->aspace == gpu->aspace)
+		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->aspace->va_start;
+		*value = ctx->vm->va_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
-		if (ctx->aspace == gpu->aspace)
+		if (ctx->vm == gpu->vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
-		*value = ctx->aspace->va_size;
+		*value = ctx->vm->va_size;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
@@ -562,7 +561,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 	void *ptr;
 
 	ptr = msm_gem_kernel_new(gpu->dev, fw->size - 4,
-		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace, &bo, iova);
+		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->vm, &bo, iova);
 
 	if (IS_ERR(ptr))
 		return ERR_CAST(ptr);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index caf8816e6252..728e4b0def3d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -568,7 +568,7 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 	       adreno_is_a740_family(gpu);
 }
 
-u64 adreno_private_address_space_size(struct msm_gpu *gpu);
+u64 adreno_private_vm_size(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
 int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
@@ -611,14 +611,14 @@ void adreno_show_object(struct drm_printer *p, void **ptr, int len,
  * Common helper function to initialize the default address space for arm-smmu
  * attached targets
  */
-struct msm_gem_address_space *
-adreno_create_address_space(struct msm_gpu *gpu,
-			    struct platform_device *pdev);
-
-struct msm_gem_address_space *
-adreno_iommu_create_address_space(struct msm_gpu *gpu,
-				  struct platform_device *pdev,
-				  unsigned long quirks);
+struct msm_gem_vm *
+adreno_create_vm(struct msm_gpu *gpu,
+		 struct platform_device *pdev);
+
+struct msm_gem_vm *
+adreno_iommu_create_vm(struct msm_gpu *gpu,
+		       struct platform_device *pdev,
+		       unsigned long quirks);
 
 int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4c006ec74575..2c53c937485a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -558,7 +558,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	const struct msm_format *format;
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 	struct dpu_hw_wb_cfg *wb_cfg;
 	int ret;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -568,13 +568,13 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	wb_enc->wb_job = job;
 	wb_enc->wb_conn = job->connector;
-	aspace = phys_enc->dpu_kms->base.aspace;
+	vm = phys_enc->dpu_kms->base.vm;
 
 	wb_cfg = &wb_enc->wb_cfg;
 
 	memset(wb_cfg, 0, sizeof(struct dpu_hw_wb_cfg));
 
-	ret = msm_framebuffer_prepare(job->fb, aspace, false);
+	ret = msm_framebuffer_prepare(job->fb, vm, false);
 	if (ret) {
 		DPU_ERROR("prep fb failed, %d\n", ret);
 		return;
@@ -588,7 +588,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	dpu_format_populate_addrs(aspace, job->fb, &wb_cfg->dest);
+	dpu_format_populate_addrs(vm, job->fb, &wb_cfg->dest);
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
@@ -611,14 +611,14 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 
 	if (!job->fb)
 		return;
 
-	aspace = phys_enc->dpu_kms->base.aspace;
+	vm = phys_enc->dpu_kms->base.vm;
 
-	msm_framebuffer_cleanup(job->fb, aspace, false);
+	msm_framebuffer_cleanup(job->fb, vm, false);
 	wb_enc->wb_job = NULL;
 	wb_enc->wb_conn = NULL;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 59c9427da7dd..d115b79af771 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -274,7 +274,7 @@ int dpu_format_populate_plane_sizes(
 	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
-static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,
+static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
 					    struct drm_framebuffer *fb,
 					    struct dpu_hw_fmt_layout *layout)
 {
@@ -282,7 +282,7 @@ static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace
 	uint32_t base_addr = 0;
 	bool meta;
 
-	base_addr = msm_framebuffer_iova(fb, aspace, 0);
+	base_addr = msm_framebuffer_iova(fb, vm, 0);
 
 	fmt = msm_framebuffer_format(fb);
 	meta = MSM_FORMAT_IS_UBWC(fmt);
@@ -355,7 +355,7 @@ static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace
 	}
 }
 
-static void _dpu_format_populate_addrs_linear(struct msm_gem_address_space *aspace,
+static void _dpu_format_populate_addrs_linear(struct msm_gem_vm *vm,
 					      struct drm_framebuffer *fb,
 					      struct dpu_hw_fmt_layout *layout)
 {
@@ -363,17 +363,17 @@ static void _dpu_format_populate_addrs_linear(struct msm_gem_address_space *aspa
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i)
-		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
-}
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, vm, i);
+	}
 
 /**
  * dpu_format_populate_addrs - populate buffer addresses based on
  *                     mmu, fb, and format found in the fb
- * @aspace:            address space pointer
+ * @vm:                address space pointer
  * @fb:                framebuffer pointer
  * @layout:            format layout structure to populate
  */
-void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
+void dpu_format_populate_addrs(struct msm_gem_vm *vm,
 			       struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout)
 {
@@ -384,7 +384,7 @@ void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
-		_dpu_format_populate_addrs_ubwc(aspace, fb, layout);
+		_dpu_format_populate_addrs_ubwc(vm, fb, layout);
 	else
-		_dpu_format_populate_addrs_linear(aspace, fb, layout);
+		_dpu_format_populate_addrs_linear(vm, fb, layout);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index c6145d43aa3f..989f3e13c497 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,7 +31,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
+void dpu_format_populate_addrs(struct msm_gem_vm *vm,
 			       struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ca4847b2b738..37475f2a20ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1051,26 +1051,26 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
 {
 	struct msm_mmu *mmu;
 
-	if (!dpu_kms->base.aspace)
+	if (!dpu_kms->base.vm)
 		return;
 
-	mmu = dpu_kms->base.aspace->mmu;
+	mmu = dpu_kms->base.vm->mmu;
 
 	mmu->funcs->detach(mmu);
-	msm_gem_address_space_put(dpu_kms->base.aspace);
+	msm_gem_vm_put(dpu_kms->base.vm);
 
-	dpu_kms->base.aspace = NULL;
+	dpu_kms->base.vm = NULL;
 }
 
 static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 {
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 
-	aspace = msm_kms_init_aspace(dpu_kms->dev);
-	if (IS_ERR(aspace))
-		return PTR_ERR(aspace);
+	vm = msm_kms_init_vm(dpu_kms->dev);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
 
-	dpu_kms->base.aspace = aspace;
+	dpu_kms->base.vm = vm;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3ffac24333a2..f80b252603a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -72,7 +72,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 
 /*
  * struct dpu_plane - local dpu plane structure
- * @aspace: address space pointer
+ * @vm: address space pointer
  * @csc_ptr: Points to dpu_csc_cfg structure to use for current
  * @catalog: Points to dpu catalog structure
  * @revalidate: force revalidation of all the plane properties
@@ -655,8 +655,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", fb->base.id);
 
-	/* cache aspace */
-	pstate->aspace = kms->base.aspace;
+	/* cache vm */
+	pstate->vm = kms->base.vm;
 
 	/*
 	 * TODO: Need to sort out the msm_framebuffer_prepare() call below so
@@ -665,9 +665,9 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	 */
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	if (pstate->aspace) {
+	if (pstate->vm) {
 		ret = msm_framebuffer_prepare(new_state->fb,
-				pstate->aspace, pstate->needs_dirtyfb);
+				pstate->vm, pstate->needs_dirtyfb);
 		if (ret) {
 			DPU_ERROR("failed to prepare framebuffer\n");
 			return ret;
@@ -690,7 +690,7 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", old_state->fb->base.id);
 
-	msm_framebuffer_cleanup(old_state->fb, old_pstate->aspace,
+	msm_framebuffer_cleanup(old_state->fb, old_pstate->vm,
 				old_pstate->needs_dirtyfb);
 }
 
@@ -1187,7 +1187,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
-	dpu_format_populate_addrs(pstate->aspace, new_state->fb, &pstate->layout);
+	dpu_format_populate_addrs(pstate->vm, new_state->fb, &pstate->layout);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 97090ca7842b..3a76b57c137c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -17,7 +17,7 @@
 /**
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
- * @aspace:	pointer to address space for input/output buffers
+ * @vm:	pointer to address space for input/output buffers
  * @pipe:	software pipe description
  * @r_pipe:	software pipe description of the second pipe
  * @pipe_cfg:	software pipe configuration
@@ -34,7 +34,7 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 	struct dpu_sw_pipe pipe;
 	struct dpu_sw_pipe r_pipe;
 	struct dpu_sw_pipe_cfg pipe_cfg;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index b8610aa806ea..0133c0c01a0b 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -120,7 +120,7 @@ static void unref_cursor_worker(struct drm_flip_work *work, void *val)
 	struct mdp4_kms *mdp4_kms = get_kms(&mdp4_crtc->base);
 	struct msm_kms *kms = &mdp4_kms->base.base;
 
-	msm_gem_unpin_iova(val, kms->aspace);
+	msm_gem_unpin_iova(val, kms->vm);
 	drm_gem_object_put(val);
 }
 
@@ -369,7 +369,7 @@ static void update_cursor(struct drm_crtc *crtc)
 		if (next_bo) {
 			/* take a obj ref + iova ref when we start scanning out: */
 			drm_gem_object_get(next_bo);
-			msm_gem_get_and_pin_iova(next_bo, kms->aspace, &iova);
+			msm_gem_get_and_pin_iova(next_bo, kms->vm, &iova);
 
 			/* enable cursor: */
 			mdp4_write(mdp4_kms, REG_MDP4_DMA_CURSOR_SIZE(dma),
@@ -427,7 +427,7 @@ static int mdp4_crtc_cursor_set(struct drm_crtc *crtc,
 	}
 
 	if (cursor_bo) {
-		ret = msm_gem_get_and_pin_iova(cursor_bo, kms->aspace, &iova);
+		ret = msm_gem_get_and_pin_iova(cursor_bo, kms->vm, &iova);
 		if (ret)
 			goto fail;
 	} else {
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 6e4e74f9d63d..3c5f8c3a5059 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -120,15 +120,15 @@ static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
-	struct msm_gem_address_space *aspace = kms->aspace;
+	struct msm_gem_vm *vm = kms->vm;
 
 	if (mdp4_kms->blank_cursor_iova)
-		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->aspace);
+		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
-	if (aspace) {
-		aspace->mmu->funcs->detach(aspace->mmu);
-		msm_gem_address_space_put(aspace);
+	if (vm) {
+		vm->mmu->funcs->detach(vm->mmu);
+		msm_gem_vm_put(vm);
 	}
 
 	if (mdp4_kms->rpm_enabled)
@@ -380,7 +380,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
 	struct msm_kms *kms = NULL;
 	struct msm_mmu *mmu;
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 	int ret;
 	u32 major, minor;
 	unsigned long max_clk;
@@ -449,19 +449,19 @@ static int mdp4_kms_init(struct drm_device *dev)
 	} else if (!mmu) {
 		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
 				"contig buffers for scanout\n");
-		aspace = NULL;
+		vm = NULL;
 	} else {
-		aspace  = msm_gem_address_space_create(mmu,
+		vm  = msm_gem_vm_create(mmu,
 			"mdp4", 0x1000, 0x100000000 - 0x1000);
 
-		if (IS_ERR(aspace)) {
+		if (IS_ERR(vm)) {
 			if (!IS_ERR(mmu))
 				mmu->funcs->destroy(mmu);
-			ret = PTR_ERR(aspace);
+			ret = PTR_ERR(vm);
 			goto fail;
 		}
 
-		kms->aspace = aspace;
+		kms->vm = vm;
 	}
 
 	ret = modeset_init(mdp4_kms);
@@ -478,7 +478,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->aspace,
+	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->vm,
 			&mdp4_kms->blank_cursor_iova);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 3fefb2088008..7743be6167f8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -87,7 +87,7 @@ static int mdp4_plane_prepare_fb(struct drm_plane *plane,
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	return msm_framebuffer_prepare(new_state->fb, kms->aspace, false);
+	return msm_framebuffer_prepare(new_state->fb, kms->vm, false);
 }
 
 static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
@@ -102,7 +102,7 @@ static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", mdp4_plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, kms->aspace, false);
+	msm_framebuffer_cleanup(fb, kms->vm, false);
 }
 
 
@@ -153,13 +153,13 @@ static void mdp4_plane_set_scanout(struct drm_plane *plane,
 			MDP4_PIPE_SRC_STRIDE_B_P3(fb->pitches[3]));
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP0_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->aspace, 0));
+			msm_framebuffer_iova(fb, kms->vm, 0));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP1_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->aspace, 1));
+			msm_framebuffer_iova(fb, kms->vm, 1));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP2_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->aspace, 2));
+			msm_framebuffer_iova(fb, kms->vm, 2));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP3_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->aspace, 3));
+			msm_framebuffer_iova(fb, kms->vm, 3));
 }
 
 static void mdp4_write_csc_config(struct mdp4_kms *mdp4_kms,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 0f653e62b4a0..298861f373b0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -169,7 +169,7 @@ static void unref_cursor_worker(struct drm_flip_work *work, void *val)
 	struct mdp5_kms *mdp5_kms = get_kms(&mdp5_crtc->base);
 	struct msm_kms *kms = &mdp5_kms->base.base;
 
-	msm_gem_unpin_iova(val, kms->aspace);
+	msm_gem_unpin_iova(val, kms->vm);
 	drm_gem_object_put(val);
 }
 
@@ -993,7 +993,7 @@ static int mdp5_crtc_cursor_set(struct drm_crtc *crtc,
 	if (!cursor_bo)
 		return -ENOENT;
 
-	ret = msm_gem_get_and_pin_iova(cursor_bo, kms->aspace,
+	ret = msm_gem_get_and_pin_iova(cursor_bo, kms->vm,
 			&mdp5_crtc->cursor.iova);
 	if (ret) {
 		drm_gem_object_put(cursor_bo);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 374704cce656..bfbec278d19a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -198,11 +198,11 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
-	struct msm_gem_address_space *aspace = kms->aspace;
+	struct msm_gem_vm *vm = kms->vm;
 
-	if (aspace) {
-		aspace->mmu->funcs->detach(aspace->mmu);
-		msm_gem_address_space_put(aspace);
+	if (vm) {
+		vm->mmu->funcs->detach(vm->mmu);
+		msm_gem_vm_put(vm);
 	}
 
 	mdp_kms_destroy(&mdp5_kms->base);
@@ -500,7 +500,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct mdp5_kms *mdp5_kms;
 	struct mdp5_cfg *config;
 	struct msm_kms *kms = priv->kms;
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 	int i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
@@ -534,13 +534,13 @@ static int mdp5_kms_init(struct drm_device *dev)
 	}
 	mdelay(16);
 
-	aspace = msm_kms_init_aspace(mdp5_kms->dev);
-	if (IS_ERR(aspace)) {
-		ret = PTR_ERR(aspace);
+	vm = msm_kms_init_vm(mdp5_kms->dev);
+	if (IS_ERR(vm)) {
+		ret = PTR_ERR(vm);
 		goto fail;
 	}
 
-	kms->aspace = aspace;
+	kms->vm = vm;
 
 	pm_runtime_put_sync(&pdev->dev);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 62de248ed1b0..34e38b999120 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -144,7 +144,7 @@ static int mdp5_plane_prepare_fb(struct drm_plane *plane,
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	return msm_framebuffer_prepare(new_state->fb, kms->aspace, needs_dirtyfb);
+	return msm_framebuffer_prepare(new_state->fb, kms->vm, needs_dirtyfb);
 }
 
 static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
@@ -159,7 +159,7 @@ static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, kms->aspace, needed_dirtyfb);
+	msm_framebuffer_cleanup(fb, kms->vm, needed_dirtyfb);
 }
 
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
@@ -478,13 +478,13 @@ static void set_scanout_locked(struct mdp5_kms *mdp5_kms,
 			MDP5_PIPE_SRC_STRIDE_B_P3(fb->pitches[3]));
 
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC0_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->aspace, 0));
+			msm_framebuffer_iova(fb, kms->vm, 0));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC1_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->aspace, 1));
+			msm_framebuffer_iova(fb, kms->vm, 1));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC2_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->aspace, 2));
+			msm_framebuffer_iova(fb, kms->vm, 2));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC3_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->aspace, 3));
+			msm_framebuffer_iova(fb, kms->vm, 3));
 }
 
 /* Note: mdp5_plane->pipe_lock must be locked */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a98d24b7cb00..6ef3aaac1450 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -143,7 +143,7 @@ struct msm_dsi_host {
 
 	/* DSI 6G TX buffer*/
 	struct drm_gem_object *tx_gem_obj;
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 
 	/* DSI v2 TX buffer */
 	void *tx_buf;
@@ -1158,10 +1158,10 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size)
 	uint64_t iova;
 	u8 *data;
 
-	msm_host->aspace = msm_gem_address_space_get(priv->kms->aspace);
+	msm_host->vm = msm_gem_vm_get(priv->kms->vm);
 
 	data = msm_gem_kernel_new(dev, size, MSM_BO_WC,
-					msm_host->aspace,
+					msm_host->vm,
 					&msm_host->tx_gem_obj, &iova);
 
 	if (IS_ERR(data)) {
@@ -1205,10 +1205,10 @@ void msm_dsi_tx_buf_free(struct mipi_dsi_host *host)
 		return;
 
 	if (msm_host->tx_gem_obj) {
-		msm_gem_kernel_put(msm_host->tx_gem_obj, msm_host->aspace);
-		msm_gem_address_space_put(msm_host->aspace);
+		msm_gem_kernel_put(msm_host->tx_gem_obj, msm_host->vm);
+		msm_gem_vm_put(msm_host->vm);
 		msm_host->tx_gem_obj = NULL;
-		msm_host->aspace = NULL;
+		msm_host->vm = NULL;
 	}
 
 	if (msm_host->tx_buf)
@@ -1337,7 +1337,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *dma_base)
 		return -EINVAL;
 
 	return msm_gem_get_and_pin_iova(msm_host->tx_gem_obj,
-				priv->kms->aspace, dma_base);
+				priv->kms->vm, dma_base);
 }
 
 int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *dma_base)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e7c76d243ee7..88cd1ed59d48 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -345,7 +345,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
+	ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	ctx->seqno = atomic_inc_return(&ident);
@@ -523,7 +523,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, ctx->aspace, iova);
+	return msm_gem_get_iova(obj, ctx->vm, iova);
 }
 
 static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
@@ -537,13 +537,13 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 		return -EINVAL;
 
 	/* Only supported if per-process address space is supported: */
-	if (priv->gpu->aspace == ctx->aspace)
+	if (priv->gpu->vm == ctx->vm)
 		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
 
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
 
-	return msm_gem_set_iova(obj, ctx->aspace, iova);
+	return msm_gem_set_iova(obj, ctx->vm, iova);
 }
 
 static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fee31680a6d5..ce1ef981a309 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -48,7 +48,7 @@ struct msm_rd_state;
 struct msm_perf_state;
 struct msm_gem_submit;
 struct msm_fence_context;
-struct msm_gem_address_space;
+struct msm_gem_vm;
 struct msm_gem_vma;
 struct msm_disp_state;
 
@@ -241,7 +241,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc);
 int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
-struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev);
+struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
@@ -263,11 +263,11 @@ int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
 int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_address_space *aspace, bool needs_dirtyfb);
+		struct msm_gem_vm *vm, bool needs_dirtyfb);
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_address_space *aspace, bool needed_dirtyfb);
+		struct msm_gem_vm *vm, bool needed_dirtyfb);
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_address_space *aspace, int plane);
+		struct msm_gem_vm *vm, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 09268e416843..6df318b73534 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -76,7 +76,7 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 /* prepare/pin all the fb's bo's for scanout.
  */
 int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_address_space *aspace,
+		struct msm_gem_vm *vm,
 		bool needs_dirtyfb)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
@@ -88,7 +88,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 	atomic_inc(&msm_fb->prepare_count);
 
 	for (i = 0; i < n; i++) {
-		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &msm_fb->iova[i]);
+		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
@@ -99,7 +99,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 }
 
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_address_space *aspace,
+		struct msm_gem_vm *vm,
 		bool needed_dirtyfb)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
@@ -109,14 +109,14 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
 		refcount_dec(&msm_fb->dirtyfb);
 
 	for (i = 0; i < n; i++)
-		msm_gem_unpin_iova(fb->obj[i], aspace);
+		msm_gem_unpin_iova(fb->obj[i], vm);
 
 	if (!atomic_dec_return(&msm_fb->prepare_count))
 		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_address_space *aspace, int plane)
+		struct msm_gem_vm *vm, int plane)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	return msm_fb->iova[plane] + fb->offsets[plane];
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index c62249b1ab3d..b5969374d53f 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -122,7 +122,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	 * in panic (ie. lock-safe, etc) we could avoid pinning the
 	 * buffer now:
 	 */
-	ret = msm_gem_get_and_pin_iova(bo, priv->kms->aspace, &paddr);
+	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to get buffer obj iova: %d\n", ret);
 		goto fail;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 747e2ab8373a..c29367239283 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -398,14 +398,14 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 }
 
 static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace)
+		struct msm_gem_vm *vm)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
 
-	vma = msm_gem_vma_new(aspace);
+	vma = msm_gem_vma_new(vm);
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
@@ -415,7 +415,7 @@ static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
 }
 
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace)
+		struct msm_gem_vm *vm)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
@@ -423,7 +423,7 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
-		if (vma->aspace == aspace)
+		if (vma->vm == vm)
 			return vma;
 	}
 
@@ -454,7 +454,7 @@ put_iova_spaces(struct drm_gem_object *obj, bool close)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
-		if (vma->aspace) {
+		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
 				msm_gem_vma_close(vma);
@@ -477,19 +477,19 @@ put_iova_vmas(struct drm_gem_object *obj)
 }
 
 static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace,
+		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
 
-	vma = lookup_vma(obj, aspace);
+	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
 		int ret;
 
-		vma = add_vma(obj, aspace);
+		vma = add_vma(obj, vm);
 		if (IS_ERR(vma))
 			return vma;
 
@@ -561,13 +561,13 @@ void msm_gem_unpin_active(struct drm_gem_object *obj)
 }
 
 struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
-					   struct msm_gem_address_space *aspace)
+					   struct msm_gem_vm *vm)
 {
-	return get_vma_locked(obj, aspace, 0, U64_MAX);
+	return get_vma_locked(obj, vm, 0, U64_MAX);
 }
 
 static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova,
+		struct msm_gem_vm *vm, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
@@ -575,7 +575,7 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
-	vma = get_vma_locked(obj, aspace, range_start, range_end);
+	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
@@ -593,13 +593,13 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
  * limits iova to specified range (in pages)
  */
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova,
+		struct msm_gem_vm *vm, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
 	int ret;
 
 	msm_gem_lock(obj);
-	ret = get_and_pin_iova_range_locked(obj, aspace, iova, range_start, range_end);
+	ret = get_and_pin_iova_range_locked(obj, vm, iova, range_start, range_end);
 	msm_gem_unlock(obj);
 
 	return ret;
@@ -607,9 +607,9 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 
 /* get iova and pin it. Should have a matching put */
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova)
+		struct msm_gem_vm *vm, uint64_t *iova)
 {
-	return msm_gem_get_and_pin_iova_range(obj, aspace, iova, 0, U64_MAX);
+	return msm_gem_get_and_pin_iova_range(obj, vm, iova, 0, U64_MAX);
 }
 
 /*
@@ -617,13 +617,13 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
  * valid for the life of the object
  */
 int msm_gem_get_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova)
+		struct msm_gem_vm *vm, uint64_t *iova)
 {
 	struct msm_gem_vma *vma;
 	int ret = 0;
 
 	msm_gem_lock(obj);
-	vma = get_vma_locked(obj, aspace, 0, U64_MAX);
+	vma = get_vma_locked(obj, vm, 0, U64_MAX);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
@@ -635,9 +635,9 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 }
 
 static int clear_iova(struct drm_gem_object *obj,
-		      struct msm_gem_address_space *aspace)
+		      struct msm_gem_vm *vm)
 {
-	struct msm_gem_vma *vma = lookup_vma(obj, aspace);
+	struct msm_gem_vma *vma = lookup_vma(obj, vm);
 
 	if (!vma)
 		return 0;
@@ -657,20 +657,20 @@ static int clear_iova(struct drm_gem_object *obj,
  * Setting an iova of zero will clear the vma.
  */
 int msm_gem_set_iova(struct drm_gem_object *obj,
-		     struct msm_gem_address_space *aspace, uint64_t iova)
+		     struct msm_gem_vm *vm, uint64_t iova)
 {
 	int ret = 0;
 
 	msm_gem_lock(obj);
 	if (!iova) {
-		ret = clear_iova(obj, aspace);
+		ret = clear_iova(obj, vm);
 	} else {
 		struct msm_gem_vma *vma;
-		vma = get_vma_locked(obj, aspace, iova, iova + obj->size);
+		vma = get_vma_locked(obj, vm, iova, iova + obj->size);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);
 		} else if (GEM_WARN_ON(vma->iova != iova)) {
-			clear_iova(obj, aspace);
+			clear_iova(obj, vm);
 			ret = -EBUSY;
 		}
 	}
@@ -685,12 +685,12 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
  * to get rid of it
  */
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace)
+		struct msm_gem_vm *vm)
 {
 	struct msm_gem_vma *vma;
 
 	msm_gem_lock(obj);
-	vma = lookup_vma(obj, aspace);
+	vma = lookup_vma(obj, vm);
 	if (!GEM_WARN_ON(!vma)) {
 		msm_gem_unpin_locked(obj);
 	}
@@ -1008,23 +1008,23 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 
 		list_for_each_entry(vma, &msm_obj->vmas, list) {
 			const char *name, *comm;
-			if (vma->aspace) {
-				struct msm_gem_address_space *aspace = vma->aspace;
+			if (vma->vm) {
+				struct msm_gem_vm *vm = vma->vm;
 				struct task_struct *task =
-					get_pid_task(aspace->pid, PIDTYPE_PID);
+					get_pid_task(vm->pid, PIDTYPE_PID);
 				if (task) {
 					comm = kstrdup(task->comm, GFP_KERNEL);
 					put_task_struct(task);
 				} else {
 					comm = NULL;
 				}
-				name = aspace->name;
+				name = vm->name;
 			} else {
 				name = comm = NULL;
 			}
-			seq_printf(m, " [%s%s%s: aspace=%p, %08llx,%s]",
+			seq_printf(m, " [%s%s%s: vm=%p, %08llx,%s]",
 				name, comm ? ":" : "", comm ? comm : "",
-				vma->aspace, vma->iova,
+				vma->vm, vma->iova,
 				vma->mapped ? "mapped" : "unmapped");
 			kfree(comm);
 		}
@@ -1349,7 +1349,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 }
 
 void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
+		uint32_t flags, struct msm_gem_vm *vm,
 		struct drm_gem_object **bo, uint64_t *iova)
 {
 	void *vaddr;
@@ -1360,14 +1360,14 @@ void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 		return ERR_CAST(obj);
 
 	if (iova) {
-		ret = msm_gem_get_and_pin_iova(obj, aspace, iova);
+		ret = msm_gem_get_and_pin_iova(obj, vm, iova);
 		if (ret)
 			goto err;
 	}
 
 	vaddr = msm_gem_get_vaddr(obj);
 	if (IS_ERR(vaddr)) {
-		msm_gem_unpin_iova(obj, aspace);
+		msm_gem_unpin_iova(obj, vm);
 		ret = PTR_ERR(vaddr);
 		goto err;
 	}
@@ -1384,13 +1384,13 @@ void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 }
 
 void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_address_space *aspace)
+		struct msm_gem_vm *vm)
 {
 	if (IS_ERR_OR_NULL(bo))
 		return;
 
 	msm_gem_put_vaddr(bo);
-	msm_gem_unpin_iova(bo, aspace);
+	msm_gem_unpin_iova(bo, vm);
 	drm_gem_object_put(bo);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 85f0257e83da..d2f39a371373 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -22,7 +22,7 @@
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
 #define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
-struct msm_gem_address_space {
+struct msm_gem_vm {
 	const char *name;
 	/* NOTE: mm managed at the page level, size is in # of pages
 	 * and position mm_node->start is in # of pages:
@@ -47,13 +47,13 @@ struct msm_gem_address_space {
 	uint64_t va_size;
 };
 
-struct msm_gem_address_space *
-msm_gem_address_space_get(struct msm_gem_address_space *aspace);
+struct msm_gem_vm *
+msm_gem_vm_get(struct msm_gem_vm *vm);
 
-void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
+void msm_gem_vm_put(struct msm_gem_vm *vm);
 
-struct msm_gem_address_space *
-msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
+struct msm_gem_vm *
+msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
 		u64 va_start, u64 size);
 
 struct msm_fence_context;
@@ -61,12 +61,12 @@ struct msm_fence_context;
 struct msm_gem_vma {
 	struct drm_mm_node node;
 	uint64_t iova;
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 	struct list_head list;    /* node in msm_gem_object::vmas */
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace);
+struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
 int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
@@ -127,18 +127,18 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
 struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
-					   struct msm_gem_address_space *aspace);
+					   struct msm_gem_vm *vm);
 int msm_gem_get_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova);
+		struct msm_gem_vm *vm, uint64_t *iova);
 int msm_gem_set_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t iova);
+		struct msm_gem_vm *vm, uint64_t iova);
 int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova,
+		struct msm_gem_vm *vm, uint64_t *iova,
 		u64 range_start, u64 range_end);
 int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace, uint64_t *iova);
+		struct msm_gem_vm *vm, uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
-		struct msm_gem_address_space *aspace);
+		struct msm_gem_vm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
 struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
@@ -160,10 +160,10 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
 		uint32_t size, uint32_t flags);
 void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
-		uint32_t flags, struct msm_gem_address_space *aspace,
+		uint32_t flags, struct msm_gem_vm *vm,
 		struct drm_gem_object **bo, uint64_t *iova);
 void msm_gem_kernel_put(struct drm_gem_object *bo,
-		struct msm_gem_address_space *aspace);
+		struct msm_gem_vm *vm);
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt);
 __printf(2, 3)
@@ -257,7 +257,7 @@ struct msm_gem_submit {
 	struct kref ref;
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 	struct list_head node;   /* node in ring submit list */
 	struct drm_exec exec;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 99d3f2c4bae5..30a281aa1353 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -63,7 +63,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
-	submit->aspace = queue->ctx->aspace;
+	submit->vm = queue->ctx->vm;
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
@@ -302,7 +302,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		struct msm_gem_vma *vma;
 
 		/* if locking succeeded, pin bo: */
-		vma = msm_gem_get_vma_locked(obj, submit->aspace);
+		vma = msm_gem_get_vma_locked(obj, submit->vm);
 		if (IS_ERR(vma)) {
 			ret = PTR_ERR(vma);
 			break;
@@ -659,7 +659,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (unlikely(!ctx->aspace) && !capable(CAP_SYS_RAWIO)) {
+	if (unlikely(!ctx->vm) && !capable(CAP_SYS_RAWIO)) {
 		DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
 		return -EPERM;
 	}
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 11e842dda73c..9419692f0cc8 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -10,45 +10,44 @@
 #include "msm_mmu.h"
 
 static void
-msm_gem_address_space_destroy(struct kref *kref)
+msm_gem_vm_destroy(struct kref *kref)
 {
-	struct msm_gem_address_space *aspace = container_of(kref,
-			struct msm_gem_address_space, kref);
-
-	drm_mm_takedown(&aspace->mm);
-	if (aspace->mmu)
-		aspace->mmu->funcs->destroy(aspace->mmu);
-	put_pid(aspace->pid);
-	kfree(aspace);
+	struct msm_gem_vm *vm = container_of(kref, struct msm_gem_vm, kref);
+
+	drm_mm_takedown(&vm->mm);
+	if (vm->mmu)
+		vm->mmu->funcs->destroy(vm->mmu);
+	put_pid(vm->pid);
+	kfree(vm);
 }
 
 
-void msm_gem_address_space_put(struct msm_gem_address_space *aspace)
+void msm_gem_vm_put(struct msm_gem_vm *vm)
 {
-	if (aspace)
-		kref_put(&aspace->kref, msm_gem_address_space_destroy);
+	if (vm)
+		kref_put(&vm->kref, msm_gem_vm_destroy);
 }
 
-struct msm_gem_address_space *
-msm_gem_address_space_get(struct msm_gem_address_space *aspace)
+struct msm_gem_vm *
+msm_gem_vm_get(struct msm_gem_vm *vm)
 {
-	if (!IS_ERR_OR_NULL(aspace))
-		kref_get(&aspace->kref);
+	if (!IS_ERR_OR_NULL(vm))
+		kref_get(&vm->kref);
 
-	return aspace;
+	return vm;
 }
 
 /* Actually unmap memory for the vma */
 void msm_gem_vma_purge(struct msm_gem_vma *vma)
 {
-	struct msm_gem_address_space *aspace = vma->aspace;
+	struct msm_gem_vm *vm = vma->vm;
 	unsigned size = vma->node.size;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!vma->mapped)
 		return;
 
-	aspace->mmu->funcs->unmap(aspace->mmu, vma->iova, size);
+	vm->mmu->funcs->unmap(vm->mmu, vma->iova, size);
 
 	vma->mapped = false;
 }
@@ -58,7 +57,7 @@ int
 msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 		struct sg_table *sgt, int size)
 {
-	struct msm_gem_address_space *aspace = vma->aspace;
+	struct msm_gem_vm *vm = vma->vm;
 	int ret;
 
 	if (GEM_WARN_ON(!vma->iova))
@@ -69,7 +68,7 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 
 	vma->mapped = true;
 
-	if (!aspace)
+	if (!vm)
 		return 0;
 
 	/*
@@ -81,7 +80,7 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = aspace->mmu->funcs->map(aspace->mmu, vma->iova, sgt, size, prot);
+	ret = vm->mmu->funcs->map(vm->mmu, vma->iova, sgt, size, prot);
 
 	if (ret) {
 		vma->mapped = false;
@@ -93,21 +92,21 @@ msm_gem_vma_map(struct msm_gem_vma *vma, int prot,
 /* Close an iova.  Warn if it is still in use */
 void msm_gem_vma_close(struct msm_gem_vma *vma)
 {
-	struct msm_gem_address_space *aspace = vma->aspace;
+	struct msm_gem_vm *vm = vma->vm;
 
 	GEM_WARN_ON(vma->mapped);
 
-	spin_lock(&aspace->lock);
+	spin_lock(&vm->lock);
 	if (vma->iova)
 		drm_mm_remove_node(&vma->node);
-	spin_unlock(&aspace->lock);
+	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
 
-	msm_gem_address_space_put(aspace);
+	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace)
+struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
 {
 	struct msm_gem_vma *vma;
 
@@ -115,7 +114,7 @@ struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace)
 	if (!vma)
 		return NULL;
 
-	vma->aspace = aspace;
+	vma->vm = vm;
 
 	return vma;
 }
@@ -124,20 +123,20 @@ struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_address_space *aspace)
 int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
 		u64 range_start, u64 range_end)
 {
-	struct msm_gem_address_space *aspace = vma->aspace;
+	struct msm_gem_vm *vm = vma->vm;
 	int ret;
 
-	if (GEM_WARN_ON(!aspace))
+	if (GEM_WARN_ON(!vm))
 		return -EINVAL;
 
 	if (GEM_WARN_ON(vma->iova))
 		return -EBUSY;
 
-	spin_lock(&aspace->lock);
-	ret = drm_mm_insert_node_in_range(&aspace->mm, &vma->node,
+	spin_lock(&vm->lock);
+	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 					  size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
-	spin_unlock(&aspace->lock);
+	spin_unlock(&vm->lock);
 
 	if (ret)
 		return ret;
@@ -145,33 +144,33 @@ int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
-	kref_get(&aspace->kref);
+	kref_get(&vm->kref);
 
 	return 0;
 }
 
-struct msm_gem_address_space *
-msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
+struct msm_gem_vm *
+msm_gem_vm_create(struct msm_mmu *mmu, const char *name,
 		u64 va_start, u64 size)
 {
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
-	aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
-	if (!aspace)
+	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
+	if (!vm)
 		return ERR_PTR(-ENOMEM);
 
-	spin_lock_init(&aspace->lock);
-	aspace->name = name;
-	aspace->mmu = mmu;
-	aspace->va_start = va_start;
-	aspace->va_size  = size;
+	spin_lock_init(&vm->lock);
+	vm->name = name;
+	vm->mmu = mmu;
+	vm->va_start = va_start;
+	vm->va_size  = size;
 
-	drm_mm_init(&aspace->mm, va_start, size);
+	drm_mm_init(&vm->mm, va_start, size);
 
-	kref_init(&aspace->kref);
+	kref_init(&vm->kref);
 
-	return aspace;
+	return vm;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6ff9541990dc..b61cc939363d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -377,8 +377,8 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->aspace)
-		submit->aspace->faults++;
+	if (submit->vm)
+		submit->vm->faults++;
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
@@ -483,7 +483,7 @@ static void fault_worker(struct kthread_work *work)
 
 resume_smmu:
 	memset(&gpu->fault_info, 0, sizeof(gpu->fault_info));
-	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+	gpu->vm->mmu->funcs->resume_translation(gpu->vm->mmu);
 
 	mutex_unlock(&gpu->lock);
 }
@@ -820,10 +820,10 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 }
 
 /* Return a new address space for a msm_drm_private instance */
-struct msm_gem_address_space *
-msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
+struct msm_gem_vm *
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 {
-	struct msm_gem_address_space *aspace = NULL;
+	struct msm_gem_vm *vm = NULL;
 	if (!gpu)
 		return NULL;
 
@@ -831,16 +831,16 @@ msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *ta
 	 * If the target doesn't support private address spaces then return
 	 * the global one
 	 */
-	if (gpu->funcs->create_private_address_space) {
-		aspace = gpu->funcs->create_private_address_space(gpu);
-		if (!IS_ERR(aspace))
-			aspace->pid = get_pid(task_pid(task));
+	if (gpu->funcs->create_private_vm) {
+		vm = gpu->funcs->create_private_vm(gpu);
+		if (!IS_ERR(vm))
+			vm->pid = get_pid(task_pid(task));
 	}
 
-	if (IS_ERR_OR_NULL(aspace))
-		aspace = msm_gem_address_space_get(gpu->aspace);
+	if (IS_ERR_OR_NULL(vm))
+		vm = msm_gem_vm_get(gpu->vm);
 
-	return aspace;
+	return vm;
 }
 
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
@@ -936,18 +936,18 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	msm_devfreq_init(gpu);
 
 
-	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
+	gpu->vm = gpu->funcs->create_vm(gpu, pdev);
 
-	if (gpu->aspace == NULL)
+	if (gpu->vm == NULL)
 		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
-	else if (IS_ERR(gpu->aspace)) {
-		ret = PTR_ERR(gpu->aspace);
+	else if (IS_ERR(gpu->vm)) {
+		ret = PTR_ERR(gpu->vm);
 		goto fail;
 	}
 
 	memptrs = msm_gem_kernel_new(drm,
 		sizeof(struct msm_rbmemptrs) * nr_rings,
-		check_apriv(gpu, MSM_BO_WC), gpu->aspace, &gpu->memptrs_bo,
+		check_apriv(gpu, MSM_BO_WC), gpu->vm, &gpu->memptrs_bo,
 		&memptrs_iova);
 
 	if (IS_ERR(memptrs)) {
@@ -991,7 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->rb[i] = NULL;
 	}
 
-	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace);
+	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	platform_set_drvdata(pdev, NULL);
 	return ret;
@@ -1008,11 +1008,11 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->rb[i] = NULL;
 	}
 
-	msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace);
+	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
-	if (!IS_ERR_OR_NULL(gpu->aspace)) {
-		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
-		msm_gem_address_space_put(gpu->aspace);
+	if (!IS_ERR_OR_NULL(gpu->vm)) {
+		gpu->vm->mmu->funcs->detach(gpu->vm->mmu);
+		msm_gem_vm_put(gpu->vm);
 	}
 
 	if (gpu->worker) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 01a3b2770d71..edbdd894adfb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -78,10 +78,8 @@ struct msm_gpu_funcs {
 	/* note: gpu_set_freq() can assume that we have been pm_resumed */
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			     bool suspended);
-	struct msm_gem_address_space *(*create_address_space)
-		(struct msm_gpu *gpu, struct platform_device *pdev);
-	struct msm_gem_address_space *(*create_private_address_space)
-		(struct msm_gpu *gpu);
+	struct msm_gem_vm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
+	struct msm_gem_vm *(*create_private_vm)(struct msm_gpu *gpu);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 
 	/**
@@ -228,7 +226,7 @@ struct msm_gpu {
 	void __iomem *mmio;
 	int irq;
 
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 
 	/* Power Control: */
 	struct regulator *gpu_reg, *gpu_cx;
@@ -356,8 +354,8 @@ struct msm_context {
 	 */
 	int queueid;
 
-	/** @aspace: the per-process GPU address-space */
-	struct msm_gem_address_space *aspace;
+	/** @vm: the per-process GPU address-space */
+	struct msm_gem_vm *vm;
 
 	/** @kref: the reference count */
 	struct kref ref;
@@ -667,8 +665,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config);
 
-struct msm_gem_address_space *
-msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task);
+struct msm_gem_vm *
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3326d09bdbc..3649276ea1b2 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -164,9 +164,9 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
-struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
+struct msm_gem_vm *msm_kms_init_vm(struct drm_device *dev)
 {
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
 	struct device *mdss_dev = mdp_dev->parent;
@@ -190,14 +190,14 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 		return NULL;
 	}
 
-	aspace = msm_gem_address_space_create(mmu, "mdp_kms",
+	vm = msm_gem_vm_create(mmu, "mdp_kms",
 		0x1000, 0x100000000 - 0x1000);
-	if (IS_ERR(aspace)) {
-		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
+	if (IS_ERR(vm)) {
+		dev_err(mdp_dev, "vm create, error %pe\n", vm);
 		mmu->funcs->destroy(mmu);
 	}
 
-	return aspace;
+	return vm;
 }
 
 void msm_drm_kms_uninit(struct device *dev)
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e60162744c66..73da232237bc 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -129,7 +129,7 @@ struct msm_kms {
 	bool irq_requested;
 
 	/* mapper-id used to request GEM buffer mapped for scanout: */
-	struct msm_gem_address_space *aspace;
+	struct msm_gem_vm *vm;
 
 	/* disp snapshot support */
 	struct kthread_worker *dump_worker;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index c803556a8f64..edb8e3bee955 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -78,7 +78,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	ring->start = msm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
 		check_apriv(gpu, MSM_BO_WC | MSM_BO_GPU_READONLY),
-		gpu->aspace, &ring->bo, &ring->iova);
+		gpu->vm, &ring->bo, &ring->iova);
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
@@ -130,7 +130,7 @@ void msm_ringbuffer_destroy(struct msm_ringbuffer *ring)
 
 	msm_fence_context_free(ring->fctx);
 
-	msm_gem_kernel_put(ring->bo, ring->gpu->aspace);
+	msm_gem_kernel_put(ring->bo, ring->gpu->vm);
 
 	kfree(ring);
 }
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 1acc0fe36353..6298233c3568 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -59,7 +59,7 @@ void __msm_context_destroy(struct kref *kref)
 		kfree(ctx->entities[i]);
 	}
 
-	msm_gem_address_space_put(ctx->aspace);
+	msm_gem_vm_put(ctx->vm);
 	kfree(ctx->comm);
 	kfree(ctx->cmdline);
 	kfree(ctx);
-- 
2.47.1


