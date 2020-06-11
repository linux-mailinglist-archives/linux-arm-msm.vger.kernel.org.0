Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A811F7019
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 00:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgFKW3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 18:29:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36023 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgFKW3h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 18:29:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591914575; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OXHyM7mwGnBB410eeIFMvDojYJq+faL3O+0duM9g5E8=; b=op34wOvAkWRZLgZzbCJH4QTxUkL0J82Xi9voQDglSIwnItYp69w9BJIFUHqbbCsGjmTnkjvk
 6JOMMbof7Hb1cTzt8brm8rou95ghFXCUCDHAXmhXU7qoo4sJy4BEcYq878KY8oObdbZEmCLq
 xoZuhuzCGY3/sEklYm+hLMtlD4E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ee2b04f567385e8e7cd136c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 22:29:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 872B2C433AD; Thu, 11 Jun 2020 22:29:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9A77C433C8;
        Thu, 11 Jun 2020 22:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9A77C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/msm: Add support for address space instances
Date:   Thu, 11 Jun 2020 16:29:20 -0600
Message-Id: <20200611222921.464-6-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611222921.464-1-jcrouse@codeaurora.org>
References: <20200611222921.464-1-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for allocating an address space instance. Targets that support
per-instance pagetables should implement their own function to allocate a
new instance. The default will return the existing generic address space.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_drv.c     | 15 +++++++++------
 drivers/gpu/drm/msm/msm_drv.h     |  4 ++++
 drivers/gpu/drm/msm/msm_gem_vma.c |  9 +++++++++
 drivers/gpu/drm/msm/msm_gpu.c     | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h     |  5 +++++
 5 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f6ce40bf3699..0c219b954943 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -599,7 +599,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
+	ctx->aspace = msm_gpu_address_space_instance(priv->gpu);
 	file->driver_priv = ctx;
 
 	return 0;
@@ -618,6 +618,8 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 static void context_close(struct msm_file_private *ctx)
 {
 	msm_submitqueue_close(ctx);
+
+	msm_gem_address_space_put(ctx->aspace);
 	kfree(ctx);
 }
 
@@ -782,18 +784,19 @@ static int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data,
 }
 
 static int msm_ioctl_gem_info_iova(struct drm_device *dev,
-		struct drm_gem_object *obj, uint64_t *iova)
+		struct drm_file *file, struct drm_gem_object *obj,
+		uint64_t *iova)
 {
-	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_file_private *ctx = file->driver_priv;
 
-	if (!priv->gpu)
+	if (!ctx->aspace)
 		return -EINVAL;
 
 	/*
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, priv->gpu->aspace, iova);
+	return msm_gem_get_iova(obj, ctx->aspace, iova);
 }
 
 static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
@@ -832,7 +835,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		args->value = msm_gem_mmap_offset(obj);
 		break;
 	case MSM_INFO_GET_IOVA:
-		ret = msm_ioctl_gem_info_iova(dev, obj, &args->value);
+		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
 		break;
 	case MSM_INFO_SET_NAME:
 		/* length check should leave room for terminating null: */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e2d6a6056418..983a8b7e5a74 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -249,6 +249,10 @@ int msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
 
+
+struct msm_gem_address_space *
+msm_gem_address_space_get(struct msm_gem_address_space *aspace);
+
 void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
 
 struct msm_gem_address_space *
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 5f6a11211b64..29cc1305cf37 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -27,6 +27,15 @@ void msm_gem_address_space_put(struct msm_gem_address_space *aspace)
 		kref_put(&aspace->kref, msm_gem_address_space_destroy);
 }
 
+struct msm_gem_address_space *
+msm_gem_address_space_get(struct msm_gem_address_space *aspace)
+{
+	if (!IS_ERR_OR_NULL(aspace))
+		kref_get(&aspace->kref);
+
+	return aspace;
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a22d30622306..0000b4f31460 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -821,6 +821,23 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 	return 0;
 }
 
+/* Return a new address space instance */
+struct msm_gem_address_space *
+msm_gpu_address_space_instance(struct msm_gpu *gpu)
+{
+	if (!gpu)
+		return NULL;
+
+	/*
+	 * If the GPU doesn't support instanced address spaces return the
+	 * default address space
+	 */
+	if (!gpu->funcs->address_space_instance)
+		return msm_gem_address_space_get(gpu->aspace);
+
+	return gpu->funcs->address_space_instance(gpu);
+}
+
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 429cb40f7931..f1762b77bea8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -64,6 +64,8 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
 	struct msm_gem_address_space *(*create_address_space)
 		(struct msm_gpu *gpu, struct platform_device *pdev);
+	struct msm_gem_address_space *(*address_space_instance)
+		(struct msm_gpu *gpu);
 };
 
 struct msm_gpu {
@@ -286,6 +288,9 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config);
 
+struct msm_gem_address_space *
+msm_gpu_address_space_instance(struct msm_gpu *gpu);
+
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
 struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
-- 
2.17.1

