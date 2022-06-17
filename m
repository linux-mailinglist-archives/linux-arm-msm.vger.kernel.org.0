Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D745500D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245202AbiFQXdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380549AbiFQXdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:33:36 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82ED8663D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:35 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s10so6184025ljh.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fFbdKaDNYDUS6tXkTIVt1gzmoptlTns1Lqe5DDTL1yY=;
        b=AaI2o7I8i1Jk4DfUsTY5N8kSi16bKmrARdQhA2mpyByoZt3ILIiW0rbvw71J1kq512
         GdpVbS1jNiAK6IthLJWT5N81nDXHe54NEUGJX7d5I+duKvES5GOSE4j/wWFX0w6oOuuW
         kaSMdNqOg3d1P0ybFZ+K/gwoizN0Es+D8EhmgVi4sGgGXIi7OSXBCC5iaJ3ei//7czib
         2S2Qk5eR1N3PCSABqztTG6mDxr7R5Kjiyw9TzwaJ1hb+GxO09VOLD3u4GrjOV3WcR059
         keuZeE2dJ25BpHD+cVdWWftHTqSOBNfrgM25hWF74/oZSp/kCBdc1nFXJNxyC+lEV3IE
         +dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fFbdKaDNYDUS6tXkTIVt1gzmoptlTns1Lqe5DDTL1yY=;
        b=UJ+puGuEJ06T5PEwJhbOmhmGq3ExAt7y0Hs3C2rmjY9wk8S1NBkIeTFiuXUQDPXTe+
         Nz7lB/GoBUjgiJqmFGxlaHjiG7+2Br1qn/RmX3fRsKp6rX8OgFQgqFhZMjR1t8U3cYGR
         qC++Te2yBaohkd44ZvVPrafCdDBmXDnsgOxy2eOdOJXePg0P5N53wonnumlrMgtpjikb
         tOW65cqM6UbypOTzxPi1jdZ97W1G8bDI9L3sVb9xZjd4XqBFxoiY27gbOIi6puI2o+BY
         e+MNs6g+JdZ1fWO3i8VgiINkglHRP1O3GcixL887gVGLNrGKEW1pt3Z+iQTyFdYkTvGv
         cLEQ==
X-Gm-Message-State: AJIora9Zk7nmHKsMGJfQsquwJ17pMjy7uzq8cbnab9JyH1kyBbN+/+hM
        n68IbtYmVS7c6uUZR8MpiCEVAA==
X-Google-Smtp-Source: AGRyM1vjvkOoYL/nCDVN8KS+ijL2/HK/m6fxMKHTRPXtCXY6yAc+T8QdOSUMolU+Z5OQQv5iXO4/aQ==
X-Received: by 2002:a2e:99c7:0:b0:255:6913:9039 with SMTP id l7-20020a2e99c7000000b0025569139039mr6088903ljj.127.1655508813916;
        Fri, 17 Jun 2022 16:33:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:33:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 3/4] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date:   Sat, 18 Jun 2022 02:33:27 +0300
Message-Id: <20220617233328.1143665-4-dmitry.baryshkov@linaro.org>
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

