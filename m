Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44EB351E2E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 03:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445136AbiEGBEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 21:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445139AbiEGBEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 21:04:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5122D1F7
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 18:00:49 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c15so11043716ljr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 18:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zsynBbueSToYzX5WMMz7SkW3IlbctHxAF7JF9/2O4nY=;
        b=WAdHJaX982/fR1DGH3s8YtXLo96nhQCg98G0gDgIU1fZstmx5WubyFH8Yc8lKr6PyD
         sAuirokaBXI9YZ3GlCsAGotxOP9w7gyc4IbQXIkvLYQMf+nXF16Lku3G9wRoKf1d96H8
         IMSOnL3iN9DGaiK+ABvkIF2Dc4zBe6cl1ms/Bi1BbZ8PyC2kWqfcp/1/xzM3a+u1cwLO
         SxT9NIfjSIIHWFu76CwtLpbJ+j6yAWnHiQrZhk0HxXNbOirvB5ntWuIamPHDzdKXLcuR
         cv60RMMfH3lVSfqb1iI/qNHFp5v+UpxZlXG4oOBhngcpd3mYC9AbV9phBzNpVOAUH4ok
         +ZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zsynBbueSToYzX5WMMz7SkW3IlbctHxAF7JF9/2O4nY=;
        b=nRp7Pjvjs/bfcEBc8TNzorTyXcIHRSW85crY2AoIP0qGeAQYJVwK+28EZUaH1RaC3l
         6bhdMYliIEDNCW1x5QfpLv1fLiej2K9ZIF1BiTHNqJQ8VgCEWfmRF1lQw7e7pM3gBwQD
         nOn2Q1wf3c90I7gaqYE8RXDjhspnVNsFO5UZfJKMetj8zobP9R38ZDW+0SRR08YdVoHx
         t7p0nVEl0pxMpKFPXOvoL2vAwCZgxOtoCUdaY7+jFWjsak3vZ6M+wlXRONKQUp0WCpn0
         t5ZzQiPqhZ2meUt8+dOavp098/ZE5mruyM2LWgAs+iNYQAs+tWpTaJXDMDvwVzGxEtBW
         P0KA==
X-Gm-Message-State: AOAM533pkciQOpviQXpogO6rKWQE2Ds3k/yoNqFtrtQMWjwoMCtc7LLd
        zDWwxXT/66mit9xJrs/gRMZKoA==
X-Google-Smtp-Source: ABdhPJypb/gJ6z2lXz/aRu6eSZL+QrLD7NYp78yWw0SrcxAm8OzLPDD40inSRGuwO9m05QLRoNniSg==
X-Received: by 2002:a2e:9e03:0:b0:24f:153c:c479 with SMTP id e3-20020a2e9e03000000b0024f153cc479mr3740299ljk.13.1651885247869;
        Fri, 06 May 2022 18:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m8-20020a0565120a8800b0047255d21123sm886335lfu.82.2022.05.06.18.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 18:00:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date:   Sat,  7 May 2022 04:00:45 +0300
Message-Id: <20220507010046.1667809-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
References: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index d573ff29d5a4..18cc62f1e7ec 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -85,8 +85,7 @@ static irqreturn_t mdp5_irq(int irq, void *arg)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp5_read(mdp5_kms, REG_MDP5_INTR_EN);
@@ -97,9 +96,9 @@ static irqreturn_t mdp5_irq(int irq, void *arg)
 
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

