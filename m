Return-Path: <linux-arm-msm+bounces-51996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B1A69277
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68469467750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A0921ABD4;
	Wed, 19 Mar 2025 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i38Fh7zJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618821A92F;
	Wed, 19 Mar 2025 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396153; cv=none; b=S8of/MgzC+81oOLrLHLl3DhRq/E7mMPwTHSASGJfWohE//a9na6+80XZhTy9P9YeGcyLP2vQzyR0RFY7M9gnqsGak5MLbL0rkfCYXiRqmmIhTzsIMdnFANT+NEEAgwXPUfGj3YaAtD3RCwEvlC9Wr5qRlLaE9R++bo/puKQ1rEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396153; c=relaxed/simple;
	bh=apOwKrOGjMBFZG/bB8HtRZL//5ABh3ISxn80csiHTzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivdwIU9eIlIG3AQfdtbHIm5/UBFLJSDGX4p5z+JLGPMsggCxWvLRTWLyLTAXpm4HJDdOdfsY0W1UnfG0ehsEenKergdjmm63tJnI7dTWfXu39EJsydxxyTpr4UuEaftCqgZqBTGCPp9pJXJMrHIkAQfeqXrugSov/hD/DkYx8wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i38Fh7zJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239c066347so153011705ad.2;
        Wed, 19 Mar 2025 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396151; x=1743000951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0exLxAAAlQWwVFJcNsbOVvtN8oA++7dfPbHDbFWzdQ=;
        b=i38Fh7zJYQMywr9OoQxSPYUE0RFlBxUI9FVbS4dK069vbhUR//EZze4UTTTrZfeoeA
         1zgKQTwKhc6pYWthFVBZgdFdt+jCyrbp7+wFUwu7sKcrGgP3VRXYpExHjHpaFUA2Jsxa
         IPxLmnP3d0VnXLbq5RFMnEwEA7yf5KBwm55pFkZyTcCNKK38siWDK5GAewTsd5ndPiRs
         q2M5KeC7PXOcEkyZJj45bXsqPJh6NrpE0fhrQSb1zuafAK3oUbvqGZoWQtT+NS4CGKO1
         ddv5XIQ+nd/Euw+BsDy/LbvgiSbRvvw/maENyLLOGw8GE+pVqYGHAfwT8yYQkI9wEfmO
         jX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396151; x=1743000951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0exLxAAAlQWwVFJcNsbOVvtN8oA++7dfPbHDbFWzdQ=;
        b=uxnUtkA6DRm4dGm480Bh0EsHcGgfbfeSkrsR145ucFgJjPpjtPk2uuKcS+crAEsTj/
         k31pWLAmMF9KXGTYfiuLxcU7vttNAJW95w0oR4BTJ3o9K7FWklnK5sx5IdTldtW++Le4
         wm6j1Xy8qsNdDJrJMmeQc6ZqF2jJ2+AuW9ZIOhghMNjVAEzApb/swO8kz84TyaLEBroa
         6BENN0PeKScm9dCc3W9xV90BRoHCDKxqClzUNj2kpbeNT0PCLS7Hs1YiS/Jx0R783sq3
         aJBHIQFO4MRVYxU2Gn4BYlwWUP6I6FjkQIsCHX+xpazPuDf0bMluCiIAQYqMfMh2PaGg
         idNw==
X-Forwarded-Encrypted: i=1; AJvYcCVIaO5brzomnZ1rFTgWt6y6Pl+ReAMs+RLXB1GsZRGRi1jJ+dC8y2L5CSM+oOIKA8gu0PlMFNXYVhUbQ7BV@vger.kernel.org, AJvYcCVfGeXHN0d6chwArfdMqfzEYthV6xC6JZLSffNb1lfIn3kGN0JU4HcrJI9/Wo/H2VBSIgk2bzbNenIq95qY@vger.kernel.org
X-Gm-Message-State: AOJu0YxwwjpgWDdwRm7w8cuP3YORMjBFYwiq6GwW5fOOfKjAZAh0EElD
	jNm56yrh7jXk5hjmYiCh/WFLMByzCUpqpw6xMwJQ5d0VTx+CNnML
X-Gm-Gg: ASbGncvGTSMXamV4p0UwRae467XjuhMxm6s1Sr3Ndz3xwwlqYeWBxdK5lWPtVZFEqyL
	5P3uVUqxIlk1InRcAlJ+KUXDnn9M38zWzFymohE6vMrEKpRua7jMlmXVQE72woqTdZYVzGPC6sy
	0h1AK78KZDd9xvaA7xGGUQ9aHabOvBG0zgI6IAR4WwZda8MKi09WDR/cRUEzkSPSKjFzJoV7LE8
	yDnozqvVyE2cD8prWHQyLnx2LoGZ4ChP+iiDL5CMOXVoyUQg2JydIdwSfvyjgdBjNaMJdR9ayab
	tlQ+1wb3Tl1IoPqmikcZ+2+y4ErRgNrkyOoytCLlQ7caf973ynoBzb1fqluIMKfjAXoEuVClYw3
	MloCr5g95hUoyvuq0NfIqNqdaT/N//w==
X-Google-Smtp-Source: AGHT+IFoDLZMYe7t6b2/oYO0pMxb9/WPero4OWX4DxcDjSMBc4z23b1LAAx4FG3aJW9vP0kMLtgYMg==
X-Received: by 2002:a17:902:ecc5:b0:224:1221:1ab4 with SMTP id d9443c01a7336-22649a39fd5mr44273665ad.22.1742396151063;
        Wed, 19 Mar 2025 07:55:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe8f9sm114441635ad.175.2025.03.19.07.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:50 -0700 (PDT)
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
Subject: [PATCH v2 23/34] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Wed, 19 Mar 2025 07:52:35 -0700
Message-ID: <20250319145425.51935-24-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 577da3c54c8c..dcf5f6a25f87 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -421,7 +421,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -600,7 +600,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 3919b384d599..1622d557ea1f 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -141,7 +141,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index d51d54c0da33..baa5c6a0ff22 100644
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
2.48.1


