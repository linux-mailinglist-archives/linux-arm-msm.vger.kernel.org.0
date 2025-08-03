Return-Path: <linux-arm-msm+bounces-67562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 935C5B1928D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98AD318929B0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC0C28A3ED;
	Sun,  3 Aug 2025 03:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foK5zyFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A9428A40A;
	Sun,  3 Aug 2025 03:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193583; cv=none; b=B4WWthXFdwoXmcJDoi6uF1biwG8Flpe9JlP2vJLeh79HyzKqQElDPdZVZrqLshMwlDLNbd1KnEgb3S+j58ytDsPFmkOyZQx+2MWaZTNlI/DYgxdbRQlZC/+An/TJJkk7MulBepyjLXlhGtUQ0N0kw/XDiFUxRLLJ8hKfIaE6kbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193583; c=relaxed/simple;
	bh=9AWLyFTN5wRl5J8KrLPnw4Ehn79E3O0jf/C+O+lJ6GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBSVAzzTOf3v8ZB695Z94/lrng4BZ/a3BpOmXgy/u3MAxDxZzm4b01Umeqj1z8TRmWuvW9K80b6eaMnHDezuj/UVTde32UZ6xJeHeZdqtAeqZGnvxFe8PLCOwWjIJDPgEFEFowZdY94pMBMStP059+kXuIO1o/czoAQUvPVaNPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foK5zyFS; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3e3e4c564ffso20216205ab.2;
        Sat, 02 Aug 2025 20:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193581; x=1754798381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2dm3Is+hmVrCyHRXfMeY87/RIu8WM4w64xIqHyRgwI=;
        b=foK5zyFSo+Nl77bFr/oyG3a6pT4ojz2U4FtVR6F1MFT7hb3dQojqpvkB1XsliECC6h
         hkTqB7WCFw2H4JxhZfxBFTV26ozNhCEiy6uqTsyAsUaNAvpk6Cwl7G7eWMav3nbL2BzQ
         Gw3Qp1PN9tkEBpgOKggpJXh7BkntfhMgOdGaDGlGJS4+k60wBsGZ2J5Fq6qDHk8yyeHP
         s0ouf0LCQF+KLAT4Sk2uxq6IEt0qbrmZD7Pwas1/69P9DNzenyuvjBABB78vtCUkseSj
         m/SAS3OYMBP3wpYAUawzokKCn/OxfogpZEbuhjvyj9/HvASq7rx78XUCdjVh0U83CGQt
         ZaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193581; x=1754798381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2dm3Is+hmVrCyHRXfMeY87/RIu8WM4w64xIqHyRgwI=;
        b=jWio9c6wfRG0qz/MjIJcN9Bvte6voKAoQpZwnjqALNnI44WOkwNXyk6OYjqsrwzvAR
         isNzyZKh76qcQ8NHRA5JA51QDjkyE2drI9Lu5rRsFCd4Dcs2sWHlhRNDpHdLHASRMl8/
         CbLjx4zcubOVk2o1nGjoKX6rrf21CxMyuHmMyRb0VH+HPsHAgtrJXZ895OJQzmlOB2Nt
         QSMO3RwCsnYaoAqycudMccb0ovTavVlixufxeyfGzkeeapfY1oai7NbRhVWPPm8UXgkH
         I7RU3AEC9gp9O6BZUfh2iJpFO25oMaZt6q0d5XK7NU9eCUn4R2IOnRKy3nJHRj8921Zv
         ZPkg==
X-Forwarded-Encrypted: i=1; AJvYcCVCryu9A+9tMeP2PF7K0gdb9om2jlwXyCmEDZ3t8clPhpkYYhJjlDxN2e7j0brv5E9bAOynC5EeEFEfacKu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hi86QmZx+DtuZ6hrWcEiB39BXYKRDoWCerX3SE67Z6bk8x7B
	W5r+PQ3KbqvEzj/a0mRYWEeua450q3UYtzoZT5B4P7xfUWsGklHTUjV5u9hPkq7u49s=
X-Gm-Gg: ASbGncuYFk4/AFqkd4ZDTBwtmwQWbh8DW7LHSuK0YuKFgk5awejTsptghRhLO4fApEH
	lHa5bi2Ahc2DV7KSq9q0nMHLFaTTlm07yI0ZaQFLGCIkxcoRMRDwuoyTGdf7N/jHdqshSOkio+U
	rgTnu9BF+ia8OiySCUV41hlR8/CWoie8xHkT1QZBp42lSXFWYwIUbGgJShUlmL7zGgb5d4cbqq5
	dbZ1JYVm+EP4UQcdKGP8P0f8zMqjfDDB337wnOdKVaLt0VAsdUOgh44ScWr9So/flbpKiknpRE0
	DflFBZBhLYzc7nA0Ny2jRGqwpi0rX74BicR0lVDMlg3Nnnsq83yQNdn5+FC4GlGFGxWVsg0WzXM
	blWGD2c7H0leFNEDq48650V6plMAtfpjuT8ixzOCe74lt6UjldJGi4GCAoeOh70pGgxLId6/NQI
	qQDA==
X-Google-Smtp-Source: AGHT+IHicophLwIo0f3Ezs0eOmSQt7ySKYvJ63NCgmDZPmmfZpDGy7DzzpgME8ux0Ifq1iE3S3f0yQ==
X-Received: by 2002:a05:6e02:17cd:b0:3e3:d197:b567 with SMTP id e9e14a558f8ab-3e416117005mr96473805ab.9.1754193580921;
        Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
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
Subject: [PATCH v4 46/58] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Sat,  2 Aug 2025 21:58:04 -0600
Message-ID: <20250803035816.603405-47-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed3393..70759b7d338f9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.50.1


