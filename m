Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2511A72FC8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 13:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236538AbjFNLf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 07:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbjFNLfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 07:35:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB21199B
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 04:35:53 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f766777605so797045e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 04:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686742551; x=1689334551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQ877MkpC4ehMBHierpFme4jBSlXee3tho/1k2lPnrc=;
        b=uI93E48Udehbrc1xQ5FKCcryJu31IKfTe3ArGksSM8duqIQR2ZrmfLpdNQ+qIFOTz3
         SncRrViURipzqRAPlpCfr0FC/92IC2vwjuwbLJW0jMVN4xS0uvzRZDdjiw3BWTRuunmD
         74bsU98nNPnMyWJxVjcoiiUjAVYZX3Fjxw9pD9ouFNVvk7R2iXYvkBYUYUMnXvRsEQNy
         Z2NMYKU4vWUsz3jOQB6+DLg9JUqt8JaSXmg/MiW7SpM1Eypph8+bYHzYLnjZ0DSE9HqF
         E/P5NG1+ueIKjdibYHTm68Qn36j/UGY7i0FvcMaKNkYjnpwn9GUr4txXLSnYcnNMGN3e
         Mv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686742551; x=1689334551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQ877MkpC4ehMBHierpFme4jBSlXee3tho/1k2lPnrc=;
        b=c9mTr+EDHRdu1D25vgjUJlgbvTCeXx4Fnu5xs9dHkdqZps7mV+TRVkfkhe9dkFHNuq
         K+lGrsBBhp7yNg6kg9CJ0ew7/OOcE0DGOD1wcM6pqdgNCQomv/VZLNPeVG0oe37munIP
         tTMDAeXdw2lawJTm0LIm08XV+79EwZQUguX8HDmdB98MfgsbXlR8BxGySez0lnPYjgps
         EF0Lfeu/W3xNg3Tm6W0hlbQB3M1JrdAUP+2/nFkKO1utZ3uS9WwrlhNcHLW9flXi7HxN
         MgxOMgDVVBx7elv/7KfJXBq58eWMHmgCBwbVIk5odAJfT6HqQzIMdctVf58ELs2idRr5
         OOug==
X-Gm-Message-State: AC+VfDweh66zEpQpvJpYcLFxb2fKYfnMKY8GhFFEavvCfaSCyaaUPazi
        JpTMOYoWZZdWzGX/BMaEgOM+FVi4IUbwVPT58Gw=
X-Google-Smtp-Source: ACHHUZ60YXB+ZseJWIdpv6oeU1CgzUgucbhQDO4MpnIaed7403UQGhY/Ck461aIqR+24CTGdjBT+iw==
X-Received: by 2002:a19:e344:0:b0:4f7:5d2d:337e with SMTP id c4-20020a19e344000000b004f75d2d337emr2291524lfk.15.1686742551189;
        Wed, 14 Jun 2023 04:35:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id x1-20020ac25dc1000000b004f64b8eee61sm2088406lfq.97.2023.06.14.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 04:35:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 13:35:33 +0200
Subject: [PATCH v2 2/7] clk: qcom: gpucc-sm6350: Fix clock source names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230315-topic-lagoon_gpu-v2-2-afcdfb18bb13@linaro.org>
References: <20230315-topic-lagoon_gpu-v2-0-afcdfb18bb13@linaro.org>
In-Reply-To: <20230315-topic-lagoon_gpu-v2-0-afcdfb18bb13@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686742545; l=1472;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Um2mvoH0hgq2pxMG9SLY6mhwWzANPWf1u6+3THUrEME=;
 b=2C90kfo8MN0j6VNDnSDnGoAxAhAtouxdKh8jKaNG5fneNrIb81w/UW4+kwXuSrKmvexCRr9cz
 8duNdf3C0VPCiFGebaCghiTiKRhyqiQs/KLXoL4Y3Rso3YuoKiDg1TT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fw_name for GCC inputs didn't match the bindings. Fix it.

Fixes: 013804a727a0 ("clk: qcom: Add GPU clock controller driver for SM6350")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm6350.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
index a9887d1f0ed7..0bcbba2a2943 100644
--- a/drivers/clk/qcom/gpucc-sm6350.c
+++ b/drivers/clk/qcom/gpucc-sm6350.c
@@ -132,8 +132,8 @@ static const struct clk_parent_data gpu_cc_parent_data_0[] = {
 	{ .index = DT_BI_TCXO, .fw_name = "bi_tcxo" },
 	{ .hw = &gpu_cc_pll0.clkr.hw },
 	{ .hw = &gpu_cc_pll1.clkr.hw },
-	{ .index = DT_GPLL0_OUT_MAIN, .fw_name = "gcc_gpu_gpll0_clk" },
-	{ .index = DT_GPLL0_OUT_MAIN_DIV, .fw_name = "gcc_gpu_gpll0_div_clk" },
+	{ .index = DT_GPLL0_OUT_MAIN, .fw_name = "gcc_gpu_gpll0_clk_src" },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV, .fw_name = "gcc_gpu_gpll0_div_clk_src" },
 };
 
 static const struct parent_map gpu_cc_parent_map_1[] = {
@@ -151,7 +151,7 @@ static const struct clk_parent_data gpu_cc_parent_data_1[] = {
 	{ .hw = &gpu_cc_pll0.clkr.hw },
 	{ .hw = &gpu_cc_pll1.clkr.hw },
 	{ .hw = &gpu_cc_pll1.clkr.hw },
-	{ .index = DT_GPLL0_OUT_MAIN, .fw_name = "gcc_gpu_gpll0_clk" },
+	{ .index = DT_GPLL0_OUT_MAIN, .fw_name = "gcc_gpu_gpll0_clk_src" },
 };
 
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {

-- 
2.41.0

