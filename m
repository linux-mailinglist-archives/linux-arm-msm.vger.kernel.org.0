Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BA36934A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBKXNL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBKXNK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:10 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4989D13D6B
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:09 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id c26so19165949ejz.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J31CAkEbeSgGqmOFWMgrhqaSYaHyMz8nFGUoMcYydwo=;
        b=jWKuQ8GMbk3Vj84PFPIlV8S0d8syG4d1X2kNZpL/LCS9jlWsM4rRMf72B959nPQnC+
         ngBaCegLGXtJEt8UgYkCtHT8Cs9VRuJMdz0x95fwP0yMvhDeLDKZC/L7uIGaHfjoMcLq
         jFDyDkJwZlFQE8GaNVn+rhT2PcGR0nrIkSaIdNIk+fIMrCuki9sHwH9h+hXRoJ3fYuRy
         O4foa34Zr1gCD7lmlFF/WTkJtV5jUKPECQOlTBllRcA0OP/2HDNmRPeTx9oec4V5d64k
         ceZHXn1XOhcSFw21zawYhUpoZw7/l/bqq21c9KGC2WgIMq67wMzbOiXfLEezIuVDBEdF
         47YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J31CAkEbeSgGqmOFWMgrhqaSYaHyMz8nFGUoMcYydwo=;
        b=gQS688fxRxyEJWU63K4i1n3IoSBXOsWjVFIukDO6wG7VYJ927ZIw+Q3XfPYSJ2zbEI
         wYVzlqvojM1ltK1mv9kDR/PrEPf24a0kMgUQf4aJD3pci3FFRM2/UzHCPPyxswHyyAMq
         IbgR6+a8oPf3N7Jl7LW+A4e+fDw/ABZPj0pJrJ1g6ue0FMn5+AGPCWJJjD0OoCLNU/Ng
         DPYRsE/knW72Hxr7lp4yEtrJKsk7LyvKNU/BdkHlJ+HBk4f3F7nr2jqmoivwCyx66f1I
         nPJsMtUZr0G50BXodiaKp4UOt8LWF5ZQZtz/KmOEHHHgbBLuXWlZlHBuRR+zRrCCikRB
         8XQw==
X-Gm-Message-State: AO0yUKXC8T9WwQX+ongESDQHXZnOaRi3DWIZWvQ03L/TzPFXcUCSSnS3
        J/dLseE1WhTnqrtVXs7eAyZrmg==
X-Google-Smtp-Source: AK7set9cqu2tXMqI/X5iLt9VzGRkElq3axtjm92kB97HjZi4gbsdCHY7Fj4VQofmFJbxPCqJbvNygw==
X-Received: by 2002:a17:906:3792:b0:88d:5081:e9f8 with SMTP id n18-20020a170906379200b0088d5081e9f8mr19468357ejc.15.1676157187817;
        Sat, 11 Feb 2023 15:13:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 05/50] drm/msm/dpu: fix sm6115 and qcm2290 mixer width limits
Date:   Sun, 12 Feb 2023 01:12:14 +0200
Message-Id: <20230211231259.1308718-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

According to vendor DTS files both sm6116 and qcm2290 should have
max_mixer_width set to 2048 (DEFAULT_DPU_LINE_WIDTH). Correct it.

Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 47de609e2279..192fff9238f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -318,7 +318,7 @@ static const struct dpu_caps msm8998_dpu_caps = {
 };
 
 static const struct dpu_caps qcm2290_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.has_dim_layer = true,
@@ -356,7 +356,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 };
 
 static const struct dpu_caps sm6115_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
@@ -1520,7 +1520,7 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 /* QCM2290 */
 
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68
-- 
2.39.1

