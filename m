Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF9B44DDB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 23:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234389AbhKKWFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 17:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234393AbhKKWFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 17:05:33 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3AEC061203;
        Thu, 11 Nov 2021 14:02:43 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id m9so8864839iop.0;
        Thu, 11 Nov 2021 14:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vpU+SSLFFT68FpBw2vFN+h9yffUizferjvptZotty9E=;
        b=PXwPCeebAKMhIluHtIjmrJ7zxCYSLLRcDFNABTvSwcImCglpOyAocqa5WoM6YWBLLo
         JOH9rNgGyrzOfQ5x2t5MUzaNvgmNniIzUEnlDPtn4dq4E41wnSs4UH1LJhwYTCSZ1jnM
         AGO8F/BNrMciuOhBJ4PWmuN3LAfOu1xQ6iPIG8FxvdoFieu7H9fJLtIan541L0rqoA1i
         oSm2lAt/uYuKQqu1XVqMD/1szRxKbnFFkSJ9stahaR3wbTa2Tm+qH/+HFcIpOC6rVHGw
         2cmxHJr5VJ92VP7WrqA9PptOX9f1ARBj2qieuH1nGyRFBD18j51rOSeRsez3zPMRpDRo
         LVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpU+SSLFFT68FpBw2vFN+h9yffUizferjvptZotty9E=;
        b=EWcYs9so4qSeveFtePxKooX6sfiTbCdBOg1lkZCwZXSsE8si4Aqvr4k2dXBZH9mI3v
         4r6GIqcv4asJRozN85z42nMJNtbxKHOH61o0FukFVZrOXc1ApGGWaVh/GAR/65HZLpIy
         iw0i/oBJl/N3MuPN3D4zHsQYNPF8LCH8tLj32gcfpbDyeWvS3Fprvt3fMZFSidl6dHrT
         jl4w6uCW28vlpaH4czWI1yn+xF+2SXhS5Jyagmrg3HevFX4Dqdy8lgO1GrpRrUHhMRON
         fjTzZ9OzZ9fI7lyIPocbgZHL2VCwc2BOuCTi3SlJHYx5IMEbOdXpCt2mVDDWiQiBjiZ0
         TPJg==
X-Gm-Message-State: AOAM531vXgu+0PkOewwcfIQlqDCTO9H4wTwOkuLLupwimleeLCBY3oyY
        36qXrsfMjEs6k74mh/k1SZc=
X-Google-Smtp-Source: ABdhPJxxj67R7bRoywrgZoZMCh5rlt/jJbjUlBYigfEjiF9DP1SCPjJkC7fRk7xYRcebAho0F9tTQQ==
X-Received: by 2002:a02:ceb9:: with SMTP id z25mr7777239jaq.121.1636668163065;
        Thu, 11 Nov 2021 14:02:43 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
        by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 14:02:42 -0800 (PST)
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
Subject: [PATCH v10 10/10] drm: use DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS in 3 places
Date:   Thu, 11 Nov 2021 15:02:06 -0700
Message-Id: <20211111220206.121610-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

add sysfs knobs to enable modules' pr_debug()s ---> tracefs

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c |  8 ++++++++
 drivers/gpu/drm/drm_print.c                    | 13 ++++++++++---
 drivers/gpu/drm/i915/intel_gvt.c               | 15 ++++++++++++---
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index e49a755c6a69..58c56c1708e7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -80,6 +80,14 @@ DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(debug_dc, __debug_dc,
 				DC_DYNDBG_BITMAP_DESC(debug_dc),
 				amdgpu_bitmap);
 
+#if defined(CONFIG_TRACING)
+
+unsigned long __trace_dc;
+EXPORT_SYMBOL(__trace_dc);
+DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(trace_dc, __trace_dc,
+				DC_DYNDBG_BITMAP_DESC(trace_dc),
+				amdgpu_bitmap);
+#endif
 #endif
 
 #define DC_LOGGER_INIT(logger)
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index d5e0ffad467b..ee20e9c14ce9 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -72,9 +72,16 @@ static struct dyndbg_bitdesc drm_dyndbg_bitmap[] = {
 	[8] = { DRM_DBG_CAT_DP },
 	[9] = { DRM_DBG_CAT_DRMRES }
 };
-DEFINE_DYNAMIC_DEBUG_BITGRPS(debug, __drm_debug, DRM_DEBUG_DESC,
-			     drm_dyndbg_bitmap);
-
+DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(debug, __drm_debug, DRM_DEBUG_DESC,
+				drm_dyndbg_bitmap);
+
+#ifdef CONFIG_TRACING
+struct trace_array *trace_arr;
+unsigned long __drm_trace;
+EXPORT_SYMBOL(__drm_trace);
+DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS(trace, __drm_trace, DRM_DEBUG_DESC,
+				  drm_dyndbg_bitmap);
+#endif
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index efaac5777873..84348d4aedf6 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -195,8 +195,17 @@ static struct dyndbg_bitdesc i915_dyndbg_bitmap[] = {
 	help_(7, "gvt:render:")						\
 	help_(8, "gvt:sched:")
 
-DEFINE_DYNAMIC_DEBUG_BITGRPS(debug_gvt, __gvt_debug,
-			     I915_GVT_CATEGORIES(debug_gvt),
-			     i915_dyndbg_bitmap);
+DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(debug_gvt, __gvt_debug,
+				I915_GVT_CATEGORIES(debug_gvt),
+				i915_dyndbg_bitmap);
 
+#if defined(CONFIG_TRACING)
+
+unsigned long __gvt_trace;
+EXPORT_SYMBOL(__gvt_trace);
+DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS(trace_gvt, __gvt_trace,
+				  I915_GVT_CATEGORIES(trace_gvt),
+				  i915_dyndbg_bitmap);
+
+#endif
 #endif
-- 
2.31.1

