Return-Path: <linux-arm-msm+bounces-57901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E57AB7357
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54973B0252
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BEF2820CD;
	Wed, 14 May 2025 17:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZgBuILq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E7194A44;
	Wed, 14 May 2025 17:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245358; cv=none; b=tWDeR7ZRuQiFrKwy5V43EA7qnaZMtX52eAO/jDnbbUXrdFmV/JBo9pPT3bbtF+xDw02IX44FIFdP99lB/0KAb68MOxARylplZYjVje+vKnBrOhOBteM4VjR6NYWAX8QPzHnE1wLzs+fsT3Qh5ipNbH32S2LrhqGLnSoyb3oFTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245358; c=relaxed/simple;
	bh=388Q4Y2vXw/88ABph+aL+8fVavpaQXXIqL0c5ylbmAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C044tPtU4GYWG5JKYXRmW8QodTg84bTcLTqf/CVERmPrMGZAj/51jWaCCPCI6JiKIWkCfF0A0oIN/OAFMTx/jcxtEkF6uJX7JzQyMRySyFUKG7jGi3JZBalbuifl/2GaYoSxg4lAxuMP+af30t4mOTwiocovt8joG2SUU7zsjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZgBuILq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7398d65476eso121425b3a.1;
        Wed, 14 May 2025 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245356; x=1747850156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
        b=MZgBuILqozZMml5jtmc31MqJaHNiUvDknJwIDMYJXd53552bWC7LuiAycy2BWoXhF8
         SmC6u7apqApMZYTNwTZapuB3CBFzrOvFtsX0vsSZOXmdIrikPpcGipbdrk20z9mO2AA1
         6nc2jdfkEZ8AZpqzSmznED4pvBu5svhJcXvcC709wmsyW5jQOKC0/+LhvMj7uH0F7CiI
         0rMtFfr1VoATtsm6NOjOz6ZRON68e/zUxxKUDM5vcRUGsTpqtbRpBUHPjj7pq/ov8m+S
         rckCVNHlS1dTFVN/2Xe2UPt4ZbXe/k2aqtMJNzMkg215Irvf7+f/4S+5wF2ThKS7O98i
         8m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245356; x=1747850156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
        b=AfT00B6leOuhCCy6whZM/GKBQxLOqW4+9EoE4wORnJlSPdT9DLxg2UBkpsDti0zpdn
         hKX6XgnzNUfL2dzAf8r56h9ktioeRevgEFy9vX082TALL0sqGWSg4LlTlYayW8m/sDgd
         iaZx6vAhmQSrZ+83oU5UEJizSlb9nG2JAJ6VzA2LtD/3on2d2b1mYmtDsZC8g+S5IWQQ
         PxbclSL38KacP1tq8muOGKOYUqfmCNYQC2nh5z5AMp4ApIwfmKQRvCDL4i6+hNPcKixW
         fCO5r48Dj5UrY7H+UOZTjLutTOmWR8WbU7hzJfBhyAv62xkBbsZug98SKiWCPYJ9VqRZ
         6xoA==
X-Forwarded-Encrypted: i=1; AJvYcCVHRLLBkddHXdsYzy+e7RNFsXfplWeTHLtYpD4v5eBwWuBajn5XRsVIfKROj369BCya7a58S0LFdnV3bMLM@vger.kernel.org, AJvYcCXFROUX6HJjxVG252wfk8F5lEtDVpuvthca1lhGiZLN5BPDHvyiPMjjkSTrMzndiZlZrkdfMqWxxiW4Yupx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+G9AewBu7l+PjY3FbK1bdML5xvZdNyKcTC3ovTR9uasuY8+BP
	y7HWyoqRq8iG2Ia5YneX7EaZ6el5RaFQ6h7WyI1c9ie8PKKL0MQWGjSV
X-Gm-Gg: ASbGnctMwZtEv1xd5RRi+7DaF/3D11sfheIVDDF8lHVQq7AaOrwV88wr4lbohNhRU1Y
	gyFRt8wAPUX1ir6j/8niBWmbofUI0FUkzGkTFjfTIv2pCcSICE1aDaqrWXuKsrQBHGdKHPyXQ7p
	nKuG/s6XFuguQB8xwbFYpwf//pa+onRWL/FGHBx1D5F4AOTBCM8aQ0mGrtkLBIu9J41LJYhhETQ
	TB+4vaV1xf/r80BtVToF7oD9+dTtp4KV3rguYS05nfxJhb7miN7G861H8P8awu7zlK09DpSEj2j
	qFgIvRGkmsqpnKI8VTZRHXe7tiVVimJ6jwJwFNclLmlezPpTOosFTlGKRY1qStzuAPrj7M+upsR
	e9z7WRAdb7/jIERmd1GFpRVkOZw==
X-Google-Smtp-Source: AGHT+IHjF82FgDHpaZyfZ0mh0WyzjGVyaIiByKx50y4IkVOdD/N+GORUPRIwiVFdseTs+TiJRwcj2g==
X-Received: by 2002:a05:6a00:2986:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-7429625def6mr688672b3a.7.1747245356164;
        Wed, 14 May 2025 10:55:56 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a4997dsm9853111b3a.150.2025.05.14.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:55:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor path
Date: Wed, 14 May 2025 10:53:15 -0700
Message-ID: <20250514175527.42488-2-robdclark@gmail.com>
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

See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
msm_gem_free_object()") for justification.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..1e89a98caad4 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
+
 	list_del(&vm_bo->list.entry.gem);
 
 	if (ops && ops->vm_bo_free)
@@ -1871,7 +1873,8 @@ drm_gpuva_unlink(struct drm_gpuva *va)
 	if (unlikely(!obj))
 		return;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
 	list_del_init(&va->gem.entry);
 
 	va->vm_bo = NULL;
-- 
2.49.0


