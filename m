Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE894CCB14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 01:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237284AbiCDA7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 19:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237519AbiCDA7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 19:59:38 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6BE12151C;
        Thu,  3 Mar 2022 16:58:50 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id e15so4647740pfv.11;
        Thu, 03 Mar 2022 16:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kv77qd4PSFspNn60wgWHjcnbGuvG0XAUW/UNL97NgM8=;
        b=khzeGuKmCXjXbwofoPBleHTv5nP7hSLS2E2RqjTJNIUopIl0dYhlTfQN9pzt9uc9gQ
         iQjXrm4DMaP4xyJm7ImI1O5HElmSKwrXGuSu8C7pebs6dAXhL4u6Z/6frf6oHo+y+cqK
         bRBuXNHlvf9o+He5KI4egPDp+ju/F5lcrv+6jNFmnkThO1Kk++oA+YwLJVq2s+y2k5dd
         RcLoLUJYOSFByB8EJvQcfkPnqVtq9AWrFkiriyEpOciOM2MehMCPc0woJKVNWCwhMdKL
         xAGCuJNHRV7LnydJgzDREckzv/t/73p8tPFaXZjjeG7zIBq79pPtIB+jffMLaDu6YBN2
         vApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kv77qd4PSFspNn60wgWHjcnbGuvG0XAUW/UNL97NgM8=;
        b=qMYTFkhYSd+/6kJyK41k/fnpeLtzUKtRebhRMhaiBR0vQ8jMKnj9uQz5qgmxIbjvI3
         NIW/9jhGd6aKL5z3HBU7WSJO4mvbq+8zjTWNSs8gBdKhXVaMKTCMALopxqhYBL9Pye2L
         DdyLfSXJ8OHIuORJnr4hX5MD0j/w07TVXeiCp48fXFNQiFryHQ0JDX3z6CoZtphLLlD9
         709TjUJoFb3L3/b72QbfiGyeJZ6fdUE7yf0tuIIIPp2fxeIbke9rq6eedtwTiK2l57FQ
         epbRdAVLgkcNgdsedeazy/TkR8nLV3IWC6l+sVO/LEOHygqZ9N1J3OGT93RRNfNMo2uh
         FMhQ==
X-Gm-Message-State: AOAM53182P7QJ0PYtsQD9kZVzyoGYxMZUWiM+23zn37GtJZtCWtP4hiT
        n6b6sQkgWfmYZjqZajM15qs=
X-Google-Smtp-Source: ABdhPJxbDPSAz5zACha46Uptn48v/t+AJ6SSwLF9ex8ZzdmGzA5kwQWIyNCPlmEtKEAWFPLH1xCu8g==
X-Received: by 2002:a63:110e:0:b0:375:89f4:b54e with SMTP id g14-20020a63110e000000b0037589f4b54emr31874054pgl.430.1646355530123;
        Thu, 03 Mar 2022 16:58:50 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a0010cb00b004e1b76b09c0sm3634242pfu.74.2022.03.03.16.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 16:58:49 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Emma Anholt <emma@anholt.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] drm/msm: Add SYSPROF param (v2)
Date:   Thu,  3 Mar 2022 16:52:16 -0800
Message-Id: <20220304005317.776110-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304005317.776110-1-robdclark@gmail.com>
References: <20220304005317.776110-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Add a SYSPROF param for system profiling tools like Mesa's pps-producer
(perfetto) to control behavior related to system-wide performance
counter collection.  In particular, for profiling, one wants to ensure
that GPU context switches do not effect perfcounter state, and might
want to suppress suspend (which would cause counters to lose state).

