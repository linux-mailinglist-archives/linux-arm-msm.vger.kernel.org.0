Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442FA781E2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbjHTOZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjHTOZ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:27 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E2133C0F
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:47 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so42911451fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541245; x=1693146045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAWo2jhB2GOhtSKR+La9YssTPYIAzwQXw9XAJbXiMUE=;
        b=iRwtiFYSayjUpHj5o15jXO9L/MQbSzD9zBVf7/Qs6PjdDxrTQp2C8FDAwrraPc6q6r
         BLe27F6YEZkEMb12JWkTfwfuq1k3ChX0xGPXG1nzPhHMpnJ24Retow0b4lkteuynGGTH
         daovM9iwoUHqXP+TPYU2deJCl77+mT5SIxAZhjjJDgC1jxTxUiijN5trFsctnSW9Wgv7
         w9lVADqO9YKpPA3awm4eRY5ah/G4t/TYprLsQuxMXhMpUPsqyOezZm9k6/HL4nhoO90y
         xHjnwcxEHgiEJ6H1xE/xakdL3vqIqQi9eOy/zlfvIrfCbNanaV8Rmg7bMXns99PpjjIy
         2afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541245; x=1693146045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAWo2jhB2GOhtSKR+La9YssTPYIAzwQXw9XAJbXiMUE=;
        b=Zrkmk7jUqXJxOjo+ok0lmuh7GGywu35EG62znemsYyrWnt6I0jV2vr1nq+lWerTeRq
         XH535N1czYef58UGB7Rv/IHWmAgN9aw+w7VmI8pkSf55zY03h6Z+39VUnavPaAhyuaMD
         2Z72EDUrZbm3YkhRZ1yPdDWpYOTpWz5Vt+FcNcmvdfXSm7JbBETh97EJldYe7+FtmI9j
         g3mkZAF8ZYywIVtq933eBp9i/LD8POQTHAgJGIUB2yoqBxD7oyOAgpqf9oI1LSilr5Me
         hg6P0b8ehp6KTdMMlnHvXy5wTtBCNTWOqYWLBeWPtFmbMYTOuMPDPpjsInOCL5yospVB
         e+Yw==
X-Gm-Message-State: AOJu0Yyp/XyKs1qDqxc5PDc6jB8R0Xn6sZbnXQKFpSOdJe1rVvUkyQ2Y
        LMV1BtLW2UMBsBuvaXkkhPD+yA==
X-Google-Smtp-Source: AGHT+IGbDP6680OB4J3IJM4tScxLB53uC8X2Ee5n1KjnfTX3v6GWBnLe83OjJDjz2709sKnhItyj4g==
X-Received: by 2002:a2e:91cd:0:b0:2bc:bcc6:d4ad with SMTP id u13-20020a2e91cd000000b002bcbcc6d4admr648184ljg.21.1692541245658;
        Sun, 20 Aug 2023 07:20:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:45 -0700 (PDT)
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
Subject: [PATCH v3 10/18] arm64: dts: qcom: msm8998: switch PCIe QMP PHY to new style of bindings
Date:   Sun, 20 Aug 2023 17:20:27 +0300
Message-Id: <20230820142035.89903-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 30 ++++++++++++---------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 62e594a0451a..30d8730fa4de 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -945,7 +945,7 @@ pcie0: pci@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pciephy>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 			status = "disabled";
 
@@ -975,32 +975,28 @@ pcie0: pci@1c00000 {
 
 		pcie_phy: phy@1c06000 {
 			compatible = "qcom,msm8998-qmp-pcie-phy";
-			reg = <0x01c06000 0x18c>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			reg = <0x01c06000 0x1000>;
 			status = "disabled";
-			ranges;
 
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_PCIE_CLKREF_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "pipe";
+
+			clock-output-names = "pcie_0_pipe_clk_src";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_0_PHY_BCR>, <&gcc GCC_PCIE_PHY_BCR>;
 			reset-names = "phy", "common";
 
 			vdda-phy-supply = <&vreg_l1a_0p875>;
 			vdda-pll-supply = <&vreg_l2a_1p2>;
-
-			pciephy: phy@1c06800 {
-				reg = <0x01c06200 0x128>, <0x01c06400 0x1fc>, <0x01c06800 0x20c>;
-				#phy-cells = <0>;
-
-				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "pcie_0_pipe_clk_src";
-				#clock-cells = <0>;
-			};
 		};
 
 		ufshc: ufshc@1da4000 {
-- 
2.39.2

