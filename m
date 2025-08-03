Return-Path: <linux-arm-msm+bounces-67571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A00B1929F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B28D3B8A28
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AE328C03E;
	Sun,  3 Aug 2025 03:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZw/xYTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3828C01F;
	Sun,  3 Aug 2025 03:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193595; cv=none; b=l8DteIyn7NaZEBqtPFWRRQWRWm0C3vZK7EPupAxeD/VwdpjihO5/YZgj7hRtDtRdGuL+8dY8FeeQRG83tFPwai6R4ecnSh9qE/cLMClRDedt8nlXiBfRn4c6c7voOFIbEQQWwNwbWlqw+QkZC/wgJBWdf11qmlLe8k7DbmqDTrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193595; c=relaxed/simple;
	bh=ioVw2SWj/SFT6Sjv5QNeS4VxrtX4X80veAJphsEyrp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oF0FQv8kVrkoQ8hEO0pR3xU/Yo6R71C9pXnaTJBAd+df1Hr2YUDCDFkG4EMdPoWRCHTCZxHE9m+t+QjFkDpDMRMw/tSTImC8IeZQxGIbPC8L4zQhsdYBRhXblwKba1UTTwWpcAPIz04UZkfpo6/KCa3tqxevmfycjCItNCLXpGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZw/xYTV; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3e3f0287842so27597745ab.3;
        Sat, 02 Aug 2025 20:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193593; x=1754798393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXiCwepwhznbX1KBNscjXPO4baEWE9aXjHhFme2k8Rc=;
        b=gZw/xYTVye88FLAP+orR10LTp4EVuVoJ92bp9ytZuCSITl1VArtUxJlSl7QJtE7ttY
         H20uKlYybx5iI9+IVTsIdqDE2Zg1LNvV+H7fR3tUZ1Svv+HUWKpMC4aoceHJMFtdbr/y
         uYdyxCNr/GwOIwMzViG2Qm3vhoBRGyM7AdYA9zt0BXxbVe6vYKs3us/errBl0uX54Z17
         8jMVofHOTP+ZEk/ycZDnrEmY3bhqVJAYmCv4xkb1E5QbAorE8jOG/3rI+3cZOq8Hmq9t
         elehLaxFhcDLeg1U/8TWf8bLUPDrpqBX0xM+XatmR+AsoyI31lCXug8Vuq+hHOu9Xvzs
         y9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193593; x=1754798393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXiCwepwhznbX1KBNscjXPO4baEWE9aXjHhFme2k8Rc=;
        b=KW4mquxlawrWbVk3fB0FoHtTfeLKte+TiRHgULfGltdy7JpDM24akjhRk/S0wv1j5H
         I98DSFV/xaD36RfB7F0/FvsEh3fUyqCwYMsQT4sp+JV+jEfb38QZgt937hSkHRLHxLEa
         YaLTl5npBhxTTjLQ05VXtmcBiFbqa71xnWtvWoXyFFkCc/NmbYNWdU1LvlwJABvQL23e
         CEjrer8wbCThWVZ9ryAVe6V+7lqJvum/rJSONezHOZLeVxHsXAM9PajlQl02ldEPRDrp
         jT10hVxcNQ3Olxe/bU9oBW1eR8YuVT+SXcrM1WHv9F1D4PXJuukovWLdNDYL3Enw8H9+
         ToBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeEwx2KxvGcoTXl+GvnFKkvO/S8lGS4z5E360V0ZyMnp/Apity8oBzklUAbWJf3RC7pouX38bMsq/27Njr@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQdCbRQ4HAGGbnGfqN/3jieO0dxtxVLMCXmJvbgEz/86qYgNq
	XV5SFAamKxMUZgEROZoMXmv2ZyQLFwYJP/kHc5rCnL0CCh6mlL5m9/P5VFWMx0lU0/o=
X-Gm-Gg: ASbGncsR9KZIfpPrQEb0fkbrAKlm26Mv9jTRvCcz8gMMcZSehc8SLn8SIRHTHpjHPmc
	F56wLCh+77KU6kwgmDN0Kh0St2ZYR094AKbkLClX02Wxrmh3AfbrKc4f8yKG0fXUzfrqVPn2We5
	b4zRRifxiCcJfBEOSa7x96NyonJ1CWQtBRhkVxis+FIGL9Z62Qruc1HDYm7XCE+ihCVyA5wXBcD
	6un8OnvpeOyMw1Y5XlkJsLBD+jcYB2MPmaKVLM6A3e1Eeuek2fAYiFXmwBw1xNwHkv/buYWUgdu
	RL4aIvIqUR2u4d99/B0KdiGN5WPq5nBxOyjiZSkjEC6GimtfitB4vrvn/mTvdMuZRqPQK787BYO
	RKuWFb7SR6XhtIcU03TT9QxaOaOd6iL4/lf+fxuZTR8LJFiDXMlzfYWRl0HdigY+IyVktYDnt4v
	Awag==
X-Google-Smtp-Source: AGHT+IFRhlTHb2lQE4L0miOq7NLbPvlGhLYYpHWAVoxzVxg4lJp/ceeEQ8khoVmbBOpRBlSLgtRD3g==
X-Received: by 2002:a05:6e02:1689:b0:3e3:ef79:5a8a with SMTP id e9e14a558f8ab-3e41617efe3mr89164355ab.12.1754193592938;
        Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
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
Subject: [PATCH v4 55/58] drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
Date: Sat,  2 Aug 2025 21:58:13 -0600
Message-ID: <20250803035816.603405-56-jim.cromie@gmail.com>
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a5dbee6974ab6..95ff79abbcffc 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.50.1


