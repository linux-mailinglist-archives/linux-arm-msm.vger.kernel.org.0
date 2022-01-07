Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F954872A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 06:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346153AbiAGFaA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 00:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346154AbiAGF3z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 00:29:55 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75651C061245;
        Thu,  6 Jan 2022 21:29:55 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id o1so3643525ilo.6;
        Thu, 06 Jan 2022 21:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dzzF7/8GOpzrKBOwrzHckJzGxvjjvSqXBZy9kNIR228=;
        b=MWSI8cTZPy+vSDbzcCvskKGF68nj/ywu4/0G04NC/GBBSbv1Jls/TQxzBWMEet96WG
         AfEoB+DR7klyRZFOdiPKA54Lgyi3OOa1tDTTvh7cH0S42eaaENGud0GamJdWkQNgFmVX
         N9Uh/inRxdkZmJtVskb5jndWsazsHFP+hqWqHm61bafcXnQoZpzAQtIDEWVjWvVQZKvW
         9L6OQb2hjIhLMThvt+JVsEL4GvpD0ayNeRJtcLS7R0/lu88DxFw1WNqp5bAAduLErTMd
         Jxf6AKm8vLxSMiGVwM+YGvMDA/hGIAXYnKUURGD7uSI0u1AjIVwYvg0WHXUfjURDuCRx
         rQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dzzF7/8GOpzrKBOwrzHckJzGxvjjvSqXBZy9kNIR228=;
        b=N8K1tJCqexOdaRcGpGtUinlsGNwz5+OA73Sd7nVKiT9RzkmM/QGid+d0QtLW9QOm7R
         nt2QdR8AEF7M0IqGKS1vNTFMSi3sU4xzSpf/bFYpSBLpSTKltm7wb+ZXORcmw8iIWjBA
         iBkp7gzQ9kzimorJzyBAeJjMYd7fXNt+MkeXbi/qs3SZ/xTTOTc0AkRpM1O88guCa/CS
         17Va0zNCQl/yqhnmTTkztlH2gB94mYrCeKml9v/INkZuuugEVJYTY18+Q8PfdMVnH83i
         kTi+M1Qn5a30zwhnDffUhWZIxVaab6YUGNJAbQT/UhdBnTm8SkbFwGuDAEQ+/pkdxd5x
         pRag==
X-Gm-Message-State: AOAM5325PrVxe9IQ3EwGg+8uU/7Jna3xs3x/eOb//GHD8TU7PX9mUJQ2
        AFD/toePZcnqmsre3YpAcfg=
X-Google-Smtp-Source: ABdhPJyup5o4rcMhORpT6ZFSPR3dezD1mphacqC7xfzSWFaUJlmduh7V7awhW8PNm3PB34a2m2uxPw==
X-Received: by 2002:a05:6e02:545:: with SMTP id i5mr27549553ils.128.1641533394782;
        Thu, 06 Jan 2022 21:29:54 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
        by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 21:29:54 -0800 (PST)
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
Subject: [PATCH v11 04/19] dyndbg: add trace-events for pr_debug, dev_dbg
Date:   Thu,  6 Jan 2022 22:29:27 -0700
Message-Id: <20220107052942.1349447-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit HEAD~1, pr_debug temporarily issued a printk:console event.
Replace that use with 2 new events:

  bash-5.1# ls events/dyndbg/
  devdbg  enable  filter  prdbg

..called from pr_debug(), dev_dbg() respectively for dyndbg builds.

This links the old pr_debug API to tracefs, via dyndbg, allowing
pr_debug()s etc to add just a little more user-context to the
trace-logs, and then at users option, less syslog.

The 2 trace_* calls accept their caller's args respectively, keeping
the available info w/o alteration; ISTM this is the best basis to add
filtering later.

1- struct _ddebug *descriptor, giving tracefs all of dyndbg's info.
2- struct device *dev, for trace_devdbg(), if !!dev

To pass the descriptor into the trace_*() calls, the callchain up to
__dynamic_{pr_debug,{dev,netdev,ibdev}_dbg} are altered to provide it.

The 2nd event also gets the struct device *dev if !!dev, otherwise a
trace_prdbg() is issued, since we have an event for that, and don't
need to waste the trace-buffer space.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/trace/events/dyndbg.h | 67 +++++++++++++++++++++++++++++++++++
 lib/dynamic_debug.c           | 53 ++++++++++++++-------------
 2 files changed, 96 insertions(+), 24 deletions(-)
 create mode 100644 include/trace/events/dyndbg.h

