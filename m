Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1E4F38CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfKGTjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:39:49 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38156 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfKGTjt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:39:49 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A8B0D60D88; Thu,  7 Nov 2019 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573155588;
        bh=31/b4Xs9G9WqSr6r3aTPk2Jthp+uBa6h73JY5NDZ6Bk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cvQV0+EMWyS8SxUON+6k9M++S2pEZOqW0G7a4mVVRNI2O2rykk5gsNBmjs6+sQdr/
         fFYkVRRPrKh/fIw0y3TcvLjzs141l3qjOWQ9H3tZLj1bH6baBeGIoL19xE89Qi4BQd
         UvXnpxJCCE4hJH9gkDy8n3uYHbcUc0tPX627p0xA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0692E602DD;
        Thu,  7 Nov 2019 19:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573155588;
        bh=31/b4Xs9G9WqSr6r3aTPk2Jthp+uBa6h73JY5NDZ6Bk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cvQV0+EMWyS8SxUON+6k9M++S2pEZOqW0G7a4mVVRNI2O2rykk5gsNBmjs6+sQdr/
         fFYkVRRPrKh/fIw0y3TcvLjzs141l3qjOWQ9H3tZLj1bH6baBeGIoL19xE89Qi4BQd
         UvXnpxJCCE4hJH9gkDy8n3uYHbcUc0tPX627p0xA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0692E602DD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cohens@codeaurora.org
From:   Steve Cohen <cohens@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     pdhaval@codeaurora.org, seanpaul@chromium.org, adelva@google.com,
        Steve Cohen <cohens@codeaurora.org>
Subject: [PATCH 1/3] drm: add driver hook for create blob limitations
Date:   Thu,  7 Nov 2019 14:39:12 -0500
Message-Id: <1573155554-16248-2-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow drivers with blob limitations to run checks before blobs
are created. This can be used to limit how much memory can be
allocated based on driver requirements.

Signed-off-by: Steve Cohen <cohens@codeaurora.org>
---
 drivers/gpu/drm/drm_property.c | 7 +++++++
 include/drm/drm_drv.h          | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 892ce63..507a8a1 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -793,6 +793,13 @@ int drm_mode_createblob_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	if (dev->driver->createblob_check) {
+		ret = dev->driver->createblob_check(
+				dev, out_resp->length, file_priv);
+		if (ret)
+			return ret;
+	}
+
 	blob = drm_property_create_blob(dev, out_resp->length, NULL);
 	if (IS_ERR(blob))
 		return PTR_ERR(blob);
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 8976afe..73b39b89 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -776,6 +776,15 @@ struct drm_driver {
 	int (*dma_quiescent) (struct drm_device *);
 	int (*context_dtor) (struct drm_device *dev, int context);
 	int dev_priv_size;
+
+	/**
+	 * @createblob_check: driver check for creating blob properties
+	 *
+	 * Hook for checking blob limitations imposed by drivers
+	 */
+	int (*createblob_check) (struct drm_device *dev,
+				 size_t length,
+				 struct drm_file *file_priv);
 };
 
 extern unsigned int drm_debug;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

