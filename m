Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FED0781E3C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbjHTOZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjHTOZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:31 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1393C23
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:50 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9b9f0387dso37341261fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541249; x=1693146049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnQpUHm72bf2pwjircvnsQiAqVSRuA64WEwWaYysxJc=;
        b=N4nuebBpHn0NL8sQcUbIhl0tavA6uUZe1PINn0F9Q1OZWrq14hu5BEaS/XemB6UweD
         N0HradT5R5/uFGZnaIVAWJR0KryxmrQ9hPAbZ7R+Dks4oXG2qi84G4TA0gIlKFatB1TQ
         n2+4Az99yGu5xjRGNc0yakImAHupXYaOD50Up3DOUUQwZ/sSoZdWRT8yojRs5Oh5liJZ
         WEpW4koGvPQqyNHEO9AdaZxeTRxoFvmmHQHkfHhnvVt4PpSQEwOMlrqRjptOhn0RFx7I
         u+R8pJ2bVJVRs0t5ujGKSY7aZOXl9zfwm/I/yfXStdWz8IZcr5KCur8DJJGUt2q7UNMk
         vb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541249; x=1693146049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnQpUHm72bf2pwjircvnsQiAqVSRuA64WEwWaYysxJc=;
        b=TY5F/Tx6d5bWeyP5WPWUoVBvq9fXN/SzeixgD3mNSmB4mmys69EWfKe334MldRL3lF
         lQqpfMuUKscngX271+ZnonNpUxmM08yhr9MGGSS0/bTwEAIfRUvknSq3V6mMRIR/eEH6
         eoR2ICjBBXoIzFthU7PpDFXuiFIp8ZmABFQ/wf9Mw6YDsIbfwGoQ+vS7G/L+VeyCVLaR
         vj0MVttkvzU382OQd7uqykk1IlmHWlYXXbgbnvhgxvCS3Ghx7x+B3AyitS5Dx8HZ9hU2
         3vgIfbuAqFH2qjxVZWd8bSurMdUX4cSn8530IEQeswvzrnA/rOmU4LHiXgnt5c14DMXg
         W1xA==
X-Gm-Message-State: AOJu0Yx4jkr4AK0Me+IawdtY9y76k4dwn/AIJewCkMTop3E0bfPHVCVY
        yNe9IfUm1pUlPR5O2va0GPDlRQ==
X-Google-Smtp-Source: AGHT+IHUNYavnKAN+XbvoV5FAUXvGU9sEI3mr6dUTaSx/ZkzJTYXdbSf9ejzt6pDSat3cUYPPeq2+Q==
X-Received: by 2002:a2e:984e:0:b0:2b9:53bd:47a7 with SMTP id e14-20020a2e984e000000b002b953bd47a7mr2971272ljj.30.1692541248930;
        Sun, 20 Aug 2023 07:20:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 14/18] arm64: dts: qcom: sm8150: add ref clock to PCIe PHYs
Date:   Sun, 20 Aug 2023 17:20:31 +0300
Message-Id: <20230820142035.89903-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the rest of the platforms and add "ref" clocks to both PCIe PHYs
found on the Qualcomm SM8150 platform.

Fixes: a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 1428a70b09c9..f58808aad587 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1894,8 +1894,12 @@ pcie0_phy: phy@1c06000 {
 			ranges;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_CLKREF_CLK>,
 				 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "refgen";
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen";
 
 			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
 			reset-names = "phy";
@@ -1992,8 +1996,12 @@ pcie1_phy: phy@1c0e000 {
 			ranges;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_CLKREF_CLK>,
 				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "refgen";
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen";
 
 			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
 			reset-names = "phy";
-- 
2.39.2

