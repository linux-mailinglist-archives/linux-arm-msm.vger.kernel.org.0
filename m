Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD422E6C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfE2Uz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:55:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59578 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfE2Uz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:55:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 82453618CE; Wed, 29 May 2019 20:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163357;
        bh=TB4M/rt699+7GpLoS9OHP7ZRv5MHTXpe7MAOFn1ir+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FuwiQejBLS/4m99GWIgPpVK2e9XkORdqMKETMunlZZMy0qk3d4c0dLYh/wgAqMXtN
         X7Zy9ZzypsNXDpDzYQo86FNY+2kob5bLpkO95Bs2EGPQYeEMF77wycDCA7x1iiaugs
         nJSV/NN2Bd1UTzyHDREdjvmEF6NmblBKqaK21ZIM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E89656192E;
        Wed, 29 May 2019 20:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559163347;
        bh=TB4M/rt699+7GpLoS9OHP7ZRv5MHTXpe7MAOFn1ir+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OnhxSkrDBTnHxUssHyGW0vZs7PCS1z3HfaZYwlHPLcXL5/I/LzpKoBAQv3J/V27vP
         l8xO+iEqqfNVo4zst0gpmMyFqPhwglA9jAgEihn5VLAaY2KjtySe6VyhhUTILrjP4D
         7mrSKsxib8vrOMrnO3Zmn2ONaTY6D0dRBvTR2dkc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E89656192E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 13/16] drm/msm: Add support to create target specific address spaces
Date:   Wed, 29 May 2019 14:54:49 -0600
Message-Id: <1559163292-4792-14-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to create a GPU target specific address space for
a context. For those targets that support per-instance
pagetables they will return a new address space set up for
the instance if possible otherwise just use the global
device pagetable.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_drv.c | 25 ++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gpu.h |  1 +
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4c51063..dd3eb30 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -609,6 +609,14 @@ static void load_gpu(struct drm_device *dev)
 	mutex_unlock(&init_lock);
 }
 
+static struct msm_gem_address_space *context_address_space(struct msm_gpu *gpu)
+{
+	if (!gpu->funcs->new_address_space)
+		return gpu->aspace;
+
+	return gpu->funcs->new_address_space(gpu);
+}
+
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -618,9 +626,16 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->aspace = context_address_space(priv->gpu);
+	if (IS_ERR(ctx->aspace)) {
+		int ret = PTR_ERR(ctx->aspace);
+
+		kfree(ctx);
+		return ret;
+	}
+
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->aspace = priv->gpu->aspace;
 	file->driver_priv = ctx;
 
 	return 0;
@@ -636,8 +651,12 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 	return context_init(dev, file);
 }
 
-static void context_close(struct msm_file_private *ctx)
+static void context_close(struct msm_drm_private *priv,
+		struct msm_file_private *ctx)
 {
+	if (ctx->aspace != priv->gpu->aspace)
+		msm_gem_address_space_put(ctx->aspace);
+
 	msm_submitqueue_close(ctx);
 	kfree(ctx);
 }
@@ -652,7 +671,7 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 		priv->lastctx = NULL;
 	mutex_unlock(&dev->struct_mutex);
 
-	context_close(ctx);
+	context_close(priv, ctx);
 }
 
 static irqreturn_t msm_irq(int irq, void *arg)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d4bf051..588d7ba 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -77,6 +77,7 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
 	struct msm_gem_address_space *(*create_address_space)
 		(struct msm_gpu *gpu);
+	struct msm_gem_address_space *(*new_address_space)(struct msm_gpu *gpu);
 };
 
 struct msm_gpu {
-- 
2.7.4

