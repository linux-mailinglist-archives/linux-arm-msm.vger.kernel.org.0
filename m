Return-Path: <linux-arm-msm+bounces-67555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71169B1927D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18B01899EA1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C22289369;
	Sun,  3 Aug 2025 03:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dw/PdZgr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBEA288CB6;
	Sun,  3 Aug 2025 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193574; cv=none; b=sjXPe/S1PZ37fJZMeGZzBDYruyBD8xgMHS3yl6dyn+RWOQr1Qfp/emPfEg1+S6SQRYWkT+30eGJNDGiUK32nL3SFOD9SIJ4SHGHh1Be1wXoo2cuJxeWY0uY2hWlxV4pHQOJj4B9iGaEk0tdqc14w7QNgphWth6TEENZDSRkVOIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193574; c=relaxed/simple;
	bh=LZ6g4CutEvHxV+teM2ugp7arz0EefutykRgDZEB7Cjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1xxQPChoQtZz2tAwTvYRuG0ZxBA5HKGyrc/25nwH5IK0QCPS49wQK5hAXaQISMFcrUiTKwHmdPj52Nzc8QDv98dk28u1RJJmRYoHkHRc0wZH9aUEWh/fNp4uqKF9wkMol9Z4+f8ImM9ccEWmotz85zeVneLuB3/0rmWwvMyXX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dw/PdZgr; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e40050551bso23420725ab.2;
        Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193571; x=1754798371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyoOqz+KNU5cHFw0iNonI9mdJpTRYeIGpSlVGT5QSqU=;
        b=dw/PdZgrCkafpZA7MMZL7oxFK20eGFPoJW5m6YxSH2qq2x/H9pote8HxcgTuYWTtmr
         4nv17JYJcRY9cAqegNnTIAMTm5CIH3ydIlFCwf2gTHgz4Kv5kzDV5+kd1Nfq8Iig2Dg6
         gRbNGiUhKZ1jZAxrCHzA6ZeYQtaX4X6+Vz5fniN4AjuqKlOCsbL51+X0sURmJo+A0qEK
         tr0ZNSnYEc6mqe/0twFRS39X5CKV/xo0N80dnsrFiE07G5djjTg9qTO36KoB6N/2P3Ts
         4NG4SJT7BRIp6tLupQSI8xFGqzsV75hKw/PZ55qhVaO/yXxTj2qcgP2xPu5EAKMoyfvK
         lPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193571; x=1754798371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyoOqz+KNU5cHFw0iNonI9mdJpTRYeIGpSlVGT5QSqU=;
        b=aTyLd7IjYzEbuGZIftFvMb/veSRPfE5Elv5PKFQEzLQKcQWETRteowfnhJ6AxWXmRG
         /TjfSkBO9KmN6CJqe/u9vRFbDXfAXey7AGzuR0h10DOxmUooDKVIFdJmJZ+fayREU2v0
         kJspSWmkphJT70ameyB6Vm7JO67WdKmAUrWo/aqrpQzpEdums9JbtmejG2ldS2sjA0rh
         zhI4cClVLj0YouMX6xCGilacI86QbfwobXEBQWP8O/u3J6npiIOZdLuJkubqvfo8aVl6
         WgLm1g+IBuEQ+ORCNx9ZbZOmkWgRPjIF5IbOpI0rFzdqIhCH8LD7eA2hDLcL2yf5sOFS
         LIAw==
X-Forwarded-Encrypted: i=1; AJvYcCWzOtmQ5tUs+vSDDQscOJ4xUZyHU9JDS2/SEpOUIvNSPEge1Y7LqkveSei+Dew/rWE9QxcihfpyQe1TwgQW@vger.kernel.org
X-Gm-Message-State: AOJu0YzMTphWogFySza2pj7Ah6xfhbs+tYkGEj48KiR00mZpa677tUOu
	YxwL86BhcYsZx4lPlzEr4/js6Q3jEIZdkNRw3fy+LAaC5Qg3oIWlSaowfxJNyN9LKTY=
X-Gm-Gg: ASbGncvjpEVETiC2UazVmsnPC/UCDmvQ817yyRiej9tTX4BjumqUNMvNVyaHK0/PYsN
	GjIJUItTtjMnnvA7pxh1LFb8JgIto1fTeHqosNo+VyvvBx00nR/tWjtGCoFa7PMuoWNB44Sqmq4
	YjvWVwzu0+ecNGKsokDZh3HleGtRaSIjLPd3lEs/Nvpdnj6vMyILxbVWsKSBCw1yPQtZQsQYf5C
	7WIbCTWhUqmliesMgmWtbX4Az9gaErA844s8VPRAorx5wnvbBnovcBZ9gzjzrBEEM6hCm3HtOFx
	LKWmHsPrCEZXMLOpbHZtKdLXQKigGd/trQUcKGvv4AfMcn8URtJ4m+ybv4fY0svZW3dKEOWE9Lf
	DRKvTenisMSFG+hXb289hEXL/W17tmolp0IkOqjxywOVck1g5W/kCvNd7iOij/ArshFibvdF6P8
	6KjQ==
X-Google-Smtp-Source: AGHT+IGah3M6q8sow7PmA2xw/j3+4wUg16/XNoOr3ocRA+wBN5F5xifQppQnjG3O+XbNYtlZUh4PWQ==
X-Received: by 2002:a05:6e02:2686:b0:3df:45bb:2900 with SMTP id e9e14a558f8ab-3e416109eacmr108511895ab.5.1754193571601;
        Sat, 02 Aug 2025 20:59:31 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:31 -0700 (PDT)
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
Subject: [PATCH v4 39/58] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Sat,  2 Aug 2025 21:57:57 -0600
Message-ID: <20250803035816.603405-40-jim.cromie@gmail.com>
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
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 39497493f74ca..8d169a6d7053d 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
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
 
 /**
  * DOC: overview
-- 
2.50.1


