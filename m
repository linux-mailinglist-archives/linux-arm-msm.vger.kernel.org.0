Return-Path: <linux-arm-msm+bounces-40875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A39E80F1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2542718826A5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB391A0BFE;
	Sat,  7 Dec 2024 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uv+V8tbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38919F127;
	Sat,  7 Dec 2024 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588294; cv=none; b=CR3Uq+Xpxx/U26yBx1ZbFNl1FsS+vwIjcA1sD3wtByJJCUMX9cv6aHFFoyvAnXl49RIa5Bo/U1iDP+yBX9MGz+nRww2VugR1bcOxWG5EfZyEfdE5BqeO7wOoszjFiFh80m82khIHtdvolZM3am2xv6LVMi1AmEVqdn2cQu6T3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588294; c=relaxed/simple;
	bh=3xOXJbXRsk/kxA++i/gkyvQ0oPsQhRPpNDgykwHrHso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3IMPCNWr5A0Fur5+n2Qp1zwSl8EE1FnK7Kq6PfJGQ3RIEde/VINswoHZO114UJWC0PRABVFYGAdM+V1TOs7zJQOBMbisCU371ob8Zidw7P5DRwkoKT8lGNAwPDTabz3OrNdp/Kb+oR5n7R35h+5Dpr/oyjmyW1ot/6XLRqtM1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uv+V8tbi; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-725958d5ee0so2960227b3a.1;
        Sat, 07 Dec 2024 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588291; x=1734193091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SNShEp4K4WM48mYMhdPsbSo9pFVciKzwPQ20GScC7s=;
        b=Uv+V8tbi/mAcMgWdsttHjdT2FMLyfyqx/GlOqBaihpgj/PzI/MQOLFJmn6A6vv+vQg
         1EBmmj65esE77AoNZk6E247p30wpQDvVKt9/s+86YAN11561unkUh0w233ayFfK4z3wf
         RHNsq/AjJNtSBDai3S7rqrjfStdahK+TqJetHop55jNO8hHWkb0a43fb3fVX8sEW/4dT
         7TGLZZ8oGfZG/DWSc9HoonaYiQiQxcUgrCLZItViy7h36R6WNvYCOmoC8uU6Hi4ZH3yP
         wHemRPfGvS1zcwQHO3E/XdgIedXO0vbGdC+8cJzoHcqOovMO2i8i2MAShq3gw/IZ6OAO
         ok5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588291; x=1734193091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SNShEp4K4WM48mYMhdPsbSo9pFVciKzwPQ20GScC7s=;
        b=EJMOFpLbBrWBfpSVDjL2RPB77Hh2mD/snLoQaNuK2BzhfN21Q1JCIpyyiG3rIoaGUk
         mTIb+QBVxeqLWu1as0yoaZTiywjwvPi5KpsrzFd2sKshhvAXxb38NPpQcloGIMr0XZH4
         GbnXv1G/lKLIO8vScTB4CeH/Umz7WM2H6ya5apf+1Y2FsYCybjXINi8BnQjDW6QVSGaR
         Wg7T6LrJUDjyf4uIHf0IwYLLlCP4XreQ5ueQWpS+QKBBOIoaWinOBG8c0/DPsbychqW/
         m36dcsJSpj1tGB7Om8yi4zJLiIP79jEZBMl1yfEiCBmzSK3Z0e1nsAnHvuii7l5sk2eX
         aHqA==
X-Forwarded-Encrypted: i=1; AJvYcCU8IKKetCXJ8+M13EySwhcgjD3asDM1ZBmjYnIl+Gx60l/R4sX1GPrbBXlstetnoSbPQ6QpIXLVGVk4HiNu@vger.kernel.org, AJvYcCWx7Yw4iOp85bg+nanlq68bBtdG6M5ScxyF3UHJRKnumHCZKoUpXzmTat6YMVQGfRv9QObOQ8UhsLnhku1w@vger.kernel.org
X-Gm-Message-State: AOJu0YydAi7JXfD+VWhCSWEE54jNGV+LZJskLGHMtyHUdRjd9mVIFNBr
	bz9VPySpHUYhpy/y25G7gQYi1Ik5YxRPLlbLaqxX79C8jS+PmSYf
X-Gm-Gg: ASbGncua2mKle7CMpwbTEf2e7nfmWTUrbwA2/EEsTGzJ6kZIYFs0vpl16sAdTBdDKK9
	JspATePdCiwEwWzLq9B5of5kjswPatN0Xdf2OMk2qbr5eqX3AgDGXxWfWkwfAnDUzazUXLhVsDZ
	0HxJ6bUCKl+X2W5v9Xo9m7OrFIQ4t6NWcJEBIjmQn6DGYwCPspAhCuNGQLNShHUEz8+pi5VSvm8
	JDtmX/gP3/yNqe32YoLO5GI+jRs1aogREJ6gvh6LGy7F1nsHTMp/F6BFtWs8HT64gQR+jQakeOK
	ClUJeDfE
X-Google-Smtp-Source: AGHT+IG538J1QokDjPJHjgNZ+sHayhY29qYDR8B7YchPK8u7YmQbZ+Ik3gDvEojKkQdXazUhqeQ8gA==
X-Received: by 2002:a05:6a00:13a4:b0:725:9f02:489a with SMTP id d2e1a72fcca58-725b8177bbdmr11676460b3a.17.1733588291585;
        Sat, 07 Dec 2024 08:18:11 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29c5d28sm4676949b3a.17.2024.12.07.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:11 -0800 (PST)
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
Subject: [RFC 19/24] drm/msm: Split out helper to get iommu prot flags
Date: Sat,  7 Dec 2024 08:15:19 -0800
Message-ID: <20241207161651.410556-20-robdclark@gmail.com>
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

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c21e1284f289..7cc4b8955687 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -443,10 +443,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -458,6 +457,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
 		prot |= IOMMU_CACHE;
 
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
index a2255fd269ca..a00149d66d37 100644
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
2.47.1


