Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1662A21E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 19:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbfH2RL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 13:11:59 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36477 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2RL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 13:11:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id w2so2497618pfi.3;
        Thu, 29 Aug 2019 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jS5pHxiuZzzwI5bJqpF22mVfJqpldppDHKL3mSY0vqE=;
        b=LJfbr0D7f5YzZ+QrRF8C7f85g0y2RO+vjR1VqWi1G2IUsGO9jOePtV/N6uFXZGK0eo
         U6SuAjpZf2bIzPE4XJu6dRSVJexjNMVn8/GCVCy/ukXvonfECBIyYNEUf+wjW6PRV+pn
         N8WR04My2B5xA1W7fTjo37rJI8ZI0YbZXg8Abv7eqVONv2wI7jlwm/3XNXkZsapZL/WL
         ys2bssJv+fWriIJssEiCBjb4ICXHWowye5LXcRhXRX1Bah++0qHdW1lyVvARBSgUxqJu
         bQ3A7ZzNQBqLYTGEPOtfHvP6EQZuN+AoHU2A+mLzmTevPZ73rnponFdrw4DJ47AHWVbN
         5MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jS5pHxiuZzzwI5bJqpF22mVfJqpldppDHKL3mSY0vqE=;
        b=JfHZIWOhEkLh65fJGBPA/KRMH6xt9ayzcYAp5uKiO0g0QsSbvyMswNpLzovHXNFznK
         lVRZItj3UqeYLYro+TmcpdrcSWVhaD4rHH4qlloJzYFnKo4+toxJ558t5/rKs2r4NcZs
         awi/wy46SRAZBEPPL0apcS/Hw2UCoTpW263euthnGp7JuJRYvZG1Whaj17/HnS0OryiN
         oyDr3JwIdUqLxf0WMy44rMrwyTNhReMHKfFFCNQzzTd9rZSqnWojo7MWum7GVfwQFULP
         qE/eqylvTfdx6cUbCCWAfrw9H6kQcY2GD7xbec2oP/ibLaYdl99920mmgbK6zrEXVoAK
         BLQg==
X-Gm-Message-State: APjAAAWS3NfQ+to8Hdcii9CoZnutSEExPObrJj4fOVsaIPpjX9GBJ4x1
        kBxCmCz7W3X8E9oWKhPlwpQ=
X-Google-Smtp-Source: APXvYqyQAmS21+aUqk33WgOu4hVs/D8gcy1swXDIgGuyutKZghpZX1heSOHf9YSrvxJjYjQeVl4oXA==
X-Received: by 2002:a65:6415:: with SMTP id a21mr8817507pgv.98.1567098717772;
        Thu, 29 Aug 2019 10:11:57 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id x10sm2381540pjo.4.2019.08.29.10.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 10:11:57 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU)
Subject: [PATCH 10/10] drm/msm: add atomic traces
Date:   Thu, 29 Aug 2019 09:45:18 -0700
Message-Id: <20190829164601.11615-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829164601.11615-1-robdclark@gmail.com>
References: <20190829164601.11615-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This was useful for debugging fps drops.  I suspect it will be useful
again.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/Makefile                 |   1 +
 drivers/gpu/drm/msm/msm_atomic.c             |  24 +++-
 drivers/gpu/drm/msm/msm_atomic_trace.h       | 110 +++++++++++++++++++
 drivers/gpu/drm/msm/msm_atomic_tracepoints.c |   3 +
 drivers/gpu/drm/msm/msm_gpu_trace.h          |   2 +-
 5 files changed, 136 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_atomic_trace.h
 create mode 100644 drivers/gpu/drm/msm/msm_atomic_tracepoints.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7a05cbf2f820..1579cf0d828f 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -75,6 +75,7 @@ msm-y := \
 	disp/dpu1/dpu_rm.o \
 	disp/dpu1/dpu_vbif.o \
 	msm_atomic.o \
