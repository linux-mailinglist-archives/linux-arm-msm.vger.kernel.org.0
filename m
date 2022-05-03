Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA5A519122
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 00:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243524AbiECWNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 18:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243532AbiECWNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 18:13:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FDF41FBF
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 15:09:33 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x33so32610259lfu.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 15:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KNZuuPSKqcasDL+5Rl5bxrONxLb7gTWyfJkNAuWmsU=;
        b=BOtXD4xH/CG6oxPpoLpPeyXjVUOFgtCBkHsdK/QLpQkvm2UvbnuHW4M4D4Hna4z43W
         Faf6uYdZxYPccYd4TDFmuuQY+TjOqcrTjoaMtFHlDESL/krjlYxMzRPKplR+gnRIQYpo
         BsZJQsmwFUFWbs0uPbs2M0AycxoosdV/pVLGhEKbHGGgZBxdOE2WHROfWJRYa9Ferv+B
         7QwlztBvDPXRFvgqx4+1ab9e3oTJWtWZi9utHVfa8wGaHJOLPqqWhEu29UerEY1tPhpI
         /IVRCoZvn6dPvQTjry/DYFxZHtojLYV3jk7KxHtjNEScVvKeu/2HaV4S8lIyqIduv1xQ
         JzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KNZuuPSKqcasDL+5Rl5bxrONxLb7gTWyfJkNAuWmsU=;
        b=xohcxgLADcp/q77HdJZylzt4e/+D2dyc1GjYTWuyjJ9A+6skR6vWz6YKFgUPoKL6Yh
         B9U8UlqZb1L70bLVczKNFa719gzv0ooRUhsTQW533ImVf9bw5SBLjyqX2BPLSnvUMvQ2
         kaR+dDKOFxcxGyhxR3lOpgAgrVmVcf1JZ98dCOOHRGcL3VIWRn4lZcXovWxc9u5r8D0L
         5DA3CBKaf8LDyanSS9aWmK3AHjBSkl7Fi7godVHDhOuIB9vxsqB+p25AqqeCrYVnt+qI
         i0QguoYKPqbGGAdTMUbMejX6zG5bva+E9Od9EQZ9+geUnvP9wYMqHEsEDkhodQx/r8eB
         EZzw==
X-Gm-Message-State: AOAM5334yGez4CMlXRAlBGwlwtgpGu0RZUtd8YN7QfuDfOBtJmvkSOws
        8RZszlpKpJyEBott28AxdnPFkA==
X-Google-Smtp-Source: ABdhPJwvCSgeC2+5RMC7sOEOYEX88TU1x6RRQl+tbd/o0Su0k9WQmODKDC4aHW1W4iJxoNHJg719rA==
X-Received: by 2002:a05:6512:b06:b0:44a:f7bf:a425 with SMTP id w6-20020a0565120b0600b0044af7bfa425mr12553978lfu.445.1651615771833;
        Tue, 03 May 2022 15:09:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j9-20020ac24549000000b0047255d2111bsm1042349lfm.74.2022.05.03.15.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 15:09:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 4/5] arm64: dts: qcom: sdm630: add second (HS) USB host support
Date:   Wed,  4 May 2022 01:09:26 +0300
Message-Id: <20220503220927.960821-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
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
index d8c3d2569340..57b874650c90 100644
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

