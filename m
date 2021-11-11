Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0590A44DD9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 23:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234353AbhKKWFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 17:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbhKKWFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 17:05:31 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE12C061767;
        Thu, 11 Nov 2021 14:02:42 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id v65so8790509ioe.5;
        Thu, 11 Nov 2021 14:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j4AHIH3+iKmiLKBkiSxRSPFDuszb5yqNv9CqYiGv6ak=;
        b=hxvFftfnE5haOpz0aJ+pW2wAk75YEg9pG+UCUIpeJhJf7kcdNqz8DsYbsAHFNHlnq6
         kX2kKmrSZPgpx6ALddAbK1VZm6ui7Mg9uwGRfx35DQNhFV/JEeuFkxQ1dTUl8pvFc6c9
         r0A8Rz4I9uX9zYnPJb6Iy6w/qy7qGrTpRbgQWm3uHl8tDaTqk19KV4k6HuEaSDppowOd
         DKLFO6SqRMA5jTQyjPZkTv+sufN1uEBSXQp4aU7uEgLWEssxj7wBy+oPrJBYsp0K4E8/
         nXYpuEMShnhnrp3rE7vuFI9fqH8UG3v9EQDa6HoqlQFKkFmpp9RSxSnpeAOG9oZVwFd2
         BOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j4AHIH3+iKmiLKBkiSxRSPFDuszb5yqNv9CqYiGv6ak=;
        b=WNrbRFIzDqrVF3gJEgjYYaQpkOL6TG+WcRLrZRElKioj20T6KFn3vSIgdFvXUnbhoE
         zvM9cQnHDtyo4cYrgJaAwGool0wBWCM6L99fGtxgovuJ8ytjIxT6fJ2bGUKqIM7mnl8z
         FkoDj4fRJ2JhatdaA+gYqn45Fe2kqcR5DSntHsokxmuSWjdK8fuHALa81jIWm+NRR/mY
         NMz0Uc1kvUs/619WPnoC7FE1Dr3s3/077/Pjfrujp+qyYVejJRgpbgWsIjMiVq+YW5sq
         aFI2HA0xuTBseIuecVNDkMxkUq4eT5WXzlWgRPSbQZPdkFQAz8fKrM52S+dUZZ+yL2l5
         JJfw==
X-Gm-Message-State: AOAM531R9Id9wf1GY5xcReZGg7Ox8IdjDFUQVMlSHrACa96mqOYX5oII
        cGwyoDMq37kAq2yNBLlFBF8=
X-Google-Smtp-Source: ABdhPJzDXR+jNw7q5lKwg2vwWAZZ83YOfh0MsBUCIl6DvtOZuKVy9Xy3vmTeVo2FOmHrJbk16g2FCg==
X-Received: by 2002:a05:6638:150d:: with SMTP id b13mr7878251jat.101.1636668161626;
        Thu, 11 Nov 2021 14:02:41 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
        by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 14:02:41 -0800 (PST)
From:   Jim Cromie <jim.cromie@gmail.com>
To:     jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
        sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
        lyude@redhat.com, linux-kernel@vger.kernel.org,
        rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Cc:     quic_saipraka@quicinc.com, will@kernel.org,
        catalin.marinas@arm.com, quic_psodagud@quicinc.com, maz@kernel.org,
        arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com,
        jim.cromie@gmail.com
Subject: [PATCH v10 09/10] dyndbg: create DEFINE_DYNAMIC_DEBUG_LOG|TRACE_GROUPS
Date:   Thu, 11 Nov 2021 15:02:05 -0700
Message-Id: <20211111220206.121610-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the recent addition of pr_debug to tracefs via +T flag, we now
want to add drm.trace; like its model: drm.debug, it maps bits to
pr_debug categories, but this one enables/disables writing to tracefs
(iff CONFIG_TRACING).

Do this by:

1. add flags to dyndbg_bitmap_param, holds "p" or "T" to work for either.

   add DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS to init .flags
   DEFINE_DYNAMIC_DEBUG_BITGRPS gets "p" for compat.
   use it from...

2. DEFINE_DYNAMIC_DEBUG_LOG_GROUPS as (1) with "p" flags - print to syslog
   DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS as (1) with "T" flags - trace to tracefs
   add kdoc to these

