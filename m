Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB8D2479D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729532AbgHQWDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729493AbgHQWDq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:03:46 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82986C061389;
        Mon, 17 Aug 2020 15:03:46 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u128so8918750pfb.6;
        Mon, 17 Aug 2020 15:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FvoB/QZ4hH7jO2LobIZsox+NVJPMDXlJlM4677kKgLg=;
        b=iHPKFjksA3R6khqOCzaRCxWBlM/sGAICx75msTQOZxWtVasGsU2c78sLYYhG9n+fEB
         MiCZShzSuNYS8CBJXlFeGirRi5Iy9cOARAcFi4v1XDVdkUk8WD5JwzfWbZQpNS40oISp
         PVJQ1+kIbz/tiEI3pxi/BZMWaA3PaLqoHCeZERZnkW1j7kt0/iJrf0du3foyfu9PEY3K
         /3F0BtJ+yX8YLISRmyKpucfHJYxOiXcnnyUSfiMxQMfr3kxO+ssmFpB/667qk1z6a8fR
         gF5Z7kGBD2cd1OWwXaFSLfbfQHacEbEIq4LNOQnmlRnDlv6jnKvV/6OFWkrE7DVJ/0z6
         tYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FvoB/QZ4hH7jO2LobIZsox+NVJPMDXlJlM4677kKgLg=;
        b=BIBe40Yd+DUDryblW9g0KsHUHa1oLho8dtTqVB26ObxADzNO8QWfc2/XoNkVgGWpmZ
         uNrh2YkeFlLoSezXY/Kt0s6G3r9mazkbZvyP8VikYXCeIwGDAFwdkNMLpgkly7pJHax4
         9IcZT/m+yjyWW7bogYQilM9yziyokN8IPm3Lq1/Men27jAG43ENgV4KwVpVgNOdFBXqk
         b9K9+N+eSREKU+6asYWpG51eT+MhKPT0+uh/7IkSEMBlOtnfXJHmMp/y2DK86+bMkm1q
         dxy9HwOrArCuK+fIcXRXdgkZfo4PMSj/fdxpI29NKVDLl1GsqRGRNTtoUEH5v6D+vR4y
         Sixg==
X-Gm-Message-State: AOAM533JKmhHyV++BvxEsszFsCsdkslUtwIGzn+nhkEl8mwL95GB3tF9
        hoMsB2TjEAsuFmGjUAEHW0g=
X-Google-Smtp-Source: ABdhPJwHuxyxl/K72+sndUXVJ565GGovTimm66/cExEK0WlUlleGgs3FRfIF4Zi+HMbWQvE8Homu4Q==
X-Received: by 2002:a63:742:: with SMTP id 63mr10991787pgh.295.1597701825915;
        Mon, 17 Aug 2020 15:03:45 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id r202sm21168775pfc.127.2020.08.17.15.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:03:44 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 20/20] drm/msm: show process names in gem_describe
Date:   Mon, 17 Aug 2020 15:01:45 -0700
Message-Id: <20200817220238.603465-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In $debugfs/gem we already show any vma(s) associated with an object.
Also show process names if the vma's address space is a per-process
address space.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c     |  2 +-
 drivers/gpu/drm/msm/msm_gem.c     | 25 +++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gem.h     |  5 +++++
 drivers/gpu/drm/msm/msm_gem_vma.c |  1 +
 drivers/gpu/drm/msm/msm_gpu.c     |  8 +++++---
 drivers/gpu/drm/msm/msm_gpu.h     |  2 +-
 6 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8e70d220bba8..8d5c4f98c332 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -597,7 +597,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu);
+	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
 	file->driver_priv = ctx;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3cb7aeb93fd3..76a6c5271e57 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -842,11 +842,28 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 
 		seq_puts(m, "      vmas:");
 
-		list_for_each_entry(vma, &msm_obj->vmas, list)
-			seq_printf(m, " [%s: %08llx,%s,inuse=%d]",
-				vma->aspace != NULL ? vma->aspace->name : NULL,
-				vma->iova, vma->mapped ? "mapped" : "unmapped",
+		list_for_each_entry(vma, &msm_obj->vmas, list) {
+			const char *name, *comm;
+			if (vma->aspace) {
+				struct msm_gem_address_space *aspace = vma->aspace;
+				struct task_struct *task =
+					get_pid_task(aspace->pid, PIDTYPE_PID);
+				if (task) {
+					comm = kstrdup(task->comm, GFP_KERNEL);
+				} else {
+					comm = NULL;
+				}
+				name = aspace->name;
+			} else {
+				name = comm = NULL;
+			}
+			seq_printf(m, " [%s%s%s: aspace=%p, %08llx,%s,inuse=%d]",
+				name, comm ? ":" : "", comm ? comm : "",
+				vma->aspace, vma->iova,
+				vma->mapped ? "mapped" : "unmapped",
 				vma->inuse);
+			kfree(comm);
+		}
 
 		seq_puts(m, "\n");
 	}
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9c573c4269cb..7b1c7a5f8eef 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -24,6 +24,11 @@ struct msm_gem_address_space {
 	spinlock_t lock; /* Protects drm_mm node allocation/removal */
 	struct msm_mmu *mmu;
 	struct kref kref;
+
+	/* For address spaces associated with a specific process, this
+	 * will be non-NULL:
+	 */
+	struct pid *pid;
 };
 
 struct msm_gem_vma {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 29cc1305cf37..80a8a266d68f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -17,6 +17,7 @@ msm_gem_address_space_destroy(struct kref *kref)
 	drm_mm_takedown(&aspace->mm);
 	if (aspace->mmu)
 		aspace->mmu->funcs->destroy(aspace->mmu);
+	put_pid(aspace->pid);
 	kfree(aspace);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 951850804d77..ac8961187a73 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -825,10 +825,9 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 
 /* Return a new address space for a msm_drm_private instance */
 struct msm_gem_address_space *
-msm_gpu_create_private_address_space(struct msm_gpu *gpu)
+msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
 {
 	struct msm_gem_address_space *aspace = NULL;
-
 	if (!gpu)
 		return NULL;
 
@@ -836,8 +835,11 @@ msm_gpu_create_private_address_space(struct msm_gpu *gpu)
 	 * If the target doesn't support private address spaces then return
 	 * the global one
 	 */
-	if (gpu->funcs->create_private_address_space)
+	if (gpu->funcs->create_private_address_space) {
 		aspace = gpu->funcs->create_private_address_space(gpu);
+		if (!IS_ERR(aspace))
+			aspace->pid = get_pid(task_pid(task));
+	}
 
 	if (IS_ERR_OR_NULL(aspace))
 		aspace = msm_gem_address_space_get(gpu->aspace);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 4052a18e18c2..59f26bd0fe42 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -298,7 +298,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config);
 
 struct msm_gem_address_space *
-msm_gpu_create_private_address_space(struct msm_gpu *gpu);
+msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
-- 
2.26.2

