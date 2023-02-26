Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 766226A2CC0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Feb 2023 01:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBZAPr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Feb 2023 19:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjBZAPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Feb 2023 19:15:47 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E001042E
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:15:45 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m7so3953253lfj.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaL2o3iwNEYO7LhKzdq0+zsg7y8YSGPdz1n3LFL2ffw=;
        b=E/MvT/jsevpwYNIYXATEXxn4I9/9/N9fyU0E9PuRXCwSoRI8Z6D740yzGcqwGPFd0l
         muUfyCc9FCRWrzd+UoGW0SvgFhkAAcAqus7z+vvyIcITb/OtATFmzxi5fygQR2wL5B6+
         XEsdSO5jXt5eJY2RhYiyFSYovyaP5AOLbtw8B4rgsm/68/Tuy8qcHORiNKnuMkjYFu9q
         ZNNpRiae5T8U8pCDYRZAmHCyqo8PaWdskl0Vdm0lH4ZY+qZyDtiemB1FKQn+3yAr1/P7
         JbDqX71Xcn5+Ad//NJCpbYRsRy9xj0g23BJ76sZZj1+MJrxYakdB+bjRG6VYiesUnFFy
         eelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaL2o3iwNEYO7LhKzdq0+zsg7y8YSGPdz1n3LFL2ffw=;
        b=GRzPJZM7zHxZNhdTQI5CfIDhqAgL5FHY8V+wXWmCbOOFuj0pRuq32ZVco02Vk2WF+m
         WEgpRJmNEQxKVMvMDDLhMJdHr3GExw9qw1gJYfK3X8vog/E1zhJykwOCnk4kGLB8iW9d
         unI6LIyv2tUyt5aM4i5SVchg19Nu+82YmIDVLW3bACF5pxiZFl2QttF8leq60INudgxv
         QXQcKs8K4HwgsmXNc2MGsokwaiUR22GuzvLEUvv37GxfJpPRyCczOWlIl4839DZnQOU0
         rmIMzv1AU+uhpV5pPUTZGWfFe5RsbP5cxeblNkO8DGU3DKH/miu/5A5AiSzHfkKJDtNa
         qRJw==
X-Gm-Message-State: AO0yUKWsyFtOEt8M5lsYXz8VlEFcRqCyS9qMnZMLrMwbXW7J4y9LNlrL
        LCiLdm9CHYu0TjSJtXox4/4Ybg==
X-Google-Smtp-Source: AK7set/ASPBgTTNEZU+TYk8o5uDu/A7N+mfBFG95EgtDIiYWUhjdl2CZ5XgMhXQHIjtqZ0UzlmCCog==
X-Received: by 2002:ac2:4425:0:b0:4dd:af76:d3c with SMTP id w5-20020ac24425000000b004ddaf760d3cmr1208200lfl.48.1677370543960;
        Sat, 25 Feb 2023 16:15:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac25ff0000000b004cb3e97bff8sm356238lfg.284.2023.02.25.16.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 16:15:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()
Date:   Sun, 26 Feb 2023 02:15:41 +0200
Message-Id: <20230226001541.788023-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
References: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify two functions msm_parse_deps() and msm_parse_post_deps():
extract single item parsing function and clean up error path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 196 +++++++++++++++------------
 1 file changed, 106 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ca4569609397..16b0112096b4 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -546,6 +546,46 @@ struct msm_submit_post_dep {
 	struct dma_fence_chain *chain;
 };
 
+static struct drm_syncobj *msm_parse_dep_one(struct msm_gem_submit *submit,
+					     struct drm_file *file,
+					     uint64_t address,
+					     size_t syncobj_stride)
+{
+	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
+	struct dma_fence *fence;
+	struct drm_syncobj *syncobj = NULL;
+	int ret;
+
+	if (copy_from_user(&syncobj_desc,
+			   u64_to_user_ptr(address),
+			   min(syncobj_stride, sizeof(syncobj_desc))))
+		return ERR_PTR(-EFAULT);
+
+	if (syncobj_desc.point &&
+	    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS)
+		return ERR_PTR(-EINVAL);
+
+	ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
+				     syncobj_desc.point, 0, &fence);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_sched_job_add_dependency(&submit->base, fence);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
+		syncobj = drm_syncobj_find(file, syncobj_desc.handle);
+		if (!syncobj)
+			return ERR_PTR(-EINVAL);
+	}
+
+	return syncobj;
+}
+
 static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            struct drm_file *file,
                                            uint64_t in_syncobjs_addr,
