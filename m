Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A861944DD8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 23:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbhKKWFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 17:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234146AbhKKWFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 17:05:15 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFE8C0613F5;
        Thu, 11 Nov 2021 14:02:26 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id l8so7212257ilv.3;
        Thu, 11 Nov 2021 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/eb6uDj0ZcPussZNWTyXvX7+BhhrBBdZ4eRtPk3Njs=;
        b=pkmN9aFmUvCHVM0y8octaoOSLL2D84Qi2xdBg4z2fk3sW6d1XPH/q4CjvttBUKGjeC
         xIwejMZMQO9qi1vwAb7AChnONzCruzpGLlDyXqVc01g98NrZVL1/DIcEhuml3Ibup6Xj
         nLcN5fjd/zzLCdt9ipYhqyGfsgNHQ6jMdJn3inmE5tp0XM6A4PYJVhtGXn69a+vcG3Q6
         xzF5QFCGjsnxnr2BADQSUzRnc6R+NhF+duXC/MbAVuHi9gVsgGjT8I7TCO12mHC9Ty2P
         OvtmmU+mbzRMEXBtShHLgsd7ZE7xBTQISLD/edfdUr7T3zxN29wWB9PcNqR0ppi5esYx
         c6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/eb6uDj0ZcPussZNWTyXvX7+BhhrBBdZ4eRtPk3Njs=;
        b=CsY7ByJjXAMiwvR13Z6Uu76gR16LoIxvVQOdxWHNVXunj76oGK+wQsogyP2jZRJrjm
         8kw9dp5rtFkqkk5fspUyop60IQw4JDMDhD/HWQowp/VDAhhy/ApPPY8m7/sb2E+6W2wa
         ChChJywMbSWKuTempiTrcZe+Y63UiNimk09l0eBk8u1aUXheMv6zmkmr0S7oLQ+n72Bm
         v1EjGXiziOqJUAe7C0m/+YyHMfiUapkGR9mFTZJ0vZUxuuilNjqmnBrmdCd7t4SB7QMs
         XRpeEwBQxldZWHwmHN64GJrlO/Oq3TBL19ElfkVXQweSBFi2okz6wP7RXllvn8mn9caM
         ahdw==
X-Gm-Message-State: AOAM530dupDOz/6MrdxFCoR69fmX8CsMm5MRsNmSXH7QKT1DV/TVg8WX
        rLuniT76HjYRookPVVVIOvg=
X-Google-Smtp-Source: ABdhPJx6anogQ0dO7LsuIXNJzXEDRujujjsWcMLO0UFoTgFFwFE9Z53u3/uEPFJpppNAdDHHm6d0tA==
X-Received: by 2002:a05:6e02:1709:: with SMTP id u9mr6278973ill.242.1636668145701;
        Thu, 11 Nov 2021 14:02:25 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
        by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 14:02:25 -0800 (PST)
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
Subject: [PATCH v10 03/10] amdgpu: use dyndbg.BITGRPS to control existing pr_debugs
Date:   Thu, 11 Nov 2021 15:01:59 -0700
Message-Id: <20211111220206.121610-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

logger_types.h defines many DC_LOG_*() categorized debug wrappers.
Most of these already use DRM debug API, so are controllable using
drm.debug, but others use a bare pr_debug("$prefix: .."), with 1 of 13
different class-prefixes matching [:uppercase:]

Use DEFINE_DYNAMIC_DEBUG_BITGRPS to create a sysfs location which maps
from bits to these 13 sets of categorized pr_debugs to en/disable.

Makefile adds -DDYNAMIC_DEBUG_MODULE for CONFIG_DYNAMIC_DEBUG_CORE,
otherwise BUILD_BUG_ON triggers (obvious errors on subtle misuse is
better than mysterious ones).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |  2 +
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 47 ++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 653726588956..077342ca803f 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -38,6 +38,8 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
 	-I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
 	-I$(FULL_AMD_PATH)/amdkfd
 
+ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DYNAMIC_DEBUG_MODULE
+
 amdgpu-y := amdgpu_drv.o
 
 # add KMS driver
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index 21be2a684393..e49a755c6a69 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -36,8 +36,53 @@
 
 #include "resource.h"
 
-#define DC_LOGGER_INIT(logger)
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+#include <linux/dynamic_debug.h>
+
+unsigned long __debug_dc;
+EXPORT_SYMBOL(__debug_dc);
+
+#define help_(_N, _cat)	"\t  Bit-" #_N "\t" _cat "\n"
+
+#define DC_DYNDBG_BITMAP_DESC(name)					\
+	"Control pr_debugs via /sys/module/amdgpu/parameters/" #name	\
+	", where each bit controls a debug category.\n"			\
+	help_(0, "[SURFACE]:")						\
+	help_(1, "[CURSOR]:")						\
+	help_(2, "[PFLIP]:")						\
+	help_(3, "[VBLANK]:")						\
+	help_(4, "[HW_LINK_TRAINING]:")					\
+	help_(5, "[HW_AUDIO]:")						\
+	help_(6, "[SCALER]:")						\
+	help_(7, "[BIOS]:")						\
+	help_(8, "[BANDWIDTH_CALCS]:")					\
+	help_(9, "[DML]:")						\
+	help_(10, "[IF_TRACE]:")					\
+	help_(11, "[GAMMA]:")						\
+	help_(12, "[SMU_MSG]:")
+
+static struct dyndbg_bitdesc amdgpu_bitmap[] = {
+	[0] = { "[CURSOR]:" },
+	[1] = { "[PFLIP]:" },
+	[2] = { "[VBLANK]:" },
+	[3] = { "[HW_LINK_TRAINING]:" },
+	[4] = { "[HW_AUDIO]:" },
+	[5] = { "[SCALER]:" },
+	[6] = { "[BIOS]:" },
+	[7] = { "[BANDWIDTH_CALCS]:" },
+	[8] = { "[DML]:" },
+	[9] = { "[IF_TRACE]:" },
+	[10] = { "[GAMMA]:" },
+	[11] = { "[SMU_MSG]:" }
+};
+
+DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(debug_dc, __debug_dc,
+				DC_DYNDBG_BITMAP_DESC(debug_dc),
+				amdgpu_bitmap);
+
+#endif
 
+#define DC_LOGGER_INIT(logger)
 
 #define SURFACE_TRACE(...) do {\
 		if (dc->debug.surface_trace) \
-- 
2.31.1

