Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D834751B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 05:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239744AbhLOEfP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 23:35:15 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:51732 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239741AbhLOEfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 23:35:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DA54617D7;
        Wed, 15 Dec 2021 04:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311D4C34604;
        Wed, 15 Dec 2021 04:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639542914;
        bh=yTb5v+MXsxOvthbocV50YF6Ma7wZxkLSZxgBWsbzZqc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qBChwHGhyoA5csTEiF9d7kkk37P9nSNTPtPDYxnz/Z08on5PHzZgUcXmnnQ5FRAw2
         Mg3gmFyaEZcMc/NgfFAsnziaXhuEzdp4L3+5m4Auj42z0u55NFYJxfk3Wh/bsKXYqd
         ZxPjuG3YYV/Su16OOR/KYS3pmUZnz7TbzFdOi8Zg/W4C5sXTS3++1dqy+AriyYbC0n
         dMzVBkvpXwU2j7HaGjZXPlNSh/oq6IdPdjFy0fw1EIidpYLF9b33+DnVwD5/x5icpP
         3B4yrCNcmHHujOecFe/DBFZnEvy19wUKDBytcd+5Uh7eK577gfvitVGnDDpnR7b/h2
         BRGAPC9Qpzhhw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 07/11] arm64: dts: qcom: sm8450: add ufs nodes
Date:   Wed, 15 Dec 2021 10:04:36 +0530
Message-Id: <20211215043440.605624-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215043440.605624-1-vkoul@kernel.org>
References: <20211215043440.605624-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the UFS and QMP PHY node for SM8450 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d29680c405bf..9556d2fc46e0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -815,6 +815,78 @@ rpmhcc: clock-controller {
 				clocks = <&xo_board>;
 			};
 		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			iommus = <&apps_smmu 0xe0 0x0>;
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
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<75000000 300000000>,
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<0 0>;
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm8450-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0xe10>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref", "ref_aux", "qref";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_0_CLKREF_EN>;
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
+				#clock-cells = <0>;
+			};
+		};
 	};
 
 	timer {
-- 
2.31.1

