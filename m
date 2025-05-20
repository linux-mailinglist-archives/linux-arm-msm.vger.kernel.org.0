Return-Path: <linux-arm-msm+bounces-58747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A63ABE0EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB678A77EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAD72701A0;
	Tue, 20 May 2025 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="leuxlEg3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0B31C8603;
	Tue, 20 May 2025 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759363; cv=none; b=GNM9KQ5EDhH+VipmJYRBJKVa2dDnS7EP3pBLmjzfiYqH6mbVCeTzpUPSUYQhx9oRsMNJ/KkAJAwQkcVLTXEY8X2r6CZU3Rd942gTpAXYSIZNikuGnwNHLc7Dm04iItB6GlEKgZ2id3i0ofkeNI0vhQ55oVp54fNxGuS1TpbRaAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759363; c=relaxed/simple;
	bh=1Iemnh2QpFzqVrSOBPzppyuBAefTs+QBKRDP0XvTom4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SNAq782lRqTEFAwF27wLV5RdyeemEfwJJLURAwPPK7181cu7U4CdlNPNO1/ESYDgQ4rAzwrxsUxC8oi5okgOyikIt00siZEUQk9AsnhnGI4pwwM4td2FeIVJxnJGnT94CsIGU6C/ohJ1FxKBeeQGreSWDwaCuto/zOKIdj4+NGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leuxlEg3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA64C4CEE9;
	Tue, 20 May 2025 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747759362;
	bh=1Iemnh2QpFzqVrSOBPzppyuBAefTs+QBKRDP0XvTom4=;
	h=From:Date:Subject:To:Cc:From;
	b=leuxlEg3CADCGomWO71Lnpf9fwy4Cw6Ututf9DHO3r8G5Ywfqxu2Rk5DE7mUDl9dd
	 9l21GFvvBeF3UJTEmyWxCvnEvSEScp5Sl88sAyzCtFmn5S35YYvGxsb4O/dYlEoF5v
	 Ln+zTnACGQeSUxX87qn96ahaj4mzbcBntM6Br9uBdzAV+c/C6R5z77V7r+2PqJ6Dto
	 1e6ZQ8mDCoyyS8xuDVWJ+cjZ7ZVRwlUAhQKng1NfymKqv3tuel/weQOKUpsr1T/Fk/
	 eSqTOwaG39J39jByZrzYFL5bTKbpqqsfRRU49kj2fKzfJjYOin1sUHoKMkFfS1RTom
	 3NkUlybj1e68w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 May 2025 18:42:32 +0200
Subject: [PATCH] arm64: dts: qcom: x1p42100: Fix thermal sensor
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-topic-x1p4_tsens-v1-1-bdadd91b7024@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPewLGgC/x3MQQqAIBBA0avErBMmS7CuEhFhY83GxIkQpLsnL
 d/i/wJCiUlgagokelj4ChVd24A7t3CQ4r0aNGqDRqO6r8hO5S4O6y0URG1o/E7U29Ei1Cwm8pz
 /5by87wdDv0ofYgAAAA==
X-Change-ID: 20250520-topic-x1p4_tsens-a05fdee38980
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: jens.glathe@oldschoolsolutions.biz, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747759359; l=11618;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=U/ZzbkPh3ghwqH+tLF6loTXJYPSBNt7pM+xzEP+/17U=;
 b=yBYPdohl3jl8XPmfNEexx9KLORIUJd62zjCQk3Un5nmJr+h5bK6riuahIxOheVnKVn18MijeB
 wBB5lvLA7jzCat88JmWZEkn4HI8a+rUlID48lPx5WvjuLAWi845TqPV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The 8-core SKUs of the X1 family have a different sensor configuration.
Override it to expose what the sensors really measure.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Compile-tested only
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi |   2 +-
 arch/arm64/boot/dts/qcom/x1p42100.dtsi | 556 +++++++++++++++++++++++++++++++++
 2 files changed, 557 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 60dcffb7db04a0734f3495dcf3dfab6e102e4e1b..92b2da38a1402e3d41f346266ce281dabe0f7a08 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8496,7 +8496,7 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	thermal-zones {
+	thermal_zones: thermal-zones {
 		aoss0-thermal {
 			thermal-sensors = <&tsens0 0>;
 
diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..004f5e87f8e132cdd5ebb06a44e34d6746f459e1 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -18,6 +18,7 @@
 /delete-node/ &cpu_pd10;
 /delete-node/ &cpu_pd11;
 /delete-node/ &pcie3_phy;
+/delete-node/ &thermal_zones;
 
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
@@ -79,3 +80,558 @@ pcie3_phy: phy@1bd4000 {
 		status = "disabled";
 	};
 };
+
+/* While physically present, this controller is left unconfigured and unused */
+&tsens3 {
+	status = "disabled";
+};
+
+/ {
+	thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-0-top-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-0-btm-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-1-top-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-1-btm-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-2-top-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-2-btm-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-3-top-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-3-btm-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-top-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-btm-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		mem-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-0-top-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-0-btm-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-1-top-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-1-btm-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-2-top-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-2-btm-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-3-top-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-3-btm-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-top-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-btm-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		aoss2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp0-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp1-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp2-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp3-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			polling-delay-passive = <200>;
+
+			thermal-sensors = <&tsens2 5>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpuss0_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			polling-delay-passive = <200>;
+
+			thermal-sensors = <&tsens2 6>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpuss1_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			polling-delay-passive = <200>;
+
+			thermal-sensors = <&tsens2 7>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpuss2_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			polling-delay-passive = <200>;
+
+			thermal-sensors = <&tsens2 8>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpuss3_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera0-thermal {
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera1-thermal {
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250520-topic-x1p4_tsens-a05fdee38980

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


