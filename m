Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86FCE7D5966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 19:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbjJXRIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 13:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjJXRIP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 13:08:15 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5718E118;
        Tue, 24 Oct 2023 10:08:13 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so4545375b3a.2;
        Tue, 24 Oct 2023 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698167293; x=1698772093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5+XaYJFN+NVWeY4zXTt2hZlhhgyD1PbfO78ZC5UnKI=;
        b=Gt7e3AzYhOZBgledH9x/fP1Sxlnlvk2XZ43tA3jvXKRTLqhunEJvbYs9y3eyNhTjk6
         ouQB0iEN3bZYPV0chFPg0QlheAuWcCI2zaJm3efn0zCYOgY9i23qy106bkUeJ+7T3AkW
         L0UuHa4eiAQLH2Hp1vfKWOv/49QAASAC/Pxht95HiomGbQJ/WRzXRaESQ3Q1ac6Iyj0m
         iaeTgS0DXcsAcv8ZG7EGafY8hCFZEWMX0XgPiKaDATQiOjI0kPBq/BWu2jHv7E43Ce1d
         N4igLznIXzYTYlEr+xaDEzcIY6s60Jf+6DgOH5txt/Xu392g+hV/RWIzeLMVqBZRo6sY
         2ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698167293; x=1698772093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5+XaYJFN+NVWeY4zXTt2hZlhhgyD1PbfO78ZC5UnKI=;
        b=rXes7tMgWHEcJT30a7oBK6PKNrCbdltOKj9rkfGafb5I0KtwvwrsfdMzYJLpNTt1Hw
         BpVewWFaFvk2lZG6s1DmmqiVtaOVbW3BMT+/xSWcBw0KEg7zFNN19BPC7gwVkdkBLymV
         gFYArAbTM0b54BLqh2FGOtvdefXHtCGArnQ2dpf535kkFeOlFm8iaMCqTC2QTTFVThtA
         nubu/CLb8CIXWwwx9lXg/rYxpA+HJvIrtnBPUad0nvC1zIXCKLHaV6RWihaKlO5/EJVL
         BcvJoDfQgEb8BxX3e2NVR0mceiYWXjQi6h5de+jGTVJIyqE6Jq3hQXrcaWtsXTJhdswb
         3WpQ==
X-Gm-Message-State: AOJu0Yy++riVyM5CP3tS1QkdknCzDEj6Xwq7q+wNkSo9xsdbSvcdsn4z
        uDh1D8INbtLzhA0MY+vWMn4=
X-Google-Smtp-Source: AGHT+IHd3/Ozn+cdIOjsShL1jIxoFepfqKnj9txTltqWrGjBYe8Dn3VBv5QDIltIkx/ptDribRPnpg==
X-Received: by 2002:a05:6a00:21ca:b0:6be:1f19:e5f0 with SMTP id t10-20020a056a0021ca00b006be1f19e5f0mr15216384pfj.25.1698167292690;
        Tue, 24 Oct 2023 10:08:12 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id d6-20020aa797a6000000b006b225011ee5sm7868310pfq.6.2023.10.24.10.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 10:08:12 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/gem: Demote userspace errors to DRM_UT_DRIVER
Date:   Tue, 24 Oct 2023 10:08:04 -0700
Message-ID: <20231024170806.194563-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Error messages resulting from incorrect usage of the kernel uabi should
not spam dmesg by default.  But it is useful to enable them to debug
userspace.  So demote to DRM_UT_DRIVER.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  6 ++---
 drivers/gpu/drm/msm/msm_gem_submit.c | 36 ++++++++++++++++------------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index db1e748daa75..1113e6b2ec8e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -226,9 +226,9 @@ static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
