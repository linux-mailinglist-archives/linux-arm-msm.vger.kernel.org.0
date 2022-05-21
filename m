Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0674A52FF55
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236063AbiEUU1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240762AbiEUU1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:27:23 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAAE5AA45
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:20 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id br17so7236787lfb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NIhZMlNwrm86FIwK6DaWWuGAfRi5gTsWk7O35xpAzeI=;
        b=kJ5cOej4fI0v6D37P0FiV6Ci50iMKQKsp4xw4P2nk893K9S8BFt1uHKD9g3yBTxULg
         nFAB2YFwpUMVCdpex6cWFf2RH3NAvOaJ3Q7fypxiw2ZcZmgeUcAB6VMJcaNgjxMKlKau
         UHB8x44Rp4JKQ5XJZjhvLug9+m33RfOUGmzy42iJqDIcoPqGgFh2wS6lwtr+IRrbRprn
         58wc15MCg5vvzA5BPXIs/LL4CqeW3pJmVbQ0ogB+NWJNDu83GiMy/BQtNyfiyPUiR6G+
         KeUFruWmXlO2FPx+3WzQzU2H2MMusXpKGoypR8/qYykPIi8s+uw+gOKtFr5qRpspocGq
         CXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NIhZMlNwrm86FIwK6DaWWuGAfRi5gTsWk7O35xpAzeI=;
        b=bxxLfdNxjMuLWU77V9Y3A7bREW9RBcXRZtRV/Zgj5OtKPfM6pIKfRWHcruuNAn8f6V
         8yO6w73iunqo7OY+RlwmP+CeWeTOfX8P85ILYY+ORt07fuOc17U4Hrh0PEB4tvHnonn9
         DJeBotHi+0kTpAw4zAa6d6KFmpXrFFrqHcGn4hVyYuQNkoO9jujlxAtsgGb2zpGL44rs
         E7KkI+ToLpxMVr0RE1s+3mg4J5SKaNH6zMaOGu5foIfLzyFXVai82aaZ4LWzs8zgvhD8
         06DgXjH+61SeBFLjRb4aAQ3VY9wFDh4ZVrNMeUEuSRnYRTUDfsGGTNS5fZm4BNUzWkSt
         5CUQ==
X-Gm-Message-State: AOAM533Qx/FBOyn/tAkBVCJaCMJqoENbXLzzJgCw1uwt8bI/TLDuZUd3
        BknLewbt5t5XHtTQSWzHevjy6Q==
X-Google-Smtp-Source: ABdhPJx/d+debH1IJF/sMWyn6ijrD45LJMTqPhgIuxM83IfiX0nh/nCEY14uJjrJ83T/iDPiC8cxwA==
X-Received: by 2002:ac2:4bc1:0:b0:477:9d80:6c12 with SMTP id o1-20020ac24bc1000000b004779d806c12mr11730069lfq.604.1653164838520;
        Sat, 21 May 2022 13:27:18 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x1-20020ac259c1000000b004786291114fsm317773lfn.140.2022.05.21.13.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:27:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v7 06/11] arm64: dts: qcom: sdm630: add second (HS) USB host support
Date:   Sat, 21 May 2022 23:27:03 +0300
Message-Id: <20220521202708.1509308-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index f4d09784ff29..11ec8b3cfe38 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1274,6 +1274,20 @@ qusb2phy0: phy@c012000 {
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
@@ -1379,6 +1393,47 @@ opp-384000000 {
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

