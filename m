Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B03B1825F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 00:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbfEHWnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 18:43:17 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37066 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728607AbfEHWnQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 18:43:16 -0400
Received: by mail-pl1-f196.google.com with SMTP id p15so108501pll.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 15:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZRWOAg/RyHnGg26N15yptA5VgOFfFjkzmzqD1kcfUOw=;
        b=RdT8BY5t8wPzm+4po1DJeApnXg3skW0a2CPSwwA/bsFs8Vj4+pFwxByzwZjW8sK8wN
         rA4i0GwqqgOFGvf/Tz+SyKfKVLveGxi12/drxfs0A45/+geWHyUP4RbbvKmuRV75YOS6
         +xnR4i1S5iR6FdROsAr57ggWtH4GqlCQudDQdlbJ3qbZFrwYNv4QPqXQtmNitRI4r6tT
         N09mpV+sfgE8URu8yOsw8V/Zd3nOJajqkvrO53+iaFDldnJV2Fic3nSQzmZKxwqGFYCX
         pM6+qFODqdiVAew5IGuCBcRvRyHOXhPZAK6SnydWxsnMiSXCOBUf9TMxS0SWKOPryHb7
         3d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZRWOAg/RyHnGg26N15yptA5VgOFfFjkzmzqD1kcfUOw=;
        b=QL4/eoc4Mk9DCDvmGu2EfgpJ0M8sSTP3uFHGBtWbAF/DRnY5qrllrrVlT1NhG+doFk
         uETPUNWMexOduY83gNt8kQ8viZAtJvwF+9/0+gIROrEctM7D71to/phpOgIRJ6GgCmVl
         7W/IZOnmLNJdZqCo5YMzmixV2UWaNLc/P+2KuGh5/+xUnfUQzSe6Fxe0C+ZPfyXBxrFp
         EwIeLI7c2DNzbQLJXSasZoO3xnWdpoCL/69uKfjKGE6UsZCpZ4efMEvNcCdAAwG/M0kh
         Rr1ZlbBd04eX7YGngllT7TK6M/Q//8vlMJ4xThm7bXqjKvAADb629E/m9t/GriDvC8qm
         XEDQ==
X-Gm-Message-State: APjAAAVxOlwaKGzSKa0GfTn7UbC6TfOpotlHuUsR01FlvA6MZErOdIYY
        DNubKy8TPk7GokzfB+93DF7csA==
X-Google-Smtp-Source: APXvYqzp0faxVfN4AREXFDyjq/oRrZq5pxi5rj2y4qzUEN/mC7d+4AQVN2DyqyI6hlzo4Qqwb2cyoA==
X-Received: by 2002:a17:902:7294:: with SMTP id d20mr406356pll.276.1557355395687;
        Wed, 08 May 2019 15:43:15 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 25sm320494pfo.145.2019.05.08.15.43.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 15:43:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] arm64: dts: qcom: qcs404: Add PCIe related nodes
Date:   Wed,  8 May 2019 15:43:08 -0700
Message-Id: <20190508224309.5744-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190508224309.5744-1-bjorn.andersson@linaro.org>
References: <20190508224309.5744-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCS404 has a PCIe2 PHY and a Qualcomm PCIe controller, define these
to for the platform.

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Split single patch, no functional change

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 65 ++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 65a2cbeb28be..f97e9c96b7f7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -412,6 +412,21 @@
 			#interrupt-cells = <4>;
 		};
 
+		pcie_phy: phy@7786000 {
+			compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
+			reg = <0x07786000 0xb8>;
+
+			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+			resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
+				 <&gcc GCC_PCIE_0_PIPE_ARES>;
+			reset-names = "phy", "pipe";
+
+			clock-output-names = "pcie_0_pipe_clk";
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		sdcc1: sdcc@7804000 {
 			compatible = "qcom,sdhci-msm-v5";
 			reg = <0x07804000 0x1000>, <0x7805000 0x1000>;
@@ -797,6 +812,56 @@
 				status = "disabled";
 			};
 		};
+
+		pcie: pci@10000000 {
+			compatible = "qcom,pcie-qcs404", "snps,dw-pcie";
+			reg =  <0x10000000 0xf1d>,
+			       <0x10000f20 0xa8>,
+			       <0x07780000 0x2000>,
+			       <0x10001000 0x2000>;
+			reg-names = "dbi", "elbi", "parf", "config";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x81000000 0 0          0x10003000 0 0x00010000>, /* I/O */
+				 <0x82000000 0 0x10013000 0x10013000 0 0x007ed000>; /* memory */
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			clocks = <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>;
+			clock-names = "iface", "aux", "master_bus", "slave_bus";
+
+			resets = <&gcc GCC_PCIE_0_AXI_MASTER_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_SLAVE_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_MASTER_STICKY_ARES>,
+				 <&gcc GCC_PCIE_0_CORE_STICKY_ARES>,
+				 <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_AHB_ARES>;
+			reset-names = "axi_m",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "pipe_sticky",
+				      "pwr",
+				      "ahb";
+
+			phys = <&pcie_phy>;
+			phy-names = "pciephy";
+
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.18.0

