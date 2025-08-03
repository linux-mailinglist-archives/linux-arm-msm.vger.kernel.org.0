Return-Path: <linux-arm-msm+bounces-67544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99096B19266
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94D3D1896217
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A845286D55;
	Sun,  3 Aug 2025 03:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dboArhtb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97C286436;
	Sun,  3 Aug 2025 03:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193559; cv=none; b=VengCC5DVXzMSjf732O89HbZzxeOR2RGid8kQtN6nKIGM6NfTLT3wzoZXEgfiqE0C+FMnTKZUK3YVz213kKb+dM5bJaVQy8J/Y+9QXAQ84gyFkCZq9SBCOpsgpJBHXhhfKAzlTlS3e0FbYKZ72ZXei7i1P3YsxpHp6K+2BfWUJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193559; c=relaxed/simple;
	bh=Jj0f9JkUdyvI8rnvS13GD8oQmp6layChoeb3nY10K0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeQ7HT4J649SkusB2c4UjMFTdCqrVl/zo/JPwLu+NdonA6xNtmXQR+NKsJVx1UjR7RYUsdiVOfePTmev59UeMX5hbSLmTt4jxQt/r+NI862tCoFFvl9/gWPjGBhxQhXMWjdfj8tcMk9/zqK21y3Pbz/UmDYljvEMqKv/GORWdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dboArhtb; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8811ab2b559so242683939f.3;
        Sat, 02 Aug 2025 20:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193556; x=1754798356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXquqH7KII4sF+LJ1AfrwTmzreYTzxHzyyy3sHAB95g=;
        b=dboArhtb6ZK1ql8BicZPTKKBT5Dt7lI2c3kKsuGoO9Ab4CUwtveJztosLMpqUFx5tN
         bEzTPYQqWG+4gFBcgTcSjKE9KBR5mo0i575LjZqYHWmHm+X1rTLNJ6TtZqlJoX2f/Q36
         jkKCo7HEiFuIlryy1G83cVSwkcY/T16hohk1FuJN9tYVsijUUmFMOGvV3v4xNsAANzN8
         OhBoBTranx50RlWyKAJUWretEFHGWzf46bVFpFLgAGjG+Z38nhLcrL68pEak+CjvTG0E
         Jc7GPAc3cc3I29WxcSnMzv31BsNo+n2cqpnc5xpL3Y88FI5pqVK7saukbmrXjB8RQNUd
         0LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193556; x=1754798356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXquqH7KII4sF+LJ1AfrwTmzreYTzxHzyyy3sHAB95g=;
        b=lvqUxrE40I5aIlzGHcEZ/2431lapJ4GPAIr/h4dUAoiXWCr+bL4PIeKz4FAuH0+rEw
         0HS3U0CLwyfk6W/lbkEYVtBWOBd3YQpcOaVXaxfK4fYtrhyRgJwRrtUeS9a9IMhOZTNN
         vayarsvcMjtQvoRu6ecIxu814xTB/pYG7hyrqZj9meFC4MQeiyOkwPN7jjEVGMJ+XQPE
         dLyk5ViFHCcq1xpd/76evW5GZf1Tnnr+t53IXzy5CB32emR5ut8MJUHAO/ayluWhXFdY
         dAPjdg7wq8U9TIcLpxlz9M0iupXs46O8FUyQdIXR2o+F3V6LxsPGP44DPcVyRvcKJNMX
         SNow==
X-Forwarded-Encrypted: i=1; AJvYcCX4lRxMbW1a76p0qvFzu4c81JuBYQa0CrhUuJN+VAVIQRozVYwdEdtD/yom2uU9+TUrYWmnq/7q9e30Fsk/@vger.kernel.org
X-Gm-Message-State: AOJu0YwTh/JPFBsd9/45Nspb+TywqtVh+2kWBTTDm6lNgMgqEvssUAer
	L5bfV1xinR0T9USQEDz1Pq8XlDgHIKbZQJlruOYph1/Xej7H1cQJUC530jq0HVVfJxQ=
