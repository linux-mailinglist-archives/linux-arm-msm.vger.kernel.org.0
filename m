Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A864752589E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359607AbiELXn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359596AbiELXn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:43:56 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5055228AB87
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:54 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g16so8396561lja.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u1F2z8vf2EByZAfH4u3WGQEipah84mZvdDX5pars+Lg=;
        b=YwUDsZZ/i1N7G2rbHoq/n8N9W9vEPgup0kjquj3LKMzsJH5QtDUmFd722aXOrADiFB
         Bfn00gA9IuzNeu8zSEBrLZOoFhDdXZIdqGO6L/zhoyTQb/rGUTqaatK8L8U3/g0OF7ue
         7JB5S1/e6M5sw/6HC0fHADv/DtkgokWvTAnFYwP4cnWROBw5/klw11h33Bnrzl6bDDRh
         X+o2dJo1F2x4V5+bjn0fNNUSmUkZuxWL2Fe2xhmFDWVLhMZ72GspSo1UW4ejUCxorCiq
         2aUvbTIFmnbzogzzRVTk2HG4NRap67JstbX82PksLVmTWW6C8+I88wPPE7YN2tdXyFo3
         dY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u1F2z8vf2EByZAfH4u3WGQEipah84mZvdDX5pars+Lg=;
        b=3MNxdubRur3csC4cvZ0puBzJFzInsFFugdHMYof75vR0U/wddnfA+ueFCa8ZRJ9MMX
         Cp5UMVhdqFEEabnOuS2/md2/id5CIOdeXuTMRP3mD4Xb2afjPs9Mg7HXsE+G5FpCbKks
         /JlMskXqzOIaVXCC4Xn8rEZB5aNWjD3wAmbsUcfMtNP/jZ4VDqZJSMgQzrYMTw3t/pFI
         74BFPSKlsDC//+eCd5WCFE2ihPPXrXm+3aibacO3q2CVhAafSFyTuTk8TJdP9DAb59uO
         FzMdt8SHRiWYqsVr5HkmRL5Zo2JS4s7HqE718EvBn5/faOnv1ct3lNSWgjHXdRgmlg3C
         4HGQ==
X-Gm-Message-State: AOAM533qZf76YZ/aTuJ7cslKqZSh7RqV72ubX+VBuaa/Id4Q/3oHK/eA
        PkQ9sqxEdQobcek0Nnr+1ZBdTg==
X-Google-Smtp-Source: ABdhPJxxHZpHg/uxbWs7yQJNsGhxlkAS7AqvErxFJAbC1dYUvTgcx3h02IhwCKj7kbuCN2hAHz/TAA==
X-Received: by 2002:a05:651c:1035:b0:250:ecad:d79 with SMTP id w21-20020a05651c103500b00250ecad0d79mr1453324ljm.397.1652399033796;
        Thu, 12 May 2022 16:43:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u10-20020ac248aa000000b0047255d211b8sm129976lfg.231.2022.05.12.16.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:43:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RESEND v2 5/8] arm64: dts: qcom: sdm630: add second (HS) USB host support
Date:   Fri, 13 May 2022 02:43:46 +0300
Message-Id: <20220512234349.2673724-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
References: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
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

