Return-Path: <linux-arm-msm+bounces-706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 619F17EC553
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 15:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D51A280E00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419F42EAF5;
	Wed, 15 Nov 2023 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL3fHydE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BD02E637
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 14:30:03 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207C4D5E;
	Wed, 15 Nov 2023 06:30:02 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc3388621cso6756555ad.1;
        Wed, 15 Nov 2023 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700058601; x=1700663401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPMvuBHzrnyzsvQOdVNlUdgVRHRy9nrQ04fDZWtnk3k=;
        b=KL3fHydEnzirEwFUKxdUeSYEOzI8YCmppHZDsk7BwRWRBDdVzV7aoU5wBXyoj3kvVO
         vxYo7iUGZdDyZa6eoaIWiS1nx53ZPS+4Gf2gjGLYR0iyG/tNwBF/9gvJCUZijQePbzfW
         kNdOYFJ3sqA3dAuo0/vk83kI5myEqYbJcpYPQcIJfFSgr4DubJotuYb4w+4lRGgPyvT1
         75oFNmzNWxCeF1JIGOLX3iJK5ruTtl8Xt26oWyyaozWafv+pcqPctJ9Y8xLEUX6guhMJ
         bUPgP78Oy2vfaKlCUc+wIRjy7W+/u1/M8uQLm8PtKt5zyTPHmVv+0r0uYcQFkLunNVWy
         SO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058601; x=1700663401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPMvuBHzrnyzsvQOdVNlUdgVRHRy9nrQ04fDZWtnk3k=;
        b=vIhjTHtGTEnKY0qnivYhwKJah95FeQk818oIUN15Bq1mgwhcqfeAPkLUIVrPFokWCn
         TxGdugp1bPormTo5QMckp4MBh5JkWRV6PPg2PcZCjFDD8TL1DaKEYlFskS1SGr2ibvD0
         o5bzhJ+kPwhbVsv4Kxn97hbyqKUUxhZzfEics99Rk1Cyj4xPlquWUNXhB2jep4vUyd4t
         ucWfsEcPEONg0yLsUKTZg38/mXH9VgkaLs8WN3EQVXFYFEAYEpdHoN3X5M3NDQx1CEsk
         rbVi6IEZ35l8IDQTg7lManmS3o+GJtfepJ60pagSUN+Fv4B6IACHSpG/Fz1Y7BWV6vPp
         BiQg==
X-Gm-Message-State: AOJu0Yy12iJN1KETX6TgnN48FtsuyyhX4ti1IhUwF+BKnkE1UqC7BS9S
	jtiOfOMfKio0sg7ToFjyIcc=
X-Google-Smtp-Source: AGHT+IHR+sZxIEfC2uUZdghvt6bSSRkjl+Y9PXIX6Xv0Rdgv1JOVM2jGbrua15b2q46+mFVr1Pajzw==
X-Received: by 2002:a17:903:41c8:b0:1cc:47c1:c2cb with SMTP id u8-20020a17090341c800b001cc47c1c2cbmr8442197ple.2.1700058601324;
        Wed, 15 Nov 2023 06:30:01 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.gateway.iitmandi.ac.in ([14.139.34.151])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm7429751plx.281.2023.11.15.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:30:00 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: robdclark@gmail.com
Cc: quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dipam Turkar <dipamt1729@gmail.com>
Subject: [PATCH v2] Remove custom dumb_map_offset implementation in msm driver
Date: Wed, 15 Nov 2023 19:49:29 +0530
Message-Id: <20231115141928.429688-1-dipamt1729@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *

Make msm use drm_gem_create_map_offset() instead of its custom
implementation for associating GEM object with a fake offset. Since,
we already have this generic implementation, we don't need the custom
implementation and it is better to standardize the code for GEM based
drivers. This also removes the outdated locking leftovers.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  2 +-
 drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
 drivers/gpu/drm/msm/msm_gem.h |  2 --
 3 files changed, 1 insertion(+), 24 deletions(-)

Changes in v2:
Modify commit message to include the absence of internal locking leftovers
around allocating a fake offset in msm_gem_mmap_offset() in the generic
implementation drm_gem_create_map_offset().

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a428951ee539..86a15992c717 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver = {
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.dumb_map_offset    = drm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index db1e748daa75..489694ef79cb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "dumb");
 }
 
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset)
-{
-	struct drm_gem_object *obj;
-	int ret = 0;
-
-	/* GEM does all our handle to object mapping */
-	obj = drm_gem_object_lookup(file, handle);
-	if (obj == NULL) {
-		ret = -ENOENT;
-		goto fail;
-	}
-
-	*offset = msm_gem_mmap_offset(obj);
-
-	drm_gem_object_put(obj);
-
-fail:
-	return ret;
-}
-
 static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8ddef5443140..dc74a0ef865d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
 void msm_gem_unpin_pages(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
-int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
-		uint32_t handle, uint64_t *offset);
 void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
-- 
2.34.1


