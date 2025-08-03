Return-Path: <linux-arm-msm+bounces-67547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC9B1926F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFBB41890128
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F825287506;
	Sun,  3 Aug 2025 03:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lagH6D1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7069028725F;
	Sun,  3 Aug 2025 03:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193563; cv=none; b=D11/4SKFTk4wJZFSDH18Qz5LvnS7Ct5qdbU1nDnPUgtPewCf4pTSQzS7Oifw14GxdifaqLOt/RKcU6pN82JtuTXuhIA0SW4TePX+F+a9lEL8F+LkDdmGENoS48BGdsioXeBDow5DwjJb1xkuYTQZvWW4pMib3HgmXMnYDDLe7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193563; c=relaxed/simple;
	bh=n5iKMsIIu2/P6zRK0US0stmRoXhG6gIyqo4tYMLYMyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDAtK4OSUMxY1Qqo2DFKeLV6GZ6/vsjDwRBOjmu4VkgLMkBEuLyTpIm81aAtkknn8AuYZJ9O1Q1NBQwfvMu1OpKlLSBooiGMed+iyG0X76lT6hUtNA6oBRX1ZGopsVc2WUugamaizgUODKjBCyWNewtVeXBP5WbRUzYFy+Uqg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lagH6D1A; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e3e4a5715dso8643375ab.3;
        Sat, 02 Aug 2025 20:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193560; x=1754798360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtM07pJzYNN+E8iBAeVUHbxcWX+I3Pz7zufEOWphlcs=;
        b=lagH6D1A/3RLaqMIFawwW3KGYYYgEqDsFFOXk08nLlNBA+3FYYTEcsbRoO6lKRPmjN
         nCa3GVBnHbdAJvm6HsZnChtRfAEn1OS8T64BuPp9dl6r/+1aZYx88XXGBhBffkXm2q5j
         LOzqCrFeJSZBqlgLw9bKNRS9IlWXD/vTLdu4+e6lP6/+LoW805JIILJmB5sSRXF6KapA
         vuFiPCQd25jOZfdNfP70eLKzeWAGlwRyXyqy/nwG69Ujy0frrGtPcKDfeXQqNmawyAZW
         MFjXKAi1ra2fFSBspJH2uhQLyUp+WbuByYvjCj0r6qswgBaAGLR8Gq3yhP0Zicef/sIM
         gZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193560; x=1754798360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtM07pJzYNN+E8iBAeVUHbxcWX+I3Pz7zufEOWphlcs=;
        b=AnqcVSKmh3HDkVXQDcwq/sxNJ4C/VGPMEhNkoKJJeUQjc0/Q2v3NTnS4ci1glDnvhc
         gZ+XwD6YdGmBRoUhhwNNzhhFBFCbn6CwaTBCuO78fagldLn/tC0kKNazUcCpepvUlODh
         +ujo8icTeF3xG49SD4frXuOEiNNcaVlidemUdLyNLQ4FGzzJJxF7BN+YNe/ZU9O9CW0W
         NnYgpl3UaK69mhNtXv7d3dKN/2a0nQA0O6w/8CXq3GmraJgF7ASLTxozoBCq5I6dYAAN
         0/f/9GPdaTnjOabDE8IKu9aYt4AuDwhrFwYUvDu8YVkFJd51nyberw/rKce/vOfX+4Yw
         QSyw==
X-Forwarded-Encrypted: i=1; AJvYcCVE/3DjSolULMmv+BB3+rCamlCc1emX7BTJFzZefk6M74caTWXNt0tF5Zkknl7yKix9gMhW7+hbVc+P2jpu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4Se5SyBzKAL/rUwCDgA+R5bHiuParggAHZccRap3oye0vbKU
	I5dY5/AgIM8zXeUvNr0jA8LpJq3DKX+9zPiLZqRAehMTJ82tbPpNqNlY4rOvg/B0otg=
