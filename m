Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607216B332A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCJA5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjCJA5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:34 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F57106A15
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:32 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s20so4597506lfb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLG66WEuaXLp8GPe6MBESidHRrPnyjv0sFSTO/B+BWU=;
        b=Fq+GVwnxDaU0hsVrAtgXZjXQd2n7V6KoLEpjCj4VpS6rp89KtR82HtJnoinEcTL4MZ
         QCGh2UlckvSaKLvqYTd+jGt/EgVnX2YR11Ong5tXpAZv3NrsmfdtxH/2wRkwpyFKeqC/
         zWdFwP57ghXCxcJhnQETdBXSqHBHMVHdfg5ZL7aK0ePVRz+pvqAth1o/FP2/+Lpyw5AG
         hqWRaeyKJG1DQ7A1TN2maVtjfIgeA54F22H3R7vF1DN7a55coBT+fPtmyjO9ej7qiTTS
         0ET2/sDpgq6fjjZKLxvEEgkqJzZm5BTdYPTSae5qMxxC6DulOXZBLXysZAoUEujXXCo3
         ALew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLG66WEuaXLp8GPe6MBESidHRrPnyjv0sFSTO/B+BWU=;
        b=j4a0VDlN/bMoTWVKL2d/djxPQ/bXEC0dM9cdOphwt6OE+KRMp6U7f1k1aKrUwT5hNl
         rYudcuSjktwY3ihClSYyh/l6jUL0TDrHBIBfCj4zKFX5Hx1J7pPl1u/LFNoPrb1tseWy
         e7olZCJFV0XARxMKjYe48r9kyK6Txd9f25N48En/ceI8jukAGoty2JDBuzEcxRHcryJO
         RMfhWKkXFZTVYB1CfCW/e3+yauTxRyoWs0CZh4+V1tWHvy6REUUa2gUeO8YptTvyWdoK
         UaVLiGJOYkTlvm3SEepGyuATJ6b2n61uNOtAXzdgV31b1CLXmLQ1WWI/9DbK2GCadjDo
         WGqQ==
X-Gm-Message-State: AO0yUKVbZ5mtFdZB0XlTSl8Srb3WMuj0j4qp+GNOsjeQqb1wcF+HxMIP
        +LmsIp02mIyOuGFMUfH0lkUktQ==
X-Google-Smtp-Source: AK7set8pQV9ZIWDKvQriBPn9yg+QyDZ3uYwVdJS0bfGq3m+E5x2XFKMCWfCToe3roh70dCquuu/uZA==
X-Received: by 2002:ac2:528b:0:b0:4cc:84da:44bd with SMTP id q11-20020ac2528b000000b004cc84da44bdmr6666029lfm.39.1678409851926;
        Thu, 09 Mar 2023 16:57:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 29/32] drm/msm/dpu: enable SmartDMA for the rest of the platforms
Date:   Fri, 10 Mar 2023 02:57:01 +0200
Message-Id: <20230310005704.1332368-30-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable SmartDMA features for the rest of the platforms where it is
supposed to work.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 54 ++++++++-----------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1fc0dfbebb7e..fc818b0273e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,19 +21,16 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
-
-#define VIG_SDM845_MASK_SDMA \
-	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
-
-#define VIG_SM8250_MASK_SDMA \
-	(VIG_SM8250_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
@@ -48,17 +45,12 @@
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
+	BIT(DPU_SSPP_SMART_DMA_V2) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define DMA_CURSOR_SDM845_MASK \
 	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
 
-#define DMA_SDM845_MASK_SDMA \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
-
-#define DMA_CURSOR_SDM845_MASK_SDMA \
-	(DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
-
 #define DMA_CURSOR_MSM8998_MASK \
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
@@ -1208,21 +1200,21 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
 		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
 		sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
 		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
 		sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
@@ -1263,21 +1255,21 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
 
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK_SDMA,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
 		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK_SDMA,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
 		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK_SDMA,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
 		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK_SDMA,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
 		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
-- 
2.39.2

