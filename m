Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBE820E5DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403930AbgF2VmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbgF2Sh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9737C033C00
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 11:19:25 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p3so8681531pgh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NcQmzB/12sdIDSUANv/DWZPIgxSIz4p962Qo3Ee9Xk=;
        b=LMYg4oGGKEaTmenbEsK0CIKVFhkJl9YAlVxpJdly4EOkbl0HBYt/5Ha3Srnig1UBoT
         h/qtDvpv74MmjMgwV/9506Og5qSGCJS4PBTr6dfpCvg0SAypsOTCJWlbnS2WI3W6lbGg
         Axn0byRolbnuj2z0dG5vUAetEKbHsjSf+tgr2Kp3+KAWsPh4O8Kcop2ltFxfxWHz8xAW
         8XwtIByCbeYbP9ZsKlGCD+/kFf5aZJQfNPO36x2f739Z+hm41rea47av0faYwnP1THe+
         oug4dfKuvUmE7TkKBumQDViI1es4IbdlihRotJdDQ43nRGgnfWdJ2prNvsLJ7P8nVnnL
         fmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NcQmzB/12sdIDSUANv/DWZPIgxSIz4p962Qo3Ee9Xk=;
        b=Ki52xmbRClHA4M0JlnZInMrqCkE1wPOlLk2PE+sF55Ay3fv2o1arhMZWVRPcE7yhHE
         6vXSh/e2FFVX6Txwxazv7zIhkzpmDpUbXA+pZUarHbmq/EPurhFgL8p8YWaCRL2pqcwp
         l24DocSrmrqEIVHAJ4kjSoYXN0+rXDa0RHQKBsESvUJZQmeMAEz6/vWG45kuyGHEoqyh
         Y1gZUchK705RFTe5YPVGsoA53P+kztWQOtfPItfvBDEON1A1fMlZyFlOEyeVlXQI+YXs
         3myHG1SoXQNID4Q+Ur7+wfBxzIzLRpCD1wL391pLTkhwEt7QtpIJJwT1VyY68s9IPGNj
         W98g==
X-Gm-Message-State: AOAM533cM7vkrM/Ah9SijuK65kT/487ojRS/KggzJWEHc0YWHE1NcfLo
        DQxrzuvo+3u20nlAiU1lUvp7fQ==
X-Google-Smtp-Source: ABdhPJydZmEj+KGJUb2VhyoF11wEycqqrieadtqlO/4guD0EeDtJASVLB7TAqDKHTzBvaC/X7SqBAw==
X-Received: by 2002:aa7:91d4:: with SMTP id z20mr14642359pfa.153.1593454765199;
        Mon, 29 Jun 2020 11:19:25 -0700 (PDT)
Received: from miranda.anholt.net ([97.115.155.172])
        by smtp.gmail.com with ESMTPSA id a9sm359463pfr.103.2020.06.29.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 11:19:24 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/2] drm/msm: Garbage collect unused resource _len fields.
Date:   Mon, 29 Jun 2020 11:19:20 -0700
Message-Id: <20200629181921.3019271-1-eric@anholt.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Nothing was using the lengths of these ioremaps.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 21 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c |  9 ---------
 3 files changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 680527e28d09..a4ab802fee6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -45,20 +45,6 @@
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
-static unsigned long dpu_iomap_size(struct platform_device *pdev,
-				    const char *name)
-{
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!res) {
-		DRM_ERROR("failed to get memory resource: %s\n", name);
-		return 0;
-	}
-
-	return resource_size(res);
-}
-
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_danger_signal_status(struct seq_file *s,
 		bool danger_status)
@@ -844,7 +830,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto error;
 	}
 	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
-	dpu_kms->mmio_len = dpu_iomap_size(dpu_kms->pdev, "mdp");
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap(dpu_kms->pdev, "vbif", "vbif");
 	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
@@ -853,22 +838,16 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->vbif[VBIF_RT] = NULL;
 		goto error;
 	}
-	dpu_kms->vbif_len[VBIF_RT] = dpu_iomap_size(dpu_kms->pdev, "vbif");
 	dpu_kms->vbif[VBIF_NRT] = msm_ioremap(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
 	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
 		dpu_kms->vbif[VBIF_NRT] = NULL;
 		DPU_DEBUG("VBIF NRT is not defined");
-	} else {
-		dpu_kms->vbif_len[VBIF_NRT] = dpu_iomap_size(dpu_kms->pdev,
-							     "vbif_nrt");
 	}
 
 	dpu_kms->reg_dma = msm_ioremap(dpu_kms->pdev, "regdma", "regdma");
 	if (IS_ERR(dpu_kms->reg_dma)) {
 		dpu_kms->reg_dma = NULL;
 		DPU_DEBUG("REG_DMA is not defined");
-	} else {
-		dpu_kms->reg_dma_len = dpu_iomap_size(dpu_kms->pdev, "regdma");
 	}
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 4e32d040f1e6..13034cdb8665 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -100,7 +100,6 @@ struct dpu_kms {
 
 	/* io/register spaces: */
 	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
-	unsigned long mmio_len, vbif_len[VBIF_MAX], reg_dma_len;
 
 	struct regulator *vdd;
 	struct regulator *mmagic;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 80d3cfc14007..9f20b84d5c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -37,7 +37,6 @@ struct dpu_mdss_hw_init_handler {
 struct dpu_mdss {
 	struct msm_mdss base;
 	void __iomem *mmio;
-	unsigned long mmio_len;
 	struct dss_module_power mp;
 	struct dpu_irq_controller irq_controller;
 	struct icc_path *path[2];
@@ -292,7 +291,6 @@ int dpu_mdss_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct resource *res;
 	struct dpu_mdss *dpu_mdss;
 	struct dss_module_power *mp;
 	int ret = 0;
@@ -308,13 +306,6 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mdss");
-	if (!res) {
-		DRM_ERROR("failed to get memory resource for mdss\n");
-		return -ENOMEM;
-	}
-	dpu_mdss->mmio_len = resource_size(res);
-
 	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
 	if (ret)
 		return ret;
-- 
2.26.2

