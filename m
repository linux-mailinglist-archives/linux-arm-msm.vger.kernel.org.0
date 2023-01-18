Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B99E671084
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjARCFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjARCFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:05:00 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8B4265AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:04:59 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id u19so79770337ejm.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmFljcxneeNo8UiA4f7/Tuyz9l2ONU+PVcYO5MlNZtw=;
        b=TzQ1sMwB1RC9DxUo+AdAxkjIchDRZWROV8NmIYXgAIIm8tGAc+WZF8v7f+SI7u8QZ0
         Fw5IC5+qfNsgpSfSztb5oRoMtmORO249BvgasoG1V2PrHf+OCl+LUGX5K7Cbt/1bmuGx
         qIkfQOTY/xHZFFiSE765QXxPbHXnNysp7kftsNWlsx1htxxk9pHxi7VFgT1U3AvjLidJ
         bziVaQlZSweEy4woXQ2c8gmJsvceZpBcpcPDyw+tVNjnXFnWR47AvYkFhVnCQFXMuHF+
         pmp0xi6vaiuM12lj4EgY3vfiwFAjH8K26Ak76Hf8KU/MOzt7e6ikMLPF2AKxsyppOfgO
         YTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmFljcxneeNo8UiA4f7/Tuyz9l2ONU+PVcYO5MlNZtw=;
        b=lC07OyghXF6Qtsbk1iBBymGEG77+3sWtM9sCjZJnYOOnbfeAsQAKazryffqR5uq1MZ
         WKLgcpUf8JpyOSA9IhEfH5t6hgrToAl0ZGAgo7URGtjzdM/vDAUDrbcJ2t/u+3Eb/Jh1
         q4o1IVtp1/q4P80h5S4Hn2/ke60O8DUPzaLlGYzO6yXXyAomM1W+5wxE3tI7+p/po9dl
         zuaJRwcXY4D+qP6Dfs8+dkT3OX48JZ+mM9pSkdnUaVgNrb//9Qxd7cBf+VsqADf/70Kh
         5xCoYzLYmK1W1dqTbQmw0oNwn2R47FT9cLYxHHx4dXlfDVGGwlXQc4yn8aAcnsvHuhk7
         wxBg==
X-Gm-Message-State: AFqh2kpopJGl+wuRDR72fOIATATrBktFWWwXoSy05gL9qZK/l/0Uhw3r
        1fX02tcbE7zJwEBgh2mYI2WiGg==
X-Google-Smtp-Source: AMrXdXtiEWdKiTBtULSL3zbwnQKxj2N+QGGIq/7/7UHhlqWC8yXA9vnF78LmQUIn8hmcExxnmd+/8A==
X-Received: by 2002:a17:907:9885:b0:870:7340:b770 with SMTP id ja5-20020a170907988500b008707340b770mr5118885ejc.54.1674007497848;
        Tue, 17 Jan 2023 18:04:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx4-20020a170907774400b007c10d47e748sm13836459ejc.36.2023.01.17.18.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:04:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: use sm8350_regdma on SM8350 platform
Date:   Wed, 18 Jan 2023 04:04:55 +0200
Message-Id: <20230118020455.1689929-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
References: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
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

Correct sm8350_dpu_cfg.dma_cfg to point to sm8350_regdma rather than
sm8250_regdma.

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3d0fbc1746e2..e6618e678384 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2737,7 +2737,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.reg_dma_count = 1,
-	.dma_cfg = &sm8250_regdma,
+	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
 	.mdss_irqs = IRQ_SM8350_MASK,
 };
-- 
2.39.0

