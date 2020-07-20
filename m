Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6E9225A82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgGTIy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:27 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:10863 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgGTIy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235262;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ynHYXqBIqENgIRpcRpVpqZtELmrzMf9LJoWCAsxMBQ4=;
        b=sJRyGHuOCMrThxApe16KsqJ0tAp6Mywwdl/BNt9xkWgT0rZO1FZa244eOJaD7TxvkN
        NPbrwP2+PlqI1mz9UWPkj7bsKMxXDyFdPxceAX5sNqs5ncRqJ/Tm71SoeFuU9sNHBPfJ
        y6lR2N9XW4HJ+PWh5cHqDKJJkgjfaVYTUTlMInP42NExEsDwkqJC1/nwXDndWXHyloYN
        dxI88P6sKfmUZy7jpmexaMjCOkx7GbL0qSMLDwlHx1C+iLeuvJTpIfy1dGPRQsiWhn2h
        j50excHVAeK23Cwu3p5y24vg+8Xf8BQpt/q+1DM1lPE/nmccI6iyE8KWWvgHyrSSpQwX
        3qZw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sLdgJ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:21 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 07/10] arm64: dts: qcom: msm8916: Move PM8916-specific parts to msm8916-pm8916.dtsi
Date:   Mon, 20 Jul 2020 10:54:03 +0200
Message-Id: <20200720085406.6716-8-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device trees for newer SoCs avoid defining the regulator nodes directly
in the SoC device tree (here: msm8916.dtsi). The reason for this is that
theoretically it is possible to combine the SoC with a different PMIC,
or to use all the regulators in a board-specific way.

Therefore let's remove those from the SoC include (msm8916.dtsi).

In practice, pretty much all MSM8916 boards were combined with PM8916,
and use the regulators in similar ways. After looking at many different
MSM8916 boards (mostly smartphones and tablets), I haven't seen a single
device that isn't using the same regulators for components integrated
into the SoC.

If all boards end up defining all regulators and supplies in the same way
then it is useful to have an include for that, so we can avoid duplicating
it everywhere. If there is really a super special board that does it
differently it could just override some properties or avoid using the
include altogether.

This patch moves the regulator and common supply definitions to
a new include called "msm8916-pm8916.dtsi".

This is also going to be useful when introducing CPR (Core Power
Reduction) later because we can configure the CPU regulator
(pm8916_spmi_s2) for all devices in this common include.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |  3 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  3 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi     |  3 +-
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi  | 55 +++++++++++++++++++
 .../qcom/msm8916-samsung-a2015-common.dtsi    |  3 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 40 --------------
 6 files changed, 59 insertions(+), 48 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 0627ef9bd54a..e07308cca447 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -3,8 +3,7 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
-#include "msm8916.dtsi"
-#include "pm8916.dtsi"
+#include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 90ce0f96eda4..0b72da1bb6ca 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -2,8 +2,7 @@
 
 /dts-v1/;
 
-#include "msm8916.dtsi"
-#include "pm8916.dtsi"
+#include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
index 453e6acb5203..9c4926326f21 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
@@ -3,8 +3,7 @@
  * Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
  */
 
