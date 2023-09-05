Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13766792D63
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 20:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjIESb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 14:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbjIESb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 14:31:58 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EEDE4D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 11:31:26 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401c90ed2ecso28475475e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693938615; x=1694543415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yoR4D3vHBG2DQkrYz9CktRc0wLoRmNyNxYAYcHedKY=;
        b=xsNEcINungC6pAwvKg5jcwHviWBceZQE/CvY5Qo7+WA6YcSUEmOh09Dl5voXxa+IUx
         HUiLtdSuMJ2EdoldpsvEQCukL/2OY8n91O1hezAwGe210nWb1j3sCJAvEDPXoKL1aqaw
         uOIQ8f/eDFimnR87OAIWIYrO1M0XZ3qDLq8KT3M+kpvjx3Ww28M6rUkjx3pWfPtQp5p0
         76MN3nAmYsjXA67b4syf4a+R0D0taml0xAo9Fz1YbrFUeMFM2qFHgqz0TsUjRu0NsbnA
         MG07Zl/riynkbTRzBEMgUJESjq5FVVDq2VxuPejxVNsJ/Du7zIFHd1wt3fqb9GgDfS8v
         hnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693938615; x=1694543415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yoR4D3vHBG2DQkrYz9CktRc0wLoRmNyNxYAYcHedKY=;
        b=THCqxbPQiJbAldwOnIhVZiQ87NQ2qx+PduzLy0UBFzci6dWYiiyWUERq/qRCSgUHlt
         Cf4/MZmS9LqG7RkaEAWFotQBb7mSjPCg36hILZRc/zuvRwzdLOLfg5K6mmav6AZ3AMrX
         4sJ7MsceYc2XOPaGm2+DHV4lVJzTjpY6A/+rnETo3sX6WXDWnfpYkKsWJFQYPf+D2SNx
         vwbJD/6atzEiY7JKXxhSRzSrCDEPUPF+NOZ1tjCct9wHcO4fI1Q7ZrC7BVTsIWozwemU
         7D1SE1e1w8zuhk2cmyQh15diQi37gv6LOdwjqtZXvBy/0HinFpz7wlCbogbg8VP6pj2g
         gSOw==
X-Gm-Message-State: AOJu0YxPOx5tPkS6OVR8myukZgcMU33YfgkdJe83C9IRrL+NL4aLwQWU
        R72Qvubwjt/hIvvJgerahuoMvkz0lZMYUdAIFOY=
X-Google-Smtp-Source: AGHT+IGm7+DBBs6eUJlCmFekaxTP6D1h6di+Hq+Qb8/vCg1YKyy6jIAoWIR4m4sIwUH+PTmWpEoyTw==
X-Received: by 2002:a2e:8898:0:b0:2b9:e93e:65e6 with SMTP id k24-20020a2e8898000000b002b9e93e65e6mr346411lji.35.1693935836949;
        Tue, 05 Sep 2023 10:43:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 10:43:56 -0700 (PDT)
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
Subject: [PATCH 4/6] drm/msm: add a kernel param to select between MDP5 and DPU drivers
Date:   Tue,  5 Sep 2023 20:43:51 +0300
Message-Id: <20230905174353.3118648-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
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

For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
possible to support this platform via the DPU driver (e.g. to provide
support for DP, multirect, etc). Add a modparam to be able to switch
between these two drivers.

All platforms supported by both drivers are by default handled by the
MDP5 driver. To let them be handled by the DPU driver pass the
`msm.prefer_mdp5=false` kernel param.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +++
 drivers/gpu/drm/msm/msm_drv.c            | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 4 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a9ba67e24e11..f3cb8c2ada5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1351,6 +1351,9 @@ static int dpu_kms_init(struct drm_device *ddev)
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
+	if (!msm_disp_drv_should_bind(&pdev->dev, true))
+		return -ENODEV;
+
 	return msm_drv_probe(&pdev->dev, dpu_kms_init);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 92bf9d949d09..3828725683a7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -935,6 +935,9 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 
 	DBG("");
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, false))
+		return -ENODEV;
+
 	ret = mdp5_setup_interconnect(pdev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4bd028fa7500..1b8ec55704ba 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1184,6 +1184,37 @@ static int add_components_mdp(struct device *master_dev,
 	return 0;
 }
 
+#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
+bool msm_disp_drv_should_bind(struct device *dev, bool mdp5_driver)
+{
+	/* If just a single driver is enabled, use it no matter what */
+	return true;
+}
+#else
+
+static bool prefer_mdp5 = true;
+MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
+module_param(prefer_mdp5, bool, 0444);
+
+/* list all platforms supported by both mdp5 and dpu drivers */
+static const char *const msm_mdp5_dpu_migration[] = {
+	NULL,
+};
+
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
+{
+	/* If it is not an MDP5 device, do not try MDP5 driver */
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
+		return dpu_driver;
+
+	/* If it is not in the migration list, use MDP5 */
+	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
+		return !dpu_driver;
+
+	return prefer_mdp5 ? !dpu_driver : dpu_driver;
+}
+#endif
+
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fdcbb02fa396..05370a03fb44 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -571,5 +571,6 @@ int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev));
 void msm_drv_shutdown(struct platform_device *pdev);
 
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
 #endif /* __MSM_DRV_H__ */
-- 
2.39.2

