Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB2052FDB9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352247AbiEUPVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355383AbiEUPVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:21:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F07B49F
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:21:01 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so18841467lfb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GRnP0k72A6Rn/P6bIjVlTkWcKN2lm4vnrIO3tU5Omrk=;
        b=AFUSXGtB8lu2pPAa8udoMd5XTuIreIfhtZEBcUW2m6+0fEuHqjTuzuRn6qclUJ3K1e
         zmay8wx7mBaItAZUbRJgw2ftungZm5oTS6J9rDA9VqeBJBy2+b/jg1G8xNF7hPIhJNVZ
         lEy8P6pRlK396QIMxMZIyTKg29SYDRm+meZ1I/orUw9K8VZh+nfAjJUjsO4N3p2d8V7C
         vCPBmEjWlR/sS6oyNOFNoxktdBmf/tXX1xAmMwaqwqLYV31mvZ9p2kkXY7AA3Mf2y8Hv
         9rif08qEvIyQGfp12qUEfl6WLhMWViMclKbkNuvWUZ69jBOLhNon8KBnTb4TEk3/uuw0
         LVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GRnP0k72A6Rn/P6bIjVlTkWcKN2lm4vnrIO3tU5Omrk=;
        b=knkMe8WA8X2HlLUnWswTQJlU0Cd1LzgQUorGWyN4gzzl+QUha5rwS600YZ+P2Vnkyp
         3o8FObJUEzYfrtTfceGUWfcjqo0QjbepRfzGde+1f7j+DAtMn200rhBsR3lVG2i43bpO
         wEKrS7zEE6eHwXCSKlRq2ciApAc/ju0DFXxEZh1lLQ+Fw1NYUOAMIH6rl+zNXuXIiiR4
         tj1Uh/Q3xoEaWtDyzw/AQioK9QdMOCMHrY0dgLI2Ln7EZC+d9PonzymTLwsoRoPthnyz
         9u/kmRI41tG3eqEPi5814zK8Kz9f0eS0K3iA4vEK0CWlCxAgZplTrr+yQX5ll/EpMszY
         2QfQ==
X-Gm-Message-State: AOAM530wmLOP1jAzjIwa+nm5Pc0UPimfGZDSIahSnO5uK0+zLtk8b8oZ
        ZSZ52blARwLTYBDd1HyVqXmHpw==
X-Google-Smtp-Source: ABdhPJyuuHkY6QQaXpjnMTtwahK2Z8xKOhSZkLkI2uumSWw2Xg7eO7BA9BbG6h4Xd6MIsjzKpLLc/A==
X-Received: by 2002:a05:6512:23aa:b0:477:cfc0:c1cf with SMTP id c42-20020a05651223aa00b00477cfc0c1cfmr7137894lfv.360.1653146460239;
        Sat, 21 May 2022 08:21:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id k8-20020a2e92c8000000b0024f3d1daeccsm739933ljh.84.2022.05.21.08.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:20:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v6 06/11] arm64: dts: qcom: sdm630: add second (HS) USB host support
Date:   Sat, 21 May 2022 18:20:44 +0300
Message-Id: <20220521152049.1490220-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
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

Add DT entries for the second DWC3 USB host, which is limited to the
USB2.0 (HighSpeed), and the corresponding QUSB PHY.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index eb8504e5735c..2b5dbc12bdf8 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1270,6 +1270,20 @@ qusb2phy0: phy@c012000 {
 			status = "disabled";
 		};
 
+		qusb2phy1: phy@c014000 {
+			compatible = "qcom,sdm660-qusb2-phy";
+			reg = <0x0c014000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				 <&gcc GCC_RX1_USB2_CLKREF_CLK>;
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

