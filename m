Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A75692CEA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjBKCLZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBKCLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:23 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB48073942
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:22 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id dr8so20122265ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL2edqo6KDYx6sYRiaj4UMh7ljorLtIgUzS84s66Pvs=;
        b=syji7ogZFBwzTLInBmVuGWKr0ndydMVQXekoAx51PsekZCZUTi4msTK0WYB25BxyUo
         2TMtpy9rbjD6Ls50h9ELF0WKBeszljaHxpTEzZhs0PnwF/eCl4lIxcteKKtUuhkUCBMM
         3XxEDOu8MQAdD4tDAYpEBbRszaWn+6BipsEN5csCbYukMDR4ODugs9QoxT37XAEx2tQ8
         0cYyRuKWSMeqMiIITv5cPlYTWufeSgHeifMaCdqpHdvsHOKe8U9C412EIeCIm9Q7U3J8
         fpX72Z2+gwLVkYBRzWs/K9unUgQTc2xDESXzyO4y8Jw0mr5zuMwMaCfpagG/EBaQp504
         u5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL2edqo6KDYx6sYRiaj4UMh7ljorLtIgUzS84s66Pvs=;
        b=xnSHwSq/qDqD57gxgvtg+IK09iz/Ahj5BS32c1Vq1zW8M3ohX0ilrSBa738dfIqG8h
         X1QtbOMqVR8wtYxfQSsa3iKu3qPF6KhG71ZXmVGno9ozYXLdCzH8JZYIQLfqn2ceSqis
         wdaDMcRuaMvmViUoEScVwbA8/FVzlC0Mf9AJE6ZCj+SQysN2M6Xny8pEs7ijUGIFKK6H
         9CjQagf8JofiNf2zAlLgC0h9Ihz6TqPS0PMO4imbdRrhvgsxmi65ucqDCJ9dc5rnoAD6
         joPxURj9z+vaR8oPCZorjsG7fac03F8JnJ3dRcLudGdagZvSM5RoVIww9BssZ/DZVRT+
         blig==
X-Gm-Message-State: AO0yUKWQucl1qi3YlitXFGhzpqJOD+JYvxSTNkjKgOLqmtgMMWmTqJYT
        nAtYygy2Oj9u/GhoyPAiXNc5RQ==
X-Google-Smtp-Source: AK7set8fLKeN5SoZcBxnITXcJ2zjFAvYtTaQt5TQL5NMB31kq4UDrcrQxQAHgwQ+ED0xNB7wyIh1cw==
X-Received: by 2002:a17:907:62a1:b0:86f:64bb:47eb with SMTP id nd33-20020a17090762a100b0086f64bb47ebmr24553481ejc.3.1676081482536;
        Fri, 10 Feb 2023 18:11:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 26/43] drm/msm/dpu: correct sm8550 scaler
Date:   Sat, 11 Feb 2023 04:10:36 +0200
Message-Id: <20230211021053.1078648-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm8550. Fix the DPU caps structure and used feature masks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 2103ccfc22f0..8a81ce0cc0ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -10,7 +10,7 @@
 static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ff507acc6ff6..48ee66f52ddc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -424,13 +424,13 @@ static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
-- 
2.39.1