X-Gm-Gg: ASbGncs+2Mq/BS+5dGUcMh1KbnB5mAmNohNx4bnC/4HCZom37e7lJEtsrp3KrbUVlBz
	YpTFPuajybMCPitLmDOiAeorkZv+gyGYtNxRSlJpf9osivKMF+v1n8OntedcY5Rpf9NlGDYAutg
	uwGw0d8yEVocfjMIkz8l4LpguMTDRepTbwwq5XSCbSw2SD7CEbdEE0xhaDCwRJz1v0klQ+Ryo0p
	k9UII5gqDTYjmF+8zCl4Om5mV/kw4iTCb972Z+ZeGZaxNt9hcCiBdd+fCB15EFNKWF7N6T4a98y
	5BbfEWMSgGZjvzrxfS0ASDRJ+So1c0wRGBpyHjchwlGSkYZibrQ2B2cEUBCdAoKScdbTfy88BO4
	H7oDwPHZT3MasXcTu4SLZl7pW+VxTd80Wc4Hu7te0RrrSmIZAuFRCh2lKptl5LkVISTwP2k7r/Z
	JJ8Q==
X-Google-Smtp-Source: AGHT+IHEnyztiCzMLSKzxMv0/iqEKnGgfqHvaJUwVU2gtBDtmGy6WUb/KQqWprxWVGQiSsEBcFCLfQ==
X-Received: by 2002:a05:6602:6b81:b0:87c:34e3:1790 with SMTP id ca18e2360f4ac-88168313db5mr806307439f.1.1754193555783;
        Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
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
Subject: [PATCH v4 28/58] dyndbg: restore classmap protection when theres a controlling_param
Date: Sat,  2 Aug 2025 21:57:46 -0600
Message-ID: <20250803035816.603405-29-jim.cromie@gmail.com>
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

DRM has always had /sys/module/drm/parameters/debug (ie drm.debug).
Without dyndbg, this is their only control point.  One could presume
they like it - in any case its a system/user interface, ie ABI.

With dyndbg enabled, drm calls DYNAMIC_DEBUG_CLASSMAP_PARAM() to
create the drm.debug kparam, wired to our param-handler, which writes
a "class FOO" query for each bit in the classmap.  Since no new
interface was ever contemplated, this is using >control.

Since drm.debug is ABI, we should not allow class-less queries to
alter our implementation of its settings.

This patch provides that protection, *only* when theres a PARAM.  This
is the user, expressing their wish for easy control of their entire
classmap.  They also wish to trust its settings.

Classes without a PARAM are unprotected, allowing admins their
shortcuts.  No such use-cases exist yet.

Anyway, this patch does:

1. adds struct _ddebug_class_map.controlling_param

2. set it in ddebug_match_apply_kparam(), during modprobe/init,
   when options like drm.debug are handled.

3. ddebug_class_has_param() checks .controlling_param

4. ddebug_class_wants_protection() macro renames 3.

5. ddebug_change() calls 4 when needed.
   IE when applying a class-less query to a class'd pr_debug / drm_dbg_<T>

Historical Summary:

-v0 - before classmaps.  no special case keywords
-v1 - "class DEFAULT" is assumed if not mentioned.
      this protects classes from class-less queries

-v2.pre-this-patch - protection macro'd to false
-v2.with-this-patch - sysfs knob decides
-v2.speculative - module decides wrt classmap protection
		  seems unneeded now, TBD

