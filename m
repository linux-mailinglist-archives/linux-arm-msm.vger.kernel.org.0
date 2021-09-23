Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7358416308
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 18:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242292AbhIWQY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 12:24:27 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:59371 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242112AbhIWQYM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 12:24:12 -0400
Received: from localhost.localdomain (83.6.166.81.neoplus.adsl.tpnet.pl [83.6.166.81])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 028153F686;
        Thu, 23 Sep 2021 18:22:16 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/17] arm64: dts: qcom: sm6350: Add TLMM block node
Date:   Thu, 23 Sep 2021 18:21:52 +0200
Message-Id: <20210923162204.21752-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923162204.21752-1-konrad.dybcio@somainline.org>
References: <20210923162204.21752-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add TLMM pinctrl node to enable referencing the SoC pins in other nodes.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9934ecec1bb2..68de0beb9b01 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -404,6 +404,25 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sm6350-tlmm";
+			reg = <0 0x0f100000 0 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 157>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.33.0

