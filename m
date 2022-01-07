Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55244872B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 06:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346252AbiAGFaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 00:30:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346186AbiAGFaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 00:30:12 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC50C061212;
        Thu,  6 Jan 2022 21:30:12 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id m4so3844940ilf.0;
        Thu, 06 Jan 2022 21:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLyZe+zqEr28zNe4xKfsfPFT08eh4jYXBYI+HMn/i1o=;
        b=aab8Shi1gVQJ7GTizRPNRon73x/TgmPaLmEmERosCRUO/w2C47+MsLojqFv7cY2BFa
         dz5HB9pwP0blHrgSvuMI2wy7RyMqwfs6aUlSlThy85prA0y2QVNpw1OsgX1oJnA4nPpE
         0Rha5Qx59HmnhO6hgvaYPqFFb0YYLyk2D373LCAf102S61Ol1E4y9C3saaaFCJ4/rUgj
         UcMKwydoScFgatDAK3PfF8Ker8hJLhX9aRI/Ci1k6u4Shbn7NaBp1FLjDcu+T5ucYuD8
         POQZ6FGj+i22fW0G9pETJwbaQKhVXTVqIjUH0lU/e5ijkoeCCjVYidkGCqqWPjF/0oVy
         wXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLyZe+zqEr28zNe4xKfsfPFT08eh4jYXBYI+HMn/i1o=;
        b=dO60ErG4QiVQigNLbpm4ijjA3P01T/9YvDhk9wSAFwgjF4g2HPMsjXTYOJNsiN1KkE
         3pz3Rtj6L8NaUcQ0Oq0UK/koZm0VIIHA3PBPdGkJ80P7oao4eukb81pXH7yOLce/KkHz
         JSFQoJqA+pzga2ejsgOsLK6mQEyEGY9vWMVIFZ37X1QRrGRPh2CYEw8mrrrsEGDGPxMl
         bajtAc6tz9nJKV6Pz0sMsENIOLVg/gJM7DuyWEygQkcSBXlIV5kiA68tttJwefMbFRpx
         7DngMl9I66Fkf+o1sRWeUAprbPHgbOz4n4k0F82zpId12BhtmIus0n0j4KxBD3AxmFdp
         mshA==
X-Gm-Message-State: AOAM5306h5ZqqPx92IESWphP8CuRnAoBBuR5xsLFbWBDLQlBGiVY0dTk
        wUz2KlKAnffoqo4QUa5WvTs=
X-Google-Smtp-Source: ABdhPJya09sR3zYcLyhJ2X2tUElbcml2PEfFZFC4rQHb+JD4zfRwDEJZy4pc64tj1n0Mr+SqKaRLug==
X-Received: by 2002:a05:6e02:501:: with SMTP id d1mr28614110ils.285.1641533411913;
        Thu, 06 Jan 2022 21:30:11 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
        by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 21:30:11 -0800 (PST)
From:   Jim Cromie <jim.cromie@gmail.com>
To:     jbaron@akamai.com, gregkh@linuxfoundation.org,
        linux@rasmusvillemoes.dk, rostedt@goodmis.org,
        mathieu.desnoyers@efficios.com, daniel.vetter@ffwll.ch,
        seanpaul@chromium.org, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     quic_saipraka@quicinc.com, will@kernel.org,
        catalin.marinas@arm.com, quic_psodagud@quicinc.com, maz@kernel.org,
        arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com,
        jim.cromie@gmail.com
Subject: [PATCH v11 18/19] dyndbg: add DEFINE_DYNAMIC_DEBUG_CLASSBITS macro and callbacks
Date:   Thu,  6 Jan 2022 22:29:41 -0700
Message-Id: <20220107052942.1349447-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DEFINE_DYNAMIC_DEBUG_CLASSBITS(fsname, var, bitmap_desc, classes..)
allows users to create a drm.debug style (bitmap) sysfs interface, to
control sets of pr_debug's according to their .class_id's

1st, due to a recent commit, this already works:

   echo "module drm class 1 +p ; module drm class 3 +p" >control

With the macro, this is basically equivalent:

   # this also turns off all other classes.
   echo 0x05 > /sys/module/drm/parameters/debug

To use:

DEFINE_DYNAMIC_DEBUG_CLASSBITS(debug, __drm_debug,
	"drm.debug - bits => categories:",
	/* vector of uint:4 symbols, ala enum drm_debug_category */
	DRM_UT_CORE,
	DRM_UT_DRIVER,
	DRM_UT_KMS ... );

To support the macro, the patch includes:

 - int param_set_dyndbg_classbits()
 - int param_get_dyndbg_classbits()
 - struct kernel_param_ops param_ops_dyndbg_classbits

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.

get/set use an augmented kernel_param; the arg refs a new struct
dyndbg_bitmap_param containing:

A- the vector of classes (drm.debug "categories") being controlled

For CONFIG_DRM_USE_DYNDBG=y, enum drm_debug_category is initialized
into (struct _ddebug).class_id, so its already available to select on.

B- a pointer to the user module's ulong holding the bits/state.

By sharing bit-state in __drm_debug, we coordinate with existing code
that still uses drm_debug_enabled(), so they work unchanged.

NOTES:

