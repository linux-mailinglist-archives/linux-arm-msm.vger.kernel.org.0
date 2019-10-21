Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D94DE394
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 07:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfJUFNb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 01:13:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46527 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfJUFNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 01:13:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so7623864pfg.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 22:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxuv0f9vOfK2s9wwSd8PriCXWXssg5riIxFhbRkkPeY=;
        b=d7rfDVx19nYMPFoWYy6LWgYvxHrd559t1aLDXmjt1LNgHHvLHkPq0r51HAhMr/SQ3W
         ucndnncxJnVamc0eG4GU5mp6htegLeMA+KM/oBefBgOsN70npE98yxOAQVP0HdF9udZO
         nKf8HW3iMJ7UDpao4eJpoVpToZTnHtst/Rlcqaki9kM+f6AnpNM98H5GPtV5/zBNqokR
         B7t7aVuT46rmlb8P95eRROBrd6xoPxAfdJoQId1e1jEZauFm/ghzrZD5d8HPoCHt/60n
         61wIbuhf++qLmATR6TGWW/OnqFf/DE0utqUBY9ss/3jHjG4hvptTOt1cBGC6ZhUV86Jw
         52DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxuv0f9vOfK2s9wwSd8PriCXWXssg5riIxFhbRkkPeY=;
        b=KCk1hGdYBuyHcVchHdUyWK1XOCWHh6f+MzkPjfB6uqKe1u9RSNhETPuOwLT89TrS4M
         Jz3mbJbEr5oJWtpAnRT6rryifF9O6QaeXx5vnRs8WiGlMsZNQfKVzGizqwpi4B7bZMlv
         vI9MHypeeNX3MLPAin1aOcbw19C3XzUHgW/P/uB8NcvNgAcjEAswQ7/fAHhUMKhSWt7w
         ZUEQhO18ncA1JzgdLgNa9BjSDIFHTxHBHZk0j7r59+/NOZfsIICAZ4A86JzkKQMyVx2I
         L2+6a13OzaRoaphfVF+0H/ZS8LDi0+1oIrbnLRod9aDl1wNCsjYvDs2x1Z0tI5WqmVOW
         vLrg==
X-Gm-Message-State: APjAAAV7qQ0GfwJbuXcoKytbxeTMRfEXXeY074TQDRI6reTnHoxqbVmq
        JR5Q2RwblEz4DWekmQ9l/3mETeHi4vo=
X-Google-Smtp-Source: APXvYqxZoKJ1squvEwBcTcjexvcywOHoilKGzHRG9uuD81Bq1fLgoxgZtMzTcmVkb0/jfR/NSWjKNQ==
X-Received: by 2002:a63:3f86:: with SMTP id m128mr10755485pga.404.1571634810030;
        Sun, 20 Oct 2019 22:13:30 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h68sm15716862pfb.149.2019.10.20.22.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:13:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] arm64: dts: qcom: msm8996: Move regulator consumers to db820c
Date:   Sun, 20 Oct 2019 22:13:14 -0700
Message-Id: <20191021051322.297560-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021051322.297560-1-bjorn.andersson@linaro.org>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Supplies for the various components in the SoC depends on board layout,
so move the supply definitions to db820c.dtsi instead of carrying them
in the platform dtsi.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 44 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 44 --------------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 44ec3eb1c8e8..21e029afb27b 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -142,6 +142,10 @@
 	status = "okay";
 };
 
