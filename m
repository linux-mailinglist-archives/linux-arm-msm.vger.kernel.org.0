Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225EF27104C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 21:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgISTgk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Sep 2020 15:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISTgi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Sep 2020 15:36:38 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226AFC0613CE;
        Sat, 19 Sep 2020 12:36:38 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f2so5545277pgd.3;
        Sat, 19 Sep 2020 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7VsdxD+1OUY1iuOfImGtGZsxp93pIxtgiAELnGBIf8o=;
        b=CvFnInfCybqLqP+tNr86/LOeDZ/1iIdJWcGulCo/xLwBSujQolgiXW2EBmO/2FJa44
         S3tFBmDs4uSgRkDRTT3Knknj/t/JDLT1Wt7bqwCKVBr5KSpWpAf6qV6yZPL05aWUSr43
         gc0hH8x8d9qI8v00skwhTHs6B5IjgZ+XAavj1OnrhDMS4IXWNrlyKw3gVv3wGl7mJBU7
         u0Rn70DNl3/7jqM041w07g1NIZKyaYQrAZPH0yGqVGVPDlJ3Z3vkeg/Ndc9gDw0yJf8l
         RkoMibyK7xtSzcVVZbBP0YsbfvHUT5DW27eIwRaUVCUht9GRLJcvmXbnIfSZdrXS9NEt
         YbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7VsdxD+1OUY1iuOfImGtGZsxp93pIxtgiAELnGBIf8o=;
        b=rc53cnj/ZlWeeG9bteZniaqbGye4rbVTPp5x3MZfCWkNiPaK+dr9fKKeess9GzPuqR
         NyRe13GPc96n4x6JMRpJuxZD/JWG1JVfUfzS7nPAQpt65Kr06048QzdYoBQLzZIXxFcz
         56WLXTuWlM6ThaA1RtRWmb7cYTnY5c5tT2tCE3bOP2t0gRrMoyLofGgIxxEdTq/KsUPa
         JOWUC2R7tDroSIQrqipRkgGVyHsWorF/LaXnZzFJwfzsGK6v/ahFiymkDPybfc0sHkJk
         lz7k1PFU2gHlJ3P2QYyK0O8obiG/fE87IOEM+tLPq1GNItMB/zwna9+rEUzRrLFgE186
         MBOA==
X-Gm-Message-State: AOAM532qtS+RBxNVrPtq4U66+wk33tMgyTfMSiiQ2pJxEqzGdjkE6cuC
        VY4FUwxcoiHJa+PiMGPLcUg=
X-Google-Smtp-Source: ABdhPJz7NMJRNRuLfpWgnHbyS2MqLZ6mQ9iOw/mKZIE7oo1Gcm9Lw1ACSLLPOoArQXAbYQ7Ovip9xg==
X-Received: by 2002:a63:4b1c:: with SMTP id y28mr26589970pga.53.1600544197645;
        Sat, 19 Sep 2020 12:36:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id k27sm6778575pgb.12.2020.09.19.12.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 12:36:36 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
        timmurray@google.com, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/crtc: Introduce per-crtc kworker
Date:   Sat, 19 Sep 2020 12:37:24 -0700
Message-Id: <20200919193727.2093945-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919193727.2093945-1-robdclark@gmail.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This will be used for non-block atomic commits.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_crtc.c | 11 +++++++++++
 include/drm/drm_crtc.h     |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index aecdd7ea26dc..4f7c0bfce0a3 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -326,6 +326,14 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 					   config->prop_out_fence_ptr, 0);
 		drm_object_attach_property(&crtc->base,
 					   config->prop_vrr_enabled, 0);
+
+		crtc->worker = kthread_create_worker(0, "%s-worker", crtc->name);
+		if (IS_ERR(crtc->worker)) {
+			drm_mode_object_unregister(dev, &crtc->base);
+			ret = PTR_ERR(crtc->worker);
+			crtc->worker = NULL;
+			return ret;
+		}
 	}
 
 	return 0;
@@ -366,6 +374,9 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
 
 	kfree(crtc->name);
 
+	if (crtc->worker)
+		kthread_destroy_worker(crtc->worker);
+
 	memset(crtc, 0, sizeof(*crtc));
 }
 EXPORT_SYMBOL(drm_crtc_cleanup);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 59b51a09cae6..8964a3732bca 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -30,6 +30,7 @@
 #include <linux/types.h>
 #include <linux/fb.h>
 #include <linux/hdmi.h>
+#include <linux/kthread.h>
 #include <linux/media-bus-format.h>
 #include <uapi/drm/drm_mode.h>
 #include <uapi/drm/drm_fourcc.h>
@@ -1172,6 +1173,13 @@ struct drm_crtc {
 	 * Initialized via drm_self_refresh_helper_init().
 	 */
 	struct drm_self_refresh_data *self_refresh_data;
+
+	/**
+	 * worker:
+	 *
+	 * Per-CRTC worker for nonblock atomic commits.
+	 */
+	struct kthread_worker *worker;
 };
 
 /**
-- 
2.26.2

