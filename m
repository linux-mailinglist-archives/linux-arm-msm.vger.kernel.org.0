Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9697F692CE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjBKCLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjBKCLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:22 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B0C7499F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:21 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id qw12so20249813ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tC8smASMYq63xSpQbKtrSp+tdzlAe8iUGu+97bMfkfk=;
        b=N6NQiLcX29/R4SzvnAJ27syJ22wy2ddvxeta24GTTte31zSP/GL/IMpHleStWPWT78
         aSnTeVUx0H7hiLWmeI7OmhP/ecsduWr41IaC9I3aQDOMRc7syZl3BrigFnNHrv5/qwI/
         YPNUW5ofrVZqYfHjNhOTT9HHPd3Kbd5B8EqLTHwdBwGPhFw+ZEsBeie/DlKaUM1aftmT
         i1pusciXS7RNLhdkd7ywf5tH12cjU4GWoAPQg5eRi1KuvRVCLjVhJOl+Ucr+I2YKmhiZ
         bvRbrM5qIKsUr9Fn/foqXlPqCeiB54avo+PaFiZ6391spYa+BnMVTim/45xxzkjOcbD6
         y/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tC8smASMYq63xSpQbKtrSp+tdzlAe8iUGu+97bMfkfk=;
        b=Gdq7gY0NJH7Cm+95i+ajjkPaJvXXx2fi4ON4mlyg3cQp3QRSp8ocRaYhhqQ0VSkJuD
         EyINk7DmrlC3H1gxH2+92bgR1Fq+JsCbR31+a5ASoOYOeGVYUzHgtijk4OnKRY/WyeEe
         gUjGUtm2RVPY/o1EpLZHgYptoK82Vst/5S8cjMcnieO2txP+bzhDTqOhClds55yrIasP
         4g0j8HJs7nIYuiw0u9lInCeKtx0Cd8uNRYqeL9OO63TRgnIOUx4gcpT1EuZnpIcGWU0P
         UZ3IjE89TOBv6A/yS/zHwNbxJLKTW42XxR5eR2dgcduIYBYEE9ucDKVlgFNikL53eMpk
         EvnQ==
X-Gm-Message-State: AO0yUKXEJ/FUqVjIDgEMbibA45rn41B7j4gJ4Urr1YGEmiN+Gct0NdNm
        JXShcHSp7w/ooQn+tgJPmZnqeg==
X-Google-Smtp-Source: AK7set8n2sVpsBzcvgTanvr6FdAaLyJCVdqNc9WJgor1dNZQSyLtWUYfIQIgWlXBaYr20TR9uROPEw==
X-Received: by 2002:a17:907:6e17:b0:8af:2af5:1191 with SMTP id sd23-20020a1709076e1700b008af2af51191mr11684529ejc.18.1676081481418;
        Fri, 10 Feb 2023 18:11:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 25/43] drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
Date:   Sat, 11 Feb 2023 04:10:35 +0200
Message-Id: <20230211021053.1078648-26-dmitry.baryshkov@linaro.org>
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

Fix typo if the name of the sblk structure for the sm8550's dma_sblk_5.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f8495cd723e9..2103ccfc22f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -103,7 +103,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, DMA_CURSOR_SDM845_MASK,
 		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, DMA_CURSOR_SDM845_MASK,
-		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
+		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
 static const struct dpu_lm_cfg sm8550_lm[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b979d06f8180..ff507acc6ff6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -432,7 +432,7 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
-static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
 				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
-- 
2.39.1

