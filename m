Return-Path: <linux-arm-msm+bounces-43666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222929FE8D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C950F16201E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 16:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7808315747C;
	Mon, 30 Dec 2024 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNQNxXZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972521F95A;
	Mon, 30 Dec 2024 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735574444; cv=none; b=JDgfeeGKoaX2eq6SuIcvq2vEQCytc+QWzPW40OeYp5C7zPqmdEZcfwe1Psw5LGLgNHFQpgMcRe+ZR54j5qdtucgVE8ZoYODCC33DdD4K353hjZIvPrji7sHf2wu7Wf7ypaBbJzHzvkxxFZkIsHroy9rZ6IGSonfQRgxrWGd2U78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735574444; c=relaxed/simple;
	bh=K7K9XybxlpgM3eykochZ+YoHxH+sTLsdWy9RSKrSPwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LB+nRgm9CgHXTckEg0a9mEykCO/5niFm7O9KFhA11Q2ct9YIc7s6EfFn8BMMZE9LJOe6GKZXpTGbcsDpja7cJ8V9W/EWbf450UEwl4hYGwTRRjyfqKa1zt+EYjOwnL4Ykw7+2Dl3jgMnYvkOj/hGYCoimbKMvWBOOAVw63p9QeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNQNxXZp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2164b1f05caso119414985ad.3;
        Mon, 30 Dec 2024 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735574441; x=1736179241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rw2qhEeWF8EKPuIlkCzX1vHefU6AfjZuuyxhrGBFfGQ=;
        b=TNQNxXZpG83H/jm7ZSjbITiATVndHKeiFov9tq56Ndmr6vI2IWWnNZKbcSHVSblvL5
         Bgh9Ts6gt+sR7eX+G5yDIWZ7CVR/qTCvupdjc46ns57CYmAYfKGyrmufW0G+BCFP7oL1
         o2n63Y80dBeFVwxQ3pLVS29huNFrgYy1GHn75p1uOsrXDQ1QhXW7ucDRzfa98x9ZpaG6
         Ekmy+1+btCgI9Xd0rpe5XTsAMn+615JvPhFj2gqx3rEAutzyVFhy+I7FXhsWjwzKq11G
         KZjyrbdZgcj4JhDhbhJ15XgkNrKAybGqotFk1AZTjQgoLO0H+6CgKYMinTkYRqEg+CZi
         9r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735574441; x=1736179241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rw2qhEeWF8EKPuIlkCzX1vHefU6AfjZuuyxhrGBFfGQ=;
        b=HtRrK7TZSDRVATnN+c4hCnMGG87BdYs0xzgaeakKEM1wSC1i7Tq7G2zkjad30s+Py+
         X9WXg9829XQRRpOc6KjCvk8pdfpRK/sKiMnRj812ym0oRXxzTgSqCz/XA+lzRyARm7GR
         ANELktPvBybLVs8CCoLiTMuJw/f46ly62KkIAq6ph1xlIQ1X3qiu89D96K2iimLF5nc5
         eL+v0JawXMnwZyPwl8R0cqydHZ8GkCbWKt7cXH+oFcfjttnIcbZ8uKfn0lQ0rFIfCyib
         uk/GaEjj/FiHiF/A0Q1maoEAvEHFQtvt9437K/5dIqPxaKBT4iM8Rq23sRkNRogfLwUt
         F8Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWILQvoW02JRSFzowo3ud8EY81KK2IqKzIFAK2hKid5lMXQnxodKauZB/wpjvdQBop9SqsnDdn2L5AT4jk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc6DsVpKH2R8nzO2ewQQJpLVq9Eum5WuAQ3QaTbmwXIT5YJ6+L
	mi1z6jddb7L/Er0fLHNH8FS+82r47G9/uv7Z7kgaZk7fgDcfBZeF
