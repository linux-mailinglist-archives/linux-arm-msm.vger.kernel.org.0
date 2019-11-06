Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1DB6F1164
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 09:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbfKFIrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 03:47:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:51014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730178AbfKFIrS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 03:47:18 -0500
Received: from localhost.localdomain (unknown [223.226.46.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 91760206A3;
        Wed,  6 Nov 2019 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573030037;
        bh=QlCZGgwKxaEkTEzsEFbie7EjDl/Pz20nyu4/Pp/JumM=;
        h=From:To:Cc:Subject:Date:From;
        b=BY5Q1Ag499IbAp9AaGG5mXDG5zDwEjKKg/VGn4SkrWrPANK7Admo3WU8LtFwGxVQp
         snt37EjOkqY2RmA9c6OeJsMeGFYF0456g61JHzTkOnca+CyOUCHRDNg9Enn609wMsZ
         Rto/clU6de/OqjaCN2D8ZxjoYBgExcM9Bnp/qA4M=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm8150: Add ufs nodes
Date:   Wed,  6 Nov 2019 14:16:55 +0530
Message-Id: <20191106084656.1749954-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the ufs hc node and ufs phy nodes found in SM8150

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 68 ++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a9b1cabccbf6..f36d621a53e2 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -508,6 +508,74 @@
 			};
 		};
 
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x2500>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			clock-names =
+				"core_clk",
+				"bus_aggr_clk",
+				"iface_clk",
+				"core_clk_unipro",
+				"ref_clk",
+				"tx_lane0_sync_clk",
+				"rx_lane0_sync_clk",
+				"rx_lane1_sync_clk";
+			clocks =
+				<&gcc GCC_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_UFS_PHY_AHB_CLK>,
+				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			freq-table-hz =
+				<37500000 300000000>,
+				<0 0>,
+				<0 0>,
+				<37500000 300000000>,
+				<0 0>,
+				<0 0>,
+				<0 0>,
+				<0 0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm8150-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0x18c>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			status = "disabled";
+
+			ufs_mem_phy_lanes: lanes@1d87400 {
+				reg = <0 0x01d87400 0 0x108>,
+				      <0 0x01d87600 0 0x1e0>,
+				      <0 0x01d87c00 0 0x1dc>,
+				      <0 0x01d87800 0 0x108>,
+				      <0 0x01d87a00 0 0x1e0>;
+				#phy-cells = <0>;
+			};
+		};
+
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.23.0

