Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D33138B53C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 19:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbhETRbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 13:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234383AbhETRbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 13:31:40 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786A6C061574;
        Thu, 20 May 2021 10:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ioi3waAr1lR9usSqi7Atv2O2Gz6ffig/mjFfjQ//hqg=; b=IFEi9MQweuY3DlkggNTNwfa8C7
        WM3aswDn2GHz8pS64HUhOaAlEPXRWOTCU5cXoOkjGooE5vERxEG4jjDTmXsviS3lRvK5D5EZyzKnF
        7yrdSP+iWqGfvSSeZWSxfAy1yGAiVq8b8pk+3Q9S6PgsMrWx433yDMLZwtO1N3/m3gnlzI/W+2p7s
        yRE2BoKD6GJYqb38COsE8LqzEI+KFPZl5kxuJ4+N0H/xvAoRljTz7bxzAsF3ZcOboBPLiU45UMJ4w
        SO1FPdpHMXzBITiVqrMa2vJfhyoaZs5FnJq220X4HnhgOn2V93nGy7ht0tblC2XthD8W8XOduG4TX
        RHdQV1/Q==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1ljmUy-0003vx-4u; Thu, 20 May 2021 18:30:16 +0100
Date:   Thu, 20 May 2021 18:30:16 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] ARM: dts: qcom: Enable NAND + USB for RB3011
Message-ID: <1e5c89ba0d2491ca374f10e0446e21d0e42afd34.1621531633.git.noodles@earth.li>
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

Enable the NAND + USB devices for the MikroTik RB3011 platform now
they're in the main IPQ806x DT.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
index 282b89ce3d45..f7ea2e5dd191 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
@@ -216,6 +216,10 @@
 	};
 };
 
+&adm_dma {
+	status = "okay";
+};
+
 &gmac0 {
 	status = "okay";
 
@@ -251,6 +255,39 @@
 	status = "okay";
 };
 
+&hs_phy_1 {
+	status = "okay";
+};
+
+&nand {
+	status = "okay";
+
+	nandcs@0 {
+		compatible = "qcom,nandcs";
+		reg = <0>;
+
+		nand-ecc-strength = <4>;
+		nand-bus-width = <8>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			boot@0 {
+				label = "RouterBoard NAND 1 Boot";
+				reg = <0x0000000 0x0800000>;
+			};
+
+			main@800000 {
+				label = "RouterBoard NAND 1 Main";
+				reg = <0x0800000 0x7800000>;
+			};
+		};
+	};
+};
+
 &qcom_pinmux {
 	buttons_pins: buttons_pins {
 		mux {
@@ -305,4 +342,25 @@
 			input-disable;
 		};
 	};
+
+	usb1_pwr_en_pins: usb1_pwr_en_pins {
+		mux {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+			output-high;
+		};
+	};
+};
+
+&ss_phy_1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	pinctrl-0 = <&usb1_pwr_en_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
-- 
2.20.1

