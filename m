Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E2154FC7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 19:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiFQRuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 13:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383434AbiFQRuZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 13:50:25 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EA84AE19
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:50:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w20so7979092lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
        b=CKvz/GriIH+hEOT15P8Uh4F/FUDSVlCSm+i9tRYV/fjdnz4TFyeW7fbrHm1fqOS7jJ
         HG2M8wmSY1plXlfrzBSUzbDQPRahn8RSMQLKJ0vt2tP1Bt5cW0dWc/0LQa+8VF5Qt9CS
         bb/6AgCcuWDr5IEMJ/1VJTh7yvJ6OJU5YAwYHCYPFeMCcCWA+J1RTgtnhzWQdB9JCydW
         CA+V1N03UNuuKakVylvMQzWdYb7hmk02hGsuqesjLPzfwGLWjaN/wqa/cb+a2cQ6A8yF
         59HhFhQPfdNQ4y+G2jF4OWG7yv/v/cP7AYqzej+PlJm3TjusswXr4oK6Aqv3YVCwNLk4
         ORlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
        b=Z4x7AaceINJQv4727Zhd8TYw3PbUITZ1824/TjXCyju/uzbSPMfjV+b5RWsMqMmXgy
         8mtro2OYOkmkxNWiXGeZ+uejWKKkMPkuGB91NYWg9CnYyIbAg1khWbjra9IRsS8OFIcH
         uaYhvv37bK49DIJ5DU0H9U/PPrkDs5X5pFeeWyn4x3OoVknoyz7U0Mn3n7aATQ6UxK8r
         FKo7FLs0kmOsXEoHsLYLDds9+EHwbSjH3aCrPAlmVVLuRR2RRNk9Ajz/TaFpeAvKDl84
         FPlgGzw7353zPL3EU8Ng02d4+Au7PiHKYKCgAkOXE5ZDGfLVlfgOVtWSCg47+il9GWuN
         UYDw==
X-Gm-Message-State: AJIora+OndLARgsbUFyDIM23WzPwsg2p89g7lSvhmbaoUvT1V5shxHTx
        zcHJuIzYWwT/qc6f/sAUvePGig==
X-Google-Smtp-Source: AGRyM1tZhFrKVRy9m5OskQvHdrD2PyFdD3h0DVSSQJE/IcEpF+CX33+qcx9o1UVkt07CxgaPADFeug==
X-Received: by 2002:a05:6512:108f:b0:479:48b0:b650 with SMTP id j15-20020a056512108f00b0047948b0b650mr6264516lfg.33.1655488222770;
        Fri, 17 Jun 2022 10:50:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y24-20020a199158000000b0047255d21128sm713399lfj.87.2022.06.17.10.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:50:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date:   Fri, 17 Jun 2022 20:50:19 +0300
Message-Id: <20220617175020.1080118-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617175020.1080118-1-dmitry.baryshkov@linaro.org>
References: <20220617175020.1080118-1-dmitry.baryshkov@linaro.org>
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

