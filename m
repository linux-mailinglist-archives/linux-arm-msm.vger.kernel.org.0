Return-Path: <linux-arm-msm+bounces-67545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961AB19269
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 089A03A49CA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEF6287257;
	Sun,  3 Aug 2025 03:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg+pLkOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794FA286D6D;
	Sun,  3 Aug 2025 03:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193560; cv=none; b=EqbQggbrQ0yxEfhvHvA/9x+P1pk9EtDf00R4TE0cLxerPsb3J6oO8UKMD7w0ls7VDuSvXLxGgG67OWjfTPo5lv6NxBpBy7NHBe0O5l35L+GHCOdySY4ffcEhxUyDWdQ1SV2UqIUr/UfmziDgqTt8cNr7lm/pztCoRNERHf9D+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193560; c=relaxed/simple;
	bh=dhKK0siARiyhwFBf6trDPwkOh9NrU2YLkf8y0htXsW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJopWJruqLMokqZm25ymuj7n30zhbn93L/a7vdOJcJPLRbsRWxss7KPAV37f9ABgcluxKjMm7BxzJ9VPUEBDYM+BwzCBRQBQJXRfnnIDJaQqIgtLnQOoJD1Cw88FdpERGtVMry1ltCA5IQYK48vf35uKxtM/asRRSJG/wv/vCrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg+pLkOn; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3e40212e6ceso14462895ab.0;
        Sat, 02 Aug 2025 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193558; x=1754798358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2ReCJfEK5pKTcOheDemwRlm+fJVRguF1Peh0eFAuDY=;
        b=jg+pLkOnL3gUBPkatwb5crKONvQCy2BlXK88UDxxF9Gob+4LvE+ySTKsUii/BmEord
         UFGHRbmWfFtbmcvZa+LiteY/w+qrmlGejMBKjrO027e7z3rSi9b/NDXuFfLHMQv2q+pr
         q3LeXYUKTU/TXfUFL7Z+OTtnK6XJioa3XaR54LzqkAIcPrUJe0x8eLX0mSojJ15x/stR
         A5Ok+66YyRffdZIFBNGrkN2KcxUsQlQTirXiZo16CUSAI8K6D+rbwSIYvwf85EAsfvmp
         feR1D9dsrOmiYhsPrPSZ/LQW5xG75za6jD6DvpNV7fuEsHyA1QP9Jol28iI8i5fGcGR0
         yoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193558; x=1754798358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2ReCJfEK5pKTcOheDemwRlm+fJVRguF1Peh0eFAuDY=;
        b=nC3ogNOItzbTDXKyK/Pogj9vzkWptYkVggQx2QLJELSQc2vMW0J5qqXv9CjDTV1QHE
         fGfB1j0toUzpoS1NTy0zuUBLynKoDmM2OttayB23AGCJCDnFDC2KDheFqH7LARI6FLQN
         +i33Ju7rBxBhu5QMnlGucUtcCP/nvvsmOv4+kU4qtPE0CPYAfW+zPp1gyXKKvHEh96oD
         N4PDGjGWP809qz6+O9DMozGP1fZRyn+558ljLxgeb1jweMKqWqAWgLRDh3SRumGhuO0X
         1WE3YvV9hYY8iLYv5iet9DXkGeNGXORpPvifVfvVh4o7p27NHUElxXM8xBbs920aPP+3
         tq5g==
X-Forwarded-Encrypted: i=1; AJvYcCWIxlXAOGSMnDYi9BINmkfVDbuuuWt9fvS0axubd5561L67IDCrXwk+KV5hwP3I3+DpX+tjxpoKiJAjI3nr@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9gvmlArNF1UqgntpKB0sSrLL8fm1pNvRI2I4KFh+Ycdjip5Q
	wAaNWNmu5TSiaiMzhDZidA/0nVbfhEdfbuTP6e4Mj2JUEHFcAfs2erxfRILI/Nzi9A8=
X-Gm-Gg: ASbGnctOpRj01ZGkOWbmqdWxj2+ksjxo/CEVTVRqVCEujPfYXGIjngcbb1ZeTdIE0C0
	V2c8qzexwynjM8Id+xonppa2oeeuGbgm+3OyzJnSQaPE6E81hWrCjo1X1dybX7P6QOepKj4dVWY
	FmZOeGXI54tySFPeDrkoen9XmrkkFwnByZGlhwtQRzJA8KOjRTU/my7kcPeCdKN9zXl30QRt2/v
	O5IkH+3zkiSkSZBu172e/3jsTRLmCsC0dOeDdRIoqL9mRL1Czn/RpIT/aayAptNk0vkSC6OQ1xz
	ZMfzcnK8tXvOQ1VROl8I1mADWfx7YGAkTijgLiZlr1rK8xQYWshJkup7fVqmFD2AweCQvJRA7by
	bcywCnRJfAwT9Ok1JMRW24dbThGQG5VpepHG+5R4cyvvOS8NkjSxh3LwNWugLjgNorOK0M7QMEZ
	CS4Q==
X-Google-Smtp-Source: AGHT+IE2FO7VIZaFeVJY5KU2r630EjFzadS4s75s0S/BwhMpT2559l4J/Oty1dGX6agEpkO8lUIXsQ==
X-Received: by 2002:a05:6e02:3b82:b0:3e2:83aa:1375 with SMTP id e9e14a558f8ab-3e41615baf9mr95938835ab.14.1754193558557;
        Sat, 02 Aug 2025 20:59:18 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:18 -0700 (PDT)
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
Subject: [PATCH v4 30/58] dyndbg: reserve flag-bit _DPRINTK_FLAGS_PREFIX_CACHED
Date: Sat,  2 Aug 2025 21:57:48 -0600
Message-ID: <20250803035816.603405-31-jim.cromie@gmail.com>
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

Reserve a flag-bit to remember that a pr-debug callsite is/was:
- enabled, with +p
- wants a dynamic-prefix, with 1+ of module:function:sourcefile
- was previously called
- was thus saved in the prefix cache. NOT YET.

This allows (later) to cache part/all of the dynamic-prefix for each
pr_debug that gets called.

The cache contents must avoid the Thread-id (its not callsite), and
could avoid the line (to shrink the cache).  But then line needs %d
each time pr_debug is reached.

ATM, this is just the flag-bit reservation.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index bc26bc9128c1c..0f7476456614e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -38,6 +38,7 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
 #define _DPRINTK_FLAGS_INCL_TID		(1<<4)
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
+#define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
 #define _DPRINTK_FLAGS_INCL_ANY		\
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-- 
2.50.1


