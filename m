Return-Path: <linux-arm-msm+bounces-67556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A37B1927F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317E61899E51
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C4828937E;
	Sun,  3 Aug 2025 03:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VW4RBkb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C81289355;
	Sun,  3 Aug 2025 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193575; cv=none; b=GpsF+oB/BpS9nQ/cOtWKgEO/go+rHojvlnGEPWIaz62FtxrSEEV9ED4OoDc7cds7ZCu3nKojITV9Zqfl9pOWgrThgh4N3XqaMA0GVu2WleI1WZlgcjy8LXHza8xEgqZ6zvdfF/BBbUwifktabMU3Aa+/pbCbcmI26v0AqjoyiEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193575; c=relaxed/simple;
	bh=9EdmxALKthrsaiHkwGl5/a1JlnNpzHteLrz8NOZLATM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRI7nf4yzL4mP05Tphe6IrATII3+SKwQgnSJwQWRWKIeuDtEPdd0O2TOZSdEY+o39p7qqf3uMUfV/++c09D5a4s73foSqVV8q3s0+zHkVjgspO8v0M3oDnUK8JsHWFjIUfzJMhsH5SQMkWufMAhftji2dwDgvVtEGanAZrvS+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VW4RBkb3; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3e3d2ad9180so12217005ab.1;
        Sat, 02 Aug 2025 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193573; x=1754798373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX0wy3dIOkODQINpUya7i2089vNboqetAJr/ccri1K0=;
        b=VW4RBkb3FX1YAtn7H/3oojzhGuQvI+EnywtArUxl3qc0FxDQKO5Q4StyoEwvvW2shJ
         muZhN0ilC/rgGMKNMKpzEu4ve8yK52/9wFh66uaqEX80VbLiaRbNQKfb5J3Tj85kD3wg
         mpnH2z8K8ZD0KDFGPHlHgWP4m4IP0CkD0H7m7uBhhnOlsPPRkeAGk5keFK7yBwntdSn3
         t+cmrjMpYMvO9mcbXRO65YAuNWN/zuqfgdIhaqrGs/mSblMeU8YuJJn/0DVT+qlDkdiJ
         1we7ALNuSYqOR9KHTemifnOm6L/HF8gdmcEfa4VpAY0nCXfZ1D2q0ctMtQYlLHEyJIM7
         3OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193573; x=1754798373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX0wy3dIOkODQINpUya7i2089vNboqetAJr/ccri1K0=;
        b=ZMrQN5LLFkVCQj1S6JAxDZwgN3y7yCsS2ztindmiJDoBjfIUSG7569d6CPxXYiKO3U
         1dPUTyv6K8AriJXlmbey1ibo+g6SkiQJrEqEKb3XmeclP0UvSZb4xjY+ZSHsU2DFutgQ
         2z3/rUWkv+ueF9CaFpHXDSX+QPlnBTfQgIiDB4MtDoHcradJ5aszXGnUFqq5naegCeYJ
         fyc03esgofQFh7vMnWc4TW/ZfTbM/V81EwM4iDJ3+xB57uPXA3GAoRxOwvBAHxWQX8x0
         0ZYqL7/DLY5nBZkKeXI8GL/89GZTfjp28D2gmC+Zelf7gJ0o8o3KOcvzV1OvozesAy2D
         x94w==
X-Forwarded-Encrypted: i=1; AJvYcCWpWyG7em64Iq19Tb/kHY4TNeZrh5/9tl4FSpD8WNFd8M1R/Of/NeGl5pdNFVAl5TAdKYTd3Kr2RFvTVXxr@vger.kernel.org
X-Gm-Message-State: AOJu0YxWEpZkt4mhtHRq7WfHthL6sgwVoVPdG0nyz22SznY4Xv8hVOPK
	X5bTw6kzIJmx0u+AuGAuv/3k9Wj1rs8X9IiR8XlG1kQ+2DghxR/Z9hKFFcBawcWivu4=
X-Gm-Gg: ASbGnct31u326Lr1wrP3EdUYRxN8E7NkWJxBfrAz+BsnjagGn3ypmiKI1SftZk8PGDz
	TmpC9gtdeMDjcyb3e0LhdFcTVHOOHZn2WmbdVDzkO1gjIRvm1awi5Hi7vgSSQgLTm8PeNuGqCzr
	a45LzhOPN1Dgsx/lQqkw06z5plsM3RaTcB1GLvVaDMlvvb5jHHwqhkNZPMlaoXF7Xf6AA3xVbPa
	upLkY+t1mHq67cjQqofOme5HbL0WnKm/aicwUgORvIXAHRHITDngxoRwr+thgcbFknTa4/OmehV
	2Uk8qKAuIdeSsrzG2DkSZtimhmksvPRVa2nrQqAJTk+4txDRxRfkrmfXgCXo7xT5zr/VQJZ518x
	SbLVsPBMZVytvmhVLrj0dsMfmuapMzw53z1YD6gaAgHuKY14PYL65kfgoosTecc6UyobT4y1dVK
	HDFA==
X-Google-Smtp-Source: AGHT+IGc+JsMKOicIj4OsJejzSDjbJADbBCmxpF9C67GucCVwf4NPItA66Nt3F/BJKgx0ySRSJwRNw==
X-Received: by 2002:a05:6e02:228f:b0:3df:5333:c2ab with SMTP id e9e14a558f8ab-3e4163772c7mr75665075ab.17.1754193572894;
        Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
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
Subject: [PATCH v4 40/58] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Sat,  2 Aug 2025 21:57:58 -0600
Message-ID: <20250803035816.603405-41-jim.cromie@gmail.com>
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
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index ea78c6c8ca7a6..f296fb9de0aa9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -43,17 +43,7 @@
 
 #include "drm_dp_helper_internal.h"
 
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
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
-- 
2.50.1