-#include "msm8916.dtsi"
-#include "pm8916.dtsi"
+#include "msm8916-pm8916.dtsi"
 
 / {
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
new file mode 100644
index 000000000000..d416fe354f82
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "msm8916.dtsi"
+#include "pm8916.dtsi"
+
+&camss {
+	vdda-supply = <&pm8916_l2>;
+};
+
+&mpss {
+	cx-supply = <&pm8916_s1>;
+	mx-supply = <&pm8916_l3>;
+	pll-supply = <&pm8916_l7>;
+};
+
+&pronto {
+	vddmx-supply = <&pm8916_l3>;
+	vddpx-supply = <&pm8916_l7>;
+
+	iris {
+		vddxo-supply = <&pm8916_l7>;
+		vddrfa-supply = <&pm8916_s3>;
+		vddpa-supply = <&pm8916_l9>;
+		vdddig-supply = <&pm8916_l5>;
+	};
+};
+
+&rpm_requests {
+	smd_rpm_regulators: pm8916-regulators {
+		compatible = "qcom,rpm-pm8916-regulators";
+
+		pm8916_s1: s1 {};
+		pm8916_s3: s3 {};
+		pm8916_s4: s4 {};
+
+		pm8916_l1: l1 {};
+		pm8916_l2: l2 {};
+		pm8916_l3: l3 {};
+		pm8916_l4: l4 {};
+		pm8916_l5: l5 {};
+		pm8916_l6: l6 {};
+		pm8916_l7: l7 {};
+		pm8916_l8: l8 {};
+		pm8916_l9: l9 {};
+		pm8916_l10: l10 {};
+		pm8916_l11: l11 {};
+		pm8916_l12: l12 {};
+		pm8916_l13: l13 {};
+		pm8916_l14: l14 {};
+		pm8916_l15: l15 {};
+		pm8916_l16: l16 {};
+		pm8916_l17: l17 {};
+		pm8916_l18: l18 {};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index c6eb0b0cd849..64e9c73953bb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include "msm8916.dtsi"
-#include "pm8916.dtsi"
+#include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index acbaed23bbdd..141348a92788 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1178,10 +1178,6 @@ mpss: hexagon@4080000 {
 			resets = <&scm 0>;
 			reset-names = "mss_restart";
 
-			cx-supply = <&pm8916_s1>;
-			mx-supply = <&pm8916_l3>;
-			pll-supply = <&pm8916_l7>;
-
 			qcom,halt-regs = <&tcsr 0x18000 0x19000 0x1a000>;
 
 			status = "disabled";
@@ -1233,9 +1229,6 @@ pronto: wcnss@a21b000 {
 					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
-			vddmx-supply = <&pm8916_l3>;
-			vddpx-supply = <&pm8916_l7>;
-
 			qcom,state = <&wcnss_smp2p_out 0>;
 			qcom,state-names = "stop";
 
@@ -1249,11 +1242,6 @@ iris {
 
 				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
 				clock-names = "xo";
-
-				vddxo-supply = <&pm8916_l7>;
-				vddrfa-supply = <&pm8916_s3>;
-				vddpa-supply = <&pm8916_l9>;
-				vdddig-supply = <&pm8916_l5>;
 			};
 
 			smd-edge {
@@ -1776,7 +1764,6 @@ camss: camss@1b00000 {
 				"csi_vfe0",
 				"vfe_ahb",
 				"vfe_axi";
-			vdda-supply = <&pm8916_l2>;
 			iommus = <&apps_iommu 3>;
 			status = "disabled";
 			ports {
@@ -1829,33 +1816,6 @@ rpmcc: qcom,rpmcc {
 					compatible = "qcom,rpmcc-msm8916";
 					#clock-cells = <1>;
 				};
-
-				smd_rpm_regulators: pm8916-regulators {
-					compatible = "qcom,rpm-pm8916-regulators";
-
-					pm8916_s1: s1 {};
-					pm8916_s3: s3 {};
-					pm8916_s4: s4 {};
-
-					pm8916_l1: l1 {};
-					pm8916_l2: l2 {};
-					pm8916_l3: l3 {};
-					pm8916_l4: l4 {};
-					pm8916_l5: l5 {};
-					pm8916_l6: l6 {};
-					pm8916_l7: l7 {};
-					pm8916_l8: l8 {};
-					pm8916_l9: l9 {};
-					pm8916_l10: l10 {};
-					pm8916_l11: l11 {};
-					pm8916_l12: l12 {};
-					pm8916_l13: l13 {};
-					pm8916_l14: l14 {};
-					pm8916_l15: l15 {};
-					pm8916_l16: l16 {};
-					pm8916_l17: l17 {};
-					pm8916_l18: l18 {};
-				};
 			};
 		};
 	};
-- 
2.27.0

