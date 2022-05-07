Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECA5C51E2E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 03:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445135AbiEGBEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 21:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445137AbiEGBEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 21:04:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE61026105
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 18:00:48 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u23so9466305lfc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bbmCDtr+s7sU7U2DzR9HyFUOOK+AZ9mHXobR+YuUukY=;
        b=S4fWE6cToix3IrUwEdSdjlJMpkGe3zBnnhDbfNhBHfUc8NVYF1LCaE88zKEbaoTWBM
         6CCuMw5YY8m1o1WcBSAAfwqoLuFQo+VjhVAnVX/Wo/WAaFqw4siH1EZCjs6TKOGOCtPH
         IcoIEg+uQ02a0+OReTK2ewLOEbqj3eCkA0qgtCbKGhCI8h8zyvEAq3txhFE5zgOZA9t8
         06kbuCEnsyNCadgvKVgBrNS1MUD3i5UH/+uD8OtWmlB1iREu0KWsJI/PXrerd93SGEsW
         KR4hHcRbfi36fXFQkAKf0mRoWt8ehPkylUFeUuR/jIxcUvMyVCVIvJTY/Hy/uvnwd/mr
         IYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bbmCDtr+s7sU7U2DzR9HyFUOOK+AZ9mHXobR+YuUukY=;
        b=zkbVu8nkGZEgdka3wOA9bw4gtfhEAx08SS7vX3kRo1zqj+ccMYWF7Xv5Jx2vWVab9a
         a/fAnVLNE9VjCuDdJTXsoXGgYvbP1uyxSp1WPeYa6GVuWn5fj3YAEGyuH+nQhH60W48k
         ewaqYgUNFDcv1ZyLGm7d5hyC3XRe8zQL+1KV4U9nkFl9bzw/mIg0df7mFjU2fm+m510t
         /1h5nm9VPB29zx0DWgQqFAWxB7RAEF/Cg1DYFf3JSE89C8znoVLOjDV8W/wEC0/Potck
         AWwWwMM0rFx9L6QeBs41v/5TamlzXTBBk5d0H479496Uqmtk1Net0p0YKwyBJK5CbQUr
         0p3g==
X-Gm-Message-State: AOAM532x50T/iYVU2gYiCCRmylQJ9K0yVSNt4olg2wj7leIiHA3kPvfr
        TNOa/RNPZDNqwb9tK3KhbIkYRA==
X-Google-Smtp-Source: ABdhPJw4hX89GyYjec7dVISjZoAnB97kSOaFNSp9tHTSGNmwmxKLBjswpYqXoEiXK6CJvYmo+/JX9A==
X-Received: by 2002:a05:6512:3405:b0:473:a5e5:1659 with SMTP id i5-20020a056512340500b00473a5e51659mr4208479lfr.379.1651885247159;
        Fri, 06 May 2022 18:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m8-20020a0565120a8800b0047255d21123sm886335lfu.82.2022.05.06.18.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 18:00:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date:   Sat,  7 May 2022 04:00:44 +0300
Message-Id: <20220507010046.1667809-1-dmitry.baryshkov@linaro.org>
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
index 87675c162eea..62cc566756e8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -72,8 +72,7 @@ static irqreturn_t mdp4_irq(int irq, void *arg)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
@@ -84,9 +83,9 @@ static irqreturn_t mdp4_irq(int irq, void *arg)
 
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

