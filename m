Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3203951E8D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 19:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbiEGRNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 13:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243682AbiEGRNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 13:13:12 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6505E1A073
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 10:09:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p26so4025191lfh.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 May 2022 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NzygQfKaqxUN99VFssPvB6WUeLsx3+QcBbNDEkCRpbg=;
        b=nOqdkoUfgDzqeU7e9JGMkBSD98aE1d0/dRdjv/WiNhyhZ7lqXjBAyR8Yoy/lHpiJLJ
         NBJlFx6eUoU6SnInFQCqCIFsj5HvOmjOvBCiG71quFYNJ0HnFdHULLg4pcil4x0DJpit
         CHFRYXPncMLcOnSx7Xl0CY5TmHv8ByLPLpD4x28op0b9MsK3IjK7F7Kb7UBcugZ/xVGr
         xVjzH/iL9hThP4WjOmp1hgNLQXYEiU1oQFSJkCkZPJeW8RyIa8ErGmRiCcbYYZ+IJh8Q
         1aGBZ6BfHh2o9/kAELh7t92wZds0pLp4Vd5YVXvBxb1im37HeqgkKo2wrMDnBZRAsFWI
         W1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NzygQfKaqxUN99VFssPvB6WUeLsx3+QcBbNDEkCRpbg=;
        b=IONfm4BlCGU6NrGsHNwwjEYW5+U8jiZNVtmgloUEitQm/STigPLgIMSF+SR2UnWHfE
         wBrDSywvPlzfr9EDVxk35k3+jXzB5N5MARdaxfO4oxOq2aGZTaNnjPbdAU7LtmCh/4Bv
         wYcfu93mCNzCg8QcvPLFg61iDf/jtiHdplVAImpdUut0QqzwQodzmFwSCdpLbcVLM6pb
         vI9sF+xWeNiAV67+YAIkDfUWck53npl4xhurYN/a9KYlcIgUYEYwVsiCl4iZHLME85FU
         WY2WWkb7FuhhHEHhZ4h5chD6dBTjtAcAt34f4BhTy6R00qHiP3LSilJWeziFrY0CYw6I
         fBMw==
X-Gm-Message-State: AOAM530cpTAYjIGEdpqMNcW4S/l9q+5gtNKUpPYCLYStaxHXK4ZjFCuO
        6ttgLd0tIomA19R91ITWDvEHrEJE3RFJuQ==
X-Google-Smtp-Source: ABdhPJyHWSoma8yU9uXEMXFj4Hng1G6xTNnzJFh+/QHTS715VFATXhoOiPi+VVoUddbzqC9+fRto3A==
X-Received: by 2002:a05:6512:3f0e:b0:471:acdd:590c with SMTP id y14-20020a0565123f0e00b00471acdd590cmr6712966lfa.520.1651943363758;
        Sat, 07 May 2022 10:09:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n14-20020a05651203ee00b0047255d211f9sm1175308lfq.296.2022.05.07.10.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 10:09:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date:   Sat,  7 May 2022 20:09:20 +0300
Message-Id: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
index 4d49f3ba6a96..ddcdd5e87853 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -69,8 +69,7 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
@@ -81,9 +80,9 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp4_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp4_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

