Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1224D1D869B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387924AbgERSZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387923AbgERSZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:25:22 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80BBC061A0C;
        Mon, 18 May 2020 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=NOEATbHih4e6QP8ruGj44dsqQNDb0OKT1gy3kLZ+YnY=; b=rwK1tKZl/xktGHTrTYBvCmMlip
        Yiw+4/NJQRQqoDbemtl5D6JW6MdY8sHTNk4cabtIWYyaJMzEbYhssK4ig+sOgWgm6zgU2ceFaCHLX
        GHBY/URRKVmwdGHF0bDkOP7j2Dt7D0QEc+b/0jzxP7MKbFHqZdEh1k7+8HWsm4mmj07vY6gHJHJ5x
        9hGwhunTktVqr7ruLbC1hp6H8TunhoiEJXQ5rQEVMN/vXW9Ed4heVsvF+kcVRxhTYxeY4vmZARBfh
        LrNhn845RPK9EAMiMglpsWrqslVETLmXnHDJHrH/dBwKx7e15tosgfWm1HAuH42EtEmO//6HtJ8bP
        ZMqWdMWg==;
Received: from [2001:4d48:ad59:1409:4::2] (helo=youmian.o362.us)
        by the.earth.li with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1jakD2-0008LF-Pl; Mon, 18 May 2020 19:09:52 +0100
Date:   Mon, 18 May 2020 19:09:49 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: qcom: add ethernet definitions to ipq8064
Message-ID: <723344332357b5eed957443ec4a705a080fcc2da.1589824955.git.noodles@earth.li>
References: <cover.1589824955.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1589824955.git.noodles@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Plumb in the 4 IPQ8064 stmmac based ethernet interfaces.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 108 ++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index b912da9a3ff3..9c0d5510c805 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -597,6 +597,114 @@
 			perst-gpio = <&qcom_pinmux 63 GPIO_ACTIVE_LOW>;
 		};
 
+		nss_common: syscon@03000000 {
+			compatible = "syscon";
+			reg = <0x03000000 0x0000FFFF>;
+		};
+
+		qsgmii_csr: syscon@1bb00000 {
+			compatible = "syscon";
+			reg = <0x1bb00000 0x000001FF>;
+		};
+
+		stmmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <7>;
+			snps,rd_osr_lmt = <7>;
+			snps,blen = <16 0 0 0 0 0 0>;
+		};
+
+		gmac0: ethernet@37000000 {
+			device_type = "network";
+			compatible = "qcom,ipq806x-gmac";
+			reg = <0x37000000 0x200000>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,pbl = <32>;
+			snps,aal = <1>;
+
+			qcom,nss-common = <&nss_common>;
+			qcom,qsgmii-csr = <&qsgmii_csr>;
+
+			clocks = <&gcc GMAC_CORE1_CLK>;
+			clock-names = "stmmaceth";
+
+			resets = <&gcc GMAC_CORE1_RESET>;
+			reset-names = "stmmaceth";
+
+			status = "disabled";
+		};
+
+		gmac1: ethernet@37200000 {
+			device_type = "network";
+			compatible = "qcom,ipq806x-gmac";
+			reg = <0x37200000 0x200000>;
+			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,pbl = <32>;
+			snps,aal = <1>;
+
+			qcom,nss-common = <&nss_common>;
+			qcom,qsgmii-csr = <&qsgmii_csr>;
+
+			clocks = <&gcc GMAC_CORE2_CLK>;
+			clock-names = "stmmaceth";
+
+			resets = <&gcc GMAC_CORE2_RESET>;
+			reset-names = "stmmaceth";
+
+			status = "disabled";
+		};
+
+		gmac2: ethernet@37400000 {
+			device_type = "network";
+			compatible = "qcom,ipq806x-gmac";
+			reg = <0x37400000 0x200000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,pbl = <32>;
+			snps,aal = <1>;
+
+			qcom,nss-common = <&nss_common>;
+			qcom,qsgmii-csr = <&qsgmii_csr>;
+
+			clocks = <&gcc GMAC_CORE3_CLK>;
+			clock-names = "stmmaceth";
+
+			resets = <&gcc GMAC_CORE3_RESET>;
+			reset-names = "stmmaceth";
+
+			status = "disabled";
+		};
+
+		gmac3: ethernet@37600000 {
+			device_type = "network";
+			compatible = "qcom,ipq806x-gmac";
+			reg = <0x37600000 0x200000>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,pbl = <32>;
+			snps,aal = <1>;
+
+			qcom,nss-common = <&nss_common>;
+			qcom,qsgmii-csr = <&qsgmii_csr>;
+
+			clocks = <&gcc GMAC_CORE4_CLK>;
+			clock-names = "stmmaceth";
+
+			resets = <&gcc GMAC_CORE4_RESET>;
+			reset-names = "stmmaceth";
+
+			status = "disabled";
+		};
+
 		vsdcc_fixed: vsdcc-regulator {
 			compatible = "regulator-fixed";
 			regulator-name = "SDCC Power";
-- 
2.20.1

