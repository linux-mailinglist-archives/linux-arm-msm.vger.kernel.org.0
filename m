Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE6D7693E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbjGaK6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjGaK6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:36 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F58199F
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:07 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso6940568e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801085; x=1691405885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVXbtATOlv9r7FRIIM9zZ7w+bYow1bQ9kVe2bdTz2cA=;
        b=o+Kg3kwtURVIMSRrVDnPjrL7oA4bpw7iiYPoWzj9MYWbgsyYyeK5S7miWNUPL+1xNK
         nR0vvNQK9cL+vOVx35i5650UMZQD3TJVlmv6kfBAiossrljVnIbt7dUSCKzDvhXmZVY/
         UjNIAMiYjur3UtrcByxBZSKa2RExVmFBPu/hzU806BxSeSwbqiXk9JWESdY8AEkJ64ny
         O5twfiYJI87dSYM9MEj0NV5AKV6j7axMwGglbHL2CcrS1CeGBYv37fZkNETdvF4MxyOZ
         nKjKj2P4+otbJEuAzIFaK1Ov3Z5+mVPdSA30yBvI9w8IHA4Y4uNhOUFeolLPLJNo4SoH
         1/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801085; x=1691405885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVXbtATOlv9r7FRIIM9zZ7w+bYow1bQ9kVe2bdTz2cA=;
        b=aTCi3o5oeSkF8TfA9eV3XiOvvYgCc3dyW184WOLYX8mib3qVEHXh8xiufvv3trgd3W
         kYLeRzOh5gDyfXMmFtqDu1d9A4eXC6uBMB7BS+LRSdnYODn4WqwptqaLolBOonSJHbuS
         sE5XSYHz8/f0m46oPAVGIZzwpE1uEs2DMnNFdd5I9qiPna9BJ0UPUHSt2iDBY/lisF3r
         wg6dFh5iTz7ICUzgosxe2xWwbcnAByHg+VpGVS3MdC1zZg43e9SlsPaRzYE8Cdv+avh8
         0QNBCZa06lxH6mMhMMD4AG6i01gQJrB96KoM2Bqskiz8KwgWpwwc5YMNqBI2ccL1YE1H
         teFA==
X-Gm-Message-State: ABy/qLbI52KEu97ksCofjkgiN9IqkLGS6xd2Ob6hOOHXfiMf1jE/M/ld
        T02GF9/+7klpPHLLP9ulnR57Pg==
X-Google-Smtp-Source: APBJJlGBCV+JruM+QKL1AGHE4fUCuY8SAuNG4AlaqQegX/6TQWppaM0tMSI+9lLLQuPa3B7aTVASvw==
X-Received: by 2002:a05:6512:2310:b0:4fe:c4e:709f with SMTP id o16-20020a056512231000b004fe0c4e709fmr5960008lfu.20.1690801085654;
        Mon, 31 Jul 2023 03:58:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:05 -0700 (PDT)
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
Subject: [PATCH v2 06/13] arm64: dts: qcom: msm8998: switch PCIe QMP PHY to new style of bindings
Date:   Mon, 31 Jul 2023 13:57:52 +0300
Message-Id: <20230731105759.3997549-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 30 ++++++++++++---------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index d0af22fa63f2..94921e75f8c2 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -926,7 +926,7 @@ pcie0: pci@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pciephy>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 			status = "disabled";
 
@@ -956,32 +956,28 @@ pcie0: pci@1c00000 {
 
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

