Return-Path: <linux-arm-msm+bounces-57919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EDAB73CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A46E3AABA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3041A2882A8;
	Wed, 14 May 2025 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMETYFv5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973528DF08;
	Wed, 14 May 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245421; cv=none; b=lGlMfepH2X4u5KYOUAC7CVE4YF/aNhd1SSmgju+vHOU8j5lqhbdGdo3wvO3tKhdG6pN/2Qwo3p6penunOPgiPznxCP6oPs87ahwXN8Z3J5a5ZVhXu147tMsRN01tqCRt5RYHBbo0sMnKQe0qzfbnV90QmdsY9cT3FJy536U2NXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245421; c=relaxed/simple;
	bh=YVcRiTdd+ADVkJHij9TaGYM/iNdmM5I/RTz/5eDa6oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GU3qvhWTmWUigoIgnZnTGp+CO7LgxuFDUHDDGZrEyP6D3WUk0q5o9P1Y8NPUn2yZATNwyYJ7r8b1EkvwzHGaRwXiGNTBW/nE4cZclIou0Z4w2ZltIQZ0oG5Y8mO/u+fcNIHiPd3H4gn8hNXlJ4M4ENMTedmB4b5Q9RqsXlX/UP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMETYFv5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e16234307so2003745ad.0;
        Wed, 14 May 2025 10:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245419; x=1747850219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dc6oh0e0WavCyhwAJpacjMNx18OqBUhzQvT0xVarT0=;
        b=hMETYFv50MFL9QkcbelM6e0c5ITfVL36X1oNCbfT2u6ONnd8DHX6LN3hLsCwTcZoPY
         odbnNp4Hq49QfTwoRlwvFOrvnhhXp2sG552552PTcpTOSSjBooxxvCmJAodgptbtdCoB
         jVdwa59xxa7xDIeugER3C3etYzUUNVBBlN0bcmNCE2/qU57mrodydJAsDq2wOEiwH0cr
         9CxkKD4Jz4lG7NX9ixR4d1414eGbHL94tPL0HfLZoZgwpNHVDFxRhaUW7vxLaOfJDj78
         p6iYnsU5chJxpN69dtwM0mQoUqQiqzDJcGTTXfIrt7+ryvVKLpyqzPY6IucspzsGwI6v
         MbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245419; x=1747850219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dc6oh0e0WavCyhwAJpacjMNx18OqBUhzQvT0xVarT0=;
        b=SL8PxDrFNXmC+tiN6hio9uTveXUIzlqdgJSVFuHbjge9KkyAQV4k+4wchm+jqY+Ldz
         L4v/VF0yHB/9VO2aZjqrqA45N3qvJrae4kjnkY2CWxHBKI1qRay+ZeBiDH2dd+f5BEuo
         h7fl9GYrkt283yp0xOD3tw0oCgt2Dey/ySelqwx/9QuIhNww4VhPo2wA5MK31zZ781tW
         f/703r/SXKK+JwTElRGIODdzbqGsFHtvZG0YMRu9rUtgiD/dtUesnXWMa/3FVBNzPVVX
         PUWct5GmoR9Q3UT5XRNH04G/VZX4cUuhtAAuFLWjkHLztOpCEyxfq+UduwNYt9HcYtU8
         x9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqMnaWFwW/AZeJFryB2lNOIf7umGXkFJQr+szbF8/zjnl1DaTOQfXwJRl8kH+Oy2QbRqoRh+RiCHxjT8ef@vger.kernel.org, AJvYcCXkjI5be0gBcv3ao72Bsud6T0d4JJJQE2eUG9L2W6xo8LHG1B/kYojJ3u7ytqpVqgpdYHoimsEkkccYtp1H@vger.kernel.org
X-Gm-Message-State: AOJu0YzlczFW/Rpu2Flhpy0dC5S4p/ll1IJ/D0NTFSeu2FAsPu/v7kVI
	C/yHss7LyNfhoNxYX9+JUQS3aSil9GDwVVKrX1kLuNKgd+CtJL2w
X-Gm-Gg: ASbGnctWlU0shbjZ8nW2ruwcbPpHfw+/+9uBLAY3nQusdYmqBsTrvuNRpC67VhbeOBF
	Sydj1c7JNJ+s7jwKoL7sRmOaqWukKJuYKteITwF3SsmU6nZdiKtA+EpWCzDsJQXpaSrHpeohRiP
	yCalhVxv93en/1CW8GutYgoaeISFV1gJ/pL8AV1nSKz6AQPTi019j/KKoIpqOjjs8DxgcotUW40
	6HlUVT2cpSKW0bR1VgtbIY+DDarcj4O77zC6BYei+C6YOR8SNwGhb2pTegTDnqXu/fX3kYj1trf
	xLOtRuVuQ7CfJSHLRyHzQ4JLTUW+NQuiV08YWfSmE2fbwJ6wy2QYiPGS9VNVpjzXv0jQfYdLQSS
	ek1XSS66fAMic8Fz4yYNF2SP+CA==
X-Google-Smtp-Source: AGHT+IFlzNaFmGbXtBc9+69TTIup6InQGI2JT+UoH0sPZLIYJlKUPlIOuA7VfFmugCKqXw6T9X7MiQ==
X-Received: by 2002:a17:903:491:b0:221:751f:cfbe with SMTP id d9443c01a7336-231b39a7cb7mr5893315ad.19.1747245418756;
        Wed, 14 May 2025 10:56:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754685bsm101534935ad.50.2025.05.14.10.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:56:58 -0700 (PDT)
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
Subject: [PATCH v4 19/40] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Wed, 14 May 2025 10:53:33 -0700
Message-ID: <20250514175527.42488-20-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9cca5997f45c..d85bd638f684 100644
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


