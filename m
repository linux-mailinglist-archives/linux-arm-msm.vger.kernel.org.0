Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392BF709B98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 17:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjESPtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 11:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbjESPto (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 11:49:44 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7BC1B0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 08:49:41 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ac770a99e2so38754691fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 08:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684511379; x=1687103379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPw2/wB1a5ZqseDCDRMmAwDzMdHfzNEkNDX8ElfTmdw=;
        b=P6TLQJNMAGnNM8kCbXRBfbVx109jVwbRerjJtBpryITbsGU3rKd2aoBl/dH0iEl3RF
         I0pU2hj/4CTqawEsBd1ka7oiGpeZxHJahRQL9XU9rC+RDtXeNNN4YhH8yyR5KDsY3kVX
         u45j4gmMMJveG5uNTYHZQfwtNymJKViLyi80XrZx9idhrL3/zEV9tLUP0SFnfA6Wu8KM
         RPN50hhiidlCsqFQnKwyQhg3b292jmG6v6wwZQEwQfc5p3KLiQH089L+4BSIcKqUt7an
         hE9P1/s+K2n2l+oux/87hCt7sDE2eCCb92g38jlU3xXmzCpa93lx9IygdfYG4HbhPYaT
         mN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684511379; x=1687103379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPw2/wB1a5ZqseDCDRMmAwDzMdHfzNEkNDX8ElfTmdw=;
        b=VSgM62gFESKog6RHm4/JTnvXHxAYD8yPdx1zUSnBQAmZ83MdBZkGOLzW+HaWewGm6o
         yTiyb2hJp0EjSnE2zmdPoVoqmKZCwODSCabFRyGczhWXsORL+FxumUzkNHnbOpbh81Jy
         ymquBgFqob9XhrYETvyVdgRs8cWCGplISOcWoOkfRfVARDFs6+49hlf0H41V6BNLGymE
         toRpJGwo6UIcZPRtN/JgECJXQBzSQ7tpniwXZDKDCMGAgAxjI5Zas7WOzELeBff8HYRr
         /cvNn3rmtdmJEmHdlXN8OdWCxlb8K9DvQIT0K+b9ZF6QWV80HK1L6NxL/oAQIlJHQqGO
         GokQ==
X-Gm-Message-State: AC+VfDw1SkkWcxe9CMPPI1yP50DuOykj3o4gxaPvH6aTtoqpc1WzbyQo
        C6M3uBRX8u+EVqdArEWwUd6vTQ==
X-Google-Smtp-Source: ACHHUZ79rwQCtJZfzAIsCko+9eGfzBOM4wW04PuNuLf9bdGCdZtdThsvBRhWo4NQmiYq6SP2HXIhcg==
X-Received: by 2002:a2e:3012:0:b0:2ad:bedc:9961 with SMTP id w18-20020a2e3012000000b002adbedc9961mr801339ljw.24.1684511379721;
        Fri, 19 May 2023 08:49:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d22-20020a2e96d6000000b002ab59a09d75sm873333ljj.120.2023.05.19.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 08:49:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/msm: allow passing struct msm_kms to msm_drv_probe()
Date:   Fri, 19 May 2023 18:49:35 +0300
Message-Id: <20230519154938.3929839-2-dmitry.baryshkov@linaro.org>
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

In preparation of moving resource allocation to the probe time, allow
MSM KMS drivers to pass struct msm_kms pointer via msm_drv_probe().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 6 ++++--
 drivers/gpu/drm/msm/msm_drv.h            | 3 ++-
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..ec6fb8634196 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1217,7 +1217,7 @@ static int dpu_kms_init(struct drm_device *ddev)
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init);
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
 }
 
 static int dpu_dev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 6e37072ed302..e57a1e5f9da0 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -558,7 +558,7 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
 static int mdp4_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, mdp4_kms_init);
+	return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
 }
 
 static int mdp4_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 29ae5c9613f3..7fd89c93a491 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -939,7 +939,7 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return msm_drv_probe(&pdev->dev, mdp5_kms_init);
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init, NULL);
 }
 
 static int mdp5_dev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b4cfa44a8a5c..a18a8dde3b4b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1232,7 +1232,8 @@ const struct component_master_ops msm_drm_ops = {
 };
 
 int msm_drv_probe(struct device *master_dev,
-	int (*kms_init)(struct drm_device *dev))
+	int (*kms_init)(struct drm_device *dev),
+	struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
 	struct component_match *match = NULL;
@@ -1242,6 +1243,7 @@ int msm_drv_probe(struct device *master_dev,
 	if (!priv)
 		return -ENOMEM;
 
+	priv->kms = kms;
 	priv->kms_init = kms_init;
 	dev_set_drvdata(master_dev, priv);
 
@@ -1277,7 +1279,7 @@ int msm_drv_probe(struct device *master_dev,
 
 static int msm_pdev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, NULL);
+	return msm_drv_probe(&pdev->dev, NULL, NULL);
 }
 
 static int msm_pdev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..6787bd302dfa 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -562,7 +562,8 @@ int msm_pm_prepare(struct device *dev);
 void msm_pm_complete(struct device *dev);
 
 int msm_drv_probe(struct device *dev,
-	int (*kms_init)(struct drm_device *dev));
+	int (*kms_init)(struct drm_device *dev),
+	struct msm_kms *kms);
 void msm_drv_shutdown(struct platform_device *pdev);
 
 
-- 
2.39.2

