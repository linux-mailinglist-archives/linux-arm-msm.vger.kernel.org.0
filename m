Return-Path: <linux-arm-msm+bounces-40585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8419E5C43
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36B7B18802A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0640F21C173;
	Thu,  5 Dec 2024 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/oeQo8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3A165EFC;
	Thu,  5 Dec 2024 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417676; cv=none; b=HmycMtLkOWRy99C6CUXjtJQTsM/r2dLvLZ8QXKJHl7yw5Ueg6zzeP2ES18XKrwwxql0kTAfMn6/SBu9dga4tGnxzKreqtfe+jt6Ev5iuqm8X5pwAcF2HhloaikeojAK5wDhNajEZbv1oh9MmKcqua/EAgZae51rj+3E3EEbihX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417676; c=relaxed/simple;
	bh=c0T2W57mUTdv89pc64uQoBBf04uwwOASsr98xtbZWBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMXNdx5R7Xz/ucgxdEZtyEnW5H4RDfXdhYjpHNB9n67Z6Rxr2G56zHYCd1bIbJ8CUz37WkMDZONgxIA9FHPpqUG5U4ZTKIumuvGCaYbh0GmuITwXBa/cg53E2D9I3RX5CE0rmGf8LMfgOUGB/VFHOuR45LzmjkFxdvOxnRx4tL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/oeQo8K; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fd1dcbbc08so542033a12.3;
        Thu, 05 Dec 2024 08:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733417674; x=1734022474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn0SGYEpdVC2XTloHJxrfRD+aLFLQ4os0UEd17zTTWs=;
        b=Z/oeQo8KlyJTIQ1HghC2KkUGnLpVptbJtxxYJP3eurTT18Lg80b6L7nKG4EWwtAXpP
         1RM3FgqaR9pzc3+O90DpAvgrDvNAdJn7p1Sw9Qy5Dw+FW2WssVjo44vfc4+qPWhXi2pd
         XLyL6+Jdw0INsfYqbKPNNdonfoZOExVifOTxIobkiPH2k59u/qc3jqjq8hllHxVPRQZW
         QqzR9v66cJ3G7z2KGWJLZfAke8q8Qw4cV0OjbVYtUYIMVFaRa2tlDcNgamZrkGaLc0S+
         hXLP76WN+sG3tjUDTWKID8dE+F7UhYUwv5zIEd5KB9+PGf/CBr7Fy08azXeDRXd0r/la
         4W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417674; x=1734022474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn0SGYEpdVC2XTloHJxrfRD+aLFLQ4os0UEd17zTTWs=;
        b=BTbA8UYJtdR3jgFhj2tA2wUISHxXseR7pOjzFtLmkVCL107m1e7XR9EvfCPuuZAMT4
         sAJwF+XhOivWc/StGpUeCIFZGN7v1E58lymLdqbVEmnSBFIJ2+KSwHdrxpqt+M0vi4gp
         2toZWMaYC4+2c1yMCYLNQ0dHaplfvzzpQlN5RaJgC/gZGi33JkwlwLXrnWrH4cp6+73i
         CrC6wmzHvw5UPoQZ1GyA2jUNhDL7nI47/2W5yJU58sTZ3YYwrGCwXJdRq76C1Q+/wUmc
         n2SgwZnCdUm3Il042mWy/6xrZa9H+PS5N91qh/R8uaXu+CUPExsag/F86rCEnQGMDCgO
         6Iig==
X-Forwarded-Encrypted: i=1; AJvYcCVpsGg4B3w++wfXXMFBbNyNUJZkc1SCSi1PHLZqcoOnDbN0aJp8YwymwYjMHtAScGp/RitvIUg9hYlELLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjkAqbgHZ9IGjZIO1Gvg+OkJrV26vGHkvSW6ig1j/0ssCdxKWm
	WhRPaqNZSPMDcj6dbeJcQ+gG/+LbQKzJJUmtGMz95trEAhoWWKd75amV5g==
