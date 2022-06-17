Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6F45500D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237732AbiFQXdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245202AbiFQXdf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:33:35 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCFB663C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:34 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c30so6192689ljr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/fpEFi8S0hW+duJvXqSCWOTTPVMo6WlgdDXXr3M0Q4c=;
        b=ocSpZOvZt/RXZx2+XJFTIGyp5WIUmU2X7i0IZMXDMKytdbB2uqXyaMJfP/kT7YS0O4
         6zA/I4Y4KLB8OsxtK48D1R/HD6v1zm3PWwuHzrehJgBpwKIX1aYiBOVtFkU4Z14qvyHA
         sGxZr0LunlpWM1UuLD/xU8E/cBblwCStj7bGZEljz9SIqetdxmyj/U82I56Lv0RMdDpR
         DKOPugWMbVIV6QxPg+VyYgeJsgAHYGZjEGWT/t6hPgSiEAObQL6DRIv9uG6n5OMxsVQy
         Lv0hZBqifLaK4vXZ7/hXAx0xTcb60Vjxw2M0vNoqsa+obklkN64G70oXJbThaA5cCI4k
         DF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/fpEFi8S0hW+duJvXqSCWOTTPVMo6WlgdDXXr3M0Q4c=;
        b=Saik2xqURlZ5rNThAMdBzgqFVq1hmU2PT5q50Ipy0twjhSSaqbARGYh/nCyBX91eda
         dA1WyZ/dxJwHHnRJAf9lerfyJjOo/SLDler2XYPQufmoHURXvPBVl8sDBK6qWcRSyaDh
         P2sqNY3M3Jm6CEJ2zYJ2FYXgS0LPbp6GLvesM7H1Q2dNInF/3AWoxDuYE/NK6vVmJP/t
         dJFBfwMyaNEcoAPzOBb32GnPAjT7i5caANTRQBRpdrmgJIyE4yVLhehvBdDOm6PTfUVZ
         jO3hUDjPGZ/PhGjmazp+U5qeO0z64Y6Jynf7zJieWVfjBoV+FSJX5Gets6p1BWRxqiug
         /DMg==
X-Gm-Message-State: AJIora8DWPwXFbdoMiyoU1pK0WiGCUNk/3DSjl1482ohq2M+L8sV9vBY
        C/EirKr7A3HZIUzCHvEk2lyZEg==
X-Google-Smtp-Source: AGRyM1vrq8RQmepLu5AgSzgAH/v5DfiHHZruU6mx6PheCkH1H5Qs7pqQt5U2K+3RsuJWhc1j7slEuA==
X-Received: by 2002:a2e:9d88:0:b0:25a:5b70:f14 with SMTP id c8-20020a2e9d88000000b0025a5b700f14mr808143ljj.132.1655508812805;
        Fri, 17 Jun 2022 16:33:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:33:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 2/4] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date:   Sat, 18 Jun 2022 02:33:26 +0300
Message-Id: <20220617233328.1143665-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

