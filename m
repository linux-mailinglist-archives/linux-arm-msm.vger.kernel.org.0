Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7C93819FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 18:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233860AbhEOQyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 12:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233837AbhEOQyc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 12:54:32 -0400
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 15 May 2021 09:53:18 PDT
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55149C06174A;
        Sat, 15 May 2021 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=8SHldVPRB3IgRIGvdvG9IQiPYuel04QK7Wt6vmIztp4=; b=bcvBSu5hwtNHXT67Bx9UlR5Eyk
        WPw8JXxiFyV+G8jxixsFDOSyZzb3QZZdCb2BQg0dZkpzBCu4X8cBXOoVyLIyr2R8JEAmHqdN1QUbO
        49KGaSzYydpcXNG1uIU9CjpR9gKVpGoIhcEh/IEqbkwjyPTO9XGui85GK/vgf0C34eixgmnYzB0oB
        gTB72Bjb5FDXjL+lWbugRZiSWQ8pd/JjuIOOLjL0RJbkFiRLJsoxcwo2Ukcims8DxNA+8YUbo+AmY
        ang4uE4hmzPax+h2JPDN5XqrlS0h4KX4OKEdx+W7IhwTJNl5DGZstNwdxbfm88eco9/zgZWYK9x1o
        HOK+5RNg==;
Received: from [2001:4d48:ad59:1409:4::2] (helo=youmian.o362.us)
        by the.earth.li with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1lhxXO-0004UW-Km; Sat, 15 May 2021 17:53:14 +0100
Date:   Sat, 15 May 2021 17:53:10 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] ARM: dts: qcom: add L2CC and RPM for IPQ8064
Message-ID: <bc31c86e21e56536cd537b2b31f03d0f6532e295.1621097174.git.noodles@earth.li>
References: <cover.1621097174.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621097174.git.noodles@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the L2CC IPC resource and RPM devices to the IPQ8064 device
tree.

Tested on a Mikrotik RB3011.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index afa11acfb378..e4e3dc59c650 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -2,6 +2,8 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mfd/qcom-rpm.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
 #include <dt-bindings/clock/qcom,lcc-ipq806x.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -753,11 +755,38 @@
 			};
 		};
 
+		rpm: rpm@108000 {
+			compatible = "qcom,rpm-ipq8064";
+			reg = <0x108000 0x1000>;
+			qcom,ipc = <&l2cc 0x8 2>;
+
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ack", "err", "wakeup";
+
+			clocks = <&gcc RPM_MSG_RAM_H_CLK>;
+			clock-names = "ram";
+
+			rpmcc: clock-controller {
+				compatible = "qcom,rpmcc-ipq806x", "qcom,rpmcc";
+				#clock-cells = <1>;
+			};
+		};
+
 		tcsr: syscon@1a400000 {
 			compatible = "qcom,tcsr-ipq8064", "syscon";
 			reg = <0x1a400000 0x100>;
 		};
 
+		l2cc: clock-controller@2011000 {
+			compatible = "qcom,kpss-gcc", "syscon";
+			reg = <0x2011000 0x1000>;
+			clocks = <&gcc PLL8_VOTE>, <&gcc PXO_SRC>;
+			clock-names = "pll8_vote", "pxo";
+			clock-output-names = "acpu_l2_aux";
+		};
+
 		lcc: clock-controller@28000000 {
 			compatible = "qcom,lcc-ipq8064";
 			reg = <0x28000000 0x1000>;
-- 
2.20.1