NOTES

The flags args (1) is a string, not just a 'p' or 'T'.  This allows
use of decorator flags ("mflt") too, in case the module author wants
to insure those decorations are in the trace & log.

The LOG|TRACE (2) macros don't use any decorator flags, (and therefore
don't toggle them), allowing users to control those themselves.

Decorator flags are shared for both LOG and TRACE consumers,
coordination between users is expected.  ATM, theres no declarative
way to preset decorator flags, but DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS
can be used to explicitly toggle them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 44 ++++++++++++++++++++++++++---------
 lib/dynamic_debug.c           |  4 ++--
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 792bcff0297e..918ac1a92358 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -255,30 +255,52 @@ struct dyndbg_bitdesc {
 
 struct dyndbg_bitmap_param {
 	unsigned long *bits;		/* ref to shared state */
+	const char *flags;
 	unsigned int maplen;
 	struct dyndbg_bitdesc *map;	/* indexed by bitpos */
 };
 
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+
+#define DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS(fsname, _var, _flags, desc, data) \
+	MODULE_PARM_DESC(fsname, desc);					\
+	static struct dyndbg_bitmap_param ddcats_##_var =		\
+	{ .bits = &(_var), .flags = (_flags),				\
+	  .map = data, .maplen = ARRAY_SIZE(data) };			\
+	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+
+#define DEFINE_DYNAMIC_DEBUG_BITGRPS(fsname, _var, desc, data) \
+	DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS(fsname, _var, "p", desc, data)
+
 /**
- * DEFINE_DYNAMIC_DEBUG_BITGRPS() - bitmap control of pr_debugs, by format match
+ * DEFINE_DYNAMIC_DEBUG_LOG_GROUPS() - bitmap control of grouped pr_debugs --> syslog
+ *
  * @fsname: parameter basename under /sys
  * @_var:   C-identifier holding bitmap
  * @desc:   string summarizing the controls provided
  * @bitmap: C array of struct dyndbg_bitdescs
  *
- * Intended for modules with a systematic use of pr_debug prefixes in
- * the format strings, this allows modules calling pr_debugs to
- * control them in groups by matching against their formats, and map
- * them to bits 0-N of a sysfs control point.
+ * Intended for modules having pr_debugs with prefixed/categorized
+ * formats; this lets you group them by substring match, map groups to
+ * bits, and enable per group to write to syslog, via @fsname.
  */
-#define DEFINE_DYNAMIC_DEBUG_BITGRPS(fsname, _var, desc, data)	\
-	MODULE_PARM_DESC(fsname, desc);					\
-	static struct dyndbg_bitmap_param ddcats_##_var =		\
-	{ .bits = &(_var), .map = data,					\
-	  .maplen = ARRAY_SIZE(data) };				\
-	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+#define DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(fsname, _var, desc, data)	\
+	DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS(fsname, _var, "p", desc, data)
+
+/**
+ * DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS() - bitmap control of pr_debugs --> tracefs
+ * @fsname: parameter basename under /sys
+ * @_var:   C-identifier holding bitmap
+ * @desc:   string summarizing the controls provided
+ * @bitmap: C array of struct dyndbg_bitdescs
+ *
+ * Intended for modules having pr_debugs with prefixed/categorized
+ * formats; this lets you group them by substring match, map groups to
+ * bits, and enable per group to write to tracebuf, via @fsname.
+ */
+#define DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS(fsname, _var, desc, data)	\
+	DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS(fsname, _var, "T", desc, data)
 
 extern const struct kernel_param_ops param_ops_dyndbg;
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d493ed6658b9..f5ba07668020 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -634,8 +634,8 @@ int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
 	for (i = 0; i < p->maplen && i < BITS_PER_LONG; map++, i++) {
 		if (test_bit(i, &inbits) == test_bit(i, p->bits))
 			continue;
-		snprintf(query, FMT_QUERY_SIZE, "format '%s' %cp", map->match,
-			 test_bit(i, &inbits) ? '+' : '-');
+		snprintf(query, FMT_QUERY_SIZE, "format '%s' %c%s", map->match,
+			 test_bit(i, &inbits) ? '+' : '-', p->flags);
 
 		matches = ddebug_exec_queries(query, KP_MOD_NAME);
 
-- 
2.31.1

