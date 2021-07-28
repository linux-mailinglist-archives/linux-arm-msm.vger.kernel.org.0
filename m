Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870983D9892
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhG1W0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:35 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:54177 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbhG1W0T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:19 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id D91471FA14;
        Thu, 29 Jul 2021 00:26:15 +0200 (CEST)
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
Subject: [PATCH 23/39] arm64: dts: qcom: pm660(l): Add VADC and temp alarm nodes
Date:   Thu, 29 Jul 2021 00:25:26 +0200
Message-Id: <20210728222542.54269-24-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add VADC, temperature alarm and thermal zones for pm660(l)
to allow for temperature and voltage readouts and prevent
PMIC overheating.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi  | 122 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm660l.dtsi |  33 ++++++++
 2 files changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index c6c57fe626e3..e847d7209afc 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -3,9 +3,35 @@
  * Copyright (c) 2020, Konrad Dybcio
  */
 
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		pm660 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&pm660_temp>;
+
+			trips {
+				pm660_alert0: pm660-alert0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				pm660_crit: pm660-crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
 
 &spmi_bus {
 
@@ -37,6 +63,102 @@ pwrkey {
 
 		};
 
+		pm660_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pm660_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm660_adc: adc@3100 {
+			compatible = "qcom,spmi-adc-rev2";
+			reg = <0x3100>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			ref_gnd: ref_gnd@0 {
+				reg = <ADC5_REF_GND>;
+				qcom,decimation = <1024>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			vref_1p25: vref_1p25@1 {
+				reg = <ADC5_1P25VREF>;
+				qcom,decimation = <1024>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			die_temp: die_temp@6 {
+				reg = <ADC5_DIE_TEMP>;
+				qcom,decimation = <1024>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			xo_therm: xo_therm@4c {
+				reg = <ADC5_XO_THERM_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+				qcom,decimation = <1024>;
+				qcom,hw-settle-time = <200>;
+				qcom,ratiometric;
+			};
+
+			msm_therm: msm_therm@4d {
+				reg = <ADC5_AMUX_THM1_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+				qcom,decimation = <1024>;
+				qcom,hw-settle-time = <200>;
+				qcom,ratiometric;
+			};
+
+			emmc_therm: emmc_therm@4e {
+				reg = <ADC5_AMUX_THM2_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+				qcom,decimation = <1024>;
+				qcom,hw-settle-time = <200>;
+				qcom,ratiometric;
+			};
+
+			pa_therm0: thermistor0@4f {
+				reg = <ADC5_AMUX_THM3_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+				qcom,decimation = <1024>;
+				qcom,hw-settle-time = <200>;
+				qcom,ratiometric;
+			};
+
+			pa_therm1: thermistor1@50 {
+				reg = <ADC5_AMUX_THM4_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+				qcom,decimation = <1024>;
+				qcom,hw-settle-time = <200>;
+				qcom,ratiometric;
+			};
+
+			quiet_therm: quiet_therm@51 {
+				reg = <ADC5_AMUX_THM5_100K_PU>;
+				qcom,pre-scaling = <1 1>;
+				qcom,decimation = <1024>;
+				qcom,hw-settle-time = <200>;
+				qcom,ratiometric;
+			};
+
+			vadc_vph_pwr: vph_pwr@83 {
+				reg = <ADC5_VPH_PWR>;
+				qcom,decimation = <1024>;
+				qcom,pre-scaling = <1 3>;
+			};
+
+			vcoin: vcoin@83 {
+				reg = <ADC5_VCOIN>;
+				qcom,decimation = <1024>;
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pm660_gpios: gpios@c000 {
 			compatible = "qcom,pm660-gpio";
 			reg = <0xc000>;
diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 64a8e9b9afbe..05086cbe573b 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -3,9 +3,35 @@
  * Copyright (c) 2020, Konrad Dybcio
  */
 
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		pm660l {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&pm660l_temp>;
+
+			trips {
+				pm660l_alert0: pm660l-alert0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				pm660l_crit: pm660l-crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
 
 &spmi_bus {
 
@@ -15,6 +41,13 @@ pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm660l_temp: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x2 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm660l_gpios: gpios@c000 {
 			compatible = "qcom,pm660l-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
-- 
2.32.0

