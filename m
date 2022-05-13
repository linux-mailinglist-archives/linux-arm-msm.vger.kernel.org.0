Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A59526D9C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 02:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiEMX4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 19:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiEMXz5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 19:55:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A943AB9B7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:46:08 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d19so16964030lfj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u1F2z8vf2EByZAfH4u3WGQEipah84mZvdDX5pars+Lg=;
        b=JFwzclKOM1V3qtLae9wxI2GoDoyADdTNMhn7fkIPqqcvFLJWhPXd8v0Qz1kG8cuP5r
         nyDh+Org9X6jMa/FM+odgGTVcq2t8p2Nv44KkXAIreNjlHH9gzLov8iIXjKRKepPp2dr
         8f9E5OiIuMjtOh9nRdyqhVAEfCIi0FTZVpvmySFd9q0gohwSnZY7TfNqMtVUt2gFnhT+
         jlQ1s1XKEXiZGRjyZmS7QTAK7dYU4TSTbmi41wa0AQkWdm8Aral3Ijqa/ekWv7wPcoJH
         RQr/6ubahaBICkmucQK2YU4xsBx0Sj7v6KgkCnWU8NjIgBx0rB8GGcrM160I6C2FIwD/
         0eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u1F2z8vf2EByZAfH4u3WGQEipah84mZvdDX5pars+Lg=;
        b=aZXwcNPdWXewG7uCX9qetezLDMPmRyAFi62NJXQJrJ8qRTstisPTMUf0He9nB7B9cb
         7LwLzeWR1h07/RoKafQjZDj0Lf+novVFeKPfBdB8EIIr9R3isNIFnvLkPTMv6xXechq2
         gqTYmiqSTahMSv8HtM6nvTYNY4ub5lY3w7PqtmrQ8Qa5Rma8Zp0v0Li7PzVRKOQGAqvC
         66VvHLlP+3PHnNDGbtGyF/GgUGBgx9+apm6/TWMZJ04X6JLp6613KEXeoAyvQyblTDdT
         bkQFEik0PVGXG0eKGrhLfxPhgJ6fxAEwZSQZxL5g7vyjwUCadmOQXz3iOsuYoXy1w0CT
         gPDQ==
X-Gm-Message-State: AOAM530jiwcxWr+BnjmuDjy64fMe+qsSqkzspwQY5QlrMZIWiQE3R2pH
        0dSVzSsO8ZVevw86r7JcnhoJ662CVIel3w==
X-Google-Smtp-Source: ABdhPJzub7V1/LiwJ38+Za7EX4T2nNS1CQ1XsrjiZdVIRQXPObo17tKPB0Dact7BLCGaBSNZUvjQTw==
X-Received: by 2002:a05:6512:2311:b0:473:a659:878b with SMTP id o17-20020a056512231100b00473a659878bmr5123218lfu.352.1652485523426;
        Fri, 13 May 2022 16:45:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o8-20020a05651205c800b0047255d2118csm527342lfo.187.2022.05.13.16.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 16:45:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 5/8] arm64: dts: qcom: sdm630: add second (HS) USB host support
Date:   Sat, 14 May 2022 02:45:15 +0300
Message-Id: <20220513234518.3068480-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DT entries for the second DWC3 USB host, which is limited to the
USB2.0 (HighSpeed), and the corresponding QUSB PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index cca56f2fad96..17a1877587cf 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1270,6 +1270,20 @@ qusb2phy: phy@c012000 {
 			status = "disabled";
 		};
 
+		qusb2phy1: phy@c014000 {
+			compatible = "qcom,sdm660-qusb2-phy";
+			reg = <0x0c014000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim>;
+			status = "disabled";
+		};
+
 		sdhc_2: sdhci@c084000 {
 			compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0c084000 0x1000>;
@@ -1375,6 +1389,47 @@ opp-384000000 {
 			};
 		};
 
+		usb2: usb@c2f8800 {
+			compatible = "qcom,sdm660-dwc3", "qcom,dwc3";
+			reg = <0x0c2f8800 0x400>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>;
+			clock-names = "cfg_noc", "core",
+				      "mock_utmi", "sleep";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <60000000>;
+
+			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq";
+
+			qcom,select-utmi-as-pipe-clk;
+
+			resets = <&gcc GCC_USB_20_BCR>;
+
+			usb2_dwc3: usb@c200000 {
+				compatible = "snps,dwc3";
+				reg = <0x0c200000 0xc8d0>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+
+				/* This is the HS-only host */
+				maximum-speed = "high-speed";
+				phys = <&qusb2phy1>;
+				phy-names = "usb2-phy";
+				snps,hird-threshold = /bits/ 8 <0>;
+			};
+		};
+
 		mmcc: clock-controller@c8c0000 {
 			compatible = "qcom,mmcc-sdm630";
 			reg = <0x0c8c0000 0x40000>;
-- 
2.35.1

