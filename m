Return-Path: <linux-arm-msm+bounces-67520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03665B191EE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD3561777F2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B834227EFFF;
	Sun,  3 Aug 2025 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/ZzZjvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621A2472B1;
	Sun,  3 Aug 2025 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193521; cv=none; b=UzI6+Kg8+V56DZC1XNGNIsAUH5/U//ylqgSczJD1UXlZ7osz5dHLvLqrhyp8xFJ7+6W94Ul8ikKmgr98WHeGlX2vwArZ3czX6ElIOU0u6lKDXxFwik1Ly/bg7i0ZmMtmYHVW5QbHorGimIH4uF7nGf91cQ1YfW0v3yYSC/1r4WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193521; c=relaxed/simple;
	bh=jYtoXAOQQmtyhcvhuuejHTH4FcXNzk41Sf4BVUNPxyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgVNM4A/b19cYizo26chcaQ0oxdsgld/LRgzVR7reWJQHwrcr9eYniSPnJL7UpHKjzqiK1hlw+BAPoKoNcXMgH34UpmnCxa/xqqE0FdbL2nv7NSY7A7vILxMjdmGGaV4+sft9GZcRD398H6XStUhDMrwXsqbOJXw7mIschXi/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/ZzZjvZ; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-88120243d9cso156596639f.2;
        Sat, 02 Aug 2025 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193519; x=1754798319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHGyuGgnpKZsaheli1wyL5zDNg4zEDBviVdaC5XZBoc=;
        b=b/ZzZjvZiMQZOkNw2OFMxs3n4/X6lJe8yPzUd4WwcFpqNOJ20ER2cpPF1WzRVUpcnQ
         QhVDd6ymALbt7JpIbVBq+7Gk/a7kGjvz/qipMlIIJ1v6WtugidHMZ2Eayza359mlACNO
         0quUUtUgcBFRGpIxOVTjWz+kLRRYozJ0hQh9glBWm3vil/jaHImRrl7NyPl2Qvnu2Aaj
         W6YE6UC09LNTRP3dh//zZgTQIca7wNb4Gi7CbwaLBvAxLQm0BDGAuXkQlDeLtbqLPjvo
         CLUdH5Ww422CAvQ+ulKx9nYOP2B6zJgsNgsM/Na+Rn6F0boIu7CXnA2HPP0gOhUyRxW5
         Wz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193519; x=1754798319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHGyuGgnpKZsaheli1wyL5zDNg4zEDBviVdaC5XZBoc=;
        b=JmscjuzdZqq7lmhUy2z81hIsunKHPtdAFqq2gB+ee1U2/P16jpunH0W5xLs1JQNPod
         ZaCG8jBw4QpgAogfr1CbijNIZv8WSsStUylozlBUPHoWPvWRSWkUpYYYmuAW4yfKE7KH
         NnmsagNULEAmaRc+ddkC1pFyBrLg46+QxeXWdlEpLvHsv7io9KMLSvOsBPX+Qb84Ui75
         lysGmmIdrcsLdGXdWMvcZwYEZzhJSh/NrGlbMMhW4yVaW1nIGPjxvCSjAftoHoX/INlJ
         N+c6y8yhu6/zfN9N5G8nJMtUOf0LWtbNhVOfu95/E5fCM2jQoXV6qQLDbTo76uBH8cL/
         eb9g==
X-Forwarded-Encrypted: i=1; AJvYcCWOU8UGQF2rJML8RPMahn2sAG0F+pvY70BqAKXaz04iUyJGrG3lGDyCiNiU1SlOvOwiIkD2gI2XyRrzmgs9@vger.kernel.org
X-Gm-Message-State: AOJu0YzDkAME2I1g51TbAaaaYGZMe2/j0LCbqsD+7AsVU07JaFiZRuZr
	IQM2I1ywzla+NnfZtAfn+Pf9TUMmLaYc0Cg+SnqaSJYLAMcvYs537hOrbnfr66plIKs=
X-Gm-Gg: ASbGncuQZB0a+hlfd3YS7wCD2f1PKuLBselehkb98h4pvvBQmkptfjQNR3wVAdz1I7H
	dfqI1BIeH0EXhZ8xDRpreEFnRNxCkcYF+SANu4d6buSls6x81nmHg44qArvP1JXQw2voTqIC2J0
	vFDn7KvNGBvl4qkIk1eIkxQezJ8/cERLAh1pCy1/UfGpOF5iQRSgiySgT0/9scqiQpHFdzERys+
	1v09A4YCzdJutjcb8+sQhYtxHHXxctj8EzNkDIjairXLdqOUZXPK8VnRdBTC9oNcjqEkH+awAiz
	icumhy7lAnXol5ccKlxvgANpxf7VFuQEGxLuXwsbODVkYGjPb00U+mJ5gwr6HeGC7AWgFz4VVNq
	WNn7mXx3C9zmENZnIUhDuStbXyGsQVfszca2cYDKCvsRkV2cNrJKNmF82HwJhAJqzCAg1vXykmU
	6M8g==
X-Google-Smtp-Source: AGHT+IEGWj5ry9FocCclfChHk3bFL/qs2Ye9qIuJae5+Nv+8XnL0ndSBGTCV5nBBUROVehINujYa4Q==
X-Received: by 2002:a05:6e02:148b:b0:3e3:a1eb:4462 with SMTP id e9e14a558f8ab-3e416116bfcmr104124655ab.6.1754193518936;
        Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
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
Subject: [PATCH v4 04/58] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Sat,  2 Aug 2025 21:57:22 -0600
Message-ID: <20250803035816.603405-5-jim.cromie@gmail.com>
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f24..147540c57154b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.50.1


