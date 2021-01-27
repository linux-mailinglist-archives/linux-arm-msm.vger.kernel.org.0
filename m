Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0122030683E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 00:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhA0Xp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 18:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbhA0XnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 18:43:09 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388A8C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:42:28 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id e2so1509669lfj.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kv9MHRCO81ZurLJ50rxgvjKW+sg/Z4ATkKwCD6isELU=;
        b=hDHumgd4AYqSmxBH0abnJCmKGbUytO/KhTNmCg/9WMZdO80hNDBlpF1CyLsltwdAKQ
         VBS9GLFemEOBBinTtsH5uBlgQMg+U048odF5aJkEauJXNFa8iyElpakF3n7Z9dX3mEmA
         7OE2Qzmj8g5Q/2Mfl8okMzwZ/oP7Fy3ZmM3E9naPFGO3JP2xgpHXNfDXoO2CZqeWnjLW
         6UF3BUi4imOJCh911ZPUo8NNIxf/HJcJb4iWGWz5tMnP1EjYN4dMUZM1uMzcAbG4DJXV
         L9bLQ22J9oTTp2BQ00N8no2ySD+eGip8EMlFGVbMRPhh6PKHu5HtwqtWArx2hQjRXdZ4
         NLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kv9MHRCO81ZurLJ50rxgvjKW+sg/Z4ATkKwCD6isELU=;
        b=UOe0leLa358Nkl/D11kDSa7iN0PsUaxHytTr//sCRMzOW0dgm6YJqi3eY7u28EM8Rt
         ziUWIiV7DuIDVEzaFJ1BBneacvRC4CgfyGDHDNLMzHk7bqOzFW3e92dKDlPwAICnaBXz
         bi8Uk0UvYvFYqfdO1WFPznOPdFX+HrO68+fNB2rWyRptHDKTwIHn5sBGnCR9b+6h4Gqk
         DEsF64HZ0y3ffdclgaF3rHofXbUuP9+pjAbwgLx+nYbCyzaAvyc3/yZERbScmVEVSo/a
         xANDGO1lFbBn9vRz8LhKaRCAkc1IpxXDNAqbrP4avODTZwnijDo8ytgWSlsHHqlCkmP+
         zEtg==
X-Gm-Message-State: AOAM532ExlRTRyTJZTrQpGr4rXfkFt8n9xxLVxBA8bhoQET20ZV5XE6R
        8jxNfKrFeNfhR/hFdxzM66zp1w==
X-Google-Smtp-Source: ABdhPJyJNmydaaHdkEarWMB6OZQ3wK9mlePCrkXbcGp8OIY2Kftj2+dlOHP47NU8tlRxs5tHSMEPeQ==
X-Received: by 2002:ac2:5d4f:: with SMTP id w15mr6092850lfd.321.1611790946713;
        Wed, 27 Jan 2021 15:42:26 -0800 (PST)
Received: from eriador.lan ([94.25.229.83])
        by smtp.gmail.com with ESMTPSA id f82sm939541lfd.280.2021.01.27.15.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 15:42:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250: Add PCIe suppport