diff --git a/include/trace/events/dyndbg.h b/include/trace/events/dyndbg.h
new file mode 100644
index 000000000000..82620b10e968
--- /dev/null
+++ b/include/trace/events/dyndbg.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dyndbg
+
+#if !defined(_TRACE_DYNDBG_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DYNDBG_H
+
+#include <linux/tracepoint.h>
+
+/* capture pr_debug() callsite descriptor and message */
+TRACE_EVENT(prdbg,
+	TP_PROTO(const struct _ddebug *desc, const char *text, size_t len),
+
+	TP_ARGS(desc, text, len),
+
+	TP_STRUCT__entry(
+		__dynamic_array(char, msg, len + 1)
+	),
+
+	TP_fast_assign(
+		/*
+		 * Each trace entry is printed in a new line.
+		 * If the msg finishes with '\n', cut it off
+		 * to avoid blank lines in the trace.
+		 */
+		if ((len > 0) && (text[len-1] == '\n'))
+			len -= 1;
+
+		memcpy(__get_str(msg), text, len);
+		__get_str(msg)[len] = 0;
+	),
+
+	TP_printk("%s", __get_str(msg))
+
+);
+
+/* capture dev_dbg() callsite descriptor, device, and message */
+TRACE_EVENT(devdbg,
+	TP_PROTO(const struct _ddebug *desc, const struct device *dev,
+		 const char *text, size_t len),
+
+	TP_ARGS(desc, dev, text, len),
+
+	TP_STRUCT__entry(
+		__dynamic_array(char, msg, len + 1)
+	),
+
+	TP_fast_assign(
+		/*
+		 * Each trace entry is printed in a new line.
+		 * If the msg finishes with '\n', cut it off
+		 * to avoid blank lines in the trace.
+		 */
+		if ((len > 0) && (text[len-1] == '\n'))
+			len -= 1;
+
+		memcpy(__get_str(msg), text, len);
+		__get_str(msg)[len] = 0;
+	),
+
+	TP_printk("%s", __get_str(msg))
+);
+
+#endif /* _TRACE_DYNDBG_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 3fd035cd4653..2efdc4f1553f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -36,7 +36,9 @@
 #include <linux/sched.h>
 #include <linux/device.h>
 #include <linux/netdevice.h>
-#include <trace/events/printk.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/dyndbg.h>
 
 #include <rdma/ib_verbs.h>
 
