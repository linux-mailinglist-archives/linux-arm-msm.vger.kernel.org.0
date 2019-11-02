Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073C2ECC76
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbfKBAby (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:31:54 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43520 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbfKBAby (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:31:54 -0400
Received: by mail-pl1-f194.google.com with SMTP id a18so3899597plm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LcVGEQnpl0tN+DolQ4L0BObc3QlXKNhpflTzxn+/la0=;
        b=gJcl899ddyTuzqDHnGtVe1uV6ShX5JTgl+fYF+aHAwHTNpciUyXhi0mCXwfQzk3M1P
         /Fk+DHpHRMJ+sCeqwWhY6lPXo7DAQpXC6xkPMCHNxa37t3U+AZqBWi3tKldl1wn22uh9
         6Tq4B90xsOTHnZxOlZuNBWVT0gvENnWJ683HLpowdY9QD8NDTI5pQPZuG/54Kq5q6g1c
         SpGvE7XTKK1xY6GtdM+Yfqr7Fp/varc9rBNyVccEvDh1KzCW3DxcyhbfAutCg7Cz4Tlp
         8vl4u3YKNcYyylhX7VfgXnGXW2thEwmh03+P0TrMb4MSLiVi+tt3buWWLglhO+EC2GfJ
         ZJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LcVGEQnpl0tN+DolQ4L0BObc3QlXKNhpflTzxn+/la0=;
        b=jVFucmyghowDG+BzqyzbQwDTDmnIeaFQZVv5Bh97zUxq3YL/F0/vHogdXycZs6l71x
         O0/ItpRdZ3LhxF7UUnxEFlZoywsKGNVqQKbDdvOj4mI5Rb/MYpdgQ3QPui67/X6Vu9Kh
         m4UFg+cLKFMESiHJ/9elT7O7hJSsXCvMA5NExH4RCUJLcPkim/sWaC9zhejqTDW+N6pC
         r9VP2y+O6IE40zWx783eHMztbh9S5YKFPpGSFI1hZXpIl1lsIRYEa9D7wx8cmR63deFB
         +UL16jppFFmxHC7dGV2W0Fejcno2Vo49Zxlcdrh0sbyPu9xdwySEoUMcQ4M9URjcsZy4
         nnXQ==
X-Gm-Message-State: APjAAAUZvLSpw6ieBDKLX7UBJBOUXsbh8mTap3c6Sr2dKS6SoQBjrHvN
        driKcvZXMVnf4HnXlThmLt5G+A==
X-Google-Smtp-Source: APXvYqzT3SdBXDziT+bP3e78UxHkGoPuvTqzw9tEwghuKpIy7kttauLKfnvwQl2Gpe9uDbWfPb51/Q==
X-Received: by 2002:a17:902:bd93:: with SMTP id q19mr15303135pls.170.1572654713041;
        Fri, 01 Nov 2019 17:31:53 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v2sm7957522pfm.13.2019.11.01.17.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:31:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sdm845: Add first PCIe controller and PHY
Date:   Fri,  1 Nov 2019 17:31:46 -0700
Message-Id: <20191102003148.4091335-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
References: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the GEN2 PCIe controller and PHY found on SDM845.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 104 +++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..b93537b7a59f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1364,6 +1364,110 @@
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pcie0: pci@1c00000 {
+			compatible = "qcom,pcie-sdm845", "snps,dw-pcie";
+			reg = <0 0x01c00000 0 0x2000>,
+			      <0 0x60000000 0 0xf1d>,
+			      <0 0x60000f20 0 0xa8>,
+			      <0 0x60100000 0 0x100000>;
+			reg-names = "parf", "dbi", "elbi", "config";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0xd00000>;
+
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
+				 <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>;
+			clock-names = "pipe",
+				      "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "tbu";
+
+			iommus = <&apps_smmu 0x1c10 0xf>;
+			iommu-map = <0x0   &apps_smmu 0x1c10 0x1>,
+				    <0x100 &apps_smmu 0x1c11 0x1>,
+				    <0x200 &apps_smmu 0x1c12 0x1>,
+				    <0x300 &apps_smmu 0x1c13 0x1>,
+				    <0x400 &apps_smmu 0x1c14 0x1>,
+				    <0x500 &apps_smmu 0x1c15 0x1>,
+				    <0x600 &apps_smmu 0x1c16 0x1>,
+				    <0x700 &apps_smmu 0x1c17 0x1>,
+				    <0x800 &apps_smmu 0x1c18 0x1>,
+				    <0x900 &apps_smmu 0x1c19 0x1>,
+				    <0xa00 &apps_smmu 0x1c1a 0x1>,
+				    <0xb00 &apps_smmu 0x1c1b 0x1>,
+				    <0xc00 &apps_smmu 0x1c1c 0x1>,
+				    <0xd00 &apps_smmu 0x1c1d 0x1>,
+				    <0xe00 &apps_smmu 0x1c1e 0x1>,
+				    <0xf00 &apps_smmu 0x1c1f 0x1>;
+
+			resets = <&gcc GCC_PCIE_0_BCR>;
+			reset-names = "pci";
+
+			power-domains = <&gcc PCIE_0_GDSC>;
+
+			phys = <&pcie0_lane>;
+			phy-names = "pciephy";
+
+			status = "disabled";
+		};
+
+		pcie0_phy: phy@1c06000 {
+			compatible = "qcom,sdm845-qmp-pcie-phy";
+			reg = <0 0x01c06000 0 0x18c>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_CLKREF_CLK>,
+				 <&gcc GCC_PCIE_PHY_REFGEN_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_PHY_REFGEN_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			status = "disabled";
+
+			pcie0_lane: lanes@1c06200 {
+				reg = <0 0x01c06200 0 0x128>,
+				      <0 0x01c06400 0 0x1fc>,
+				      <0 0x01c06800 0 0x218>,
+				      <0 0x01c06600 0 0x70>;
+				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+				clock-names = "pipe0";
+
+				#phy-cells = <0>;
+				clock-output-names = "pcie_0_pipe_clk";
+			};
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sdm845-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
2.23.0

