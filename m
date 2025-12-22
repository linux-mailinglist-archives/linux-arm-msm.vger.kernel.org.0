Return-Path: <linux-arm-msm+bounces-86125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA3CD5126
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03EE1304B004
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAB4328B65;
	Mon, 22 Dec 2025 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brw2J+01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD4328B5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391761; cv=none; b=erAGk0qOyqadW/U2poCatc7Ud28ODEaGwZQuFpTAJ4aHrtAy1EeOtH/y1jFbU+L08ogXRieJKfXZihLyw2NewCYMD6JAHQZbQeIlt4n7pFIRsDpr45ima7NwWNZ6xS7Uk17T4rj7hcC6Y9a41NTZowgwvA5mcUv5Ji/Kuikp54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391761; c=relaxed/simple;
	bh=sDWD1uGFDDRlfxhy01ddUztM6UdtdQV0shZVeb+54EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUjjRRcxk7rRova7cZFfEJNHH5gIi96vcaQHp8fs5UVCENrKZBX0/j/gbHFnem2T/MyFDEXfitxzCUKijExKKST0ux9oubFFm8fOGrJjuX7FaHciKjnCP8ylD68KaJ2MftSL1SgeYtLLD6jXRFS+XupzD16X3txmetCXTYCJHMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brw2J+01; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7f121c00dedso5006484b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391759; x=1766996559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
        b=brw2J+01l29xZF3uoviOh1HX69oFxnKM38LprtWgTC/Iu6TCRc15j3RTm4crMIKEre
         T7dFX3gLcukm4nX1CJ/SPTX+oipCSFVXKfYuy3EbxMWmNaWHbjmQIarbAGXUizmLv6FQ
         /usVY3Xl4QIKwdbbAt8/SoluakobOiuM8GfdTgulaCJvOlZNd1psgt7k0mbKk0z/kUVE
         0Q2Wu/l50VSLC7vc1DGPGMDu5mqWFT/3cXsUKV/SZEdBdfnt5v0XYe31e1yRrXEaZ9a5
         dHKsb/PxvbZMBAJBjPHH80XM5/uhpsbWAzB7SvyEhONbT4h0WGco7QQ/pkIWaA0NOQop
         eAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391759; x=1766996559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
        b=jCvmobXb2lVnK6SrisjNzxqH1MJX4QimGUIUiNiOr0UqBNgI4mG3iKMUE2on825r/7
         AmkIqPJOPTMiyRrN2fl+9UltyWMV3PgwNxQJ1ql5GlMbBg8zija6hpen+UxsdR2a8hDH
         VF5XuMMyaiCHcRC4va5HoaMh9yUM3lHVaIncAP44WkuCNqeYgfMPnEQHiIIj29V7HcoC
         PdnsmAxqNhcpcyD89eyWBlgXT+QFpyShhdWC5w02nALTcvn1VBuwh1qvMwOEp9Do9K/D
         PRaHWelRGcxtVzcHbBgMCORbraU1zpRYmZuva38lvwG2EDjfv7+kO93FD0JwIRNyVYfK
         PLQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJO99Wbm6thxFOfWRsn1Y3vHvrtH9/lBLD9JokeY66pXl1Uqn+z+XdV1iYyfadrZ1LAVv4vFYilAcRglpY@vger.kernel.org
X-Gm-Message-State: AOJu0YwUltJQhcZWLziihw04RrD2S5pTwphf4j3BHywVqnQ59MMtQR3X
	RRngVI82eSW201gNgULlx7wNPhby3cOWSbib5JKrsQInzrKvhNkkZlyQ
X-Gm-Gg: AY/fxX7WfGPoUN+S8YvEFd6imSwi+BRV01822YmYX/9TpqMgMnZrw7poG6xs0miRdh6
	gJhvglKC6ptusXcAapiEgVU1mMyuTctdVL6KpK4Wl3ksvD+dG5JJf/kgWJaOIWe0FL76x0Q+srZ
	eil9vssxJYfedQvM9RFfj7diz/w6WFcqFN93PvWopC4SnZcRPDsZYMhJGut8b3Inp5KCQnpZHS+
	8yZlNr5Yo3TeNzBlrFzkmtTYB+hoZmULT8QbdAQE4kib43XFY6Bx2F8lI4BnVvtraR3Nb8jVzZb
	OOipr38hMIwtr7gBoGNpXxOb+PuWp1L+3/FLJg1dIaP3vF4NsQjIALn94FBsEzP1BoI87W9u5wq
	NgVx9jv73zfELJIrXffj7R44Dnn/uxMYWrCxDLz6iSO6MjXlf+SR1w2EqDIIZf2qLmHE4r4H5fj
	S28FvXrH1J
X-Google-Smtp-Source: AGHT+IEbn13GAc82azOlCQBzD0kgiJPbfq4yJfKj6lNc2cko7ljpTpb+ZvesmNM1IQ0X0cprC78m6A==
X-Received: by 2002:a05:6a21:3395:b0:366:2341:4980 with SMTP id adf61e73a8af0-376a81dd746mr9694106637.11.1766391759442;
        Mon, 22 Dec 2025 00:22:39 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:38 -0800 (PST)
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
Subject: [PATCH v7 07/31] dyndbg: make ddebug_class_param union members same size
Date: Mon, 22 Dec 2025 21:20:24 +1300
Message-ID: <20251222082049.1782440-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 98a36e2f94b6..4b7c3b997657 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -103,7 +103,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb171088850c..d2ff203d0873 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -810,7 +810,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.52.0


