Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A785D645C98
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 15:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiLGO3N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 09:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiLGO2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 09:28:53 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A600A578E1
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 06:28:39 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id cf42so23169656lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUFmlTkaTeb2gUSJldujrB4KJISeaHLq+47OfG+Sb0g=;
        b=Lpy+WJM+yODekgzWzTxmrM1ACtNvsx0v+grZNUAV+beM/Yrumue3bBOm2ONS6c2j0A
         iVqBdlPYC6wCOt6HeADL8fWlyyl0yX8iPtu6ssltQzn7Tc4Oug6BHy/rXBlJm8Dt13Ve
         1C6SCt803MKb81d39YyT49WiAlT/FbUKVuUN3APVvdMBF9xwc6Yoyo812NgcZIC0IWGo
         4luRJaAq8ejSDr+Yg/8aUZZYtOHlYiY0c+aMRWc48NB8p8CPb8qKF9DBoU9Spu+zKhE+
         ecznS8Mx7R2CSLwl9dAoJ3TYxbf1/PNxnuFoD++KAXvqD+EIcQNV1QMqWp9OIkPZ9S38
         K0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUFmlTkaTeb2gUSJldujrB4KJISeaHLq+47OfG+Sb0g=;
        b=5y1gIx6NX5yK0EG/bz/P/JTcnUECqyGfWLn/aCJOLPvBoAagnf904gOW4CLWax3247
         yfC0Igz8cKYij3yrT0C/aldPIEdwl7jLYj9fiFKiBqCkj+zxGnMam/SdNE8dy9WHzZZb
         7SDn3+2AOucLUky8CiTyo1A3ffkcOvkR1BaIyfpmJ9voA0rtBc7mq1Ci7mAxYe8D/ad5
         /+3FupXMQWvxvtCgyhrlx4CpEldHXSdP6WZ/fS6DhxG0NbOR6PAxoPAcr8K0YcSypyWy
         pgMt6nh6RUmfFt/cSDvhf9QpFMEAcoh7pJIjNdwZkF2sn5xTuFjOQq03hfa7WmdPgtZB
         gIKg==
X-Gm-Message-State: ANoB5pkSQNTsnzJJh6H0xPaQMYX/ZxDCQcRliDOLzR3CSLPu/MSTJzpk
        veoVKStN5rxbt6s/HafKRKw8EA==
X-Google-Smtp-Source: AA0mqf7cx7c/YeG785Vs1vUOt+3SoFwzJpe6TmpmVlCrtroFemClCPNAStWvJf6GOBWjJ51n9GnCvQ==
X-Received: by 2002:ac2:5324:0:b0:4b5:6d83:1a87 with SMTP id f4-20020ac25324000000b004b56d831a87mr5831782lfh.375.1670423318034;
        Wed, 07 Dec 2022 06:28:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:28:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/dpu: add missing ubwc_swizzle setting to catalog
Date:   Wed,  7 Dec 2022 16:28:33 +0200
Message-Id: <20221207142833.204193-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
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

Use the values from the vendor DTs to set ubwc_swizzle in the catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a1b52b9b16f1..b80cc11a9a83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -516,6 +516,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x7,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -529,6 +530,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -558,6 +560,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-- 
2.35.1

