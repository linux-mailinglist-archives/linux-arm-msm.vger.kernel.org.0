Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C4854FD63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 21:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbiFQTOh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 15:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238785AbiFQTOf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 15:14:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685C852E66
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:14:34 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c30so5678890ljr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
        b=iKthKkfUcMM9o6hWQhqaRZjGA3ciJ2B05C3Bls4mHzjTIRIftqPJtaiV6fIQeq9yai
         sLo3XlmbG+XHAgDTNEIg+Je0X0ey6MInTh6f2rR9Vd8I8Pq/qFwOHUNqCMie4R1ne/Eo
         uMa4QyIyH4xnFaRRD3Jx44JZHei5FT9Jmx0mZ83rRJK71PFlVC3hekEWB08CmirZ1B7e
         1LvzyWC1J1XEdkT7ETVfEwRTygnrbJzvzarUIWjlUJ37TBfcwtZcmqoFDkrPu7q4cRbR
         Z7SCdyQojHDpy+Mf0gb1fO7KTVvumKpLwfouTr9cABBpdathOc8BYaqNyYkjqrwqAN3W
         EuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
        b=lBQCuuPgMrYq8uqo8fax3rkjHyEE5YnbkHbBme7dzEtJA40/iHrWsr45klB+OX/vVp
         +rURYOY1+Uq2VuXcX9eXJ20vONu9F1mYLHN8pcHBrt5nWxQ3/N6uCq61lncoZtHxYeLo
         PqooQSz9AOCtURpBM5nSrUS/BE382fiAGIgWJDN619jxk5HFWtz98g1A74fv2xtX5MLf
         vXAAm2IiK9theuKPRzjDCgfTVdBFOTOlFOTCS+sWKzDmUMvoVDvtUnFLH7fmI/upF8Zx
         4dITgyEWzFM/jF1vWErZzOId9LKEjM++LNW+0t/8RGWo2ZdAwfRd5l4q9qSxxGjQ3ZT4
         YIgQ==
X-Gm-Message-State: AJIora97++MckrAEzqD6WV7x4aOoGlWaCaXnIeOvLiGyWxmXthZJlh0x
        Aq8mhT391mTjhph8G700UezlUw==
X-Google-Smtp-Source: AGRyM1vjgsaW6RCmaejvfNFLPQyrVreNKfFxK18s1McHyaU9Rh3StfRKYgQ0ALeis8lysJYmm5zWTA==
X-Received: by 2002:a2e:9283:0:b0:253:e175:dd84 with SMTP id d3-20020a2e9283000000b00253e175dd84mr5608383ljh.221.1655493272726;
        Fri, 17 Jun 2022 12:14:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.59])
        by smtp.gmail.com with ESMTPSA id k15-20020a2e920f000000b00253e1833e8bsm639680ljg.117.2022.06.17.12.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 12:14:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date:   Fri, 17 Jun 2022 22:14:28 +0300
Message-Id: <20220617191429.1087634-3-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index 9b4c8d92ff32..43443a435d59 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -82,8 +82,7 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp5_read(mdp5_kms, REG_MDP5_INTR_EN);
@@ -94,9 +93,9 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp5_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp5_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

