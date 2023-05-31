Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6D177189D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 21:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjEaTI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 15:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjEaTIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 15:08:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF31126
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 12:08:17 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4eed764a10cso6928836e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685560096; x=1688152096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f02QY76Z/zUTOa1xNejn3ObrxHG/cUW3iNC9INehNrQ=;
        b=lfwJASpoWgSiCFGPDsFHmQ6GaK8QnkCBkuXKWCjuHNenzhWgHpkehKR+9ucBFRfOn4
         g7Ag3VLHoezLPz/RJdUnnLmEcTqZW58sWVuMXpRcs6XqLPk+7FRnb2hPqIel3wIF5OI3
         2cK7M4NkMtd8nAUMdR9mJvw3UPjjejftEqMDo/uXClw6mu/I25Ozmu4Q1Xhy/T9PoReV
         NXcTH0SoJoGZ2xZu1HQnLU/Is8ir+7hfwhelkM7+RLSSpGytqT1djL9slGrFvwjp0Zvu
         6cQNLujKKUxCN6TRzvYGSjf95BIVLDdmPCaKtjegJ2bFWG24cCUSCAprGHT5hoXmj9uT
         BTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560096; x=1688152096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f02QY76Z/zUTOa1xNejn3ObrxHG/cUW3iNC9INehNrQ=;
        b=IFTFQZTFB2XNv9vT5zhWA8Hj11+qriTwbFzOKqpLiAp162g4KeSAJtIGxrpaod2upF
         9JrVZGqelRzkIRxBlvG8Rqdw8Bg/cIyIPzq/VgfAKHTHi53+6SuUx/cUKxifbAiHMRhC
         I2j/R7QR2r/O1ZS5+s56zWg9fmuhcQy2okDk9oByQdhc866osYqMsLiEz/bPdUvH6dN5
         38Jh1nCG4ypj/ZKSzDX59/9nusvUPhmjUKzK/D1jk6Bvi/3AGgQkamN6swZJ8pvdP/6/
         TCE7kJ7Ur/+RhldbEOamo/YkFvn0dDyKzvgTVxBuL1VgqZxo6zQowcoJjI2b817Jytgh
         bDcg==
X-Gm-Message-State: AC+VfDx+GNv7Yj5tUQnqHFiHKKdeJjAyinXntw6Y1MZUgnPrz1ENO1Wx
        oIhIdyZFNRJsDoa7OCxK1pzaPw==
X-Google-Smtp-Source: ACHHUZ5mWZaL6K8aaj/CZrnXPaxOzi1m1QvQvUhkkMeL3AiiEyzAx8yWfw97iitZJVbQgoeEJ+0Tdg==
X-Received: by 2002:ac2:5ddc:0:b0:4f4:b0a5:b583 with SMTP id x28-20020ac25ddc000000b004f4b0a5b583mr3580446lfq.44.1685560096083;
        Wed, 31 May 2023 12:08:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004f3b4d17114sm820935lfl.144.2023.05.31.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:08:15 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 31 May 2023 21:08:10 +0200
Subject: [PATCH 1/2] clk: qcom: gcc-sm6115: Set up flags on GPU mem_iface
 clk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-sm61125_gpucc_flag-v1-1-f59dd1350781@linaro.org>
References: <20230531-topic-sm61125_gpucc_flag-v1-0-f59dd1350781@linaro.org>
In-Reply-To: <20230531-topic-sm61125_gpucc_flag-v1-0-f59dd1350781@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685560093; l=935;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4kKahsZ/nvnpLCXGAaKSzL7oy0Wb/A5ayZLZEPcyD54=;
 b=g8S0eA3PdUUp/URNqKIbLRwTlcPsp8wU2H0Ay4KWhYCQRtRkScbVjOA34PyKfKittYEa37u9y
 +vbv/CBl9MYB4O4h0w8oZyxEzErHFma5wPxp/UzkUERC46+k5chxKK+
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

Following the BSP, disable the RETAIN_MEM and RETAIN_PERIPH bits on
gcc_gpu_memnoc_gfx_clk.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm6115.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 5f09aefa7fb9..b8454e1f3e9d 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3504,6 +3504,10 @@ static int gcc_sm6115_probe(struct platform_device *pdev)
 	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
 	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
 
+	/* Set up no PERIPH/MEM retain on the GPU mem_iface clock */
+	qcom_branch_set_force_mem_core(regmap, gcc_gpu_memnoc_gfx_clk, false);
+	qcom_branch_set_force_periph_on(regmap, gcc_gpu_memnoc_gfx_clk, false);
+
 	return qcom_cc_really_probe(pdev, &gcc_sm6115_desc, regmap);
 }
 

-- 
2.40.1

