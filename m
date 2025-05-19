Return-Path: <linux-arm-msm+bounces-58522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B852EABC65E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01EEE189E8A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F6F28AAFF;
	Mon, 19 May 2025 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBziU+BF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF3A28A73B;
	Mon, 19 May 2025 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677291; cv=none; b=TJLhftdfVpeqyqOfhC9nF/qDOBXuEQc53Y/MS7mXawJbCsrPOuhxV0omfym7ITgFwlMXUvWvdjS3GsPfMVxmYp1DhXL00rTMDiN6YRn7wSAqQMvks0B8UQjFuXFRGqDG03C/e2hJD22J9dcl14mCUdBvWPf4NAM11ZfF6ywEcPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677291; c=relaxed/simple;
	bh=ZaHKZAq/z/eNpWNhqjzvNMs33X3FsXvex3c08Wmj4FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJH7jsHr159FuwnJUksOgJGOy5cFR94+dxyv9eYYiKNrquDccF5zVWfGkysHHc/RhjzZdgbQvpzvfJGbQQLBnDi659dBSsWgLGaRS2GXUAGv7VdfXEzUrlBxsA4WNthFLu3gnTmBsm3gYN68IqR09LiLtH5gCg620b22H8tgGMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBziU+BF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74068f95d9fso4296045b3a.0;
        Mon, 19 May 2025 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677289; x=1748282089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=PBziU+BFxi/uRjzpwSMDLB+YkWJg0bYzp9bAIMDd3Q2ubwFcaiGo4+6higRvnO9x/K
         MXSpTCSiLbksrRrTRBA/Nn+/JNqHZz4rJwHUEbU3PmjsAvwJniEfxsWU6OOhP/cq1Qkq
         dT9zVWTb2mtCNmRhnyjt0oSnF0V0+00gW/3aAUy6OHvX4CbyAc9/H4ZMyahZ+SalCT6A
         XwqRi5N97z3AbIaQIrdWub35pi9+2IUT3OevyMVxo4t3q+6wv1So8k96wkr57obya35r
         /kKWMRQDOtUZw/Y8qyA1QppLrNJEGqXxKgZgrzmBZ0pfz4nEea/Hn3I+82xIfHJXwsoU
         OFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677289; x=1748282089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
        b=oKzLQw8oArDLddS6//ARuOg3VbJVGutvZJlNBLh+Jo1pQMotxAHPwuDQBOuBwz2DVU
         XanY0CcMgafBYYeGocb4bOyfDzT+AN9CRcho6rr6XUM/3GHHn+2WrioCXg34RNXk3XXv
         zEruGGsibTNlp8ZyHcMtLl4jIflNnhyiw+ik6IJKFlTtH+/z+nr27UUJabJFC7StEz2F
         EFi+XH62Vn7Gb5AmLgtjJCcjO0yKXMzkk9vfsiAiKtnY5qGgeMTDCGx645x+uJYfPYD5
         2JveSZvln8bDB4ZYo17pugsEdqatpQyMaJm22CGEciUO3cfPsVaFTIRFHeQnR/ASAQQ1
         qK1g==
X-Forwarded-Encrypted: i=1; AJvYcCUB4kapQ0QrkLq4L9T2FT6aN+YI2WGk06jcBNagcRZw8KuNV15IAcElvtkKJSWNdoarzCVADnc9gmsReIva@vger.kernel.org, AJvYcCV3K0AEwY40E1sdbyWoIsnRgg/j5MhL7JZVqCmGDPkz7CbrNalYfdt3tuLiAiZu2NVwqzQykCBo9LlAJktp@vger.kernel.org
X-Gm-Message-State: AOJu0YxiaLeNdHExqEtiCzG963gnZEKJZHARA3wppsReEvj7hG+UkXbE
	yI577x2Oo2yX8kacrCToeSJEuHYeDqZOnOIIjad5PWyTOlWf1+fl+4Kx
X-Gm-Gg: ASbGncu39VcUo7yVIoXqG+MoB1cpvmfycPKml1mIeb6iPMPxBOxvtAEFsoSLWVKWkgi
	m7U3pR2jonPIe8BusLk4KJWkzznFjmlpgzwhTQFOg64JxBligGEhYptMN2xPWdPZEthdgq+5iv3
	k8VWQvpDAWzcVqFTuZQEnTnAltXhAZPbo4qi3IXw6j5KubwasDVUWqD5LnY+pBl0N8sLpghRCnQ
	wb69VhRMLgC3polg4zOTQpJQ8+Z1JtcB0yliOLbyaIGcENZsFTiWICxUPXfvnVwS+C3wXqCsDAr
	H7LNFZZCPUgLfz66BxA2zh+ZmM+IbWd7n0EgRkUM7aez33HYhJiQ4F/ycdLx54e4opp6YTZGbMh
	9c+GmVZxZu/ywU+/wugVM3Lbr5/fhRSVYfhtZ
X-Google-Smtp-Source: AGHT+IFlxtzSJQGaFgyXf/ZCTkw2+pm26AoftU/iyWEASQCl3jv2lzP8WS3TOfWZ0zhznDu5/OaUmA==
X-Received: by 2002:a05:6a20:9f90:b0:216:5f67:2d90 with SMTP id adf61e73a8af0-2170ce0b11bmr22774792637.34.1747677289149;
        Mon, 19 May 2025 10:54:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8e05fsm5622749a12.39.2025.05.19.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:54:48 -0700 (PDT)
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
Subject: [PATCH v5 11/40] drm/msm: Collapse vma close and delete
Date: Mon, 19 May 2025 10:51:34 -0700
Message-ID: <20250519175348.11924-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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


