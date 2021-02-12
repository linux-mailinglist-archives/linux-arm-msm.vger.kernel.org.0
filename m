Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFF9319A7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 08:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhBLHdr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 02:33:47 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:64357 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229989AbhBLHc1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 02:32:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613115125; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+6pVNZGi2jS/Bqor0KyI8AyNsvaJKR6+xgcnSHRX3IM=; b=tm9mLLvvnm0YlAPMo3zU9iZTGkfKvulzYkuH85ptHgAsAkT5jUB+wQ8VSIm9h2mX9p4LUAH/
 irZjS0ItcGpwla6npw43mrChyqGdhBd5y1uuJ+K6OYg8y6mt4fIQRKFe/E0ymWp4fFP6UhV5
 1ZmJ9+Qafxemv6vWlauoQV4xFG8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60262ed7f112b7872cb38fd1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Feb 2021 07:31:35
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF2AEC433ED; Fri, 12 Feb 2021 07:31:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5DB5C43462;
        Fri, 12 Feb 2021 07:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5DB5C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 06/13] arm64: dts: qcom: SC7280: Add rpmhcc clock controller node
Date:   Fri, 12 Feb 2021 12:58:43 +0530
Message-Id: <1613114930-1661-7-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rpmhcc clock controller node for SC7280. Also add the 'fixed
clock' nodes which can now be referenced in gcc.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 7848e88..10851e7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -29,6 +30,42 @@
 			clock-frequency = <32000>;
 			#clock-cells = <0>;
 		};
+
+		pcie_0_pipe_clk: pcie-0-pipe-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
+
+		pcie_1_pipe_clk: pcie-1-pipe-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
+
+		ufs_phy_rx_symbol_0_clk: ufs-phy-rx-symbol-0-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
+
+		ufs_phy_rx_symbol_1_clk: ufs-phy-rx-symbol-1-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
+
+		ufs_phy_tx_symbol_0_clk: ufs-phy-tx-symbol-0-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
+
+		usb3_phy_wrapper_gcc_usb30_pipe_clk: usb3-phy-wrapper-gcc-usb30-pipe-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <1000>;
+			#clock-cells = <0>;
+		};
 	};
 
 	reserved_memory: reserved-memory {
@@ -174,6 +211,17 @@
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sc7280";
 			reg = <0 0x00100000 0 0x1f0000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
+				 <&pcie_0_pipe_clk>, <&pcie_1_pipe_clk>,
+				 <&ufs_phy_rx_symbol_0_clk>, <&ufs_phy_rx_symbol_1_clk>,
+				 <&ufs_phy_tx_symbol_0_clk>,
+				 <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
+			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
+				      "pcie_0_pipe_clk", "pcie_1_pipe-clk",
+				      "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
+				      "ufs_phy_tx_symbol_0_clk",
+				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -325,6 +373,13 @@
 					  <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>,
 					  <CONTROL_TCS 1>;
+
+			rpmhcc: qcom,rpmhcc {
+				compatible = "qcom,sc7280-rpmh-clk";
+				clocks = <&xo_board>;
+				clock-names = "xo";
+				#clock-cells = <1>;
+			};
 		};
 	};
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