X-Gm-Gg: ASbGncvuWVJHqCfePsOslheHYVaVNNVAs1eeRrnCEk5bdvXwlYRI7mI4h1HRZkPgFXa
	eHBDm5nTb+Hy8pmVBPpYDejvBnyfbApUC4JheaC2wFe1rQvX/LTokhj0uaeNOl4KW/mqYRqOLPJ
	kSttZ3X/VtI6RQ4NtpMXL0AdHOi0Yb+MFhiB9NMnRMzlfwsWJxc+JCP7Zp6df1S6GIWHsNLCLOC
	HBJp5p3etumO7vSDKL5kctHEgpAHyw3uPVjwgoCdM1P0orOkdSyaGIxQo7I9eF6mwz8rgm7GTla
	OJVbKOz95HI6dxiAG4Vingb0
X-Google-Smtp-Source: AGHT+IH6c4n4lMWz2tkVfQAsnwNt3ElGSgYjtnyjOea/GD2+GgVwTpqe57dWmQRReNubG+Nmvyx/Yg==
X-Received: by 2002:a05:6a20:7f9a:b0:1db:915b:ab11 with SMTP id adf61e73a8af0-1e1653c834bmr16834822637.24.1733417674330;
        Thu, 05 Dec 2024 08:54:34 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2cc6ea2sm1495088b3a.186.2024.12.05.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:54:33 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC] drm/msm: Add UABI to request perfcntr usage
Date: Thu,  5 Dec 2024 08:54:18 -0800
Message-ID: <20241205165419.54080-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Performance counter usage falls into two categories:

1. Local usage, where the counter configuration, start, and end read
   happen within (locally to) a single SUBMIT.  In this case, there is
   no dependency on counter configuration or values between submits, and
   in fact counters are normally cleared on context switches, making it
   impossible to rely on cross-submit state.

2. Global usage, where a single privilaged daemon/process is sampling
   counter values across all processes for profiling.

The two categories are mutually exclusive.  While you can have many
processes making local counter usage, you cannot combine global and
local usage without the two stepping on each others feet (by changing
counter configuration).

For global counter usage, there is already a SYSPROF param (since global
counter usage requires disabling counter clearing on context switch).
This patch adds a REQ_CNTRS param to request local counter usage.  If
one or more processes has requested counter usage, then a SYSPROF
request will fail with -EBUSY.  And if SYSPROF is active, then REQ_CNTRS
will fail with -EBUSY, maintaining the mutual exclusivity.

This is purely an advisory interface to help coordinate userspace.
There is no real means of enforcement, but the worst that can happen if
userspace ignores a REQ_CNTRS failure is that you'll get nonsense
profiling data.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
kgsl takes a different approach, which involves a lot more UABI for
assigning counters to different processes.  But I think by taking
advantage of the fact that mesa (freedreno+turnip) reconfigure the
counters they need in each SUBMIT, for their respective gl/vk perf-
counter extensions, we can take this simpler approach.

 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
 drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
 drivers/gpu/drm/msm/msm_gpu.c           |  1 +
 drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
 drivers/gpu/drm/msm/msm_submitqueue.c   | 52 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 85 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 31bbf2c83de4..f688e37059b8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_file_private_set_sysprof(ctx, gpu, value);
+	case MSM_PARAM_REQ_CNTRS:
+		return msm_file_private_request_counters(ctx, gpu, value);
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6416d2cb4efc..bf8314ff4a25 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	 * It is not possible to set sysprof param to non-zero if gpu
 	 * is not initialized:
 	 */
-	if (priv->gpu)
+	if (ctx->sysprof)
 		msm_file_private_set_sysprof(ctx, priv->gpu, 0);
 
+	if (ctx->counters_requested)
+		msm_file_private_request_counters(ctx, priv->gpu, 0);
+
 	context_close(ctx);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 82f204f3bb8f..013b59ca3bb1 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->nr_rings = nr_rings;
 
 	refcount_set(&gpu->sysprof_active, 1);
