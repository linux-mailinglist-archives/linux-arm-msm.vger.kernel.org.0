Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB606381D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 01:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiKYACS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 19:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiKYACS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 19:02:18 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBB0832A4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 16:02:17 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id q7so3463962ljp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 16:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgbhuavqT9sjFGfJG8BukwmDaC1jAhXZDZa+W9QfoOs=;
        b=AttiVNDUP6q1hbgT3P7MqNSQtLZrHqsVnDdbXCUpoH/DRw81lKJ9U9TjW4yGE9iUhG
         91wZbIoMaKmXxQ1Ql9laxvr6gaMT8+86Zooaje0tdZ4QTgEHVNCet6CTPd8VlhIOfufQ
         vatIj4lhmP7EfhkJnNVrzul4WxkWFZbYOtLuSEklG29QMTvFEW3zhjPXr6ij7GEqlclx
         EFnoXc6WgZgv4NAyc0qKOxeLKrGsUxmEK7xJ9cMxVo5jVyGqtVuOXgSCfjBapJc8p+JL
         OavrXMfI0gjhgGBJsRiij7X9VywYLZNGueOJeLy22DV5GCHqv1dtiqBgHKAZBKu4ixsP
         tMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgbhuavqT9sjFGfJG8BukwmDaC1jAhXZDZa+W9QfoOs=;
        b=C5M3IVhlvo/8Y/B7ytxAn47qAvKHVLVpw2on5NEOsD8WccRGGF/IIFU0jKCSZ0V+xm
         qI3eSymQFdKfDVTFs3F2qh3HDmmt4dPd0wsb38Cnf0axe+EYnTqnRggNlsDOb7MtbqtJ
         r8qyaqH0FwA3nHsu8wjdIB14cUNfY5vp4BCLRiTcHqlGzAd+aFU29PUlfLISafpjBMeJ
         lWBzEV5YnJbIG91nlWWhuPyU6H2WSkyrvY+mmdutkvonI+zqjB1dTUcOYC8uaVg2aMlh
         8UersOebNxef26ZkncixbfSigvRnZYlY0TFiI19b1cs4gFRl3f2jife1pzZu3xhIhgbP
         i40g==
X-Gm-Message-State: ANoB5pm2eSmuSzcD4Ffacgv+xix8V3Asf/H8I69cZBvXzHYJWKLJtF5K
        FSwY8n3DwW4hLv0vebNKItG95ewK1Ace2U74
X-Google-Smtp-Source: AA0mqf6OFOdHi5pJvaT0uHSnNXd+1KRmGHNzFVp7W64gh0yMz+Di3gBC2VTSNSsqns9Xj8BY9iMqHg==
X-Received: by 2002:a2e:9615:0:b0:278:e939:4eca with SMTP id v21-20020a2e9615000000b00278e9394ecamr10519315ljh.95.1669334535428;
        Thu, 24 Nov 2022 16:02:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpy175yyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a301:5de4::1])
        by smtp.gmail.com with ESMTPSA id b23-20020ac247f7000000b004aa95889063sm293806lfp.43.2022.11.24.16.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 16:02:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdp5: fix reading hw revision on db410c platform
Date:   Fri, 25 Nov 2022 02:02:13 +0200
Message-Id: <20221125000213.252115-1-dmitry.baryshkov@linaro.org>
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

Since the commit commit c6122688f265 ("drm/msm/mdp5: stop overriding
drvdata") reading the MDP5 hw revision on db410c will crash the board
as the MDSS_GDSC is not enabled. Revert a part of the offending commit
(moving rpm enablement) and set priv->kms earlier. This make it possible
to use pm_runtime_get_sync() during read_mdp_hw_revision(), which will
power up both the MDP5 and MDSS devices.

Fixes: c6122688f265 ("drm/msm/mdp5: stop overriding drvdata")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b46f983f2b46..29ae5c9613f3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -519,10 +519,9 @@ static void read_mdp_hw_revision(struct mdp5_kms *mdp5_kms,
 	struct device *dev = &mdp5_kms->pdev->dev;
 	u32 version;
 
-	/* Manually enable the MDP5, as pm runtime isn't usable yet. */
-	mdp5_enable(mdp5_kms);
+	pm_runtime_get_sync(dev);
 	version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
-	mdp5_disable(mdp5_kms);
+	pm_runtime_put_sync(dev);
 
 	*major = FIELD(version, MDP5_HW_VERSION_MAJOR);
 	*minor = FIELD(version, MDP5_HW_VERSION_MINOR);
@@ -839,6 +838,12 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	 */
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
+	/* set uninit-ed kms */
+	priv->kms = &mdp5_kms->base.base;
+
+	pm_runtime_enable(&pdev->dev);
+	mdp5_kms->rpm_enabled = true;
+
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
 	mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
@@ -887,12 +892,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	if (ret)
 		goto fail;
 
-	/* set uninit-ed kms */
-	priv->kms = &mdp5_kms->base.base;
-
-	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
-
 	return 0;
 fail:
 	if (mdp5_kms)
-- 
2.35.1

