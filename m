Return-Path: <linux-arm-msm+bounces-67518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7CAB191D8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5310E3BB13E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7B4241661;
	Sun,  3 Aug 2025 03:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMHGORvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243CF23FC49;
	Sun,  3 Aug 2025 03:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193518; cv=none; b=ODMLw6n4gNfsPNu7bWlp2Wc7JQZ8nfyXCXO1hbZgOnEAZ6YDUe4FquS/nxStvLjcBbEd8bWRSQX2g0dPZ+XHKXANsRB0cHuzHhbBh1ry/eGyE9YXKctFvYW5DkFfimvKbfGeISW+OrEJla0ITrZk02ssAocELnoOg4fCRGXzWsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193518; c=relaxed/simple;
	bh=qwSDFAjQHW/7wU1Icp8alV4PMk1kI3X0i/CQrdqYV4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUAsUs+cYqADjudr3oUlJ8z/OUpV91VT9sndSgTDIK3SBO8y8MkbsuryttdNJ3GFU3fRFcxrevgticvFpaEleVooxrxMno6h2YeIsQ1UZf51DNXecXoJivmZsfxdRBcbVk9+XjyhjMOTC/CAQ/0rbzS7QyV1802oAsTMeuX6mcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMHGORvS; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3e3f01612daso11598985ab.2;
        Sat, 02 Aug 2025 20:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193516; x=1754798316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=;
        b=VMHGORvSNZO7shDF6RI4zye+Wcn/uy9DzqjDODycM+fJjtQv0uA64OPjLvJFVsADJe
         kkStFSs5+ZIP2p+ebXgLjMk49PNsMBsPdQ9r8DzI6WMt0Hy2wGTk8lIRg2SxaHNFrE4L
         lesS98gikjmM5AZprWbtFwVQUJYKbYuNQQKNT6QIbUUK4ceX13LdFqKm8MYw5F3mYmcW
         d9VKfr4IzM4uw+CKyos3bNhTVsFySu0Tkp3Ly9+qdK7TU+ZX88IoAy1WiDT7Qmh2xvvJ
         z4pqfp+2nApFjh5Br4R61Nvj0u6CdQ8DplVluixHXx4XadG2KsR4xYFRNmTsmqBUlv+T
         16Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193516; x=1754798316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=;
        b=TfqHIT48jTOYX/NN51WCiJgba+NVXzgDdsxUmBn4OYIrvLNflq4GIR121GnozgUTJT
         5kn6EXoF9is8mR0kRAomG0i5E02V82olkEHywApiN8+6csRRijxX/o2ah5JtYsvNFP3b
         cT/m6qxYDEyB4aE3rpH3Ep3el+j8ZV2Dj/PtrFcaC4RdKp8W4aOM4UvlR41a5vaPy255
         /FgDhtXYYkdywvxpkbBtmtno3HU1kmMYtsbXrt/sPMTUcWgYect6RNPmiZwam84crfzW
         F4EfEmdsZalwl2s+IdVeyrD01u7aFaEzHnQctebTVK+idsx78Qtq/DRDL9TboiHtddm5
         /fWg==
X-Forwarded-Encrypted: i=1; AJvYcCUCxdDmGwvWpWZ3hNrePgDGgQC4dXwKNqPGimXClq2tDkv9kjiLqxYBvTte8lhcGbCGaPPqM0Wkgh/ux5pt@vger.kernel.org, AJvYcCWFlOCiGQrh+1qUsnzdVTtipdFhpaJOQDYxsbTGfPT3/w7bWGEt26xhtvyRc9h34sbRzL1PA2197c5V@vger.kernel.org
X-Gm-Message-State: AOJu0YwKINBs3S6Ejgq5zQiBCHrImXQcmnjGfrmkz6XEOA8zglhrOtQ6
	Rfyv26bonkAFv4SUrvLze6PYr41bGkxNLxdJMfkCmuEROb5h9QhpDelnLo/jpBgcI+8=
X-Gm-Gg: ASbGncusnCkBBW/BfZgp5fcfnYlTx2XX+n5OOMQ5x2Q5ZQkeY2SJKNjJwDyTRKKfeJW
	dQGNJWHf+Xko2avQtaesa9wO6LUqHxYUyais8BniZunmpAjoOtCAOX+GzG1W6lummxj+GJS/iKP
	2aLe7GD3vvOJaCnWaFUN5r4GryhJbbvLPwhIAudePe7hUOLHaDy08v52uuv3K8OTT18Qi2eHhpd
	Zg7+Ske3YhNm6wmmDEcOAOt9N+H0XUjoEB8ERukKB4kzMdc08K37lTmKjPFEeKL+wYgAxp9ywUU
	av7bFfylKTeeKBatPnZI1BKGP1MT1nGY1We0t2AV9iKWW2jLv1/lIkjeXfYrZrvHL9hDnyGJjHf
	h9yWQf9KtytIAJY8jzhN9651EuqTjtXEa+cBz/9UEuyIDtUSSPVs6aGorUBThaO+3ppWqOVKcqF
	vMgw==
X-Google-Smtp-Source: AGHT+IEFfqhK3Yu96GZwkzn3H2xfn17hF1ni9VF+BRmo2ZqR7bTqyB9jhLRitAgzMOgRv2m2JMXKjg==
X-Received: by 2002:a05:6e02:2612:b0:3e3:d8af:3847 with SMTP id e9e14a558f8ab-3e416181770mr93924425ab.16.1754193515916;
        Sat, 02 Aug 2025 20:58:35 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:35 -0700 (PDT)
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
	jim.cromie@gmail.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 02/58] docs/dyndbg: explain flags parse 1st
Date: Sat,  2 Aug 2025 21:57:20 -0600
Message-ID: <20250803035816.603405-3-jim.cromie@gmail.com>
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d953..63a511f2337bc 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,9 +109,18 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
 keywords are:::
 
   match-spec ::= 'func' string |
-- 
2.50.1


