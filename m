Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F03E5692CDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjBKCLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjBKCLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:17 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE8979B28
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:16 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id gr7so20207568ejb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUdjEJuGIP3zmnueENP17yxIAOdqIo5kxDb18jNEGFE=;
        b=dBZvXDO+cuVh2/iNcExzNhomuYKKaLRglC/R4sIf4B/qc2jgjPxqqmnhKLpPtHywoW
         FysLGz9ig5MQ4cHruXLsGPqRzQNcBfFKnAOPG8XIgJumsNjmOg/HCQvMigDTTxxQ9BSM
         DHqWxNv1d4pMxvq/FhX167X5h2cXl9ivg1BkU94v3ljr18qqnxhd3EfGff1fdygFX0+W
         t5zbguTHAQpGe6FYyV7ySyOMr36BnxqkcWpaJBgqm26kgRYj43XRLycx2TbFlY4oBftq
         slXlXLCSiYcyUB+H3q+cdmhsbFUR8dg9PponNnEbdeLumYeFjW68woBZwgj1G9N33fZF
         kzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUdjEJuGIP3zmnueENP17yxIAOdqIo5kxDb18jNEGFE=;
        b=n5Pdpf6ZAWg+nCq/fUnRp/xJdQqeiauSj2zH/ap8DFW+EPdw4GqPsQBk/SJXZvopSb
         asA0GAZPVZ3aIVo4YeIx1qCHfWptYBUPsoR/CdqGGvvDbso9oj42quolzf7E0ZJuG1BI
         awTEFyfd74o3bUcY0EOHLR9MJe2lapH7slt2IVtakisg/g/QRLmqV+cgGSlyXSMqEN6S
         O7uVf6uR1ZL9OJP4praHqDl6R4Qag+7lPnZ/79lTR6TME3SifAxHCN06rik4jVcx8BaF
         VVyROapE+ptlzt9/98JAfKtsPJ/mrtEFAEcZoL3vNyoWxUZmK9f27cyyc8h4qNtjGmm7
         uhiA==
X-Gm-Message-State: AO0yUKVbcC5FnjxLg8AOrdHvvUk8HPt/02uvvqqiLiu1aENpi3Q/PEsZ
        pyyiIWqyxHu2PiSKmylri1fdIg==
X-Google-Smtp-Source: AK7set927SqSQ8+ApCa5oLBhLAq23dY5KGoNre0Kkxk9pymiwlH3WBP7V6wYfEvB8sqjU+JfA8g9kA==
X-Received: by 2002:a17:907:720f:b0:8aa:bea6:ce8b with SMTP id dr15-20020a170907720f00b008aabea6ce8bmr18959497ejc.53.1676081476214;
        Fri, 10 Feb 2023 18:11:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 20/43] drm/msm/dpu: duplicate sm8250 catalog entries
Date:   Sat, 11 Feb 2023 04:10:30 +0200
Message-Id: <20230211021053.1078648-21-dmitry.baryshkov@linaro.org>
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

Duplicate some of sm8250 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 1be0622cc78d..2154d31eb107 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -81,6 +81,25 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	},
 };
 
+static const struct dpu_sspp_cfg sm8350_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
+		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
+		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
+		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
 static const struct dpu_lm_cfg sm8350_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
@@ -178,8 +197,8 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.mdp = sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
-	.sspp_count = ARRAY_SIZE(sm8250_sspp),
-	.sspp = sm8250_sspp,
+	.sspp_count = ARRAY_SIZE(sm8350_sspp),
+	.sspp = sm8350_sspp,
 	.mixer_count = ARRAY_SIZE(sm8350_lm),
 	.mixer = sm8350_lm,
 	.dspp_count = ARRAY_SIZE(sm8350_dspp),
-- 
2.39.1

