Return-Path: <linux-arm-msm+bounces-57911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376AAB73BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B6E84E0094
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DF028466F;
	Wed, 14 May 2025 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8cRHdGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FFB283FDF;
	Wed, 14 May 2025 17:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245388; cv=none; b=ct/mO+kLUf9E1G0j66eMhiEEXhs8zwR6dEAPqrMGsb5Ha6BxM4XaUXiG3hlIJ8ZB92Le71+S7HzlwzfwXc3hqaVSqvFiXN1kP6SY5j6s99hKqLTFVRplyYj0htwVTCWw590lEPVgsPW68C0ySvvaEdPmiBvREDpuXhLJ3EEv6NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245388; c=relaxed/simple;
	bh=ZaHKZAq/z/eNpWNhqjzvNMs33X3FsXvex3c08Wmj4FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uqp3uo6+OHs6iCE+JIGJi9CbDyPR/scuqAhvn+YzQghKwDaVBLWTWQOJJhn/jiP2W88a8KkTHQ+Q3TxpXWJqPFBSTaWfX+DPc4xUdVXDr462Y9pP0D+Qusm/sfgwxz70MLrbnrmHCwF7/iQRkA04nrl8IEqSXbu/Vr27oxM+OYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8cRHdGc; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso4882534a12.2;
        Wed, 14 May 2025 10:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245386; x=1747850186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=O8cRHdGcJslJqa5BL//RRYJzbAU7+W4Tfwyd65VnV9xmooB5pzA2CeXQjTFPZI5xRg
         clNX/ezSNW1jhu4odLMsGE/5WvdopeK1gPShWP+XaeiXR6ZVmqlsJWVOWe47W2xF/BJO
         pb2PRbf8sYudHjxBuIEJwR6VG6vLfA+JEEbszVtOcLzTdYOTxf1H6KRpFoCz8o/35f4q
         lqAW+lwoabJDU7tieYc28yuzLuVI+auUrgzJKXJMezBeYPuPbnzMUkineFPyOnmjIIMd
         EsW4e2rrAZ0ZS6NZ5QmuJP/rZXdy5v/HFj9R2tX0z2rg0rdshRIBaQuyvDjR/Iur2ZWy
         Gz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245386; x=1747850186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=vH6YjwPZi5bd8JnvdoYIprQLldf8AjCNLzI1F8udOLap3KtoD+/3IZ/PIX3Mb0a87N
         kC2EXUzXwagLjPzgid+1y2d94ZVvsBPGo/8KsyxsrpF+ULSdx2nUimaio8h5cDiO4ySo
         Qe5/yPVZacxjwUpga437Ob/k0sQU73fjq1DLnAAN1Ft7EimRWyZKqf7r4ex8ZKMJd3+S
         /PoqMAESA2lT1Cx94nBftTRJNZ/40vOmJJQEH5PwLvn5GqcZ8YxrQwkmH5/p5MXtRsz+
         Lo5QKOTvQhhSe58IsI2ReQAl/jslKLCZLHLlifKKU2HDAEFJu5NItDbke/jdGFnlWVQy
         mBLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsvJg/lddArmIRU4Tox5ihuFRUKPHdXQ08YxUEFHt7U2k1C3ONq+mEXJvQtXdr4OqrAWpIAgX+i1IpcLez@vger.kernel.org, AJvYcCWh7NraPZgrJG5hIm+9b/KptjWo834WVniRAqnkzl5Sit7foeSolfoh7/6USjjQAfOQFuytoTyFgD1pvfwo@vger.kernel.org
X-Gm-Message-State: AOJu0YyRb328peOK2tGqQK7fX6fByMmJOVwPbII0kP9Sgkn36cDgxMS+
	6R8wcwi7jdY0+nLOvwi1eYx+82t2Wjp/49L4YffrKKkLqZwA+fIA9Rl7xA==
X-Gm-Gg: ASbGncszWHVUnT9+0eKtTuQB7f2nlWivFxVUt1GtbzBOs5zCjIZSGrPt0pYNlvfUnGy
	Rhwbp48GnuiSk/yXe96OG9tKM6REhTQjFr8vdrkkZOWdfkQp9i7dmkD4xWFXMg7viuG47K/poEc
	4AVSteTU3y8CP8CgEhYRt8LSx4t65tHT1xykdfPTEUgws7A+lPTJwxA6AxeF69osEsWsl5o6GLh
	qxdpfz9HLMW8tKkbLWWfnQHx0FDR3VCVvjCj/9DcZRtyEAOE72Fz5EtaiFh7NOJNufg+C7WZfZr
	sLNKf0gxC0/O66b2Gjrbhb2J331zOBZnWzEIqRGlA7teOiEeyYsq/5xAjizceQXiZcF0Eck20ny
	5kzNeCpIp6XXGR6I/zuy49u08Ig==
X-Google-Smtp-Source: AGHT+IGukWsez/rsnNsRGc5ErfHL8ASz0asvwHUiI36cNdrmCfNidsjmethOnVxzxVnZSHJPAPoZlg==
X-Received: by 2002:a17:903:1a44:b0:22e:50f6:b95b with SMTP id d9443c01a7336-2319810def5mr64036295ad.11.1747245385722;
        Wed, 14 May 2025 10:56:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828c630sm101206235ad.177.2025.05.14.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:56:24 -0700 (PDT)
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
Subject: [PATCH v4 11/40] drm/msm: Collapse vma close and delete
Date: Wed, 14 May 2025 10:53:25 -0700
Message-ID: <20250514175527.42488-12-robdclark@gmail.com>
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
2.49.0


