Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7543355121E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 10:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238034AbiFTIFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 04:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237469AbiFTIFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 04:05:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CD7213
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 01:05:07 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i18so2310101lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bE48RbRziw6wh6f5dFGSQa/Uf6Ukc2JO5uYeJgs1cWs=;
        b=K8y9ZTfMsDIMABKhnvNbS+HCun1oCfFgMzuKsKL3F+uhWMW6rlw3QvmG0i/JQhJYLh
         4V9jTqgKF/dCUQb0s1lCatRws3wQmk0LtkKthHyJ22wP1zPGkth4ZgF68tQLPpg2odqd
         C6IjaSkdkEvp1cXWKrJh64g2PJt1QNtButWQZo/YDyjM2e/SvuruA0oAWU8zMbdMJpxN
         6uKmW6PbJgSFuyQiHFeVfM7iHVpjTqXNCL71BSx7DC1aGEMDW0MVbXivnvpWrQa6CQlM
         wZnq4eps5dGnO6oJH7h9pEfNvJaoT4RVoVq3xVYBMZ2PohpzdxkZ2hxHbPxkxAcgXB4E
         Tx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bE48RbRziw6wh6f5dFGSQa/Uf6Ukc2JO5uYeJgs1cWs=;
        b=U5JWz+GAaunxmx/54CsF+Je2cHvWQ2hjbLHSGgW7DClJar671wQj6PewZMqq+pShlZ
         gK/ytpC+DwmItmu4iQo+aYqiLeHa9w7K8S3GV8NtNLWhIo2NqXePtw+/e9Mo43bghHXm
         j3P4kGY9bBbPIYjWd+jtY4lFUxDD9fuiSuRCA2kZGoCOom4pNckyDpkbaDZuOm2gL52R
         +KaMj/ymiKAK3q4TwG4XZVrzTz6fHRwnPsuFDWqfsyJDXOkBfjPcuNCHAPLaskDDwBj7
         t5dWGLuwLn9qVaE2ST97YcL/a3DnM7N3gZJBH7V2SSiErVVv3DfDnlNHXej7pPxKoL/X
         A2jA==
X-Gm-Message-State: AJIora8JI4VOUhd6QT1pVu+vgO27HbKWw1+0I6eW0x/SecWTpTwUVZY6
        32w9Rm/VhxNTUwwCBjjMEgsIvA==
X-Google-Smtp-Source: AGRyM1u7EeQRYIZa5WGY9+0pF5xUtgsrvjnXSzgboqVIi7X/ft8Hfjty3ErYOHEMofjKK/9zFdl5nw==
X-Received: by 2002:a05:6512:2282:b0:479:7a60:5e16 with SMTP id f2-20020a056512228200b004797a605e16mr13005397lfu.101.1655712306161;
        Mon, 20 Jun 2022 01:05:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j10-20020a056512344a00b0047939239567sm1668706lfr.240.2022.06.20.01.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 01:05:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-msm8994: use parent_hws for gpll0/4
Date:   Mon, 20 Jun 2022 11:05:05 +0300
Message-Id: <20220620080505.1573948-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use parent_hws for two remaining clocks in gcc-msm8994 that used
parent_names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 6b702cdacbf2..0f52c48e89d8 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -52,7 +52,9 @@ static struct clk_alpha_pll_postdiv gpll0 = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
-		.parent_names = (const char *[]) { "gpll0_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 	},
@@ -81,7 +83,9 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4",
-		.parent_names = (const char *[]) { "gpll4_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll4_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 	},
-- 
2.35.1

