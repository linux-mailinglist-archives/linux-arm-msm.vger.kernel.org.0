Return-Path: <linux-arm-msm+bounces-86130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 280EFCD5036
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B3D30057C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF88932BF41;
	Mon, 22 Dec 2025 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CViw27Kw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F4032BF42
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391814; cv=none; b=DmQD0CkUL9XGjyS0Mhl5OWM9poKg4lMeu+Gk1eqxiC9ARGaVfRJtZGGh7eaBLzLcF7kyNWdVVxohysrEz/yT8qJrzVk+lX+vN3c/sCA4SXpfPUKC0iBcZaAbbr8VZxRZlK9o4Of0gDcrnQKSUdmUC1UaPhtR5RtxmMWCXDTj6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391814; c=relaxed/simple;
	bh=KZmY7t1nCms4fl3dBwXkSTLPAQxgaCZAAwmDCUvbFS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfIo4GiWqcQ2q0dv4WnGnl78fu2QOLN4r/4v00Gcrl2NSzp7ogilFzbW6FqjUY38CXRx4AQ6RcHQHqwIw0mHBhOaV3LK444Pd2g/DJLr06cDqUm1HMcl3XM2JiXyFE5+CAOzx8fWSz5AIbk1x2jEt6/satRA9jiE7DyI9oWTqLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CViw27Kw; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7b9387df58cso6063119b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391812; x=1766996612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
        b=CViw27Kwcuv9yFpvGGiYgpdl1nW9v70w9F5vaiKbElLRtv3UxJq9tvAxSPnnSf5cNI
         zhusKOQRvbi+Vi2p8n7fFIhYT3KtHRTXxCyQMKNWid6cs/Q7eubBd6YtmohJDPYAqq6i
         WU6lfA5ryVy2Yf2kvodFrCCWKumdO5GfjTmIWx074oFYK0/8/w0C0I9g+NZ6RGjsJr4o
         eDUYFZotBR9et9b+hf1y7kyO2rNQGFxmJvLxV6fQQi6Yn/XIpgtQmDad5oFvS6T8T5G8
         lxVDlqQTpVSsEBnZBKe4Ic4mWRPLe7uoT+uQHKS5Ax2qihLjdniNqg679gASYn3VVkkf
         u42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391812; x=1766996612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
        b=onvXyTvIKVBJ/QyApgtxXDCyOjg3y/VeO3gqgbhJhmubqeoi+A87772Gb6yYog/Xdp
         Eu2hb3TngwehTHhLSL+u849i4tNOyN9dpZmkuw9ghrV4/i456QTsDMEiBsXfnKyINxbS
         IxBaBqsy4OilEbRpdO5oSw3py6P5ukNUqP2ojJbIrBW3bEWiwd350s4I+UBjDWKDyuw7
         esodFXvVXqIbNcU2E+nI+9aEqGyPxuLA0Otzqgomy/thyZAedw9m9NpwfC1Eq8qKTNk1
         S6LOk27fxRltphMa3qBaja7PkEqrRyJqHAwuxeVrfxfUWu+/iMc106HwMn7J/1WWS5Hm
         dzpg==
X-Forwarded-Encrypted: i=1; AJvYcCXtP3T3/w8xQ2FpZJ8lWvqOKy1oQ8PC5oWhUNlEV5+PttbIi0+wyPhQQaTOHggCvOIrhE2EtZcJnYrSIbLW@vger.kernel.org
X-Gm-Message-State: AOJu0YxNivD4ijhVgXGRDbZM//9/k9xsQ8tGuaYDi6sYDi29PTV0+Pfs
	KlYaoxdFMZyO2bN/ddILT2ZkFtHV7zcWM87JxzdzSXQdQncbeEx4Sh6u
X-Gm-Gg: AY/fxX4CakQrZanMuwdjahGbjUmwa4+Efn4s4zKiJMgfh/JzdotTL1ZDo2vXjmQPVhF
	pOwCBrGPOvx1mtEy39GK70j19fZ90km961FR229MqaY0x0WaaV/wkKhRsbaGvFJobfCMG+xvq8U
	s+AF5ansxfPNpeFwEl+1d1fvaSXJTWLnfxIxFzJvn+E6RGhXwwsI/oKCAn1yuSSslY7EUNxDZen
	/u8oTXFRZ857XCZdT9Gw+/SL0vD/0nxcLaU/31hLVUSL7ewPEuv4PB8J1+zjiED0uEgLJcO3/HO
	Iq7c32NGZUXjlNQaELFCBeyKjhJCboXaVZzMruIYHpbKhIge1THutWKhmr1zrPz5dbrZFD3bvlg
	m1mORxz0rEYaozZMnxjMHvakRzVn6In8dl96aOrHAvK5j+ta8kV/76xm5ETMJ89d+3YXHNnLrwW
	yAX13bZIjh
X-Google-Smtp-Source: AGHT+IEAZMs9QfUDe2we6n2g+FitaNoCAtMAvZyB3nOYDQz1xn8UTnE5egrQpYntQN6837WRTsLoLQ==
X-Received: by 2002:a05:6a00:3309:b0:7f0:665d:efd8 with SMTP id d2e1a72fcca58-7ff6705d34cmr9495645b3a.67.1766391812599;
        Mon, 22 Dec 2025 00:23:32 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:32 -0800 (PST)
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
Subject: [PATCH v7 12/31] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Mon, 22 Dec 2025 21:20:29 +1300
Message-ID: <20251222082049.1782440-13-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 64d69f5cba1b..db0559763e60 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -606,7 +606,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -615,12 +616,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -632,9 +633,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -690,7 +691,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -700,7 +701,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -754,7 +755,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -767,7 +768,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.52.0


