Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9889552663
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 23:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiFTVbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 17:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiFTVbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 17:31:00 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B9013CFE
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 14:30:59 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id c30so13297175ljr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 14:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KxQru/kIx5leErNgRIi5Mc3A8Y9b5o3Piq6JrqiJA0s=;
        b=EZ1nXPPuV1GZaYGgUuLvJGT/4G2RR1s53lFwbP6WGgFj+hZn23H+Uqa0lplHwdM/Ul
         5+K0JUagQRhJiDh25t/kilqcULv4OP5bjxo7K2JJltlq98ybspbIlVhEuVRkcYxq+JdJ
         jKiiAOmyXmtjrSdMskkzX35GELK5GUtOZcRIt/sz7kMel+9GLj8WaxSoITVmCLjmIHqL
         Qc31/r7O+XHTIafPSOkf9Z3IlaJkPx6dLvUguqQKZU5W3WjuQyfg0MKk0tkt/2uqeSfC
         6C12v3X2TZfH+0D3c/vJcMwIK6W4QjKonHbyWszaHl8CX0C/Xh/aJbmkF07ieQJ8VAkD
         jkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KxQru/kIx5leErNgRIi5Mc3A8Y9b5o3Piq6JrqiJA0s=;
        b=YhVpqbnp4BftzPOyV5/gy0dNP4ez6onZ9oDeVTqxoGymyx0XaYHko6aBJJVW+MX0wr
         +IeGgJ2aPgKE+QiQVS5J6kz5c9vjnBfCLrQWhnAyq+thXp5Y1cbU0uxmQ/SiJ8xZXysZ
         /9IPUUu41f/Siw5WZZ/y/UK7ySL7PjrSe+yr02N8FUhegZiIRlpk9nesskYx8LUAZJhJ
         sL32cIGCViMSMUXXJCyncETh3o90iM6+wMyO7SwELG8+ur1Em/VX1YwSW/4RlzWL8ywj
         IWSKCRiYJMaVq7XReas0iVNk4t5YS52zZJVo+E5T6928i3kryepAww5mzT3bbdBNxrlp
         7H8w==
X-Gm-Message-State: AJIora9KeaFLQ7ieFrIsKy1e1bJ4duQ73M3rdwoALOi6BrJxX5tS2FPG
        xW3IavGAR2IQ5WkHvsvFpyYI9Q==
X-Google-Smtp-Source: AGRyM1u2hYv1JTVs7YNby3JsLTH+xSy6HatdVbQUk7oZotvOFzILbN2z/V/7OUDT7GK0uSjXxEgKHg==
X-Received: by 2002:a2e:87c9:0:b0:255:7e94:d93b with SMTP id v9-20020a2e87c9000000b002557e94d93bmr12841460ljj.396.1655760657778;
        Mon, 20 Jun 2022 14:30:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l17-20020a2ea311000000b0025a681a7616sm838866lje.105.2022.06.20.14.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 14:30:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 1/4] drm/msm/mdp5: stop overriding drvdata
Date:   Tue, 21 Jun 2022 00:30:51 +0300
Message-Id: <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
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

The rest of the code expects that master's device drvdata is the
struct msm_drm_private instance. Do not override the mdp5's drvdata.

Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index c668a4b27cc6..daf5b5ca7233 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
-static void mdp5_destroy(struct platform_device *pdev);
+static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
@@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 	}
 
 	mdp_kms_destroy(&mdp5_kms->base);
-	mdp5_destroy(mdp5_kms->pdev);
+	mdp5_destroy(mdp5_kms);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -651,9 +651,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	return ret;
 }
 
-static void mdp5_destroy(struct platform_device *pdev)
+static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
 	int i;
 
 	if (mdp5_kms->ctlm)
@@ -667,7 +666,7 @@ static void mdp5_destroy(struct platform_device *pdev)
 		kfree(mdp5_kms->intfs[i]);
 
 	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
+		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
@@ -816,8 +815,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 		goto fail;
 	}
 
-	platform_set_drvdata(pdev, mdp5_kms);
-
 	spin_lock_init(&mdp5_kms->resource_lock);
 
 	mdp5_kms->dev = dev;
@@ -915,7 +912,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	return 0;
 fail:
 	if (mdp5_kms)
-		mdp5_destroy(pdev);
+		mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
@@ -975,7 +972,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
 static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
@@ -985,7 +983,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
-- 
2.35.1

