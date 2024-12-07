Return-Path: <linux-arm-msm+bounces-40878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CFB9E80F7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 540F21881EE3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0373E1AAA38;
	Sat,  7 Dec 2024 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuUaMs3F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A711AAA28;
	Sat,  7 Dec 2024 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588299; cv=none; b=Pg5QkzhpbB4mHCK2V+v2D6b6zvp3ST7vSSt1dap8vZcuvBSptba1RIn6bNWZPKaedSHRAYHw7e+vk6ExbpJKgydvMVLmeOZVCJkr0YfWdfAcvmu7j4bC2Ic88FnuHFiAhBz6b5QPGMwL4eyiDWv/CvnbsbBL6BUP8Mv0vHbyTno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588299; c=relaxed/simple;
	bh=BeklckVR+07WbN5X72o1AGgijfD8qNwZFz1oRzr1SV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+CUGOmYlIY6xhLY/9ZnAABCaCspaNegoh1cbrVBeU3WWl5rCRd4hsKi3ZGeFdFqkldYIQDBNizD83/fHrjVh/3euffFWFItroIbM13SAr1e39Mm3NnrI+63RUVY/opoH2roafAYentnq5rfYoCL6EDLzrxz1JRhcNVyR5cLPA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuUaMs3F; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725c0dd1fbcso1591603b3a.0;
        Sat, 07 Dec 2024 08:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588296; x=1734193096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7rYcDWqXxEUEa2Af4XZ/usxa/bFTIN296GBT4M9754=;
        b=NuUaMs3FvxcEU56m0nMuCLe9+xHRuDj9WdsWfzHHp1NPuLpmqhz1WDbKocQQ7RwU7W
         YznKFc9ckU00TWXHCJaw+yTnkmJYqWf4GOYbb7wspKzv05ZzkQepKlxJYLqyKyRYgIIh
         +vM/FONmeJ85Lw0KYZrehCqu1NUpXN+Q9SMnLmVExv6WRV3fZP5xIdFwb6K4h64mz5t/
         RHdHggykLTaH9Z7Oe3w0ydLk/mLJvvYCvnDawAZK8vOL/ZaYyX5w48LfeFMqWKIMSrZK
         958HPVQ3hPRBPAcGzyRg0u78CzLXheTWpR2zx5rnpaTDYQAQlfUeLZFBU9zcqr5efNTe
         w99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588296; x=1734193096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7rYcDWqXxEUEa2Af4XZ/usxa/bFTIN296GBT4M9754=;
        b=SLBdzyUy2HM5AlsUlghRO8vQDAjjqtjYt8pSxMqAknKysfEfmHSoFIo8jGFah6m6l2
         P7uTPq78OtOwOz7u3TxThoUdmJp0QUIN4e8cCUGzFyo+pHi9xpTAKIEVsxEoXXM/EoY7
         a+jHz8k8eIGxFGFqg8GJTYh4C9Uc3VX89VuKJuGimpZnqDR/2AB/NK7aCjgSo3fqs9X7
         kmz3DIvuRkNgJ33npqbeLsECnpTT4n5zsl0q3mRWFdgNOx7gL6VCpDeJhOdxZn93Z4Cl
         3s2IGPqhnUqWnY4gJnNACRe2El5dtSR0Ii4UeSHjxAl5oxjo3RCP5+gRogpxW6qjZ3IJ
         OcpA==
X-Forwarded-Encrypted: i=1; AJvYcCV+baUx7aPWKT1VRPtjJt0aOhdDGwa5Wvdnziy09rokj5QCV45EIXUioc/tqiZQJ1OjI+UB3+vfv9JJXMFD@vger.kernel.org, AJvYcCVUZOYXJI0m1Uv+GK5C6AJ87lRF+talFGhGo5QZsGkB74Gw+5sY/j3b6HMPDmSJrTLqgDewvHPQ7kbG0yYe@vger.kernel.org
X-Gm-Message-State: AOJu0YzXa8J/1yuPd8V2UFhKwXE10kvDijx5pQvNKpwnyy6U6XP6J6Vd
	vv6TcDs0xOQcd67pIEwhXbNMjExOF7AgBkwmITswNHfqbRKVDAeo
X-Gm-Gg: ASbGncsYU7x3tzB76GMspiiz+x2aVZfqKqYvq5ecuwUezzKVMoeQLkFP2a14H/ajwrw
	LpY0Npz1zB9onv+YqLE05TqqUKExpiuawx2tK5F1t4W6gFLILLLQ4bOAHh9iEFbqa6hgJR04PNp
	FwnR5nO4Sn6mE8+4eMTLN+1OpNfVGBITs9qfYPR3PJOtMdO9VGd5wacpg++6l8N5DbJ2fiMGdyT
	0IvIYdpAhNYDQY8bWxg4k9E8vRBhPm14uLYNjk1FgcKxllLT5PgsTjkNNjhD7FqXc6aTCr3oujK
	BWSUscfpGGqO
X-Google-Smtp-Source: AGHT+IEzKmW3bzXgODVcqBwDW1qOiEHNm8CJqYXGejknfGCaBwshShHfgB3H/YbzCZsR9HcoHiUjdA==
X-Received: by 2002:a05:6a00:1d8b:b0:725:dab9:f732 with SMTP id d2e1a72fcca58-725dab9f7f2mr1849376b3a.22.1733588296403;
        Sat, 07 Dec 2024 08:18:16 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725dc0bb650sm632191b3a.101.2024.12.07.08.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:15 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 22/24] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sat,  7 Dec 2024 08:15:22 -0800
Message-ID: <20241207161651.410556-23-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b6bad702e0c8..7dd881f8eaff 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -399,7 +399,7 @@ put_iova_spaces(struct drm_gem_object *obj, bool close)
 		struct drm_gpuva *vma, *vmatmp;
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -589,7 +589,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 71499ec60a5d..27ed5bde7893 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -141,7 +141,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 035d29623519..8d79e123ed9a 100644
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
2.47.1


