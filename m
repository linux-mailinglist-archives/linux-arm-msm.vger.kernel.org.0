Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083F044DD8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 23:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234280AbhKKWF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 17:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234248AbhKKWFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 17:05:24 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3930AC06127A;
        Thu, 11 Nov 2021 14:02:35 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id s14so7178103ilv.10;
        Thu, 11 Nov 2021 14:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MVDfl7PAAJaLkVdQfsH1Ap16lLUYnqL6SHocbYPYy0A=;
        b=QIaAOKQD3K6w68OGcvhtdX8JJHS9l6Ts1A8K/I1zgB4iL/DMasjJKvKpUZiJn1DlTW
         sa0BifWTQb1oeG02aPFxLvqh2unuTcVXWbAzqEr80b3HhoV5SsPzK84ueS8GCp0DV6uL
         OGpqptjAjo5s9aFMe8+pXhQqgl/sLqGCD/Pg+4tinvrnrFWjxYzFujslKtgmGdhMzFYc
         /1KZvL6ckuLggzF0oJa7dW0aNrAJ1HdUarze0Tbn877MWur1Sk2TfcRX7OFRFmMBwH69
         KpXmsseNM4u17L1pOPgdKUop2RKaQEc5wb9qx/AldTDEPVfgGQjx83qgV9QkgTyACnHa
         WZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MVDfl7PAAJaLkVdQfsH1Ap16lLUYnqL6SHocbYPYy0A=;
        b=kcSDutvX5DY74YJjLNLRkCZ90f9OJBF6OQn72whGj0AkzgeA1+KhyGEySCR6hq21qi
         7GZgjNsvQVAsfJ7rgLo++9J0HfVKGvCdtlEtwzPt40SvZKBegfKWlnz+8kXDlAsaTf2O
         ZZHaEEwlvTSCWFsElp5axxbgeCATHgFpvhe6lBvCLxAjBxIceX2G6XInjiRuhb85MgvL
         qLuabpbevqZwcejR/dGXGJUZhXYG4mirXL3AkCihKfIbPlBZCl+ZzJ4IyReoo634ax7U
         WE/35mG2yVm3u3s/J31t/q4b+mdXeRqdL0n0Kjztdmb29D14VyOocd5Jz1C0Qzu0Dg28
         Qjbw==
X-Gm-Message-State: AOAM530OdJTdHHUzcy8sSIZVbZCRLQ1XPe7QPub0E7qI2mkGFGVnHOcp
        cxpPHkjBDXKR6joXVisd6oI=
X-Google-Smtp-Source: ABdhPJzYkCLrsFr8YHPHR/GOuUjhp5MAi9XjfhqQa6ueQHpc0HfFVmpFa0g7rZgW2hHn0w7x56LbLw==
X-Received: by 2002:a05:6e02:194e:: with SMTP id x14mr6316649ilu.245.1636668154621;
        Thu, 11 Nov 2021 14:02:34 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
        by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 14:02:34 -0800 (PST)
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
Subject: [PATCH v10 05/10] i915/gvt: use dyndbg.BITGRPS for existing pr_debugs
Date:   Thu, 11 Nov 2021 15:02:01 -0700
Message-Id: <20211111220206.121610-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The gvt component of this driver has ~120 pr_debugs with formats using
one of 9 fixed string prefixes, which are quite similar to those
enumerated in DRM debug categories.  Following the interface model of
drm.debug, add a parameter to map bits to these format prefixes.

static struct dyndbg_bitdesc i915_bitmap[] = {
	[0] = { "gvt:cmd:" },
	[1] = { "gvt:core:" },
	[2] = { "gvt:dpy:" },
	[3] = { "gvt:el:" },
	[4] = { "gvt:irq:" },
	[5] = { "gvt:mm:" },
	[6] = { "gvt:mmio:" },
	[7] = { "gvt:render:" },
	[8] = { "gvt:sched:" }
};
DEFINE_DYNAMIC_DEBUG_BITGRPS(debug_gvt, __gvt_debug,
	"dyndbg bitmap desc",

If CONFIG_DYNAMIC_DEBUG_CORE=y, then gvt/Makefile adds
-DDYNAMIC_DEBUG_MODULE to cflags, which CONFIG_DYNAMIC_DEBUG=n
(CORE-only) builds need.  This is redone more comprehensively soon.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/Makefile    |  2 ++
 drivers/gpu/drm/i915/intel_gvt.c | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 660bb03de6fc..0fa5f53312a8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -317,6 +317,8 @@ i915-y += intel_gvt.o
 include $(src)/gvt/Makefile
 endif
 
+ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 4e70c1a9ef2e..efaac5777873 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -162,3 +162,41 @@ void intel_gvt_resume(struct drm_i915_private *dev_priv)
 	if (intel_gvt_active(dev_priv))
 		intel_gvt_pm_resume(dev_priv->gvt);
 }
+
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+
+unsigned long __gvt_debug;
+EXPORT_SYMBOL(__gvt_debug);
+
+static struct dyndbg_bitdesc i915_dyndbg_bitmap[] = {
+	[0] = { "gvt:cmd:" },
+	[1] = { "gvt:core:" },
+	[2] = { "gvt:dpy:" },
+	[3] = { "gvt:el:" },
+	[4] = { "gvt:irq:" },
+	[5] = { "gvt:mm:" },
+	[6] = { "gvt:mmio:" },
+	[7] = { "gvt:render:" },
+	[8] = { "gvt:sched:" }
+};
+
+#define help_(_N, _cat)	"\t  Bit-" #_N ":\t" _cat "\n"
+
+#define I915_GVT_CATEGORIES(name) \
+	" Enable debug output via /sys/module/i915/parameters/" #name	\
+	", where each bit enables a debug category.\n"			\
+	help_(0, "gvt:cmd:")						\
+	help_(1, "gvt:core:")						\
+	help_(2, "gvt:dpy:")						\
+	help_(3, "gvt:el:")						\
+	help_(4, "gvt:irq:")						\
+	help_(5, "gvt:mm:")						\
+	help_(6, "gvt:mmio:")						\
+	help_(7, "gvt:render:")						\
+	help_(8, "gvt:sched:")
+
+DEFINE_DYNAMIC_DEBUG_BITGRPS(debug_gvt, __gvt_debug,
+			     I915_GVT_CATEGORIES(debug_gvt),
+			     i915_dyndbg_bitmap);
+
+#endif
-- 
2.31.1

