Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9514EEC285
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2019 13:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfKAMQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 08:16:00 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:45911 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727279AbfKAMQA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 08:16:00 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Nov 2019 17:38:48 +0530
IronPort-SDR: 18joQudYus4ACgZj8lLhxVDhYBCuEjVF8uYnY0Gvn3CvYkFZi99P6HuMaKUHP1QyO/n/NKkg7f
 3ddpIfMTa0TXf2LMoVnhI1fugbLpFhN4gtUGy9FjyDyPyh+L++BYAPgEovmMx3HFqhxpDiHxC/
 CsdnveCmUfD9fjv2LxDDL7E8IxdbrOXMewTCzSLx7VjmgeCoBUNx8QAnVSg3kdb+B160xn/eYN
 HVMtJ2DnTnyTJf/zkItdO1Mxw+PqBE5yO0xOkUkwxHUEBTw1p2Ejl2Bo+0LlbBloURJ+lVQ5ox
 +0qCh79T4A6fZRq4LMelAMFG
Received: from c-rkambl-linux1.qualcomm.com ([10.242.50.190])
  by ironmsg01-blr.qualcomm.com with ESMTP; 01 Nov 2019 17:38:35 +0530
Received: by c-rkambl-linux1.qualcomm.com (Postfix, from userid 2344811)
        id 70B7318F1; Fri,  1 Nov 2019 17:38:34 +0530 (IST)
From:   Rajeshwari <rkambl@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org,
        sanm@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>
Subject: [PATCH 1/1] arm64: dts: qcom: sc7180:  Add device node support for TSENS in SC7180
Date:   Fri,  1 Nov 2019 17:38:28 +0530
Message-Id: <1572610108-1363-2-git-send-email-rkambl@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572610108-1363-1-git-send-email-rkambl@codeaurora.org>
References: <1572610108-1363-1-git-send-email-rkambl@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add TSENS node and user thermal zone configurations for TSENS sensors in SC7180.

Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 518 +++++++++++++++++++++++++++++++++++
 1 file changed, 518 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 07ea393..06ded1d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -238,6 +238,22 @@
 			};
 		};
 
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
+			reg = <0 0x0c263000 0 0x1ff>, /* TM */
+				<0 0x0c222000 0 0x1ff>; /* SROT */
+			#qcom,sensors = <15>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
+			reg = <0 0x0c265000 0 0x1ff>, /* TM */
+				<0 0x0c223000 0 0x1ff>; /* SROT */
+			#qcom,sensors = <10>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0xc440000 0 0x1100>,
@@ -449,6 +465,508 @@
 		};
 	};
 
+	thermal-zones {
+		aoss-0-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-governor = "user_space";
+			thermal-sensors = <&tsens0 0>;
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-0-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-governor = "user_space";
+			thermal-sensors = <&tsens0 1>;
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-1-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-governor = "user_space";
+			thermal-sensors = <&tsens0 2>;
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-2-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-governor = "user_space";
+			thermal-sensors = <&tsens0 3>;
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-3-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 4>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-4-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 5>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-5-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 6>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss-0-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 7>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss-1-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 8>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-0-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 9>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-1-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 10>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-2-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 11>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-3-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 12>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-0-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 13>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-1-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 14>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss-1-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 0>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cwlan-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 1>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		audio-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 2>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		ddr-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 3>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				ative-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		q6-hvx-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 4>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camera-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 5>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		mdm-core-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 6>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		mdm-dsp-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 7>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		npu-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 8>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		video-usr {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 9>;
+			thermal-governor = "user_space";
+			wake-capable-sensor;
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

