Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980C9781E2A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjHTOZ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjHTOZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:26 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6903ABA
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:45 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9338e4695so39848541fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541244; x=1693146044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VSzMxgMAWTElzLoHLjSvLy7x/Zb4YMgFCggjZbwbLc=;
        b=xtC5sjpAjdIXtd3Op4dTQiks1lfhVXalkNvVA+BCOfgGJ7Z9om4hBt1cAH1op52k5a
         SnqJejgCCfEmGIfT/ruoC+iZ80Mc7uAgAQA7Su9T8cqSQ95yq02DkrNdC66I/AqvsjHr
         kTbQUWohJkQqHTYAMfAkrWFwQmgLUQ0Tiv0AabZt0lBIIBxBrU3yZevQ62fW7wvLniTp
         t7UFRUKAIGgAjcAMVjbe8aNkS04y7WUSrG81HExkpfTtinhQsrv9NYUaWrYpmWSQ7R1a
         NmqnoYVGj+irsrx4tOB2MjSMBKbbOAcOIBrjulR5ZbH2zGsrG/+cFgAqlBRz2wnI41xg
         3fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541244; x=1693146044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VSzMxgMAWTElzLoHLjSvLy7x/Zb4YMgFCggjZbwbLc=;
        b=fjjuxStPdf4DFIjvHiyZPvYyw/2RVfAwYS9hz9+ZVuJcmQTmTsUXwJEzugxuAGngs7
         bt80AeLTYoW4vOFwAbqZ8nWV83N3ea2TEL2s1ndP0xvVOWlXSP3qxKBHWS0v6wNsl3V0
         t5mnoyKLKasfId18FNJVTRJmVgyAL+Vzf4eDpyeU0gjvHWJtoIESs3F5hkatDbebu/7h
         5N62XX1dreWI46xXzZEgbShME8iK/Cz5MRa+Z77KuGRfMxVk28hhaqDZlhEPdxE/W/Qj
         0B47n9j899NtUj5KzI4SRerKNBQ9Fe8scSEw4iz7G9gtGgyBz8DPhE6tour+toK0TVv7
         319A==
X-Gm-Message-State: AOJu0Ywuh9dS+aZk5qkmS2xSqfIo1x2h3SZEL+7ORb8fns6CAkAIc/gl
        gL4RgI52ErUa0SHyKhtT6cDvZQ==
X-Google-Smtp-Source: AGHT+IHrH7RBK2mYgF8w9abBzh44qYXAa+h0IaK23qfpv+eScUIr4kfwArfpu6QWhdOBrliMhlqzyw==
X-Received: by 2002:a2e:8e90:0:b0:2b7:344c:a039 with SMTP id z16-20020a2e8e90000000b002b7344ca039mr3103859ljk.33.1692541244100;
        Sun, 20 Aug 2023 07:20:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:43 -0700 (PDT)
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
Subject: [PATCH v3 08/18] arm64: dts: qcom: ipq6018: switch PCIe QMP PHY to new style of bindings
Date:   Sun, 20 Aug 2023 17:20:25 +0300
Message-Id: <20230820142035.89903-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
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
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 32 ++++++++++-----------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 47b8b1d6730a..3c8a2f4e26a3 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -278,33 +278,25 @@ qusb_phy_0: qusb@79000 {
 
 		pcie_phy: phy@84000 {
 			compatible = "qcom,ipq6018-qmp-pcie-phy";
-			reg = <0x0 0x00084000 0x0 0x1bc>; /* Serdes PLL */
+			reg = <0x0 0x00084000 0x0 0x1000>;
 			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
 
 			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
-				<&gcc GCC_PCIE0_AHB_CLK>;
-			clock-names = "aux", "cfg_ahb";
+				<&gcc GCC_PCIE0_AHB_CLK>,
+				<&gcc GCC_PCIE0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "pipe";
+
+			clock-output-names = "gcc_pcie0_pipe_clk_src";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE0_PHY_BCR>,
 				<&gcc GCC_PCIE0PHY_PHY_BCR>;
 			reset-names = "phy",
 				      "common";
-
-			pcie_phy0: phy@84200 {
-				reg = <0x0 0x00084200 0x0 0x16c>, /* Serdes Tx */
-				      <0x0 0x00084400 0x0 0x200>, /* Serdes Rx */
-				      <0x0 0x00084800 0x0 0x1f0>, /* PCS: Lane0, COM, PCIE */
-				      <0x0 0x00084c00 0x0 0xf4>; /* pcs_misc */
-				#phy-cells = <0>;
-
-				clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "gcc_pcie0_pipe_clk_src";
-				#clock-cells = <0>;
-			};
 		};
 
 		mdio: mdio@90000 {
@@ -756,7 +748,7 @@ pcie0: pci@20000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_phy0>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x20200000 0x0 0x10000>,
-- 
2.39.2

