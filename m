Return-Path: <linux-arm-msm+bounces-67549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA13B19271
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1412188432F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EC92882AD;
	Sun,  3 Aug 2025 03:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKs2lu2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F12286436;
	Sun,  3 Aug 2025 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193565; cv=none; b=cdkfwVQtRlRryv3SP1Zbs4aWiWG6OcpxOFuL0i5vphHSmx8vhqcAhieSNq+wXmLNyxEUlQsBn+0W2tFSBeK8cd31itlq/VwT4JuiNqCne1S5WTgk+x+dyMNyqeAI6hhc/ZiHrUGDu2yOBHWq9+Ckx6cZmWTNnucGszOnTiduVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193565; c=relaxed/simple;
	bh=Qf0BV9EMCsNaV3/y85/Yi6kzzZVn/+XS79as0FRxtxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8Q/SxNSTtBuYhjlRuYdPHb+0owL+XmJNWwzyORTWQyrpNHzKhLzce9XmCvEaOSeJDNyZ03nw9a4M6qBdGV40yazGZuPQQyorZl34tbTpV1tA05sJ+trVBzD3eULFbVK2BFM7d385+gUtl5Ji5uL0RYFgCrDeAzpufqWKWwLG0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKs2lu2l; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e3f152700fso12488315ab.0;
        Sat, 02 Aug 2025 20:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193563; x=1754798363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9PcjPUjmFrLewSvRSEJPDWXh0n51inHqjt5GPCorNY=;
        b=IKs2lu2l36xU9rpb20z5oJ/GGWva7dnRR7UsDk8xXzyNcs6pxDRulwxLBo2O8MdxBz
         NHVz3c3HIeKc+fN71/W0ExnLn44aWWaTBIiYqIg2TpHN1mP14AOk3V7C80UIHv439db1
         JleLF8BkbiUURxPFds3La4Sol6fzT0k1TT5sdL03CebFva9o2SDmpUIphogpnjKqc4zb
         LNpCg61dk+EvSszhlz+xf447hG5dSkQKQvoJ5hgO7JEPipvLwvOSQbnQxWrMMMKOx/D/
         qgRsYJov5r5KOO/pTFeJLUBPCnjmdmSrxLsTs0bVmcbi8ym0HOIyHS3BhMpGX5T6asWK
         V8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193563; x=1754798363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9PcjPUjmFrLewSvRSEJPDWXh0n51inHqjt5GPCorNY=;
        b=AbP2geI/5e2d0NzbfnVfAuR40OE+mE+epEXwiPHxDzF4iDmshef76ejmMou2kfY9cX
         S5ybhwKcpIpktF2onWV67Oq3Zo/QYZVb+9zDcSvfG4bw7Ty6eoEAfvIQtsa8QWMzm8NP
         2SgDXlQaILB9JuDqCxuX8oSkYdC9ebJxNcriCHu/sfiFcqqG52/AXHrcjHp+7bdsahq1
         PT4muIgmPhaXYXHCKkS4yGjIWh+4GlaYbAmLbJU6dXzWDXT9gToiPww1oGCTlQhwCatk
         z564Ka0UoUAE+6FBAFq9cgMV8jLec6UQoqOGmindKhXF6iibK3pqWS+DUhi1Ah5CV+Ef
         /aDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlHme+bS0AbmFPaijYcRt8juHH2Up6P5HgBniqwu/bYJfgmF5A2Zyj+9X1lcVOgHs0OomcNHA+bm6C+Uzl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+1zxQelM4JBMRjv3xQrPkcoATcJkcJoAUD246NnJQSAek2/u
	xuw60jpDPrQlLAR3x/amgDKu5gAdPJpsfuLldamF5IQ+TM0YH16fumFg3PDevdem4JI=
X-Gm-Gg: ASbGncvGEIfKsPMCdZO8MW5xaIFBYaKuvZQvnwHJuJulW9HvTrRkoCEG/z+b3FjcVP8
	T0/xKnd30XJN+GkmNBqlbzzmoqnBIT+a+Hw4dtNp9cSuLDVXPInwVMAblZWAM1ghJljkWiECWz6
	vw9tHC+QSwzpTW8Qyk/RFS0UBjjN1D6WefosfQLW6zCQUBOZwd1bYEe4AOZpN9jLNboXiBQ4fN5
	hJ9LOFC3fWXlibs2uAZzafPAlUGWiYuHG5wLMUi+25X+htrlgW1FyUH6iGvdkirV1nlTaVp6IER
	kcYQQMlLTzXdU74lMlIJmdDH0UOQ7lUM9A0aIzhE1w6i1oz/cJpSUVZEXw2fSRMamxP70j7s2UY
	p2g1FprvDpQVMU36N4AlIF8zpCCOQS+d5u14dg6tee8jGKGpP81tATFzgh7E0dwzJA5i+AS8se0
	csTg==
X-Google-Smtp-Source: AGHT+IGHik12b+NzuHXdXH1TPCs7I43pZRfGChkNXR0L9WcmFgFx3EM2Cq+84hECD9IhAilvjxg83w==
X-Received: by 2002:a05:6e02:1f85:b0:3e3:e78e:4e0a with SMTP id e9e14a558f8ab-3e41610d65cmr100228055ab.1.1754193563265;
        Sat, 02 Aug 2025 20:59:23 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:22 -0700 (PDT)
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
Subject: [PATCH v4 33/58] drm: use correct ccflags-y spelling
Date: Sat,  2 Aug 2025 21:57:51 -0600
Message-ID: <20250803035816.603405-34-jim.cromie@gmail.com>
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

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which disabled dynamic-debug in modules built with:

CONFIG_DYNAMIC_DEBUG=n		# 1
CONFIG_DYNAMIC_DEBUG_CORE=y	# 2
CONFIG_DRM_USE_DYNAMIC_DEBUG=y	# 3

NB: this adds the flag (when 3) more often than strictly needed;
modules built with CONFIG_DYNAMIC_DEBUG=y (!1) don't need the flag.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5050ac32bba26..96b57b34bc505 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-- 
2.50.1