@@ -648,7 +650,8 @@ struct dynamic_trace_bufs {
 static DEFINE_PER_CPU(struct dynamic_trace_bufs, dynamic_trace_bufs);
 static DEFINE_PER_CPU(int, dynamic_trace_reserve);
 
-static void dynamic_trace(const char *fmt, va_list args)
+static void dynamic_trace(struct _ddebug *desc, const struct device *dev,
+			  const char *fmt, va_list args)
 {
 	struct dynamic_trace_buf *buf;
 	int bufidx;
@@ -667,7 +670,11 @@ static void dynamic_trace(const char *fmt, va_list args)
 	buf = this_cpu_ptr(dynamic_trace_bufs.bufs) + bufidx;
 
 	len = vscnprintf(buf->buf, sizeof(buf->buf), fmt, args);
-	trace_console(buf->buf, len);
+
+	if (dev == NULL)
+		trace_prdbg(desc, buf->buf, len);
+	else
+		trace_devdbg(desc, dev, buf->buf, len);
 
 out:
 	/* As above. */
@@ -676,9 +683,9 @@ static void dynamic_trace(const char *fmt, va_list args)
 	preempt_enable_notrace();
 }
 
-static void dynamic_printk(unsigned int flags, const char *fmt, ...)
+static void dynamic_printk(struct _ddebug *desc, const char *fmt, ...)
 {
-	if (flags & _DPRINTK_FLAGS_TRACE) {
+	if (desc->flags & _DPRINTK_FLAGS_TRACE) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -686,11 +693,11 @@ static void dynamic_printk(unsigned int flags, const char *fmt, ...)
 		 * All callers include the KERN_DEBUG prefix to keep the
 		 * vprintk case simple; strip it out for tracing.
 		 */
-		dynamic_trace(fmt + strlen(KERN_DEBUG), args);
+		dynamic_trace(desc, NULL, fmt + strlen(KERN_DEBUG), args);
 		va_end(args);
 	}
 
-	if (flags & _DPRINTK_FLAGS_PRINTK) {
+	if (desc->flags & _DPRINTK_FLAGS_PRINTK) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -699,19 +706,19 @@ static void dynamic_printk(unsigned int flags, const char *fmt, ...)
 	}
 }
 
-static void dynamic_dev_printk(unsigned int flags, const struct device *dev,
+static void dynamic_dev_printk(struct _ddebug *desc, const struct device *dev,
 			       const char *fmt, ...)
 {
 
-	if (flags & _DPRINTK_FLAGS_TRACE) {
+	if (desc->flags & _DPRINTK_FLAGS_TRACE) {
 		va_list args;
 
 		va_start(args, fmt);
-		dynamic_trace(fmt, args);
+		dynamic_trace(desc, dev, fmt, args);
 		va_end(args);
 	}
 
-	if (flags & _DPRINTK_FLAGS_PRINTK) {
+	if (desc->flags & _DPRINTK_FLAGS_PRINTK) {
 		va_list args;
 
 		va_start(args, fmt);
@@ -734,7 +741,7 @@ void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	dynamic_printk(descriptor->flags, KERN_DEBUG "%s%pV",
+	dynamic_printk(descriptor, KERN_DEBUG "%s%pV",
 		       dynamic_emit_prefix(descriptor, buf), &vaf);
 
 	va_end(args);
@@ -745,7 +752,6 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 		      const struct device *dev, const char *fmt, ...)
 {
 	struct va_format vaf;
-	unsigned int flags;
 	va_list args;
 
 	BUG_ON(!descriptor);
@@ -755,15 +761,14 @@ void __dynamic_dev_dbg(struct _ddebug *descriptor,
 
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	flags = descriptor->flags;
 
 	if (!dev) {
-		dynamic_printk(flags, KERN_DEBUG "(NULL device *): %pV",
+		dynamic_printk(descriptor, KERN_DEBUG "(NULL device *): %pV",
 			       &vaf);
 	} else {
 		char buf[PREFIX_SIZE] = "";
 
-		dynamic_dev_printk(flags, dev, "%s%s %s: %pV",
+		dynamic_dev_printk(descriptor, dev, "%s%s %s: %pV",
 				   dynamic_emit_prefix(descriptor, buf),
 				   dev_driver_string(dev), dev_name(dev),
 				   &vaf);
@@ -794,7 +799,7 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 	if (dev && dev->dev.parent) {
 		char buf[PREFIX_SIZE] = "";
 
-		dynamic_dev_printk(flags, dev->dev.parent,
+		dynamic_dev_printk(descriptor, dev->dev.parent,
 				   "%s%s %s %s%s: %pV",
 				   dynamic_emit_prefix(descriptor, buf),
 				   dev_driver_string(dev->dev.parent),
@@ -802,10 +807,10 @@ void __dynamic_netdev_dbg(struct _ddebug *descriptor,
 				   netdev_name(dev), netdev_reg_state(dev),
 				   &vaf);
 	} else if (dev) {
-		dynamic_printk(flags, KERN_DEBUG "%s%s: %pV",
-			       netdev_name(dev), netdev_reg_state(dev), &vaf);
+		dynamic_dev_printk(descriptor, &dev->dev, KERN_DEBUG "%s%s: %pV",
+				   netdev_name(dev), netdev_reg_state(dev), &vaf);
 	} else {
-		dynamic_printk(flags, KERN_DEBUG "(NULL net_device): %pV",
+		dynamic_printk(descriptor, KERN_DEBUG "(NULL net_device): %pV",
 			       &vaf);
 	}
 
@@ -833,7 +838,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 	if (ibdev && ibdev->dev.parent) {
 		char buf[PREFIX_SIZE] = "";
 
-		dynamic_dev_printk(flags, ibdev->dev.parent,
+		dynamic_dev_printk(descriptor, ibdev->dev.parent,
 				   "%s%s %s %s: %pV",
 				   dynamic_emit_prefix(descriptor, buf),
 				   dev_driver_string(ibdev->dev.parent),
@@ -841,10 +846,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   dev_name(&ibdev->dev),
 				   &vaf);
 	} else if (ibdev) {
-		dynamic_printk(flags, KERN_DEBUG "%s%s: %pV",
-			       dev_name(&ibdev->dev), &vaf);
+		dynamic_dev_printk(descriptor, &ibdev->dev, KERN_DEBUG "%s%s: %pV",
+				   dev_name(&ibdev->dev), &vaf);
 	} else {
-		dynamic_printk(flags, KERN_DEBUG "(NULL ip_device): %pV",
+		dynamic_printk(descriptor, KERN_DEBUG "(NULL ip_device): %pV",
 			       &vaf);
 	}
 
-- 
2.33.1

