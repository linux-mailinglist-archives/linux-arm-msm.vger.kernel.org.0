Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCD3678770
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 21:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbjAWUSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 15:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjAWUSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 15:18:23 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C8B16AF7
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 12:18:22 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id z5so11946886wrt.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 12:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAE8c6dFz3FEq85yU3g0Xx5Oubt8sx5CHZhlIZdhMpA=;
        b=b4SkVTCR3zcq4w4TMiDfjUHVzmIXti4vErDIN2OtGrU0v4sjm4FMTfyocdliEMmdzZ
         QSpw6fD9bPpdIgt/3CjMwyE71U1hlty58Xojx7TShJ5snbVVqpE6qP+B79G7ZoFbnmJ/
         yrhLOI5nK75w1hOaiKLLE9ulTCN2Pva6g2uHHIVZsI32fpoifY52KQ4q1FlIWl2yRM4i
         mOiHYTtW856u+qRPI7zW92//0x7c2fOBeA6kYGxfE1ZxI8Vqzzk1fzUPDliUFAJ4dY4C
         4fU3yq5CEegb0/s8uuaP62Hmz7c5kDSXcWhK+C6xP1JTkD8jDobrC4MslJ3n5HRzpXQc
         IVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAE8c6dFz3FEq85yU3g0Xx5Oubt8sx5CHZhlIZdhMpA=;
        b=KXMMcRdX8F/ZQfs7jIUJAcpdFi/M/2zESE/QwJSuQ9NTFvVmECWn6tp9H6QncvwVyA
         VGrfR9Do/p9tTpbwbnjFkmTb+Bfc0gEbjNG1HZATLvJWB7ghW18zZfDtQMHrQ2e/gjRR
         3+X7BhPe16RjbhaJEuig1pSKuqKoXpsK0+XUsnFYtbWKf8I3ME2PaujqBFe8NAqlkiLr
         1pfumtsqr+tqWlrrwojyE9BWLbqcUkGxJrZ0uUZle/bHrUtFevDhjiJpVc1IXftoOCpl
         4jxauJHVQtHBvNfy6IXdR3lwjndX15EEbxrbSicf0p5eJjTZaWAwCtZ1lPZhLfJYktHx
         UaZA==
X-Gm-Message-State: AFqh2kr06TbrcACPhXn7K0zKnYGN0c9HOc2lSWFX4L+puG1rXydls3Gu
        4atatscpQGZcqUWe1PX8ND1wIQ==
X-Google-Smtp-Source: AMrXdXtRQT561eClfu+WVsxcTSlAtfwnyVBDIpONayWNok3WlPg7TXKUcWvPpuKkAikgcfGfmXOsbg==
X-Received: by 2002:adf:fe03:0:b0:2be:516a:e6da with SMTP id n3-20020adffe03000000b002be516ae6damr12024505wrr.14.1674505100504;
        Mon, 23 Jan 2023 12:18:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d4b01000000b002be53aa2260sm210078wrq.117.2023.01.23.12.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:18:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] clk: qcom: rpmh: fix double RPMH_IPA_CLK assignment
Date:   Mon, 23 Jan 2023 21:18:12 +0100
Message-Id: <20230123201812.1230039-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
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

RPMH_IPA_CLK is assigned twice:

  drivers/clk/qcom/clk-rpmh.c:578:35: error: initialized field overwritten [-Werror=override-init]

Fixes: aa055bf158cd ("clk: qcom: rpmh: define IPA clocks where required")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 393b83f6020e..45ee370f3307 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -575,7 +575,6 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
-	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
-- 
2.34.1

