Return-Path: <linux-arm-msm+bounces-67568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE20B19296
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D650C188FA0D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D4C28BA9A;
	Sun,  3 Aug 2025 03:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC+OgfMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D121386DA;
	Sun,  3 Aug 2025 03:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193591; cv=none; b=RBWakY1xxe6hcVRzUJO/0QjLOFh7R7JM4WIiWaZ2hmeoZqE7WVPInRjG6+fnIUHyk6l8VZNJAPr+8FK0J7T4eYAHfv2WJ9GhNGPtFgzYHxIBckwnV/nRbaRI3F2ij83zKyuBUQPq421tVrBMcAeHH9luguiDCVrqpUm0Vg233SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193591; c=relaxed/simple;
	bh=bhn3w/EhtRuNYTr1IXJXYIE620PvvuGY4Dj4Dvx4+hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtcOw2koDsB26xXWweDQ8lwa8NnEHXn5trDf/hvThqw2iDkJay2RV5xVC2dfvk5xf0dM1sz1F0np+gWQZKvVl6ER+Hxs54YUELvyjmhPmbNJPm7Yx5d93pT4cF9wK6uWdajMBdT7Ndcr6m1hAcnlzwnvH4esLWvcHDmzsT7GCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC+OgfMC; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3e3faafe30fso25242435ab.0;
        Sat, 02 Aug 2025 20:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193589; x=1754798389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UXktWfyU/nC8G5w+/5cLAwZreh7IMfsApWH9fi/o5I=;
        b=FC+OgfMCbV7LSsuol8IGkaw8Cd6g0Vj5rQHeomGZjT/Z8bZco/Fe6lvED4+D2mbhhB
         cz7vXNDQWuPh8845qMXWYpFCdNSFW0FlYYX1kCHsIqiU0SnGuYLbTl4XwIZAgCtPcLqn
         5RQJl67xjEhxMVfiNJ/FsCYgVX3+xt4KB3JDFdsfii5jQB5clPOL5THc4Upht5hE6Pyc
         Khe7MbSveHaMtKMTXdgD0kPDcANCy6IzIlfl85d78/MvnP460LU7vbquWJw0z2I46XCY
         DYzAToVtaPJIpM4pLA/MrEwDdJ/iUB28rnd4DItyM5CJJmfJt5pyLBcHsmT9OvaeJBzt
         Q5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193589; x=1754798389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UXktWfyU/nC8G5w+/5cLAwZreh7IMfsApWH9fi/o5I=;
        b=HSXpDrrmGtT32u4Kt8jsQknXjBxI3Ngau4Zz/tFPLn2p1yiB06wBi9ePpxCKg2p79L
         a2aZ5h24a/XkCAiDBD/bbHr4syDAuMkNRrfdikPZvKdeJrj5n8amZdMa02yr7KOpvGoG
         PkSKD2Ju18ERtb2U/ME711s9+wm53mWQMf6eR5T60WmiTKaXaHtq4eV3UonIQr/lRZG/
         R0O8DjlbPsIfSpbngWRsqmMjefypjjR0r36o3BBKpiWugwcV7tMR9QLz+CgvfTBcLX8t
         fZUnYockrD6nYLxmPf866crnth0dVBR6dlNWZkoAaxZzCah2+LuQpnWZxYnZgLoknmA2
         HQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCXD6ONM0X5tZ9Z+TSUEkR6cKOg91opimbNt/oMdtxocyU1a4rUadfCOHiHiJUTMQFeRNLLEbbwowdI5Tews@vger.kernel.org
X-Gm-Message-State: AOJu0YypR2p8MuBp12VcIxuG8YvZeqwpuzkq61CqfE1Rn7FfsWMmQmlM
	4zpmUDlT2XLeOshpKLQ+HIe0EvAl+yILY9f5PGcFGGsOcGdeo/U58mWZR8tc3NPOmgc=
X-Gm-Gg: ASbGncskCabfpXqXk6qnN0lGnFvWuQrzbf0qTBebKWQo0Slaky7liUAogwPF/qGpP3l
	ZKU+Vv0nBHaM/Go1V1EuYTxUm2opL62ZAmpmco4KcEBCONAUKu0NyUiP1+Kyy1t3NCXxgtjJvu/
	k63W4ybjbxdv5stYZG7I5jPeC/vNmyu3q0dkUpwS8PtmBx0F+RlinQI2xIn+gjdeTQHMRFg3Fya
	gLDWC8RtZNvvS86e3ZAl7hmKHM9rue5dVYr+x7mU4VbbUHOgH/+n/hvHnErXpqI4kVkQlmsW9vq
	S5aFbmPiI+GemoB6kEczZfqZEFbDEBWXHMNBM4v50SzsYuNxj9etTtkLByv2PPV127PpNCsJIyo
	LbQWsNEc0zYQAvJ7YioDB2fhowZxBRfYu6ON+H2/ieyWBQL/KkDmbtyvKhLm4ybCbK1QaYIVJ2m
	UktQ==
X-Google-Smtp-Source: AGHT+IHgubDEoBo5SwwKlV7BEp7xGRXkCfl1MA6t15Y/tj05GEqe4gbfRTAzanGZnInCRSiMQrumQQ==
X-Received: by 2002:a05:6e02:2164:b0:3e3:d1ef:83f9 with SMTP id e9e14a558f8ab-3e416116d3fmr99926145ab.6.1754193589138;
        Sat, 02 Aug 2025 20:59:49 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:48 -0700 (PDT)
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
Subject: [PATCH v4 52/58] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Sat,  2 Aug 2025 21:58:10 -0600
Message-ID: <20250803035816.603405-53-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 32cd8ac018c08..f0b5b57646727 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -27,6 +27,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.50.1


