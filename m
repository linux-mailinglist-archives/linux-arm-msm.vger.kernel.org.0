Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE69709B94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 17:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjESPto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 11:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjESPtn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 11:49:43 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE031B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 08:49:42 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2af24ee004dso9557651fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684511380; x=1687103380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZH+xIBGRFydG8VrF7CTkUuT849ThU7IR5DwJqTeGGlA=;
        b=RSpFoRRlhzOBQzGPQ6TGHNuGCmB8p762QhRJxbXGpZHu01SRRIk8tUN5tF4gRWm5X2
         itmZqdurbcgStQVkNFA5lsjjO6ypziKWD5hYIdCwh0C9wsV2H9NRieoxLShbg3uoZ2as
         EG2afUwPw57NXkv1x32D8B6tldVhC5Rz+xmM747AD7lG8imcbcbLMqT7S1B0KbIyXZC9
         5tKLHTjx16StbpDp+RfzLfm1kvD+5dhwL20JRiMzUrAOMp3iGWGc3tCpcLWVSExDkFLb
         9ro5rsc3aqYCZWk8A394wbfS2QeF5beqlhtnS+apJV7heo//Xf3JHH+OlaR35udiMZn5
         bgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684511380; x=1687103380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZH+xIBGRFydG8VrF7CTkUuT849ThU7IR5DwJqTeGGlA=;
        b=k036xkxMVW7tJ/08knQaNy5Bl6J4dq30ve6JwgydYcnOdaNQOidCFAf2Uq9mz0V3Jj
         mA55NPL6MhNzt/KmnwJ3URIQHMZfGwrc/FHm+rolbJ6La3v1gnyEG2wYFIRYsRG88gk7
         sdyf+hcAU37NKP3y8WEMfin8//ApJ3qhB1+R7c99PBFTVBQsj99TTeuz9FQvpdmRZ3Wg
         VKyCxOw0Pg5Q4JuFpofBitsCMFVISqKDSQ1/cCM7VImDi0S4JAs7isk0B2gIC3bQcyP7
         WYOI73v+PXQqUmZ5QwjeKH0UCTeO/lw4co/HGhfE7kMo93nTlkZq19O1NjhIkkFaaklD
         h45A==
X-Gm-Message-State: AC+VfDwDmb3cihs6HnYigBWaCl/I0ZaFN/QJ+ikOUYPDdxHz+tWHh/om
        +yll9m9Di/2qqdRzY56VQtHv3A==
X-Google-Smtp-Source: ACHHUZ64Pcb/JekoQT4SE65mTQYsCAV7YbPuMV/NrOrePtdT8wB8DJ5IhBVWP38S8jGAEiWfD9ECeA==
X-Received: by 2002:a2e:9cc6:0:b0:2ab:19a0:667b with SMTP id g6-20020a2e9cc6000000b002ab19a0667bmr1100421ljj.0.1684511380648;
        Fri, 19 May 2023 08:49:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d22-20020a2e96d6000000b002ab59a09d75sm873333ljj.120.2023.05.19.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 08:49:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/msm/dpu: move resource allocation to the _probe function
Date:   Fri, 19 May 2023 18:49:36 +0300
Message-Id: <20230519154938.3929839-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519154938.3929839-1-dmitry.baryshkov@linaro.org>
References: <20230519154938.3929839-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 64 ++++++++++++-------------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ec6fb8634196..23f0dbd2dfa1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1159,33 +1159,11 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct msm_drm_private *priv = ddev->dev_private;
 	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms;
-	int irq;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct dev_pm_opp *opp;
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
-	if (!dpu_kms)
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
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1203,21 +1181,41 @@ static int dpu_kms_init(struct drm_device *ddev)
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
2.39.2

