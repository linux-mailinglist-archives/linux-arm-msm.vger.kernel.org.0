Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A97454FC8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiFQRzo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 13:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383258AbiFQRzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 13:55:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBEE4D6A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:55:42 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a2so8031268lfg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
        b=pFNBrgDNFMoKFY+eA39lRfdk74cdnJtBhZgaKF1GspL5uviGX9jw4u8XOb45LKZC5N
         JF83Q5vubro2ZJ8D4SHNC/FFmvtcWUBBAU9M9LV9zJQ9hHdPfv+rtf4Hku662gQktazG
         awRrRG21cnAutAgO7OS5HYjELHSEFNoFYGO9wabJ6+V2JyT5xP5GCpy/AUfOe7LWoJ0s
         2WxMY514oRbpiGtcQFw7Tq20GufXm9p1dpBmurLXrlpKBuHIYz5hsolaqLTXkPVUuCa/
         PY4GnMNsBYFnP3TRfYnp1L9kXybNWHn2ACBIxM67EX8OZRqxvChSQQqfHEQ+nwCxsxd7
         sm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ByYz0vZByrH5ZeGoDfGbZOJgTHhBJ8/LzLyyFMFujSk=;
        b=FetEpXs88r1NYDxpH8hmXfLGTGh4EtnmRHQtLpTErVtvaJlI165s2s9GPKbMk/mgsz
         rPunyvmpQwET49ho/Ug1KwLGfbR5d/Dod2lvWyYP80yArYpnpjbHhTu6R2lt45M7LcfL
         GsV8F77BGO2KWUjpdrT9XEthUSv+yRujI5YrwItWPKSJKqc08Kdcuq+jNZiKgAVRddu5
         sQYmSO+NVHBbG39Z9uv85PNUHbZwWFnVw4V00yjKWLLqcmESa585I492Uq0RTrkMyi/a
         C+8Ue2JVBhu0m5iqkMGALTHkJBYXW+wMhtn9oZoESD0C0t2kep32BaL8ryfeVdTzlbbz
         RQew==
X-Gm-Message-State: AJIora8ooyiJJUpbbhgkQXZLNb2yZu4pQTUKUxo3uoF4gx4O+/QmOhBq
        zyQzNv11Y0KIrd9m+uj8yvq2XQ==
X-Google-Smtp-Source: AGRyM1smkVEeZdqzeINbgdR4nuuAyiDE+8c3FrrmoTGdPTvnuqpIOglqUu7CpMHr4HJf/ynHxA/ZGw==
X-Received: by 2002:ac2:55a4:0:b0:47d:aab8:a67c with SMTP id y4-20020ac255a4000000b0047daab8a67cmr6136167lfg.301.1655488541357;
        Fri, 17 Jun 2022 10:55:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:55:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date:   Fri, 17 Jun 2022 20:55:37 +0300
Message-Id: <20220617175538.1080351-3-dmitry.baryshkov@linaro.org>
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

