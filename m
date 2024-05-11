Return-Path: <linux-arm-msm+bounces-19732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B558C338A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88D51F2138A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 19:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298EF1CFB5;
	Sat, 11 May 2024 19:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTJpUNBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751E21CD37;
	Sat, 11 May 2024 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715456162; cv=none; b=sL3Frr9z1qGMZuaDV40jTSBhzgi+jSewrAaubfTRO3NBH+iNRNjN57DI7m/j/+RFkqzf3plyZTH+RNlfWRX0IhuFqaMdOvXIa4qWgMcA9d7WxyKqFKlXMu6sFDM9x1nBIt0rizMN/XjSwMlH9u0SAYbKUS4lpHoHn1dJ+OHAw14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715456162; c=relaxed/simple;
	bh=OiMNVneXw39Z/+zBoGpu2bdamhnv48eIjRCJNeLqROs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xi0m/7uhdpIZZHO9Vd13ZmwGkDImOiKZ5Cuuipj5rGAb6F6Q68qBNoTKHadsK7/3dI6CiaGTfAkoNFai/NMHNSaFH4UtXdpTPKigQXsZF9DMB/3a2E7Tzn2kcvmPqFoITggo6zMlOdKukSm8I+O8G687Y6eIQ8szWiO3WyaGq6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTJpUNBK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41fd5dc04e2so17000235e9.3;
        Sat, 11 May 2024 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715456159; x=1716060959; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rk1GGf5u2kjIs5FRwMwrvHf3FLz3D5a84ZblldMBK6I=;
        b=OTJpUNBKD9U4dVi3/Vssorx+4z8wGiZsl9SLvzaiPPh6wzVtkPr00QnheM6AbZSIQG
         WVjDkqsMckdoUP97n4+8Osv4pLKp4xXhekI4FnSiRFNKWxylB9tPcIQWwOKTDLydgk10
         hdkF70zTI12fPftET76mVHRdkIUivqOFlr/AqTPs6eThPv94OSenR5bUi1GiO9z5epFn
         weEq4Vnwl3LrUwFL7lUhWb8Pc5vpLIEJGGttRzMRIuCnRZAiT8+yp4DVZ3Et7nF0S6jK
         LjZ3zvd7v9MfD3AwlJJQg0R8qQNlL7TSYJDtB1C6qQlnERxTgzi0b0DuOcPVmD1cik9E
         R+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715456159; x=1716060959;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rk1GGf5u2kjIs5FRwMwrvHf3FLz3D5a84ZblldMBK6I=;
        b=mW3eH4bnONdfE6wpq1CmOviDlh51xc0sKYmKjcrOPJdRgKtDFHILZg+hxASIr0RKuc
         qPeU68luepFw/zmTq46GlJ45dzTc1FxeSPASpS7HLxTvqFZXmojwB42O6sMym2wU0Ubs
         x5WEevZdmXI2uBaqYIZH1oAC++gTAgEVD9pfoXvMb4/Xjsztt63SPbF6RNfIWD6jcNTV
         zD8qGyz1ug7B8iUDiFfmztj5lJ1PJ4jFtQ+zDc7CIl6VaViVDqiTyKiXwsBCuRCguNUE
         Y2bwjrOpR5mUZ4IWCGi86a6iV11K6MDAUQRen+bRHFfEAzAYIwQFGaN5xOOjY4SMOl5A
         FvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcsE4Is3UNvK3DyKrh+tCOEMaobfxjRd20BPLyrRbayK91sQ+NEwnVZH1rylzWFEWgIZq0Hstx9RhibhaO8I4qgsWJjKl2RMOKZea9
X-Gm-Message-State: AOJu0Yy1ePiO6lOvhc/myr7Z9s/eEJyNDvWN+RRabaVrzX9XWQ9HLG7A
	x9Dp9w/iRhHUWHYI20Ma2KPXUkSL4m7qQm6iK8WiVE0YX4SN7DGs
X-Google-Smtp-Source: AGHT+IHNZr5UOEOlj4LbyMiTffRVh/9Js+pHnWyuPyA8+dZpJwtYVgCLefI1MHZuCCqZvCMlnJBUJQ==
X-Received: by 2002:a05:600c:4686:b0:419:d5cd:5ba with SMTP id 5b1f17b1804b1-41feaa2f45cmr37412975e9.7.1715456158673;
        Sat, 11 May 2024 12:35:58 -0700 (PDT)
Received: from kali.localhost ([5.208.232.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41facbd295fsm125245835e9.36.2024.05.11.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 12:35:58 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sat, 11 May 2024 15:35:41 -0400
Subject: [PATCH] drm/msm/adreno: request memory region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-msm-adreno-memory-region-v1-1-d73970717d42@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIzIP2YC/x3MMQqAMAxA0atIZgOmqKhXEYdao2ZoKymIIt7d4
 viH9x9IrMIJhuIB5VOSxJCDygLcbsPGKEtuMJWpq4YIffJoF+UQ0bOPeqPylhGa2c3k+qZrDUH
 mh/Iq178ep/f9AM1XAQFqAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715456155; l=2175;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=OiMNVneXw39Z/+zBoGpu2bdamhnv48eIjRCJNeLqROs=;
 b=5UKYF4UqI69vJ0gbgJ/UKLd1lWu7EAUd4vrov1D/sQ4sogduWXDoZtBc4Xe9+JFyIxEhXz98m
 UO9OpHAI4ZWAUuRZuUFQjs2dSfE+hSH/g2IdcyRFdHq2yswd9yXJjd6
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..aa83cb461a75 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -636,9 +636,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
+		devm_iounmap(&pdev->dev,pdcptr);
 	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
+		devm_iounmap(&pdev->dev,seqptr);
 }
 
 /*
@@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1646,7 +1646,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
+	devm_iounmap(gmu->dev ,gmu->mmio);
 
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
@@ -1825,9 +1825,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
+	devm_iounmap(gmu->dev ,gmu->mmio);
 	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
+		devm_iounmap(gmu->dev ,gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

---
base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
change-id: 20240511-msm-adreno-memory-region-2bcb1c958621

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>


