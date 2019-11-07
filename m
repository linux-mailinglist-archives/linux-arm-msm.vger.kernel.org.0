Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 162D1F234B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732675AbfKGAXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:23:00 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43544 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbfKGAWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:22:54 -0500
Received: by mail-pf1-f195.google.com with SMTP id 3so605521pfb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sCtg4Oe1bns8tpbhK9bg1Uwi/CMwZ245VcXGMxHA0Ak=;
        b=ZklvcdzFQuRr7T7f05GOCLM+8sn5Q45e8AP6hl02rAD7BaxRUzKLxFh5Ah64JCYWJh
         S48DX+O9jIJ46qz6OjK3WlFDC15cpugeaXCYAQqry2oBgT9XoLWZNMSsJTlmVsWigLcS
         UYaBKoYo64G9A190a6oaw9+BDRMzYnaodSbewBecm8D07MWzLOTHNs5gYeYuweVV0iWz
         dp/vSnfM/8kfylS6lIlr5kvcdBHPKMRtJ3YKg0BIAvvc4yTiyrwcuFQDpYG+2UTSNibp
         mmHDw22YbnJm0rT7reUsnzqTwZBlWgwyM77m0OHPa7u8w2SK8PKuXqDfA5zYAgTYe94V
         aLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sCtg4Oe1bns8tpbhK9bg1Uwi/CMwZ245VcXGMxHA0Ak=;
        b=XIYunRuKBhTIPurCXfXrUmscO4LI8LSehd0RyNl2qSCKBDukKWYo7qXgJmpigkfU8Z
         vKVP0ARUP2bUH5WY25jJ+GOZL/HqzJyPCG6A7h8oY7mO+mO6/XvWgtgHO4EPPwGYx2ny
         FXZ5CbRyGpZ/fdhFP+LlscDWiReI0PbbNepGLYX6Y++4Sj2BkIHsJfsGi4pM6zz2J6R8
         pwihZLPgwDDoGkqwzHF3M9/FUNVrxp91kI3LFPGdiSgiNn64dEjE0md2SBkWQBK82fDy
         +vSHM+KRgqDnoY3tVfUALpuTz4vm49/eHV56RK0KZF/lnoSYtvr24U9amQ3UIWLIYRa8
         zLGw==
X-Gm-Message-State: APjAAAVVRUW1PB38+Dp6sNxc483L1MaFRwUil3/twQAVPJLsw353l8a5
        ImyYnM29qrhCqSQyJVRGrtQ5BQ==
X-Google-Smtp-Source: APXvYqzzisJp6pcURtk6Zl4z4PQThRHFZ5mD/vSupAjltua8C83buJbCLjnoLlSNtiESREWMzQUknw==
X-Received: by 2002:a17:90a:98d:: with SMTP id 13mr944607pjo.98.1573086172484;
        Wed, 06 Nov 2019 16:22:52 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i13sm155272pfo.39.2019.11.06.16.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:22:51 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sdm845: Add first PCIe controller and PHY
Date:   Wed,  6 Nov 2019 16:22:45 -0800
Message-Id: <20191107002247.1127689-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
References: <20191107002247.1127689-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the GEN2 PCIe controller and PHY found on SDM845.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up Vinod's R-b

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

