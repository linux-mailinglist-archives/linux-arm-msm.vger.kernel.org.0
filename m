Return-Path: <linux-arm-msm+bounces-51974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A5A6933A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BACC1B63DDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FA01E25E8;
	Wed, 19 Mar 2025 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht4KrR1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72DA15574E;
	Wed, 19 Mar 2025 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396091; cv=none; b=B2JBiOdQmljRRonLuZLwePG4xwe9HvwGTwUAul8WdTvGDriY7q4XjfXPPceKC8xrieEeO5JdmME118Sqz/nBJWG4xOFtBRlMSSSBTVEKcu9hNrw4TZkd/ViE8zx+PPbMZkJyvO1xbdg/zwEEspeMLxkXsRnDBKWROfQHCvaynBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396091; c=relaxed/simple;
	bh=0C0WG8RuFcb4duEd3LV7+fbJ5H9jCOyDqUbHqQ5OjpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwRKv1Y3SOBFAgSueCoxA3eFXAqKtG95zKTkar7X/Co6M8GUhRm2d0dw2usDBRYPplqXDciZxIcgMz5N3V6uGk0x/fm84HJnK//wn+kYzV8AeuIYmO157qGBEqXuJjIF2+b/o/LzPZc8RXvnle335BzETTKXtfhkELpf8E/vKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht4KrR1c; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2264aefc45dso23454095ad.0;
        Wed, 19 Mar 2025 07:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396089; x=1743000889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dZtNKeQwhga7C/NdCHWATB5ZEqb/G6D875fLgA0Gp4=;
        b=ht4KrR1cl/arWFhXYB5QGojq9WZGUoGfvdUYAUriqsr4pzwgBeQ0bEZIG4902tkisB
         o68dUMlUjD06Wb1EAgP/6LRUQubwUMrelnjnvr1PJ8s2/KsYpOYXwXmClgiVkPtVIjwg
         c0ugfrVlZH0t33Sd2xexW7xa1dthQjHqIlqR6I6CV+pba/Veu4OWovFB53gfxNfJfWbQ
         MqmFKOHqPLxDmeej3+Gvzn0T1CPdpCs7PoMsfGLEobNEM0P/FMOKUG0wrrDYdxwaIdHt
         YeZBF/7o80gt2JIEH9Nf1v2bKCWY4Zl62FCxfsgM2V5s3eqh4ighDcT03alHyVXbfnHy
         NIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396089; x=1743000889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dZtNKeQwhga7C/NdCHWATB5ZEqb/G6D875fLgA0Gp4=;
        b=VGbBnAa2TOtYTRgJVYtfxi0Zk+8Hk44nIukUYa5apeCHE9mw90HSH6Dxg0iI3x7g/d
         zJ/7d/TwsUgUSfiU5BZcWl6KZKXcUB2JG8w6SiiJPX/NvaO0okyaJmxlQ2BuQ0FVSOKo
         HR1trb9BmOyXHqcfxSRrkK1GWGMaEJL1GHzq2ulH8GGhwr9Y3q9xeVJEMBxapzLEZek+
         5kFoWP/GA7mTPamOJp3V6WXHShVr8/0kZCPFmZXjYZxmkauGanfJhArnollfQU2agw5n
         0YiFfnf8kvm20tJ/Q0wLf4uoC57KSflVl9LUWe31iJmIjoSkePpxE/U3DG0HLkF2xix8
         yoig==
X-Forwarded-Encrypted: i=1; AJvYcCUjJj8qvxHJ4BrtItkX2Ryiiwk+SG2GUHKp2Fy2t9t9lt0dd92LJd7y+DiP2edGe68ms1Dz2iN1fvgZjVcc@vger.kernel.org, AJvYcCVUvJRQ28FOTeL8wLwpq7DB3w8rgLBUNEYsmhbPhPFgSHwUUDs+R0GKec7NNQKbCnEqCFL+wmluRgv+HSsG@vger.kernel.org
X-Gm-Message-State: AOJu0YzZqKEiei4wavD41GEZ/J8OqBV7XqI9wvYjTlkFpyK6Z0XCpMWS
	QH7LYmRrJPLMyshek4f8wkH9XHYHK7ySS0rIQEW4egFMd2l69vDF
X-Gm-Gg: ASbGnctWwVhMNOT0recMz+oKKEan5OTsNT3LOrJGeFZmMEuqSdzW0amfYSzEfynXxAq
	lMiVRD0A/5sIs5QrGLvKXUe49YWzSqYdBqKFzBWAaj29zulpa5Hs0i9wh8fuqkN568xH2BAWhcP
	K3T34Sc+EtWLJj/GfkdALaiSX3oI32l8tv5KyDvqIu7r87r69BR/VgpLE41Ld1KfPHOQxsDviRT
	XzX2ctxTT/95MFkbOe/NpcRmlfVV4jHllfiZILi0Ml3iNzxIIOey5l2dIYQIQz7A85rGwTiTrVR
	SwdEvWsQ1poX1xQgI4QIdCyxiH5zyCge4TGAJBTn8XYNSw+akRJUtt/c7K3M41Nu/jeDYsyJyfj
	ugE2cTzxHwOcFSVjW8aA=
X-Google-Smtp-Source: AGHT+IFOMy8+oTohkcWuHiW4WgtVgQ/iqyS7y8TuEZyHPSXdEIIYmiy16h8Qp/B345NHcEo1TSCqRg==
X-Received: by 2002:a05:6a00:e09:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-7376e1f2ae7mr4929307b3a.21.1742396088919;
        Wed, 19 Mar 2025 07:54:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167df97sm11699520b3a.114.2025.03.19.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:54:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 01/34] drm/gpuvm: Don't require obj lock in destructor path
Date: Wed, 19 Mar 2025 07:52:13 -0700
Message-ID: <20250319145425.51935-2-robdclark@gmail.com>
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
2.48.1


