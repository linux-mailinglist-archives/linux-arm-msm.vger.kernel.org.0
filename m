Return-Path: <linux-arm-msm+bounces-67560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E2B19289
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F5D3A9BD2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E33F289E3C;
	Sun,  3 Aug 2025 03:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3jKSm2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF527F01B;
	Sun,  3 Aug 2025 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193580; cv=none; b=pJWvCPXaYVQ/LclY88tNovq5lKDwIftN/nnTNjZIK2P3+a4N8qBzi/3FFnFy3B+NdFX/sJLbqJsOws/0HlkuXW+9IeQbo1HdYjX9bNOst4a3PnbDrGABPs50449Cx6yZV8RdtXxSVZbE7VEzGMU/NmnrHFZaA42c6uYyFBcb74c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193580; c=relaxed/simple;
	bh=f5PrK47FlRKJOakqtnmBs6fL1o35KvAR1TWlTg7EMWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ToVZNks292adZ2Ya+G/l+NPR/f1+pqw1QfIdbyUzFlFfu077YwANBVDdzv6nSFraBhwZLqQ0pvNf8ug1qzPA1pw3znhtZ/1lsiT2mmtE8tXgpuvFayAcp91RwSyhQUQM0QJNlFRRue3wnGHIV4cmgahuM+AU58SSzhkvH5tEHsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3jKSm2s; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e40ac40940so12344455ab.0;
        Sat, 02 Aug 2025 20:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193578; x=1754798378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD1c9lgMbY1eaVT6v6ivEZXAlodIcOc1Rh1pqLxYHFs=;
        b=V3jKSm2symfhc+BaypY7sT9Pz33Ux7KKyifc40PHSJBfg7w5tvfO+KMDiJnsbkQiSV
         6c+auDCQfVVy8IVWcmrhpoWeJr8auElcRCOcLFCHEMqp1P6BDbtKOalko/KnzszXELAt
         McXirSBX/nyU92TeBatk+qiaqaw+7HzFXmuOzc+K7cJdctbpqcc4aaKcXpYUpKJZa23O
         lKMzJhGLXaO+0Le6Kbb9h+XxO/im02YoHh9im01NjgK8PE23qVopL+3cJ147BEqFLHhr
         5+egKm6HXou/+nOJbAbbrPzpEAzDtduqgGmlcaorOSgZ/SFLLdZ+DSFeXbVEYMehKz/O
         FUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193578; x=1754798378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YD1c9lgMbY1eaVT6v6ivEZXAlodIcOc1Rh1pqLxYHFs=;
        b=bDgl6GjGEZyo5TQ3rkjjUDB2T56sjqp0G4Y5ByI0py8ZbbluyOnkUBY0LZ9H0jgm94
         WJ9D5XvW4Sjg2JE8nFft7Lge59aMbBO7Iy2D39wjc3q8YKscVqj1QQ85GMkUTnq2auxL
         M71du3FqCtI2UEDO1B150zVzbpp/QWlKJUcP1rvYdnNx7N/4nf+O6IefpuN7B9vulVXo
         7DTMIcIzlr3s2p+2/d1ZbSykl3WVzDwjAoqE7s2PN3Xps53zdfOkO2YAgJpItWVGg7gZ
         kZy4Z4dvi7KNl/Jbi6uNk6UNFyRYV+bNZUGkYZ3UfWX07Ksobss8GIgtuK3N39P6xPsX
         mkIA==
X-Forwarded-Encrypted: i=1; AJvYcCWHwD8wOGpK6BsyHPZ0HKUpB8DaR3nFiybqfgXfceCz6+LLSVK700W367sphQAOsKIcEfGZJZWqd3kLuyer@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu2GTeii203/iINDOJMhukkRaTWxJhN9DqoLbIbMX46mM+aj9p
	Xrae8gyYnxvoBa6rEH9buEyQ9flcdilg0xr11uE7mKxSpLEBVlMMjYT+KUjLJeoAO1Y=
X-Gm-Gg: ASbGnctTbuUj42W1ud/dTRoA+TeIShDcRqnZBXxeg3pp94J9D/OavRHafTPcgT6j/8c
	BeWpPbKaZWD6DP4nm31/8F91Y70yBJRoSzP3k/0PmIMrSqmmRrVIcMcO2t1F4dCbykh9gRGz8Wf
	ZfZJkk9Mco1dVPLTOXPxACyQ8vsZCi1w8lX3Bw4RT+FjTRchrqR0tjG8AwEvlYTk9/8igEftUET
	9VKm54Slihsfm8YGZJial+iYFmbgnlPkN0BABL5I87ymXc9NW9phnpuKW3RRZMDCWbIF7BFPl5v
	uDvMpaYLrcyiaOWOSJ67tx3/LACc+gmjjGot1ZvId4u/0o4iJATvw1qv7MEWN2PztKsULcM5J3Z
	91ksAbIWAtqxqFDBmgLoWFrURGcuHYs9lmEOLs3IH6qzqjgSAGvOYX1HRDytWwqMrAJwC2SA1lP
	ERwl5gF33bfqky
X-Google-Smtp-Source: AGHT+IEjmtrpy7aLLw6jvxFkKmow/fhVsLi167CpcWmTeMCa0QQeXgukw0jkAUEoPTovODFGo/PAgg==
X-Received: by 2002:a05:6e02:4403:20b0:3e4:64e:4fce with SMTP id e9e14a558f8ab-3e4064e55d9mr146712775ab.8.1754193578031;
        Sat, 02 Aug 2025 20:59:38 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:37 -0700 (PDT)
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
Subject: [PATCH v4 44/58] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Sat,  2 Aug 2025 21:58:02 -0600
Message-ID: <20250803035816.603405-45-jim.cromie@gmail.com>
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

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330def..3562d6dacdc9c 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -34,6 +34,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.50.1


