Return-Path: <linux-arm-msm+bounces-67530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69FB19248
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF98E1899416
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82E9283159;
	Sun,  3 Aug 2025 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcngqZa7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE22820DC;
	Sun,  3 Aug 2025 03:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193536; cv=none; b=VOg9HzgJ/sHDNgFEF6WMu9relIJ15T4a7QCXwwHLayDrxtWm3ZoGkqqUM83O5tfxWTq20JdgjnFuqzxVVOUUl0pK621eEm/VAkspAFYINIgVlsYYdmhgSfq0SzJtxpR2BjLEWzqEplUmpVtE7nFT3ymqqk0C+EUOf9se4V+Xdqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193536; c=relaxed/simple;
	bh=zN3cF721erymKVUNLmpuAfeG+E/WuLJrQ664eUCiPfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6Y5upu+LMRyEEQx5eLHVODVZcVKsVefXRq7J7foDjzzdGl1L2F8aOHITE5giqx8sZkQLukqhqjl8wpxc9KUaFbyyQ2yyETqbUVRc+VzUhdv2nkGmwl63HJbOFzSxvY6FuKaTsIsyg2KnY72V+flcwm5vg/swsuCpFQR+iiSZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcngqZa7; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3e3f449fa6fso30579365ab.3;
        Sat, 02 Aug 2025 20:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193534; x=1754798334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=On0sP/gRX6jcjl/izeb41d+iaYm4WT2VrxWSOrwNZ0U=;
        b=FcngqZa7qk177IHXH0UMpJai96U57W1/gTksFdBjoFyvtKD8pAMYoSsSn+bwBVCXfT
         iweNvX8xg6Bn81d09a/1QzCsnpQkzMxgoTE1co/RdJT536KOSbcCXAea8No/knGMnM/G
         edDjQoQFeo7/SmvCfeSHlr/ETBeKjm5F6z7HzCV3e8fOZIvDkoBVatJz0cinfumTaaSP
         MnpppyYnopf2doE7P0mveZ+DKNwR318K8acSQ+wIxIRlfdrifHwCIDTV9dmhq5CjNTSz
         DQJUsu0FwGE0GYM31NcumdKASoKFu4JLofDnrG7cIqdFHkig8cb51BcQyyOtFfmLH8pC
         E8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193534; x=1754798334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=On0sP/gRX6jcjl/izeb41d+iaYm4WT2VrxWSOrwNZ0U=;
        b=bUYeXWntLiuobY23oVcw3QH0WE7iwKSqPrMDovkbR3bl/iDI/XN+KWujCVylsaAawe
         g4hcYEJX97GqqxuQYEL1O2BhJsCf/KnzdV6uim30wd4dVbX+4TXGJgbTmxGjoC2atpQX
         7EEIezHmPgwtinfoNjaJbUuY2fVnooSzj8de+f50ve1Ci4FPxbky5J/1+rY954L8ZOcA
         QS0BXwSPwPiVN8kuVVvzCBpJKqXjEi+nsNZGiB/aqYYKR8EhPEZ0rMkJ/x3GWrRjOqQO
         I1i6JgaVw/417lCFin/x4zaaD0w+ihKChhthZAXkHueXwKp0bubN0EXqxs6g9L7Qj7a3
         Efrw==
X-Forwarded-Encrypted: i=1; AJvYcCUt6lIO1lvdacrkEvHmrvnodsWzdMI5O1uQN7rg5SDyJ2g6di78APRaMNIDCvogiD0G2ORlI6MdHCyav2jI@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvw4UpeemWbRjni5Mtw/nVIk9hNDks4fZYGdd9CZq1y8qHOFo
	DcorQM2rcqVIJ+R0o2fAYS6pIJDM6nBVDD7wSwlAfmvcwzleIbixN088wwO3XxQrslY=
X-Gm-Gg: ASbGncu3NPTd0XBRIoAFmQIIUlo7jhdZBRGCHZLav7khdGHGNbPHB4torzyTdz6WhSl
	WxfPk0LnWUMlPvKQ/6EbjTMcgI7iKwb3inth+c7skQVq5/scfk2o0lXBIDDigXkzTUe1CkHt05/
	7uYCNFirPU1m9F9Ye7P656oEzUZfza2WvhHvb/y+ulF9gOo/CxUdqKmd6UdinrszRiC5J5QHm6t
	I63XfHKzaqJVKqELPAlRcT3gnjeMiuDb3ewEop6OZlP+PNVAFLYw74y3TdZtCJ7gKEroQ3zvO1O
	unPLtd1gxxM6g6E1Ab5MskW/RanwGzyVrquEOtXaOCh6FD+ZBPxtACHu3VwC2gOOLWKL8gD59EL
	2ieKfbk6oLSUj8xU4EW7UuFgkCiTd54a1naolzPEadQxzv2CSWraZXwBNYS4mxa9pS2izT4o4Fr
	0HNw==
X-Google-Smtp-Source: AGHT+IFH+mtyxnkEPDbV4MUz0swiDqyakmO8hLW0D4nl3KXQPrEDdogoDGroqUg609kTHFJlSLTDsA==
X-Received: by 2002:a05:6e02:e:b0:3e3:fd25:f6a with SMTP id e9e14a558f8ab-3e41618bf21mr94866305ab.11.1754193533929;
        Sat, 02 Aug 2025 20:58:53 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:53 -0700 (PDT)
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
Subject: [PATCH v4 14/58] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
Date: Sat,  2 Aug 2025 21:57:32 -0600
Message-ID: <20250803035816.603405-15-jim.cromie@gmail.com>
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

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which effectively does the same for builtin
pr_debug descriptors; segmenting them into subranges by modname.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 56 ++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 53ce282554266..bbbdb8aba0716 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -161,8 +161,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1224,30 +1224,34 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	struct _ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		}
-	}
-	if (nc) {
-		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
-	}
+	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
 }
 
+/*
+ * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
+ * the contiguous subrange of elements matching on ->mod_name.  Copy
+ * the subrange into @_dst.  This depends on vars defd by caller.
+ *
+ * @_i:   caller provided counter var, init'd by macro
+ * @_sp:  cursor into @_vec.
+ * @_box: contains member named @_vec
+ * @_vec: an array-ref, with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
+	int nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!nc++)					\
+				(_dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (nc)						\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(_dst)->info._vec.len = nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1255,6 +1259,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1277,6 +1283,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, dt, cm, di, maps);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.50.1