@@ -553,9 +593,8 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            size_t syncobj_stride)
 {
 	struct drm_syncobj **syncobjs = NULL;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
-	int ret = 0;
-	uint32_t i, j;
+	int ret;
+	int i;
 
 	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
 	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
@@ -564,54 +603,26 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 
 	for (i = 0; i < nr_in_syncobjs; ++i) {
 		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
-		struct dma_fence *fence;
+		struct drm_syncobj *syncobj;
 
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		if (syncobj_desc.point &&
-		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
-			ret = -EOPNOTSUPP;
-			break;
+		syncobj = msm_parse_dep_one(submit, file, address, syncobj_stride);
+		if (IS_ERR(syncobj)) {
+			ret = PTR_ERR(syncobj);
+			goto err;
 		}
 
-		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = -EINVAL;
-			break;
-		}
-
-		ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
-		                             syncobj_desc.point, 0, &fence);
-		if (ret)
-			break;
-
-		ret = drm_sched_job_add_dependency(&submit->base, fence);
-		if (ret)
-			break;
-
-		if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
-			syncobjs[i] =
-				drm_syncobj_find(file, syncobj_desc.handle);
-			if (!syncobjs[i]) {
-				ret = -EINVAL;
-				break;
-			}
-		}
+		syncobjs[i] = syncobj;
 	}
 
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			if (syncobjs[j])
-				drm_syncobj_put(syncobjs[j]);
-		}
-		kfree(syncobjs);
-		return ERR_PTR(ret);
-	}
 	return syncobjs;
+
+err:
+	while (--i >= 0)
+		if (syncobjs[i])
+			drm_syncobj_put(syncobjs[i]);
+	kfree(syncobjs);
+
+	return ERR_PTR(ret);
 }
 
 static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
@@ -625,6 +636,43 @@ static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
 	}
 }
 
+static int msm_parse_post_dep_one(struct drm_device *dev,
+				  struct drm_file *file,
+				  uint64_t address,
+				  size_t syncobj_stride,
+				  struct msm_submit_post_dep *post_dep)
+{
+	struct msm_submit_post_dep *post_deps;
+	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
+
+	if (copy_from_user(&syncobj_desc,
+			   u64_to_user_ptr(address),
+			   min(syncobj_stride, sizeof(syncobj_desc))))
+		return -EFAULT;
+
+	post_dep->point = syncobj_desc.point;
+
+	if (syncobj_desc.flags)
+		return -EINVAL;
+
+	if (syncobj_desc.point) {
+		if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
+			return -EOPNOTSUPP;
+
+		post_dep->chain = dma_fence_chain_alloc();
+		if (!post_dep->chain)
+			return -ENOMEM;
+	}
+
+	post_dep->syncobj = drm_syncobj_find(file, syncobj_desc.handle);
+	if (!post_dep->syncobj) {
+		dma_fence_chain_free(post_deps->chain);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
                                                        struct drm_file *file,
                                                        uint64_t syncobjs_addr,
@@ -632,9 +680,8 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
                                                        size_t syncobj_stride)
 {
 	struct msm_submit_post_dep *post_deps;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
 	int ret = 0;
-	uint32_t i, j;
+	int i;
 
 	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
 			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
@@ -644,54 +691,23 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 	for (i = 0; i < nr_syncobjs; ++i) {
 		uint64_t address = syncobjs_addr + i * syncobj_stride;
 
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		post_deps[i].point = syncobj_desc.point;
-
-		if (syncobj_desc.flags) {
-			ret = -EINVAL;
-			break;
-		}
-
-		if (syncobj_desc.point) {
-			if (!drm_core_check_feature(dev,
-			                            DRIVER_SYNCOBJ_TIMELINE)) {
-				ret = -EOPNOTSUPP;
-				break;
-			}
-
-			post_deps[i].chain = dma_fence_chain_alloc();
-			if (!post_deps[i].chain) {
-				ret = -ENOMEM;
-				break;
-			}
-		}
-
-		post_deps[i].syncobj =
-			drm_syncobj_find(file, syncobj_desc.handle);
-		if (!post_deps[i].syncobj) {
-			ret = -EINVAL;
-			break;
-		}
+		ret = msm_parse_post_dep_one(dev, file, address, syncobj_stride, &post_deps[i]);
+		if (ret)
+			goto err;
 	}
 
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			dma_fence_chain_free(post_deps[j].chain);
-			if (post_deps[j].syncobj)
-				drm_syncobj_put(post_deps[j].syncobj);
-		}
+	return post_deps;
 
-		kfree(post_deps);
-		return ERR_PTR(ret);
+err:
+	while (--i >= 0) {
+		dma_fence_chain_free(post_deps[i].chain);
+		if (post_deps[i].syncobj)
+			drm_syncobj_put(post_deps[i].syncobj);
 	}
 
-	return post_deps;
+	kfree(post_deps);
+
+	return ERR_PTR(ret);
 }
 
 static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
-- 
2.39.1

