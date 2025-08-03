Return-Path: <linux-arm-msm+bounces-67553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0EB19278
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D703B72B6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BCA288C3D;
	Sun,  3 Aug 2025 03:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCLxm1QY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2406288C05;
	Sun,  3 Aug 2025 03:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193571; cv=none; b=TQ39v5L1+0lWUt1PP45Ve+jrkN1GnjZCx1L+nn1BynztgRx3mAC0Dt+4VgKWl2zRWW1Uk+lNatAXKvHy4jTaOtElRywXYzda13RRSrCk1Hc7isTauL48CrAA+nwQ4WaImpCishY8H0EjZSTxIlW70lyx5hEsU1pFeNglVENFjNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193571; c=relaxed/simple;
	bh=NEuXYWs1Nu3RUtMYz4WulmDGQSS835PHhChst+S3OwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFbeyDMYf5Adfq+1beeX2owFew0m9LW6FBebXU31LsZiZSS3ABonk5yxXISSFg2sApheX5z31vErRXi2g2x0NqWy/6Hy5DA/ByEI0rsKs6Vv/axUcWoD4v/B8VPFiwezgfFm0zzRt31hUeRq+Ub2f4P7UsESFGnx3mUqBhEHNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCLxm1QY; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3e3f449fa6fso30582495ab.3;
        Sat, 02 Aug 2025 20:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193569; x=1754798369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDxCUuQjUGu8gAgTcWoe0tjlRu1oBXDA/+Q2bzPJkMc=;
        b=cCLxm1QY0nitueS3nlppF6yZPPtbfZsUaygvQdtGx+IWTyJxCAi5Ad5n9b9NqeY53C
         IHorqv9NiPcg0AkjZPOmbrHrha9W++6CItK8CLU4hI1F12CPKCYtji0kaOShpkukh1Tq
         M0w7H6nwcYJtCMAiDqwF4tr+ucR4oeRaHCKLTU7p0AxQoIkWA61fbJJT/CXjR5X4HoSl
         2/KAKgpW+us4CREXUD7TwYzW9Pj3xtcYFiDDowmHqYYKCt9mfh8jyL0wAG/rMaTpjBWQ
         P9hw5lcJF/Xo4mFtDLrEhEmrgQz+3zkAA41Vo31kh+Foxbl1g2OrhWhDw8Ctwhyo6M6P
         Cziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193569; x=1754798369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDxCUuQjUGu8gAgTcWoe0tjlRu1oBXDA/+Q2bzPJkMc=;
        b=ChGNGbt5z5QhSSByzTf1HWRa6GCLy6k+UW2eVoj5//8vHa2MgdzvUUQS+YMk+TJUVx
         1AbIxt5MpBmY51YNP0Ad3ScrnlyXxfpY9SqxJrwX8YFA45ftNTeBF+1lHCKmgoKFvp/T
         uBFoBmqi//f6sqaNvsFxLggB6NeXrXYGhqEP3HA/ko/YZYl05HGG6TnwN+Yim5MUMHvF
         zNLMMDESI7n463urdpeG0qbIaxetLiiuHBCs3kgnJKY7DNyYCPpErDDlf/pkZGTG+N8a
         55gDgiJnll8JfcCeei9WCNdFrqmyeo6qsqP+rSuD3Hgl6BzGk0wgdi/HaZAJqtCCvRzh
         Gfqg==
X-Forwarded-Encrypted: i=1; AJvYcCUDm45Kwo0tGkxYwDWmx7NuFg2fq9+GaYgk1za6m5JkB/5VNLxnAnen/2NSZSlXWyuO699vRufGkhSqdnjl@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0MNBs8DsAbKqsiD06P8ZqIT52gU3934FXx/DJFw4G7GqEhrd
	mZRU/r3KQ82I9Hjw0/niX4bhhhiy2VCHAWJrece5521l9Rxf3we57uUFH3+idUp59vs=
X-Gm-Gg: ASbGncu4nDwF85H5C7IoBv3wB7QYrFfibvYpC9eP/t7l8PneCwYwfUSW+qmBLIAmZfl
	TqcVCOHjZn1loiVVtCi1Spws2/0aLIf0jt+CkMjHYfDykGEkCQJVWoBLml49MlKe0QNeky0kEQO
	4RjteEA1rs4EqWO18JULHO/juF0HJp2DZnIYexixCwr7ZxmvC9rxgLmNeGZ76ou7pr0kD+JuqNP
	g2q8u8MEmG6trXzFlA4C0cX+C/NkAs7CTIw9Gagxmgq/tB1R0Qa28nGhvfrDSiymHor6lJbVkwa
	bok5wvYMq721xBTYZKn6w0gqW18HY0Dc4qoveFIhhOsIzTL92bLPLROXZcYB74DkcB6BA5OzzVZ
	7nCjVSBHLhQEP4KGzO+1IMa7s57Kfyxh6FFH3E7jr+cGLpyNr+5WNMafT1N/OFjT2Wk5RLE1T5x
	iCkQ==
X-Google-Smtp-Source: AGHT+IGth3u4prFPioIoRO0ZqX+noSjESd93MJR6zagV7L9uNGSa8yCZng+SW2QdyW/djCNVq3SQ3g==
X-Received: by 2002:a05:6e02:8e:b0:3dd:89b0:8e1b with SMTP id e9e14a558f8ab-3e4161b3e64mr95013645ab.15.1754193568672;
        Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 37/58] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Sat,  2 Aug 2025 21:57:55 -0600
Message-ID: <20250803035816.603405-38-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4db92e0a60da7..b235e1e8c6180 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -245,17 +245,7 @@ int amdgpu_umsch_mm_fwlog;
 int amdgpu_rebar = -1; /* auto */
 int amdgpu_user_queue = -1;
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
-- 
2.50.1


