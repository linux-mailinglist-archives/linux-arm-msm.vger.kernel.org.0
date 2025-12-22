Return-Path: <linux-arm-msm+bounces-86134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A4CD5093
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED4033038F44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD98332BF44;
	Mon, 22 Dec 2025 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFIzF7SY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3468132BF52
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391859; cv=none; b=sUC+E+Mz4h1TF0C4ZM/4KNe9zR3FNvT+sFGMeCqjigoUuMwc0wSScmaq1VwmgpyrRxtHueF6Z8BXC8CyVyxgFIkmzOuSeIEJkDxHXEVjAW+eD1RGMZWw3bS3N2NTh0MDQ4ekhPWSj/BMTsKbir2tNafPjYm0l/TmvPPOAkMOPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391859; c=relaxed/simple;
	bh=lMCW/HO3dpm3FiqsuiIdY8qF5JU5ohZP1EB8BC3NbAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diTfEI6Y177MF0lrS7CslJaXBaZF6DxIByb+8jfQocul6B5YvYtzLFw7NEi5CSu3+fRcMr0fOhB6b9lltycWxs8Dz9hs8KY8WVioO8D9eOnEqZw7ma4jEd4Ca/ulWsFEkndczKT77w0ZaPI9+ygh2z6arBzbBnid5e4rWeCN/qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFIzF7SY; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo4232739b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391856; x=1766996656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
        b=cFIzF7SYK7JSu/yGr52anyOwTe4C1ICsgSTxEHKG7k/RHPxZLoLHOwlMYLHW6AGhOQ
         cqjgg3vuVB3Lzzmbe5tPl9lqkx9ebl3LU9rXcbkNhX9acyIZ2cZXRpMVPwSr6SufA+Qy
         d6dRP9yEDvPTIy1xE1kOBIGg1hj8deBwgLd8n4fK6QRc8tORMY0DejP96rRBHKnGZSy+
         YtWCAfXmTe2jP50ys0Q3JOuWiQC/yknfTqI+Wge0pfL4ZOlaSfLjj9S/JNkoYkbvJmV2
         FMmeo9YQdltRmBLtzBipsUhiSjHoM82fgT1/ONhqvMZdRQh/KVLFN5tPu5QqVtk5bcXj
         1+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391856; x=1766996656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
        b=r5JhlBUxp2ROkSu1A1D/OYOvwlqgh1ga5KF1UN6juOnvxgTEsGjrSUG1aX+7ZvVurV
         er93xihOtaFLnpf98oxrxCMUF1GLN1kWisJb06MHP2xoL011Whsvmrve4PQqVTsoTp80
         PikvU+00KInfRoQekCK/VSliMYdZqX/B2e2Y3cDIdeYoMukP/wCHZ/R0YYDP5rI+SAHA
         fUrch+QNEmYjfnqfjgn/FDuhqOAmQkVBJzjWBcwJx3gRtXoLB7FeHDYydYYU3ZYUTZFv
         mJIH04iKbGmQ8zfrvKFaaH2uhzyxVA/V5kbuCNbr5bw0fJf/D7WNRDi72d1mbVrTbzg3
         q7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCViqLrRZEpJQqG2ICNQyc6XMVcNkZ4A1xtn+sfMMgHKJaIM6kPKOlSdioOjY40mWMylCoxXinWZDnK5Epwf@vger.kernel.org
X-Gm-Message-State: AOJu0YxywZWhSvkbZataWHHBmBZv6FBFxX5KwGImY62bjRs+UEAwEXYj
	g+YsiFfoIIf9ZYpJnY2UEg4WU8cBV8we98uFYjjhpG/XCu/uYlVmsvrA
X-Gm-Gg: AY/fxX4tbmH2n5SrOjavWtOSmuFem8R37gNNEIijBekA3g887yZVt7U68noT7JM6KRG
	1cXLb95xbJDAcgBjPFqhpXKFGkGJ0EscrwhvyZK7T/xmIE6GZKzeam1iL7z3ljFBsc7hUw8jBH4
	3tuDWaJTU6rhGSLOrScK07apSWJph5IuifmEePB0Ib3MPmga1ZWET4phLdrx9eB5M3e5WUAFvl0
	Zr6/Y/af5a+Hk5vZZHMzapJdX2s4XDl0wYSQSU8rTBvAXxpcDrXOzqahZl5Mf7yvG/v1AeVqNDd
	y455GQa5xr87TTs32KTMEHDppnohf29hb47qgc1bNQpSSWeT10d58RUK9JuvQaFvWAEdhTlLYSP
	pS6DgzMuNq5/S4OGVOgF+f/g87E+2uctj1ceqACqwjJleakM8EuQEiHwoMj1Ny6MFLiz/ehGJFf
	P0yvslVxUy
X-Google-Smtp-Source: AGHT+IHhfCBl2Gb658Wb5nP4VimtUGUrU6/VY0t3P4zkMX/95OPPHKG9Ys2L2e1xsI+aRFKPN12sQg==
X-Received: by 2002:a05:6a20:9189:b0:366:14ac:8c6c with SMTP id adf61e73a8af0-376ab2e8f52mr9605414637.66.1766391856304;
        Mon, 22 Dec 2025 00:24:16 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:24:15 -0800 (PST)
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
Subject: [PATCH v7 16/31] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
Date: Mon, 22 Dec 2025 21:20:33 +1300
Message-ID: <20251222082049.1782440-17-jim.cromie@gmail.com>
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

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
reordered params to match kdoc
---
 lib/dynamic_debug.c | 57 ++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c9377a444fc8..d668140794ac 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -170,8 +170,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1247,30 +1247,35 @@ static const struct proc_ops proc_fops = {
 
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
+ * @_vec: member-name of a type with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _sp, _box, _vec, _dst) ({		\
+	typeof(_dst) __dst = (_dst);					\
+	int __nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!__nc++)					\
+				(__dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (__nc)					\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(__dst)->info._vec.len = __nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, cm, di, maps, dt);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.52.0


