Return-Path: <linux-arm-msm+bounces-51993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9940A6937B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91FE71BA314B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBF72185B1;
	Wed, 19 Mar 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPgtRdO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA3216392;
	Wed, 19 Mar 2025 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396148; cv=none; b=i1WzmIAJgbwHmnjQ5tyH9T9dirF4jZy25yFxWkuQXX71aGIFJgMFyB7ddVhbN/+ZAUa+mxv7aYah27DUlHnJL9ni1LGn4k8xiEmt8wit2aaR9D2UowMfigZGyygkSi8gfUvuBwFm6R5lpvFh8GmqiEQ4dIgSExhbDcRaiEUDW3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396148; c=relaxed/simple;
	bh=s/IDGSPtFtyq6BsRNppwoWFj2s0mKyrrEhZ7Z4bbcdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nM4yHIcMu6RQmgyqoP2RN/K1qniLHoEoKVhLTFqgFlZcx8cAsLviZF0pYSDYPMH7Py2V3vckTQXPnA+jQMZN43y9Pb+F0I32+2k7EOLsMJMGmgFfYig1d1NxoHRXFzg7uO20prXLhPRA+P80QMiGMfStDkgD/vsrTLAwBiRVP+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPgtRdO1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2235189adaeso17197235ad.0;
        Wed, 19 Mar 2025 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396146; x=1743000946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTa88Wc1PRQnt0Bq+oT6ziGwXmxanAJ4pfowAqqd5w4=;
        b=mPgtRdO1lBqT5X/LEM1r/2QTzBxxlfqGhVlFsWQPXFcGv3sbrb7r87tXaASW91OX65
         To/aq1Y8rBkE35vuDZHz6IfkHcx4Okug9m9VeI2e0KlQ9gSAM9RYUe45yRqdevsN/pK6
         c3vxumycp87iqIx/GX+xM1NgzZ+/irB76yzxbgk0iavJmc6G6RmDfiKVtCv2zcxjd60C
         i9TYUIcJX/PIV9XWyESGKn34zwMEfnlZB07hxh7ZO8ZNGOQq/i+Hji0+NyIoXkBqEXK9
         RCZTDeNa3rXJMlxLVzy3ooHPDQmTExgjOOxmitev/pFpLsH5xpVL+jjE92rem9aFswif
         2d0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396146; x=1743000946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTa88Wc1PRQnt0Bq+oT6ziGwXmxanAJ4pfowAqqd5w4=;
        b=uNzprZHJMC8pnROv9f+JANiU/2DPX2+MrT+/48QUovyRsKyg+glpp2L3D53tlhDSUC
         hKnGbzNg0V6l37zJvulWeEbkbmBoSrl6mPSMsquCEmWP6hrZclPf0b6bavkxGqG8ezBm
         5XRfkDjD2pZOXkedtaFDqS3KSClKncrAwterL7SnR11rff95US3Q0eSqy2VTnIga1xYU
         d1mw6ObvhMVSpNmIyiDpZtP4KPQUqG0EqhBA5k0SjsBdMWrNg/ftP0c+4NVYlWQcxONN
         k0iUVsTFZcrHik3m6R4VEWzOtei1lOlMr2v9NENPA/9CrYiTUhg1MM2d1e4bMJOEU1Yf
         H27g==
X-Forwarded-Encrypted: i=1; AJvYcCWpUaDM70q1Q6CHF6/FptHGD3N7f2bOAC5vgFhb9N0vvNSvW5o3xfsbsMeBiAWIJGTnMIY06IJgmuP8mN/d@vger.kernel.org, AJvYcCXL1zG5bQ3ADUdiWN0gClGVOwfh9h7AG61J+TfwQ4SLTLxiATrg611i5mBTq7fxE5DuNwYBFO+ovjXYfRHV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn/VZ4EasvcTMyLHfaY+XEJa5jjyY1JS+JYwtyPzY5gco0rj9W
	C+Az6/G98XNC7fFjb2VcldwmgK4DvA2gT/IgiYQgWxfHvNFHs4HcJcjFeQ==
X-Gm-Gg: ASbGncuL56EtGLTLB64jpB9fQeWMs9flsHpBspRg4oVNf7h0pmr6X9M/k86eJZZC5Xb
	FMHMor0k9hjmkL3fOT2nXHhAO4t7JNy3wjvHfmgjtHdM3PU3NSTOZwl/G34TUKBwkg8wi0N0bdr
	tEQ51Qr0pcc8EuBbHEmZsO3BxlVNCbsVX2GlQJVqFtCF1M6FLU1cYMsZF4pQOc1qRtlp6zcKqxV
	T9X6bXJdhtdpvArgaajV1TKRv3GB6sub3OaPN0MUooT1/jE1kfgEG3iUEQs3OveoUbs06S29fcK
	7+4ul3yiDdmCAKkkBDIdxi+bpP+a6jYRSTHs0osFVUDllS3Oe89mvZcBIhzjQPyZ2eZKMNcd6lI
	MBefgq7XJ+4KLCgZdgaw=
X-Google-Smtp-Source: AGHT+IEYmBCck03qV4awJfglZ1ySlOg+TYRs9TrxTfus0jdkH3x90RPMTd9fqhOBmyksuKLy5IuLjw==
X-Received: by 2002:a17:902:e844:b0:224:3994:8a8c with SMTP id d9443c01a7336-2262c99f180mr124160545ad.8.1742396146125;
        Wed, 19 Mar 2025 07:55:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbcba7sm115335995ad.173.2025.03.19.07.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 20/34] drm/msm: Split out helper to get iommu prot flags
Date: Wed, 19 Mar 2025 07:52:32 -0700
Message-ID: <20250319145425.51935-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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
index 9d4f7b76471f..632f560c81ec 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -450,10 +450,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -469,6 +468,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
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
index d427ead2dce0..7ccdf15476b9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -188,6 +188,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.48.1