param_set_dyndbg_classbits() compares new vs old bits, and only
updates each class on changes.  This maximally preserves the
underlying state, which may have been customized via later `echo $cmd
>control`.  So if a user really wants to know that all prdbgs are set
precisely, they must pre-clear then set.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 45 ++++++++++++++++++++-
 lib/dynamic_debug.c           | 75 +++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index e9483cd9ac1c..318ac44a0d4a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -20,7 +20,9 @@ struct _ddebug {
 	const char *function;
 	const char *filename;
 	const char *format;
-	unsigned int class_id:4;
+#define CLS_BITS 4
+#define DD_MAX_CLASSES	(1 << CLS_BITS)
+	unsigned int class_id:CLS_BITS;
 	unsigned int lineno:18;
 	/*
 	 * The flags field controls the behaviour at the callsite.
@@ -202,6 +204,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+struct kernel_param;
+int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg_classbits(char *buffer, const struct kernel_param *kp);
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
@@ -248,6 +254,43 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
 	return 0;
 }
 
+struct kernel_param;
+static inline int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp)
+{ return 0; }
+static inline int param_get_dyndbg_classbits(char *buffer, const struct kernel_param *kp)
+{ return 0; }
+
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
+struct dyndbg_classbits_param {
+	unsigned long *bits;		/* ref to shared state */
+	const int classes[];		/* indexed by bitpos */
+};
+
+#if defined(CONFIG_DYNAMIC_DEBUG) || defined(CONFIG_DYNAMIC_DEBUG_CORE)
+/**
+ * DEFINE_DYNAMIC_DEBUG_CLASSBITS() - bitmap control of classed pr_debugs
+ * @sysname: sysfs-node name
+ * @_var:    C-identifier holding bit-vector (Bits 0-15 are usable)
+ * @desc:    string summarizing the controls provided
+ * @classes: vector of callsite.class_id's (uint:4, 0 is reserved)
+ *
+ * This macro implements a DRM.debug API style bitmap, mapping bits
+ * 0-15 to classes of prdbg's, as initialized in their .class_id fields.
+ */
+#define DEFINE_DYNAMIC_DEBUG_CLASSBITS(fsname, _var, desc, ...)		\
+	MODULE_PARM_DESC(fsname, desc);					\
+	static struct dyndbg_classbits_param ddcats_##_var = {		\
+		.bits = &(_var), .classes = { __VA_ARGS__, 0 } };	\
+	module_param_cb(fsname, &param_ops_dyndbg_classbits, &ddcats_##_var, 0644)
+
+extern const struct kernel_param_ops param_ops_dyndbg_classbits;
+
+#else /* no dyndbg configured, throw error on macro use */
+
+#define DEFINE_DYNAMIC_DEBUG_CLASSBITS(fsname, var, bitmap_desc, ...)	\
+	BUILD_BUG_ON_MSG(1, "CONFIG_DYNAMIC_DEBUG|_CORE && -DDYNAMIC_DEBUG_MODULE needed to use this macro: " #fsname #var)
+
+#endif
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 419d4664e724..40ca7973a0f8 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -610,6 +610,81 @@ int dynamic_debug_exec_queries(const char *query, const char *modname)
 }
 EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
 
+#ifdef CONFIG_MODULES
+#define KP_MOD_NAME kp->mod->name
+#else
+#define KP_MOD_NAME NULL /* wildcard */
+#endif
+#define FMT_QUERY_SIZE 128 /* typically need <40 */
+/**
+ * param_set_dyndbg_classbits - bits => categories >control setter
+ * @instr: string echo>d to sysfs
+ * @kp:    kp->arg has state: bits, map
+ *
+ * Enable/disable prdbgs by their "category", as specified in the
+ * DEFINE_DYNAMIC_DEBUG_BITGRPS.classbits argument.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classbits(const char *instr, const struct kernel_param *kp)
+{
+	unsigned long inbits;
+	int rc, i, matches = 0, totct = 0;
+	char query[FMT_QUERY_SIZE];
+	const struct dyndbg_classbits_param *dcp = kp->arg;
+
+	if (dcp) {
+		pr_err("set_dyndbg_classbits: no bits=>queries map\n");
+		return -EINVAL;
+	}
+	rc = kstrtoul(instr, 0, &inbits);
+	if (rc) {
+		pr_err("set_dyndbg_classbits: expecting unsigned int\n");
+		return rc;
+	}
+	vpr_info("set_dyndbg_classbits: new 0x%lx old 0x%lx\n", inbits, *dcp->bits);
+
+	for (i = 0; i < DD_MAX_CLASSES && dcp->classes[i]; i++) {
+		if (test_bit(i, &inbits) == test_bit(i, dcp->bits))
+			continue;
+		snprintf(query, FMT_QUERY_SIZE, "class %d %cT", dcp->classes[i],
+			 test_bit(i, &inbits) ? '+' : '-');
+
+		matches = ddebug_exec_queries(query, KP_MOD_NAME);
+
+		v2pr_info("bit-%d: %d matches on class:%u\n", i,
+			  matches, dcp->classes[i]);
+		totct += matches;
+	}
+	*dcp->bits = inbits;
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg_classbits);
+
+/**
+ * param_get_dyndbg_classbits - classbits reader
+ * @buffer: string description of controlled bits -> classes
+ * @kp:     kp->arg has state: bits, map
+ *
+ * Reads last written bits, underlying prdbg state may have changed since.
+ * Returns: #chars written or <0 on error
+ */
+int param_get_dyndbg_classbits(char *buffer, const struct kernel_param *kp)
+{
+	const struct dyndbg_classbits_param *p = kp->arg;
+	unsigned long val = *p->bits;
+
+	return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", val);
+}
+EXPORT_SYMBOL(param_get_dyndbg_classbits);
+
+const struct kernel_param_ops param_ops_dyndbg_classbits = {
+	.set = param_set_dyndbg_classbits,
+	.get = param_get_dyndbg_classbits,
+};
+EXPORT_SYMBOL(param_ops_dyndbg_classbits);
+
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.33.1