+	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
 	msm_drv.o \
 	msm_fb.o \
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 80536538967b..fb247aa1081e 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic_uapi.h>
 
+#include "msm_atomic_trace.h"
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_kms.h"
@@ -33,11 +34,13 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 {
 	unsigned crtc_mask = BIT(crtc_idx);
 
+	trace_msm_atomic_async_commit_start(crtc_mask);
+
 	mutex_lock(&kms->commit_lock);
 
 	if (!(kms->pending_crtc_mask & crtc_mask)) {
 		mutex_unlock(&kms->commit_lock);
-		return;
+		goto out;
 	}
 
 	kms->pending_crtc_mask &= ~crtc_mask;
@@ -47,19 +50,24 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 	/*
 	 * Flush hardware updates:
 	 */
-	DRM_DEBUG_ATOMIC("triggering async commit\n");
+	trace_msm_atomic_flush_commit(crtc_mask);
 	kms->funcs->flush_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
 
 	/*
 	 * Wait for flush to complete:
 	 */
+	trace_msm_atomic_wait_flush_start(crtc_mask);
 	kms->funcs->wait_flush(kms, crtc_mask);
+	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
 	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
 	kms->funcs->disable_commit(kms);
+
+out:
+	trace_msm_atomic_async_commit_finish(crtc_mask);
 }
 
 static enum hrtimer_restart msm_atomic_pending_timer(struct hrtimer *t)
@@ -144,13 +152,17 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	bool async = kms->funcs->vsync_time &&
 			can_do_async(state, &async_crtc);
 
+	trace_msm_atomic_commit_tail_start(async, crtc_mask);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
 	 * Ensure any previous (potentially async) commit has
 	 * completed:
 	 */
+	trace_msm_atomic_wait_flush_start(crtc_mask);
 	kms->funcs->wait_flush(kms, crtc_mask);
+	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
 	mutex_lock(&kms->commit_lock);
 
@@ -201,6 +213,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		drm_atomic_helper_commit_hw_done(state);
 		drm_atomic_helper_cleanup_planes(dev, state);
 
+		trace_msm_atomic_commit_tail_finish(async, crtc_mask);
+
 		return;
 	}
 
@@ -213,14 +227,16 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	/*
 	 * Flush hardware updates:
 	 */
-	DRM_DEBUG_ATOMIC("triggering commit\n");
+	trace_msm_atomic_flush_commit(crtc_mask);
 	kms->funcs->flush_commit(kms, crtc_mask);
 	mutex_unlock(&kms->commit_lock);
 
 	/*
 	 * Wait for flush to complete:
 	 */
+	trace_msm_atomic_wait_flush_start(crtc_mask);
 	kms->funcs->wait_flush(kms, crtc_mask);
+	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
 	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
@@ -229,4 +245,6 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	drm_atomic_helper_commit_hw_done(state);
 	drm_atomic_helper_cleanup_planes(dev, state);
+
+	trace_msm_atomic_commit_tail_finish(async, crtc_mask);
 }
