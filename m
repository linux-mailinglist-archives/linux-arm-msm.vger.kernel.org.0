Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECF54162FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 18:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242129AbhIWQYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 12:24:18 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:58473 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242140AbhIWQYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 12:24:07 -0400
Received: from localhost.localdomain (83.6.166.81.neoplus.adsl.tpnet.pl [83.6.166.81])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 451B03F5F8;
        Thu, 23 Sep 2021 18:22:21 +0200 (CEST)
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
Subject: [PATCH v3 10/17] arm64: dts: qcom: sm6350: Add AOSS_QMP
Date:   Thu, 23 Sep 2021 18:21:56 +0200
Message-Id: <20210923162204.21752-10-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923162204.21752-1-konrad.dybcio@somainline.org>
References: <20210923162204.21752-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node for AOSS_QMP in preparation for remote processor enablement.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 2e9701f2f276..c2c5cc30307b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -535,6 +535,17 @@ tsens1: thermal-sensor@c265000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_qmp: power-controller@c300000 {
+			compatible = "qcom,sm6350-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x1000>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+			#power-domain-cells = <1>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sm6350-tlmm";
 			reg = <0 0x0f100000 0 0x300000>;
-- 
2.33.0

