Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384F774533E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjGCAh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjGCAh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:57 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F04E45
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:55 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b5c2433134so48714871fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344674; x=1690936674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G1CsCJ23zaCfQOQFeshNDkLCUSa7yYapmukMUdJ04U=;
        b=PBuB1pO7o603SkfIOeeA/WpLHfIMMzwz1dV2GHudNFtU2g7cqvtT1RBlHalGL0C0+2
         8f7Xfi0pPHM5LygP4S18yLatZQLAvcukvWI45cX167URHO2gN9jFMRTgWuyBj751iTrv
         nd3lti5NpZytzH95/XsY85cC2epdRU8sEMtm5xrOPU9uwUU9GHP/4UoEq91JUX0zTXX2
         Sb1ZIWxNDvwd/Ngank6BQOiT0WVHLCBDXmvs8AC7GBKT9y4X9Jl8TxQouuHsN0GMKwjB
         5jHvffSoX93IF9kuc6pm/zOJUm9QsW8M1l4cgtxZE0Y03kN3jLZcY+3j08rZet+k5/L6
         NPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344674; x=1690936674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7G1CsCJ23zaCfQOQFeshNDkLCUSa7yYapmukMUdJ04U=;
        b=a0+N8/NvPpUv1FNGnLYfcrnSWbHmP0xnkzMQFOazjKMrpZgjkNzgtEw4Dy9W4V6Xt2
         33MbSmT0PTNr2V1BEOWZvtVXp0a2/g5r9EwucpJsHd4yvE+q2XytnhmhyXrztwB2PEDx
         BHhReW6PnY1yXTlvVClKKhEuD8l+1Uh9bm60//bzQEiETj2eTDANKPygdUdwdXNw78cq
         cHqs1kNJuto1kWEocbfn9q5qYuxwW5ZnIYQSo9PHXeaG1DlYWLYq5VfkivGVrDEiBTfr
         LXovg4gd1k5euNU1IbOGMunnUYmRiPt7E1GV5pFxXaTi2xylAqcs/g5k9Kks7jx8h5+S
         Ck2A==
X-Gm-Message-State: AC+VfDyXg0AMp1pbVBz5Cmt60fCxmbnMH91tTxBcBzoLFkhnz9jnImEf
        zlP9XxYCbj/5FuHh1fVLHdGWnA==
X-Google-Smtp-Source: ACHHUZ4QHiwmcxeXKRHyuXg/5wgfUeP3Y9/Fy/S1J4q/ljb2RH4oaJkmIv+syp6mKGIlTMDgk0unyg==
X-Received: by 2002:a2e:a453:0:b0:2b6:a570:1d5 with SMTP id v19-20020a2ea453000000b002b6a57001d5mr4493534ljn.10.1688344674337;
        Sun, 02 Jul 2023 17:37:54 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 09/13] drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
Date:   Mon,  3 Jul 2023 03:37:41 +0300
Message-Id: <20230703003745.34239-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

The msm_drv_shutdown function should only be used in the KMS case.
Rename it accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 2 +-
 drivers/gpu/drm/msm/msm_drv.h            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8a5249907f53..993799c0945e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1320,7 +1320,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
 	.remove = dpu_dev_remove,
-	.shutdown = msm_drv_shutdown,
+	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_dpu",
 		.of_match_table = dpu_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 302f3d10a464..e35d450492f1 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -572,7 +572,7 @@ MODULE_DEVICE_TABLE(of, mdp4_dt_match);
 static struct platform_driver mdp4_platform_driver = {
 	.probe      = mdp4_probe,
 	.remove     = mdp4_remove,
-	.shutdown   = msm_drv_shutdown,
+	.shutdown   = msm_kms_shutdown,
 	.driver     = {
 		.name   = "mdp4",
 		.of_match_table = mdp4_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 7572e8616961..edd4e68b6e3a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -976,7 +976,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
 	.remove = mdp5_dev_remove,
-	.shutdown = msm_drv_shutdown,
+	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_mdp",
 		.of_match_table = mdp5_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 971c008e82cb..e929da9360e4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1281,7 +1281,7 @@ static int msm_pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-void msm_drv_shutdown(struct platform_device *pdev)
+void msm_kms_shutdown(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 67450dccc5a6..17f22b283c30 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -561,7 +561,7 @@ void msm_kms_pm_complete(struct device *dev);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);
-void msm_drv_shutdown(struct platform_device *pdev);
+void msm_kms_shutdown(struct platform_device *pdev);
 
 
 #endif /* __MSM_DRV_H__ */
-- 
2.39.2

