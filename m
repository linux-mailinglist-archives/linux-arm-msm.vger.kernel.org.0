Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9847E1A9302
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393511AbgDOGO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393497AbgDOGO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:14:57 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CA0C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:14:55 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w65so1059465pfc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wyUZsSY+NlJBOwEDdKjEJczJyIxzKNUE6uBL2wkJ/4I=;
        b=VUXY8Rnk7Sd7xWTPZQqkw1xJwsrkfvcUs9wPDJhtfck1jf4dOUeLGhvcgk4E3zKZhq
         7F5QrudMsU3enGNEsVFti6S0ZiXdXydhHQ6hqRAgx2nGtngWA4IDR+6NwYTkFBl4K/WW
         uw00SzEFyeUDBW5x7Q8sSKNTxJw1Q4m7LK8LcorCBd9b9g2e3oJA3N7icUBfSHSVCmUA
         es4adyUOKWX2Hbf/ED6oG8kJNqbcaEHWYvpUL+oRqT2hh8I5u0KuGkjj1NZRYgbFAD1s
         B+ZfmJJTRBjiIjqm/Ep/lRDHcAM354bcdeT/TGPzN8PmFg1d1iK51A2COBsV6GK6FDNG
         IT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wyUZsSY+NlJBOwEDdKjEJczJyIxzKNUE6uBL2wkJ/4I=;
        b=phD6QONgsg6cUALOcdsra1LF3si6KA4hAYaft1WnYy4Gl3/0d8D8OmsAgPt8rDGrLA
         fzgcUa1f/JyYGIiuBrQQCE+s4kXMjM8KYfcq+V4TtIRyl5tViQCu9ySr34bDbbevJKC9
         SScAPQZixNA1aE0fCOuVex6bKGPw7+ZeNjR+/HsLYcNTymjV91E84buE/FRxf5Tp76kC
         vFjQmDjJh1cc8gtOyWviwgcKLbiThKZk+g4yz/S4QavxPSMJmItLM2GvAA+dtiHcSDcr
         h24J4rBy6CE1+vlGjO/iZCalUNT4VyZDMlxKG32h04LMp93a2i8f50KbkEXEVERK9CrJ
         EACg==
X-Gm-Message-State: AGi0PuZzfIVdDWT96rMUEtNsDikolpA+KmzKNoZgn9D7xLMyRawoMVaI
        QfGRTqyNXW5/EBMYJDQk6TaIAw==
X-Google-Smtp-Source: APiQypLp7R/LKr1ecCSfGawkhCjHrfT/UNn7e++CPcMAKZMDJvgWYvoCWOdq6nCztFvj5zoPHBs46w==
X-Received: by 2002:a63:c203:: with SMTP id b3mr26512755pgd.453.1586931295267;
        Tue, 14 Apr 2020 23:14:55 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e196sm2939332pfh.43.2020.04.14.23.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:14:54 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: Add UFS controller and PHY
Date:   Tue, 14 Apr 2020 23:14:30 -0700
Message-Id: <20200415061430.740854-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200415061430.740854-1-bjorn.andersson@linaro.org>
References: <20200415061430.740854-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add nodes for the UFS controller and PHY, and enable these for the MTP
with relevant supplies specified.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 20 +++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 71 +++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 7b0f95e77482..cff7a85890ee 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -358,3 +358,23 @@ &qupv3_id_1 {
 &uart2 {
 	status = "okay";
 };
+
+&ufs_mem_hc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l17a_3p0>;
+	vcc-max-microamp = <750000>;
+	vccq-supply = <&vreg_l6a_1p2>;
+	vccq-max-microamp = <700000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <750000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a_0p875>;
+	vdda-max-microamp = <90200>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	vdda-pll-max-microamp = <19000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 2a7eaefd221d..d7b2049f339c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -304,6 +305,76 @@ uart2: serial@a90000 {
 			};
 		};
 
+		ufs_mem_hc: ufs@1d84000 {
+			compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
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
+			compatible = "qcom,sm8250-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0x1c0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clock-names = "ref",
+				      "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
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
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.24.0

