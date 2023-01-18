Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3D4671083
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjARCFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjARCE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:04:59 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D8D227A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:04:58 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id vw16so16681630ejc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=he4t6UJ6QSC3T1Ti+edP9oNYIydk/RBUqrKCOvss08s=;
        b=xce0Etiznc2C6Eny9wmN+993oebbBhdy1plEpT2xNLnwgtbjQZK+uycwOWloLFB7pK
         wu7FqZeXywddXrUOKuNQ1BgSWUzIBJkVNqMIfj+F6L+OIiZR1Dkv9TU4ZkXkp2qJpQUG
         0c3cJT6rXaJFNfFEiok2W0vMHx0VsjcSuNvJyGP79tZxHfh/k1K+uHpL6a+L9XwXOHe0
         H8ht6TBFkbYEMfnjNH4knTXSL6pMxnZKLsHWb5M3j1vqpcdVqdIdCbRdivMvf6YWO/N5
         EoRgTtlLQ04o+Rn4+EyewyAw240nZ1/gbpHRFhyWAZzPyHeA7V4cMT6KHDTLbgZ9yQ4k
         aymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=he4t6UJ6QSC3T1Ti+edP9oNYIydk/RBUqrKCOvss08s=;
        b=rR8HmZCCI5F4g7HAZzUbf5Slqlh7xDS8H/HELb77qaLxWWthv1jFXRDjKz8PSTsraf
         EQKaEVPfUM6pb5kUlcl7XkGvckxR0Wra0BYqZKgQvQRxMjVNboED1C2+J16EcWi/fWDQ
         SbWnHapCx//OLc4KQ6CBLEc/v/0raxszrdW1Qo431m9NU6jvBwJfjWCIRdcswdvrhO9X
         K5LjFyD4fZq4omGC++ApgHN+j1UhlnTVN58Tg91m1T3qOXBuY+WjN6eEa7FXp++rNzNx
         ZdA1IWb/htCFArMFnYrLQzkzKcpSX4PfbCppgzHox/yToVPhlfGNMTBVLLMTmFQLa5yE
         5tjw==
X-Gm-Message-State: AFqh2kqT2LswSWxwtvrg4cOzr7AB9DIJiTk8wZX5wzUhemgT81/d2/Fq
        uQVJVEXoHUZEUVLBZHckjRgnDQ==
X-Google-Smtp-Source: AMrXdXvYeU4WMbqNwPwG88LxBwDVokGmvq+fYzLUh89sDzdLlSJb7AUBKwbrSeWY9hSa7ogjHyTA3g==
X-Received: by 2002:a17:906:3f87:b0:809:c1f4:ea09 with SMTP id b7-20020a1709063f8700b00809c1f4ea09mr4827344ejj.69.1674007496895;
        Tue, 17 Jan 2023 18:04:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx4-20020a170907774400b007c10d47e748sm13836459ejc.36.2023.01.17.18.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:04:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: point sc8280xp_dpu_cfg to sc8280xp_regdma
Date:   Wed, 18 Jan 2023 04:04:54 +0200
Message-Id: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC8280XP configuration missed the reg_dma configuration. We do not use
regdma for now, but let's put the correct pointer anyway.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4375e72a9aab..3d0fbc1746e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2680,6 +2680,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
 	.mdss_irqs = IRQ_SC8280XP_MASK,
 };
-- 
2.39.0

