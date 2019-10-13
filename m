Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0026BD5531
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2019 10:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbfJMIIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Oct 2019 04:08:14 -0400
Received: from onstation.org ([52.200.56.107]:42538 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728900AbfJMIIN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Oct 2019 04:08:13 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id BF71D3F241;
        Sun, 13 Oct 2019 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570954092;
        bh=5y4IgV+p/C+kqf40RD9SQErSESliuqnpoFGETQZjbPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B0trZvIEXnlAXm+xpHVxxAiwZcdKsVUmlp1Dx99gc1PKQB+BAjimEmqI4imLbJGOu
         gXeGLMrKN3yR1NTqhUhLOso0l9AIggYaT1pWadVQUIDWlpIaRGF2XmDMUlXdnw2ZnV
         6QPX64xaRK8pmNd7Y5VEM3kQSM953LODfquqY9E8=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] ARM: dts: qcom: msm8974: add interconnect nodes
Date:   Sun, 13 Oct 2019 04:08:04 -0400
Message-Id: <20191013080804.10231-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191013080804.10231-1-masneyb@onstation.org>
References: <20191013080804.10231-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect nodes that's needed to support bus scaling.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 60 +++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index bdbde5125a56..ed98d14a88b1 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/interconnect/qcom,msm8974.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
@@ -1106,6 +1107,60 @@
 			};
 		};
 
+		bimc: interconnect@fc380000 {
+			reg = <0xfc380000 0x6a000>;
+			compatible = "qcom,msm8974-bimc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
+			         <&rpmcc RPM_SMD_BIMC_A_CLK>;
+		};
+
+		cnoc: interconnect@fc480000 {
+			reg = <0xfc480000 0x4000>;
+			compatible = "qcom,msm8974-cnoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
+			         <&rpmcc RPM_SMD_CNOC_A_CLK>;
+		};
+
+		mmssnoc: interconnect@fc478000 {
+			reg = <0xfc478000 0x4000>;
+			compatible = "qcom,msm8974-mmssnoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&mmcc MMSS_S0_AXI_CLK>,
+			         <&mmcc MMSS_S0_AXI_CLK>;
+		};
+
+		ocmemnoc: interconnect@fc470000 {
+			reg = <0xfc470000 0x4000>;
+			compatible = "qcom,msm8974-ocmemnoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
+			         <&rpmcc RPM_SMD_OCMEMGX_A_CLK>;
+		};
+
+		pnoc: interconnect@fc468000 {
+			reg = <0xfc468000 0x4000>;
+			compatible = "qcom,msm8974-pnoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
+			         <&rpmcc RPM_SMD_PNOC_A_CLK>;
+		};
+
+		snoc: interconnect@fc460000 {
+			reg = <0xfc460000 0x4000>;
+			compatible = "qcom,msm8974-snoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
+			         <&rpmcc RPM_SMD_SNOC_A_CLK>;
+		};
+
 		mdss: mdss@fd900000 {
 			status = "disabled";
 
@@ -1152,6 +1207,11 @@
 				              "core",
 				              "vsync";
 
+				interconnects = <&mmssnoc MNOC_MAS_GRAPHICS_3D &bimc BIMC_SLV_EBI_CH0>,
+				                <&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
+				interconnect-names = "mdp0-mem",
+				                     "mdp1-mem";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.21.0