NOTE: protection is only against class-less queries, explicit "class
FOO" adjustments are allowed (that is the mechanism).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3 - new patch
---
 include/linux/dynamic_debug.h | 16 ++++++----
 lib/dynamic_debug.c           | 55 ++++++++++++++++++++++++++---------
 2 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 2d959f1f8cd30..bc26bc9128c1c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -100,8 +100,9 @@ enum ddebug_class_map_type {
  * __pr_debug_cls(0, "fake CORE msg") in any part of DRM would "work"
  * __pr_debug_cls(22, "no such class") would compile, but not "work"
  */
-
+struct _ddebug_class_param;
 struct _ddebug_class_map {
+	struct _ddebug_class_param *controlling_param;
 	const struct module *mod;		/* NULL for builtins */
 	const char *mod_name;
 	const char **class_names;
@@ -231,7 +232,12 @@ struct _ddebug_class_param {
  *
  * Creates a sysfs-param to control the classes defined by the
  * exported classmap, with bits 0..N-1 mapped to the classes named.
- * This version keeps class-state in a private long int.
+ *
+ * Since sysfs-params are ABI, this also protects the classmap'd
+ * pr_debugs from un-class'd `echo -p > /proc/dynamic_debug/control`
+ * changes.
+ *
+ * This keeps class-state in a private long int.
  */
 #define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
 	static unsigned long _name##_bvec;				\
@@ -244,10 +250,8 @@ struct _ddebug_class_param {
  * @_var:   name of the (exported) classmap var defining the classes/bits
  * @_flags: flags to be toggled, typically just 'p'
  *
- * Creates a sysfs-param to control the classes defined by the
- * exported clasmap, with bits 0..N-1 mapped to the classes named.
- * This version keeps class-state in user @_bits.  This lets drm check
- * __drm_debug elsewhere too.
+ * Like DYNAMIC_DEBUG_CLASSMAP_PARAM, but maintains param-state in
+ * extern @_bits.  This lets DRM check __drm_debug elsewhere too.
  */
 #define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
 	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 548a82a178d49..c3e27637d9357 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -198,16 +198,26 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 }
 
 /*
- * classmaps-v1 protected classes from changes by legacy commands
- * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
- * special treatment.  State so explicitly.  Later we could give
- * modules the choice to protect their classes or to keep v2 behavior.
+ * classmaps-V1 protected classes from changes by legacy commands
+ * (those selecting _DPRINTK_CLASS_DFLT by omission).  This had the
+ * downside that saying "class FOO" for every change can get tedious.
+ *
+ * V2 is smarter, it protects class-maps if the defining module also
+ * calls DYNAMIC_DEBUG_CLASSMAP_PARAM to create a sysfs parameter.
+ * Since they want the knob, we should assume they intend to use it
+ * (in preference to "class FOO +p" >control), and want to trust its
+ * settings.
+ * This gives protection when its useful, and not when its just tedious.
  */
-static inline bool ddebug_client_module_protects_classes(const struct ddebug_table *dt)
+static inline bool ddebug_class_has_param(const struct _ddebug_class_map *map)
 {
-	return false;
+	return !!(map->controlling_param);
 }
 
+/* re-framed as a policy choice */
+#define ddebug_class_wants_protection(map) \
+	ddebug_class_has_param(map)
+
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -250,7 +260,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 					/* site.class != given class */
 					continue;
 				/* legacy query, class'd site */
-				else if (ddebug_client_module_protects_classes(dt))
+				else if (ddebug_class_wants_protection(map))
 					continue;
 				/* allow change on class'd pr_debug */
 			}
@@ -650,6 +660,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 }
 
 /* apply a new class-param setting */
+
 static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 				     const unsigned long *new_bits,
 				     const unsigned long old_bits,
@@ -1228,25 +1239,36 @@ static void ddebug_sync_classbits(const struct kernel_param *kp, const char *mod
 	}
 }
 
-static void ddebug_match_apply_kparam(const struct kernel_param *kp,
-				      const struct _ddebug_class_map *map,
-				      const char *mod_name)
+static struct _ddebug_class_param *
+ddebug_get_classmap_kparam(const struct kernel_param *kp,
+			   const struct _ddebug_class_map *map)
 {
 	struct _ddebug_class_param *dcp;
 
 	if (kp->ops != &param_ops_dyndbg_classes)
-		return;
+		return false;
 
 	dcp = (struct _ddebug_class_param *)kp->arg;
 
-	if (map == dcp->map) {
+	return (map == dcp->map)
+		? dcp : (struct _ddebug_class_param *)NULL;
+}
+
+static void ddebug_match_apply_kparam(const struct kernel_param *kp,
+				      struct _ddebug_class_map *map,
+				      const char *mod_name)
+{
+	struct _ddebug_class_param *dcp = ddebug_get_classmap_kparam(kp, map);
+
+	if (dcp) {
+		map->controlling_param = dcp;
 		v2pr_info(" kp:%s.%s =0x%lx", mod_name, kp->name, *dcp->bits);
 		vpr_cm_info(map, " %s mapped to: ", mod_name);
 		ddebug_sync_classbits(kp, mod_name);
 	}
 }
 
-static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *mod_name)
+static void ddebug_apply_params(struct _ddebug_class_map *cm, const char *mod_name)
 {
 	const struct kernel_param *kp;
 #if IS_ENABLED(CONFIG_MODULES)
@@ -1266,6 +1288,13 @@ static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *
 	}
 }
 
+/*
+ * called from add_module, ie early. it can find controlling kparams,
+ * which can/does? enable protection of this classmap from class-less
+ * queries, on the grounds that the user created the kparam, means to
+ * use it, and expects it to reflect reality.  We should oblige him,
+ * and protect those classmaps from classless "-p" changes.
+ */
 static void ddebug_apply_class_maps(const struct _ddebug_info *di)
 {
 	struct _ddebug_class_map *cm;
-- 
2.50.1


