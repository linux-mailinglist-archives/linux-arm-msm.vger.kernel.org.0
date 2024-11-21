Return-Path: <linux-arm-msm+bounces-38681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF319D50F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 17:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B282284D78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 16:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFCE1A01C6;
	Thu, 21 Nov 2024 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqY1xUyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA819924A;
	Thu, 21 Nov 2024 16:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732207744; cv=none; b=NnBUR31sw22hSmRs8onH6yURwnFMbHkZu7ehy0c68V5q23IF0tuQugDFRK1ZkjNx2w8N4PhecXAVx941SCbKRrTW5S4tznTtz/fyn2/5vde6Q2jmZwhnd1rB86rn+oKTRH3DJPtjQ+s2YEqLzokqYtuSMdcf08NuXkwA2KYgVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732207744; c=relaxed/simple;
	bh=LOXRi6cMGBmFeBz0pGW44jcAgZMQNimse8zHJhlNk2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGweoiy5v5cAdocU1UMuseRtuzTAU4xKD13oQVSwEHAmcX2GCeRqHvkwloeX46GrdzmXu9rofeDJoRcKFdyqk+bE46M7B0qmgrAYFl+3kt9Ph/EGgnzODUrqbJoUcMCO076kBVU/LMf86h9tW4BIRn9G8mMa9vjAb6FausjIHJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqY1xUyr; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso870694a12.3;
        Thu, 21 Nov 2024 08:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732207742; x=1732812542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Lg9gnCSYuEdgwerPVcEffpySWQtRml8e0nEZZPcun0=;
        b=kqY1xUyr8XKJOiOjAVzITHGF0LWfjrWSiQUm86In9W5s+HHR1I3jqZoxmpYqA1uol6
         IegqwEGC1Bizd5HUo4rBAyQTOG+JyRtNmJamIHjolnWopTxI/TRnG9B0B6EDuUwDQYhc
         I2dcrfSeqp7PufSlS8UleCeOTbF5vlT6t1SUIeie55uzFr5Qn8q+ZSAT4oOo0njaBCjw
         bZGi7/ULNC2T//FwcaCZ4E3e2oxu4ShwADOTabWRqDhBr15vfJpGGpwfZYVgoIzZV1qb
         8XbiWIdNijpWlb/p3xh5ZhjV1EHAmd9rXlaS1nNim52pcrwQBLKUPPSAa6o6h/HTKGKO
         HItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732207742; x=1732812542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Lg9gnCSYuEdgwerPVcEffpySWQtRml8e0nEZZPcun0=;
        b=kmo/ejOFigsyE1bZK44grS3XLqrXI+mVJp/RwZ+9bJjUbc4JuPmCOa3SNOlT8CmrtO
         mk6yQ69Qr0ZKuBCfGCUHCbXkQNCsxR6Yzo2F6uIvDk3Aa1CQg19EObmrgSmuo7KB5SwL
         Nbcx2aKDAoRv9INphMLqhFo3uhWMngnaJiuY+J8KVHUnLQK695H9SoUPuM9Q6SlwBhda
         BHpeSoUlXnEhPEmrcGfgruUk3gkFc/SWHYjxpjSwcjpzAr6xUzwYAje7dnzNXi1su2z5
         QEcLJ9pJ+21CTwL3IcNEoU4VAuGwR9CLvyHZOJY9IdLjPgSw9T6EaXkvHYKNpFIY+Gt3
         +Dtg==
X-Forwarded-Encrypted: i=1; AJvYcCWD02IyqN7JyyJ3fnkRiTHYo/aX1RobWWtMIIaajtWZk2s9av+lhMYslLUhXwlDAheT6gjmUnGRWMcH0pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZm+NQFJc0zujMM8MJz/7H69dI/VJjZI+MQKn5+ZYvykyGUYrr
	wLoLObY8h6KMMsZTLSq5GLAym34iDocITlcHUW2OoUEsD2MAw/xI
