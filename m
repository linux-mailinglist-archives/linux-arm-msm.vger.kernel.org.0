Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C6354FD6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 21:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiFQTOf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 15:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbiFQTOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 15:14:34 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EA1527F0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:14:33 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id v8so5683683ljj.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
        b=xbTp4LwIyALPE6VlO2jKeqx0nEcZqEAaTIvwaWRYmxrkoKsvTdw7tRFMenONFGr7lR
         Ufsj5aML5qWHeHSUBIVlf4jFXjfRreOw1kWbAyPXwKAWLn+QXp6CSAMmOmX96JTImmZz
         cuauD7A1K36gKMJOVW+unaIInlBuQGSQwbHaeEIQRuvD+IIfEqu/l55HyeBlHqbHck2+
         uLQzTDVJS8W8TzsSnyWLY9jsL62F2gv0aI70+pT9AHEqeUl+Rer2mGUcD5EKl4HaijSH
         NCME341RbCDNJT33fxlZzfYRpidwakurjMAjfP0rC4amT4ABlmZgF6xcw/jW5oXrRu6u
         pmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
        b=n1DlI/J4/Z0aTsmVKHJGOCvlsIJbryhJ4FWukCGDYGDZA1zJycg5SksJNXZBLuD+jJ
         jVw59/Q4a+1jcYjhNl3mRUX6VeHzQNwmZJEBAj4Ar1YA6xcARZ0ckfmvQF+pGSn2E0Fn
         8rAgZXzyyh3jjZA6ONg+J7hJkQ8rSib87ahZqbDGrtlzoG1lIDm7AbubjCZconavHaFO
         W66LIamziuYKClGbqpoKOGmbrYQQe60S8UAwN1wA3N77uKfiowhP5u5rhxfOHnpPuhbV
         x3tsALsKY/+mQkrk2M45yIewsgmmmuDYkUtU1d9MP//2kHvvatd1AkufrRG+uR7UF6ra
         5wiw==
X-Gm-Message-State: AJIora+J0hV3nfZUOVDSUV1cZQcvTFqLluOfyA/caT3TDM5GW/rqMPwT
        cW3z/+oEBeAqIZDL1M9n8oFz1g==
X-Google-Smtp-Source: AGRyM1vEMaivlVmp1GevVPnOlaohjbQDhVNfZ7qhfExjbK4LLttMx7ZLMSW4usvknVC++JyrNMot2g==
X-Received: by 2002:a2e:9893:0:b0:255:951f:9694 with SMTP id b19-20020a2e9893000000b00255951f9694mr5767186ljj.283.1655493271802;
        Fri, 17 Jun 2022 12:14:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.59])
        by smtp.gmail.com with ESMTPSA id k15-20020a2e920f000000b00253e1833e8bsm639680ljg.117.2022.06.17.12.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 12:14:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date:   Fri, 17 Jun 2022 22:14:27 +0300
Message-Id: <20220617191429.1087634-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
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

