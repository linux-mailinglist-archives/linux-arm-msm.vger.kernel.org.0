Return-Path: <linux-arm-msm+bounces-40864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE429E80D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1769165A7E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF651509B4;
	Sat,  7 Dec 2024 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nrd5ro/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D114D717;
	Sat,  7 Dec 2024 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588266; cv=none; b=JamtMXx2BblCR4pOhOO5hOpCoPNeRMvw1/s24u1nT3qb+xEsvykQ7ywYk/CqN1lU1A+eowkEqw8IL0Gm0Ue8zRq+ZLQ96IQPxCahFizChBbCfomxvaQ5vOjo0iBVD1IeGrGO/FgESWUxQ1YLo7EfVyOPGCr4iUsENr8JEwPv/k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588266; c=relaxed/simple;
	bh=H1jOr7hhxh9q/ZeIo4nh4aWqyRjbWUXG4Mz42VYN0j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNK86zlITIjrqBt2SiPZpiARuzFnyUD0cik+tpjEm4f44SinrhdwZ52htv8615T1oaWb8bppuBwrCq+19iT7C4IGRDZ/DOTluy//7QNGiLdPlVSI+6PhT+yUstRxDXpy6L82WUZPup4QzThWY6WGc+HXAx6JnBmf5PSzxcWyNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nrd5ro/2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163b0c09afso472775ad.0;
        Sat, 07 Dec 2024 08:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588264; x=1734193064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cLXBR3G1z3bRKzv5+3ECPLKbEckhX9iHHy43Juue4w=;
        b=Nrd5ro/2cMC3tz0rUnoAcNP9Du8XJdExTRYr0jt0IaZYO24inwCtdDJpviOrpQHfp1
         jAO9bhHzFursM+g3BzQP+9eOL2LkZAcZzFGgcj4YHyts2uYR782RZs74zSdpVAYe71ca
         8n14RHKfAWORSondHFhoGpOiFOUI2/h3wiUZAbtFgq/sgSep8ES8ZsxYt2S+J3xMwZan
         f9mzMCwfJLamAvsFIK9DY0A+UDdZymCdK6CGqWXIaam0amSNHF8ao+69Ow6nh9iKVBvW
         jMoOsk3AsOCgHy84YpUPG9v6L45/DgswDwPnwxHEtEnFvB9cbncwcM+rU0OSD9XqhDjT
         AoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588264; x=1734193064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cLXBR3G1z3bRKzv5+3ECPLKbEckhX9iHHy43Juue4w=;
        b=sKiKrWoayhNMRGGhz1gL7QIFFwR1bP5xSYyp7DEWPihpDbxA5dcQZsUjo9vyo3tyMS
         yAtT6ou0DwOuApjnM+yL6iIwe3VGciRJzxNaW4BbHjFmUoMI8m8U43f1480q/p7FCFtx
         OFyVy32c0hnrvNWczbnzc9zSzFR/7U3su/3IVaXxqZItmj+uT3NjoO3Psdofe8rAVqiK
         jk3RQS/avvIvxSHkQr5M8MhWUx6r/sjiMuWQcJPJHMSHvdCoHeeJuRi3ks6bKDiO7e7S
         eoSaYzTadLhJcH5ln992VCNIWlY8Q5N20vWQbGjGSFZOy4b4HX2ecC9/jqmAW7fh2S2d
         G1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUULQ6RobdjnLZ3BmlWPW12+VwVtZoLAaviwyNaly9TFMrGeekb08W8Wqb3/HDuRFAcPILYGk6iu2lrC22G@vger.kernel.org, AJvYcCWKGChoPxBu2ooNqXInBJEVd7cGBMYgLbExoVcDMw5tjaOZEUT6cC1xPmrv6N8LpYQ9stvTOuU/dOWGOnAp@vger.kernel.org
X-Gm-Message-State: AOJu0YxgdXyvt+tJB1z5c/K54m2RH00WdScyrGj4bVZekhAXTRz+Sbxd
	0WlLBrZDxWbHabHy/NrIlkK37GREgPzG9+21UTsXkhlpwCpGGXu7
X-Gm-Gg: ASbGncuFeRwAN0Q8fk5MsY7HIXpQ60b8UWrWur7/aBuUK1T+8leQp7ZLAzQNVDAa+pe
	pzXi/uhllEX7DVr7MpiwL2ujeBSaqgVLcttvQjGUHuWBa6qmW3C8gqWyJrdfl7ja1F5gNe7yavf
	tQdFu+zFa2u5C4rdD/HeEFMgjcHz6Qr1Fryz6CBc4UsDNoAQ3eqw4lHVjQXvv/n/smeuQ0Z4Nnr
	mzfsnmNl9+4eM/stnyt7U+/6aMXrfynxb8fase50zdJ9SZ9wT3YL3TNk6kNsa7MHdfQHfi9pJD8
	9fBar39d
X-Google-Smtp-Source: AGHT+IFL+Sua+ojXGweDlYroK3L9HhW3YLR6oBasrEevNtDTKzyG2vcnQthcGfElhNM2StSthsN+4w==
X-Received: by 2002:a17:903:18a:b0:20d:cb6:11e with SMTP id d9443c01a7336-21614d50de0mr84997175ad.26.1733588264429;
        Sat, 07 Dec 2024 08:17:44 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162b13d486sm13240525ad.191.2024.12.07.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:43 -0800 (PST)
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
Subject: [RFC 09/24] drm/msm: Collapse vma close and delete
Date: Sat,  7 Dec 2024 08:15:09 -0800
Message-ID: <20241207161651.410556-10-robdclark@gmail.com>
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

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6f11ce1d0191..326764026ebb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -349,15 +349,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -368,11 +359,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -391,7 +382,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -556,7 +547,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.47.1


