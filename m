Return-Path: <linux-arm-msm+bounces-86129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8CCD4FD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 518203004F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E8432BF41;
	Mon, 22 Dec 2025 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQpXerb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C032BF38
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391803; cv=none; b=Um0nfDYZ4hISd0HBKR2RMd00epsDAO7NSoB1JPtasy1tm/Dr4nnfFCvQU9HcTX22UioQyIrYq3bxq1TSJzgz39J/2SWrQCimNlOVygoEFCIjj7nBOjedtxVEs8Zi1PLSR/qJDnSn05NWqAtdIV7PjXTqB84SDgBrn8c3PxgBwtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391803; c=relaxed/simple;
	bh=vg63sy7QbWL0kibdt/FXOXuPKUSSpfXUoQuv+kiBi1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kF3PywjuMKtQqlH+5A5CTGzYvmpaFQ/uC0YU4iIE5IYLtdgahFcjCi+fRdOK6XRwXpnh4+DmRDJUnKqFzAMOZFVbUfHbwOgIUVQMul9F52XLn/wYT1vkZQzVZskGy9/sY0zC9/nWb9iEDGGty+Yq0BckvhRG1YJcVoM3Dn0MmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQpXerb1; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso5190973b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391801; x=1766996601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=;
        b=PQpXerb1yhyWcQGNZ2TvYHb+HePf1/fCKB7NR6YwM0dSjG/308EoVEsSEASnryrmKq
         CDaJIfeS+OzVUziBpC8EmJr9qQ8VixCP0toQfT9voiakThI/8d9svWR08jSSfsGek0BL
         9d1CpHNVHtq+iI0Jhdwu7qYkBt8ITPtu8aEfLAbgj3aNbt+krSSuY9V2qA0PR6TOjQgW
         S5ahTAbAx121g4ErYiRqvnY5zVksQ+g/TyRcHld2dlJ0NQ1LQCuxe1yzw4wmWgzRlbZa
         FNi4f7x2E/1I1CdenivqWqRimAh1k6FktKlpLXD+4529wk8/Q/udgzbwqI7Iy0n+sdJO
         pdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391801; x=1766996601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=;
        b=mPS7y/6iYSPHn58CvYH/ASNCAhSuHyNn+ucOrflxfq50PNIbGwTZYvCC+aieCRtFzn
         3UcoW/laQ+A6nlzECCk3KIcqD8ABo5yn4LTvu3vz0O1qrFsGINO9HromR0ScJ1IcANWG
         GWqIdJ9R9TuPYfNyNNjXIXdLSISQcGUnc79B2z2/p+rndfF6vVojZwmi81cBKob/C+Oy
         2lBDOYhN2Zy9fsNbogzeaoqQxZzXxlVBu3RrUiu15xm2WUafLFhoU0PGVcDmIeqbOYkx
         SmMUjIl+RjcqOkUFDkqWa/8tj7bHAPtd4MhCvMioo7c5yIB+wZPe611ee8G39PErFmEh
         5tOg==
X-Forwarded-Encrypted: i=1; AJvYcCVyWE+wZEzMt3mFvM0BgJuUBBnSwqs49L+tfLny4Mo8L+WeZZOcsjtzwZO4pB051I/jLOOkpbVBCpqxSdUZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6jiX7z7KIiM6W/KMVEIK2mbjTdo2oPCokmch+SeCbJtMZjvZK
	Z0keZUpyCClz0EEWamgq1k6rjJt+jkh/eGjvD8Yol6FLZwVllq7CA6x1
X-Gm-Gg: AY/fxX5q/mALTK+cOz/WKArNB2gEZ2hR7rQWX6fihrMkGPodNwO6fUyz9uvfYPmPYwx
	76+RYKzALzAORP/c2O4MMDmXhYh3IBOKVloUjvFZnpzLRHQxaAqqj96AfORjpnKo8RUhiDLi7Pl
	iX1WTVO8A6hCnVUIVGXDDtzakHvHnd4X8oeEQtnIJVL+zyLnCsbcvkZE3mtFhFpKvrZzert0Pdv
	k/yhV0UnjaWJcVCm8QvaO5e7JK/WcYB5nvfdPPLdar/01O3HDYVTYUhjEDEiS+vusnQW5BJl48n
	EbnlEtl8llT4fmGWRb1SK0f6lJxicJemigcXqTtIj892qgehFwQsbvqX/q87wN5ydApdCX9wPNl
	nDCYCwHOenHSEh0MACYT0jGz7imqdsd/948euE/SK6l4pjlGGj7jaeqGInmCfYuUm4/FO2jVc59
	Su8/rdKo1e
X-Google-Smtp-Source: AGHT+IGzQX0tN2JfceE4PO7awRUVxocYlOqPauoRRHBHZG89mr58gOjfvOVdijtg0YzN15AwLAVPpw==
X-Received: by 2002:a05:6a00:1d27:b0:7f7:1857:8456 with SMTP id d2e1a72fcca58-7ff6667cdb2mr8429960b3a.55.1766391801376;
        Mon, 22 Dec 2025 00:23:21 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:20 -0800 (PST)
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
Subject: [PATCH v7 11/31] dyndbg: refactor param_set_dyndbg_classes and below
Date: Mon, 22 Dec 2025 21:20:28 +1300
Message-ID: <20251222082049.1782440-12-jim.cromie@gmail.com>
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

Refactor callchain below param_set_dyndbg_classes(1) to allow mod-name
specific settings.  Split (1) into upper/lower fns, adding modname
param to lower, and passing NULL in from upper.  Below that, add the
same param to ddebug_apply_class_bitmap(), and pass it thru to
_ddebug_queries(), replacing NULL with the param.

This allows the callchain to update the classmap in just one module,
vs just all as currently done.  While the sysfs param is unlikely to
ever update just one module, the callchain will be used for modprobe
handling, which should update only that just-probed module.

In ddebug_apply_class_bitmap(), also check for actual changes to the
bits before announcing them, to declutter logs.

No functional change.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 65 ++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1db2f627237a..64d69f5cba1b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -604,9 +604,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -614,7 +615,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -623,12 +626,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
+
 	return matches;
 }
 
@@ -683,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -693,7 +700,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -707,18 +714,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 	return 0;
 }
 
-/**
- * param_set_dyndbg_classes - class FOO >control
- * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
- *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
- * levels by bitpos.
- *
- * Returns: 0 or <0 if error.
- */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *mod_name)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -755,8 +753,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -769,7 +767,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -778,16 +776,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
+/**
+ * param_set_dyndbg_classes - classmap kparam setter
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * enable/disable all class'd pr_debugs in the classmap. For LEVEL
+ * map-types, enforce * relative levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
- * param_get_dyndbg_classes - classes reader
+ * param_get_dyndbg_classes - classmap kparam getter
  * @buffer: string description of controlled bits -> classes
  * @kp:     kp->arg has state: bits, map
  *
- * Reads last written state, underlying prdbg state may have been
- * altered by direct >control.  Displays 0x for DISJOINT, 0-N for
- * LEVEL Returns: #chars written or <0 on error
+ * Reads last written state, underlying pr_debug states may have been
+ * altered by direct >control.  Displays 0x for DISJOINT classmap
+ * types, 0-N for LEVEL types.
+ *
+ * Returns: ct of chars written or <0 on error
  */
 int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 {
-- 
2.52.0


