Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB3E74674A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 04:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjGDCVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 22:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjGDCVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 22:21:43 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD36E64
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 19:21:40 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b5e7dba43cso81476521fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 19:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688437299; x=1691029299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMXp85f1NZTXlzy+fVJwOuaMB1PFHLqxWNbVShZN4Xk=;
        b=ZU9ujTlWOmrWGBgjqmf0fuRdSL+fllRyI2fgRHIJfIWxyeTwi7vcdnwqgQ5wiB6JYU
         WDkFoWwz0IFc3RKeLUPJ9baE1uTS/CGTMo9AiGDfDMqFt40kyLTZxEdn+1F6JUWnVw8W
         vQmRHpz6IVXXqXDTSgAzXx2gQB0P2HBDayFxbXIOzih3FJ3xstq6ErevHqnEYX6j7u+B
         6YMSXiAcDU+wEUjdM6y7W2RX9H30B/KTB+ydmfqsnhBSiGypcMgRJ+W08qdlSdgfBKm+
         oLnFf1jZQECc5tqQaLJHk2IrMTUt4cgscCUN9byemkvR29zB1OdlDWyVZhJHG0naEvut
         SDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437299; x=1691029299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMXp85f1NZTXlzy+fVJwOuaMB1PFHLqxWNbVShZN4Xk=;
        b=KHG/blhgpytXZve3WfwHfDhJkHooeLI2aWZLYSUNTRXQvnKeEwAQMvOKI6yoJe4a3P
         2H+CgxwdJ2xV3zghOWZ2gZRIuCRvUwxkjX1j1KRG0XnWmlm3d3mvS+LavZj2NQCh4s3j
         FO/NK/jCPMQtVTrx5AvI+cFEYc11V1cKmjThoA5IhWsk6mVsNKxU8YJbZWlySIzMvJ4Y
         p5iW0NQ4HV4hax1WtjIfKp8IhfKlPl3Git7DHErtSg1kZqtff1cUqpZbWLzNKLDNojzw
         AeoJE9D3+wFz7bb0o7fiscSkPIpN3j9IJc/ySk9P06iDbULyY13RxQl8E22sKHfAyoUD
         WUpw==
X-Gm-Message-State: ABy/qLabvl0it6AcSG1pLx2i3nw6HZxbLtQpJvbkMSmI5J4LJwhnBdjV
        XIfMJ8zlrEafkUUxd/pVime62Q==
X-Google-Smtp-Source: APBJJlHakNrx6XC5im/E06txrG9JpDXHRTsSoNTjCM0wGf9QGezADimxfP862dj2gY3272FRlnrJWg==
X-Received: by 2002:a2e:86c3:0:b0:2b6:a65f:729d with SMTP id n3-20020a2e86c3000000b002b6a65f729dmr7551363ljj.13.1688437298800;
        Mon, 03 Jul 2023 19:21:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 19:21:38 -0700 (PDT)
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
Subject: [PATCH v5 02/19] drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
Date:   Tue,  4 Jul 2023 05:21:19 +0300
Message-Id: <20230704022136.130522-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
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

In several catalog entries we did not use existing MSM_DP_CONTROLLER_n
constants. Fill them in. Also use freshly defined MSM_DSI_CONTROLLER_n
for DSI interfaces.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
 15 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 7d0d0e74c3b0..be0514bf27ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -139,13 +139,13 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 };
 
 static const struct dpu_intf_cfg msm8998_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 21, INTF_SDM845_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 21, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 21, INTF_SDM845_MASK,
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 21, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 21, INTF_SDM845_MASK,
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 21, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
 	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 21, INTF_SDM845_MASK,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index b6098141bb9b..b33472625fcb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -143,16 +143,16 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK,
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
-	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK,
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK,
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SDM845_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index b5f751354267..64ed10da1b73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -162,18 +162,18 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 8ed2b263c5ea..6ae1f6f67ec8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -166,11 +166,11 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index daebd2170041..48c97e9f8a45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -163,18 +163,18 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm8250_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
-	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 67566b07195a..00366f7fe969 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -92,7 +92,7 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 031fc8dae3c6..8688f09dd560 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -66,7 +66,7 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 06eba23b0236..2bb2346d27a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -102,10 +102,10 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm6350_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 35, INTF_SC7180_MASK,
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 35, INTF_SC7180_MASK,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 35, INTF_SC7180_MASK,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index f2808098af39..d106ff28372d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -63,7 +63,7 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 241fa6746674..842ea5bcbe16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -71,7 +71,7 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm6375_intf[] = {
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7180_MASK,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8da424eaee6a..8fa9d83a539d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -169,11 +169,11 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 900fee410e11..2862c64bbc3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -116,7 +116,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index f6ce6b090f71..520b210e8c0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -161,11 +161,11 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 8d13c369213c..b782603642f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -177,11 +177,11 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f17b9a7fee85..025a149bab97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -181,11 +181,11 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
-	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
 			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
-	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
+	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
 			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
-- 
2.39.2