diff --git a/drivers/gpu/drm/msm/msm_atomic_trace.h b/drivers/gpu/drm/msm/msm_atomic_trace.h
new file mode 100644
index 000000000000..b4ca0ed3b4a3
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_atomic_trace.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(_MSM_GPU_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _MSM_GPU_TRACE_H_
+
+#include <linux/tracepoint.h>
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM drm_msm_atomic
+#define TRACE_INCLUDE_FILE msm_atomic_trace
+
+TRACE_EVENT(msm_atomic_commit_tail_start,
+	    TP_PROTO(bool async, unsigned crtc_mask),
+	    TP_ARGS(async, crtc_mask),
+	    TP_STRUCT__entry(
+		    __field(bool, async)
+		    __field(u32, crtc_mask)
+		    ),
+	    TP_fast_assign(
+		    __entry->async = async;
+		    __entry->crtc_mask = crtc_mask;
+		    ),
+	    TP_printk("async=%d crtc_mask=%x",
+		    __entry->async, __entry->crtc_mask)
+);
+
+TRACE_EVENT(msm_atomic_commit_tail_finish,
+	    TP_PROTO(bool async, unsigned crtc_mask),
+	    TP_ARGS(async, crtc_mask),
+	    TP_STRUCT__entry(
+		    __field(bool, async)
+		    __field(u32, crtc_mask)
+		    ),
+	    TP_fast_assign(
+		    __entry->async = async;
+		    __entry->crtc_mask = crtc_mask;
+		    ),
+	    TP_printk("async=%d crtc_mask=%x",
+		    __entry->async, __entry->crtc_mask)
+);
+
+TRACE_EVENT(msm_atomic_async_commit_start,
+	    TP_PROTO(unsigned crtc_mask),
+	    TP_ARGS(crtc_mask),
+	    TP_STRUCT__entry(
+		    __field(u32, crtc_mask)
+		    ),
+	    TP_fast_assign(
+		    __entry->crtc_mask = crtc_mask;
+		    ),
+	    TP_printk("crtc_mask=%x",
+		    __entry->crtc_mask)
+);
+
+TRACE_EVENT(msm_atomic_async_commit_finish,
+	    TP_PROTO(unsigned crtc_mask),
+	    TP_ARGS(crtc_mask),
+	    TP_STRUCT__entry(
+		    __field(u32, crtc_mask)
+		    ),
+	    TP_fast_assign(
+		    __entry->crtc_mask = crtc_mask;
+		    ),
+	    TP_printk("crtc_mask=%x",
+		    __entry->crtc_mask)
+);
+
+TRACE_EVENT(msm_atomic_wait_flush_start,
+	    TP_PROTO(unsigned crtc_mask),
+	    TP_ARGS(crtc_mask),
+	    TP_STRUCT__entry(
+		    __field(u32, crtc_mask)
+		    ),
+	    TP_fast_assign(
+		    __entry->crtc_mask = crtc_mask;
+		    ),
+	    TP_printk("crtc_mask=%x",
+		    __entry->crtc_mask)
+);
+
+TRACE_EVENT(msm_atomic_wait_flush_finish,
+	    TP_PROTO(unsigned crtc_mask),
+	    TP_ARGS(crtc_mask),
+	    TP_STRUCT__entry(
+		    __field(u32, crtc_mask)
+		    ),
+	    TP_fast_assign(
+		    __entry->crtc_mask = crtc_mask;
+		    ),
+	    TP_printk("crtc_mask=%x",
+		    __entry->crtc_mask)
+);
+
+TRACE_EVENT(msm_atomic_flush_commit,
+	    TP_PROTO(unsigned crtc_mask),
+	    TP_ARGS(crtc_mask),
+	    TP_STRUCT__entry(
+		    __field(u32, crtc_mask)
+		    ),
+	    TP_fast_assign(
+		    __entry->crtc_mask = crtc_mask;
+		    ),
+	    TP_printk("crtc_mask=%x",
+		    __entry->crtc_mask)
+);
+
+#endif
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/msm
+#include <trace/define_trace.h>
diff --git a/drivers/gpu/drm/msm/msm_atomic_tracepoints.c b/drivers/gpu/drm/msm/msm_atomic_tracepoints.c
new file mode 100644
index 000000000000..011dc881f391
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_atomic_tracepoints.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#define CREATE_TRACE_POINTS
+#include "msm_atomic_trace.h"
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 1155118a27a1..122b84789238 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -5,7 +5,7 @@
 #include <linux/tracepoint.h>
 
 #undef TRACE_SYSTEM
-#define TRACE_SYSTEM drm_msm
+#define TRACE_SYSTEM drm_msm_gpu
 #define TRACE_INCLUDE_FILE msm_gpu_trace
 
 TRACE_EVENT(msm_gpu_submit,
-- 
2.21.0

