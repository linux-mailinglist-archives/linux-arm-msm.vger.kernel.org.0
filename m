Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8DC529415
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 00:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350035AbiEPW5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 18:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349928AbiEPW5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 18:57:21 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CAB43380;
        Mon, 16 May 2022 15:57:12 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id q203so1804909iod.0;
        Mon, 16 May 2022 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EljbVfMm3ciorUPWk1+p+ks3bn6Qsh0+zX8r/PPo110=;
        b=Zdi6HWiwDP4t/No+bs8ZyQ+N6pXEumJ8NOvdkpl8c7j45sWwNOx/N8YlJOrgh9/AnP
         jbDGDpSx7JCHW8cYg5WF30gpG6shFX1ivEnpEf2UuujAylh3b6gDRdkEzf6OXyNH1nGz
         oc6eGN/CFum1i5KegUfrxV3DabV+GkFEGzawTo2UMfGtMG/52Ky1CVrf5I85mF0/+LVq
         Ug0fEIUyeHdzXmn4xrZOZ12NeGkpxV1FRlRu4pPc1qBuvVl0d6pSsn4YB0WCjF1Rheda
         u3Sz+WAgW4cfIx6RAiv0exAi23+vfYevTZ0T1wKxm5KJ+IMmwtVS7CLTCZgyulzIILa2
         Mr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EljbVfMm3ciorUPWk1+p+ks3bn6Qsh0+zX8r/PPo110=;
        b=uoTr3L9WK6s4294FEas6IgRpx8TKIuTCNrqR4vSW7g/vEmwKlA0ODmEizKLeJVX0hs
         TIRkFoINJggRhDTrhuPTF2Ou4FnaxI6f0mzlwQmblfCEl2p97x7e2Nqzm4LMjuE/sfiy
         ejfQaTbMdrUZZCiN3resRn6XOS0ck9CRz++ust4vUK+Wj3eypb7yX0A0ncdUfc8nM/az
         J5j1hqhpNzH4lRLvwqVVwGg0VjA02pPytNJfVekJZ6WHKEYIO7S3dcwXapnMnzkak6Qv
         npdBS2Oaf7r7cSRz5SJLjB/RBzPrYdKFV8d4SHdo+nOA4/W+sOVJIaUFkC74G241rpcf
         QQBQ==
X-Gm-Message-State: AOAM533T3k8l+lIR9dSvy/tICaysJo/1E4FyS3gewZyxRHzMyE49V9PR
        J29hlv01P/O6JLkzm4NjtZw=
X-Google-Smtp-Source: ABdhPJy0hsQfe0cbLe0hTQSf/uMXvISVb4yJrfO0/vky8EKFsXcYrjczUoYfNneLC90q6wNVKqC07Q==
X-Received: by 2002:a05:6638:405:b0:32e:586:8803 with SMTP id q5-20020a056638040500b0032e05868803mr8944685jap.157.1652741830163;
        Mon, 16 May 2022 15:57:10 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
        by smtp.googlemail.com with ESMTPSA id k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 15:57:09 -0700 (PDT)
From:   Jim Cromie <jim.cromie@gmail.com>
To:     jbaron@akamai.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Cc:     gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
        seanpaul@chromium.org, robdclark@gmail.com, rostedt@goodmis.org,
        mathieu.desnoyers@efficios.com, quic_saipraka@quicinc.com,
        will@kernel.org, catalin.marinas@arm.com,
        quic_psodagud@quicinc.com, maz@kernel.org, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com,
        jim.cromie@gmail.com
Subject: [PATCH v2 08/27] dyndbg: add drm.debug style bitmap support
Date:   Mon, 16 May 2022 16:56:21 -0600
Message-Id: <20220516225640.3102269-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add kernel_param_ops and callbacks to implement a bitmap in a
sysfs-node.  IE, add these:

 - int param_set_dyndbg_classes()
 - int param_get_dyndbg_classes()
 - struct kernel_param_ops param_ops_dyndbg_classes

Following the model of kernel/params.c STANDARD_PARAM_DEFS, these are
non-static and exported.

get/set use an augmented kernel_param; the arg refs a new struct
dyndbg_classes_param, initialized by the macro, containing:

BITS: a pointer to the user module's ulong holding the bits/state.
By ref'g the client's bit-state, we coordinate with existing code that
uses it, so it works unchanged; for example drm_debug_enabled().  The
change to ulong allows use of BIT() etc.

FLAGS: dyndbg.flags toggled by bit-changes. Usually just "p".

MAP: a pointer to struct ddebug_known_classes, which maps those
class-names to pr_debug.class_ids 0..N.

