Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9207EECC6E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbfKBAb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:31:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43641 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbfKBAbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:31:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id l24so7440909pgh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IbjMZBbD4GQshbgOA/j1WtjWR4BumKUbToyFkiiySU8=;
        b=T9XC+IfBATzm9wKty4EW2Ln/UMyD7d0DtU8Ly8A5RxfbMkmel1ZJioQ9wHTztfZgdw
         a6/7Qf5DoFN69JcAbWjfvcCrWemYMEdLVYbR0nCqqkbaqHi6JiUsd00RhCt/m5uNon0O
         rqVryeXOvTKXIhKLFhWUXSFvGjCH8JHddrMdFF80DQnFK2O2x5Ks5QXns+79WNFuJ56Z
         EjoSZMLwDlyziivyW/AL/cquMBhKGLcnMv+PYC5swPc7v8pTZ7AH2zhhLdqzCHcE3RXC
         KXhyMTCG8mpkBP9/lvi4T/0HlZVqIaS3rdfIiCJ27s3bjAxXO6eq0pkPYYOizxF9d6d9
         Rh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IbjMZBbD4GQshbgOA/j1WtjWR4BumKUbToyFkiiySU8=;
        b=m9PTr69Ft0BeyXQHoGfHR1d1Sow5cg8e3MghYP8X28PkKQAnshjuHmBE4150j9Lw8l
         rfLXPz607rxkZm3FlJOwT+UyOqlF2DpqKxMlESZQH4iq8gF9ekULwuyTWOFsC1b6bDFy
         18shrw0S2iu6iO8nCnHxzdakE5fXoHPea77wMi05w6ooYJw09xqV4UijhfFBKAFA6/nB
         rDc2yayVAqZRX9BIQwptIRaQb/rAJVh5g2JhYCKZqp+ER2cz/eEvYQWMD8Mi4Rg0a8qK
         h4v4rJAgrYXas+i8VlLrHxW/DNYpc5vrC7qgW6AmJfgOeQn6n+kQDjIMEOvephX62bzd
         fW2Q==
X-Gm-Message-State: APjAAAUPjZH1d2GicEMh3jvUnJyBO5/20yanay/XPEeja4B8xnKG4wIu
        0ym8wJ42M0HhD1EDN354ODb2rQ==
X-Google-Smtp-Source: APXvYqylI8b+IIHcDhS2jLge5DU72dA1PCDwk9miqm9kbvvVD1XpZkEZsD2h3N2PxfPNPeiuarTOdw==
X-Received: by 2002:a17:90a:8a98:: with SMTP id x24mr19024493pjn.97.1572654714400;
        Fri, 01 Nov 2019 17:31:54 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v2sm7957522pfm.13.2019.11.01.17.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:31:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sdm845: Add second PCIe PHY and controller
Date:   Fri,  1 Nov 2019 17:31:47 -0700
Message-Id: <20191102003148.4091335-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
References: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the second PCIe controller and the associated QHP PHY found on
SDM845.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 111 +++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b93537b7a59f..0cdcc8d6d223 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1468,6 +1468,117 @@
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
+			interconnects = <&rsc_hlos MASTER_PCIE_0 &rsc_hlos SLAVE_EBI1>;
+			interconnect-names = "pcie-mem";
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

