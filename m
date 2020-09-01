Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F382596AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgIAQFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbgIAPlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 11:41:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D12C061246;
        Tue,  1 Sep 2020 08:41:15 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e33so887438pgm.0;
        Tue, 01 Sep 2020 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UrLlTmYG1RGdAv4uh1a2Vj9Ca0f5vJ6xgSyvmtjMFJ8=;
        b=c703Ej1oAv/twTNahzRLiABY2Gdfj7BHDVrm64a2qQIk4mlySrEPWPWhBXk/Z7YV7C
         7KLjWx47ts3wDWsWsoN9gKXOjI3ISM8D5mAqiTDqv1CPUxYxVqQC4dhHxl/2jdg5HfYq
         /0V2gpsi/tRtSRlREjtuAU7/0/W1trOjERb0ON/1C9AXajlPBR/N6hqCBq6moOHQR671
         KqDgmh1voQ822awqEID/n/fcfSkOiOvTBlUvycWF8edxaG8KXWfbRRRd+GKhFfrBF3G8
         8wfE/zjANx9DOG98a6BPskMiedzWuGyVrZJfnj+WioMkmfOEhJeNtak0wQeSAcQ2Dwk9
         f32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UrLlTmYG1RGdAv4uh1a2Vj9Ca0f5vJ6xgSyvmtjMFJ8=;
        b=j9YcoYlFJmAphKVcNiGNiBVDEuKdC4VxCB6hD7fCgz5aDtRXDhkOrPWsQeflwPJmcz
         RkVTBtrh9G9gjCqF+59acqMFsbOVISPXOcUdNQbIKj9BUdTc+H6hn8qvdhAVw/X0ecDb
         OEJxAMCLGnMBr2AELQeCB+kuC8o8JMKEdse+5qICnuC2mJzOtXpkwPFmoL7OL5eowUan
         pBAqvNEyzNo4gAXTu5YgfZIv6D+F7CTlUaxOV0xYHqEo8IS7X3MWR8AiIchRThcpm099
         F7ZlBCD2pnk1xT0LvOMJqEQ2fiiBx6M5oIPQ9rM90q2kJrD4T0pXDj5OZh4TunDOaYIV
         25IA==
X-Gm-Message-State: AOAM530TumLKO9RAPvM0XHloOybK+ytQzElQR0HovpcLbFwGOMwMzhKt
        kE5xAI7j6+/pkXnQHEsoqG8=
X-Google-Smtp-Source: ABdhPJyFbCGyio3eMah/PcTiHzD5KOkPR/XDwROjdZrngkCxNWsVjpHitZHMPdN8toexNvaczokcKw==
X-Received: by 2002:a63:5f8b:: with SMTP id t133mr2072708pgb.238.1598974875113;
        Tue, 01 Sep 2020 08:41:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id h11sm2454426pfq.101.2020.09.01.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:41:14 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/msm: Convert shrinker msgs to tracepoints
Date:   Tue,  1 Sep 2020 08:41:55 -0700
Message-Id: <20200901154200.2451899-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901154200.2451899-1-robdclark@gmail.com>
References: <20200901154200.2451899-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This reduces the spam in dmesg when we start hitting the shrinker, and
replaces it with something we can put on a timeline while profiling or
debugging system issues.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c |  5 +++--
 drivers/gpu/drm/msm/msm_gpu_trace.h    | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 722d61668a97..482576d7a39a 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -6,6 +6,7 @@
 
 #include "msm_drv.h"
 #include "msm_gem.h"
+#include "msm_gpu_trace.h"
 
 static bool msm_gem_shrinker_lock(struct drm_device *dev, bool *unlock)
 {
@@ -87,7 +88,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 		mutex_unlock(&dev->struct_mutex);
 
 	if (freed > 0)
-		pr_info_ratelimited("Purging %lu bytes\n", freed << PAGE_SHIFT);
+		trace_msm_gem_purge(freed << PAGE_SHIFT);
 
 	return freed;
 }
@@ -123,7 +124,7 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 	*(unsigned long *)ptr += unmapped;
 
 	if (unmapped > 0)
-		pr_info_ratelimited("Purging %u vmaps\n", unmapped);
+		trace_msm_gem_purge_vmaps(unmapped);
 
 	return NOTIFY_DONE;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 07572ab179fa..1079fe551279 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -114,6 +114,32 @@ TRACE_EVENT(msm_gmu_freq_change,
 		TP_printk("freq=%u, perf_index=%u", __entry->freq, __entry->perf_index)
 );
 
+
+TRACE_EVENT(msm_gem_purge,
+		TP_PROTO(u32 bytes),
+		TP_ARGS(bytes),
+		TP_STRUCT__entry(
+			__field(u32, bytes)
+			),
+		TP_fast_assign(
+			__entry->bytes = bytes;
+			),
+		TP_printk("Purging %u bytes", __entry->bytes)
+);
+
+
+TRACE_EVENT(msm_gem_purge_vmaps,
+		TP_PROTO(u32 unmapped),
+		TP_ARGS(unmapped),
+		TP_STRUCT__entry(
+			__field(u32, unmapped)
+			),
+		TP_fast_assign(
+			__entry->unmapped = unmapped;
+			),
+		TP_printk("Purging %u vmaps", __entry->unmapped)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
-- 
2.26.2

