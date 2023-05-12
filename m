Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8757010FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 23:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240546AbjELVSN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 17:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240477AbjELVSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 17:18:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9610C7ED2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:17:49 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f24d4900bbso8165923e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683926256; x=1686518256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcrbCAngai1gJP+uz7CuGmMzMn9VwTBw+sIaCb/i0AQ=;
        b=BuRSACEhCM1LdPoW8vkgN9Kw/+4kq4HWSMGWy8GC4W+1SJX9yKDcp+/hF6RjWL8z06
         UukMbDEz5fMJVZEM48lzWP55DoQxBy+JV5EiCkX5zNGVQVx8PxQwkGVGCn23Rn7ZjBgk
         gEf5o/ei706P5KugtWZvsrSuieX6JI794aB3PrmpPunesQkgDQ5OxndxAb5fHtyowaKH
         Db+RraifmpT63xc6wLO7KHUIcHoT49KlgAlolyhxHoJPlH0a12czaUBBd3xikyhd8Pyu
         sR+ZVwngiTwlEfe27G+fUlE1HM1ykNWKskBJ1/xECQIXqbmnrHSN8VR9nNxiyuugpq2K
         nxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683926256; x=1686518256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcrbCAngai1gJP+uz7CuGmMzMn9VwTBw+sIaCb/i0AQ=;
        b=RTZ/AZPp7/O3uhrhqwmtOOXQaaTtVOFck5jvyFk9sukdTmLPGsJCuGxoPMFpaV6yA9
         eFu1COGV8mtf6sbLsGinFZq+TJkSf/uxg5+xKjZkxiD014FkPNfJoa3ljgnIFEwHjL3H
         2B8Rt4j8ygMlbX0QX+S9D3vC6H43zCf4cLi7qj6BOcc/0rn83HL6U90HqlMUIYuGHCDo
         hjxgEdgcobdonfgTxifMFgDdaAgidY23FGfZmg4QLy57VX2GA9edJ8ElZtdnynNCLIMh
         fsCu2REZJe9PO9B0cHGS1ki2LC0+jh4kT2SWx37skRcVIoe1Y6SiSmxxz+dXt+euYkdo
         NN5A==
X-Gm-Message-State: AC+VfDxHJm4cF6aP2GG4prcdOFRu0d6+VhGlJbOHIEzvR0amh7SVTI4y
        iQIsDj3S0MA3fVW7j548c/unzA==
X-Google-Smtp-Source: ACHHUZ6xwvzC84NR4pC86NVahGBSGsuPoaNwdZ7LCEr0jS7odBvUsUnj/70eVECP01ZzUy34E88hBQ==
X-Received: by 2002:ac2:5227:0:b0:4ed:c286:7ab6 with SMTP id i7-20020ac25227000000b004edc2867ab6mr3639306lfl.67.1683926256664;
        Fri, 12 May 2023 14:17:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020ac254a4000000b004edafe3f8dbsm1590363lfk.11.2023.05.12.14.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:17:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 09/10] ARM: dts: qcom-mdm9615: specify clocks for the lcc device
Date:   Sat, 13 May 2023 00:17:26 +0300
Message-Id: <20230512211727.3445575-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify clocks used by the LCC device on the MDM9615 platform.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index b40c52ddf9b4..556abe90cf5b 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -39,7 +39,7 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
@@ -113,6 +113,20 @@ lcc: clock-controller@28000000 {
 			reg = <0x28000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&cxo_board>,
+				 <&gcc PLL4_VOTE>,
+				 <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>;
+			clock-names = "cxo",
+				      "pll4_vote",
+				      "mi2s_codec_clk",
+				      "codec_i2s_mic_codec_clk",
+				      "spare_i2s_mic_codec_clk",
+				      "codec_i2s_spkr_codec_clk",
+				      "spare_i2s_spkr_codec_clk",
+				      "pcm_codec_clk";
 		};
 
 		l2cc: clock-controller@2011000 {
-- 
2.39.2

