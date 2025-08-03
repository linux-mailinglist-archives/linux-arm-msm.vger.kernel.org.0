Return-Path: <linux-arm-msm+bounces-67554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A21B1927B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4866E17A6C3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B8E289352;
	Sun,  3 Aug 2025 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbIBDuPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C44288CAF;
	Sun,  3 Aug 2025 03:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193573; cv=none; b=IBqkYI86u9QDDP5aDL41ycy3CziBGUQ/MDbJJkEcEO3dRweTOV74XpajcMXPpCW18ymAZTgbzvMTWgFuDZfDq2YCW99TRGR9G0/lSEYewAqke6dj+D01y9tmjslKPvYyyyKzzTKuQZXYulVRngf32ZbI/6vtbwr7veMzDyS1p4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193573; c=relaxed/simple;
	bh=zT461b2FzFFJCZzizTkbtgkGyEOGBSWSF2g13psQ6ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTfD7O0wXcCkJn/1l0hA8Vav2DSLTCzwn8j14xd5emXxEjhewbwfHvznq/rnTOnplSjlskI8Pck542DoynXJZC7JzJYmTeXK6+X9qSszTavDTDFQ5jeMYu/sfHHla7eKlrjCC4OFwADBPAM/sb1hvedtRCbSXI2mHTihAOvJtNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbIBDuPT; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e3d31a9ac7so12935055ab.0;
        Sat, 02 Aug 2025 20:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193570; x=1754798370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqxoGMNKs0zT3PFEOQHIVmiXhAzu6aMNCZrDaU5Xy48=;
        b=EbIBDuPT4IKz9B0Uwna8R1mxuYXV45GdByO4Ko/RP3tnCpA5IG0ekDgLMSW1GI4i5U
         MoxL35BwEhyrwuDo79OZZGRxPxUYKHG3Ue3jBh3CTEXfnfQDZ8aYxirLwJiELl8olJpF
         7bF4UovhHBe7ypFRgZ6gpf6vOKKLsOGAEWYu91/VSBhsAo48SRNQfPeviAxv3cBiX+z9
         MQp34jwrnKiLwp0c5mz0k3im1JlibFs3ZRJxtc5/q2H6dKtUrutWo3Oyj1js3Timuxn7
         GsB+8c35K5ZJXm7+NzyFIoP3mB4ePg3+ULQoSNWx1sbDhHJzIaSTrvbVOeCJlJfzCoAq
         o7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193570; x=1754798370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqxoGMNKs0zT3PFEOQHIVmiXhAzu6aMNCZrDaU5Xy48=;
        b=Y/dS4r2bUPRRRkz0lnVdIEUUTuj0WweS5MF1vVL1yL3UQYgApSpsXKkjvBJ1bO72XZ
         ZYNMtn2IzObXyLOz+5duUWTONi5sDytRFPHoTo/lzi9ke0qLwqTsi4C8K/r+OK+sW+Tl
         YCGTbW/Xsce3xORvbtFsPXCt6ELXkrBseY0IF5Ypzjuuy3m/lN10tET0DYkfX33uNCUM
         aZSE7XFeuqmRrpe9LYImpvMKH/rLh8OJ54tkK/N5FS5oDOhoSB04aEZgNAJut4GtEBJL
         UgxcWD5dkmsk6QKVxFx3udUU9fQlfpzoydnPSbiYu4B4W/KHEbsHGVobI7wjW3eKC5Xv
         sVvA==
X-Forwarded-Encrypted: i=1; AJvYcCXWNCp8R2DWZb508jiKwpHX7WqHixlKQze3eU7VmW7SQBmvcR+AeRaPGHqIy9ey632i1kYKtOhmX098RlIg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz90tEszoyVmzZfF/nXXdrNXn4v42IgTjeb0xA4sxlo6RX1h2Av
	BCoy2cq52C0Ks79kHrtLOX0IiaRLZlit8Q583V0YiltLPWOnjUd+u+np7Er2w3vMk/Y=
X-Gm-Gg: ASbGncse8jt/+RhVFa9yzHXEwNohqduMvx0n+89qjqX+5pSLL3whd2fY/LTNHSZ8tiE
	DNl1YGi0opSqcvou3XmxzzxdgX919LwinwSM7XisCRogQCRyZya0XqBiAnhZlsdmmo8pY2Jv5cr
	qsHR33Q7skJ9lI5Nzx50IwjeNfTfZGi7P0LHTOFql5bpoq7SI6XloATQ8tdjr9B2jW5sGMMmHAa
	yQmh2U/Hr2H1QGlKkmxZkoEdWWpwJyz0Q+BkD16fN2Yv7HjnLL63E2Xe1rbHQ3YIDnAnHsnXoGy
	FK/zFuHvKSWzv3qzB4TBZ4hx9Teot/GYgLY14onf3oD7fHStMNcE3XzaUzAqDlWEQK66wpEzwjx
	6ipWfZ+S7SqAebm9yUmzKTKOphRYx4QVJ/aNW6/TzLo3AGGXz7//TsMckaarsr1TAN8IGIRe+r8
	6LLA==
X-Google-Smtp-Source: AGHT+IHsfQJoD6SRNz26VMT+qJigHz89jvyvI66oHmBULdJ7IaJZxTqFyxCoP7GQo4VUZTT9hDwD9w==
X-Received: by 2002:a05:6e02:370d:b0:3e2:8e44:8240 with SMTP id e9e14a558f8ab-3e416345ab5mr91990955ab.11.1754193570153;
        Sat, 02 Aug 2025 20:59:30 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:29 -0700 (PDT)
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
Subject: [PATCH v4 38/58] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Sat,  2 Aug 2025 21:57:56 -0600
Message-ID: <20250803035816.603405-39-jim.cromie@gmail.com>
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
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 37746dd619fd8..2dc0e2c06e09f 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
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
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
-- 
2.50.1


