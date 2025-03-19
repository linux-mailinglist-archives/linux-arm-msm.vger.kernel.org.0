Return-Path: <linux-arm-msm+bounces-51983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2939A6937A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55735188D18F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88A920AF73;
	Wed, 19 Mar 2025 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlEVwogI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D43B1DDC0F;
	Wed, 19 Mar 2025 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396119; cv=none; b=a3T6O/fGzpzN26AWwkiHj43tcGVhLJ2VRo32rlOO+igqcvmV+xCKq2tn3wDpCbaPZ9MF1caRrI5JdZVNweTrquIZCS9xGhky+nZX0vNkl0jZ4dBHYmcHpUlKiZ1QDVTTIkWG0StF5MvBpdHL/GoxzhNGbus8hV7PgumyNdoZHHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396119; c=relaxed/simple;
	bh=XV8x+TWHDDsWvhwwo25ZgVKi9ZmagmCADrK1NRYnzU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Byvb2bkoEcszkkRles/L8G5duhXaTvprRYXHRCR6hLGVlaxnYx39stbGWsUSWbet2lLa16PzsN6Prwh8Kfj1PS2ihwkJ+BhirQ2JIohP0PsQDCWkE999m1ppJKR6lNx7c4WaXpcmsHoid9xDWmvu6+Ud4G2gY8kJApYAf2GFbKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlEVwogI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22398e09e39so153763565ad.3;
        Wed, 19 Mar 2025 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396117; x=1743000917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ORYD9iaEUBX1OwggPqr2MympMuauxETKP2Qdij/1u8=;
        b=MlEVwogIHn6+umNx4DQFeSPEw94wpXCQ8gHWtbchuunvHZqv8+Mcl+ERpL4a0j4kAA
         0HliN6Oz6tpcfr/VMyfJOfKxlGqG/OAAsakYwZ2qPJr3d9S/zWuBic+ZlvZBA1C31iNf
         6ysrmt0xuijeU+GL+CxuBo8nkn7diPWtpMZyXdUECYhZ3NEeHW3Plsk/qgtpCYkXC8Av
         FCTQtW8ZMYTfTP9ipTYTkrIUPvR9tSSVtT1EqLrPYgcs/u1xt6rJz771Ww4d16aO6Ejv
         enRMG0SafEFyuioYjMBigkMRGRfJuW503Kh+F7uKOc1T1PIGM+2ZCpZQxbLaSsBzWXeZ
         8s3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396117; x=1743000917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ORYD9iaEUBX1OwggPqr2MympMuauxETKP2Qdij/1u8=;
        b=J4K+movE5zN/d1u71Ry2xKZwAcTIcFJ5i+5A9vJtjPomQJVDGB59Wtf+lcsIEqihUB
         mBt9cDMBHzNqEvVND+++Q7cQ1a2gfFayhw5wM6n36SXBTEPG135n0sQtkCesze+Ri83B
         GTxPH+mY28lcpo3fB2ZIBvrctpEP+eBpAaHfaeD5sBkcotWUBOGLwYSK7bYn+rENYlHS
         wHXBjm/LyAAPFVn46LNfKoW+5peOYPVDxqNcFGd5NthHVEsTY5XjAAhl/NXL0a6qZxfX
         lCOqmesaZ+nAkTMDvYsaCgZZgAWdfBmLRWixE93xnRfEtZKt3zNxE0pbNsoSlTzpm23H
         72Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVwA34RayQzTlCobIHvIgKr5T77WiAG/DQDV3An1kZkARoTvcpT7FWM3goJdTbLHMHliFNXCZjEM6qrwj7W@vger.kernel.org, AJvYcCWE8KXWGjtE+rIeI9HK8QHAR17C1Qn7AP7ixZzZ0j7J5GNxdUc951WNfraevPAElEDk0Q8iruHZtBIps5We@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbOk/uhukrsQHe987pGJAha1oU1DoQdxaVOvY4qbtCebOjGOp
	CDScO6hbeYYTDUV6ojL3xLwHKCDiYNiFOycG9q7nhj0B0ORf8+/5
X-Gm-Gg: ASbGncuhJ/t5dcqVqdTThdYZ3beOGwVyjrIj1JUgLiJzHV7e4XfbWvKqSI8KnB4kuse
	W/MTBBi0PGbEuNjv0OQNVlWsOFT/UI+i+XPYozX6HSGW6LnCI2V3J0dAQDI217aBVJNIDlEPtno
	1M7xyF+TwfxpbJkyuOYWJSF12NhPMqQDrovw1nMh53xJW2ZeZSq3TCAk/2g6Lx37T7PSHHNxZ+z
	/iaFJNkyFFLhJeJLKgwY7Ik4YHnlqywvmb3Rl3VUkiUi4u32EU/MCukaEcqwh5WeISD80nikaTf
	gdo7d9reYEPHt366MAoJg8HszugFFjRXyTKtURRYj4B65LvMCl1JupFtv+pnFBAI2+utrGLtxVD
	gwRlKCETz1BXlF7y7L2o=
X-Google-Smtp-Source: AGHT+IGBQPof1dc3QJbf5dt4IlT1bch2AgO2nshefyb0Q5O8dbBqD+rh4NuLDoB1B3ixTUcjZPE6rw==
X-Received: by 2002:a17:903:228a:b0:223:5c33:56a2 with SMTP id d9443c01a7336-2264992e142mr51954485ad.28.1742396117467;
        Wed, 19 Mar 2025 07:55:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f64sm115536485ad.127.2025.03.19.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:16 -0700 (PDT)
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
Subject: [PATCH v2 10/34] drm/msm: Collapse vma close and delete
Date: Wed, 19 Mar 2025 07:52:22 -0700
Message-ID: <20250319145425.51935-11-robdclark@gmail.com>
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

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
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
@@ -372,11 +363,11 @@ static void
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
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
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
2.48.1


