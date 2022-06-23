Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349F55579EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiFWMEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbiFWMEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681EC4B424
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:31 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id by38so1230227ljb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ZSA6xHQZ9aqASlGuBjY/Lc+K6EWssVTLnudC8h7Ugc=;
        b=jEPdaVuSYHVAXI7PQcfhMs4Y48HYVRpwDx3OONIo7QHh2qHN6THTxsy+0wO7neM4QW
         lSbhb5hAp+p/xUydOV8w+tOmQUkPGz50ayN71VkENvO0xhls1Zy+D64YB27CTbuBjTb2
         tCydXhELrmdwaNphsLdp0bXh9N76gERgiaDfGKgM4anRcgHCMlrAXODA86MxZDFlh/Ky
         hkBXBMDLzPTiRzOxKZJaiZukIbfEI2deubmkajDchSWwVGyN0JnDMNOHMKag2/Iiaon8
         eh+qRooEG/E1BlNqWRUW+wIpholTv8Xldpm5Bt/wB3ADYORn1cT3PoIR4Spkroa7o/6/
         Ev4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ZSA6xHQZ9aqASlGuBjY/Lc+K6EWssVTLnudC8h7Ugc=;
        b=hfBA6ThyxsLAQE/G0qhEw3QqOJRdjByTwBTQfmBFu/JT94zG7Bg6JJN6S78g/i2CH2
         5jU1EK8CVb33ie+ebhmz+tHQCzsmOJSW5y4gQNQo39/uC8DN6Mruwa34Jmh3i9k4iNt4
         947m6Bvh6mHRu1alnIFf/QGz4UEWNzfezXAKS76zJ00lcte8XqlaY9Ex8o71T0QjiSjf
         Bmtsvo8csRlokAibwtrV6HlqGRWigal2kkPam0WEUz4EwUsSzhN/0TWay7c46UsgfV7k
         O8F70UYEX1IWN+ZYbjMJgnu/Xp+mU2y8DG5Ct2SHHongyPbNj8gqRY536pEihz1VRSXX
         6+Vg==
X-Gm-Message-State: AJIora/jU31myIIpGI03zVQeodvBWeElbcOZnGCygjo3ifvEFZlkCnzK
        dIgI8KV8Z6UukbQbVpQYP1M/pg==
X-Google-Smtp-Source: AGRyM1vyTttTf9/+DOHZEFqBUI8Pj1xvEChHdF/WQ4rT74eb+M5p7WPr4E+2gOh2gRvp14Eyf/lSGg==
X-Received: by 2002:a2e:a78a:0:b0:25a:8c6a:f3c7 with SMTP id c10-20020a2ea78a000000b0025a8c6af3c7mr3421276ljf.218.1655985871235;
        Thu, 23 Jun 2022 05:04:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 15/15] ARM: dts: qcom: msm8960: add clocks to the MMCC device node
Date:   Thu, 23 Jun 2022 15:04:18 +0300
Message-Id: <20220623120418.250589-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
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

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the MMCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index c7058da58be5..b65659801b6e 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -164,6 +164,22 @@ clock-controller@4000000 {
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL3>,
+				 <&gcc PLL8_VOTE>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "pxo",
+				      "pll3",
+				      "pll8_vote",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "dsi2pll",
+				      "dsi2pllbyte",
+				      "hdmipll";
 		};
 
 		l2cc: clock-controller@2011000 {
-- 
2.35.1

