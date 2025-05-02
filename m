Return-Path: <linux-arm-msm+bounces-56557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A5AA784F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E7B51C02C1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7A626E175;
	Fri,  2 May 2025 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLviT3/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD9E26D4E9;
	Fri,  2 May 2025 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205719; cv=none; b=OLlBijmKZjbNvMRgt9c34M8rrrBnnq2OgH17Azo742kJFreh+WDKtOlQnJkZv1rKygecQJiKKJ+MXJJ+ICrt3xk0ePG1sOD5eEMCbceX7P7QdonIVeD3wggIx2pSw7qydgHrYULrTLU8jU/ctYSKEUQfZs7y10ncPHxooIOWO4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205719; c=relaxed/simple;
	bh=yUULlGztLSdK1Pb0sYd9/XQ5lza3YniYkY/cu9URZyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4u2cCs6Ckrs3H0xDSjvc9rSZL5JbTV+fvvjnQpgTfor3z3nbWhrq50DTIyLBYFZGtPzNsjEV5bDRJ/4Qh9lDMj9NJoe52XCtPp3SivU4hSYrXW0KX/rOO5en8ZOPcIeslvD73qsKuwU5x6JP/HX/c4u7DCmw5wkXmSzxtMXuoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLviT3/9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736c277331eso3342407b3a.1;
        Fri, 02 May 2025 10:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205717; x=1746810517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oImRguuO9CgxvXeMtYQm2slMQDfx+h9LrYW6SXxZmNE=;
        b=XLviT3/9Q6S+U7SYHSclJC7pNfJGobhnk0HJT5mjpr9zSSRTNj+c8Xs76SEB/4tGla
         Q448HkuPoBMoye6YOV2IckrcnXfuifrk6B3PLCa1z0Rlm6XJwS+WONSYgdc/QJf7Hcn5
         z18jbhte2rJwXUgx4xbNPUBQMdRBV2aae+L15qcpwemIJ7/fZBiXFuv0y60r2HcyUdLD
         YRdmgz1dLnoDbqLcbcOVG3tNH+NM0ytHZzVoJbCqWBUtVidk1rukuP0trPRm/y7rt5Lm
         LsRnJCziBtSXINy5py5uUv1rKmVqU3V/QFkdalRlBS87k1aA05I2bl/FCBEkN88Kmcjf
         PSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205717; x=1746810517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oImRguuO9CgxvXeMtYQm2slMQDfx+h9LrYW6SXxZmNE=;
        b=DnSro4Owl0OnidKXMqCN/nI7kF4WZR23HfH1zQG8FIlp+eNFQi7O200PiBqyNNxEZV
         iR3JrHtAL/hIm28KLDKrPZsfbrFiaIemEnFnF9lXWBbWMU4NXAtZdhEMJDVz3xhJwL2z
         1r3+Q/TD8xetpdY0iI6TohT/J5tq+ZRF4qgmb2Zd7uKNcaC7Hc92LYsMoi6KT8sW1frF
         oR6DVyvuxW7oinU8vSDEGYRmg6ThfcDm/1emmTWdL7yNWK2m+LK4G4PYmZxH9EZiArxT
         xdrqjF3a5YxtqAaim5jCImQce5ThrW+83XzpxHVFs/XBWcBPbdJ0Fm7A8z4GjlJ/ZIGf
         yJhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBV7WWPvhEys/IQjU3vuy470L2+NmmQX5go5+NbQ9Gwqeuve3AjWliVu5alLa/UfgQC81Jsr3TAhyeKmMg@vger.kernel.org, AJvYcCXmEASYI/V/LxAY5tBNMlKQkybk8nf36WdhWDrMafSsv1o633gY9zp2/IqiohiJaKhh6WxcV1WemrXVXVYg@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdNprft/EppVp6TlFUNntUPV/g920mGmpv4LkmFzk/7LzfwqJ
	nHyWLRpDmq1Ik5BW0gfPPNvZcyQhS2+Vr++R1oW9gwRx17u4E1MgXrg5dg==
X-Gm-Gg: ASbGncssXtQUBmx1TtdDDkGWqpbaa3mwCSD2e9Ox/dce5C7AQ9JKxWa2JWaQ1sB1FAS
	KSFJ3369jZ+iIVEmNUDSBnsTS/n7nCGsLiaz0JuSWLIEIJebm/JWiEM8/MF3q/kv8g59AqRhbMK
	ysIQuRb4QgqaKCzf9XBtI55LPhWHdvqXqVOIpsmQVpLrP+W+yWZHrp9/jPpZLZpeZG+9hyoP1oq
	3zCxe3gDJDtz7Jgs6YOUZYDA8AR2vg7IotrEDYos+mzXlJJsZCmUgSG3jRBWKvXrUCPiogd6ALK
	CYwD2Lz4eMYwO3FjUojN1keKGmKMtowVxcD166dUEVN7bAfqNZcdY9lwsdY945PwAMnpb4MgLn0
	fiRB2x/+V84KaKhQ=
X-Google-Smtp-Source: AGHT+IHBVfECa7MHwJ/CWx6XiOelQJGyDiB77wRm7JtyMpFRnEWD8K53dfuLCH+0Bl3zeJx9xaDJZA==
X-Received: by 2002:a05:6a21:3416:b0:1ee:450a:8259 with SMTP id adf61e73a8af0-20bd8d4b1cdmr10325594637.18.1746205717511;
        Fri, 02 May 2025 10:08:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b5683esm1035432a12.24.2025.05.02.10.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:08:36 -0700 (PDT)
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
Subject: [PATCH v4 17/33] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Fri,  2 May 2025 09:56:44 -0700
Message-ID: <20250502165831.44850-18-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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
index c3bd89243a71..079f6587ab8e 100644
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


