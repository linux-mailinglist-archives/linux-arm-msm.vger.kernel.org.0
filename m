Return-Path: <linux-arm-msm+bounces-58527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5467ABC6A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B70CA7A8DB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8940228A1D5;
	Mon, 19 May 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9uO7TGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B7B288C0F;
	Mon, 19 May 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677498; cv=none; b=f6xIZyRol1SVrrjGVV07iPtga5A1ydu7fplvrZ8VYDv61FVZEaK+2PPp2fmsOZJfCWqfLbIQ3pCoetAeCPwbdsW7MSPPdcmRc2jiNKTHuMtbUXLL9YXsYq5dTqKnPQm7jJQ3Ehzf4Xl28I5aofyz1rZjBZabm+AmVlgGlktaJw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677498; c=relaxed/simple;
	bh=h0LM7y3HUhdp4vKxYG/KykLjtSwzZLPYiRqlbsRlb/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geStwmeMn1OZbwykPSiW7u7xk3CyKWAuVSMZ9EIFMUhz6XTnKqlgs+Fe1peSDmYsvBenCthBkhlIOxPyCKRKjYQHhs4zxTQv3sLiqvx0F9xwmftDU71Sd7ERM5u7ODFG8KZKVNzrDojKZA5olDonupQdQuFmb6LrxdKC4US6pbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9uO7TGM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231f5a7baa2so21665025ad.0;
        Mon, 19 May 2025 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677495; x=1748282295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSQkQS6gUCueUQ4Hx1PQ5yLuWwzx74JFyGcJ6vU2NiI=;
        b=S9uO7TGM6tRiiWcQd9bexbfRLqKw6bfsdsI8xWEl/Pbs4qxLScBzfvY1kCFU6PhLjG
         9QtEUDrf8j20bflfAAIOzDVeWSfcMPaP76dONKzV2EH3IR++/1SQeann6Nka0CUEsrO6
         Xd3AXfs0W0+cczqmRHAJgrKxK/whm4Gpd0W+qeGiGkZTbyaMM5rUlP/MZYHgust/Pxkt
         uccGXb7t67Jx8J/Fyvgk01GHKaBCjXexBgZyG1HjAq3l+UIqhSBVIGdJK+6kb6XEJz96
         djj9bwHH3HlsUljNFSMl/zxtOg2zoFbBXW2YfOpdGNodUxue4T14a0FPqXoerNzCoOsi
         3Z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677495; x=1748282295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSQkQS6gUCueUQ4Hx1PQ5yLuWwzx74JFyGcJ6vU2NiI=;
        b=XDrnFjXCvxvUyv4M9XDexmMoWe/rnM1Cs2EiJgHsSvZaE4YDEWHkxQrGE3w3PNbZiY
         DKsiMe/T1WS5YQ+Gq+9c3O4Fo2KTn93XYp5KSoEqbL+YSyxS0yqzf1IQg0T8dG10hYxU
         pVIyj+V3yPAiolMFt6oLQ5V2uY2KWSjPufT5Qcgp3bck9q/Vsfas0eTO0H4cQbgwbckg
         0S6Pyevt9wIWmwg+jn2N9GUQ7VKnBnQVLg7XZLDAm9mTZp/P5iB9uViqqk3FNi0iFnrN
         77I+X20loe7cR4p3MhA5pZiaokqUU4sU3uHNE4HSmKtu8NSPYwwdvgdIeno4692V2zsf
         dxGg==
X-Forwarded-Encrypted: i=1; AJvYcCVte2CBu9+2mHKb9C5f1dR6GjYQlcE1DLQOD5GVHE0VaOpOZ5ya0fk/2aGul1C/nI0/aSFvRTvhYNQ7604t@vger.kernel.org, AJvYcCXzEc2uuvnJb983nXqTMbJGad9E2D3fmmrDI9xqVg6/JWo5uBP118jajOgbY+qurx2FdEJ7b/nPXS9DmMnx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3aqTTM45X/7Ox5ijO8pnhgCmU5bxbTrGj2BacB0aZZMNu6EGT
	yJQZa6xLHhbQYRsDC8Uq+KIi46bB78EbKyIG8fqu7Bei7XNd5sbSvySm
X-Gm-Gg: ASbGncumKxH/m1g6sahmNXAZUZKQnSQt8q3E91Z0faPJmufOCr1mFb4uksXt5xCAUyp
	Xgf8yH2cWGEIi5lPoRBkDRM7ykQDzsJ0lovcuECqi0saBGbXC8+aSweMtGWerU9gsNWH0RqIS6U
	Y6YKLxfAkL5cOMkyNSQcWJ990/FlbXc+8evkwrzSOSssHQ81FtQosPtWHYDnb8c9ciykt7Bn7b0
	2RKDAp5lrQxtEA070MLTpbqx2I1Bjg71K0AJcj5yVjxtTZKSIvukj1NPeuF3rQYMr3OD/6Fjh16
	g8H7Xrqt4MTyI3Pg5rj+acnG65pwOGl87EvIEbbS4nAI/ZjPvQWuGa2NWxRHqpk3Iek1PgnhiGZ
	PvNHC8gOoqRlZZhyWnVt16KSWlQ==
X-Google-Smtp-Source: AGHT+IFd9XZtWJ8GT07VyLdYZzMpDphs3K+QujX8XgAxBMMoKxGzCGJZYFE+xZNJPKrHrsqet7BTEw==
X-Received: by 2002:a17:902:ce87:b0:223:653e:eb09 with SMTP id d9443c01a7336-231d438a294mr182426675ad.7.1747677495374;
        Mon, 19 May 2025 10:58:15 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adbf5esm62981905ad.64.2025.05.19.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:14 -0700 (PDT)
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
Subject: [PATCH v5 16/40] drm/msm: Split out helper to get iommu prot flags
Date: Mon, 19 May 2025 10:57:13 -0700
Message-ID: <20250519175755.13037-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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
index 81500066369f..5b8b9c1d6c74 100644
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