Using the sys-node, with dynamic_debug.verbose=1:

bash-5.1# echo 1 > /sys/module/drm/parameters/debug
[   29.821298] dyndbg: set_dyndbg_classes: new 0x1 current 0x0
[   29.822841] dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
[   29.824348] dyndbg: no matches for query
[   29.825428] dyndbg: total matches: 0

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 17 ++++++++
 lib/dynamic_debug.c           | 81 +++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 328722ba2d8e..e9e6d0f503f3 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -85,6 +85,11 @@ struct ddebug_known_classes_map {
 		.classes = { __VA_ARGS__ }				\
 	}
 
+struct ddebug_classes_bitmap_param {
+	unsigned long *bits;
+	char flags[8];
+	const struct ddebug_known_classes_map *map;
+};
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
@@ -237,6 +242,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 int  dynamic_debug_register_classes(struct ddebug_known_classes_map *map);
 void dynamic_debug_unregister_classes(struct ddebug_known_classes_map *map);
 
+struct kernel_param;
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp);
+int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp);
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
@@ -283,6 +292,14 @@ static inline int dynamic_debug_register_classes(const struct ddebug_known_class
 static inline void dynamic_debug_unregister_classes(struct ddebug_known_classes_map *map)
 {}
 
+struct kernel_param;
+static inline int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{ return 0; }
+static inline int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
+{ return 0; }
+
 #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
+extern const struct kernel_param_ops param_ops_dyndbg_classes;
+
 #endif
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b1aaf8893cdf..b67bf9efec07 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -597,6 +597,87 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
+static int do_callback_changes(const struct ddebug_classes_bitmap_param *dcp,
+			       int bitpos, unsigned long *inbits)
+{
+#define QUERY_SIZE 128
+	char query[QUERY_SIZE];
+	int matches;
+
+	snprintf(query, QUERY_SIZE, "class %s %c%s", dcp->map->classes[bitpos],
+		 test_bit(bitpos, inbits) ? '+' : '-', dcp->flags);
+
+	matches = ddebug_exec_queries(query, NULL);
+
+	v2pr_info("bit-%d: %d matches on class:%s\n", bitpos,
+		  matches, dcp->map->classes[bitpos]);
+
+	return matches;
+}
+
+/**
+ * param_set_dyndbg_classes - bits => categories >control setter
+ * @instr: string echo>d to sysfs
+ * @kp:    kp->arg has state: bits, map
+ *
+ * Enable/disable prdbgs by their "category", as specified in the
+ * arguments to DEFINE_DYNAMIC_DEBUG_CLASSES.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	const struct ddebug_classes_bitmap_param *dcp = kp->arg;
+	unsigned long inbits;
+	int rc, i, totct = 0;
+
+	if (!dcp || !dcp->map) {
+		pr_err("set_dyndbg_classes: no bits=>queries map\n");
+		return -EINVAL;
+	}
+	rc = kstrtoul(instr, 0, &inbits);
+	if (rc) {
+		pr_err("set_dyndbg_classes: expecting bits/integer\n");
+		return -EINVAL;
+	}
+	vpr_info("set_dyndbg_classes: new 0x%lx current 0x%lx\n", inbits, *dcp->bits);
+
+	for (i = 0; i < dcp->map->length; i++) {
+
+		if (test_bit(i, &inbits) == test_bit(i, dcp->bits))
+			continue;
+
+		totct += do_callback_changes(dcp, i, &inbits);
+	}
+	*dcp->bits = inbits;
+	vpr_info("total matches: %d\n", totct);
+	return 0;
+}
+EXPORT_SYMBOL(param_set_dyndbg_classes);
+
+/**
+ * param_get_dyndbg_classes - classes reader
+ * @buffer: string description of controlled bits -> classes
+ * @kp:     kp->arg has state: bits, map
+ *
+ * Reads last written bits, underlying prdbg state may have changed since.
+ * Returns: #chars written or <0 on error
+ */
+int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
+{
+	const struct ddebug_classes_bitmap_param *p = kp->arg;
+	unsigned long val = *p->bits;
+
+	return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", val);
+}
+EXPORT_SYMBOL(param_get_dyndbg_classes);
+
+const struct kernel_param_ops param_ops_dyndbg_classes = {
+	.set = param_set_dyndbg_classes,
+	.get = param_get_dyndbg_classes,
+};
+EXPORT_SYMBOL(param_ops_dyndbg_classes);
+
 #define PREFIX_SIZE 64
 
 static int remaining(int wrote)
-- 
2.35.3

