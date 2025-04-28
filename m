Return-Path: <linux-arm-msm+bounces-55960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796CAA9FB4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4AD316D72E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F6720F06C;
	Mon, 28 Apr 2025 20:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLVF+PCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B064214A98;
	Mon, 28 Apr 2025 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873843; cv=none; b=Pc3RLAc9CG5LAr8B+XE5o3HAVVBsvfhCjeDNPvsxjpCSng5kTef1L0/jZzXsBh0AaHJdK3CGm12HazU8g4xbi8qRjl7qYxBOILIBQJTJlFgqd2E2GPCPvpf8UtDSWVeagP/qOgLJEBM40kFf/NV2WC3FMoBO4hA6Hh+69mFSaHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873843; c=relaxed/simple;
	bh=GvyDOY/RNoHhP7DVuGbt94oI3HUS4zcrifP/t8gYN/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqryuXFxkW7u0d8BJtNIrQaR7992FXiwWAlpz7Et3HW9CJ9KZb/ig/MqnRvmjXzGiS8o1rVHebjTMFsuTM1Z1Wan0u7e23hoAHccl8uCFn1jdfhYZngLNnYRwqHh/4fPZD47NDRMYDsIMfwDE0gxRaKZSQOtF/vMVWJLca/swT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLVF+PCB; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736c062b1f5so4478103b3a.0;
        Mon, 28 Apr 2025 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873841; x=1746478641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
        b=YLVF+PCBHQmhz/gmwJKc6u4c/vf/JRjffWCCaHHcon5VkgyGbm9MmOrgXgWjI2wiGI
         7gFCu57GZRzj93ElJh0w2A+gdDFnR9grVvJaly0EuId7KTs5bSd+ogKTXwDrBIQOrYfR
         YuyvT2kdHuIvIKv91Latgp4ex2u1fg8D+KlYNwmHRnQGcf28Ly0hb+EAlxvANex6HnAO
         Gj2GB8BjhtPxV8RA+RpABLf1a4XGBKvx8fpSQ9A7xK4AL5JqDtD6lLP5hhU6TYvkQh0F
         PKEyLVornot3fIyBQn0AwNIODfXixFQP3AOeThF8x60F2bmDwQxwyHC3Uh+VXaOfcKFq
         VysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873841; x=1746478641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
        b=gDb9W1Nwhb8IdxNqOW/QLaUJRuFV8Tr9r21cEpRa52tWrGviJDE/VEcdSX39HIP3FZ
         waZSYtfS2zebRerO7LlotmqnMevcy6jHPzr+Nb3jYM3jHIJlsrFRixkg93wPQ7ImLGGw
         48HRlH2p/iKRhWukjnNt6bsaXoiP9sJL2jQ+jV+ES1m6QS7BqnAlM9NC8HIMf0mLA749
         A8RE1Cz7RVTBaqMP/r0x1uQulgs7pSk75/jT7V4KtJq3CV7KbHyjQRZBU4Mihj8Ox6hu
         hGlZPPSz2z1bNWDj3YSPDQN/gCXNNjNEWKeDQth/bKDpdE6wljMFzQ3dbqVeGQm6vrAZ
         JsJw==
X-Forwarded-Encrypted: i=1; AJvYcCWMK9mUqcrwgSa+PbdottbrtZ4jbQQ53A+3asXEpVMr/YO6qHRhfO9mSRftamLLVqqJXLMqqzj9C5i1+vUo@vger.kernel.org, AJvYcCX4usB7N7EuAPaAYSNXF0r6LHhccNiEGQ76YNOFXJdMjXOTI96NmOrIUI1yPYye3yIqkP3BUltu8JCJf30u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3n77uzfFlIq8AizgkzCCsOcNHDTo4c5177r3+gx9XSL4VD9TB
	I5EqB432zWEPTuSgS3K8j4Sa9AYT4Hb36cKvANJh6CK72pA5omcB
X-Gm-Gg: ASbGnctTsMpj7Veeb9/plgMsjYETs5v56Fs1OGUMOqsLhVrmlwCMmLmPBsWUyed4S3Q
	80jFoDQb9C9eHRQz16DAflLNXgWhwtBGJtI9K7S3WCK7WSb2chPqJYRtfX3/0xQkmEUCbm7dOBM
	IFIZt2oFXQ5iUssrLVIQmk3DO/EiXdcx6ZX9q+V+BJl1kt2ZG+hh5RAgdJYB2TyndNWNlXlayu7
	6PUm5Pc66xnCqvkQ0bcCtUJJ8nkKnlO4Pj8D5xT6LXCAe0TsDfwjmjSjYoE0isfeJ1OB38FG+Nj
	Vl9Uz7EFbeGSxl58BDxzZcxlzibHB6M56scNX8USQYQ03WxISWzTG1L6iKZEVemwHWX3fGKt7Jb
	XOQDXi3igVDT1cpk=
X-Google-Smtp-Source: AGHT+IHxQHfLbpYMMID4G/yaYBcuP8BHgktCPUEf0XSxLZbBXews4TLwBKnt4XMr5XmQrJ4JbE6jnQ==
X-Received: by 2002:a05:6a20:7f87:b0:1f5:8072:d7f3 with SMTP id adf61e73a8af0-2093e724297mr1403977637.30.1745873841345;
        Mon, 28 Apr 2025 13:57:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded634sm7797650a12.73.2025.04.28.13.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:20 -0700 (PDT)
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
Subject: [PATCH v3 14/33] drm/msm: Split out helper to get iommu prot flags
Date: Mon, 28 Apr 2025 13:54:21 -0700
Message-ID: <20250428205619.227835-15-robdclark@gmail.com>
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

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 688b0c4e2a3f..ecafc6b4a6b4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -444,10 +444,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -463,6 +462,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	else if (prot == 2)
 		prot |= IOMMU_USE_LLC_NWA;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 813e886bc43f..3a853fcb8944 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.49.0