-	if (GEM_WARN_ON(msm_obj->madv > madv)) {
-		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
-			msm_obj->madv, madv);
+	if (msm_obj->madv > madv) {
+		DRM_DEV_DEBUG_DRIVER(obj->dev->dev, "Invalid madv state: %u vs %u\n",
+				     msm_obj->madv, madv);
 		return ERR_PTR(-EBUSY);
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index a105ca1f2102..9f16af761bf0 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -17,6 +17,12 @@
 #include "msm_gem.h"
 #include "msm_gpu_trace.h"
 
+/* For userspace errors, use DRM_UT_DRIVER.. so that userspace can enable
+ * error msgs for debugging, but we don't spam dmesg by default
+ */
+#define SUBMIT_ERROR(submit, fmt, ...) \
+	DRM_DEV_DEBUG_DRIVER((submit)->dev->dev, fmt, ##__VA_ARGS__)
+
 /*
  * Cmdstream submission:
  */
@@ -136,7 +142,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		if ((submit_bo.flags & ~MSM_SUBMIT_BO_FLAGS) ||
 			!(submit_bo.flags & MANDATORY_FLAGS)) {
-			DRM_ERROR("invalid flags: %x\n", submit_bo.flags);
+			SUBMIT_ERROR(submit, "invalid flags: %x\n", submit_bo.flags);
 			ret = -EINVAL;
 			i = 0;
 			goto out;
@@ -158,7 +164,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 		 */
 		obj = idr_find(&file->object_idr, submit->bos[i].handle);
 		if (!obj) {
-			DRM_ERROR("invalid handle %u at index %u\n", submit->bos[i].handle, i);
+			SUBMIT_ERROR(submit, "invalid handle %u at index %u\n", submit->bos[i].handle, i);
 			ret = -EINVAL;
 			goto out_unlock;
 		}
@@ -202,13 +208,13 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			break;
 		default:
-			DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
+			SUBMIT_ERROR(submit, "invalid type: %08x\n", submit_cmd.type);
 			return -EINVAL;
 		}
 
 		if (submit_cmd.size % 4) {
-			DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
-					submit_cmd.size);
+			SUBMIT_ERROR(submit, "non-aligned cmdstream buffer size: %u\n",
+				     submit_cmd.size);
 			ret = -EINVAL;
 			goto out;
 		}
@@ -306,8 +312,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 
 fail:
 	if (ret == -EALREADY) {
-		DRM_ERROR("handle %u at index %u already on submit list\n",
-				submit->bos[i].handle, i);
+		SUBMIT_ERROR(submit, "handle %u at index %u already on submit list\n",
+			     submit->bos[i].handle, i);
 		ret = -EINVAL;
 	}
 
@@ -448,8 +454,8 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 		struct drm_gem_object **obj, uint64_t *iova, bool *valid)
 {
 	if (idx >= submit->nr_bos) {
-		DRM_ERROR("invalid buffer index: %u (out of %u)\n",
-				idx, submit->nr_bos);
+		SUBMIT_ERROR(submit, "invalid buffer index: %u (out of %u)\n",
+			     idx, submit->nr_bos);
 		return -EINVAL;
 	}
 
@@ -475,7 +481,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 		return 0;
 
 	if (offset % 4) {
-		DRM_ERROR("non-aligned cmdstream buffer: %u\n", offset);
+		SUBMIT_ERROR(submit, "non-aligned cmdstream buffer: %u\n", offset);
 		return -EINVAL;
 	}
 
@@ -497,8 +503,8 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 		bool valid;
 
 		if (submit_reloc.submit_offset % 4) {
-			DRM_ERROR("non-aligned reloc offset: %u\n",
-					submit_reloc.submit_offset);
+			SUBMIT_ERROR(submit, "non-aligned reloc offset: %u\n",
+				     submit_reloc.submit_offset);
 			ret = -EINVAL;
 			goto out;
 		}
@@ -508,7 +514,7 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 
 		if ((off >= (obj->size / 4)) ||
 				(off < last_offset)) {
-			DRM_ERROR("invalid offset %u at reloc %u\n", off, i);
+			SUBMIT_ERROR(submit, "invalid offset %u at reloc %u\n", off, i);
 			ret = -EINVAL;
 			goto out;
 		}
@@ -881,7 +887,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		if (!submit->cmd[i].size ||
 			((submit->cmd[i].size + submit->cmd[i].offset) >
 				obj->size / 4)) {
-			DRM_ERROR("invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
+			SUBMIT_ERROR(submit, "invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
 			ret = -EINVAL;
 			goto out;
 		}
@@ -893,7 +899,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 		if (!gpu->allow_relocs) {
 			if (submit->cmd[i].nr_relocs) {
-				DRM_ERROR("relocs not allowed\n");
+				SUBMIT_ERROR(submit, "relocs not allowed\n");
 				ret = -EINVAL;
 				goto out;
 			}
-- 
2.41.0

