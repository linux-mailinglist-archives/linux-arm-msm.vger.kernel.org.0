Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43EC1719732
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 11:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbjFAJji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 05:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbjFAJj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 05:39:29 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BCAE74
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 02:39:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f50470d77cso718358e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685612352; x=1688204352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6Zyh9SS/ay5C8X6ZpDqvKWzoRMQVLw0+Knzztfmr6U=;
        b=vUFRGvUBj2vao0+xRbhI2W6IhVqThUUSAMyyU7+vepX6BqoSt4CRtAMpukhCjRGnDk
         0JMSv2JhoZF0E2jAFmYsr0Vf8sWnMa66EDczESM3rYqSGwOODIVZGNAcFbmw3sWflmGB
         wYI9Xn2UeEmcSi005tL9M57VqpDuM50QUAykyKJRz7sYOp+P5qw1PNsNVKPqX5WTxBbq
         92z0qxSNksuMEvePSoQ0i2GVDUeklGy2Wg0UmEZ71GdgIQMQ0qAKRG+1Rp5FGHcQmNe1
         QGbHm5v9/Rsqe6i8LPWeOeLCcKKm+c2Rra5v9+6oRv5Jjcy5DHtnK8VYKSHcwFHrfpq0
         kC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685612352; x=1688204352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6Zyh9SS/ay5C8X6ZpDqvKWzoRMQVLw0+Knzztfmr6U=;
        b=S8B/7ewb1sidhk0GchbkNDRTIq1vF0vhgssoF3kbQL6pGXoMswdyESeB5K9T1TQshF
         h4iUB/EC3biEtuTW6LdTNF6YQHRy/vLaGu5uvxaAiFHZwrINdvGCAFhFux/eY5HqQDff
         hn/LLlg/oeaICvxQz1aJfj8UvqWMqF1SJvrOvVJvIIuiJa+gwvdZzKdHmjOrMDE04vwi
         AitEMUdYGGuD7VZ3HfmWDagQp4Cq1gtpiBSWwXayxeKScMdGWXW+5LYs6LFzkr3urvYC
         M5trV1O75mEaDT0fDD853zbFFFrRK7wk2bRBX1mZ5S0CJN/rbiTsrxGEufeIUvtHFQqm
         5NcQ==
X-Gm-Message-State: AC+VfDxQsKGG/yDyFT6At4TN077Viq6u5ovt4Suuzqb/8wT8AzfE3DNT
        JWD2bXSl+rI+GfNpd+HOUGHO4A==
X-Google-Smtp-Source: ACHHUZ5Y8h+x8Wx9jb6ZilqY5aQZXMqvnwtKWR/FNfO0LQraJ01cwVW2QLzUT3WGsDUlYRN8qI4TIQ==
X-Received: by 2002:ac2:5deb:0:b0:4f2:40dd:e2cf with SMTP id z11-20020ac25deb000000b004f240dde2cfmr1006787lfq.55.1685612352392;
        Thu, 01 Jun 2023 02:39:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id v3-20020a056512048300b004f3b258feefsm1031119lfq.179.2023.06.01.02.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 02:39:12 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 01 Jun 2023 11:39:07 +0200
Subject: [PATCH 1/2] clk: qcom: clk-alpha-pll: Add a way to update some
 bits of test_ctl(_hi)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230601-topic-alpha_ctl-v1-1-b6a932dfcf68@linaro.org>
References: <20230601-topic-alpha_ctl-v1-0-b6a932dfcf68@linaro.org>
In-Reply-To: <20230601-topic-alpha_ctl-v1-0-b6a932dfcf68@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Iskren Chernev <me@iskren.info>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685612350; l=2006;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wYVC8kdHJdhvnMuMnLKibz47EG2aGZVDSm2mijcxJhM=;
 b=H/wQbdL0OfMcmYF31Muucv9e8Y7m1Ku/adaUr5wH7HSFZoLNywx+S3xNliNCQmZmE65dFR5at
 ocJiQSpxaKuAZx85XvQwtUbafzOoFp3gs9IprHtdFk9jb61DJK6kTHD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "vanilla" Alpha PLL configs are sometimes provided with an intention
to only update certain bits of th register.

Do so if a mask is found.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 19 +++++++++++++++----
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f81c7c561352..e4ef645f65d1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -384,10 +384,21 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
 
-	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
-						config->test_ctl_val);
-	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
-						config->test_ctl_hi_val);
+	if (config->test_ctl_mask)
+		regmap_update_bits(regmap, PLL_TEST_CTL(pll),
+				   config->test_ctl_mask,
+				   config->test_ctl_val);
+	else
+		clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
+					   config->test_ctl_val);
+
+	if (config->test_ctl_hi_mask)
+		regmap_update_bits(regmap, PLL_TEST_CTL_U(pll),
+				   config->test_ctl_hi_mask,
+				   config->test_ctl_hi_val);
+	else
+		clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
+					   config->test_ctl_hi_val);
 
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 6ff0d08eb938..e4bd863027ab 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -123,7 +123,9 @@ struct alpha_pll_config {
 	u32 user_ctl_hi_val;
 	u32 user_ctl_hi1_val;
 	u32 test_ctl_val;
+	u32 test_ctl_mask;
 	u32 test_ctl_hi_val;
+	u32 test_ctl_hi_mask;
 	u32 test_ctl_hi1_val;
 	u32 test_ctl_hi2_val;
 	u32 main_output_mask;

-- 
2.40.1

