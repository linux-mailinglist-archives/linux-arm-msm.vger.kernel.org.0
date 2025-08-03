Return-Path: <linux-arm-msm+bounces-67526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 034CEB1923F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CAA177BA2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78652280CD5;
	Sun,  3 Aug 2025 03:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzsvfZSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEBF28032D;
	Sun,  3 Aug 2025 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193530; cv=none; b=DewV66ZMoGsxFO7noBax5s9Oubvl0ytX4HHdvr5H55GaYmW+MsNzD5Hkp92KKQEPh3946j0WuFwy7SLRDmDTPuN6G1h3hf8+PEapvUyDdhEyshQPAOJKdDP3EXiDgs+3ncy1ZWVozSWcd8n7Is7gT491Q6HYoKPgxNL3/2HE+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193530; c=relaxed/simple;
	bh=hhfT9gZ7X/jSpM5Z3jfMG2zspglVJhn33CuvRKJ8vqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlqVOJFiaf4FUwQgc2aauxu8VXW938880TywWG4h2Fnd0dNxl/thaqlydGncnV0Xz/M5sRtqK9wJDwjUokDGyWzrWfprnzPKaFvOfoIQ25VDKnDUw39StK/dldaznwQzZlD8NDM8YoUU/VxWsMM+E0XRMG9yiVGrBOepENZAJKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzsvfZSC; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e40050551bso23418215ab.2;
        Sat, 02 Aug 2025 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193528; x=1754798328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuNmIbrdZwfa0pVSTeAraA+TCM/HhXLg2Msu1oHrhfo=;
        b=JzsvfZSCRBQM9aPfSQrUgepf7vTczNe7QZhx8w2uCuUcbsLCkJR4pIux/GOgr6JaPo
         mx72nPJnQxM2qlfW7n1UYDCKvwzrJ48piujMx5ksd8WfV2BEOcEV1qC6tvGFmptci1MU
         OoxwdgJQ/WocRPz/2NkkBVNKN3b7Lfi0W/MWFzfUGn3JkOwaBjQMihiQ3kviRBIlRvRW
         NhqnnUQqydjX5ueHFNn1tBdHW2siyvCzM2Hz6mNJkRsZ9w33P2lkYiJeZVjCORpZR82B
         4DE7e0MlokoxFPuZPGBhrXIEDfmdkj1bRCFArqXbAheu8MZCiPSCAqXZ0l+RnUoWGBjC
         +l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193528; x=1754798328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuNmIbrdZwfa0pVSTeAraA+TCM/HhXLg2Msu1oHrhfo=;
        b=Qot1mpr1UPMikOmjupvd0DUMRC4UU6mfjW0QmYc6JqyE09KfgHp/3STVYGlwznhsYt
         UZkEGhKlZcqpAJPWeZ+iE0DJTt019vFx/DjCbcZlBDs1/p1hwgcWFgulCyngcDwiIhKU
         YlI9NBo22y+vKSBER3nPfiOlOCnVy9w2YagCdooVpt7svRJpaBfj4iMG+BN+mIaLuoJh
         N+bUzPIqXQMvcbh0lQCvxJm+tWSkMAtt86GroUnBmtMI4NQ+cShnK0Eav2+R/1p95Jn0
         FbFgvWxXYucvj0bA3CCfcUKWhTRwaTKqctSORTcUiWYoonE6M0G4GSUAqcMFB5wuYTrg
         M2QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRukTp108FD/6xVnST8aS5K06iAwoP8MS3Buu1NjDh6YMuSN9i+6nCN/uBUC9kbnzjChAqEmyvLZZAmZCs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8e4CJuzmmD82EmGVXQXs52znWAmmXjHRkgpAQ2DINc5/Hfz/h
	B0aJvbPxsoYiwC9f0EwlSVw1H8CUwb30KMebNNAtRl3M0z7jll2gROKK/jaHODRqOos=
X-Gm-Gg: ASbGncsWQYjh1btqq8e3017JDvg4lg+NxD30tCNZ2ugsmj2tZU5GSQjuKEyX29vfuon
	t0Bx+1AD4WSaVEGlLyHZql3tEoLFGJRPoVLBL1oN3uDFyZkmkFALAM27iGdX0ghBiYsfc9L66kC
	pMjD5b4Vtv0BNEhnlMkxBmj0V2RvfG0l5KDw7G5uiwDkpFUTCns8Jlp+x5Geuwv06OMPNDXf1FN
	vhjmJGTRUfRIv5VDTHpXJ1c+za5JNs2hFeZ1gdLNtI0ZZ+7HkIhw1dA9gFAs8szVNzzJytM6Gk2
	O5Fjvxc3hM0Nzu/UHEOblTMwogKEnWMGWSmUnrFsEGnKLY96pv3vzAtXSfe5vqxUF5+xv1VTC5v
	VZTwN7xn1RRfBtvxzYpNBHyjjUtOIlPv8wARp5rJ3WGK5rY0IF8T4P80BfSQ1JpQy9amIltldfY
	SSFg==
X-Google-Smtp-Source: AGHT+IGcflxY2xQddxU8v/rmDKw+QE+rWz5yIjaVEFD/GSKgriVLCHdPf305K8rfqYkhIJesD2M8sg==
X-Received: by 2002:a05:6e02:17ca:b0:3e3:ccfe:d597 with SMTP id e9e14a558f8ab-3e41610a07fmr100947485ab.1.1754193527658;
        Sat, 02 Aug 2025 20:58:47 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:47 -0700 (PDT)
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
Subject: [PATCH v4 10/58] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Sat,  2 Aug 2025 21:57:28 -0600
Message-ID: <20250803035816.603405-11-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 96cd31c457e2e..08d095dd19ef4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -595,7 +595,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -604,12 +605,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
-		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
 			continue;
 
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
@@ -621,9 +622,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -679,7 +680,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -689,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -743,7 +744,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -756,7 +757,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.50.1


