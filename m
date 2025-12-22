Return-Path: <linux-arm-msm+bounces-86123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5DACD50E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 450813007ED8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5B83126BC;
	Mon, 22 Dec 2025 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhMVUnsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14247326D76
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391738; cv=none; b=B0N124LwHyTtSAUcgmfa5r09bCGQ6Eqdfp1UN0U3jZEAWD3X/6ohC7mZe+CiK0djyugCo+66ClpxGIKsSagROKl6cR3Nkj5+VXbA7kYXg83+yrT9IuVeVpZ7Bo9JOwalhWQV29HChJaNih1+2XdwQgI1aKwUyX84tM0lNZEVSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391738; c=relaxed/simple;
	bh=fM95hmZ04ed6zy8idewI3EL31tuL2KItDxeKe01AAec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjvBseg2yuZUUnEkUIpLoW6V9GTb7XhSf9YRIfBxd9RgPZ4V8td0Zdtk+O9DzJzrcT7ff2UXayn4/RO6HcIbffImdJwpb/dUDw75kUOMROsHQXN1sb4KsGidbThBgzppQOWLOGk4XtqUl4FSvqPmOym8P3eg0bTuQbuzppP9gGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhMVUnsV; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso5189957b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391736; x=1766996536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
        b=RhMVUnsVzatGDTAsw4htZYuG+cZoEJkfnEmyXofPAAA0OilxS4Db8x/gFg9DxEzY+/
         8PvPMoIhpZyY/1+5tNN6PhI+juGPMitihoRSBZ8SOZhnbs5x6eMxxAlEVpuK9g1meyT/
         z1OR/1rttXGhRCfuBSC+QRuX8UVY17nM4dDJ9v69Vly0Gd0Ck/9V6xJmMTOHRI/EZ2S5
         vDXAm8tPOcrxg3wCHfFrteR0iyZ8vkrxf5wOUZXqUezF4RNQhYReIPoKovdEgIkAsMrC
         c7cctsivdilZsF1SrbEdNK6u5SZG4bKd+lNi/gajWV0Vuinpl9GnoE5icPabK3kK2tIA
         ettw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391736; x=1766996536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
        b=O/MZxNMT64TFCwaD/+aG7Z8YkjQJYSfR/zvSxZ8XPdkznXua7wVec2TOILypU1yhwF
         mRIrTF3Rt/fOfEQC5ikvqrjhbx1OoQ1GJDX7FR0ZfWQAuMgkSw4V9TkPwj++kmvEBL23
         4aA6+Jchzg986B0fkJ9OPfr2JStE1meFdv/Spqg1/HBD7nqad/lvnY5jutuTGVDp2cXv
         eIKv7L4lxSCHKtDbRcwWA2Z9fQn6nPdBbiZ39chbof6HcbvtcNL6J5Km1+FainJFvFa6
         eTTLDYWRkQOYPv+59OfhwQENezP8yfXadeWsDRI1xLSLELXvV5NEBImjT9F1PZ+Jp80Y
         xJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWInsTMAqCsUkyL1LtWhTKJp/1m8/sPGpxb+me4IsFZWqLB9Ue/Be5fW7UvFh4StCyC57DfJqgtf7CBxslv@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3qdp/Ms6QYqHNTfFyTjyZiFdWM4oxGYV5fTDR+9oCOMndbdz
	rwZsbLPn1O0hyuK0FrH3iUc2RcQ1oMwBNoAF5O1PzCNyTGrX5Jr+lfzr
X-Gm-Gg: AY/fxX4E1pSbxUK0P+6zP7088QZ3rdtzzZZmxCzOs34PQPmubN2NM/Qxquon8d4JDrx
	tEXcfHL+RHxl/XrAmSOj6fCyrFufnURmU8jESTyk20TF3oZqJJclQQgd/csDR4erHLPUkO62CXQ
	+RGguwbyysOkYf4EkLyl4rO3YiToi8x+C10+jsE5NoPk2g5vllbcqYHnGv182XJcFm6Ya3q16Wg
	u9X70gDqtRsY8Qq2WDnVXHQhBjfE1BjMnNjH4HJQ1XWU3GhO01bQMyFlm2uozC6c+iqm2UDGu6V
	C28hYfNRBFuwwLxs0xEXS1gTsXTPRn8kp0uQ2u5Jxy1iYalwQpFsvin7+fnMw3je0SzCf4un4Yn
	bbh8aRWqSoPKleGrQJuDrztw6sQtUSpjCyZ1OpEWtvy+vjw0BANwnke0X3ME3pd6kzC4pFZ0rgL
	NHJlI25RQV
X-Google-Smtp-Source: AGHT+IFHqnkLVdqcXm7bGw59SVF2bpwuPS776EDpm2DBSj3/f5x17l2ZGosn+Y6e7lRKYamOLqvnUw==
X-Received: by 2002:a05:6a00:ac85:b0:7e8:4433:8fa3 with SMTP id d2e1a72fcca58-7ff6607e4demr9148599b3a.43.1766391735766;
        Mon, 22 Dec 2025 00:22:15 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:15 -0800 (PST)
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
Subject: [PATCH v7 05/31] test-dyndbg: fixup CLASSMAP usage error
Date: Mon, 22 Dec 2025 21:20:22 +1300
Message-ID: <20251222082049.1782440-6-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
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
2.52.0


