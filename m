Return-Path: <linux-arm-msm+bounces-67523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57277B19231
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D2637A5855
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C869827FD6B;
	Sun,  3 Aug 2025 03:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lw3u0LMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00C27FD43;
	Sun,  3 Aug 2025 03:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193526; cv=none; b=l6GR5Ym6yyUyq7rZaYgIVkn8hQQoaz7Gbo41KnB/UcUOLJfrgcKsqca4FhtXocy80dmu3wwcailXvoZt0dkUg6HECrgPdy2pSwUPLlVbfKVACJOpQTBcgfN/jT36MrMZ57uqBEfcecZzEATDM1GmyQeHqAG4PDgbS+7+cASRoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193526; c=relaxed/simple;
	bh=ghEoe6tUJcsqU6v8X4tUjcFEDweMtm0M/jrunEyWQwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ynmh+geH8whkoyQAygdH5tDmgrzdi2dUHmHMxU77K2LZFSwOxf/CcXrDmhQH3Abp1ypQw6v6F9Z8Njo/Zewyp7m33VqNZe07FSuv587hoKQrQC/Gt7mGJf+/ydMNrqKKNH1mW04uaiQPQ6TzLYeWaIyctVy6ufFnxSspV++MLl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lw3u0LMF; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e3d7b135c2so40558345ab.1;
        Sat, 02 Aug 2025 20:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193523; x=1754798323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LKFK2FQkGbRBipMPdzUP2qSKsnxzgWO8ffhfoPvu04=;
        b=Lw3u0LMF7wBW86onffm7gAHph4p34tsf646nv9Mp4UWAE2caQ7z1bTnWJYkVDfOOEY
         FmavgbHyt80W8TUbedu5zeN8lj8OsYZT/b7X6/xxFPIS1GD+qRz5pMg80Wd3vd91nBdj
         DtZLedLR3IpcGzOsPGIc6GxU5nHfbIPRY4vHD2wzOEmEvgP2mBWnUAoCpMrGOecFvqBv
         vmxPgCEWmBC1JwrQfirdtibbG8wmr1gJLaHyn02RVVYgO5BfF8ah+SN7UFNsXmswEvsB
         BFPpxeYCpc+cu/hui65YNtL7uKxGVTQzgFmCO80FYS9woRtu/AFZ3fK/boRU7WIVhjvO
         LqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193523; x=1754798323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LKFK2FQkGbRBipMPdzUP2qSKsnxzgWO8ffhfoPvu04=;
        b=Jpm5dm/u8Fa5ch34B3cHLGdAxsismIMyT2Knq7+edF3qwk5IShmgGy6GFC8ArpVa/r
         Z2+jxsOOMSGUfbCxmTW+60vbmrNtYAhFhKpIBBd8Se8VDo9WdlH2ZUOmYQNbQ96ktUOH
         ebehcm9fkIFDsskuEgTul9sviJfhBhy9ms6ls6n41d+q9o937Qy6eBx5Ak4QmYTNKof7
         8+clwkZ7gadP5CPcl20DNdsQ8OMai6otN1GOFIUUlGxVZTFKv7llCMC9Psd19Me1cRN+
         Uwjv6jgpiMrnSBl1a76D3wDnaPP6GiNO7kwsnF4cL7hBzJT02uRiMTCD0Z+e3KRKauS/
         +TVA==
X-Forwarded-Encrypted: i=1; AJvYcCWdvuCCxMwkfjrbwXvZ+K3wJ/FpRAlLRnTv+g7daQo8C2fV4KhXCu4N6ahP/dRdL2jr/E2FsiIZfU2pHnK3@vger.kernel.org
X-Gm-Message-State: AOJu0YwLFqa3+Q/0TtyAb/MNAbHz/edwUSd2/MLouNfGLRpgCeNxG83T
	yHrvnvaapTEKvt1+/TamLEIMsSIG6F1OC0ZHlirQniIQuo/jPOSGGsVvADauETqLYug=
X-Gm-Gg: ASbGncsENAM7/Ef8YD19BzlNOp1LcnW6Vva5SG5s9HT0t1dDt2pwxOOg+ficlyqFu4q
	zuMkb5FL06D2C3FyeFJb2wZ8I3rln+TmjWPqgDVHjdCvgz2Wdel8quAMD1xabj4PT2B3OVgxS/T
	+4wcIK9Q+LEC1ctZV6jwK/HGVTOMFWcN5m3joVhoMqfAUghMjE9kHoIgbJsP2s0vF0JDiMtNWmY
	yP6jOYGy+R/0Sr4r+7KM2IMOU18MZmceD+WIhpDFww0SiIPDEf/F9LwCpxWCPKYzG3IAxwIoqfJ
	LtNca0DcJzR+8uO2QhvYSXcpgN+Tpi/5Sk7YAVCMCvPUrzI2AIdVPna5uRlg5QF4UQmER3ZrCAL
	YfoIvQt5Mg0O3h8ISv/NfJkAcUJr+ng00RvDM7KsfalYZZTmrBdN4cHqnAs74mdrKzvH6nyQcLK
	FmhHfRTfiuM3UrpxzbHNFJ2Bc=
X-Google-Smtp-Source: AGHT+IEK8/vwYm1R/fsAxFG9PU2vcozrYZR6RghCEJBk18PG9+D3j285L0ye3PQbY3Q2FqB5Lv0cRw==
X-Received: by 2002:a05:6e02:2220:b0:3e4:1162:6761 with SMTP id e9e14a558f8ab-3e416128e06mr102803815ab.9.1754193523038;
        Sat, 02 Aug 2025 20:58:43 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:42 -0700 (PDT)
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
Subject: [PATCH v4 07/58] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Sat,  2 Aug 2025 21:57:25 -0600
Message-ID: <20250803035816.603405-8-jim.cromie@gmail.com>
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

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55df35df093b0..2751056a5240d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.50.1


