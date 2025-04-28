Return-Path: <linux-arm-msm+bounces-55956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43499A9FB41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12723B5666
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1CD212F98;
	Mon, 28 Apr 2025 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUkE07TE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E220969A;
	Mon, 28 Apr 2025 20:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873825; cv=none; b=lWFIvrMrls+SPiE07yDW2qcgWysc77Wp2W3kK1ddxBe5GEXh+Fs+2ExesOZzZVkz8Qo3oBe2R3+Rla6QHQkK3bJP40Wv8SYtH5cw7wJl+3Yauoga6th0Xe9W8gq00TMHIkXohR/pi9H6GfknF4N6JjMDH9u6y8NRS9z9zwxSZuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873825; c=relaxed/simple;
	bh=ZaHKZAq/z/eNpWNhqjzvNMs33X3FsXvex3c08Wmj4FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANOeuqMO8K4QG78HF4qvT4XREcThjUc6QBH89EF6KQHV/cBWh3/Q5OTGUXzcumh55J+u9E67LGzCS6W0Nu0duVyA7JytPIGS1SpXVMQI6Z1h7DU9zWTYt0Ud7Q2Us4p96yjVEzoURSrsrI+5eMP/ziUz2o99f3458iNcdKVBAAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUkE07TE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c3407a87aso78517125ad.3;
        Mon, 28 Apr 2025 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873823; x=1746478623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=IUkE07TEqxVnASY9cq4QByXMDuimzaOsyqlbZYY+/GbWtOjs3Tp7sPCyL+50zXNaLt
         YQc08pL3/Nezh9W5bjpD8XYrUZaZiIpwEqoq1/UlYS4Npg3Oofu9CfVbr0w2jIjf1Yib
         gY0E3noA411DOxdD1UqHHhy3sXs/vvBokuJ5DxZAZvPG1y9n7RE4UuUwogmoQNA5mvfp
         KJ+xIFcJIsBt9UE8D680JTb9DHzGJd00RDgSxGXP/imRwwA2V1KRRG5gNEdk+aFYn3CY
         u7iNNo7WqhGg+VjWMNo6T+dBx15jPGiVQBUWMtW9H4ivboluwkmFtv4kFG3Ntx/gFLd9
         0jaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873823; x=1746478623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=CsTew6wNV62Oft4I2pLOK8dYdnufHGDXY3TfBu0jN++jASllKFb73KglY+ozxvMz89
         un8pE6iIeg/Uz3XHcTrl0co46VYbr/wGthC6UobnGoHN5RuPg4VsiFyy/5pr5N/xFmgl
         P0g5iFseYW8lsoklnLCL31rNG+HMCXaDCC/MmpnVow9FAhLdxy9lgHkXzdoLfLpXVfmg
         8ZfYTtgjBLvntSjhZJgUxSeu4P6OsQOjuEAbV2MJ4oVVrblkbeCeOC3JbVsgz4ocC9B0
         YT4b7fneiV7f8BtAmbIjvU1by/S9r5aOiFf2usUk3QAjiWhY89u3D+BnUd2LvKSJtSpI
         GPMA==
X-Forwarded-Encrypted: i=1; AJvYcCUp8yx7kj8NUZLqek2uoklVVpClmKJL6ntf0NJakUF/uvi3eC0OcCPCGtLETu+EIlpzZj2bu42k/S48Ybdv@vger.kernel.org, AJvYcCVKTPV+gh8Bj+V2oGxG53zI08kzpBv4qffj4nQW8zfuzldcdIeJKabh8mJPDlXKvgXKz/lzyhciCI2zAZvo@vger.kernel.org
X-Gm-Message-State: AOJu0YztydeO/+kGakMAg9xD3oyGW2vYxre2OJjKuk3SQhcVnxtD2ybg
	MuYTJl8glVS2+OmiStTisyYrIoCgO1tJBoohkKI88dA6ihs6wmtH
X-Gm-Gg: ASbGnct9xOKP62Bgm/UN4EfH9pbQJ3VmDJbf5T4l1TDlUyjaB1dDcLywYQivaYYNy2l
	v/X8dcBwbsrUNZs+rP1x3wVcMYrnDMpYXmezw10l4ChbnC2L76Qgo5ECM1h6r2jv4B5Co+njwMQ
	u4Nwd78Tiu+cYEYivyiK5k4kB/cEZ3wz7BgBI7XYKVBRsZhD6NmLHXU5Mi25kdOwDCMvP+MWIyg
	7ZMuot9Sw+Bqj4ksRQp8aaxHP0pUfZlgwoy1EUEUZWtY5XC4Pet9np8bMzUX5gSVcT3A/8NdPBT
	9UtUhkLFB7ECYrGeGj80oVUhxbiuIeDdF9xUBMa5tetuHkqNJtP19OzRLtcO8qtUZxQB0GrsPAV
	vquCqq1dUgjUs3Vg=
X-Google-Smtp-Source: AGHT+IE+nPnA5uSWbuDzPOfm9Hk6C6UvKRQoPLuOUHAT5l2tZMUHcvNbQ6XjKjabo4vFijxW6zfEfA==
X-Received: by 2002:a17:902:d582:b0:220:f59b:6e6 with SMTP id d9443c01a7336-22de5ebb98fmr13939615ad.8.1745873822844;
        Mon, 28 Apr 2025 13:57:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ddf3c9d1dsm17245505ad.244.2025.04.28.13.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:02 -0700 (PDT)
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
Subject: [PATCH v3 09/33] drm/msm: Collapse vma close and delete
Date: Mon, 28 Apr 2025 13:54:16 -0700
Message-ID: <20250428205619.227835-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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


