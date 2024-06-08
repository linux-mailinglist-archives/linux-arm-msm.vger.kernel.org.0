Return-Path: <linux-arm-msm+bounces-22119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B9A901262
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70F86282DA5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF582179663;
	Sat,  8 Jun 2024 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM33Xo/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE66178CCA;
	Sat,  8 Jun 2024 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717861448; cv=none; b=ar4f7r11gXhy9wxF+X+A7p7WjGjNMsPIZnbQxJxt58Pgwmc6XMxLIOJG4TVQRNZaAje3MDYinwK44UDRV0IQlyC1wQnGoPmxgfOlGQNmIfo0bFhSwZ/QhZwcYIgq72LQpoNHk9usMcUFXnwJyjgoUdgLpVip4gYlo9BrId1GchI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717861448; c=relaxed/simple;
	bh=ZeyfiWS3TmZfYCvSfkZPOMU9SiAtDTSwnH4gcqzhhyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XVb7M/mBBWT+AXaoildIALlgCAOZqv4A3L92j+jbJcUA7XtgZaCuRap3gx2IBzfrVexwtAoMnOC6h0UmA0kI1fEdyGIniIsTAfFczFvCiLuIWCqnjjF7QPQz4ovnEDfRPYFpUV41EnI77K57f7NasLKj9zI2wEpss3PQUSaO5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM33Xo/E; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a68c5524086so363509566b.3;
        Sat, 08 Jun 2024 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717861445; x=1718466245; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/lgmuWrx9hSXLKTj2YGAYEjdeY30UBDyVV4m1UoVgYw=;
        b=gM33Xo/EHkiRlfKAmMEa5Gk3USroK7n/WnlRMZu293NO2PDPdKC1A39w6qzcSMNf9S
         3pnGvqpnvGPzhflIHoj8aseMkuM6qmV4ikH83q8XqHdxDYS+tl3DB8nFS8WmfCR7zFyo
         R3U0NDgWpJOpq9gMpCPvXbRxhDEoQ6Tc7/w/O25AIllXjVUJ7bvATTEwQuXoVf2hTePn
         tE6V2kpquox1UJa/HMkcpVnWVcUkOZPacJKn71g5Y8DT6Kv+T2cpKiP6wMDNWgGh/pmn
         E4rhaeaHD+yX1DeiMnjFOYdTmZjz91NYqc4PnOlV099HACzfMdA+7DmAhyPUpn+DQzbi
         kkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717861445; x=1718466245;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lgmuWrx9hSXLKTj2YGAYEjdeY30UBDyVV4m1UoVgYw=;
        b=LYXmNb33IkEO6eO4wqgs67uJxR/FbMPV+gUpWgfP/U8vof+JkgJKIgHGq6UpjegtNc
         18Phoe3zA53GufM1Vv8Wh8IvXbfLXijjD0O37jsfuXj0Ow3rK241xHzsCOMpFl9twMYl
         LVUj0XjfkcoRFUOcn4CKv1AY7gN+iqouTm/c7CMFvNeF5I5daPb2GI4ySH+1OxT7D79i
         1QjxYtQZ4fWd9CJsAhLYb5I0+CTRFzRCMYJ8Pg/bVUblN+gACx2lTr/izWoW6sazXp5a
         xRQn8UYscgx38z76VpX2o0p4T+8nT2ZvTaTsagO5yO5HdmKDrO5vuK7aIRdzlmVziJe8
         NE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPGfUr7mci5cbgbyC7tx+H7cUk/b9CwJ61/C8XquPxemE+bVT4Y71odmV2TSGlKY9H13LrBsOXtxIKP020w6qDO8hGLxo86sJ6UCR8
X-Gm-Message-State: AOJu0Yy8epuMcK5SGr/kNDcZh+rsV4mGKV+KzNpZBR3eXzPKuVO5RZvb
	YrGxUyoJFm2xWNKedo59yAm/0opC0uooGzrZHcWsEfqO4P7neacQ
X-Google-Smtp-Source: AGHT+IHMCOKVDaMxAkbzC6uWi4Blur4xIa88zkrjFNFYBm4c16qtHKe9UrQQMgVS5C4e1QdF5v6P4A==
X-Received: by 2002:a17:906:e949:b0:a62:2eca:4f12 with SMTP id a640c23a62f3a-a6cdb203fc6mr342604366b.59.1717861444935;
        Sat, 08 Jun 2024 08:44:04 -0700 (PDT)
Received: from kali.localhost (static.47.50.88.23.clients.your-server.de. [23.88.50.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0e208a89sm60760766b.170.2024.06.08.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jun 2024 08:44:04 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sat, 08 Jun 2024 11:43:47 -0400
Subject: [PATCH] drm/msm/a6xx: request memory region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
X-B4-Tracking: v=1; b=H4sIADJ8ZGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwML3cSUotS8fF1Li2QTQ6OktJRkA2MloOKCotS0zAqwQdGxtbUABkD
 4ylgAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717861442; l=4822;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=ZeyfiWS3TmZfYCvSfkZPOMU9SiAtDTSwnH4gcqzhhyE=;
 b=IUrePYwWVoIhvB3mheCGxJbxIT3gFzesifIx9M722KYvsk3LM2jnG/mCH91KDImRFGIaG8N2w
 +zil1fMm0sYA0E+niz8inJMQ0El1vtb1QUBBhemUMiA7DsZgByLrrXv
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
Changes in v6:
    -Fix compile error
    -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1-8664f52fc2a1@gmail.com

Changes in v5:
    - Fix error hanlding problems.
    - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com
    
Changes in v4:
    - Combine v3 commits into a singel commit
    - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
    
Changes in v3:
    - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
    
Changes in v2:
    - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..d26cc6254ef9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	bool pdc_in_aop = false;
 
 	if (IS_ERR(pdcptr))
-		goto err;
+		return;
 
 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660_family(adreno_gpu) ||
@@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	if (!pdc_in_aop) {
 		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
 		if (IS_ERR(seqptr))
-			goto err;
+			return;
 	}
 
 	/* Disable SDE clock gating */
@@ -633,12 +633,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
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
@@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1613,13 +1607,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
 	if (IS_ERR(gmu->cxpd)) {
 		ret = PTR_ERR(gmu->cxpd);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
@@ -1635,7 +1629,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	gmu->initialized = true;
@@ -1645,9 +1639,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	iounmap(gmu->mmio);
-
+err_cleanup:
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
@@ -1762,7 +1754,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
 		if (IS_ERR(gmu->rscc)) {
 			ret = -ENODEV;
-			goto err_mmio;
+			goto err_cleanup;
 		}
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
@@ -1774,13 +1766,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
 		ret = -ENODEV;
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
 	if (IS_ERR(gmu->cxpd)) {
 		ret = PTR_ERR(gmu->cxpd);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
@@ -1824,10 +1816,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	iounmap(gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
+err_cleanup:
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

---
base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
change-id: 20240608-adreno-98c412bfdc03

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>


