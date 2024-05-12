Return-Path: <linux-arm-msm+bounces-19756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C38C352A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 07:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6779C1F21624
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 05:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7870E11CA9;
	Sun, 12 May 2024 05:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0to8uc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A03F510;
	Sun, 12 May 2024 05:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715493038; cv=none; b=dH7MXIt42/BCbPP1uZQXpzZoBrMpt3/W6aYclHKyHP5oOdQ9pdnHI3+tiefzF6jLh+R+5jamIeQtxTF+YSqbjTTU3n2v+NdZ2Te16tIrZDww2+8Bt5nzncTGyxBcP7GcjrpSx2MBr6CNQGCV1lD0nNRrOl6Vx3NFjfybjX12naQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715493038; c=relaxed/simple;
	bh=pqxwzpqjeLaRI5EDxNPTtTBb3Tu0jXn7ELZFMBQ3ty8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NklTK3kg2D/ZNuqYHzJXUvD5dHKfMcCv1UjZmf5O5rIGoCaPSXF7zzV4EuvSozI+0kZkUa3KGLPDN2sLloGpHj/aE68V9mfsYasLZHEbzaLp58PmPiqjG0PC3xewMwdQAiVsgdPkAYEO7jF9yDl820UGqEQgdzyWCqzH6gf4WmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0to8uc5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-351b683f2d8so327371f8f.3;
        Sat, 11 May 2024 22:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715493035; x=1716097835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P87QNQI1cdzXKDd3JYfTiYCdS5DbA/31YPlGfdPOLE=;
        b=c0to8uc5vYaHrqg0gU5GoPNVlfTgYSB0YI891hVM/ZxSq3BqiysQ9fXbnxwnzoEB5M
         pryUyESezekPPWXfGPsINpcysQz51nh3rD2BilA25P9AzlAxjr9zWGxyUIoI5R6JlPyJ
         9PdIB0V+yJyemMSqBbsUZUjKJ67QSd3cstOv+MiA7K7YTj+0HUMq/v7xY29Q4RYruRo+
         GljYfesg4ezYOQolUbejgwyCJiE9gUBVvP6gLk/pXnz0QhFpswUO1122IIZbGkByqvzY
         g1aW9rU+ESht/zz1o0mDBTn0ATdydBR9+kaHmc/ZFcaKkHsrAbrn/kJqS2SLAaz0bIbc
         WW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715493035; x=1716097835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P87QNQI1cdzXKDd3JYfTiYCdS5DbA/31YPlGfdPOLE=;
        b=MzcEqCnMduns3yVP088WAX+shzUUNy2NRwrpDnqGsFz49v5oo2vziMA2Q+tXLTi2uj
         efzl9QrOVLXakm2yEJCRq6evkvL2zP2El6bguPMlUlE85WG/FTIZTXcq7IGFCHdgkFCn
         mM4PVbaApZlxGkY6jWsJfUcgREhWm1OU6pVyG6rLGDgePX/mRZMii9jPKF/pcaEuNrYz
         BtQmKz3reo6ys5ta8HMAQ6MwuB5Ik5Sg+ixTkACV0lMEGHx8Qfuz+zSOrvqtbaRpT7qh
         lKLPdTPMfMu7e66qTvT/MJqYt01w7Jn2C8OFLtm2TvYEWjP/qLI2msqlCEjs1h+Fc/CE
         5yFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKdgGb3VqFoMWA9QD7iSqzVuepCHc0dUOw85SlQbN/TrX8/mxp8GMnRi6o/RGp0RvhRlSK/UBTSzzvrpqsFMwMhYBMcJNZWOyvdT++
X-Gm-Message-State: AOJu0Yz1NOKUCF8mpaJlo7kAz8/rN52fp/n3IzmGzfLNqsi31oEBh53j
	zMYsB6N3EN71u+7gvcfacFzVMUa9fPNLCHvOZT0ZGj0GXofg3hRZ
X-Google-Smtp-Source: AGHT+IF04Ds5tvXV4Cg/hI3Oyl/H3/3cE837ElBsfTF9KwyluX0RHqTIK53+1bMLv6gpxAE6fO6PAw==
X-Received: by 2002:a5d:52d1:0:b0:34e:4105:b3f6 with SMTP id ffacd0b85a97d-3504a73ee8dmr4703871f8f.39.1715493035057;
        Sat, 11 May 2024 22:50:35 -0700 (PDT)
Received: from kali.localhost ([5.208.126.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbde1sm8233658f8f.97.2024.05.11.22.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 22:50:34 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sun, 12 May 2024 01:49:38 -0400
Subject: [PATCH v3 1/2] drm/msm/a6xx: request memory region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-msm-adreno-memory-region-v3-1-0a728ad45010@gmail.com>
References: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
In-Reply-To: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715493029; l=2001;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=pqxwzpqjeLaRI5EDxNPTtTBb3Tu0jXn7ELZFMBQ3ty8=;
 b=H1PJF04vum4qJtdfIWyr9687LM2NkNqG5XOS95rodZCI9HFRySOf6DcwRQtOabGfvstM9AaKi
 r9xxWalD41rCsDelS/PxoRH6imO3T1D+OApZolw/o4IT8w570QCekh/
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
 

-- 
2.43.0


