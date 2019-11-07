Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E52EF2346
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732543AbfKGAW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:22:56 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39171 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732433AbfKGAWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:22:55 -0500
Received: by mail-pg1-f193.google.com with SMTP id 29so408232pgm.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMqJN5UHTLl3Z21ZhJB4FAKOptyfVu99KuKppBjss1E=;
        b=osHHklz9cEKZNTMsegzUSVTedGqOvzz/bNh2WL0fy1JkDnHD5h1G54ehM1X+njoNiU
         1igG9FylRa7UuvHdDGSOrU/7KRxw+1ZjFqkdvciczp09K6FoHmtjSRTzYkOulALbSGCZ
         m9HEa/TD3u2jjmCuRAMCRIpVjhH2co7Jdxv7c7DbY0mG2K+P8HESj9tIqA2YUCRwwkrp
         jPv6tluCXn5NcpioLsO3CvtGkkRNqiqsqigphfZ4/iX3/ADx2XIEB6WvsOkV4F+N6vJO
         HPly2FiBBVBj6edx80gxf9/DOK0Dm/ZwVbpOyOdntoqSWzIekyPt/etXlkByKvgYLCjv
         iOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMqJN5UHTLl3Z21ZhJB4FAKOptyfVu99KuKppBjss1E=;
        b=b0xNfliO+PdJWh6fEN8QkgCa8uU1CbTI4cVyJ9M9wsJGbhIhkoAMOLC1TN2Z0Bz3pa
         bj1fnZpxmJ6DTnuaXffDbDI1Scpgk6UdwFeCY41jtDilYY2SKl5VkQpokUvplMr5NGBX
         XaEIMp2wOAkPd1AWbWhrrEBcxVG06eK4Qgpjls1cuBr/wkUtXLDNMlcCSKE+psEAZZ+d
         QLwzwXT7ElpYqH58VtgDgYCs+xQY9XPsuCql/IkvB8gO3VhAIobRNdNIe+QHJqeT0UiT
         JI0opxpQk5D/gb1IsvSeszs3oD9SWn2RgjQcZgM/jDaj6SHB9qfRQV8RFU++7wmMsbNs
         NWfA==
X-Gm-Message-State: APjAAAXbSZo5xMGP8tRgwFXrhFUimr60fMJ1chDJ2olW0qlHl8dB1lo8
        7H47HAp7DgsGtPrLQtyqQ4Iibg==
X-Google-Smtp-Source: APXvYqxsyWdGVjqpKvcWRqcgrVR1QGmWXnLNDwCmgDxP/rVtwRWVhhiCEZBqTpED7urd+AIohC0LUQ==
X-Received: by 2002:a17:90a:a002:: with SMTP id q2mr946206pjp.124.1573086173771;
        Wed, 06 Nov 2019 16:22:53 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i13sm155272pfo.39.2019.11.06.16.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:22:53 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sdm845: Add second PCIe PHY and controller
Date:   Wed,  6 Nov 2019 16:22:46 -0800
Message-Id: <20191107002247.1127689-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
References: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the second PCIe controller and the associated QHP PHY found on
SDM845.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up Vinod's R-b
- Dropped interconnect property, for now

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 108 +++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b93537b7a59f..f091670f1bdc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1468,6 +1468,114 @@
 			};
 		};
 
+		pcie1: pci@1c08000 {
+			compatible = "qcom,pcie-sdm845", "snps,dw-pcie";
+			reg = <0 0x01c08000 0 0x2000>,
+			      <0 0x40000000 0 0xf1d>,
+			      <0 0x40000f20 0 0xa8>,
+			      <0 0x40100000 0 0x100000>;
+			reg-names = "parf", "dbi", "elbi", "config";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+
+			interrupts = <GIC_SPI 307 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
+				 <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_CLKREF_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>;
+			clock-names = "pipe",
+				      "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ref",
+				      "tbu";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			iommus = <&apps_smmu 0x1c00 0xf>;
+			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
+				    <0x100 &apps_smmu 0x1c01 0x1>,
+				    <0x200 &apps_smmu 0x1c02 0x1>,
+				    <0x300 &apps_smmu 0x1c03 0x1>,
+				    <0x400 &apps_smmu 0x1c04 0x1>,
+				    <0x500 &apps_smmu 0x1c05 0x1>,
+				    <0x600 &apps_smmu 0x1c06 0x1>,
+				    <0x700 &apps_smmu 0x1c07 0x1>,
+				    <0x800 &apps_smmu 0x1c08 0x1>,
+				    <0x900 &apps_smmu 0x1c09 0x1>,
+				    <0xa00 &apps_smmu 0x1c0a 0x1>,
+				    <0xb00 &apps_smmu 0x1c0b 0x1>,
+				    <0xc00 &apps_smmu 0x1c0c 0x1>,
+				    <0xd00 &apps_smmu 0x1c0d 0x1>,
+				    <0xe00 &apps_smmu 0x1c0e 0x1>,
+				    <0xf00 &apps_smmu 0x1c0f 0x1>;
+
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "pci";
+
+			power-domains = <&gcc PCIE_1_GDSC>;
+
+			phys = <&pcie1_lane>;
+			phy-names = "pciephy";
+
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@1c0a000 {
+			compatible = "qcom,sdm845-qhp-pcie-phy";
+			reg = <0 0x01c0a000 0 0x800>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_CLKREF_CLK>,
+				 <&gcc GCC_PCIE_PHY_REFGEN_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_PHY_REFGEN_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			status = "disabled";
+
+			pcie1_lane: lanes@1c06200 {
+				reg = <0 0x01c0a800 0 0x800>,
+				      <0 0x01c0a800 0 0x800>,
+				      <0 0x01c0b800 0 0x400>;
+				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
+				clock-names = "pipe0";
+
+				#phy-cells = <0>;
+				clock-output-names = "pcie_1_pipe_clk";
+			};
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sdm845-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
2.23.0

