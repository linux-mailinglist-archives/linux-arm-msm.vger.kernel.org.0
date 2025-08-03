Return-Path: <linux-arm-msm+bounces-67558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D08FB19282
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4CB51724F7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDA5289E16;
	Sun,  3 Aug 2025 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPDbI14n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1559242D94;
	Sun,  3 Aug 2025 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193579; cv=none; b=HkEYG3NnbFFpc8r+f7rZ8XU37mW3S6wlebXmxMgYsquNncitwMayJj0Pi+IORkI0FNY0VXtgPvB37gg3sXWE3uofwHuBdM6ywekbxcWQGfRSXyv/zcexEhy5Ea1Rrak1l/JE9E75uCXGSvjYytejlwJgeT31M3viq4a4v9aGh+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193579; c=relaxed/simple;
	bh=w+FJv13AQ8WVCA5XNpRXQKjYjlEJCePVP8Zmp1IYLa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GR9Aw0Xp/WHRbRpLRSJhy/UNR/vQHHC0N9URkqVzkah93cw3CKJLi2TmEf553s1yVIa38gQYNIO85XgIpJ4dVC/oqLHjt1YqWxsRNiY8QnMxVUsYYkow/FPydvs/HF0+TCFrtlN9zwXFgc4iQoxaOflDghVZP5DfUjuU9NoxtIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPDbI14n; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3e3e926fdeaso12249835ab.1;
        Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193575; x=1754798375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl5QPlbYy//3A+9v3q0806p6kCi+/AVd1aBX/P0nslw=;
        b=DPDbI14nWIGBXdS8dECd1sRq7Ub9uZA2r22/zpDVsK1FdUet6zaG/t7pzwcne7CHtX
         ldxrREttlJdTU9vhZSDYjzx7YRbWqr4JpYEJI16lcDWyoSMkTVhZ2nCFyk4xQFrfJpg2
         omxGo01WMmn1BgUbar4vVVGh8sijbW/AusQkaJgAfLc9+dADua7LHlTiKlcEJ8hc7ODP
         PsLWqeuBEA3r8iwYMItkPxBDQBeQ+tHWe1fuwUfgnYoe1Dx8vaUzanwYEdruKBwOHUu7
         /0sOnsug1d+xyCtuW2i4i9gp4nvC8BUFg1Ptnb4Rf86cBF1Mtuqx8Aolz/XKh1yekAd9
         IEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193575; x=1754798375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zl5QPlbYy//3A+9v3q0806p6kCi+/AVd1aBX/P0nslw=;
        b=LXOFBbPEFTNHul7p30XABkQ+Hp3ZvOM+7pTHE5U30ParuQ2VcGfQmysfWf7xA4OFDM
         ALZoi+gwBtvN2IbNYvqJHqw3GAZvpb1zwub/cjEC9k4Ob9r7RYKwBcaS8kdfb3znK30R
         mzV0zYhHFzkV022ug9NUuoJLnoSBgBmpdx5F/u8hLrWuJ8NEnWiU6TsUP2u0Q8BeUVOS
         s6cd8lrRLSoMG8IArhTJyze7Vk85Axl4roDzjW5NV4TBGosA4T89z5xk9JXlSUzL5Ebl
         gA/ywjcm9ZVOctvUVqJcks87xXva/qfVCQPrxB3oJxE1aeMS/TMkkOWUHqiSubibY6mB
         uhzA==
X-Forwarded-Encrypted: i=1; AJvYcCUjox9nnIz3vjqblnKbBMc5FFautNub3IDm4ZJQ7dyGxARjPv1N3lFG+erKnIk1v/PaeEAQBOLLlUykb3Rj@vger.kernel.org
X-Gm-Message-State: AOJu0YyScxfsJdAdfqlxlCes4vLUb3fRrOYI+3h+ur9tkIRXUaJfXPXX
	MLxNZ/Jk3JRBQBbWjyhB5FYtEiM847Wwwe3LmNqgceRAOORXukjBnstqujzQ9DgU5KQ=
X-Gm-Gg: ASbGncvYEuPhyyS/kAW5jTqZl8qE44y9g/o+r/3ow3dAhZWfWyO33T+1O7FU650QGbo
	TMgxlcVVsX/qaTQqcbmswwhDZaYuIYIS/kLFuGpSQ1D7629ibiBgHnUYejhEO72tK8Otj/cDUQ9
	4xJi4lbtXx4Ld7SPLXSiUwCooILKpNHCrcMaKE3oE/2OTrNpjKzyFznkaZk6qileaysmT3VWckV
	No6wHSOjbNRlaenm6c/jqfx7rVVaW32xlIperz/3tiM5xs14JOereUzQbdWuxuUl38rnlk6aGpR
	WoxVSwpnsTPfMOSsM3DAsKe9zmYxqJc+aoVzUsXnBbAZfkV+pafcIKxD9Spp/O7hk3JAkFAisbu
	DWFu/uAhQkEeH433bXZYnMvNFRINHu0hr+X+ZD6hR6nctZjigeyBFHX6cEuuLTKxdT3h0qYNGew
	YgKQ==
X-Google-Smtp-Source: AGHT+IESuEDr8QZLisykL64g4ba83tdiLk29yQO3uqavO7uuyBzNgS6eJTj2v9K17Lorh8odwbLS3g==
X-Received: by 2002:a92:cb86:0:b0:3e2:9f1e:e291 with SMTP id e9e14a558f8ab-3e4161cec37mr78734765ab.21.1754193575462;
        Sat, 02 Aug 2025 20:59:35 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:35 -0700 (PDT)
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
Subject: [PATCH v4 42/58] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Sat,  2 Aug 2025 21:58:00 -0600
Message-ID: <20250803035816.603405-43-jim.cromie@gmail.com>
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe has
drm.debug callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 31f688e953d7b..52ccc4701e067 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.50.1


