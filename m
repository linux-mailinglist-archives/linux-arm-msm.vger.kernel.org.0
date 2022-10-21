Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA074607F04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 21:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJUT0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 15:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiJUT0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 15:26:47 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1F726553E
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 12:26:44 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id r22so5005583ljn.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwaXIne9/tESZg17OSM+CaHqqM5h7/O7wHnlJa8eBxQ=;
        b=fRhXofGb9cOnPhQS9hLIzMl+L60HxccZ+eZsKCY+f1ulBEflyP7axwksg4YImuwdZG
         2I2tm/a2749Ob92vwTjhmSGMhvxpkxWxzXBmA4e5hJrfDjqRaXesyBLCQeQPXAgKzOfm
         oaLTHsvetaybCZ1HwULDh6o8q5Mex7KKeli6PE439Lll3mh+I+wXKpqIZLf22fsH4srr
         7j/1dZGwmmj2WP7Thr3P7iS8htuSEO63KMJ67RRNzv+KSussjDS7sdlRc0HXeQXdxnKk
         uS1D7V8kytITGW4Q23M126eKMRkqAb7maykTtPE0ocYEA9iog5e4IXnVUljTgR8zKL3A
         z20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwaXIne9/tESZg17OSM+CaHqqM5h7/O7wHnlJa8eBxQ=;
        b=gKHUHGlX0yRi6HOkh3BHUwZdBhvNpIDwhMwiEMkIVl3fMh3smrZZRFXsKkCWaHlAzs
         QnobY6ZK3xUUwxudP/BWCS32ctQu/RIx6wrSbGU9zuTZ1+T52efoS/D97GOzIV34CaQQ
         +eLN2Y9A38ckHEUrh52i7u9w3dBqBomvX1sYm1rbnEY5WjLvhC0SBLJmFnaPJRrPtph9
         JWF2T/minLBSwpKCtT/TyTAgGqkjsBghyw7lVv7okOKByH5TJFBFvKLO6fBQpSB1WC3z
         eGo9SouM8nILluVssM+lOT5B4BzC4ufkZ4FVoPSnal882OfTtD7z+9YNHe0jIGxTxRJs
         9gnw==
X-Gm-Message-State: ACrzQf3aq4mD+SGxL8r9JuybXOWHs3yeb60kUdNJt2dCQRe/qmaWNkMc
        hrf0YCvgorSFicHiH1FUjMOKQA==
X-Google-Smtp-Source: AMsMyM4URcKjhKDfjJeEk40K9eZOqmBNKS2DZOrzlHrnPBm/rYl5u6eIXMDc4mYJ0b1qm9YdbduYqQ==
X-Received: by 2002:a2e:b8c9:0:b0:26f:e171:1bf with SMTP id s9-20020a2eb8c9000000b0026fe17101bfmr7063691ljp.460.1666380402545;
        Fri, 21 Oct 2022 12:26:42 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d12-20020a056512368c00b00497a41b3a42sm3278341lfs.88.2022.10.21.12.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 12:26:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/mdp5: stop overriding drvdata
Date:   Fri, 21 Oct 2022 22:26:41 +0300
Message-Id: <20221021192641.2423237-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The rest of the code expects that master's device drvdata is the
struct msm_drm_private instance. Do not override the mdp5's drvdata.

Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Abhinav, Rob, please pick this for -fixes.

This is an updated version of [1]. Fixed the read_mdp_hw_revision()
function. PM runtime isn't available at the moment, as priv->kms is not
set.

[1] https://patchwork.freedesktop.org/patch/490326/?series=105392&rev=1

---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 37 ++++++++++++++----------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b0d21838a134..506c64940972 100644
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
@@ -519,9 +519,15 @@ static void read_mdp_hw_revision(struct mdp5_kms *mdp5_kms,
 	struct device *dev = &mdp5_kms->pdev->dev;
 	u32 version;
 
-	pm_runtime_get_sync(dev);
+	/* Manually enable the MDP5, as pm runtime isn't usable yet */
+	if (mdp5_enable(mdp5_kms)) {
+		*major = 0;
+		*minor = 0;
+		return;
+	}
+
 	version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
-	pm_runtime_put_sync(dev);
+	mdp5_disable(mdp5_kms);
 
 	*major = FIELD(version, MDP5_HW_VERSION_MAJOR);
 	*minor = FIELD(version, MDP5_HW_VERSION_MINOR);
@@ -559,6 +565,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	int irq, i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
+	if (ret)
+		return ret;
 
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
@@ -632,9 +640,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	return ret;
 }
 
-static void mdp5_destroy(struct platform_device *pdev)
+static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
 	int i;
 
 	if (mdp5_kms->ctlm)
@@ -648,7 +655,7 @@ static void mdp5_destroy(struct platform_device *pdev)
 		kfree(mdp5_kms->intfs[i]);
 
 	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
+		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
@@ -797,8 +804,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 		goto fail;
 	}
 
-	platform_set_drvdata(pdev, mdp5_kms);
-
 	spin_lock_init(&mdp5_kms->resource_lock);
 
 	mdp5_kms->dev = dev;
@@ -839,9 +844,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	 */
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
-	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
-
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
 	mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
@@ -893,10 +895,13 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
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
 
@@ -953,7 +958,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
 static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
@@ -963,7 +969,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
-- 
2.35.1

