Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B72BC7B33D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 15:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbjI2Nj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 09:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233412AbjI2NjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 09:39:17 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1D81734
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 06:39:05 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5345a3dfe3bso9743428a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695994743; x=1696599543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdNtbM8sg5Uv/4iy/PMTp5TjbGaItzuz9a1/F8ZNl8I=;
        b=dIwD7hUTtN/uX1H3XDBJ0M250A3L6BflRIb94Plhu4s4H1kvLEgcNYhbJcGrtFpw95
         q9KuUmdYctmK37DEdeI8BU/8+1xPjo+q1OLE4pQyjnhKiyAHp6ofL9jviO98iljmmbkX
         ncuz9NTxf1Yr/P0zFq6z00eHNe2fDxvp1WCADnh86GBeTOUD7G7+NgzFNiZX833rxYh4
         9ei2hAxT07B4A7rsiMIZvjF9q0m5X1B/BluhPN18BR7L8pozlYyJ2gZkantPvOF3TQi0
         1Do0Gy7Tjt4/brjXYLjy0ggsN7tSXfQ5mNFbgY7tjnkDAvIMWATEH67qM9Simq6XNSa+
         yHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994743; x=1696599543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdNtbM8sg5Uv/4iy/PMTp5TjbGaItzuz9a1/F8ZNl8I=;
        b=HJVk6R/c+LExu3B41vp/KPYLM2oAy+b5z3PblwaNRqiaZ4Kd7iU2IVT8LbY9ZS08Hk
         v6kLA7VzGqJr9fYqv7+6eVXuj5bmQBTcO/XEDLWiQHn6/lrbR+qAqLlZvqbTkoD49e2W
         cu0a72sLibRcPUcNK6mC1OvLA12rboc7W5J2kJ3MvH2oW57NRnUxa+ujhm0yNa9hEo0x
         nO0qihJ5D5DfKn8ENqg2eRuRNElzvom6UkuIXTHIcBNMzGudif/WPwLWn8j8XCpQZe5w
         87qNw4rZCeanzLieEu3Dq8+3+z24bOGb3sBtAH7RweTTneuyELSMjcbaPqEsPESMhTyQ
         UPLw==
X-Gm-Message-State: AOJu0YywvyO0/96pvEz2waVfqGQuE/snRJ4FNHNQn4azI3y9NkDYe2ih
        HnUSkXVh8Jq1+siVHLcf2c0L9w==
X-Google-Smtp-Source: AGHT+IGpBizH8QZwp7ZPEb3difKlOrS1jonPPKtM6duYEQOku2tgSjMYdiD+m7xCfMaKLJvj2w7g3Q==
X-Received: by 2002:aa7:c746:0:b0:522:564d:6de with SMTP id c6-20020aa7c746000000b00522564d06demr4285089eds.36.1695994743533;
        Fri, 29 Sep 2023 06:39:03 -0700 (PDT)
Received: from [127.0.1.1] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id cx14-20020a05640222ae00b005362bcc089csm2215701edb.67.2023.09.29.06.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:39:03 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 29 Sep 2023 15:38:53 +0200
Subject: [PATCH 2/2] clk: qcom: gcc-sc8280xp: Don't keep display AHB clocks
 always-on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-topic-8280_ahbdisp-v1-2-72bdc38309b9@linaro.org>
References: <20230929-topic-8280_ahbdisp-v1-0-72bdc38309b9@linaro.org>
In-Reply-To: <20230929-topic-8280_ahbdisp-v1-0-72bdc38309b9@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These clocks are consumed by the dispcc[01] clock controllers, so there's
no reason to keep them on from gcc probe. Remove that hack.

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index bfb77931e868..bf95f82a3818 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7545,18 +7545,16 @@ static int gcc_sc8280xp_probe(struct platform_device *pdev)
 
 	/*
 	 * Keep the clocks always-ON
-	 * GCC_CAMERA_AHB_CLK, GCC_CAMERA_XO_CLK, GCC_DISP_AHB_CLK,
+	 * GCC_CAMERA_AHB_CLK, GCC_CAMERA_XO_CLK,
 	 * GCC_DISP_XO_CLK, GCC_GPU_CFG_AHB_CLK, GCC_VIDEO_AHB_CLK,
-	 * GCC_VIDEO_XO_CLK, GCC_DISP1_AHB_CLK, GCC_DISP1_XO_CLK
+	 * GCC_VIDEO_XO_CLK, GCC_DISP1_XO_CLK
 	 */
 	regmap_update_bits(regmap, 0x26004, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x26020, BIT(0), BIT(0));
-	regmap_update_bits(regmap, 0x27004, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x27028, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x28004, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0x28028, BIT(0), BIT(0));
-	regmap_update_bits(regmap, 0xbb004, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0xbb028, BIT(0), BIT(0));
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));

-- 
2.39.2

