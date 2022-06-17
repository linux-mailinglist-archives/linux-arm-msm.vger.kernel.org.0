Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130C854FC8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383296AbiFQRzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 13:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiFQRzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 13:55:43 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA354990F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:55:42 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id m25so5480857lji.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
        b=OFQ+NwTd1oExO/YyvBg1+/3FGralOW4TyMBglEdNEOpDf9HJp2Ga4zpaxbiOeVNffp
         PAL/DnazJ/2VaJuuUj68s5PNICR/ZeLV5J1kFbCWCeZjhNk9qUSAULPFiFq/b2l9KKYd
         CW7DKojbNYU4l1aVC+zf87IyL+hBBhWYFjr5HwXokg+2pu+ZLRJ5Jy/2jKVln08wndDj
         tRh0QX9f0AbgeJDALfviFfJWsVk+p+OFTGg066XUkoOP6XtlL/OdprHevu7L4CvD5FyQ
         qqqdSMM7uk2Pp2yeIRM79yNlfdHnybf3yowLN9LSeN8WssI5ln7sqnL3SwYtr6qby+ks
         2rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
        b=WzQQzI0GGu9KVU6qa4tW1bxz9jZtPedobkW7aWx0IX02wm2vD657MohKqmVlRilAPP
         ZKBzEozwu9z1FoFruwa/vRKPJRfjQ1LGnCiUn9EW3TJ5qeEluL/qvsB2LNgHtkXqN+ak
         yleuWW/CJ0SalZTQJmcYyeo9gbzx3zXKEfMX35FECjRMQKiJmSYYrxlKYdMsEOS1Khy5
         5GV5r+Tts76MacwMTbZBw+7SPWhuGKMioMN0lmWWdHaS9AxA40jzf5S5w8iigP+2Ox5y
         p2glmPGC+c+HM25DdtuJ0IHesK2tIwi/1Bj9viUmRL7Lx+DfaXoZtYFitbN2PJu4uwfR
         AI7g==
X-Gm-Message-State: AJIora8tg2+uXHu6pI8SKA971QWdtbB3PscrCcNwAFAxjF4kalENG6MH
        LuFOE+0M8qBk0Y++wb0O2Efyyg==
X-Google-Smtp-Source: AGRyM1v7Lf7iL11gGJO9hWjwiKs8CTU3aUv0bV2QJaVFm7d1+ScfU6J92dpugvqkuIkvs8Ulyrpi+Q==
X-Received: by 2002:a2e:b052:0:b0:255:9565:c6fa with SMTP id d18-20020a2eb052000000b002559565c6famr5526581ljl.529.1655488540496;
        Fri, 17 Jun 2022 10:55:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date:   Fri, 17 Jun 2022 20:55:36 +0300
Message-Id: <20220617175538.1080351-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
References: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
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

