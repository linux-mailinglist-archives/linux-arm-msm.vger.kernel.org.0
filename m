Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB4A4E2F06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 12:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409197AbfJXKbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 06:31:49 -0400
Received: from onstation.org ([52.200.56.107]:37250 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409181AbfJXKbr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 06:31:47 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id AD4D43F25C;
        Thu, 24 Oct 2019 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1571913105;
        bh=TjnLS/ZuPQk+PIhxZ1NDe8tWtJ6hF+FLqMYRIzVX1Hk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FCeCcZORFMZTRNybTBNym4E1tuYUebZ+1dG3dJWW4yHeEzn4B4Tt/yfB9wK1iPB/S
         aEcnXVnPfhiRSQKkhrhDuG9mfgxoRcoZSTIdhIy1fMpiDRHs7IUgHSWcqPEYsALnk6
         PbKh1gKhmXJcs4787uvaFIjCu8x7orEBeHOP/yLc=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        georgi.djakov@linaro.org
Subject: [PATCH v2 4/4] ARM: dts: qcom: msm8974: add interconnect nodes
Date:   Thu, 24 Oct 2019 06:31:40 -0400
Message-Id: <20191024103140.10077-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024103140.10077-1-masneyb@onstation.org>
References: <20191024103140.10077-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect nodes that's needed to support bus scaling.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v1:
- sort interconnect nodes by address
- correct interconnect path for display:
  MNOC_MAS_MDP_PORT0 -> BIMC_SLV_EBI_CH0

 arch/arm/boot/dts/qcom-msm8974.dtsi | 58 +++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index bdbde5125a56..c893c715f08c 100644
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
+		snoc: interconnect@fc460000 {
+			reg = <0xfc460000 0x4000>;
+			compatible = "qcom,msm8974-snoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
+			         <&rpmcc RPM_SMD_SNOC_A_CLK>;
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
+		ocmemnoc: interconnect@fc470000 {
+			reg = <0xfc470000 0x4000>;
+			compatible = "qcom,msm8974-ocmemnoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
+			         <&rpmcc RPM_SMD_OCMEMGX_A_CLK>;
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
+		cnoc: interconnect@fc480000 {
+			reg = <0xfc480000 0x4000>;
+			compatible = "qcom,msm8974-cnoc";
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
+			         <&rpmcc RPM_SMD_CNOC_A_CLK>;
+		};
+
 		mdss: mdss@fd900000 {
 			status = "disabled";
 
@@ -1152,6 +1207,9 @@
 				              "core",
 				              "vsync";
 
+				interconnects = <&mmssnoc MNOC_MAS_MDP_PORT0 &bimc BIMC_SLV_EBI_CH0>;
+				interconnect-names = "mdp0-mem";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.21.0

