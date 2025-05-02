Return-Path: <linux-arm-msm+bounces-56541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4BBAA7802
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AF0A1776A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BB32609D7;
	Fri,  2 May 2025 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtIrp6ug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7DA2571B6;
	Fri,  2 May 2025 17:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205633; cv=none; b=VAhRPVQGQ0ai3TA3Zc/v0xOtuRqEtWlJxeFpa1zp/viPhzclDTxp4zvkOEcBWJvIPJlNEJ7mOhPjaVdKW3Pf4cXTyUVXQWKnGIo4+B9irUlppB+pnnxRaBGZiNzuzpBBWjUpOEn6irDRGMDVgB2ptz811pb2Arm2DPILi6jzVMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205633; c=relaxed/simple;
	bh=388Q4Y2vXw/88ABph+aL+8fVavpaQXXIqL0c5ylbmAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkA8lVrxCzBedFmUj1wK5r+mkQ8fG6oaju5qa40glkRsXvetsvfzgCIjDSuCo0EXRZQiYjM76DNt8zMte6SeJ6B2lDmeqTu5Nu4SQAOzD1a/oMfq8R3O3LFcoofr+ggworZlWY5xM60XpTLhPJUmtd4oj79g32HTfrj9s3IVCH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtIrp6ug; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22d95f0dda4so35408935ad.2;
        Fri, 02 May 2025 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205630; x=1746810430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
        b=QtIrp6ugdFJHeFU4Ur0HJIPW9GT+qhZor+TxxsszxzHfyEeKNkfo9EPf08svjxCCxt
         RMNKim1Z/clB9rUQkBizI8xv+7HEA5R2eWI1rFHBCxP20MH9zcnugWqugBstgTD4r5nI
         Q7mLbxdCkHwK5J/WkhV5k7WhQNNLJdziIpmcplM3z+y7YAdswIZM3w+Z9mLCEJeKhmRv
         J64BOgMCLep04SBr6GZYbr0hwx2pP9XQxFIX5pTJpCRqxqTfIANsClAxnYd69lWcUTK3
         vfNrLB5tESQhVA0Dd7GjNYS4ae5WoZiKJrVVOUCcYbReGs8LHcZzLKS5ySDX0+ItDEuF
         CWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205630; x=1746810430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
        b=anei05CohWhPaF+hV12EqSoad/HAQh3ZRuDaFamS4pRPIlreolEAFjefs+yZU660N8
         XV41RO5MZ3RtUKi71NZCaMMELJyFDZ4rK2q5dkp3K2q8R8tjSs+rX9j/sdlnG7NAH7zz
         oPb8u0DWYHfIj51idT+zz5CtDtSrJBR3MZi3WAlAL0Qto/5XVuhErJsA+ouriiSr/sBz
         2CJVEg4pv07qvL87BirXvG2SKp9mx7NohWwSl9Z5zDjdVcnaRhdFYGxyXOsZi96rg0DB
         vSEQYPcKIXhq/WMzE3mJ5B2aZ2LlKb/+F+cw19dYzLJyoZd3xDFfecMaKKuNM+LrPlrU
         OB4A==
X-Forwarded-Encrypted: i=1; AJvYcCW0s7KayABNANVN/syTvdI9dawsJEpAIex3/dvab8nsM/7/O7AZN31LTbGpuVZtawipEaXPMXWflbLZ9Vtu@vger.kernel.org, AJvYcCWcUoXqEYozna1J43Wp9+j+FxHdrabpQmaxulBnI2oedXSfzDN4yjydyuAIZwYl+mRDcgHQ6NqhbAW1j1ci@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHiPPw+b6IFaArKrV0H67Ydo8OG6SA0XSAmQ7x29vHBv5KrNH
	NToJtoLoIqQXjtvXfs4qIiFFRjn0BjsiqztBr/nzbXFkuAZ1dh3t
X-Gm-Gg: ASbGncvf8WDMVux/mepWcaZrNNh+dnFAd+31lOJ2dqFAyLFjOtV6cojPSsm9HnQtpEF
	ZuXuCwJ4C4QDn4lAfv8rgT9tobXMT/paIR6u10G759+U5yIcm/yx+KMuEVc6Guco2+YnpvFcKec
	hFIMyWXM0pUoO2hDJwBO+MJTpkcCnmuxZvJbiLDNX4e0dV80/K6GTJcIYn41hT2qhE7Zv/HkE8H
	FNKHedW0NnGgv9nEreVXgu5yhTSi6GRQP2ZPYB5njp1t6UImcGFv1PJ53imEQilEdd/RkyId+O2
	qb6nEWijjjPemSmYShei3UJX4NfpQIgqVMV296Zk62btBLM8wpiImY8hR0L25yI7yuyyKciqOWr
	WakgDlXzMuvVnln0=
X-Google-Smtp-Source: AGHT+IE7TQeRZPIV/k+l3azgDI4anbEhAEiRsOacnr9mxlmxKQhOYTpWkTEtqtqMGKM3T9HH9By+vg==
X-Received: by 2002:a17:903:166e:b0:224:24d3:6103 with SMTP id d9443c01a7336-22e1039fb34mr63598215ad.35.1746205630457;
        Fri, 02 May 2025 10:07:10 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa7bsm10053795ad.141.2025.05.02.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:07:09 -0700 (PDT)
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
Subject: [PATCH v4 01/33] drm/gpuvm: Don't require obj lock in destructor path
Date: Fri,  2 May 2025 09:56:28 -0700
Message-ID: <20250502165831.44850-2-robdclark@gmail.com>
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


