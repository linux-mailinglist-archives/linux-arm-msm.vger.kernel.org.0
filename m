Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D31848724C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 06:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbiAGF3x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 00:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345703AbiAGF3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 00:29:51 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C41C061245;
        Thu,  6 Jan 2022 21:29:51 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id o1so3643445ilo.6;
        Thu, 06 Jan 2022 21:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lpR+Wzjsd8/n8K/fL3FJZojKGtiDXaXpVwmgPUkzxkk=;
        b=kcdk3FaUVivat78Z34FqwhxWMsSOmhYYOZs8AddqrFD6uYNmMpus66TSk2xpzFxtrV
         BntfkHVOpBKu5HtkucweUsJ41cdONGyAsGe7l+QkQZiX4qxlyanuiwUSfnTGu7p9DCj1
         yGdeIKcBH2R4dcLa7lUtyEBbv9/F3a1T3PVKKHODTp76KhbNeksGua5ZOSkuIUNTGLHr
         AmSO2L2nfE3g5Ct/RfDrCrBBCA7RQrIoOi3/tAej9GHaMaw2VASYGCAsMZ56CUeqQIuc
         T3IyHODCHXrsGFuNsQiTrsGqQUoUeHFsmMvn7QDiMQKUznwB3go5VNeQfo/JIEI4ez5s
         KcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lpR+Wzjsd8/n8K/fL3FJZojKGtiDXaXpVwmgPUkzxkk=;
        b=f+JwnAMt+qArLPpUUci3kPRCd6cX7DHerkVJtQy04blrgwqdKmLqj3bRKVI5XiIAlW
         tpLZ+rUvsfQqoOpCqBtUGCUmudaqvDBPyVIZE+++vIZrnN6vmy3j1V4zUzDDiE8K62zs
         Jx19ponjYDnhhF5TM1Cg0KRv6fMULFuQz7dhDHYKg2sJllKYxI20eI0VgtzfOPxdr2ut
         NKbRjMnDVevEuvhzqqmfLOzi2cmZ8nElJRRfANcesCPXNw+HxoHtogPFOoVlUC/CD45B
         LSYnxIKIRuCpoeKl82sAeYSlKOtk/1i3gLvzCFjs7g/LfuGEuAYnSD7vfhDN5vkdnnWU
         NvRQ==
X-Gm-Message-State: AOAM533DdApMZ0BBeBjB75ytEL2FB81wcwdnM09U0CYf0iqc7+nwKSgM
        cQ8KXLCLbhwBLqT3frxn+gY=
X-Google-Smtp-Source: ABdhPJwJw2VOt3cs2Z4BotAI96BncuuqFpweYCpjRMmtvlP3qpc+7bG6DCXhRkMcKsekCrQJu3i+gQ==
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr25875405ilr.297.1641533391036;
        Thu, 06 Jan 2022 21:29:51 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
        by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 21:29:50 -0800 (PST)
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
        jim.cromie@gmail.com, vincent.whitchurch@axis.com
Subject: [PATCH v11 01/19] dyndbg: add _DPRINTK_FLAGS_ENABLED
Date:   Thu,  6 Jan 2022 22:29:24 -0700
Message-Id: <20220107052942.1349447-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Distinguish the condition: _DPRINTK_FLAGS_ENABLED from the bit:
_DPRINTK_FLAGS_PRINT, in preparation to add _DPRINTK_FLAGS_TRACE next.
Also add a 'K' to get _DPRINTK_FLAGS_PRINTK, to insure is not used
elsewhere with a stale meaning.

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 10 ++++++----
 lib/dynamic_debug.c           |  8 ++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..257a7bcbbe36 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -27,7 +27,7 @@ struct _ddebug {
 	 * writes commands to <debugfs>/dynamic_debug/control
 	 */
 #define _DPRINTK_FLAGS_NONE	0
-#define _DPRINTK_FLAGS_PRINT	(1<<0) /* printk() a message using the format */
+#define _DPRINTK_FLAGS_PRINTK	(1<<0) /* printk() a message using the format */
 #define _DPRINTK_FLAGS_INCL_MODNAME	(1<<1)
 #define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
@@ -37,8 +37,10 @@ struct _ddebug {
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
 	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID)
 
+#define _DPRINTK_FLAGS_ENABLED		_DPRINTK_FLAGS_PRINTK
+
 #if defined DEBUG
-#define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
+#define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINTK
 #else
 #define _DPRINTK_FLAGS_DEFAULT 0
 #endif
@@ -120,10 +122,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #ifdef DEBUG
 #define DYNAMIC_DEBUG_BRANCH(descriptor) \
-	likely(descriptor.flags & _DPRINTK_FLAGS_PRINT)
+	likely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
 #else
 #define DYNAMIC_DEBUG_BRANCH(descriptor) \
-	unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)
+	unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
 #endif
 
 #endif /* CONFIG_JUMP_LABEL */
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index dd7f56af9aed..78a2912976c1 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -86,7 +86,7 @@ static inline const char *trim_prefix(const char *path)
 }
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
-	{ _DPRINTK_FLAGS_PRINT, 'p' },
+	{ _DPRINTK_FLAGS_PRINTK, 'p' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -210,10 +210,10 @@ static int ddebug_change(const struct ddebug_query *query,
 			if (newflags == dp->flags)
 				continue;
 #ifdef CONFIG_JUMP_LABEL
-			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
-				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
+			if (dp->flags & _DPRINTK_FLAGS_ENABLED) {
+				if (!(modifiers->flags & _DPRINTK_FLAGS_ENABLED))
 					static_branch_disable(&dp->key.dd_key_true);
-			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
+			} else if (modifiers->flags & _DPRINTK_FLAGS_ENABLED)
 				static_branch_enable(&dp->key.dd_key_true);
 #endif
 			dp->flags = newflags;
-- 
2.33.1

