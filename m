Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9CB20E63D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgF2Vpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbgF2Shm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:42 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B994C033C03
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 11:19:26 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 67so4171658pfg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1oi0v4BTqqsBj+gW6Vk8gVF71VLAujXP7ErpOuZ8DBU=;
        b=yQLnvAyjAr+LxeKzCBz+Cz38qqs13PpJx/G/GeiT7S+YT7j/jCgsNknnuMVghwTLwa
         p+B7z41EM1Sg+VeQ9+I4Ii1bpu12EIl+9TIXwwW2s4A2UziC7U31raM4gmDloGG7KreY
         3XQ+vjN2fr+VG+XPUuRYRaSThXnqdOLqD6pAv8vqTMeAuXGl/AXgyLtfNyU7t54zcDQn
         xiCVg6AOhQlcTQWiOvjs8bRz9yU/gdGQXO+cB5MLKRY2MP642FevbdHkvjUOWZXTIN+M
         WRVB8z0/ZnlvmcnGzsHaukTLfq1LnQ4/9GWydJFNGlrDTsCENJvlonF0h05dbumSvzwp
         IHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1oi0v4BTqqsBj+gW6Vk8gVF71VLAujXP7ErpOuZ8DBU=;
        b=omR2ZBSHjutnOZFdRqGcofGRe9e+zDw0GJRWQAoT0MmQ+o1i79JQ69Bx5Re6zq1oP5
         yxASvPRZNRdKP8ZKTpMUvnQGrXDjDtOAfEvFjc2TQMZ3Q21aPxN80dLIuAQMI0XkMH7n
         VH5GuW+HzqIGZw7Np7sAWq5glqbn3ZPbAbIP3wXSpedfP5GTIQRl97RmCHskS056WYTA
         lL5p2W8Tuljisfe2Ev8E0mpSf68SAzsiZk2tcn77TZJwywZrcdE05538WX6IZHRluWJJ
         +5hXGp0ZogX0fxIgRvFsNIIn3KGbFwuHHzdmWSDB1rlxAETy09/1iuKLvy94zMgYyKUS
         QOCA==
X-Gm-Message-State: AOAM531zwBBbXsQfjLz1saLN9+TU9mp7o7nY9+cL8svfeZJgfmsDDG3i
        zRnA0QVbT7NfZ5CYU8iJrDpkpA==
X-Google-Smtp-Source: ABdhPJwxzpypgasS1TUWuGtTez4i3IrG6t1gNltC8YqyLfhomKv2+LqAnOB6FD7cpbGSwbn/8KX1YQ==
X-Received: by 2002:a63:fc09:: with SMTP id j9mr11866988pgi.308.1593454766126;
        Mon, 29 Jun 2020 11:19:26 -0700 (PDT)
Received: from miranda.anholt.net ([97.115.155.172])
        by smtp.gmail.com with ESMTPSA id a9sm359463pfr.103.2020.06.29.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 11:19:25 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/2] drm/msm: Quiet error during failure in optional resource mappings.
Date:   Mon, 29 Jun 2020 11:19:21 -0700
Message-Id: <20200629181921.3019271-2-eric@anholt.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629181921.3019271-1-eric@anholt.net>
References: <20200629181921.3019271-1-eric@anholt.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't expect to find vbif_nrt or regdma on cheza, but were clogging
up dmesg with errors about it.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 ++--
 drivers/gpu/drm/msm/msm_drv.c           | 22 ++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.h           |  2 ++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a4ab802fee6d..d9aef2b5e930 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -838,13 +838,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->vbif[VBIF_RT] = NULL;
 		goto error;
 	}
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
+	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
 	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
 		dpu_kms->vbif[VBIF_NRT] = NULL;
 		DPU_DEBUG("VBIF NRT is not defined");
 	}
 
-	dpu_kms->reg_dma = msm_ioremap(dpu_kms->pdev, "regdma", "regdma");
+	dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma", "regdma");
 	if (IS_ERR(dpu_kms->reg_dma)) {
 		dpu_kms->reg_dma = NULL;
 		DPU_DEBUG("REG_DMA is not defined");
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f6ce40bf3699..df4a3c6a49cd 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -120,8 +120,8 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
 	return clk;
 }
 
-void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
-		const char *dbgname)
+void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
+			   const char *dbgname, bool quiet)
 {
 	struct resource *res;
 	unsigned long size;
@@ -133,7 +133,8 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	if (!res) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+		if (!quiet)
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -141,7 +142,8 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+		if (!quiet)
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -151,6 +153,18 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 	return ptr;
 }
 
+void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
+			  const char *dbgname)
+{
+	return _msm_ioremap(pdev, name, dbgname, false);
+}
+
+void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
+				const char *dbgname)
+{
+	return _msm_ioremap(pdev, name, dbgname, true);
+}
+
 void msm_writel(u32 data, void __iomem *addr)
 {
 	if (reglog)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e2d6a6056418..2687f7a42c15 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -411,6 +411,8 @@ struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
 	const char *name);
 void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 		const char *dbgname);
+void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
+		const char *dbgname);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
 
-- 
2.26.2

