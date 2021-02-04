Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD8230FC8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 20:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239799AbhBDTXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 14:23:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:56766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237638AbhBDRKY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 12:10:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D46B64F72;
        Thu,  4 Feb 2021 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612458568;
        bh=xoWq4aqI+4Cn3qczfLSrx0Hoi/7jeG+0q0yZ6kUSHEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mZb6C2ZHWcIsQ9vh/meYf1QtwEykwrBwN/jD7JbFvj6AoZY9KwvNm4b9Di7dP59xt
         sEKVPjV+Tz4FehL5zPN+3XwEsc2XMhOQ2HRGNv12xeK3mKKEqtuFaqXqgACC8iOjoH
         K7sqE/+hBSCMP1AHSNFHBxYAIdhseiEr5Yf51lr1RqcDrl9vM4qEs7Wc0LPA+g+R/o
         GKePDhA+6pqiFucxd3JHdrITtlynclJ8rZrvFjgpceC9mpuhLJTBXocF53aHrLpiSl
         o10iqV1r+9ZZlO/KIHd12KZlN08a7CP3rYu6vFwmlpRLjTjvUPu7HtipzX+/lyaKt5
         ScOr7Vz2PgPWw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: qcom: Add SM8350 UFS nodes
Date:   Thu,  4 Feb 2021 22:39:05 +0530
Message-Id: <20210204170907.63545-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204170907.63545-1-vkoul@kernel.org>
References: <20210204170907.63545-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds UFS HC and UFS phy nodes to the SM8350 DTS

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e51d9ca0210c..188f4011352c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -593,6 +593,82 @@ rpmhcc: clock-controller {
 
 		};
 
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc 25>;
+			reset-names = "rst";
+
+			power-domains = <&gcc 3>;
+
+			iommus = <&apps_smmu 0xe0 0x0>;
+
+			clock-names =
+				"ref_clk",
+				"core_clk",
+				"bus_aggr_clk",
+				"iface_clk",
+				"core_clk_unipro",
+				"ref_clk",
+				"tx_lane0_sync_clk",
+				"rx_lane0_sync_clk",
+				"rx_lane1_sync_clk";
+			clocks =
+				<&rpmhcc RPMH_CXO_CLK>,
+				<&gcc 155>,
+				<&gcc 16>,
+				<&gcc 154>,
+				<&gcc 170>,
+				<&rpmhcc RPMH_CXO_CLK>,
+				<&gcc 168>,
+				<&gcc 164>,
+				<&gcc 166>;
+			freq-table-hz =
+				<75000000 300000000>,
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<75000000 300000000>,
+				<0 0>,
+				<0 0>,
+				<75000000 300000000>,
+				<75000000 300000000>;
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,sm8350-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0xe10>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#clock-cells = <1>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc 161>;
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
+
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8350-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
-- 
2.26.2

