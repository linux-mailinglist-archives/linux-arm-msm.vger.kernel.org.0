Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F75EF38CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbfKGTjx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:39:53 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38264 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfKGTjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:39:53 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 384E560A4E; Thu,  7 Nov 2019 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573155592;
        bh=vGLdRkcPj6szRI+TFank/Fc22n75Y001KavF2mYwq0w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dsi6ZIPPQGMb0VABHys8syXmMNqSDBBtcTJA/8oZGjdi7FOiwzFbk/H/V+XChSMO9
         Vk+DJMnd0tv18CjhorK1HbsdW73UwFndsleJg3rV0dmApV19Q8kWf3xusg4lLzWbSN
         9KvVUxUIxe+odM7r/1kjuOb8cQemx7sV+HNCxj2E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cohens-linux.qualcomm.com (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cohens@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5232B60D8D;
        Thu,  7 Nov 2019 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573155591;
        bh=vGLdRkcPj6szRI+TFank/Fc22n75Y001KavF2mYwq0w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=brbHp17Vjy9v1JvYjtPdlb9TlCv8zRUoWZxpl8FxnGBVArrdCg7Rk96XelKADMpzk
         9RdpBFT4xtLHc2d/6sIbYloWvBbqGiStFSykkJ1jxyQUXxVZvL/zPRupO1vUPN0zsV
         ruC/4LazTTkeRORiNdcccUtNckYi3FCw6fL5Eo3E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5232B60D8D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cohens@codeaurora.org
From:   Steve Cohen <cohens@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     pdhaval@codeaurora.org, seanpaul@chromium.org, adelva@google.com,
        Steve Cohen <cohens@codeaurora.org>
Subject: [PATCH 2/3] drm/msm: add support for createblob_check driver hook
Date:   Thu,  7 Nov 2019 14:39:13 -0500
Message-Id: <1573155554-16248-3-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow msm_kms devices to register a hook to check blob count
and blob size limitations before a new blob is created.

Signed-off-by: Steve Cohen <cohens@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8..d0b0419 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -680,6 +680,30 @@ static void msm_disable_vblank(struct drm_device *dev, unsigned int pipe)
 	vblank_ctrl_queue_work(priv, pipe, false);
 }
 
+static int msm_createblob_check (struct drm_device *dev, size_t length,
+		struct drm_file *file_priv)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int count = 0;
+	struct drm_property_blob *blob;
+
+	if (!kms)
+		return -EINVAL;
+
+	if (!kms->funcs->createblob_check)
+		return 0;
+
+	mutex_lock(&dev->mode_config.blob_lock);
+	list_for_each_entry(blob, &file_priv->blobs, head_file) {
+		if (count < UINT_MAX)
+			count++;
+	}
+	mutex_unlock(&dev->mode_config.blob_lock);
+
+	return kms->funcs->createblob_check(count, length);
+}
+
 /*
  * DRM ioctls:
  */
@@ -1011,6 +1035,7 @@ static struct drm_driver msm_driver = {
 	.gem_prime_vmap     = msm_gem_prime_vmap,
 	.gem_prime_vunmap   = msm_gem_prime_vunmap,
 	.gem_prime_mmap     = msm_gem_prime_mmap,
+	.createblob_check   = msm_createblob_check,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1cbef6b..8a7e581 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -126,6 +126,7 @@ struct msm_kms_funcs {
 	/* debugfs: */
 	int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
 #endif
+	int (*createblob_check)(unsigned int count, size_t length);
 };
 
 struct msm_kms;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

