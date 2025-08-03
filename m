Return-Path: <linux-arm-msm+bounces-67552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34614B19277
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39BD41899CDF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE82288C0D;
	Sun,  3 Aug 2025 03:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBZ036T6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E1527F4D0;
	Sun,  3 Aug 2025 03:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193570; cv=none; b=MYHYaKjFCeSUeTbNYTOMNYNxGDjttMvX+HzpbfVO11GBB57bUZwvM4673INHRH0T/WV7k+gUTg4XKBZ7V1AM2gXzviQiaOQdBhcVxNwHc+fIvwfnr/UX7VG2b/r516HUdZF1WTwTvR5WoRlbFW0W3Tu7LFhTbRjWNX+X3fmiMqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193570; c=relaxed/simple;
	bh=y6vnPmBDqUZHr/kSBjYUVpfgpIrykQHkP6w1C9mQCmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzQwO+zaREKTxVB0ChVTJJnnyyelK4Y9E06gx1bGxFXvvC1MuzOchlPcev8uZMaS4DLDVzhGAfm88NejcBAE2PwUhVjvGOt2oLKdXU/VKrEeofOQXwgZY99U3+eK5vgm9kVevol8x6c688mY4dc4fnboQr/TZW+rAP6drNbtE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBZ036T6; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3e40d006105so14219835ab.3;
        Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193567; x=1754798367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi5FRwOWbvP0Q9Jpmq/JvqKOu63Zljwrve6PAtUtdG8=;
        b=BBZ036T6PGB7fpehvNlUzoeIzG7URipiJZ4wCUQ9/p7Z1UBTOcH22KeKuiEw8xxBIK
         ZDAz8Wyqbs7osXKiuq1LY6piKrAXx2hwpNbCXmJvSxTqjPfHhcArXX305AXG2873EDo/
         5hBtOBqrjIOCZn1OGeYoG2T3vgdgIeSmGtMxerrtydYDjcX0r3snn+Gx0G9oJPR1lXLy
         GYyGUt9jAuDbebTstGQ9I0TVwTUn8vJMJxhWLMtvmNqQmtJexox206NncbBxLdDGnbDA
         KmMyw9ZwzBXdzP1kzsF7U6NhcCNU7Mq6qvRu7xkKKOwpHjhb45Zb16D7BCh8aN1wRgk3
         wdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193567; x=1754798367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi5FRwOWbvP0Q9Jpmq/JvqKOu63Zljwrve6PAtUtdG8=;
        b=ihBIdCorpuPXGEnWwglzE9KnvtyEBnDs9q8xSnWjCcOhud7ctbWx7BcEjfvYF7O7Aj
         aihpUbrTp+J/akjmo1zLsP2/ZeZpSWmPxT+m0p4ESmJwuKOTe4XwJiWTzsoBLXQyOXMl
         lokzUBSPbLztv5BNHhnzhbiu8SzEzOv1nbPqDZaxuws5JuBdLPQmQ85tnpoy/s4qD0Wz
         WfGIdIqyBIr7MwRzsRkGwdpZvz4m/sQcOKRsslvOlb0pMZ8ATbWcvyZbit0PAHB7Zic3
         l2D84IUDkFWepDfv3wYckXw6fetEMqnE9puyv8qd7kktcmp8RlHNCKnrbJ9CT9f5gIVt
         +LeA==
X-Forwarded-Encrypted: i=1; AJvYcCV/4Ot73duz2kCRzUHECNmQImBAynWYbut+LxvzMHPK7UGrHjoFUs+64iKNLWFa1N80rjQkGGJxjChxxhUT@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXLTPD4Sra34SQ7b9dlqr8v1mw4KrPOGdY9Q1ap1uyrKISV9a
	beQ3SXIKUIAPPbgBhvpzl5r/4w2dZu5AEgUVDAtU9kBPGQipc38WrV++EgX+XY+puo0=
X-Gm-Gg: ASbGncuqcl83h5GttrwGulYpmgTvxUTyAY6RcOy7UemmJqnof622G52/GWW+wlnpqJz
	yrMzD2r3hSoFlBRb9UqTv/9GybeZ4G3b/WVLa6J5z/SflabUGiAEV9uIRCBM2nO1L7A43XnkkOw
	iSfY7BxWU8u+kbEwr4JxIpMMSnwg+Zk8LCrr/a0bMuuPxw6OzZ+Obputhgi1hx0Y+F1+ck4O7AX
	MgEZ5dHIYbLqx384UM08nWttfSBnHH8BmryfqW+YoZfLq6cpJa2Zb6TQGHDo8skdjHSwHaccPqn
	EyLmI9+/JCZxiCkvxdHGlNVn4bje3ll/h3kDMHc4v3QCKtMP0GZzg7FrCnxf7vviP1laHnLRe9r
	2ozlYa0wgxzDetJruhpB516nuNXQdeiBvWe928vqY0g/hJhyR0N/R9hUgNJhyWHBfwTihiTQUaJ
	2yvw==
X-Google-Smtp-Source: AGHT+IEu1fZhS4PGdMY445gHt6SyAM90kHYvE6rk3Vh6MeLyr4clbAteyYxBE5x1gS+10mLcC/WLSw==
X-Received: by 2002:a05:6e02:967:b0:3e3:faaf:df05 with SMTP id e9e14a558f8ab-3e4161ae4a2mr76953355ab.16.1754193567464;
        Sat, 02 Aug 2025 20:59:27 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
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
Subject: [PATCH v4 36/58] drm-print: fix config-dependent unused variable
Date: Sat,  2 Aug 2025 21:57:54 -0600
Message-ID: <20250803035816.603405-37-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 46d53fe302047..41ad11247b487 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -212,9 +212,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.50.1


