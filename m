Return-Path: <linux-arm-msm+bounces-19770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A48C35D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 11:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B809B1F21422
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 09:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036901BC49;
	Sun, 12 May 2024 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxS9IeUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBEA14F98;
	Sun, 12 May 2024 09:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715504648; cv=none; b=BiMs1v+kMNQnLazpJ1nwWe4/HM3k91Y3cCqWAH7qZwh+Dp8D2+Gc14TSNBGciWa4/5XlkxF5ElkYt/Wqy1mHd9YDqyVK69NWEyI5hZ9HtJ6h4UbHWMuXhUxRI1bjrKVigODzfq1o1kcfcA/UEfTPp1sdF/n+3pvT3gHzcV0PnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715504648; c=relaxed/simple;
	bh=kxKl9BXWLII/5XSxmShz9Co5it81zM/OD7dKzTsMN9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aW7IzCYoZ/uZ140pXanrMuzBvXK0nqP0kNLk4G0JfatCRi7OpKMvh2qmKqbnwZN+wIXcLZvgis0W6qf07+2DtNCHGPwOTmE+7eG7JX65hCW2mySpNxlbInT6d/lbdKPzMFqNoBY81huBSdpTGjSLeTTbQRu9Dh5FwtJhJF5Qgzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxS9IeUr; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e2c70f0c97so40655291fa.0;
        Sun, 12 May 2024 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715504645; x=1716109445; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Om7z4z/nZPkmvzc/xv1BUHiiD4wa9VFdhmgBrAsUs88=;
        b=JxS9IeUrDPLLrfq1siYrgBfVIR7v86Zlxo6O12hLdyWOULMmQck7GXC8VkJtPOgnpT
         uR0oEgtslYRYTdCarkf0t9aINHr9I3Xn58AhLxYXwNK0LVE+1RbSnuRU/okc9yUaKO8i
         eXfMJXBDd8UE9XqzV0rTD+14BpSwzQULMVRD9wcweCMPy1QW2gC+F26QEI7J5Ln3ERVI
         RZUxoYsN7wImhorAOW4cwooN+XvkISorstFCJoHJQF6SwrNSLp8uD4dgAVA/K/s9y+us
         UO5amiu2vRDnOcF89+Ry877/4TcFA028PK11XxgeZzeee1Si6KHH+QrrOHC444dvB0iO
         5iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715504645; x=1716109445;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Om7z4z/nZPkmvzc/xv1BUHiiD4wa9VFdhmgBrAsUs88=;
        b=fvl3i8fXhxiY5HMMbs+vxxIvCJXdW4MPpTXRMGgDBVwHxyir7KFxkR0NEtZKOue3U6
         hfZUeTLveGN472bhv8jCLtLYpC6Mw2ziYQJZL8uGsWDCI/BWPdmbOWLM6zvSAhxDNih/
         nkyu0W5UfFj1IsG3GHouujswa1a2p0rJTPhvVBEOsxQnVoAgX+TOSXZGR8qzHcxBtozb
         ImOsLq5nw2R0pdOBU+2AM3WlJSVBz0scOfwbqYK/FW1Vi1gyPNX2eXi88ZYA62NkMB2C
         kVnl6QqxP3PjP3M+4zrahP54dngCupH0qMbIbvHz24yWU2U02CrykEtmDPDdntllLpo0
         8JKw==
X-Forwarded-Encrypted: i=1; AJvYcCVCU9g7hwOSPvKDwvLyI8KLMgCr8I6kdiUjt/Y6/dl9BlYtNu9RRK+eIWr5ECDL45tAJHwIr8F9kZLJ3MW62nWahHTd4hSV5WG4VZw3
X-Gm-Message-State: AOJu0Yz0f4f3VvYcf2lFRqHE9WLGIxQKICbB413OVhfYAVUqB0Rl4AT+
	fHTmvSlVWaMmnJGpwANLllZkme5GQhuBzbhyoT6mlwjDfA+F9bz0jgVX+0+8
X-Google-Smtp-Source: AGHT+IGmyKXU7smaDw09zDngJdmSsV9gZLDt6vpCR+JOFX7ZIkID5MSda4g1IoGmjVtbcawOzD+2+Q==
X-Received: by 2002:a05:6512:158d:b0:519:5df9:d945 with SMTP id 2adb3069b0e04-5220fb77429mr6289711e87.4.1715504644872;
        Sun, 12 May 2024 02:04:04 -0700 (PDT)
Received: from kali.localhost (static.47.50.88.23.clients.your-server.de. [23.88.50.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cd9csm431372766b.37.2024.05.12.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 02:04:04 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sun, 12 May 2024 05:03:53 -0400
Subject: [PATCH v4] drm/msm/a6xx: request memory region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPiFQGYC/43NQQ7CIBAF0KsY1o5hBiriynsYF7RMK4m0Bkyja
 Xp30VXjwnT5f+a/mUTmFDiL42YSiceQw9CXoLcb0Vxd3zEEX7IgSVpWiBBzBOcT9wNEjkN6QeK
 ujIDqpsbGVoc9oSjze+I2PL/0+VLyNeRHOf9+GvHTrkBHBARvlDXSoPGaTl104bZrhig+6EhrI
 SqQbZVqNbGprf2F1BKiP5ACCdIZOjivK4lyCc3z/Aa630hMUgEAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715504642; l=3699;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=kxKl9BXWLII/5XSxmShz9Co5it81zM/OD7dKzTsMN9M=;
 b=xRPIc85k3y6TGkCNJxSA4BeWf0WJ7DJiAXVEhvBPjZehWCkKoB4l8MM88zzi4HYJcgmofRN/o
 fJ3Zn/CLvVnA27wDoh3NXuF70UpNoRuIhMhYVcitDiqaoBICyaolCZo
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
Changes in v4:
- Combine v3 commits into a singel commit
- Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com

Changes in v3:
- Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.

Changes in v2:
- update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..cf0b3b3d8f34 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -524,9 +524,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	uint32_t pdc_address_offset;
 	bool pdc_in_aop = false;
 
-	if (IS_ERR(pdcptr))
-		goto err;
-
 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu))
@@ -540,8 +537,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	if (!pdc_in_aop) {
 		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
-		if (IS_ERR(seqptr))
-			goto err;
 	}
 
 	/* Disable SDE clock gating */
@@ -633,12 +628,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	wmb();
 
 	a6xx_rpmh_stop(gmu);
-
-err:
-	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
 }
 
 /*
@@ -1503,7 +1492,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1613,13 +1602,11 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
-		goto err_mmio;
 	}
 
 	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
 	if (IS_ERR(gmu->cxpd)) {
 		ret = PTR_ERR(gmu->cxpd);
-		goto err_mmio;
 	}
 
 	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
@@ -1635,7 +1622,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
 	}
 
 	gmu->initialized = true;
@@ -1645,9 +1631,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	iounmap(gmu->mmio);
-
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
@@ -1825,9 +1808,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

---
base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
change-id: 20240511-msm-adreno-memory-region-2bcb1c958621

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>