X-Gm-Gg: ASbGnctZ49peh/xo6gOA9Ux+dzoeOcuFO1AcU1jJxy2ECgKTjZs+tT50TES15onDPyN
	OeDjBxDAYfMCGW7/OPdOZh5aa6r/A+m3j8G1nymIXUPr5j90P9KILgapegCniE65MAV2QHEgcGN
	IePx11RDyuxrRfVRxP13j+FUeA9Mwm3jSpz2IxnKvEWOljfIZVFCvZP108zAQ7ikg8JbYnOTcHJ
	bn5hlxz/U0/jEqlwss+bU4HTGLIV/4a4GyHRPK8qJjRyAErbPhwahciLegPUkZlns3ux+Zzjzmn
	6nma/uZQ+sBDZ9k=
X-Google-Smtp-Source: AGHT+IGnJDI9fJCq04/XNRAWXlJIw5eNdmQkzt5dnV2dws6HoSTqAvJiJehNzHSsGQpLiFdcrnA/Sg==
X-Received: by 2002:a17:902:ccc8:b0:216:2a5a:89d3 with SMTP id d9443c01a7336-219e6ebc7d4mr515815335ad.25.1735574439586;
        Mon, 30 Dec 2024 08:00:39 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f731dsm176479005ad.200.2024.12.30.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 08:00:38 -0800 (PST)
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
Subject: [PATCH v2] drm/msm: UAPI error reporting
Date: Mon, 30 Dec 2024 08:00:33 -0800
Message-ID: <20241230160034.18671-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
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
 drivers/gpu/drm/msm/msm_submitqueue.c   |  2 +-
 5 files changed, 47 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 076be0473eb5..9649c0bd0a38 100644
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
index c2dd8ef6d6dc..2aefb8becda0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -538,7 +538,7 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 
 	/* Only supported if per-process address space is supported: */
 	if (priv->gpu->aspace == ctx->aspace)
-		return -EOPNOTSUPP;
+		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
 
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d8c9a1b19263..fee31680a6d5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -28,6 +28,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_dsc.h>
 #include <drm/msm_drm.h>
@@ -506,6 +507,12 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
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
index fba78193127d..be6e793f34bd 100644
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
+		return UERR(EINVAL, dev, "invalid pipe");
 
 	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_FLAGS)
-		return -EINVAL;
+		return UERR(EINVAL, dev, "invalid flags");
 
 	if (args->flags & MSM_SUBMIT_SUDO) {
 		if (!IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) ||
@@ -724,7 +715,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		in_fence = sync_file_get_fence(args->fence_fd);
 
 		if (!in_fence) {
-			ret = -EINVAL;
+			ret = UERR(EINVAL, dev, "invalid in-fence");
 			goto out_unlock;
 		}
 
@@ -789,8 +780,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		if (!submit->cmd[i].size ||
 			((submit->cmd[i].size + submit->cmd[i].offset) >
 				obj->size / 4)) {
-			SUBMIT_ERROR(submit, "invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
-			ret = -EINVAL;
+			ret = UERR(EINVAL, dev, "invalid cmdstream size: %u\n",
+				   submit->cmd[i].size * 4);
 			goto out;
 		}
 
@@ -800,8 +791,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			continue;
 
 		if (!gpu->allow_relocs) {
-			SUBMIT_ERROR(submit, "relocs not allowed\n");
-			ret = -EINVAL;
+			ret = UERR(EINVAL, dev, "relocs not allowed\n");
 			goto out;
 		}
 
@@ -827,7 +817,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			(!args->fence || idr_find(&queue->fence_idr, args->fence))) {
 		spin_unlock(&queue->idr_lock);
 		idr_preload_end();
-		ret = -EINVAL;
+		ret = UERR(EINVAL, dev, "invalid in-fence-sn");
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 2fc3eaf81f44..7fed1de63b5d 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -18,7 +18,7 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 
 	switch (sysprof) {
 	default:
-		return -EINVAL;
+		return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
 	case 2:
 		pm_runtime_get_sync(&gpu->pdev->dev);
 		fallthrough;
-- 
2.47.1