X-Gm-Gg: ASbGncs8Y7LPg/lX0fpqdHQV255iEoVGq5Jr7bZ6hEQc2zl1KwuU2Xfu/imH0O7uWCZ
	hn9HXU42KFxURZ/Nwu9YnxiuthuzbjAuVdVC/xi+NSwsXdQlRoDuwFTczXS2jAelWAdtcgdDUeI
	1a5yDQXxVD7VfJR+frqqho2KVne/kDn4jCgcsujZxFDaACBwwdxSY+Tthhq0XR9kBeXi4nHRpZu
	LbQQKNjnYzftUFrZOLMYG2WzkzOoIszYujAdvCcSoWwOayHPpyBgq0XSjFHgz06eZrxuLv1WYyx
	fly5p839lElNYaQWDzTsgcK4
X-Google-Smtp-Source: AGHT+IEr8sMxxk2mSNugSYMB9QoJQO+o/emSoVpQewhlZkrxaDkG526RYEHoImks0bxGaguzSrv+LQ==
X-Received: by 2002:a05:6a21:118a:b0:1db:dcc6:dd39 with SMTP id adf61e73a8af0-1ddaebd9b17mr9911924637.26.1732207741827;
        Thu, 21 Nov 2024 08:49:01 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befe718csm3854365b3a.176.2024.11.21.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:49:01 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: UAPI error reporting
Date: Thu, 21 Nov 2024 08:48:58 -0800
Message-ID: <20241121164858.457921-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Debugging incorrect UAPI usage tends to be a bit painful, so add a
helper macro to make it easier to add debug logging which can be enabled
at runtime via drm.debug.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++----
 drivers/gpu/drm/msm/msm_drv.c           |  2 +-
 drivers/gpu/drm/msm/msm_drv.h           |  7 +++
 drivers/gpu/drm/msm/msm_gem_submit.c    | 64 +++++++++++--------------
 4 files changed, 46 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b96ce6fed649..ad7df8736eec 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -310,10 +310,11 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct drm_device *drm = gpu->dev;
 
 	/* No pointer params yet */
 	if (*len != 0)
-		return -EINVAL;
+		return UERR(EINVAL, drm, "invalid len");
 
 	switch (param) {
 	case MSM_PARAM_GPU_ID:
@@ -365,12 +366,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		return 0;
 	case MSM_PARAM_VA_START:
 		if (ctx->aspace == gpu->aspace)
-			return -EINVAL;
+			return UERR(EINVAL, drm, "requires per-process pgtables");
 		*value = ctx->aspace->va_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
 		if (ctx->aspace == gpu->aspace)
-			return -EINVAL;
+			return UERR(EINVAL, drm, "requires per-process pgtables");
 		*value = ctx->aspace->va_size;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
@@ -386,14 +387,15 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = adreno_gpu->ubwc_config.macrotile_mode;
 		return 0;
 	default:
-		DBG("%s: invalid param: %u", gpu->name, param);
-		return -EINVAL;
+		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
 }
 
 int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t value, uint32_t len)
 {
+	struct drm_device *drm = gpu->dev;
+
 	switch (param) {
 	case MSM_PARAM_COMM:
 	case MSM_PARAM_CMDLINE:
@@ -401,11 +403,11 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		 * that should be a reasonable upper bound
 		 */
 		if (len > PAGE_SIZE)
-			return -EINVAL;
+			return UERR(EINVAL, drm, "invalid len");
 		break;
 	default:
 		if (len != 0)
-			return -EINVAL;
+			return UERR(EINVAL, drm, "invalid len");
 	}
 
 	switch (param) {
@@ -434,11 +436,10 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	}
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
-			return -EPERM;
+			return UERR(EPERM, drm, "invalid permissions");
 		return msm_file_private_set_sysprof(ctx, gpu, value);
 	default:
-		DBG("%s: invalid param: %u", gpu->name, param);
-		return -EINVAL;
+		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8c13b08708d2..6416d2cb4efc 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -537,7 +537,7 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 
 	/* Only supported if per-process address space is supported: */
 	if (priv->gpu->aspace == ctx->aspace)
-		return -EOPNOTSUPP;
+		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
 
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2e28a1344636..7fe0c67a602c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -28,6 +28,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_dsc.h>
 #include <drm/msm_drm.h>
@@ -519,6 +520,12 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
 			   clockid_t clock_id,
 			   enum hrtimer_mode mode);
 