v2: Swap the order in msm_file_private_set_sysprof() [sboyd] and
    initialize the sysprof_active refcount to one (because the under/
    overflow checking in refcount_t doesn't expect a 0->1 transition)
    meaning that values greater than 1 means sysprof is active.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_drv.c           |  8 +++++
 drivers/gpu/drm/msm/msm_gpu.c           |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h           | 27 +++++++++++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c   | 39 +++++++++++++++++++++++++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6a37d409653b..c91ea363c373 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -287,6 +287,10 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t value)
 {
 	switch (param) {
+	case MSM_PARAM_SYSPROF:
+		if (!capable(CAP_SYS_ADMIN))
+			return -EPERM;
+		return msm_file_private_set_sysprof(ctx, gpu, value);
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ca9a8a866292..780f9748aaaf 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -559,8 +559,16 @@ static void context_close(struct msm_file_private *ctx)
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx = file->driver_priv;
 
+	/*
+	 * It is not possible to set sysprof param to non-zero if gpu
+	 * is not initialized:
+	 */
+	if (priv->gpu)
+		msm_file_private_set_sysprof(ctx, priv->gpu, 0);
+
 	context_close(ctx);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c4fe8bc9445e..8fe4aee96aa9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -975,6 +975,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	gpu->nr_rings = nr_rings;
 
+	refcount_set(&gpu->sysprof_active, 1);
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index fde9a29f884e..a84140055920 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -160,6 +160,13 @@ struct msm_gpu {
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
+	/**
+	 * sysprof_active:
+	 *
+	 * The count of contexts that have enabled system profiling.
+	 */
+	refcount_t sysprof_active;
+
 	/**
 	 * cur_ctx_seqno:
 	 *
@@ -330,6 +337,24 @@ struct msm_file_private {
 	struct kref ref;
 	int seqno;
 
+	/**
+	 * sysprof:
+	 *
+	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
+	 * intended to be used by system profiling tools like Mesa's
+	 * pps-producer (perfetto), and restricted to CAP_SYS_ADMIN.
+	 *
+	 * Setting a value of 1 will preserve performance counters across
+	 * context switches.  Setting a value of 2 will in addition
+	 * suppress suspend.  (Performance counters lose state across
+	 * power collapse, which is undesirable for profiling in some
+	 * cases.)
+	 *
+	 * The value automatically reverts to zero when the drm device
+	 * file is closed.
+	 */
+	int sysprof;
+
 	/**
 	 * elapsed:
 	 *
@@ -545,6 +570,8 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
+int msm_file_private_set_sysprof(struct msm_file_private *ctx,
+				 struct msm_gpu *gpu, int sysprof);
 void __msm_file_private_destroy(struct kref *kref);
 
 static inline void msm_file_private_put(struct msm_file_private *ctx)
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7cb158bcbcf6..79b6ccd6ce64 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -7,6 +7,45 @@
 
 #include "msm_gpu.h"
 
+int msm_file_private_set_sysprof(struct msm_file_private *ctx,
+				 struct msm_gpu *gpu, int sysprof)
+{
+	/*
+	 * Since pm_runtime and sysprof_active are both refcounts, we
+	 * call apply the new value first, and then unwind the previous
+	 * value
+	 */
+
+	switch (sysprof) {
+	default:
+		return -EINVAL;
+	case 2:
+		pm_runtime_get_sync(&gpu->pdev->dev);
+		fallthrough;
+	case 1:
+		refcount_inc(&gpu->sysprof_active);
+		fallthrough;
+	case 0:
+		break;
+	}
+
+	/* unwind old value: */
+	switch (ctx->sysprof) {
+	case 2:
+		pm_runtime_put_autosuspend(&gpu->pdev->dev);
+		fallthrough;
+	case 1:
+		refcount_dec(&gpu->sysprof_active);
+		fallthrough;
+	case 0:
+		break;
+	}
+
+	ctx->sysprof = sysprof;
+
+	return 0;
+}
+
 void __msm_file_private_destroy(struct kref *kref)
 {
 	struct msm_file_private *ctx = container_of(kref,
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index a1bb2a17a8b9..07efc8033492 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -81,6 +81,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_PP_PGTABLE 0x08  /* RO: Deprecated, always returns zero */
 #define MSM_PARAM_FAULTS     0x09  /* RO */
 #define MSM_PARAM_SUSPENDS   0x0a  /* RO */
+#define MSM_PARAM_SYSPROF    0x0b  /* WO: 1 preserves perfcntrs, 2 also disables suspend */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.35.1

