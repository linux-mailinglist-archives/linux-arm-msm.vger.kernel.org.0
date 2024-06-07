Return-Path: <linux-arm-msm+bounces-22081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D81019005D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 16:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4858C1F220C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 14:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB49B1974FD;
	Fri,  7 Jun 2024 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K921WjHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09156196C6D;
	Fri,  7 Jun 2024 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717768833; cv=none; b=EXzPo4pS1jnXZrL7Rae+LArpzHH6IkL4Nml9cmb/uUTnkgt9II3JFczrCcwLLsX78Wy5ApVWOtIvXBqAIXetR4aKm/x030U+iA0P7FYLjHs3AWaa5wTkCoHnTq8L4W2+3UiUO4CsQholymFRccB3p82dmDWVeJ+iTmuypa4ZdGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717768833; c=relaxed/simple;
	bh=19tlOcfJuT/2kVzSY/jYIvVZ6Y8DgteEDTklyfN/YSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BG2hTWdlPzp9CC5XIyMdWOtxdVTzEZ4M1zv4M8GBdB5f70RVQnAdjTZPk/UOSiYr95I4DL+bVjJvS5OGkWTf/X4O14OI5KB+SkaiCXZ4VeRABlLkyR4bmZ0u57XCJj5WM0j3Wwv5SAo7jbUDr+HHbWBHkR7XxO7QS/jNBz4BIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K921WjHJ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eabd22d441so33661741fa.2;
        Fri, 07 Jun 2024 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717768829; x=1718373629; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smHlXdeijHe0Qv4gdPnMjOi/H4/3+n74NUKh1ac6v1Y=;
        b=K921WjHJ4rDEKHHrTK9NQrh8UwCELZeLSpXeN8p420h7OVro3zpFzTZNSUITvaOvbQ
         +3v6vGg/p988EY98GxV8kEX5dHyBMPrLuZqabyKudb03fy2b1GZk+Svwl6kXgupi7hWu
         +omNkHplOccoi6lZc6RoVJgkeQBTlQXjmC3+rNG3YRO0RcQGK2ubH4xGsCerOAPQjA7w
         Sy6OdOy9u4PPkw7g9L6z54VsCTYeMpygsoO1UKOtnOyDM1hrybhTcwWJY2mGd6fXWS2K
         LtqICjfsv1GajEyojn29G3i25DK0EHoENkrhTT7HBJDxJw7P+4BDmJNrCm+TIEC+BBRQ
         lQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717768829; x=1718373629;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smHlXdeijHe0Qv4gdPnMjOi/H4/3+n74NUKh1ac6v1Y=;
        b=nJbwlMjRathn9AqUSBeDtsEwyqLRrKKYwem9LFKP5ewx4RTG1HJu5AP8E5kbz6XYud
         4OxVpDrqg2hCIteWPwmaPJjsI+ZFmifWIM3IQboi8a5pxDAo8hZb/1bjHXP7nuNRroms
         1tRUCYqRnAW/x2fGQ+0+1N3OhzgbbgVNVjXE8SwLoFl9UOUhNvGXiMs3SRSpAync1fNO
         sgD3Xi4kAwzMF1ksnhT45ckQ31eqgYRDcdExeNHoGgWulU4Poo1opTm43v8WSmWVXaMn
         acYAEVvAD76jVz330VY+vsdXHiUPNe00L3uts15Qv5BdJItKfd9Pmc3dwO2lOuR5TV6d
         iRDg==
X-Forwarded-Encrypted: i=1; AJvYcCWz9nFnavPo8I8BCj4WJ6v0qsB4mdk//Yg955vgnqscwdaxl+i1Q1iTaFvCKucR3oBbUdOiTFcbmA1JOcyK0Y4da+tBzob0/gJoXZVu
X-Gm-Message-State: AOJu0Yy0xDFqRuIOWIruT3UDuvnyejOCAkO6BPd3JaEinwT0SXPg2D2R
	aCKWv90cjNCg6Uf7MNz+fw7Q1MbFxQTsHXwrs5H1rJkCTke8csMt
X-Google-Smtp-Source: AGHT+IHR81iKUplsByiF1E+L/92JPbJTbqeGnU4taIDP/6XaWJzNK7gYiRIkjw6lHphiKZY7veQvQA==
X-Received: by 2002:a05:651c:a0f:b0:2ea:79b2:1839 with SMTP id 38308e7fff4ca-2eadce281d4mr29893421fa.2.1717768828808;
        Fri, 07 Jun 2024 07:00:28 -0700 (PDT)
Received: from kali.localhost (static.47.50.88.23.clients.your-server.de. [23.88.50.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806ec844sm252472566b.120.2024.06.07.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 07:00:28 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Fri, 07 Jun 2024 10:00:04 -0400
Subject: [PATCH] drm/msm/a6xx: request memory region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-memory-v1-1-8664f52fc2a1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGMSY2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNz3dzU3PyiSl0T01RD46Qkg+QUQzMloOKCotS0zAqwQdGxtbUAG2Q
 NnlgAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717768825; l=4856;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=19tlOcfJuT/2kVzSY/jYIvVZ6Y8DgteEDTklyfN/YSM=;
 b=LovuAN+Yw05fo0LE4TjWvASYbGMde0nyU+ekFhEVleLCWxzSTpZLgPrOfhHwJkda4m0uefexE
 MQuMdmXQJmgAXSDd4LqRKtWw7WuMsDBrkwMhDt5JBPig0U5aBohe2hn
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>

Changes in v5:
    - Fix errorhanlding problems.
    - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com
    
    Changes in v4:
    - Combine v3 commits into a singel commit
    - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
    
    Changes in v3:
    - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
    
    Changes in v2:
    - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..35323bf2d844 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -635,10 +635,12 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	a6xx_rpmh_stop(gmu);
 
 err:
-	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
+	if (!IS_ERR_OR_NULL(pdcptr)){
+        return ERR_PTR(-EINVAL);
+	}
+	if (!IS_ERR_OR_NULL(seqptr)){
+        return ERR_PTR(-EINVAL);
+	}
 }
 
 /*
@@ -1503,7 +1505,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1613,13 +1615,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
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
@@ -1635,7 +1637,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
+		goto err_cleanup;
 	}
 
 	gmu->initialized = true;
@@ -1645,9 +1647,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	iounmap(gmu->mmio);
-
+err_cleanup:
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
@@ -1762,7 +1762,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
 		if (IS_ERR(gmu->rscc)) {
 			ret = -ENODEV;
-			goto err_mmio;
+			goto err_cleanup;
 		}
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
@@ -1774,13 +1774,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
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
@@ -1824,10 +1824,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
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
change-id: 20240607-memory-45e13bb0cd16

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>


