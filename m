Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8142305E3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 15:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhA0O01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 09:26:27 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:58895 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232900AbhA0O0Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 09:26:24 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 61BF34405AD;
        Wed, 27 Jan 2021 16:25:42 +0200 (IST)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Kathiravan T <kathirav@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: ipq6018: enable USB2 support
Date:   Wed, 27 Jan 2021 16:20:29 +0200
Message-Id: <59a0d43f34b69406cd320f16edc4e7fabe022bfd.1611756920.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611756920.git.baruch@tkos.co.il>
References: <cover.1611756920.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kathiravan T <kathirav@codeaurora.org>

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
[baruch: adjust regs address/size; drop binding updates;
 drop unsupported quirk properties]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  8 ++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 48 ++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index 99cefe88f6f2..5aec18308712 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -78,3 +78,11 @@ nand@0 {
 		nand-bus-width = <8>;
 	};
 };
+
+&qusb_phy_1 {
+	status = "ok";
+};
+
+&usb2 {
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9fa5b028e4f3..d4a3d4e4a7e9 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -524,6 +524,54 @@ qrtr_requests {
 			};
 		};
 
+		qusb_phy_1: qusb@59000 {
+			compatible = "qcom,ipq6018-qusb2-phy";
+			reg = <0x0 0x059000 0x0 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
+				 <&xo>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
+			status = "disabled";
+		};
+
+		usb2: usb2@7000000 {
+			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
+			reg = <0x0 0x070F8800 0x0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_USB1_MASTER_CLK>,
+				 <&gcc GCC_USB1_SLEEP_CLK>,
+				 <&gcc GCC_USB1_MOCK_UTMI_CLK>;
+			clock-names = "master",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB1_MASTER_CLK>,
+					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <133330000>,
+					       <24000000>;
+			resets = <&gcc GCC_USB1_BCR>;
+			status = "disabled";
+
+			dwc_1: dwc3@7000000 {
+			       compatible = "snps,dwc3";
+			       reg = <0x0 0x7000000 0x0 0xcd00>;
+			       interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			       phys = <&qusb_phy_1>;
+			       phy-names = "usb2-phy";
+			       tx-fifo-resize;
+			       snps,is-utmi-l1-suspend;
+			       snps,hird-threshold = /bits/ 8 <0x0>;
+			       snps,dis_u2_susphy_quirk;
+			       snps,dis_u3_susphy_quirk;
+			       dr_mode = "host";
+			};
+		};
+
 	};
 
 	wcss: wcss-smp2p {
-- 
2.29.2