+	refcount_set(&gpu->local_counters_active, 1);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579..83c61e523b1b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -195,12 +195,28 @@ struct msm_gpu {
 	int nr_rings;
 
 	/**
-	 * sysprof_active:
+	 * @sysprof_active:
 	 *
-	 * The count of contexts that have enabled system profiling.
+	 * The count of contexts that have enabled system profiling plus one.
+	 *
+	 * Note: refcount_t does not like 0->1 transitions.. we want to keep
+	 * the under/overflow checks that refcount_t provides, but allow
+	 * multiple on/off transitions so we track the logical value plus one.)
 	 */
 	refcount_t sysprof_active;
 
+	/**
+	 * @local_counters_active:
+	 *
+	 * The count of contexts that have requested local (intra-submit)
+	 * performance counter usage plus one.
+	 *
+	 * Note: refcount_t does not like 0->1 transitions.. we want to keep
+	 * the under/overflow checks that refcount_t provides, but allow
+	 * multiple on/off transitions so we track the logical value plus one.)
+	 */
+	refcount_t local_counters_active;
+
 	/**
 	 * lock:
 	 *
@@ -383,6 +399,13 @@ struct msm_file_private {
 	 */
 	int sysprof;
 
+	/**
+	 * @counters_requested:
+	 *
+	 * Has the context requested local perfcntr usage.
+	 */
+	bool counters_requested;
+
 	/**
 	 * comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
@@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
 
 int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 				 struct msm_gpu *gpu, int sysprof);
+int msm_file_private_request_counters(struct msm_file_private *ctx,
+				      struct msm_gpu *gpu, int reqcntrs);
 void __msm_file_private_destroy(struct kref *kref);
 
 static inline void msm_file_private_put(struct msm_file_private *ctx)
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7fed1de63b5d..1e1e21e6f7ae 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -10,6 +10,15 @@
 int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 				 struct msm_gpu *gpu, int sysprof)
 {
+	int ret = 0;
+
+	mutex_lock(&gpu->lock);
+
+	if (sysprof && (refcount_read(&gpu->local_counters_active) > 1)) {
+		ret = UERR(EBUSY, gpu->dev, "Local counter usage active");
+		goto out_unlock;
+	}
+
 	/*
 	 * Since pm_runtime and sysprof_active are both refcounts, we
 	 * call apply the new value first, and then unwind the previous
@@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 
 	switch (sysprof) {
 	default:
-		return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
+		ret = UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
+		goto out_unlock;
 	case 2:
 		pm_runtime_get_sync(&gpu->pdev->dev);
 		fallthrough;
@@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 
 	ctx->sysprof = sysprof;
 
-	return 0;
+out_unlock:
+	mutex_unlock(&gpu->lock);
+
+	return ret;
+}
+
+int msm_file_private_request_counters(struct msm_file_private *ctx,
+				      struct msm_gpu *gpu, int reqctrs)
+{
+	int ret = 0;
+
+	mutex_lock(&gpu->lock);
+
+	if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
+		ret = UERR(EBUSY, gpu->dev, "System profiling active");
+		goto out_unlock;
+	}
+
+	if (reqctrs) {
+		if (ctx->counters_requested) {
+			ret = UERR(EINVAL, gpu->dev, "Already requested");
+			goto out_unlock;
+		}
+
+		ctx->counters_requested = true;
+		refcount_inc(&gpu->local_counters_active);
+	} else {
+		if (!ctx->counters_requested) {
+			ret = UERR(EINVAL, gpu->dev, "Not requested");
+			goto out_unlock;
+		}
+		refcount_dec(&gpu->local_counters_active);
+		ctx->counters_requested = false;
+	}
+
+out_unlock:
+	mutex_unlock(&gpu->lock);
+
+	return ret;
 }
 
 void __msm_file_private_destroy(struct kref *kref)
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2342cb90857e..ae7fb355e4a1 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -91,6 +91,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-submit) perfcntr usage  */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.47.1


