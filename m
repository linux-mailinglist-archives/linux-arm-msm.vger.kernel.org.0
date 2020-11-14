Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F922B2DDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 16:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgKNPVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 10:21:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgKNPVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 10:21:11 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0C3C0617A6
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2020 07:21:10 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id d9so12444604qke.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2020 07:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hPmKg3FYk3Lzs70K/NYX4J1DHPtpY/HdRoRb6lm0KnA=;
        b=pJascp7VGYt/H6n29g64kblStEJQHiJchoF3UWHdzGdpjG81mpnsko/3z8m016I0IF
         QLUAPyXMENTvrzyVFNTy/8OdnM+2B6l3cHde4uEAwzpo48nwwjzvRhZSlnEwofdu6gOj
         vKgha1gL0RcUMSJ4YOAY1CCHnhKzaLg3s1rBHAxLgEtGt9xs1jzDcGxhJiAj9LsldP46
         QcSXOwRli2V706fEv5gpY3q+Nfhy1/Q4nvGECR5Xxdxsutm1e3EGO54vbYtv9hjVQqtX
         TWJknmynolLMmfZXxaacPwU9xBTpnG5YEpgEXoAOoCI6iNZ7NYnpHvxpZLfe9onNNIy+
         E9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hPmKg3FYk3Lzs70K/NYX4J1DHPtpY/HdRoRb6lm0KnA=;
        b=rQxQZdJCjbK1hiXjTbblSZfPqaehIZai/yGvBQv3LehhLGdOyEgdLuS9UsLy1E2eP0
         oeOOdrBjGFLNwqahTm+4hfjfDGR/PHAAxJh6sAdEqcMQ+X/WFVrucsnPnETMvpFEZR7G
         0Rj1MKblKVxEO3macSAad+x8rm4w2JgRXfug3KyYBO6tyGVReLoQFxooOWY2sWTPwUUk
         o3HL42UQKBAxg/Zr9Ki05Lh6iQeoDejxiaEALxxdVGBcoDry4ldPxjY47zdBgW6B1my1
         93Vp9adcxTVUCi0bV5AyxFbNqPt1QQoB70DJfrj1wNiK1b4S1RP+R+uNbLnj2l1ga041
         jZ1Q==
X-Gm-Message-State: AOAM530FESFkhJ6VuIv69BZE6nXmEeX7RM6SlYMsLQ1vlakO09u+0zL/
        gC1bXSWc+GMJfondjDzK65yQ9w==
X-Google-Smtp-Source: ABdhPJzgscgk0ohNXdNYoDcxxdIkRC8kNTlyMvItOc3OOIL+2bEmEN+MGO8+p9C4UiNuw9dUFWyyaw==
X-Received: by 2002:a37:2f43:: with SMTP id v64mr6878299qkh.127.1605367269282;
        Sat, 14 Nov 2020 07:21:09 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 07:21:08 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org, hch@lst.de
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 3/5] drm/msm: call dma_direct_bypass()
Date:   Sat, 14 Nov 2020 10:17:11 -0500
Message-Id: <20201114151717.5369-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201114151717.5369-1-jonathan@marek.ca>
References: <20201114151717.5369-1-jonathan@marek.ca>
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

