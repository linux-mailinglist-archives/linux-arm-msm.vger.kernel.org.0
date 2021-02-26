Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E22A3267FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 21:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhBZUIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 15:08:39 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:58133 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhBZUHh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 15:07:37 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 0A1071FBB2;
        Fri, 26 Feb 2021 21:05:49 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 17/41] arm64: dts: qcom: sdm630: Add thermal-zones configuration
Date:   Fri, 26 Feb 2021 21:03:47 +0100
Message-Id: <20210226200414.167762-18-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210226200414.167762-1-konrad.dybcio@somainline.org>
References: <20210226200414.167762-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a basic thermal-zones configuration to make sure the SoC
doesn't overheat itself to death.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 173 +++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index ffc18d0dee9e..08e499229396 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -521,6 +521,179 @@ modem_smp2p_in: slave-kernel {
 		};
 	};
 
+	thermal-zones {
+		aoss-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				aoss_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				cpuss0_alert0: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 2>;
+
+			trips {
+				cpuss1_alert0: trip-point0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+			};
+		};
+
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 3>;
+
+			trips {
+				cpu0_alert0: trip-point0 {
+					temperature = <70000>;
+					hysteresis = <1000>;
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
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 4>;
+
+			trips {
+				cpu1_alert0: trip-point0 {
+					temperature = <70000>;
+					hysteresis = <1000>;
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
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 5>;
+
+			trips {
+				cpu2_alert0: trip-point0 {
+					temperature = <70000>;
+					hysteresis = <1000>;
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
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 6>;
+
+			trips {
+				cpu3_alert0: trip-point0 {
+					temperature = <70000>;
+					hysteresis = <1000>;
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
+		/*
+		 * According to what downstream DTS says,
+		 * the entire power efficient cluster has
+		 * only a single thermal sensor.
+		 */
+
+		pwr-cluster-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 7>;
+
+			trips {
+				pwr_cluster_alert0: trip-point0 {
+					temperature = <70000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				pwr_cluster_crit: cpu_crit {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 8>;
+
+			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.30.1