+/* Helper for returning a UABI error with optional logging which can make
+ * it easier for userspace to understand what it is doing wrong.
+ */
+#define UERR(err, drm, fmt, ...) \
+	({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
+
 #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fba78193127d..550f9b808f27 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -20,8 +20,8 @@
 /* For userspace errors, use DRM_UT_DRIVER.. so that userspace can enable
  * error msgs for debugging, but we don't spam dmesg by default
  */
-#define SUBMIT_ERROR(submit, fmt, ...) \
-	DRM_DEV_DEBUG_DRIVER((submit)->dev->dev, fmt, ##__VA_ARGS__)
+#define SUBMIT_ERROR(err, submit, fmt, ...) \
+	UERR(err, (submit)->dev, fmt, ##__VA_ARGS__)
 
 /*
  * Cmdstream submission:
@@ -142,8 +142,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		if ((submit_bo.flags & ~MSM_SUBMIT_BO_FLAGS) ||
 			!(submit_bo.flags & MANDATORY_FLAGS)) {
-			SUBMIT_ERROR(submit, "invalid flags: %x\n", submit_bo.flags);
-			ret = -EINVAL;
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid flags: %x\n", submit_bo.flags);
 			i = 0;
 			goto out;
 		}
@@ -162,8 +161,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 		 */
 		obj = idr_find(&file->object_idr, submit->bos[i].handle);
 		if (!obj) {
-			SUBMIT_ERROR(submit, "invalid handle %u at index %u\n", submit->bos[i].handle, i);
-			ret = -EINVAL;
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid handle %u at index %u\n", submit->bos[i].handle, i);
 			goto out_unlock;
 		}
 
@@ -206,14 +204,12 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			break;
 		default:
-			SUBMIT_ERROR(submit, "invalid type: %08x\n", submit_cmd.type);
-			return -EINVAL;
+			return SUBMIT_ERROR(EINVAL, submit, "invalid type: %08x\n", submit_cmd.type);
 		}
 
 		if (submit_cmd.size % 4) {
-			SUBMIT_ERROR(submit, "non-aligned cmdstream buffer size: %u\n",
-				     submit_cmd.size);
-			ret = -EINVAL;
+			ret = SUBMIT_ERROR(EINVAL, submit, "non-aligned cmdstream buffer size: %u\n",
+					   submit_cmd.size);
 			goto out;
 		}
 
@@ -371,9 +367,8 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 		struct drm_gem_object **obj, uint64_t *iova)
 {
 	if (idx >= submit->nr_bos) {
-		SUBMIT_ERROR(submit, "invalid buffer index: %u (out of %u)\n",
-			     idx, submit->nr_bos);
-		return -EINVAL;
+		return SUBMIT_ERROR(EINVAL, submit, "invalid buffer index: %u (out of %u)\n",
+				    idx, submit->nr_bos);
 	}
 
 	if (obj)
@@ -392,10 +387,8 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 	uint32_t *ptr;
 	int ret = 0;
 
-	if (offset % 4) {
-		SUBMIT_ERROR(submit, "non-aligned cmdstream buffer: %u\n", offset);
-		return -EINVAL;
-	}
+	if (offset % 4)
+		return SUBMIT_ERROR(EINVAL, submit, "non-aligned cmdstream buffer: %u\n", offset);
 
 	/* For now, just map the entire thing.  Eventually we probably
 	 * to do it page-by-page, w/ kmap() if not vmap()d..
@@ -414,9 +407,8 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 		uint64_t iova;
 
 		if (submit_reloc.submit_offset % 4) {
-			SUBMIT_ERROR(submit, "non-aligned reloc offset: %u\n",
-				     submit_reloc.submit_offset);
-			ret = -EINVAL;
+			ret = SUBMIT_ERROR(EINVAL, submit, "non-aligned reloc offset: %u\n",
+					   submit_reloc.submit_offset);
 			goto out;
 		}
 
@@ -425,8 +417,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 
 		if ((off >= (obj->size / 4)) ||
 				(off < last_offset)) {
-			SUBMIT_ERROR(submit, "invalid offset %u at reloc %u\n", off, i);
-			ret = -EINVAL;
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid offset %u at reloc %u\n", off, i);
 			goto out;
 		}
 
@@ -513,12 +504,12 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 
 		if (syncobj_desc.point &&
 		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
-			ret = -EOPNOTSUPP;
+			ret = SUBMIT_ERROR(EOPNOTSUPP, submit, "syncobj timeline unsupported");
 			break;
 		}
 
 		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = -EINVAL;
+			ret = -SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags");
 			break;
 		}
 
@@ -531,7 +522,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 			syncobjs[i] =
 				drm_syncobj_find(file, syncobj_desc.handle);
 			if (!syncobjs[i]) {
-				ret = -EINVAL;
+				ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj handle");
 				break;
 			}
 		}
@@ -588,14 +579,14 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 		post_deps[i].point = syncobj_desc.point;
 
 		if (syncobj_desc.flags) {
-			ret = -EINVAL;
+			ret = UERR(EINVAL, dev, "invalid syncobj flags");
 			break;
 		}
 
 		if (syncobj_desc.point) {
 			if (!drm_core_check_feature(dev,
 			                            DRIVER_SYNCOBJ_TIMELINE)) {
-				ret = -EOPNOTSUPP;
+				ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
 				break;
 			}
 
@@ -609,7 +600,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 		post_deps[i].syncobj =
 			drm_syncobj_find(file, syncobj_desc.handle);
 		if (!post_deps[i].syncobj) {
-			ret = -EINVAL;
+			ret = UERR(EINVAL, dev, "invalid syncobj handle");
 			break;
 		}
 	}
@@ -677,10 +668,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
 	if (MSM_PIPE_ID(args->flags) != MSM_PIPE_3D0)
-		return -EINVAL;
+		return SUBMIT_ERROR(EINVAL, submit, "invalid pipe");
 
 	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_FLAGS)
-		return -EINVAL;
+		return SUBMIT_ERROR(EINVAL, submit, "invalid flags");
 
 	if (args->flags & MSM_SUBMIT_SUDO) {
 		if (!IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) ||
@@ -724,7 +715,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		in_fence = sync_file_get_fence(args->fence_fd);
 
 		if (!in_fence) {
-			ret = -EINVAL;
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid in-fence");
 			goto out_unlock;
 		}
 
@@ -789,8 +780,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		if (!submit->cmd[i].size ||
 			((submit->cmd[i].size + submit->cmd[i].offset) >
 				obj->size / 4)) {
-			SUBMIT_ERROR(submit, "invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
-			ret = -EINVAL;
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid cmdstream size: %u\n",
+					   submit->cmd[i].size * 4);
 			goto out;
 		}
 
@@ -800,8 +791,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			continue;
 
 		if (!gpu->allow_relocs) {
-			SUBMIT_ERROR(submit, "relocs not allowed\n");
-			ret = -EINVAL;
+			ret = SUBMIT_ERROR(EINVAL, submit, "relocs not allowed\n");
 			goto out;
 		}
 
@@ -827,7 +817,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			(!args->fence || idr_find(&queue->fence_idr, args->fence))) {
 		spin_unlock(&queue->idr_lock);
 		idr_preload_end();
-		ret = -EINVAL;
+		ret = SUBMIT_ERROR(EINVAL, submit, "invalid in-fence-sn");
 		goto out;
 	}
 
-- 
2.47.0


