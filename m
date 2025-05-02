Return-Path: <linux-arm-msm+bounces-56554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F11AEAA7848
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ECB77B8C62
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EDF26C397;
	Fri,  2 May 2025 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUz/0G3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C18269B01;
	Fri,  2 May 2025 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205712; cv=none; b=C49QKpp5s2Goo3EH2zsf5q0cfM6IWWhgk0nbnQ/JPwrd4J07il3adK5hsi4+kVNJ80QLGSx3hXz2JChZwGbkkG1gRutJVdTvjXiXSQiontJIi4MvX4PoxQ/2ExSwe6o5myD9WiyQOfqt3tvR0fIiAusn7zMFFkTtaepGlOK6fGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205712; c=relaxed/simple;
	bh=GvyDOY/RNoHhP7DVuGbt94oI3HUS4zcrifP/t8gYN/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8n3cl2PSUSSqMHHcau3M0SVkpGSIfQDa6/7bDQpOvAxZMRTckBXlCYfxNge2XwBsDdrdQzF09cWuV3QLN+fwMX2w59afNsbiiS19cvepH3fo8zDcX7bRNQVcklNKhPc8MQxLUqpFaF3LS3IFG9uHP5BXyk/HXDkUlVnChr9eoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUz/0G3q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso2383130a91.3;
        Fri, 02 May 2025 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205711; x=1746810511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
        b=cUz/0G3qBd1QGlYqDXwto1BmrvUwdhHDUsM4w3eUPoYQ5GQKtDaKmp6o6LsjG+uqu3
         J0Z8Uo5BmMCv8/0jtCTatz7v6khtTLwRResgdBHqfsDEgk5SL3Po0oViXSBIU7qPVPPy
         P8HTzquSkVB8JJ1PAnUXfu37QOEtRrKhMAlR71hKq+LKtFKIb1zc0f0zhDZPmet400eI
         q3BLSk2Qts8Sk2HA9CKlxpvvroqizOSQ8QyNhsShzvhAcxgbkKnKLuQFITRAC785/u6S
         qJQomQxW6JZdpZvEH8gweb0ymOSCOe/js64qRjfSyZwoC8wAw8jGbrD6aTCECI4oBIBg
         en3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205711; x=1746810511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
        b=oYv1a0vJtA19OKpSTvxpCBj3TBAIiO8CeAuNDWs1cTF5gln2KoG6lt7tD3kz3Uo0iH
         gGT4UI/TpDokdimjWckHi9Rcc05v903q7IfOXLXo3XA2k5H8gpFrKoB0v1D3K2VU92Cl
         OsKlEZBHVsMbbSXAokKN9csCwacgr032Mmw+fm0f5RzpkYaz3QTpAqZydv2VixpKkYcO
         57zeCyEv2xVrHUOtpSCAnwRxwqaBacOtnULqNp5SnNVeUOJZ622I360cd3mmkaaafcO3
         lzCBNQIrIX0D0I5ljTU0L8aM3thm0wLD6r2IKZvSUFwdNWaSIsPd5cU79Jv4+PFeFGcl
         MbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZSA0Cf+jAKfNCbqG/Q2aKofA8OjTtTp/9VUl2FtVHdkc0c5pLN1A14PfWJenuxgrV4UDJR9Z/IbhWRFmQ@vger.kernel.org, AJvYcCXuzPcmbQb/WTFzDSXm+1JupxhnUbXoryXPGUJMLuElXdt7tgDD1jeCc05Y5rGD/F42F279rykA7Kt5mgP0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx71vJBt1yB0CiIqG8yGz4+j7qX5ex7gS7k0HkOQqwwgmEcDSRz
	t0vGxFZN1hvQicDuXE6hOyXo+mVOgeF0UK/w5DsHTmn3kO+z3zci
X-Gm-Gg: ASbGncux5wTif1pk1Uipca3AD497HF9jfpEXdceob4UoDmgOteMvLuiBhnR9t6svRKV
	ocGKoBDr3shj6D/n8vzugomX6lh24uxMXDwNmfFA7YKb25thJ4Nrzq4Zq9k+/5Xp8GKaD+7ppmg
	PuMBKIFAVmgbFVDM0qBjoomSjCV3VJqQBQIpn49FyP2W2+V37YPmcwEeQ6k68Of0u1+DLehzQ/r
	uwr8GszojB5K6nOg9kLQkidbB8hZNHuHEhQDkLolELlBfypG6aEbqMso0GY+HS8L7pkOgcCVjbp
	/9amjUXVGRgvS6U2XMbxFctYFeIGAS+FuvdDzbaOdVlraiQUu3vCIivkgJLUpFY6qvOW011l1ao
	/GUrNb+IP24RadPc=
X-Google-Smtp-Source: AGHT+IFRs9s1zvJ2sIcC2vxf3EfjnMsTcV6crkXiUi8h852MPLYvXaJfrqAA6aYjxElybWjBLIhbUw==
X-Received: by 2002:a17:90a:c88b:b0:2fe:ac91:4667 with SMTP id 98e67ed59e1d1-30a4e686b4emr5451445a91.29.1746205710645;
        Fri, 02 May 2025 10:08:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a474768eesm3272255a91.16.2025.05.02.10.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:08:29 -0700 (PDT)
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
Subject: [PATCH v4 14/33] drm/msm: Split out helper to get iommu prot flags
Date: Fri,  2 May 2025 09:56:41 -0700
Message-ID: <20250502165831.44850-15-robdclark@gmail.com>
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


