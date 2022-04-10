Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2A24FB0DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 01:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244215AbiDJXrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 19:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiDJXrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 19:47:16 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FABD1D0C9
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 16:45:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y32so23791386lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RjEPyRbt0hxRgadh+ALeEqlliuMyJsYNCZ/ZDTsjl0Q=;
        b=qF6KqT1bf2keuUnARBUHFURLhgkxJNndneCERt4e4WicpwtKEiA8iaU9M33qZDEr0B
         2LtkWHgG8IB1XkhpQRobtG10Xxara9SD2PtCzcQWAz1CYJoCTeCW7w9qK3u6D7TWmjym
         YRA563rfAiIUScC5n0VrwnKlwvMtQhNs3QL/GLF3BuWgxkvdTQI7PzkWz6FcUI2EW/nw
         aG9jcDGE217BAZx2jTtAck2uC0mcLGOBwzTYZMl3R+LCV/PIVS4D70l5CPYyu1NcM2pK
         2tP/IYgLU48l0KYEEsMOyjpzcQiiQwmmQy85S8jIgNlLl/Jw+/O8pS5Ud86gTGP8kOFN
         n6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RjEPyRbt0hxRgadh+ALeEqlliuMyJsYNCZ/ZDTsjl0Q=;
        b=fjvqP7R/gHdXwdhuO7grMaaRlm9bm5ItxlPbpKQjejGxbFDEhdh5spIh3E9VBASBOl
         U+g+8vf+/78oDeeuU1yVb3vKkmQtfkmhQulg2dAZsJLrXJi/m4DmumIlYD+ClHbqefHw
         bEZmeW2he1BVpdXIa/k+dPCZVh4EPlqX2FZiFvOK7NdKRRRg+uaOBC7kbpOy0W6lszVR
         DnkUljCKtggsPd4x7iGilzJjg+Fjr99rLP7SNlIqnMU+AJv2HudjOMWQaPR3ZBpk9aTV
         w/Fy/JCgeGEXSorEmA9Yl3cwQw2tAZuC9+0d0lUMIJBiH/yX0YAhuSAIIrtIOeKDd1Pg
         OxCQ==
X-Gm-Message-State: AOAM533kMyqsU0V+asnQ8QXApoEoJY5s+eov6S8jHMRPCDcTwn8tGIR2
        hkUKAfRqHMiu5bOwCersbm/RCw==
X-Google-Smtp-Source: ABdhPJym4TzKXzDldALMqdMuA3rVcxxB5hW2E7FR3tOZW0laUXiBg4pxwEfqYcyH2Z2XwW4SFxcUNA==
X-Received: by 2002:a05:6512:ba2:b0:46b:a046:d31e with SMTP id b34-20020a0565120ba200b0046ba046d31emr3867085lfv.655.1649634301426;
        Sun, 10 Apr 2022 16:45:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m28-20020a19435c000000b00464f6d27ff1sm1153881lfj.103.2022.04.10.16.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 16:45:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8450: Add thermal zones
Date:   Mon, 11 Apr 2022 02:44:57 +0300
Message-Id: <20220410234458.1739279-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org>
References: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Add thermal zones handled by tsens sensors. The definitions and the trip
points were taken from the downstream dts. For the CPU core thermal
sensors, the trip points were changed to follow the example of other
Qualcomm platforms.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 843 +++++++++++++++++++++++++++
 1 file changed, 843 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b695ce824722..4f3c7e7d2855 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -47,6 +48,7 @@ CPU0: cpu@0 {
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 			L2_0: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -65,6 +67,7 @@ CPU1: cpu@100 {
 			power-domains = <&CPU_PD1>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 			L2_100: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -80,6 +83,7 @@ CPU2: cpu@200 {
 			power-domains = <&CPU_PD2>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 			L2_200: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -95,6 +99,7 @@ CPU3: cpu@300 {
 			power-domains = <&CPU_PD3>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 			L2_300: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -110,6 +115,7 @@ CPU4: cpu@400 {
 			power-domains = <&CPU_PD4>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 			L2_400: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -125,6 +131,7 @@ CPU5: cpu@500 {
 			power-domains = <&CPU_PD5>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 			L2_500: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -141,6 +148,7 @@ CPU6: cpu@600 {
 			power-domains = <&CPU_PD6>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 			L2_600: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -156,6 +164,7 @@ CPU7: cpu@700 {
 			power-domains = <&CPU_PD7>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 2>;
+			#cooling-cells = <2>;
 			L2_700: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -1517,6 +1526,840 @@ lpass_ag_noc: interconnect@3c40000 {
 		};
 	};
 
+	thermal-zones {
+		aoss0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss4-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu4-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				cpu4_top_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4_top_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4_top_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				cpu4_bottom_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4_bottom_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4_bottom_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				cpu5_top_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu5_top_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu5_top_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				cpu5_bottom_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu5_bottom_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu5_bottom_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				cpu6_top_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu6_top_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu6_top_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				cpu6_bottom_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu6_bottom_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu6_bottom_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-top-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				cpu7_top_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_top_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_top_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-middle-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				cpu7_middle_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_middle_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_middle_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-bottom-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				cpu7_bottom_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_bottom_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_bottom_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-top-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 14>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu0_tj_cfg: tj_cfg {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpu-bottom-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens0 15>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpu1_tj_cfg: tj_cfg {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu2_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu3_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu3_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu3_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cdsp0-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cdsp_0_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cdsp1-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cdsp_1_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cdsp2-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				thermal-hal-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cdsp_2_config: junction-config {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		video-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		mem-thermal {
+			polling-delay-passive = <10>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				ddr_config0: ddr0-config {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		modem0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				mdmss0_config0: mdmss0-config0 {
+					temperature = <102000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				mdmss0_config1: mdmss0-config1 {
+					temperature = <105000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		modem1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				mdmss1_config0: mdmss1-config0 {
+					temperature = <102000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				mdmss1_config1: mdmss1-config1 {
+					temperature = <105000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		modem2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 12>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				mdmss2_config0: mdmss2-config0 {
+					temperature = <102000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				mdmss2_config1: mdmss2-config1 {
+					temperature = <105000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		modem3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 13>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				mdmss3_config0: mdmss3-config0 {
+					temperature = <102000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				mdmss3_config1: mdmss3-config1 {
+					temperature = <105000>;
+					hysteresis = <3000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camera0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 14>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				reset-mon-cfg {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camera1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tsens1 15>;
+
+			trips {
+				thermal-engine-config {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
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
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.35.1

