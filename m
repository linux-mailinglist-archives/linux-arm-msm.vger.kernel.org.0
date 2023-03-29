Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212686CCF1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjC2Azh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjC2Azg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:55:36 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B801FDD
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:55:34 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id e11so14416737lji.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680051333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in8ArGj/MjOCuYtjGXU364Xb4blRHvT/jqnaOCwqO0Y=;
        b=M3MM+Qg9Cv6BOSAfgZZEwYmFcqjhE78OPapA6APrZ3dGZlpIuytFFk7c0DK9FbzOuC
         JW6MLG0xp83HLM8vxs4W4/zzIKZp5pnh26+thN3UBQ0OcHXwl2iOIdO2yHl96uYrT1Da
         F+nCtRS5lsXkqk8bg2TT4N50oQKMo0+sIScMIjK/CMlxlXBnPOB2vRM4aTWPgy/daKAB
         PgNuPHBhJMIj8aAtNOWYmnZXtNP+RLsb8OatAR7cxJd+PppuFSA4CB9d88ddgvcvpb1w
         /pCJ+dI8y4of/NsvqsyMBJiky1XS7pwoKDStCWfCZPmBr3X/4RAEBgbZiogHEeqibMUr
         oH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680051333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=in8ArGj/MjOCuYtjGXU364Xb4blRHvT/jqnaOCwqO0Y=;
        b=g8X5nE+yJ4oXlGy68CuHPgFV+tDOdtwAe/rjVb0m0CQmUqyXJ/dXUjXfVQh934zPz9
         iJSlv86mGtxG0FyaE0iHKMf6koE0QVQGgr/DroSA1nfYApjM8U/vu9TtZdvAC0EtM4KO
         A2DKCPCBguIMdoNxEI3SE1kYwHQJqhM1uZx+ivehCZU6upyS1N03/k+dtvdxL/C36ECD
         ko99mTv1P/Qwtc0N3yly8YJJLqjEx2tv+Qkx6YrMvHcH+kIAyYKgyrt+RquPm5qk4knu
         VSjg8rUl/KrgHknIKDExAF8eb+3E6UJ1l52lvHleAIGnY8NUYXTnyultEj6Er+sUo73q
         zs5A==
X-Gm-Message-State: AAQBX9e95V4YeUYRwELGra3hRk6g982xCnEmrnSulYHIvPaXX9CvrbL4
        J1RAjHkWFT72+DmS2xJ7HqIOdw==
X-Google-Smtp-Source: AKy350aiEMfV+RnPTVp/XKBb4bfbyqxyg6KXZ4MH7N+jaTze/pu1y9TBWSJUGk0tvMNSvQTDuY/0kw==
X-Received: by 2002:a2e:944a:0:b0:295:b95f:1b28 with SMTP id o10-20020a2e944a000000b00295b95f1b28mr6061024ljh.14.1680051333168;
        Tue, 28 Mar 2023 17:55:33 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a4-20020a2e9804000000b002a03f9ffecesm3007181ljj.89.2023.03.28.17.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:55:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()
Date:   Wed, 29 Mar 2023 03:55:30 +0300
Message-Id: <20230329005530.1077468-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329005530.1077468-1-dmitry.baryshkov@linaro.org>
References: <20230329005530.1077468-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify two functions msm_parse_deps() and msm_parse_post_deps():
extract single item parsing function and clean up error path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 186 +++++++++++++++------------
 1 file changed, 101 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index f2a6775a10eb..da5fcd65f8b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -546,6 +546,41 @@ struct msm_submit_post_dep {
 	struct dma_fence_chain *chain;
 };
 
+static struct drm_syncobj *msm_parse_dep_one(struct msm_gem_submit *submit,
+					     struct drm_file *file,
+					     uint64_t address,
+					     size_t syncobj_stride)
+{
+	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
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
+	ret = drm_sched_job_add_syncobj_dependency(&submit->base, file,
+						   syncobj_desc.handle, syncobj_desc.point);
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
@@ -553,9 +588,8 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
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
@@ -564,49 +598,26 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 
 	for (i = 0; i < nr_in_syncobjs; ++i) {
 		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
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
-		}
-
-		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = -EINVAL;
-			break;
+		syncobj = msm_parse_dep_one(submit, file, address, syncobj_stride);
+		if (IS_ERR(syncobj)) {
+			ret = PTR_ERR(syncobj);
+			goto err;
 		}
 
-		ret = drm_sched_job_add_syncobj_dependency(&submit->base, file,
-							   syncobj_desc.handle, syncobj_desc.point);
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
@@ -620,6 +631,43 @@ static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
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
@@ -627,9 +675,8 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
                                                        size_t syncobj_stride)
 {
 	struct msm_submit_post_dep *post_deps;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
 	int ret = 0;
-	uint32_t i, j;
+	int i;
 
 	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
 			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
@@ -639,54 +686,23 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
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
2.39.2

