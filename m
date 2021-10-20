Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB2E43523A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 20:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhJTSCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 14:02:34 -0400
Received: from ixit.cz ([94.230.151.217]:57606 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230325AbhJTSCd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 14:02:33 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id C964D20064;
        Wed, 20 Oct 2021 20:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634752817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3ibLoTk5wk9475L6WbiLc8aasbYXHbmu7P497FWhuxs=;
        b=j/+kMKHTGjvE+ES+AG5z2G1sDSO4XVCmJiUEJuXRP7WoBI/jFcAF1kJXU+dgNA/BM52gEM
        Kr8KHAKoB/b9suB7fvr4qMyP+6WIQu4XWaNrr01gQApsVVN1BMOZlPM4+JIJZRo2RblHNr
        qYrtnvszpaNCYrvRhlcRjMbetFq6caI=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: fix thermal zones naming
Date:   Wed, 20 Oct 2021 20:00:01 +0200
Message-Id: <20211020180002.195467-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename thermal zones according to dt-schema.

Fix warnings like:
arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml: thermal-zones: 'cpu-thermal0', 'cpu-thermal1', 'cpu-thermal2', 'cpu-thermal3' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
        From schema: Documentation/devicetree/bindings/thermal/thermal-zones.yaml

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi |  8 ++++----
 arch/arm/boot/dts/qcom-apq8084.dtsi |  8 ++++----
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 24 ++++++++++++------------
 arch/arm/boot/dts/qcom-msm8974.dtsi | 12 ++++++------
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index dbc86a765be1..a6f83b590fd9 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -101,7 +101,7 @@ memory@0 {
 	};
 
 	thermal-zones {
-		cpu-thermal0 {
+		cpu0-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -122,7 +122,7 @@ cpu_crit0: trip1 {
 			};
 		};
 
-		cpu-thermal1 {
+		cpu1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -143,7 +143,7 @@ cpu_crit1: trip1 {
 			};
 		};
 
-		cpu-thermal2 {
+		cpu2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -164,7 +164,7 @@ cpu_crit2: trip1 {
 			};
 		};
 
-		cpu-thermal3 {
+		cpu3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index bf6a03506b45..52240fc7a1a6 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -102,7 +102,7 @@ scm {
 	};
 
 	thermal-zones {
-		cpu-thermal0 {
+		cpu0-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -122,7 +122,7 @@ cpu_crit0: trip1 {
 			};
 		};
 
-		cpu-thermal1 {
+		cpu1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -142,7 +142,7 @@ cpu_crit1: trip1 {
 			};
 		};
 
-		cpu-thermal2 {
+		cpu2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -162,7 +162,7 @@ cpu_crit2: trip1 {
 			};
 		};
 
-		cpu-thermal3 {
+		cpu3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 4139d3817bd6..110113f3b8e2 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -49,7 +49,7 @@ L2: l2-cache {
 	};
 
 	thermal-zones {
-		tsens_tz_sensor0 {
+		sensor0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 0>;
@@ -69,7 +69,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor1 {
+		sensor1-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 1>;
@@ -89,7 +89,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor2 {
+		sensor2-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 2>;
@@ -109,7 +109,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor3 {
+		sensor3-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 3>;
@@ -129,7 +129,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor4 {
+		sensor4-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 4>;
@@ -149,7 +149,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor5 {
+		sensor5-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 5>;
@@ -169,7 +169,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor6 {
+		sensor6-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 6>;
@@ -189,7 +189,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor7 {
+		sensor7-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 7>;
@@ -209,7 +209,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor8 {
+		sensor8-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 8>;
@@ -229,7 +229,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor9 {
+		sensor9-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 9>;
@@ -249,7 +249,7 @@ cpu-hot {
 			};
 		};
 
-		tsens_tz_sensor10 {
+		sensor10-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens 10>;
@@ -751,7 +751,7 @@ tsens: thermal-sensor@900000 {
 				interrupt-names = "uplow";
 
 				#qcom,sensors = <11>;
-				#thermal-sensor-cells = <1>;
+				#thermal-sensorcells = <1>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index fa8e3642b949..deaf7d288b2e 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -142,7 +142,7 @@ memory {
 	};
 
 	thermal-zones {
-		cpu-thermal0 {
+		cpu0-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -162,7 +162,7 @@ cpu_crit0: trip1 {
 			};
 		};
 
-		cpu-thermal1 {
+		cpu1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -182,7 +182,7 @@ cpu_crit1: trip1 {
 			};
 		};
 
-		cpu-thermal2 {
+		cpu2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -202,7 +202,7 @@ cpu_crit2: trip1 {
 			};
 		};
 
-		cpu-thermal3 {
+		cpu3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -282,7 +282,7 @@ wlan_alert0: trip-point0 {
 			};
 		};
 
-		gpu-thermal-top {
+		gpu-top-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -297,7 +297,7 @@ gpu1_alert0: trip-point0 {
 			};
 		};
 
-		gpu-thermal-bottom {
+		gpu-bottom-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-- 
2.33.0

