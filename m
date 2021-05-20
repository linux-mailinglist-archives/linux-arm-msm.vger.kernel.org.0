Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A9338B537
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 19:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbhETRbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 13:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhETRbZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 13:31:25 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB99C061574;
        Thu, 20 May 2021 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=7dGoF3BNEkpiBKF7ogX3+E6wIHzcvap1m0G/1XMjvQ0=; b=jkz+XrWHz6dveafDzJ+wBeQkhi
        WP8VM96uflAqN/g3JWW/3NT0BL7KjFbNf3tMRLNpe+wGHA3rmQa/SxzuXQ06Pul7og+7R4v+fPBIq
        HZzqOx3ntW6tseb5ELitZK6xCBw0tVC3maRPo8jz5CtkE4R6ds5uVmUyTZChWtgwGcKNyITwG/2p9
        pSrOMy6UiAyNBovYEMEj+tQ7Sh+rX4filKvBtdkAFepUafGucxGQ+G5scUbno5jlrVcwW8dJHOkVE
        00mSRm/ElFIi6jwi7J71kdcEQ0uTT4tvWA2GpNI+UrGX6CcLKobiB3xzILv+RYg98VikVlVZgNKkB
        fjXAJO6g==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1ljmUi-0003tb-Lb; Thu, 20 May 2021 18:30:00 +0100
Date:   Thu, 20 May 2021 18:30:00 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] ARM: dts: qcom: Add USB port definitions to ipq806x
Message-ID: <ad2121defc539abdb339b23eef80a8930b5f086e.1621531633.git.noodles@earth.li>
References: <cover.1621097174.git.noodles@earth.li>
 <cover.1621531633.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621531633.git.noodles@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 88 +++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 9628092217cb..c66859abdfd5 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -1026,6 +1026,94 @@
 			status = "disabled";
 		};
 
+		hs_phy_0: hs_phy_0 {
+			compatible = "qcom,ipq806x-usb-phy-hs";
+			reg = <0x100f8800 0x30>;
+			clocks = <&gcc USB30_0_UTMI_CLK>;
+			clock-names = "ref";
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ss_phy_0: ss_phy_0 {
+			compatible = "qcom,ipq806x-usb-phy-ss";
+			reg = <0x100f8830 0x30>;
+			clocks = <&gcc USB30_0_MASTER_CLK>;
+			clock-names = "ref";
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb3_0: usb3@100f8800 {
+			compatible = "qcom,dwc3", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x100f8800 0x8000>;
+			clocks = <&gcc USB30_0_MASTER_CLK>;
+			clock-names = "core";
+
+			ranges;
+
+			resets = <&gcc USB30_0_MASTER_RESET>;
+			reset-names = "master";
+
+			status = "disabled";
+
+			dwc3_0: dwc3@10000000 {
+				compatible = "snps,dwc3";
+				reg = <0x10000000 0xcd00>;
+				interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&hs_phy_0>, <&ss_phy_0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				dr_mode = "host";
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
+		hs_phy_1: hs_phy_1 {
+			compatible = "qcom,ipq806x-usb-phy-hs";
+			reg = <0x110f8800 0x30>;
+			clocks = <&gcc USB30_1_UTMI_CLK>;
+			clock-names = "ref";
+			#phy-cells = <0>;
+		};
+
+		ss_phy_1: ss_phy_1 {
+			compatible = "qcom,ipq806x-usb-phy-ss";
+			reg = <0x110f8830 0x30>;
+			clocks = <&gcc USB30_1_MASTER_CLK>;
+			clock-names = "ref";
+			#phy-cells = <0>;
+		};
+
+		usb3_1: usb3@110f8800 {
+			compatible = "qcom,dwc3", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x110f8800 0x8000>;
+			clocks = <&gcc USB30_1_MASTER_CLK>;
+			clock-names = "core";
+
+			ranges;
+
+			resets = <&gcc USB30_1_MASTER_RESET>;
+			reset-names = "master";
+
+			status = "disabled";
+
+			dwc3_1: dwc3@11000000 {
+				compatible = "snps,dwc3";
+				reg = <0x11000000 0xcd00>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&hs_phy_1>, <&ss_phy_1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				dr_mode = "host";
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
 		vsdcc_fixed: vsdcc-regulator {
 			compatible = "regulator-fixed";
 			regulator-name = "SDCC Power";
-- 
2.20.1