X-Gm-Gg: ASbGncs16OtIKoSncl8/M+vf1J8GtRL0r11yYtDIoVoy4ItFkDPZ9Ieb9IdpgqUW54M
	PPTeSmjgmWIzYKMEmFweRk8JysDoYPM0of5NKfV2NSNktknw6LIzvuCWbm+gOl1m8vyIvL9FPhF
	x7jc0CNb/xGZF7Uww3pxVf110vjcI4ajy+KGqdtJSJRdUxkfPI6rPxxRWwyjTghTw/EDGQqU3Ve
	ZGI9Z9p0zLVS4sxVG1IO99qREr7AGfqEg8zucWzhBhi9M2R1ly6xvzHvkXnojOCGrEq4NumIWkr
	ImbJ3gBn8CUAr/NoFXvRx1mYAGp6ZHpC7PYnjhAPjvIvS84iOijPjGx89ZWfzx9S1UMffs1Cd66
	UYgeHRAP+uBbcIzhvbptgZQWBWkd7rH0hE5X7KrhwC0pvslTCNjr0IrRRldCtp4aDa19Fqt7UTL
	Ii4ej1XUL+B5wKbh5jSU5qU/Y=
X-Google-Smtp-Source: AGHT+IEkAFQydYpFJvb1kzqjmURuxfZ7yJ+hop2qWEkeOQ2xbV3exZjxsMe8uB4jwvdg4HEc9Ir9zQ==
X-Received: by 2002:a05:6602:6206:b0:875:ba1e:4d7e with SMTP id ca18e2360f4ac-8816832db31mr945512039f.6.1754193560218;
        Sat, 02 Aug 2025 20:59:20 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:19 -0700 (PDT)
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
Subject: [PATCH v4 31/58] dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP for +mfsl flags
Date: Sat,  2 Aug 2025 21:57:49 -0600
Message-ID: <20250803035816.603405-32-jim.cromie@gmail.com>
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

dyndbg's dynamic prefixing can get expensive; each enabled callsite's
prefix is sprintf'd into stack-mem, every time a pr_debug is called.

A cache would help, if callsites mark _DPRINTK_FLAGS_PREFIX_CACHED
after saving the prefix string.  But not just yet.

_DPRINTK_FLAGS_INCL_LOOKUP distinguishes from _DPRINTK_FLAGS_INCL_ANY
by selecting *only* module,file,function fields to compose the
cacheable part of the (+tmfsl) dynamic prefix:

-t  thread-id. not part of the "callsite" info, its from current.
    doesn't belong in the cache. it would spoil it.
    do it in outer: dynamic_emit_prefix()

-mfs  module, function, source-file
    they are "lookups", currently to struct _ddebug fields.
    could be accessor macros to "compressed" tables.
    then they might be worth caching, ready for reuse.

-l  line
    this info could go either way.
    I elected to include it in LOOKUP, so in cache/inner fn.
    this makes cache larger but avoids sprintf %d each time.
    smaller cache needs smarter key.

All enabled together, they compose a prefix string like:

  # outer -----inner----------------------
  "[tid] module:function:sourcfile:line: "

So this patch extracts _DPRINTK_FLAGS_INCL_LOOKUP flags-combo out of
_DPRINTK_FLAGS_INCL_ANY, then redefs latter.

Next re-refactor dynamic_emit_prefix inner/outer fns accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 0f7476456614e..d64f13a7a7394 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -40,10 +40,11 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
 #define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
-#define _DPRINTK_FLAGS_INCL_ANY		\
-	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID |\
-	 _DPRINTK_FLAGS_INCL_SOURCENAME)
+#define _DPRINTK_FLAGS_INCL_LOOKUP					\
+	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |	\
+	 _DPRINTK_FLAGS_INCL_SOURCENAME | _DPRINTK_FLAGS_INCL_LINENO)
+#define _DPRINTK_FLAGS_INCL_ANY						\
+	(_DPRINTK_FLAGS_INCL_TID | _DPRINTK_FLAGS_INCL_LOOKUP)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
-- 
2.50.1


