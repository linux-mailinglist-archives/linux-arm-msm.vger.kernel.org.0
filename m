Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0901284AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 19:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731142AbfEWRRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 13:17:09 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34312 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731140AbfEWRRJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 13:17:09 -0400
Received: by mail-qt1-f194.google.com with SMTP id h1so7670208qtp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YOoI+kFEFfz9LrL8Adfvk8PSVi8fDSRQM6ZIbKpC71Q=;
        b=WOyQTxGFjpgVbzMyOh6x8CBVZIC4EmjNx9VoiKWwVDRBwjidnFD+Arrimko93Sgb+j
         ULIKYLV3wI5JNHuDQ42Gf0DBiDwP+1JgdiCjYOCAJ1lvB1FxkYdUuZsO+sEH7cyI8nLj
         VnlYsxy7mtFNq7iZIjbajz4ZuFkBggxiIgvG4wAXb2SCPA5anCyU7KQ68Vv75Ox4dT2E
         u7kaM1IqRO5Phdy+Rm1TtBkY3DEjq5j+LsuA++pxJ5WrsvKcxQlORRqmQsuPUIVd5nFG
         LDtCcZ/GgkV582VHLoKcO8MwFeapNl4ClAPjhJiF/EEYWIIJse7Iv6pyfwzwE7B+/v7y
         2Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YOoI+kFEFfz9LrL8Adfvk8PSVi8fDSRQM6ZIbKpC71Q=;
        b=ppJajIphLeLsES2u+9dPYWeljV9PWTCgzWpDmu0Rt7Xw88Z1HikgI+7bYwfjsRya+z
         Kfu3DeRk4Fm7895Nfhp37C2MruuBGZzzNnrij4ojyIrhOt6J3AmA/PveCAnKFUmF2RH0
         Iv5SwSUiIzz4nHCLzm5EXbeKSORjaDxQK5p5Vzo5lxFLr8tZIE/hKdS+KoEO9SOxG7Pf
         jlMsELVwHXkybRTFe5xwetwv3eKc11FsxsiYAB84hyYGc45LCqw1HYS+aGKQO+3+3ZHg
         dApXa98XTclM4mvJmc6XTm8jto0mvMeyRTZbYU3bajYHP+XR8veAjNeqXxfm/POLPk8/
         CAYg==
X-Gm-Message-State: APjAAAWNVp67IOTV+ovZwCcBameTySSiRErcQBBEYjAIzePa2lEOgg6S
        2gyN69H5fXGY/kVcuD5wPglo9g==
X-Google-Smtp-Source: APXvYqxQoLBWcUdmZJt5A7maTk+7saVt300tFlzQsl2BLsrTVmobiF3JlblgyopmJed3KTL4ljJVfw==
X-Received: by 2002:ac8:2809:: with SMTP id 9mr66230566qtq.4.1558631827700;
        Thu, 23 May 2019 10:17:07 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 10:17:07 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/6] drm/msm/a6xx: Remove devm calls from gmu driver
Date:   Thu, 23 May 2019 13:16:43 -0400
Message-Id: <20190523171653.138678-4-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

The gmu driver is initialized and cleaned up with calls from the gpu driver. As
such, the platform device stays valid after a6xx_gmu_remove is called and the
device managed resources are not freed. In the case of gpu probe failures or
unbind, these resources will remain managed.

If the gpu bind is run again (eg: if there's a probe defer somewhere in msm),
these resources will be initialized again for the same device, creating multiple
references. In the case of irqs, this causes failures since the irqs are
not shared (nor should they be).

This patch removes all devm_* calls and manually cleans things up in
gmu_remove.

Changes in v2:
- Add iounmap and free_irq to gmu_probe error paths

Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 ++++++++++++++++++---------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 7465423e9b71..f7240c9e11fb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -505,9 +505,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
-		devm_iounmap(gmu->dev, pdcptr);
+		iounmap(pdcptr);
 	if (!IS_ERR_OR_NULL(seqptr))
-		devm_iounmap(gmu->dev, seqptr);
+		iounmap(seqptr);
 }
 
 /*
@@ -1197,7 +1197,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	ret = ioremap(res->start, resource_size(res));
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1213,10 +1213,10 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 
 	irq = platform_get_irq_byname(pdev, name);
 
-	ret = devm_request_irq(&pdev->dev, irq, handler, IRQF_TRIGGER_HIGH,
-		name, gmu);
+	ret = request_irq(irq, handler, IRQF_TRIGGER_HIGH, name, gmu);
 	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "Unable to get interrupt %s\n", name);
+		DRM_DEV_ERROR(&pdev->dev, "Unable to get interrupt %s %d\n",
+			      name, ret);
 		return ret;
 	}
 
@@ -1241,12 +1241,18 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 		dev_pm_domain_detach(gmu->gxpd, false);
 	}
 
+	iounmap(gmu->mmio);
+	gmu->mmio = NULL;
+
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	iommu_detach_device(gmu->domain, gmu->dev);
 
 	iommu_domain_free(gmu->domain);
 
+	free_irq(gmu->gmu_irq, gmu);
+	free_irq(gmu->hfi_irq, gmu);
+
 	gmu->initialized = false;
 }
 
@@ -1281,24 +1287,24 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Allocate memory for for the HFI queues */
 	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
 	if (IS_ERR(gmu->hfi))
-		goto err;
+		goto err_memory;
 
 	/* Allocate memory for the GMU debug region */
 	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K);
 	if (IS_ERR(gmu->debug))
-		goto err;
+		goto err_memory;
 
 	/* Map the GMU registers */
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio))
-		goto err;
+		goto err_memory;
 
 	/* Get the HFI and GMU interrupts */
 	gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
 	gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
 
 	if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0)
-		goto err;
+		goto err_mmio;
 
 	/*
 	 * Get a link to the GX power domain to reset the GPU in case of GMU
@@ -1315,7 +1321,12 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->initialized = true;
 
 	return 0;
-err:
+
+err_mmio:
+	iounmap(gmu->mmio);
+	free_irq(gmu->gmu_irq, gmu);
+	free_irq(gmu->hfi_irq, gmu);
+err_memory:
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	if (gmu->domain) {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

