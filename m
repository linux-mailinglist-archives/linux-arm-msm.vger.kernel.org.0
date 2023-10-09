Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB6A7BE714
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 18:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377364AbjJIQ4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 12:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377781AbjJIQ4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 12:56:32 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C06FF4
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 09:56:30 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c008042211so56980171fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696870589; x=1697475389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l3esYtn//PnsByMSwFAnaxuSQ3nrpt/GZN9bsn/BnFw=;
        b=WN0eTuAQ3hHK6JXOEbTVzVIptfofU2wZUVZrG2sBStgoMxHs+239ie+NOfwx3IrVxT
         A+Hf6VEbGyk4vja1AFIherNgkWoOp4S5KeWlQGLvrlOVHHnHVWraheL+0PqNmIFVKver
         bdTw/jOupF/BJFfS+738ei/Avb+xEU8yiScJLHbF3GDTmXbdq6bGl+n3hMIUzRoIHilb
         F+FialVJi8vA4ZKHhNGFv+lZg34tEEafRuCWpIjxthdZh6rcOPfkrMbtwwK/mZ8brhzz
         ddizWR5buND4K2fO49viWJSJTe/IBV5fwnXVEBVYS00DyLLioSF4vptOMMWeteXnoY21
         ei6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870589; x=1697475389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3esYtn//PnsByMSwFAnaxuSQ3nrpt/GZN9bsn/BnFw=;
        b=oYaPh+ISaepsyTz7Pn1Q2abZzM6qU1eicTEcP5P1W9F8/Zhz0f2PLoSsfUXbsP8Yx2
         SltKm83l3Vc1RP4byi99AFRTEvJ06TWejoeDXx2cEujLYX7LNDE2EtaM32nILXragZGH
         MzV0lL+rM92GcGLxxN42naZj/A/T5NpgfaX4eCXK8/ovgib7MhUL8rR23dW634vq7Zo4
         IlE5curMhrtN9EtPmhtTPUocNwibayK1l0Rrpzm5DZO96DTOtws77HKFYVP4EtpF+zhP
         R7eg2fJ7E7XcghJgj2/96wGIvaqD3bHfp3JVA/BxnTQjjwkC/EOg24LgPLvsEus6Ze/i
         4p7Q==
X-Gm-Message-State: AOJu0YxEU6FovD6hBrSzwNiW3wUxdki072OTllMvt+nvkvEWpMyjbgHl
        Nrf3qk9WhZOaiGIwh235Ink25Q==
X-Google-Smtp-Source: AGHT+IEYWAqyPzIYDNNMvdW7a9MBQFdbT6yKNXJEZDsN4ESiPnBsb93D1lZ2HmsontdzpnW6DAxo0g==
X-Received: by 2002:a05:6512:3282:b0:501:b8dc:6c45 with SMTP id p2-20020a056512328200b00501b8dc6c45mr11414814lfe.18.1696870588821;
        Mon, 09 Oct 2023 09:56:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24257000000b0050420eff124sm1483407lfl.152.2023.10.09.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:56:28 -0700 (PDT)
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
Subject: [PATCH] drm/msm/dpu: enable SmartDMA on SM8450
Date:   Mon,  9 Oct 2023 19:56:27 +0300
Message-Id: <20231009165627.2691015-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Enable the SmartDMA / multirect support on the SM8450 platform to
support higher resoltion modes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 1b12178dfbca..d0214edcbb0e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SC7180_MASK_SDMA,
 		.sblk = &sm8250_vig_sblk_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SC7180_MASK_SDMA,
 		.sblk = &sm8250_vig_sblk_1,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SC7180_MASK_SDMA,
 		.sblk = &sm8250_vig_sblk_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x32c,
-		.features = VIG_SC7180_MASK,
+		.features = VIG_SC7180_MASK_SDMA,
 		.sblk = &sm8250_vig_sblk_3,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x32c,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &sdm845_dma_sblk_0,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x32c,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &sdm845_dma_sblk_1,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x32c,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &sdm845_dma_sblk_2,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x32c,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &sdm845_dma_sblk_3,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
-- 
2.39.2

