Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B89D529486
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 01:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349961AbiEPW5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 18:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350052AbiEPW5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 18:57:33 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F16444755;
        Mon, 16 May 2022 15:57:30 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id h85so17601263iof.12;
        Mon, 16 May 2022 15:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=98dXLwCwtvAkevCuwtWfQGU6ISlKpMHx9nUQlY+D/5A=;
        b=ZEGRk6DFco5m5XlUAGmr2Mhthn/XqWidnCJTjWGQKyyfdqThI3GnZ7mVTSuWXXAobp
         sJpzUpLz8ut25WaVuAd4MfvdnkHt0aF3Aj0Z6vEZAbq7kRcqNn98htucIF/8w2kgf1Qu
         hFrIwCK1/tXTEtowkxY4IxQTONdMBIM6zn6Z7AfoE7WtvFJd7nyYm7X8VESIZ+TCgVcV
         kY7azYIpAyfqHG8OqPTTZ4QFaZVX2ex8AX+FhjazlsIeC24lBdfopKxAJyul5Sn4fU0Z
         WgIHuSDNciECmT4wSOao7Hw2ihEdolkhYZD/yEC80GY6jJVvCGdB8Mu5c0+0ZMZ8jvgG
         yKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98dXLwCwtvAkevCuwtWfQGU6ISlKpMHx9nUQlY+D/5A=;
        b=KMj2mJf3KNFEUU4dJ9SRRLYCYxakAb7o/NMU1aiyaIs7BtxndEtzHa0Ke68YzfOQ0/
         IdI61SFLsDd21RikGW4odVuYRaYIhavbMJiwslKGyYIOPO7KwvaVRyabjIX9vZblRliu
         kpFcZYf508Jciu++jP8d2korbrhvj/1Q3ncxNhtUD41RG8JdgLDFlS9GEf6v9KbiCac5
         4LXv9fyJdeQZCXVQuYPqwNilFKs5clnFLO2JVHGJ1TP0jU8CFQwFwG7G203pg3UR5FVp
         X5Ri1oHQH7Lntp39p2CVq9bgjqaR+LwMUth58Tucu+9z3ge0dDSYohRMimml2UUazJdK
         nhkw==
X-Gm-Message-State: AOAM531pHQ2WqXkoOsN5RcgYYQoPmu9eLucVmawd7Sbo70fdeJEpkeoO
        3hfGqg/cytXUhuxJpjfetZE=
X-Google-Smtp-Source: ABdhPJwwVfb8OtFmz8SO/9FTSA/s2EXiW9+itOUCNnaukYlrF6hYBbLKqUf40k0Y82iDGh+c1YIjFA==
X-Received: by 2002:a05:6638:204e:b0:32b:b461:3407 with SMTP id t14-20020a056638204e00b0032bb4613407mr10113394jaj.132.1652741849772;
        Mon, 16 May 2022 15:57:29 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
        by smtp.googlemail.com with ESMTPSA id k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 15:57:29 -0700 (PDT)
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
        jim.cromie@gmail.com, vincent.whitchurch@axis.com
Subject: [PATCH v2 23/27] dyndbg: add _DPRINTK_FLAGS_ENABLED
Date:   Mon, 16 May 2022 16:56:36 -0600
Message-Id: <20220516225640.3102269-24-jim.cromie@gmail.com>
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

Distinguish the condition: _DPRINTK_FLAGS_ENABLED from the bit:
_DPRINTK_FLAGS_PRINT (and define former as latter), in preparation to
add another bit next: _DPRINTK_FLAGS_TRACE

And change JUMP_LABEL code block to use the more general
_DPRINTK_FLAGS_ENABLED symbol.  Also add a 'K' to get new symbol
_DPRINTK_FLAGS_PRINTK, in order to break any stale uses.

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c   |  4 ++--
 include/linux/dynamic_debug.h | 10 ++++++----
 lib/dynamic_debug.c           |  8 ++++----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 1752b40b0189..77b56399147a 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -280,11 +280,11 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 	vaf.va = &args;
 
 	if (dev) {
-		if (desc->flags && _DPRINTK_FLAGS_PRINT)
+		if (desc->flags && _DPRINTK_FLAGS_PRINTK)
 			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
 				   __builtin_return_address(0), &vaf);
 	} else {
-		if (desc->flags && _DPRINTK_FLAGS_PRINT)
+		if (desc->flags && _DPRINTK_FLAGS_PRINTK)
 			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 			       __builtin_return_address(0), &vaf);
 	}
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index abf43e28d8d3..0a81a3582281 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -32,7 +32,7 @@ struct _ddebug {
 	 * writes commands to <debugfs>/dynamic_debug/control
 	 */
 #define _DPRINTK_FLAGS_NONE	0
-#define _DPRINTK_FLAGS_PRINT	(1<<0) /* printk() a message using the format */
+#define _DPRINTK_FLAGS_PRINTK	(1 << 0) /* printk() a message using the format */
 #define _DPRINTK_FLAGS_INCL_MODNAME	(1<<1)
 #define _DPRINTK_FLAGS_INCL_FUNCNAME	(1<<2)
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
@@ -42,8 +42,10 @@ struct _ddebug {
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
@@ -161,10 +163,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
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
index f9c5bbf9d43b..5682ee477677 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -87,7 +87,7 @@ static inline const char *trim_prefix(const char *path)
 }
 
 static struct { unsigned flag:8; char opt_char; } opt_array[] = {
-	{ _DPRINTK_FLAGS_PRINT, 'p' },
+	{ _DPRINTK_FLAGS_PRINTK, 'p' },
 	{ _DPRINTK_FLAGS_INCL_MODNAME, 'm' },
 	{ _DPRINTK_FLAGS_INCL_FUNCNAME, 'f' },
 	{ _DPRINTK_FLAGS_INCL_LINENO, 'l' },
@@ -238,10 +238,10 @@ static int ddebug_change(const struct ddebug_query *query,
 			if (newflags == dp->flags)
 				continue;
 #ifdef CONFIG_JUMP_LABEL
-			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
-				if (!(newflags & _DPRINTK_FLAGS_PRINT))
+			if (dp->flags & _DPRINTK_FLAGS_ENABLED) {
+				if (!(newflags & _DPRINTK_FLAGS_ENABLED))
 					static_branch_disable(&dp->key.dd_key_true);
-			} else if (newflags & _DPRINTK_FLAGS_PRINT) {
+			} else if (newflags & _DPRINTK_FLAGS_ENABLED) {
 				static_branch_enable(&dp->key.dd_key_true);
 			}
 #endif
-- 
2.35.3

