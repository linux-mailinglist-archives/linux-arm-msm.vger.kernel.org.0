Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F90381A27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 19:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234130AbhEORXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 13:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbhEORX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 13:23:29 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE47AC061760;
        Sat, 15 May 2021 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=aIcp+5S94migwpwk7hlOWBhO79REWkh9/DXzBOlUrZM=; b=BXzmjYNLEjSDQ9prIuYpJOyeG1
        48iJDUoLrlHRrhLi54HPV0E+tBiiSINNi4KMlmrHKLn6m2mp5MXkvdeUlh/oQ4JXbUfWX/0QmCCnI
        ohLBTAzYwmv5iSR4fU8hez9kG3jepa82DVF3221Y1btUfVLDs0KCEecrRCAxp9dnYzngxYcbEYi+8
        9LamJD2Hzx4YpUHgrQcMb3MiOieOMSFzg9UOD3CfVxwfwdZr/WHLN3U7KH8KbCHgtEyQ7tHgcQjO5
        dKAQ6hf5KNuK0YnZ8yy2Hs82hN+Q45jxYZoaVR+LrOaKYjbuV7qQQ+0ZllW0sd0FfgB0OIMrLFyzT
        77DUmZmA==;
Received: from [2001:4d48:ad59:1409:4::2] (helo=youmian.o362.us)
        by the.earth.li with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1lhxX9-0004TW-31; Sat, 15 May 2021 17:52:59 +0100
Date:   Sat, 15 May 2021 17:52:55 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: qcom: Add USB port definitions to ipq806x
Message-ID: <eeb3a0ecb669ce0d7bb1fc3f842831cfc7d5f181.1621097174.git.noodles@earth.li>
References: <cover.1621097174.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621097174.git.noodles@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 88 +++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 582d8a59e59b..afa11acfb378 100644
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

