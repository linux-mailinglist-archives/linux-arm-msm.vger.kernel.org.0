Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83285271AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbiENOKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbiENOKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:10:51 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F44140EE
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:49 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id g16so13346531lja.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GRnP0k72A6Rn/P6bIjVlTkWcKN2lm4vnrIO3tU5Omrk=;
        b=e8bvCafVPh2Af4Fpc94MPNDjREdmZG1AKQuOrPXhGllu4tMIlYk8VkqZq0IKvCJEAy
         owBlmh6Tr7TcIFZUb77P2RLLkvRswxaIMHxjXuXXfZ1PNJsBVDi15kDQzH24Bs3f5NF4
         hf0FRNZ0kmQARVqvDdDSIeMtr/UZL7v86wTVe3Hg7rJdTAEcXaeZrN7pW2gbFbJp9n9k
         HqF0fb9ufAakicIducMlWMvzAT4pIeo9EXki+OT0N5ymH+e+t4VE8y3uuV+dqqbmMLnJ
         DvPgUYRSElhWHnXR53wUFBStg1TjF09QEfHzvnQTaSKhxmObk0ldGVl072uvY/wKKA/a
         ee8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GRnP0k72A6Rn/P6bIjVlTkWcKN2lm4vnrIO3tU5Omrk=;
        b=eQDe/hYxiTwM2yGkuv/tj+AKWq/zZdYwdeXdPRB/AC95Tb3enl8Ld4SjK1B1RUBBFk
         QasWRqkpZSWcPz16Y3iDECej8f1Mog6S2d2q5r/4DjP7ls+qrcISNaZuReSGxfcAEE+O
         hFzg1cPlNtjbGiKHEzMEhSquD1At9bOMqu0Cyl7mjJ/vBM7xisuxmyQI84nQKn65Qwxg
         TRzcFiMvHOJ/JFYO2qfrLsjwG0dTZ1JXksMkSxMzrGbVAjm7BqHyLMQmyMYKrPWfTJRD
         CTiJMobkWfH1M6XLG/aoe84KdDF/5iIx32B1NBjHLXuPzCP/8WXUPNvxjO9EJ8ytwmm0
         Ep1g==
X-Gm-Message-State: AOAM530AkSqefA4ZHPvS2BmJYu63wy9ovVat+lqP9B40q3KHM0iXssn+
        GlRFomQATkUTlY8XLEid/+DcGg==
X-Google-Smtp-Source: ABdhPJw9x/aMIA8ieK33omh6aajuppIVGEtwIwFWVJSaqtAl2CTI3kVfFQcnwLfmBmooumtB3RzSSw==
X-Received: by 2002:a2e:8887:0:b0:24f:10d8:4603 with SMTP id k7-20020a2e8887000000b0024f10d84603mr5907986lji.191.1652537447506;
        Sat, 14 May 2022 07:10:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9-20020a05651c104900b0024f3d1daedasm845912ljm.98.2022.05.14.07.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:10:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 06/12] arm64: dts: qcom: sdm630: add second (HS) USB host support
Date:   Sat, 14 May 2022 17:10:35 +0300
Message-Id: <20220514141041.3158521-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
References: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
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

