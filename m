Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508EB6DBE3C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Apr 2023 03:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjDIBNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Apr 2023 21:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDIBNd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Apr 2023 21:13:33 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8985580
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Apr 2023 18:13:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z8so4389883lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Apr 2023 18:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681002810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbjQ0WKEphE5FlH/qtxRkisOHTrSOYqQhF4V+6PLF/o=;
        b=KfKODSPUnurWBVCHTVVPBCpWP/e9YxbsNXve8JNnpFUHWyxjo0lR6EJzEWT5as0YHM
         lHvUmSb7pN+InOrMQZ9gCS99QsiCiWVs48h58Udd2a4vgqCK1Ga4HOrn3x+MDLatxHcj
         ZlU1MzL5SCwQhdTAn89wv1fkecFvJzoFw0YFEwYDgFKrxZXZCjOSpHkRgmqKwvK4Go+C
         STD+I7MdMyEW9vKUEOuEEDlBBcArTCaF0QQQNG/ft6NZn9dJjoR+JcjUcmfCLYBn34UC
         sUO31116v4XcvODBzZdg8ixGBFhnhnafAPgkdq4vXTRszCeOLOUa3wmGcGQn0ZhrPN0/
         /aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681002810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbjQ0WKEphE5FlH/qtxRkisOHTrSOYqQhF4V+6PLF/o=;
        b=DQitxYiMxZGjFzQ3kSldJQpMFY3cMa+sKd3BZ2a1zCthuhqAXHTZnUNBvyZNWumU5n
         dcJz/HVgiMkX6FD7QG0hiHF1UPtSZ+DKAhB8Dp1LF4kl17WLQfZjqQ1bKWEebGFhz3dO
         SHBoiiKKhg5mqhnrvUKPOC3TXCTN4wasRpNgsDsICMhcC3c6m/dXuiOFfaLtV5asUEBQ
         8jrAG/Ms8sM795VCKvlHtTnPoEciyfMz9BZCjo9mF0TBg1w86nPSpYHXncNXrFTNS6bn
         qFUv+po55vSNOyv9nU/W52YbTqrwjHrcQPcxBbNduf2mJBiUMUN7cS1sytU1T44QVS5J
         jn/w==
X-Gm-Message-State: AAQBX9fhu/iP6rgJ9xHsYEDXEdjeNW0TWcqSdcv4SE3zlBmrSRUOh4SI
        EyTCgQ+5JGiU/K+4fpv0hMvKZQ==
X-Google-Smtp-Source: AKy350Ykxuwz5RwN/KYGVrdZATEgGYWrGy2cC6FLUroM05rMoGs/UwHy4fk/Pv406T3tTYKZWvTv0g==
X-Received: by 2002:ac2:5097:0:b0:4eb:401e:1b76 with SMTP id f23-20020ac25097000000b004eb401e1b76mr1925852lfm.52.1681002810675;
        Sat, 08 Apr 2023 18:13:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f8-20020ac25328000000b004eaf2291dcdsm1379210lfh.102.2023.04.08.18.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 18:13:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Adam Skladowski <a39.skl@gmail.com>
Subject: [RFC PATCH] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
Date:   Sun,  9 Apr 2023 04:13:29 +0300
Message-Id: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
510") added special handling for a510 (this SKU doesn't seem to support
preemption, so the driver should clamp nr_rings to 1). However the
gpu->revn is not yet set (it is set later, in adreno_gpu_init()) and
thus the condition is always false. Check config->rev instead.

Fixes: 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno 510")
Reported-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 1e8d2982d603..a99310b68793 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1743,6 +1743,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1769,7 +1770,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	nr_rings = 4;
 
-	if (adreno_is_a510(adreno_gpu))
+	if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
 		nr_rings = 1;
 
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);
-- 
2.30.2

