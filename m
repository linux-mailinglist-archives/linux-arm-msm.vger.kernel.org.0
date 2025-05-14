Return-Path: <linux-arm-msm+bounces-57915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191B9AB73C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C00C173BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF0A28C85B;
	Wed, 14 May 2025 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITXTDHRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F3286D52;
	Wed, 14 May 2025 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245408; cv=none; b=IEBzfyOdkdqauMld3NgONZtifLwiAxQhLmh5rw4xcwj1C/Lye8G2MLOz/otN+1KXy1RViGowRjHmBmpmFiS+x2whyBpu12xd/wmqjJ9thWuoj937OPPQk1djlWMNPdWLWQBX6zdm8tkcQQynl2cS3IHkW786FvlYbYNm2nVLKWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245408; c=relaxed/simple;
	bh=GvyDOY/RNoHhP7DVuGbt94oI3HUS4zcrifP/t8gYN/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kICKqIRb4gKbj6QiruAc2KfVkqqRlNLXMHdq8XsWuhLBXj/6QeqalL9/rRiFkEJ6RHiKYXz5vKTdrMGuOUxQWCNPeUAcjFEHUhvm2/yAWiZ0xrA1lxSOxpKVo11oBiEfqQfP30OxTZObupGUOTkD2Zu4oab83so4GZZC1PaHjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITXTDHRV; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74237a74f15so218343b3a.0;
        Wed, 14 May 2025 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245407; x=1747850207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
        b=ITXTDHRVW23iI5POkDcpSheskWiWufOsN43523a9ISeL2Zjn38YMP8pOjfubkNQ5cF
         lMcqdpJxytVx5rX8zfo4qItvk113f3sdZLIO3vA6YenFyxIfpqT/Zyo0h4TtxHGCMZ64
         qgJPTeGjYBJVPqcKdkHJJWbHuuMEAi2Va7ukU4yyyIxWccUU7ZekWuuqgJ0+EIUrUM6h
         66nOr4jT+WVs+D4XewDkPrrfL1aMKCm/JZoa/LqJgTBUBtEF7MXj8f9STIbynlcQdQSW
         xffKKeZ8c1B7UNcVi9cbhlfVZKx68GtdYNGb03YFs0PBtTZAt/AVOha9IO7SDbM9MGuQ
         RrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245407; x=1747850207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
        b=cRC5lWFv5v4CD7GNJeA7n8x/gHfs5927sFO4Nl5Q9VJPBJt1MuMcsGhW6PGxbGt2CH
         /Gr8pGWeiCtdoRSYyjyhfT8dJHTrDqsO1CCD+EnNysgRvzO+gFOOxB3aUlw4pGgywG+i
         YJRTx+vr/x3YAichRytvDQDkDYZXCGG2+jXtVYUDItxt3EWZYcfRst6tLmpFHpdKSdEa
         z+4/R8LP1not5VyEYQhhq9LzdlYfLGKVZyR89ieTnuFAEx0es/a2Ti0zMujsDJVAZrEq
         JZnuKPFeJwB/f+NQZTXpDQ0aed3jkIzA1DgOw0vcSO1hr/N1QWjoA371SUg9a5ipPNOs
         PpDg==
X-Forwarded-Encrypted: i=1; AJvYcCU9RKBC8ax9eLGswRpUwySuQs39EV3XRkJwU1lcrpIVkHHDV/G4Sj/H2Kmo/X4GDVMvJbLpkutqlokz2Trk@vger.kernel.org, AJvYcCWa3n7LiPZklbpe9N+/F32VBfki68AyvGOe9M7lqYR2BtFprUoYe1MeVFphGAKCWm4AKCqFjVdRzatB2hO9@vger.kernel.org
X-Gm-Message-State: AOJu0YzsqV5Mgxcg3exqwb6UfUaZC5Go8+Ae1cRbfdqqXiGThi+OeNL/
	S+W4szQLRiD9Vb/Iyw1o+UC8K+Wqpays8DNgmRIfStGBpmAxIgXc
X-Gm-Gg: ASbGncvnlFK/UDE568EpbmZI2XWZnyrly8+3jA6vcSZ1fbQrjN4MmmsIuUzuh+qQs6u
	INkmaCqLp3xbgnXRMrd6kOj4fhb9N77cpfS5oB2+LfaoQlhhB7uF7Q1pd69Ly05wqhicDEiadkn
	tZwtAO2zt26Og1y08/cJRs1uY/QUWR8RrLE/gUs+RvFOBHV9WD7HRGMz7ZEs09wiFmd+eeYhlpj
	2PwVsydX6ukKUqAft3IP1yelikP8U6UJPj9hrEb8bgamEEuO0oAiiPO0yJ44UOta65tn66WMccS
	v99OL0wigxC6FktGeqnAl2ids0eV5Qq9cm2rJrnO6uWFXG5K0eYxqdqHeFX9qOQ2dQah2d3dtjU
	F+6+tQTR3Im4h2YDiMXHbJGP5ng==
X-Google-Smtp-Source: AGHT+IGvT0KfqENcMsfBkLxNixt2TdQoBi77lNCgZoguJRXA/um6A4bYZJkQAiQ3DVSn4X/7aNvwEA==
X-Received: by 2002:a05:6a20:a110:b0:1f5:70d8:6a98 with SMTP id adf61e73a8af0-215fee2d730mr6344770637.0.1747245406866;
        Wed, 14 May 2025 10:56:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b251957fef4sm8216499a12.75.2025.05.14.10.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:56:46 -0700 (PDT)
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
Subject: [PATCH v4 16/40] drm/msm: Split out helper to get iommu prot flags
Date: Wed, 14 May 2025 10:53:30 -0700
Message-ID: <20250514175527.42488-17-robdclark@gmail.com>
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


