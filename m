Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 490B76110B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiJ1MIZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiJ1MIY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:08:24 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2D91D3A7F
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:08:22 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id f7so1891675edc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/gtiEXD+8uUkkIaghTv4hrEKAMCKaLjc9YinjxqWWo=;
        b=QRdI1yDkxsMRbomr2xeVl1S3oGNYlV+7UkLhH0STOtOKyee85y7Ty6dnzGe1Da+lbq
         sfK0X4YQCtcNOm1hAwcMFaYmub6S7xhQ8nnXWbQv8eeTIFD2LrZQLAck/03ibM/D7Uff
         RG2H5t3snHFN0LHcC4G2YQywZz88HNuBldWSQLXmuV5hxdCXgD9RFK1nhXzGew2HPyr/
         fJV2YS+uwnyM6X3xvURArmYCef9b1kuK8e5ZBzmSA2WcpoiqFmZa51fUpR72XSZ78Nho
         ZVME3m3JtA2Bb0gAWGl0c5I/DXTy95tkyVOrVpkoszvA2lioFdAMiPWLDoWwaBj3/YkJ
         27Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/gtiEXD+8uUkkIaghTv4hrEKAMCKaLjc9YinjxqWWo=;
        b=hZ/4pV3oj6iYt+aEC8zgHtWQrydXRE+7fd0CnuJZq4yHYxPRRcEOXYlxC3jWDSAcZm
         EwaeFTl9bckc0eeqWFy4ccid5WY30YwG85qdhNvDf2CtbYcwwrzrVsCsuvIgIg1qCq46
         MQaJwB0RCnM/Xw3eY5TCDu0nidhlTihowKohCjRdjw0vn3pLWePNxjstS8ejB1lUhU4V
         sxyXvznLOVfgDN+oiifpqaAFgmX4ZqrYQXG1LwWRszQ7DyHsrJ28bg4eFR6ZZURUvwLg
         JctEx7ofCxEm0dux4k6CKlNqJKlK7ZOVhMxvCl8b+NOveRbWP1jo6T/j3Lfle03pGqpJ
         TT+g==
X-Gm-Message-State: ACrzQf1PQKK2mcLwg+gZkn2vZYLb8Q2SNEK+qdWQCwd4hX7GehRIV7uc
        vl9srFZ509ROC1Wk3lIQg8AZPA==
X-Google-Smtp-Source: AMsMyM5WUQDfutYRFNEgV8bjucY7YE+caWuR7DEIYmHISEEGI9x5oGJojJJ1t/FcKDzntjA7yyvUkg==
X-Received: by 2002:a05:6402:348b:b0:45c:b22b:c4a9 with SMTP id v11-20020a056402348b00b0045cb22bc4a9mr51712910edc.65.1666958902502;
        Fri, 28 Oct 2022 05:08:22 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:08:21 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        quic_kalyant@quicinc.com, swboyd@chromium.org,
        robert.foss@linaro.org, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, quic_vpolimer@quicinc.com,
        vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
        quic_jesszhan@quicinc.com
Subject: [PATCH v1 2/9] drm/msm/dpu: Refactor sc7280_pp location
Date:   Fri, 28 Oct 2022 14:08:05 +0200
Message-Id: <20221028120812.339100-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
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

The sc7280_pp declaration is not located by the other _pp
declarations, but rather hidden around the _merge_3d
declarations. Let's fix this to avoid confusion.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0239a811d5ec..d0ce7612fee8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1175,6 +1175,13 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 			-1),
 };
 
+static const struct dpu_pingpong_cfg sc7280_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+};
+
 static struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1198,13 +1205,6 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
 };
 
-static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
-};
-
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
-- 
2.34.1

