Return-Path: <linux-arm-msm+bounces-86132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03CCD506A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38C023007C62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1BC32BF38;
	Mon, 22 Dec 2025 08:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCsBOAoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBF532BF52
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391837; cv=none; b=FrtF/HyZiV/StC6Vpy65VUeDvytC6fcdcmpUACcAxz2MPxHkOB/nkEO41s1kDUGj58xeMVwCQX0g169BfudhsQp716gmREJCW+6C5Px3PZBw97+2qMrtrbw7Tn8NWmR61T3oXuc5WK9nqzxd+JN98gdE78a7mC34RPx8d/iIJc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391837; c=relaxed/simple;
	bh=TSXDdRzLQdSbpJpDeZuG1st+znW3KridOVeec5hbkSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVOOF/F5c7hhGU7iZQTSgnqzc/7P8TYgnb4eTiwnTWr7hfcRRR7iEcoeSOfRsOPyhSKVmYykRbZqvHie+Zi5butY4o4rS15dug8lWKVRipgjiCHq9amprKlb30Syz/TwR6jjdPicY4+7xlVdXAoWWQV1qUxMpQD2cBkCYDhXMyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCsBOAoF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so3372678b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391835; x=1766996635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
        b=hCsBOAoFoRD4TngWlnnKQwern90yrvb2aOcUW4tC1rP+85MSgSivnIwpnUhLJ9S/v+
         gcqNE0biYVRDzps6RQBILeW8KtOOnfSjYh7zmoQarLi5w5Sc9f0eXUnjcgCS5VuqSXml
         57SS9ogsx72X4H9h/1zfhszBMzuxgcC+etul306UIejiB0MhOTUhkn7J5R1TNHySjNkE
         yxF7YW6CCOZfgydIvR/L/oi06x10K1anRW9amUHaE4JqbfOmT0+KChnC3bDdpfy+kzZC
         KvzWMMoOYyX4u0O3/3NtVelraVeyrNAvU9HBdsiE9dE3Zoiq0WomHn91V69lVPf56Poy
         i4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391835; x=1766996635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
        b=SbyrgmFlqwx4/m2fyPQSLwkxCeC8naSO9uJ8z2wZ2u8q2ej8Dq5qzPhe5MbX1CbSiw
         Z0Bb6yQfdrSPIKNeKpJ2bjSnvDp2sljsGG+X8mKt5iElYFyrQWRflaY9oF0EbjbiQ61C
         ApTY3YkRml5glWixqIq4Gry1Vhb16gI5UADFJ3EOjCGnpa3mzoW4x1orrtiPoYB/tAlG
         oUnu4t4bMZ41z59Ph/NemDh1ATdkFEjXsAXiJV7i0rRSFetgY5gaNbz8YMyLTp7k97ex
         Wdq8BwGo1q0/zKtXqfEpuf+xXLszqW/WADLqVJaQsJ4sT+WY1eF4XCjtfGVAqAow51Nh
         V+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCV8USEV6Lo8cO6V14RNUWO2ZwmHsmz+xTe23pWhtzMwXlX2KQcgOOic8sp7KUgR8WWFiVvB8cYXCmpKdnZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7OMm+I1GkAX0mzflKotWGWxzUoSLyyHoIUnGOxs3DhlUefoz
	46nf2XL6CdDRQtRkYEf/5+a7RNo9W5WVxI6jwhSJfQBBt0aBV1SFLCww
X-Gm-Gg: AY/fxX79Q2fBeyxOuNPabE04XMv9EkfOtZZSHoNSnTNRiGlDVqnb/8mukrStFtYPKNw
	Qu6lh0F79e3GtMZw1ogBWOJDqp9VpovLFBAqsDsFUNLN+Gj6xVSIrZSZc+i9LS71UMpRSeVPMOu
	dL1bDZn67LmdRpfZd616J0Ijrbt8X6vUEa7AKxVwpS58zIxb+2X8iyvXCIoV1m8MVxB21a8s+QE
	4FTCfG7fl/HP9ujWSbM32r0D/O+QnuTxg45s+IH8jQ86ONPmdrUT121+Dp+rJqm3bjJ+1PSRUDA
	wnu3AiwtE7ZjPK1kOwwT8qVgZCOuVedPErvaRNu1zYe39gqB12ksUaqggW1QhHBWf1OHHEHVnz9
	NaMb1hTXFj4iqGD4Uku+McctiWrB5c2gWmiwlmPsKrcuFA1pf2Z869CnfAbTfKChiWbgJTtKFeX
	b3egGnHVdB
X-Google-Smtp-Source: AGHT+IG3YmZUn1fIw8AIHp6/BoEQn6TWZyV7OX1XFc8bda2F0fMuKJyfzHy5p7UhK8SexT3coe1cvg==
X-Received: by 2002:a05:6a00:302a:b0:7a2:7458:7fc8 with SMTP id d2e1a72fcca58-7ff6421511amr9110070b3a.13.1766391834813;
        Mon, 22 Dec 2025 00:23:54 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:54 -0800 (PST)
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
Subject: [PATCH v7 14/31] dyndbg: macrofy a 2-index for-loop pattern
Date: Mon, 22 Dec 2025 21:20:31 +1300
Message-ID: <20251222082049.1782440-15-jim.cromie@gmail.com>
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

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

The macro needs a lot from its caller: it needs 2 local vars, 1 of
which is a ref to a contained struct with named members.  To support
these requirements, add:

1. __ASSERT_IS_LVALUE(_X):
   ie: ((void)sizeof((void)0, &(x)))

2. __ASSERT_HAS_VEC_MEMBERS(_X, _Y):
   compile-time check that the _Y "vector" exists
   ie: _X->_Y and _X->num##_Y are lvalues.

The for_subvec() macro then invokes these before the for-loop itself;
they disappear at runtime.  They do cause a "complex macro" CHECK from
checkpatch --strict.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e882e951d585..94d05d09a128 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,28 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define __ASSERT_IS_LVALUE(x) ((void)sizeof((void)0, &(x)))
+#define __ASSERT_HAS_VEC_MEMBER(_box, _vec) ({	\
+	(void)sizeof((_box)->_vec);		\
+	(void)sizeof((_box)->num_##_vec);	\
+})
+#define for_subvec(_i, _sp, _box, _vec)			\
+	__ASSERT_IS_LVALUE(_i);				\
+	__ASSERT_IS_LVALUE(_sp);			\
+	__ASSERT_HAS_VEC_MEMBER(_box, _vec);		\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -155,7 +177,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1231,8 +1253,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-- 
2.52.0


