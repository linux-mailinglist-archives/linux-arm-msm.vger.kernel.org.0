Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33FB1425EC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241519AbhJGV10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:27:26 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:58962 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235536AbhJGV1W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:22 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 0222BC91C2;
        Thu,  7 Oct 2021 21:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641927; bh=F4fCRzLfOTYH/B1NDxYT8eVOthwcR73tD/zhl5pWh30=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=o/6DPp2UEFqnjPa1mwJwvzuBCGF1WhHthm8yStmPYu8Bvnx9e/bS1XbHBYJDOc4jO
         9lbN8XYKM7NwBHjpzohmTrQaTqwk4R/QL4U3iMd0Us/BAs7UWSStsgxdjou9YIVYNX
         SArduUdOeBfb+D3qLSEQ6Hjb6uzjSabDMVWYqsis=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] arm64: dts: qcom: sm6350: add debug uart
Date:   Thu,  7 Oct 2021 23:24:34 +0200
Message-Id: <20211007212444.328034-8-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary nodes for the debug uart on SM6350.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
v2: remove mux{} from pinctrl node, add drive-strength & bias-disable

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 95e69d9f8657..5becfb130be5 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -445,6 +445,30 @@ opp-384000000 {
 			};
 		};
 
+		qupv3_id_1: geniqup@9c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x9c0000 0x0 0x2000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			iommus = <&apps_smmu 0x4c3 0x0>;
+			ranges;
+			status = "disabled";
+
+			uart2: serial@98c000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x98c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart2_default>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
@@ -672,6 +696,13 @@ tlmm: pinctrl@f100000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 157>;
+
+			qup_uart2_default: qup-uart2-default {
+				pins = "gpio25", "gpio26";
+				function = "qup13_f2";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.33.0

