Return-Path: <linux-arm-msm+bounces-58530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A5ABC6AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD1667AAD90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5574228A706;
	Mon, 19 May 2025 17:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC9HQjZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0C028A3E1;
	Mon, 19 May 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677502; cv=none; b=QeAjG+wrksOVaVfXs7PwJgJWcUQhTS2a+Y7BaB1gnI0GUiYClfBFoF0k74hIhWI07efKZJ1jCeEC9+znp0Szby+8psWVmrIe95JAnjDs3tNmDbGoFxJE4HI+EI4gyd50bhCJsnLpvV95uC8rIH74qyAwzyINMafJ5jX47qD0DLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677502; c=relaxed/simple;
	bh=KIuHGIUF/1yvTwDdZYUYF8i9TsA52u5OlIoj3cPfuMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mViu2oBAdHqtd2sTP2V8zSG1vheQLE3p6Z9IpE1cpV04l55WyWwESeyC1naXQMpSTeMig0Dm4JiyktgDDqQBzVm+YqP+CIEucbgM3ChLdFEbAOtrgRY2U0edJCXFqgHzhcTK7bZ6yXlZkn9hlJpzyvUFjJpxA7/0QZSwjKcBg4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC9HQjZR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c27df0daso1692625b3a.1;
        Mon, 19 May 2025 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677500; x=1748282300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZR45HonzG0kOSwz0CHVhwP/iZ2n3XMsmuHYxia7o9s=;
        b=AC9HQjZRarA1NHg4Fbidb88HyPZNt9FqjXl4DUP4GrtdlqmT3LtbY4/+AWJXi9/gqu
         BB7mSDBrXVVhug5czz81duc8P6j8ZzmYCTugFnV2+nawP4E+PTLvamrl9P4X1sRaQm5f
         /+lmZeRwpZgMjnPr7OZN6aDNL3n75HA2KtMu1u0xjbrRTE7EcfgK6LUreFEBpRlO2EHl
         Lxbgknlubq105SC36tPFYwTNPPWujAwTx8k2uF1jFVlmcSH3l5qRjG2xcXIbkLP/+6hS
         3T78ISyKGnqtULTN/CMqLE3VXTHakkNBoNv4RJBNS7++aUQzGe+R7rPZfXCwXUXDqRVp
         +riA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677500; x=1748282300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZR45HonzG0kOSwz0CHVhwP/iZ2n3XMsmuHYxia7o9s=;
        b=AeLX8NPWoprixmpc5nTwFOo3YMBjWEaKxEdyrU9maW2s7abMUEt5AagUpda+DFizVW
         H3v6112ExOs/g9cc5HW1FYqAzJMi6XBWxylZ0+kxNO0gIc/UdR9GJqbhN9JRLSHW8+c+
         pDWci5I5mpxjzrzYDB09miqHIoZCrSSlwxHPDdrHiVERj2ioCPek9ceQrLSi/Gsh1k8R
         uXXwlu2VtGbEyqO6VuBa+JkAOyujScSQdwyXm9Y3c5W/7E0SH2+nge40mrCM3ZzIm77Y
         fZLAAQ9CSliRQ2U9SGbAPax1GPyg6+vSqBQ4p7X5oVAIrmTQwT2FR6JYy+CQhg4o0jGm
         IHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ssOaKPO6CG0F+YNEb25neR7f++7Aij+0PRwUhKYmZSiAOsKFNE5lavae4Vw2jJtI3lmXc2Vnx13PnE/k@vger.kernel.org, AJvYcCXsmQVEDGkTNum0MWhN23v8XNwqN+YeWg/ySyJbxX+w2RlJs2YjGX9pUpRybFhXaoW898arBQfGw1nrtLke@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1gBUst0VeBYjwjW8YgWT8lJlbZv9vUHXa29C1A8A+DnjsLQ1o
	uHoD9AJEkFPxzMAvvJbE8DAVZPtat4u5mHGEmpO6aCzRdOvXptJME1bg
X-Gm-Gg: ASbGncvvvP8KIJk9h7XLa3+1tV230mvIQzAZQlQV1l3642OWQqXCW+iguNMo7UNlm1m
	tXNdpDU4xQv+EkjX9mOdzODErTJ/pGZZOiRg/BV8bweYXL5N2JeGkuRCGQvXA1z5qzzthGc38rC
	qy3rYHCT7tPrjt4+2tBI7VAI8Uddh1GbumMeuBVywFK7UejeMrZxtTE4Sr/x9oa4dARRC/+j+Ub
	OB0E2/LHiEFdEW+sjLfVfT+JbyiwNMKt+L2wHj4vaKYUkv0OrO19scKLNzWT9GwfbygB09bjFKb
	EZ4nJmgbA8zPeIfL1RcDlIkRIDqh3JHMu5TT/KsvnrEq16NDiExGRpXTY0fGU06+ooM6MGpgwVP
	8Ofcp3LnFPiOHVmcxJe9xpqZNTQ==
X-Google-Smtp-Source: AGHT+IHOuR52fY/COtpZM6lIOPAeDrtBd0ZuNPdb6M1SPZESV1zaVwdxxix9u7E3jidU4bsfhrIuRw==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr18397671637.19.1747677499805;
        Mon, 19 May 2025 10:58:19 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aafsm6516577a12.47.2025.05.19.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:19 -0700 (PDT)
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
Subject: [PATCH v5 19/40] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Mon, 19 May 2025 10:57:16 -0700
Message-ID: <20250519175755.13037-7-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 738620603d2c..bdcb90a295fc 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -415,7 +415,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -593,7 +593,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0d755b9d5f26..da8f92911b7b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -111,7 +111,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 109b985e1d0f..72667316df51 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -21,7 +21,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-- 
2.49.0


