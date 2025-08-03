Return-Path: <linux-arm-msm+bounces-67519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17176B191E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D977D3BACF3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE3B27280F;
	Sun,  3 Aug 2025 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfNjxtqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72650246BCF;
	Sun,  3 Aug 2025 03:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193520; cv=none; b=qxfpMWo+qrmfYRWPGpngW+6VOfnk/NFrlVmGFfbJ2rUwA3EK8sG17GAPBknALBckOE0SCWRthqKJ745Vywe2FrHIAJucSW8Q0jfZEgrkFE3TBvsMtiL6kY1QNd/smnRGx2kHKoAzS72VYhpqyN/amlmHm6ZZ/5giCHCAVjcX2Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193520; c=relaxed/simple;
	bh=GsPb/rJcZBRAXb3H2gwmFCkQCsNJexKts4bSgjflKS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b57/d8mpdhBoVEG1Z0sp5+N4SPOEjgCybWohNas7yeR6FzpysdXDSgGv/xNdbRfuBpOAHtSNEAd8E0PM3vgY98K5spm7JMGLEwvS8jtz+j0Yg/ralK20BhwWI+Zxv4Tr6+dLZXSC2lMDcMIK4eiXix26Bd7xc/uO+/ILa0AvwX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfNjxtqh; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3e3faafe30fso25237925ab.0;
        Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193517; x=1754798317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT8/zmXv/UqMduSo2scBRCmGp63Q5/YeQDv4ZhdIR2c=;
        b=DfNjxtqhUza6XfML7uONhAmdcf+YagM04kwgl9ppoI3MN0HRgs3qu+ylsKIbWneI6C
         0CYcYDJYohL/J+GiPuXxUFgd3msYreOcUIAfj9qyXiM/6F6zUSU4OU9D91KioAjbao56
         4AAI7fEiEWQUDLSKZ1/oUVQNVFMnk1QFXjOtDnFN9UoXsfsqnCmxN69bB/wQhjkRE4fn
         PLF4Z+I3W82b2MH+fEUWMvlkqbm7LqZt7pZieGofpmXO/BHz7Y1S7dK8bYsW0eLvni3O
         w25KO4377FAEawZE39UNhzYlkAxudrXlLvMhAbrkbKUwQh6nUcShXYrk12NXKgMBZ2dP
         AztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193517; x=1754798317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT8/zmXv/UqMduSo2scBRCmGp63Q5/YeQDv4ZhdIR2c=;
        b=PaA5fJ3+GdR9h+YDeHAwt2BtGjNh/xFMdlKr14EQ9tQIhd2Z2s1xEuG/9XAVTK1Kpd
         xm7pzsVS1r65hH0u6x76hxvf5wcZoROEbS7jvEXwj10BBYe/IqYxyfAhW8qJCOoHHsQm
         bcSz9M0AmYIocYfgCgXE3dS5XmPVufxSypWuprviGxz8fPIPvKmARHIsQLFdmo/uBNyn
         cXr5oe5YTB2bUlWKZBLVG0ZuamIWdyJvTH4/2/eozSRsaBUzCXvZJR69qvkAnQQAB/PE
         vqlKO91pUz0bQmwVCS8uLZgkBhwdCTRpA7piqeni8IxQTM5oNz+fENVPNxxqBGHaixdN
         S68g==
X-Forwarded-Encrypted: i=1; AJvYcCW2Av420g/oIfn3PuAMYixvT7oGkF3Cu/wgpF/riRaw/SatcPpc+02ZHmy6ngrvUBCiN5ZMMuskEw6Yb9Va@vger.kernel.org
X-Gm-Message-State: AOJu0YzkWozFW/2fWFw1heO/wPLedVCUele0TL8UPtmMYLDGeIb6dyab
	GrGzHRU8C3RwaxKsJy7PY7A7tCCvV+8lMFjFhh9fGc4xcsQlNstcoGhTU3KNpe1J4cQ=
X-Gm-Gg: ASbGncvxu8qzRghbuQL4QFohWWWnH46dJTsm7PdXKML+PKZY/u/N8FQ6Gh8Kort/yEW
	COJCl+oBWFVKDOw5rTNLfdvETwUxsQKDiKmSUGVsDWlcvSeQ9hdGt8lVaDYh2uzAe8k3OcD1Wuf
	xakPJq7UrqJ8tNsNCatno14vYnOaFqok+E2/hM1rm2226gBZPxEtieijEeshKCmxd04wpEoOzV3
	TpaOjEiMFULwcAmu4V9Apg0Ytel8iieXLlOMj6pWJ9NrZQ9ranPxIZFQRloCPK48uiOOPXpXgvc
	RHmtLz+2WDjoX8jRZB8DbHP1jLa9rObjovlneYIpl4E58UUG1E6ZWb1xjub7M17NddNnA9f+sZ7
	lUI0guiWj9kOC2zTqkHjnU41SC7T1BhmH8Jfbhh4JU1UAzKurYC2pLxYWsgBqKnX59FrNRNxFC+
	kPmw==
X-Google-Smtp-Source: AGHT+IFfI6dv+/Dwk5MRfIQvsp2r14i0lroXxft+olSfZnx9fC58ENAn+6zSkYG0IWesgfHHIjV0TA==
X-Received: by 2002:a05:6e02:17ca:b0:3e3:ccfe:d597 with SMTP id e9e14a558f8ab-3e41610a07fmr100943495ab.1.1754193517393;
        Sat, 02 Aug 2025 20:58:37 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:36 -0700 (PDT)
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
Subject: [PATCH v4 03/58] test-dyndbg: fixup CLASSMAP usage error
Date: Sat,  2 Aug 2025 21:57:21 -0600
Message-ID: <20250803035816.603405-4-jim.cromie@gmail.com>
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6afd..396144cf351be 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.50.1


