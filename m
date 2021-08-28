Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1313FA5DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 15:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbhH1NTa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 09:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234411AbhH1NTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 09:19:22 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B812C06179A;
        Sat, 28 Aug 2021 06:18:30 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.105.neoplus.adsl.tpnet.pl [83.6.168.105])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id BD3472019A;
        Sat, 28 Aug 2021 15:18:27 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hector Martin <marcan@marcan.st>,
        Vinod Koul <vkoul@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 06/18] arm64: dts: qcom: sm6350: Add TLMM block node
Date:   Sat, 28 Aug 2021 15:18:01 +0200
Message-Id: <20210828131814.29589-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210828131814.29589-1-konrad.dybcio@somainline.org>
References: <20210828131814.29589-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add TLMM pinctrl node to enable referencing the SoC pins in other nodes.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v1:
- Fix the gpio ranges from 156 to 157

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d57c669ae0d6..03f7601457b4 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -406,6 +406,25 @@ pdc: interrupt-controller@b220000 {
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

