Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2EC7677B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 23:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbjG1Vdo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 17:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbjG1Vdn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 17:33:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228E244B0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fba86f069bso4425198e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690580012; x=1691184812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx2RpKD/I01eO5CT35reZoOMEgApWpiIpC+vQpwHVcI=;
        b=oZe9MPO63fYpQrpSVlsXK/PHCxZdnNgrTy/v7nCfQHVl/uY+Xy95+UvGXJzVGBwkXh
         dX8o/1GX8EOECZcTYOlWHl/plCPxt3yQgrhvi823KNm2BEwyFpIrI8l9ihlIrpnw/FLP
         05gTkXKIvcUTEaKx+UPc/3jSmoNtRqU9rfELH4gqJHDYMPlk0LGtTHVjGNyOZTvo2C4e
         LhMLjBrbapwrknBfMAe+apa1rO9SBv1GrJxJquw3gcUJBhkc7bbT3+/2WMl414H84A8W
         kFVRLC50W1pbFz34O9rzA3GSCmLu9FcPfbTbFVSGieCHbGQelqZfU2GGjtFH8o9HsDCl
         KO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690580012; x=1691184812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tx2RpKD/I01eO5CT35reZoOMEgApWpiIpC+vQpwHVcI=;
        b=Pt6f+2nKVVEepsALp/8Buphl0RV4L4OyEi4Z02W4TmQMVBL76bSHYUMHmtXFjZ365M
         lQC1Slr05lkPZeVo9/HhATfec6rEH07qSVc74jb2eyOueRf53y0rAls87cs+hjajiJaa
         +KpirIjkcTSLrfg8PUgiwwYWnXIZDHBOLSjbd6f7ztCEPl8ooKP3qNX6kc0JSlCUrMJ1
         LCQ/XqlrIuapiwyQ1vdW5+Xr9MGyqKdpxpxs1D7gUrAcs+yTUvzFKNDKeH6HIBcyVXOK
         LgHZZLRl8y+lUSN6p1b4JTl0iKThptSuOGmZEiFKsKBcYdlS+KBH+ZC5JT1b5zd+zC3M
         AfZw==
X-Gm-Message-State: ABy/qLboItZcXOmDv8j86zEfI+QB7NwfF4+4xG1KbS9VqX1AkVzQzs1c
        Z6Tc4dMyPxd8bj2Vm4Dtf7X5rg==
X-Google-Smtp-Source: APBJJlFrDnMF7MUYSEK8kqgYUshR7olGt7XfXwiuljMDEEHN5nPcBN4uOwFbFKUhecTRWEShytcJIQ==
X-Received: by 2002:a19:9158:0:b0:4fe:599:5684 with SMTP id y24-20020a199158000000b004fe05995684mr2347479lfj.34.1690580012329;
        Fri, 28 Jul 2023 14:33:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:33:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/msm/dpu: drop BWC features from DPU_MDP_foo namespace
Date:   Sat, 29 Jul 2023 00:33:20 +0300
Message-Id: <20230728213320.97309-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The feature bits DPU_MDP_BWC, DPU_MDP_UBWC_1_0, and DPU_MDP_UBWC_1_5 are
not used by the driver, drop them completely as a followup cleanup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5c21782b2231..a5389e7759f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -32,10 +32,6 @@
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_BWC,           MDSS HW supports Bandwidth compression.
- * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
- *                         compression initial revision
- * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
  * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
  *			   in a failure
  * @DPU_MDP_VSYNC_SEL      Enables vsync source selection via MDP_VSYNC_SEL register
@@ -46,9 +42,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_BWC,
-	DPU_MDP_UBWC_1_0,
-	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_VSYNC_SEL,
-- 
2.39.2

