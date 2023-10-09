Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C8A7BE8EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377502AbjJISKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377484AbjJISKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:52 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DACA3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5045cb9c091so6364556e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875049; x=1697479849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0cKqSV9NbSgEqSOU6qXa8xSoVPQYmAEiFyAsqDd81w=;
        b=EU2EKgbZnG3rYlBymVCZJK6lif5E1zpfNMaVWK13X9t04tj9Yis8YUCGIrTrVo9kNj
         RyPtmJcxTxl+DmevJyvvB7CkPam/dAunDxsySTpyEa0cPfQtabvE0sck8vk7F2vylFn3
         sgomEsSLx2ZuuLQu1XqFebK+fJ3eU9Cbxx6FtLbUcvqG35ucjUBSrVd5cQLk9IGRTS/S
         3y0stC8LMfln4UE2ML910C9Pu6d1sD5x+ArW3KWniZ0ygWwwOxCHFpC4GPSHKOr7aFzk
         C/wF0NXDzyLMJr0VQVvPxZnSpCfGaCAhfo8qo5t3pAHuXJD/zQvPSZuBh+ffw+9jPUig
         KWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875049; x=1697479849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0cKqSV9NbSgEqSOU6qXa8xSoVPQYmAEiFyAsqDd81w=;
        b=T+cP7XP7EIbcmrZAFaENqKjbq0fs/x7U/X/kHymrl+EVQYVAWWdWj9AndCt+AvKzry
         +VeJO09G+I7nxGkFoROw8XtuQIX2CjEmCI5Kzb0eR/AsU1gRg79yPejo2Nd8cPAEiTkH
         3jkiq3YU7Ot+y1fh1uLhPhggh9BXpovb4YSF9lsmUXAEbPdcgvjHAgrnaF7WEqXjBbxQ
         W1fBuSWEFd8eYO9hAgENl0DbePvFREBu7jkq4AR4/rBqR2y8QI3e74CL2HI8QjdGU9MD
         xW969WJ3e9D+efZ9n8rci3thxF0wu5YaF5ygneOP5OQ0j19NDoR1cbG1ldA4shghwdPp
         bTzw==
X-Gm-Message-State: AOJu0YwqMjKD62seSNCO0sFscxGpMUCFewHpUt8KxHfmt6T5i+EWBijH
        qDjya9mGq+6TTUXbgVBI6xX+7Q==
X-Google-Smtp-Source: AGHT+IGjsZpPnq1qFxWqGVR/Mczr22fdRGnVqbtgHDPrubrJj1BfM24m7lxX3TfFDZBnuN9hSztSOA==
X-Received: by 2002:a19:a414:0:b0:502:a55b:c2d7 with SMTP id q20-20020a19a414000000b00502a55bc2d7mr13573712lfc.60.1696875049054;
        Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:48 -0700 (PDT)
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
Subject: [PATCH v2 09/13] drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
Date:   Mon,  9 Oct 2023 21:10:36 +0300
Message-Id: <20231009181040.2743847-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_drv_shutdown function should only be used in the KMS case.
Rename it accordingly.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 2 +-
 drivers/gpu/drm/msm/msm_drv.h            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1f06c0c36533..fe7267b3bff5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1370,7 +1370,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
 	.remove_new = dpu_dev_remove,
-	.shutdown = msm_drv_shutdown,
+	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_dpu",
 		.of_match_table = dpu_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 386f61556789..4ba1cb74ad76 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -570,7 +570,7 @@ MODULE_DEVICE_TABLE(of, mdp4_dt_match);
 static struct platform_driver mdp4_platform_driver = {
 	.probe      = mdp4_probe,
 	.remove_new = mdp4_remove,
-	.shutdown   = msm_drv_shutdown,
+	.shutdown   = msm_kms_shutdown,
 	.driver     = {
 		.name   = "mdp4",
 		.of_match_table = mdp4_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index d936b6b958d1..11d9fc2c6bf5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -975,7 +975,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
 	.remove_new = mdp5_dev_remove,
-	.shutdown = msm_drv_shutdown,
+	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_mdp",
 		.of_match_table = mdp5_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c2f989d1ff42..8079f408c9ed 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1278,7 +1278,7 @@ static void msm_pdev_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &msm_drm_ops);
 }
 
-void msm_drv_shutdown(struct platform_device *pdev)
+void msm_kms_shutdown(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a28d93c09492..cd5bf658df66 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -569,7 +569,7 @@ void msm_kms_pm_complete(struct device *dev);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);
-void msm_drv_shutdown(struct platform_device *pdev);
+void msm_kms_shutdown(struct platform_device *pdev);
 
 
 #endif /* __MSM_DRV_H__ */
-- 
2.39.2