+&camss {
+	vdda-supply = <&pm8994_l2>;
+};
+
 &sdhc2 {
 	/* External SD card */
 	pinctrl-names = "default", "sleep";
@@ -155,10 +159,28 @@
 
 &ufsphy {
 	status = "okay";
+
+	vdda-phy-supply = <&pm8994_l28>;
+	vdda-pll-supply = <&pm8994_l12>;
+
+	vdda-phy-max-microamp = <18380>;
+	vdda-pll-max-microamp = <9440>;
+
+	vddp-ref-clk-supply = <&pm8994_l25>;
+	vddp-ref-clk-max-microamp = <100>;
+	vddp-ref-clk-always-on;
 };
 
 &ufshc {
 	status = "okay";
+
+	vcc-supply = <&pm8994_l20>;
+	vccq-supply = <&pm8994_l25>;
+	vccq2-supply = <&pm8994_s4>;
+
+	vcc-max-microamp = <600000>;
+	vccq-max-microamp = <450000>;
+	vccq2-max-microamp = <450000>;
 };
 
 &msmgpio {
@@ -369,18 +391,31 @@
 
 &pcie_phy {
 	status = "okay";
+
+	vdda-phy-supply = <&pm8994_l28>;
+	vdda-pll-supply = <&pm8994_l12>;
 };
 
 &usb3phy {
 	status = "okay";
+
+	vdda-phy-supply = <&pm8994_l28>;
+	vdda-pll-supply = <&pm8994_l12>;
+
 };
 
 &hsusb_phy1 {
 	status = "okay";
+
+	vdda-pll-supply = <&pm8994_l12>;
+	vdda-phy-dpdm-supply = <&pm8994_l24>;
 };
 
 &hsusb_phy2 {
 	status = "okay";
+
+	vdda-pll-supply = <&pm8994_l12>;
+	vdda-phy-dpdm-supply = <&pm8994_l24>;
 };
 
 &usb3 {
@@ -408,22 +443,31 @@
 	status = "okay";
 	perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
+	vdda-supply = <&pm8994_l28>;
 };
 
 &pcie1 {
 	status = "okay";
 	perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
+	vdda-supply = <&pm8994_l28>;
 };
 
 &pcie2 {
 	status = "okay";
 	perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
+	vdda-supply = <&pm8994_l28>;
 };
 
 &wcd9335 {
 	clock-names = "mclk", "slimbus";
 	clocks = <&div1_mclk>,
 		 <&rpmcc RPM_SMD_BB_CLK1>;
+
+	vdd-buck-supply = <&pm8994_s4>;
+	vdd-buck-sido-supply = <&pm8994_s4>;
+	vdd-tx-supply = <&pm8994_s4>;
+	vdd-rx-supply = <&pm8994_s4>;
+	vdd-io-supply = <&pm8994_s4>;
 };
 
 &mdss {
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 36f161547aa6..a297d3223161 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1322,16 +1322,6 @@
 			reg-names = "phy_mem";
 			#phy-cells = <0>;
 
-			vdda-phy-supply = <&pm8994_l28>;
-			vdda-pll-supply = <&pm8994_l12>;
-
-			vdda-phy-max-microamp = <18380>;
-			vdda-pll-max-microamp = <9440>;
-
-			vddp-ref-clk-supply = <&pm8994_l25>;
-			vddp-ref-clk-max-microamp = <100>;
-			vddp-ref-clk-always-on;
-
 			clock-names = "ref_clk_src", "ref_clk";
 			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
 				 <&gcc GCC_UFS_CLKREF_CLK>;
@@ -1347,14 +1337,6 @@
 			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 
-			vcc-supply = <&pm8994_l20>;
-			vccq-supply = <&pm8994_l25>;
-			vccq2-supply = <&pm8994_s4>;
-
-			vcc-max-microamp = <600000>;
-			vccq-max-microamp = <450000>;
-			vccq2-max-microamp = <450000>;
-
 			power-domains = <&gcc UFS_GDSC>;
 
 			clock-names =
@@ -1456,9 +1438,6 @@
 				<&gcc GCC_PCIE_CLKREF_CLK>;
 			clock-names = "aux", "cfg_ahb", "ref";
 
-			vdda-phy-supply = <&pm8994_l28>;
-			vdda-pll-supply = <&pm8994_l12>;
-
 			resets = <&gcc GCC_PCIE_PHY_BCR>,
 				<&gcc GCC_PCIE_PHY_COM_BCR>,
 				<&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>;
@@ -1518,9 +1497,6 @@
 				<&gcc GCC_USB3_CLKREF_CLK>;
 			clock-names = "aux", "cfg_ahb", "ref";
 
-			vdda-phy-supply = <&pm8994_l28>;
-			vdda-pll-supply = <&pm8994_l12>;
-
 			resets = <&gcc GCC_USB3_PHY_BCR>,
 				<&gcc GCC_USB3PHY_PHY_BCR>;
 			reset-names = "phy", "common";
@@ -1547,9 +1523,6 @@
 				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
 			clock-names = "cfg_ahb", "ref";
 
-			vdda-pll-supply = <&pm8994_l12>;
-			vdda-phy-dpdm-supply = <&pm8994_l24>;
-
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
 			nvmem-cells = <&qusb2p_hstx_trim>;
 			status = "disabled";
@@ -1564,9 +1537,6 @@
 				<&gcc GCC_RX2_USB2_CLKREF_CLK>;
 			clock-names = "cfg_ahb", "ref";
 
-			vdda-pll-supply = <&pm8994_l12>;
-			vdda-phy-dpdm-supply = <&pm8994_l24>;
-
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 			nvmem-cells = <&qusb2s_hstx_trim>;
 			status = "disabled";
@@ -1770,7 +1740,6 @@
 				"vfe1_stream",
 				"vfe_ahb",
 				"vfe_axi";
-			vdda-supply = <&pm8994_l2>;
 			iommus = <&vfe_smmu 0>,
 				 <&vfe_smmu 1>,
 				 <&vfe_smmu 2>,
@@ -1882,9 +1851,6 @@
 				pinctrl-0 = <&pcie0_clkreq_default &pcie0_perst_default &pcie0_wake_default>;
 				pinctrl-1 = <&pcie0_clkreq_sleep &pcie0_perst_default &pcie0_wake_sleep>;
 
-
-				vdda-supply = <&pm8994_l28>;
-
 				linux,pci-domain = <0>;
 
 				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
@@ -1937,8 +1903,6 @@
 				pinctrl-0 = <&pcie1_clkreq_default &pcie1_perst_default &pcie1_wake_default>;
 				pinctrl-1 = <&pcie1_clkreq_sleep &pcie1_perst_default &pcie1_wake_sleep>;
 
-
-				vdda-supply = <&pm8994_l28>;
 				linux,pci-domain = <1>;
 
 				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
@@ -1990,8 +1954,6 @@
 				pinctrl-0 = <&pcie2_clkreq_default &pcie2_perst_default &pcie2_wake_default>;
 				pinctrl-1 = <&pcie2_clkreq_sleep &pcie2_perst_default &pcie2_wake_sleep >;
 
-				vdda-supply = <&pm8994_l28>;
-
 				linux,pci-domain = <2>;
 				clocks = <&gcc GCC_PCIE_2_PIPE_CLK>,
 					<&gcc GCC_PCIE_2_AUX_CLK>,
@@ -2056,12 +2018,6 @@
 
 					slim-ifc-dev  = <&tasha_ifd>;
 
-					vdd-buck-supply = <&pm8994_s4>;
-					vdd-buck-sido-supply = <&pm8994_s4>;
-					vdd-tx-supply = <&pm8994_s4>;
-					vdd-rx-supply = <&pm8994_s4>;
-					vdd-io-supply = <&pm8994_s4>;
-
 					#sound-dai-cells = <1>;
 				};
 			};
-- 
2.23.0

