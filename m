Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402CC552664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 23:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiFTVbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 17:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241258AbiFTVbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 17:31:01 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5797A13D24
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 14:31:00 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id c30so13297197ljr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RHmkNxA8N58V2GQi/PzXnfoaYwDjhD9ndI1UMR5NyGs=;
        b=dd8ohYarDQSDHQ2O/Pv4EbMMg8fL2Nj64attWTLNouejam3O6K/eHIuL/B4sn8aW4R
         STknjvL2uNFvN8EXC8s4vqvqrXZ05dS2rBXhEDzv38E6TIZh+2yNnkTsIn80Z7EG248w
         NKsRyb/7UqemAO7tEHJvfAbF2vYogLL2Bz8gY1yntcuOBayw7pmmAgU6gOYIrFP8/s5I
         jUPYZasHMmYkwLbjBl2FlmrxRN2iLz4217N4V9nXWV1/XfndnTxp6XxTGPE2eYL60AC4
         mVH1tB/+PH3OLT/ftlc1d2NS/Wzet5WOScDt7eQOvOuBhCZM5RXLPcxTewOjnnbdQ/vL
         2RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RHmkNxA8N58V2GQi/PzXnfoaYwDjhD9ndI1UMR5NyGs=;
        b=1w6YHWUFcug6mjG1xYUcyzzVMReJrD0WKlX7A5Xh/Q/EFp4+dHE0UlGr8abLHTZ/Gp
         mp1Wduy4Y4rb0+ncu/uuNRGL0uob88XFI8vQUq+XcWRfj8yLQxoPr4JlZnYbEYPYi4aH
         tFyUQQ5OlJ9gUY3LHntWpuvwIXgtRZ0SYMr/xP0aMs564lobnMULY/8oO3iN6/qR/sJ1
         LwvVcYQyh8RvfPNXwUnw3cj5/PKABrYkZitdyBeKhqoomyTLtyVNSxMXf70/wY7/7y+r
         lXBMSecID7k3DS8lyslYJ1eO6OMfqxA2Mhb0OZyeLXJz2ppoCiwWNAVkVU4GiS9fytvh
         lQxw==
X-Gm-Message-State: AJIora/y4Am6ByREyXS6Kmk68L4OD+F+w4V2rk/eSYSpQ5bG55LVxROt
        wTUAgBtpp3TrAEfn55K2jYd54g==
X-Google-Smtp-Source: AGRyM1sDW7gYoASLhORCVOKQB6DYQOjc1q+s1lQgC9qmGwhuvv6GTFvf2yplhlV9L1+DfA1t5pPTrg==
X-Received: by 2002:a2e:8805:0:b0:255:6e73:9a67 with SMTP id x5-20020a2e8805000000b002556e739a67mr12477444ljh.426.1655760658717;
        Mon, 20 Jun 2022 14:30:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l17-20020a2ea311000000b0025a681a7616sm838866lje.105.2022.06.20.14.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 14:30:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 2/4] drm/msm/dpu: move resource allocation to the _probe function
Date:   Tue, 21 Jun 2022 00:30:52 +0300
Message-Id: <20220620213054.1872954-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 62 +++++++++++++------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae13a3a5d8a5..756be04d804b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1206,31 +1206,13 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_kms *dpu_kms;
-	int irq;
 	struct dev_pm_opp *opp;
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
+	dpu_kms = to_dpu_kms(priv->kms);
 	if (!dpu_kms)
-		return -ENOMEM;
-
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
-
-	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
-	if (ret < 0) {
-		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
-	}
-	dpu_kms->num_clocks = ret;
+		return -EINVAL;
 
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
@@ -1249,21 +1231,41 @@ static int dpu_kms_init(struct drm_device *ddev)
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
-	priv->kms = &dpu_kms->base;
-
-	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (!irq) {
-		DPU_ERROR("failed to get irq\n");
-		return -EINVAL;
-	}
-	dpu_kms->base.irq = irq;
-
 	return 0;
 }
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct dpu_kms *dpu_kms;
+	int irq;
+	int ret = 0;
+
+	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
+	if (!dpu_kms)
+		return -ENOMEM;
+
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to parse clocks\n");
+
+	dpu_kms->num_clocks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	dpu_kms->base.irq = irq;
+
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
 }
 
 static int dpu_dev_remove(struct platform_device *pdev)
-- 
2.35.1

