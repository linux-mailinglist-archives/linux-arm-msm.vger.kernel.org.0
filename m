Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A19960B339
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiJXRAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbiJXQ7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 12:59:47 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E977F5BC20
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:37:34 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id o4so8424989ljp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqRGLOBzaJQiPD69TI7ZYBGSuH1X+zWammokeoyKgYQ=;
        b=HkOaYkKKLa/BIyb+5jGjQbazDfUhDjOYuBGoLd5rCqFXMIL68wqRsnaWnolbGOC3Nm
         zcrNhuXpU1NHlUBHCJ2M4Y/EY4wLe9UgW9Cf81yClkr+I2v3/Y1O5hQmbEYWagLjyD1t
         D5GHDoZQsASaCwFHuZkngWmEa/ocmYphgM4ETi1rgJD484sqJX6pG258WQmqHf93ff1T
         HtR9tMdedYZ5tEw2E/l/vw7eADjsEHT/QrD55nADifCD+NNiu4rdBxtsC5XvITupwFn3
         3jBk9J4zdCZQHP5nPCkypV2WFDZWg8MUEJ0EdktbNrYadFSDmcppLyp7G221T9Ffkdxh
         C6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqRGLOBzaJQiPD69TI7ZYBGSuH1X+zWammokeoyKgYQ=;
        b=anXCOxIYTnKeJNaO4aKEXW5E2oTvh9xR9UtkmCG1Kz669vpiN5JoSmEVE6K6dGcFkY
         RIdkGMnjMuAR37Lc0LTlF1WSNjzK1VM4DAxdcCvGXxcjCQaalzVA3xELs48bmWwa4cS3
         qgZmSYtyZyVvA5VBP5RvBqowCEBWfKzH4uETgCRPyzUZ9ZmlkX0AwG0CbNoPOwrfCqIy
         obJU9PybnqZiDmhshKbbtSBCNaTGxrpkF3Q7uq0JrTwJmpeQoSu7GffJlDGXnXcMlwXh
         7+2XLc6nwqOBAWDDAlyU/sC4goarBQxDWqF+kdeA9Pqgt2Q9+UEbJ9Pk5GmY+cSW0aGW
         4YZQ==
X-Gm-Message-State: ACrzQf3HAEZPkDxj7c+MSOQ9TWtVyU+dsNWbPhP8kLYbEyOLK4ES0ZH8
        StBMx0jYF4+uMJFXT5Ncsyjch8UCjJBxGhln
X-Google-Smtp-Source: AMsMyM5fxtkvvqMZxj7sYGg5V2dnMN1M5jifAxQQ9eMylMBAIElzfvxtuf1imBSLvNUFesRVFPcZsg==
X-Received: by 2002:a05:6512:3053:b0:4a2:6b9c:a853 with SMTP id b19-20020a056512305300b004a26b9ca853mr11555194lfb.666.1666625203332;
        Mon, 24 Oct 2022 08:26:43 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p11-20020a056512234b00b0049487818dd9sm4580617lfu.60.2022.10.24.08.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:26:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3] drm/msm/mdp5: stop overriding drvdata
Date:   Mon, 24 Oct 2022 18:26:42 +0300
Message-Id: <20221024152642.3213488-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Abhinav, Rob, please pick this for -fixes.

This is an updated version of [1]. Fixed the read_mdp_hw_revision()
function. PM runtime isn't available at the moment, as priv->kms is not
set.

[1] https://patchwork.freedesktop.org/patch/490326/?series=105392&rev=1

Changes since v2:
- Removed the clause checking whether mdp5_enable() has failed (it can
  not fail, noted by Abhinav)

Changes since v1:
- Expanded the patch to also handle the read_mdp_hw_revision() and also
  to move pm enablement to the place where the pm_runtime can actually
  be used.

---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 32 +++++++++++++-----------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b0d21838a134..b46f983f2b46 100644
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
@@ -519,9 +519,10 @@ static void read_mdp_hw_revision(struct mdp5_kms *mdp5_kms,
 	struct device *dev = &mdp5_kms->pdev->dev;
 	u32 version;
 
-	pm_runtime_get_sync(dev);
+	/* Manually enable the MDP5, as pm runtime isn't usable yet. */
+	mdp5_enable(mdp5_kms);
 	version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
-	pm_runtime_put_sync(dev);
+	mdp5_disable(mdp5_kms);
 
 	*major = FIELD(version, MDP5_HW_VERSION_MAJOR);
 	*minor = FIELD(version, MDP5_HW_VERSION_MINOR);
@@ -559,6 +560,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	int irq, i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
+	if (ret)
+		return ret;
 
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
@@ -632,9 +635,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	return ret;
 }
 
-static void mdp5_destroy(struct platform_device *pdev)
+static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
 	int i;
 
 	if (mdp5_kms->ctlm)
@@ -648,7 +650,7 @@ static void mdp5_destroy(struct platform_device *pdev)
 		kfree(mdp5_kms->intfs[i]);
 
 	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
+		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
@@ -797,8 +799,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 		goto fail;
 	}
 
-	platform_set_drvdata(pdev, mdp5_kms);
-
 	spin_lock_init(&mdp5_kms->resource_lock);
 
 	mdp5_kms->dev = dev;
@@ -839,9 +839,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	 */
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
-	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
-
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
 	mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
@@ -893,10 +890,13 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	/* set uninit-ed kms */
 	priv->kms = &mdp5_kms->base.base;
 
+	pm_runtime_enable(&pdev->dev);
+	mdp5_kms->rpm_enabled = true;
+
 	return 0;
 fail:
 	if (mdp5_kms)
-		mdp5_destroy(pdev);
+		mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
@@ -953,7 +953,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
 static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
@@ -963,7 +964,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
-- 
2.35.1

