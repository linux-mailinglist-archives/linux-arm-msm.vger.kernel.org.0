Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E909553D334
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 23:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347251AbiFCV2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 17:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346945AbiFCV2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 17:28:50 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D25D38BE6;
        Fri,  3 Jun 2022 14:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654291730; x=1685827730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=qBf7SPxpqP0Bcn545MSGUrPP9amWnHRUxaBiUmX2YmI=;
  b=MludqLFhAwZ/aWUK2h7iXfPKmp5RXm2B62mwcrMZRtJrJxxRCdaL+zrX
   rgl4tPSW1eVjSay6ta/3HVOVvxFovhrGkl+VJ+YTuBL0BlaRFHs0AP734
   0BsCa+beQ3xkWz7JVUJsskaYofl7DvadeUzNOBNQLLAqIuneh7X1Wj12v
   w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Jun 2022 14:28:49 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 14:28:49 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 3 Jun 2022 14:28:48 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 3 Jun 2022 14:28:48 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] drm/msm: enable msm irq after all initializations are done successfully at msm_drm_init()
Date:   Fri, 3 Jun 2022 14:28:35 -0700
Message-ID: <1654291716-6603-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654291716-6603-1-git-send-email-quic_khsieh@quicinc.com>
References: <1654291716-6603-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At msm initialize phase, msm_drm_init() is called to initialize modules
sequentially. It will call msm_drm_uninit() to clean up initialized phase
if any module initialization return failed. This patch move msm_irq_install()
to the last step of msm_drm_init() after all modules are initialized successfully
so that no msm_irq_unistall() required at msm_drm_uninit() if any module
initialization failed happen at msm_drm_init().

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6665c5a..ab42e9a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -132,15 +132,6 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	return 0;
 }
 
-static void msm_irq_uninstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	kms->funcs->irq_uninstall(kms);
-	free_irq(kms->irq, dev);
-}
-
 struct msm_vblank_work {
 	struct work_struct work;
 	int crtc_id;
@@ -232,10 +223,6 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
-	pm_runtime_get_sync(dev);
-	msm_irq_uninstall(ddev);
-	pm_runtime_put_sync(dev);
-
 	if (kms && kms->funcs)
 		kms->funcs->destroy(kms);
 
@@ -437,16 +424,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		goto err_msm_uninit;
 	}
 
-	if (kms) {
-		pm_runtime_get_sync(dev);
-		ret = msm_irq_install(ddev, kms->irq);
-		pm_runtime_put_sync(dev);
-		if (ret < 0) {
-			DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
-			goto err_msm_uninit;
-		}
-	}
-
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
 		goto err_msm_uninit;
@@ -467,6 +444,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
+	if (kms) {
+		pm_runtime_get_sync(dev);
+		msm_irq_install(ddev, kms->irq);
+		pm_runtime_put_sync(dev);
+	}
+
 	drm_kms_helper_poll_init(ddev);
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

