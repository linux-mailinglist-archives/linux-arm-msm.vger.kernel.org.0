Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52FC826934
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 19:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbfEVRhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 13:37:17 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44864 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbfEVRhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 13:37:17 -0400
Received: by mail-qk1-f194.google.com with SMTP id w25so1995106qkj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2019 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gk8hCemPy32k7hUtY7KZ+8tj1MeHqRPPVcMcbE5vdqY=;
        b=PoikOXUPL4Vn/ay3Aqg4ARP3Khyv1uCrxHmKF3RRaGGj9yQ8/XxJJNGO0/B9E0ceSm
         20FqcBiRkDFxfeAYdLNX4ogwjQL7pzp6sP5yI7IQJms5faqfH3Y69MogbMEUheNciuYZ
         zbhsIM8oqLERNLol3ODglJ5p/jVydBOeMaKZOO2u5xgjIGe3xTr8jFiEhiJJk8KAo773
         TgRoYvRtNbRRO1fAh9mXoLbAMASd7sMS8e+5MgzVviEoMVpuVCifFUtf7Uf0eEfnHrk9
         weTXG1uVr+To8+xmm4Bd+YafzFKyMKolTWe/PnklRRQp1FKHtQQ7P1clfW7Mmo/Uk0qE
         Y1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gk8hCemPy32k7hUtY7KZ+8tj1MeHqRPPVcMcbE5vdqY=;
        b=QH4tV4w+d3paLWJ42k98G8MbIqFwguVM+3qJe1Ar8ABBJjADTuBVFwHycuKCDyDIYW
         90S1JJeIE8EvWyD7RDlg70ZqgOXkhqLn3qsLi0ojroCsNaIZbQctdXZNLs0NRZZNTLEL
         GWgJeuGOBSr3ntwPix+9dY6GXLSb4rhAalJaFHvYf2+qozfHoBuVF45xEtbtdBIrNL99
         V3Pi78WyMD3+BpHWGaA0247ahObQQJj2oE43tf71NA/heoi6Cy+DdSzSJ1nHJ9exqAXx
         sfGED2SZKzfPd7v3VkouMIpVDRZpcDWoCWS3/xMYK6i83Ig2bt8Eq7qvSRA8/qwuFTA1
         mIvQ==
X-Gm-Message-State: APjAAAWTm1jh4OaSKyTgOizBrYMkMbeSvIxaL6cLw1/DNJzoEOhGKYm/
        8sf/cRwtStCdXtgkW1KEy4j1tXHxEsM=
X-Google-Smtp-Source: APXvYqyk3xYM0+FisGd+ENFvSX310SVFXTFYPEO8kL4f1+5+ec7XKzynwdsLr2Ork05bpL8KYQuAQw==
X-Received: by 2002:a05:620a:1479:: with SMTP id j25mr69337992qkl.218.1558546636332;
        Wed, 22 May 2019 10:37:16 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.37.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 10:37:15 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/5] drm/msm/a6xx: Remove devm calls from gmu driver
Date:   Wed, 22 May 2019 13:36:43 -0400
Message-Id: <20190522173656.162006-4-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190522173656.162006-1-sean@poorly.run>
References: <20190522173656.162006-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

The gmu driver is initalized and cleaned up with calls from the gpu driver. As
such, the platform device stays valid after a6xx_gmu_remove is called and the
device managed resources are not freed. In the case of gpu probe failures or
unbind, these resources will remain managed.

If the gpu bind is run again (eg: if there's a probe defer somewhere in msm),
these resources will be initialized again for the same device, creating multiple
references. In the case of irqs, this causes failures since the irqs are
not shared (nor should they be).

This patch removes all devm_* calls and manually cleans things up in
gmu_remove.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 7465423e9b71..701b813fa38a 100644
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
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

