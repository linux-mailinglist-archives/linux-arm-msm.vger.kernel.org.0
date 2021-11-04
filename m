Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60274444CA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 01:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhKDAhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 20:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhKDAhI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 20:37:08 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B41C061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 17:34:30 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y8so6712964ljm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 17:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkfgnJaDUY04rNIV6or1h0npcgBkYvs6ev3vQOc1YF8=;
        b=ABG+aRHIXjpa0AddFi3FTUVOa4EtckWj5BNxOpbOmxbGBF6s7cZGz8cZhvbyxn0Fon
         IzCmeKBxyH0DAYWJvvpYSyDI5BSu7qlrHyL94cWjM7pZXuingC2Fi9+Fz1oKVWdvb6F9
         oD7zDZKBhlnh20m7K+7Y0eyermQoKAAf+z0G/52HQHC31sluTWwjihJE4ZJDH2wRgBRW
         igi0VnD4l7yPp8YJKBxCamtb7iNjjN8ICx4FPFZLLZV/Rff24KbODnvc5EvebrHhzszX
         /Wc0ZgnqWBAti81eGosrJPpX5UaYZoLC/3KC/8S9GfEOSPx3Gh0A6X9tdpbNMZiHo5nz
         lpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkfgnJaDUY04rNIV6or1h0npcgBkYvs6ev3vQOc1YF8=;
        b=fWBC1cXzE2mindFxEf6o8NkPaQCFywG3GUHmnw++MGa/19DOqPkCGLAkD9pM2zbmab
         gjJboaY4vm9LERkYzPmqr1bZkheFmQ0axlu4aGVAo6gM0zQfHy/464m8AVwxEg5PvMtL
         u5usWwnOB0sVuFEpXqh7Eng6L5LPbThQg6IaSnZq2TVZ6XPrS4bWnSBi7MBXFTnyfm+Z
         skj/R/UC/OdMBaghGZUnH+zeneDmjzRdqMWbBgkVwunsqACZt+F/Y9LoQx7Qxbb65Nty
         apwSz/Zkxel6Whx0dy0dMJApe6BpVt+jkwwlWvLuYhd4HMlG0tkAnsoCyEBdyeOIt4To
         Ngwg==
X-Gm-Message-State: AOAM532bqnZ+ryzgxE7xrJkyem/gbLnmhklvlnler+nVw+wEsW4uhpQ0
        i4hxIJDV/2sEzgw/WW8j6swoHQ==
X-Google-Smtp-Source: ABdhPJzCkR0IM+3ESKrRBralZgsMmASvHaJQoJHxxl87GrbiEH4Snc0/oybL5kI9s7tu9GjaAWf8/g==
X-Received: by 2002:a2e:8447:: with SMTP id u7mr49489401ljh.179.1635986069265;
        Wed, 03 Nov 2021 17:34:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f4sm312128lfr.43.2021.11.03.17.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 17:34:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdp5: drop vdd regulator
Date:   Thu,  4 Nov 2021 03:34:28 +0300
Message-Id: <20211104003428.2205497-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "vdd" regulator was used by the mdp5 driver only on downstream
kernels, where the GDSC is represented as a regulator. On all current
kernels the MDSS_GDSC is implemented as the power domain, removing the
need for this regulator. Remove it from the mdp5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 24 ++---------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
index 2f4895bcb0b0..2ac8fd37c76b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
@@ -16,8 +16,6 @@ struct mdp5_mdss {
 
 	void __iomem *mmio, *vbif;
 
-	struct regulator *vdd;
-
 	struct clk *ahb_clk;
 	struct clk *axi_clk;
 	struct clk *vsync_clk;
@@ -189,8 +187,6 @@ static void mdp5_mdss_destroy(struct drm_device *dev)
 	irq_domain_remove(mdp5_mdss->irqcontroller.domain);
 	mdp5_mdss->irqcontroller.domain = NULL;
 
-	regulator_disable(mdp5_mdss->vdd);
-
 	pm_runtime_disable(dev->dev);
 }
 
@@ -238,31 +234,17 @@ int mdp5_mdss_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	/* Regulator to enable GDSCs in downstream kernels */
-	mdp5_mdss->vdd = devm_regulator_get(dev->dev, "vdd");
-	if (IS_ERR(mdp5_mdss->vdd)) {
-		ret = PTR_ERR(mdp5_mdss->vdd);
-		goto fail;
-	}
-
-	ret = regulator_enable(mdp5_mdss->vdd);
-	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n",
-			ret);
-		goto fail;
-	}
-
 	ret = devm_request_irq(dev->dev, platform_get_irq(pdev, 0),
 			       mdss_irq, 0, "mdss_isr", mdp5_mdss);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init irq: %d\n", ret);
-		goto fail_irq;
+		goto fail;
 	}
 
 	ret = mdss_irq_domain_init(mdp5_mdss);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init sub-block irqs: %d\n", ret);
-		goto fail_irq;
+		goto fail;
 	}
 
 	mdp5_mdss->base.funcs = &mdss_funcs;
@@ -271,8 +253,6 @@ int mdp5_mdss_init(struct drm_device *dev)
 	pm_runtime_enable(dev->dev);
 
 	return 0;
-fail_irq:
-	regulator_disable(mdp5_mdss->vdd);
 fail:
 	return ret;
 }
-- 
2.33.0

