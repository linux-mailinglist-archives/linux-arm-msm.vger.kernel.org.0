Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEFD454FC7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 19:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383435AbiFQRuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 13:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiFQRuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 13:50:24 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F9849F95
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:50:23 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h36so7982148lfv.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
        b=wtB0Bo7MIsJ7+OPzpfl05X+sDYAE+gl8xK15W2twX4nyEyKCKgCt7fizZOsyqZGes7
         VMe0bI0baS12/w9GMjCh6GoCsR7jsc4R+A6piCspN8IFwTigTwow1oNqqx/2uXWtrApg
         pOKTX+zmCDBGfP0Ll80Emf6jaOnnOcY/ko9Se+HGfgh3EAMZ34P+CQX1B3yg0A4SMuxc
         XF0toEgLfiu3GbcUsTKSa6w6KmQ4YOZxL2iark/0P9By6eCVVF0nqD6HL4EAV6OER0R0
         emVdtdbCqacDKLAiX1Wt9SpeTAfRfcdPXHsYxanqdrqr318qLVe363/wG9mELFm/eF9n
         crkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v5Xfd/lShJ436Gkh8UHXXgQps7qSsu2XxGEcqIQNHeg=;
        b=OaYPfuqsI8+586LuRIdfkcopA2aaBPNDyGDLSYLm2Btu0G7rxH1FaznRT6cgwK3cnO
         tZsRTg4PSh+NcalGQr/UXLGNvGRHXyv8sc/zTu5SgimZB6mQxRmhV5ykV8rUHt6bAIHN
         4mdt6S2fKNxlyqAmmIGBpp+9tyZtXZI8sRj/klrQoWJV6aYsyURUJLR4FQKRq/mfr21+
         ko9ANuYFMAR0MDSjNz/jkjV3P0n4GRPKW7b+3H+3LiwpWFjEiwnXaX22wRj2K5wFp0v0
         zbBWncnf3/GCzIBhsK8Q9fV8MijuKtsj7igANtjEWThJrunUMvn1ozrBh1IX3CZ9MwHS
         dvvg==
X-Gm-Message-State: AJIora9CzNin2RYVFJsYq3CTGz04OS3WgLTyC58Fup2hGmSsrRTIavR8
        gDXesTqMdyjIBiFl/VfMna3SIXMN3zfDinWd
X-Google-Smtp-Source: AGRyM1sVWbcs49gGGE8BJpLz9BHq37J9II5hNgIZISFkmv9Xdm/bGWIWiEiUnwNPcSZ1LXFS3UFuBQ==
X-Received: by 2002:a05:6512:4015:b0:479:cb6:f8da with SMTP id br21-20020a056512401500b004790cb6f8damr6447901lfb.484.1655488221904;
        Fri, 17 Jun 2022 10:50:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y24-20020a199158000000b0047255d21128sm713399lfj.87.2022.06.17.10.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:50:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date:   Fri, 17 Jun 2022 20:50:18 +0300
Message-Id: <20220617175020.1080118-1-dmitry.baryshkov@linaro.org>
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