Date:   Thu, 28 Jan 2021 02:42:20 +0300
Message-Id: <20210127234221.947306-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127234221.947306-1-dmitry.baryshkov@linaro.org>
References: <20210127234221.947306-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Add PCIe support for Qcom SM8250 SoC. This SoC has 3 PCIe Gen 3
instances based on Designware IP, out of which PCIe0 has 1 lane support
and the rest have 2 lane support.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
[DB: add ddrss_sf_tbu clock]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 293 +++++++++++++++++++++++++++
 1 file changed, 293 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 20e70d5641ea..4c6d7cdf869e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1231,6 +1231,299 @@ mmss_noc: interconnect@1740000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		pcie0: pci@1c00000 {
+			compatible = "qcom,pcie-sm8250", "snps,dw-pcie";
+			reg = <0 0x01c00000 0 0x3000>,
+			      <0 0x60000000 0 0xf1d>,
+			      <0 0x60000f20 0 0xa8>,
+			      <0 0x60001000 0 0x1000>,
+			      <0 0x60100000 0 0x100000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
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
+				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>;
+			clock-names = "pipe",
+				      "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "tbu",
+				      "ddrss_sf_tbu";
+
+			iommus = <&apps_smmu 0x1c00 0x7f>;
+			iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
+				    <0x100 &apps_smmu 0x1c01 0x1>;
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
+			compatible = "qcom,sm8250-qmp-gen3x1-pcie-phy";
+			reg = <0 0x01c06000 0 0x1c0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_WIFI_CLKREF_EN>,
+				 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE0_PHY_REFGEN_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			status = "disabled";
+
+			pcie0_lane: lanes@1c06200 {
+				reg = <0 0x1c06200 0 0x170>, /* tx */
+				      <0 0x1c06400 0 0x200>, /* rx */
+				      <0 0x1c06800 0 0x1f0>, /* pcs */
+				      <0 0x1c06c00 0 0xf4>; /* "pcs_lane" same as pcs_misc? */
+				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+				clock-names = "pipe0";
+
+				#phy-cells = <0>;
+				clock-output-names = "pcie_0_pipe_clk";
+			};
+		};
+
+		pcie1: pci@1c08000 {
+			compatible = "qcom,pcie-sm8250", "snps,dw-pcie";
+			reg = <0 0x01c08000 0 0x3000>,
+			      <0 0x40000000 0 0xf1d>,
+			      <0 0x40000f20 0 0xa8>,
+			      <0 0x40001000 0 0x1000>,
+			      <0 0x40100000 0 0x100000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_EDGE_RISING>;
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
+				 <&gcc GCC_PCIE_WIGIG_CLKREF_EN>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>;
+			clock-names = "pipe",
+				      "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ref",
+				      "tbu",
+				      "ddrss_sf_tbu";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			iommus = <&apps_smmu 0x1c80 0x7f>;
+			iommu-map = <0x0   &apps_smmu 0x1c80 0x1>,
+				    <0x100 &apps_smmu 0x1c81 0x1>;
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
+		pcie1_phy: phy@1c0e000 {
+			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
+			reg = <0 0x01c0e000 0 0x1c0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_WIGIG_CLKREF_EN>,
+				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			status = "disabled";
+
+			pcie1_lane: lanes@1c0e200 {
+				reg = <0 0x1c0e200 0 0x170>, /* tx0 */
+				      <0 0x1c0e400 0 0x200>, /* rx0 */
+				      <0 0x1c0ea00 0 0x1f0>, /* pcs */
+				      <0 0x1c0e600 0 0x170>, /* tx1 */
+				      <0 0x1c0e800 0 0x200>, /* rx1 */
+				      <0 0x1c0ee00 0 0xf4>; /* "pcs_com" same as pcs_misc? */
+				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
+				clock-names = "pipe0";
+
+				#phy-cells = <0>;
+				clock-output-names = "pcie_1_pipe_clk";
+			};
+		};
+
+		pcie2: pci@1c10000 {
+			compatible = "qcom,pcie-sm8250", "snps,dw-pcie";
+			reg = <0 0x01c10000 0 0x3000>,
+			      <0 0x64000000 0 0xf1d>,
+			      <0 0x64000f20 0 0xa8>,
+			      <0 0x64001000 0 0x1000>,
+			      <0 0x64100000 0 0x100000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x64200000 0x0 0x64200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x64300000 0x0 0x64300000 0x0 0x3d00000>;
+
+			interrupts = <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 290 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 415 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 416 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 417 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+			clocks = <&gcc GCC_PCIE_2_PIPE_CLK>,
+				 <&gcc GCC_PCIE_2_AUX_CLK>,
+				 <&gcc GCC_PCIE_2_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_2_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_2_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_2_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_PCIE_MDM_CLKREF_EN>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>;
+			clock-names = "pipe",
+				      "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ref",
+				      "tbu",
+				      "ddrss_sf_tbu";
+
+			assigned-clocks = <&gcc GCC_PCIE_2_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			iommus = <&apps_smmu 0x1d00 0x7f>;
+			iommu-map = <0x0   &apps_smmu 0x1d00 0x1>,
+				    <0x100 &apps_smmu 0x1d01 0x1>;
+
+			resets = <&gcc GCC_PCIE_2_BCR>;
+			reset-names = "pci";
+
+			power-domains = <&gcc PCIE_2_GDSC>;
+
+			phys = <&pcie2_lane>;
+			phy-names = "pciephy";
+
+			status = "disabled";
+		};
+
+		pcie2_phy: phy@1c16000 {
+			compatible = "qcom,sm8250-qmp-modem-pcie-phy";
+			reg = <0 0x1c16000 0 0x1c0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_2_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_MDM_CLKREF_EN>,
+				 <&gcc GCC_PCIE2_PHY_REFGEN_CLK>;
+			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+
+			resets = <&gcc GCC_PCIE_2_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE2_PHY_REFGEN_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			status = "disabled";
+
+			pcie2_lane: lanes@1c0e200 {
+				reg = <0 0x1c16200 0 0x170>, /* tx0 */
+				      <0 0x1c16400 0 0x200>, /* rx0 */
+				      <0 0x1c16a00 0 0x1f0>, /* pcs */
+				      <0 0x1c16600 0 0x170>, /* tx1 */
+				      <0 0x1c16800 0 0x200>, /* rx1 */
+				      <0 0x1c16e00 0 0xf4>; /* "pcs_com" same as pcs_misc? */
+				clocks = <&gcc GCC_PCIE_2_PIPE_CLK>;
+				clock-names = "pipe0";
+
+				#phy-cells = <0>;
+				clock-output-names = "pcie_2_pipe_clk";
+			};
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
-- 
2.29.2

