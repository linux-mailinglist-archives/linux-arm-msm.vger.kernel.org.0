Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0004C2A9996
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 17:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbgKFQiq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 11:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbgKFQip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 11:38:45 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13EBCC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 08:38:45 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id j31so1156599qtb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hPmKg3FYk3Lzs70K/NYX4J1DHPtpY/HdRoRb6lm0KnA=;
        b=k3MjYGOGKVYelIzBvfp3L8cST3oDN4AlfVorpp1NDVxMYElQlNO3DALI40yDkTrawz
         mgcs/RTD4xlqqFsj0pjj75nHndQJZfTvjrl10mDt+PWoYU1EMx4zWgUz7k0o1Vz55sLy
         pSMuMNWSszPtCXIHVhI1puyZMniA7Ob22db6Ks6TpabmPxLzVmNRaQfATrT5MwsllmqF
         flvA2plO4KB9Jm9Yg4scr+UucfSUY3hCzX4i3Rm5WrZGVYfURrtmpONO5NWpaiBLZduE
         mV+oIa4Zplly8jpTfF4zftuD1v6KV6b/+4EEkuzYXzRkYcs8A/H5+D7X1TGBBItW9erS
         BuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hPmKg3FYk3Lzs70K/NYX4J1DHPtpY/HdRoRb6lm0KnA=;
        b=QZp3P9gAg5gj+Bkv4SwSN1fjgWnoCLrq5qqbsthIn+uBx5HlpqT91GE+sMWPT6lBGh
         rRersTODaIzQ00GoHJRRB/O/dxgH/NhphBB8+V7rBSb1lPbegSk87e+oVmcACljks/C0
         fQ2begZqQ7GY9KRHtQjAN48twVkExtJKGaz35UEyPjGvnFj1JrtFgfM4bCFv2FrhG5pI
         efwsWZ/mN1cybjX/FMj81ycyEshKziMDeN1rkQGFadQBVKOM+f7b3cPjgQbqpIP05I5p
         QG0TpZU6hPtGJMsmCd4A7SwNWcYH5/tGo3Rpoij6AfNgqEElFCc4IQpR/i6d/S+3lb6Y
         yJug==
X-Gm-Message-State: AOAM5302AQLqtqx2sjXAq9ZbbWZ0A2wKVFiQiwLNXmGTRq7bS3MU/xz+
        bL5rt3FdDVVubJBDXj2Pg60CHA==
X-Google-Smtp-Source: ABdhPJywTSmbTMlzI9PUVuL5HIr8Aymu34q6XmjeK+5a0EqRC0hGs44w8EYmRRoQucNCsiOWsq2klQ==
X-Received: by 2002:ac8:3797:: with SMTP id d23mr2269867qtc.205.1604680724317;
        Fri, 06 Nov 2020 08:38:44 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 08:38:43 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/5] drm/msm: call dma_direct_bypass()
Date:   Fri,  6 Nov 2020 11:34:32 -0500
Message-Id: <20201106163437.30836-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201106163437.30836-1-jonathan@marek.ca>
References: <20201106163437.30836-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Always use direct dma ops and no swiotlb.

Note: arm-smmu-qcom already avoids creating iommu dma ops, but not
everything uses arm-smmu-qcom and this also sets the dma mask.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/Kconfig   | 1 +
 drivers/gpu/drm/msm/msm_drv.c | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e5816b498494..07c50405970a 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -20,6 +20,7 @@ config DRM_MSM
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
 	select PM_OPP
+	select DMA_OPS_BYPASS
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 49685571dc0e..bae48afca82e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/dma-direct.h>
 #include <linux/kthread.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
@@ -1288,10 +1289,11 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	/* on all devices that I am aware of, iommu's which can map
-	 * any address the cpu can see are used:
+	/* always use direct dma ops and no swiotlb
+	 * note: arm-smmu-qcom already avoids creating iommu dma ops, but
+	 * not everything uses arm-smmu-qcom and this also sets the dma mask
 	 */
-	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	ret = dma_direct_bypass(&pdev->dev);
 	if (ret)
 		goto fail;
 
-- 
2.26.1

