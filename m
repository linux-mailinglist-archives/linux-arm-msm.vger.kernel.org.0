Return-Path: <linux-arm-msm+bounces-49072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E13A4111E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 20:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7116E1891B43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 19:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80391FC7E2;
	Sun, 23 Feb 2025 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="g09R/WZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DA81C862C;
	Sun, 23 Feb 2025 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337140; cv=none; b=qXVlDjUssBvzIyTuJKjuzr/t2rO7y5ZdeUxO1Q7dkPyPPGvv8mdByNALl1DtrJhyNUIEWlqXlGmxdz1OFEOsmL4eypCiN8NUkFaAqEP3SzABLjxKz2auqK5rsZDxw3noDduQjViyInaXt3lCIlytscseM8lPkwpUFiUwflb0FG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337140; c=relaxed/simple;
	bh=1oeJ47NyTj+cU9olfUtjtOmSx+RDq6Agdo7MfMwsCcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d30lbHmmsT8nd6pAhxe6PwQwImsF4bX0Ux4vfWZILiGntfJJX8z40fw1gJinewLq9T2YNM1lhjtFWUj+OEpWhyeLmDHMRBbOAIcKJoF3ZiArocuAi7r9DDQzYjaVRYWeZc9VboVMp0mrjgTfC7dxidsom+Szdqc65wOPDtKHLuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=g09R/WZU; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id 99CE3BBABC;
	Sun, 23 Feb 2025 18:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740337135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tA/1ZYLdBRc8v+9H0OYvhKT+G9QLglpWInImA180mG0=;
	b=g09R/WZUzPD+/Gse5T6wj86si+KiPVbR8cTebmqFAwMgpJvxBzRKlqPboleHhe8/QTeyK8
	oz7BNooPdxJaK8fXWpuUJzOlz+IQRuSUc6gaHBDhKYZZNIqC7yMLNceP4XIzoqYWLYt5UP
	5qbwrnajTR6Pm2eP7yCO0LNYQFovMQK/lpiM3rBqaUdVVJaZCM8Sxdwp5amwjjI/BbLYwC
	3Qbai37ZJM1KoIiVvMCPpGYRlmd0fyAIMyHqSBEUqYpDpG+8tWrtbTmDNX0LPv7MLp6E2w
	AKNhnEKalSO7vl2lAHwHI2oqgPdHaHlVtmhLMWDXxRVHMYLqNyxHtTPfA2SxVQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 23 Feb 2025 19:57:51 +0100
Subject: [PATCH v2 6/8] arm64: dts: qcom: Add initial support for MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250223-msm8937-v2-6-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Dang Huynh <danct12@riseup.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740337120; l=50973;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=6CaAWNndqKqKO5nMtrp1GvqhZr+xAUTMtrleCo+qdcU=;
 b=6L7Zzq8HBC220cWW+3JVQEMFF6dLAtS36t44DKpJgWQSmBpI0R4m5/DcH8rmRAeuZQK7Epkm6
 J9FOFcHaL04AD2EDQ8MesSFy4F46eshAkke3sqV80oCiHmUvYzqKviH
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Dang Huynh <danct12@riseup.net>

Add initial support for MSM8937 SoC.

Signed-off-by: Dang Huynh <danct12@riseup.net>
Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 2149 +++++++++++++++++++++++++++++++++
 1 file changed, 2149 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..7e937708a51df902f522eac372285f6bf2030597
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -0,0 +1,2149 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
+ */
+
+#include <dt-bindings/clock/qcom,gcc-msm8917.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table_c0>;
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-unified;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			device_type = "cpu";
+			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table_c0>;
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu2: cpu@2 {
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			device_type = "cpu";
+			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table_c0>;
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu3: cpu@3 {
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			device_type = "cpu";
+			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table_c0>;
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu4: cpu@100 {
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&l2_1>;
+			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table_c1>;
+			#cooling-cells = <2>;
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+
+			l2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-size = <0x100000>;
+				cache-unified;
+			};
+		};
+
+		cpu5: cpu@101 {
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			device_type = "cpu";
+			next-level-cache = <&l2_1>;
+			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table_c1>;
+			#cooling-cells = <2>;
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
+		};
+
+		cpu6: cpu@102 {
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			device_type = "cpu";
+			next-level-cache = <&l2_1>;
+			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table_c1>;
+			#cooling-cells = <2>;
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
+		};
+
+		cpu7: cpu@103 {
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			device_type = "cpu";
+			next-level-cache = <&l2_1>;
+			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table_c1>;
+			#cooling-cells = <2>;
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
+		};
+
+		cpu-map {
+			/* The MSM8937 has 2 cluster A53 setup. */
+			/* Little Cores */
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			/* Big Cores */
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+
+				core2 {
+					cpu = <&cpu6>;
+				};
+
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "standalone-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <125>;
+				exit-latency-us = <180>;
+				min-residency-us = <595>;
+				local-timer-stop;
+			};
+		};
+
+		domain-idle-states {
+			cluster_sleep_0: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000053>;
+				entry-latency-us = <700>;
+				exit-latency-us = <1000>;
+				min-residency-us = <6500>;
+			};
+		};
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm-msm8916", "qcom,scm";
+			clocks = <&gcc GCC_CRYPTO_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "core", "bus", "iface";
+			#reset-cells = <1>;
+
+			qcom,dload-mode = <&tcsr 0x6100>;
+		};
+	};
+
+	memory@80000000 {
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0x80000000 0 0>;
+		device_type = "memory";
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		qseecom_mem: reserved@85b00000 {
+			reg = <0x0 0x85b00000 0x0 0x800000>;
+			no-map;
+		};
+
+		smem@86300000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x86300000 0x0 0x100000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+			qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		};
+
+		reserved@86400000 {
+			reg = <0x0 0x86400000 0x0 0x400000>;
+			no-map;
+		};
+
+		rmtfs@92100000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x92100000 0x0 0x180000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+
+		adsp_mem: adsp {
+			size = <0x0 0x1100000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
+			no-map;
+			status = "disabled";
+		};
+
+		mba_mem: mba {
+			size = <0x0 0x100000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
+			no-map;
+			status = "disabled";
+		};
+
+		wcnss_mem: wcnss {
+			size = <0x0 0x700000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
+			no-map;
+			status = "disabled";
+		};
+
+		venus_mem: venus {
+			size = <0x0 0x400000>;
+			alignment = <0x0 0x100000>;
+			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
+			no-map;
+			status = "disabled";
+		};
+	};
+
+	cpu_opp_table_c0: opp-table-c0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+		};
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+		};
+
+		opp-998400000 {
+			opp-hz = /bits/ 64 <998400000>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+		};
+	};
+
+	cpu_opp_table_c1: opp-table-c1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+		};
+
+		opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+		};
+
+		opp-1344000000 {
+			opp-hz = /bits/ 64 <1344000000>;
+		};
+
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_0>;
+		};
+
+		cpu_pd0: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_sleep_0>;
+		};
+
+		cpu_pd1: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_sleep_0>;
+		};
+
+		cpu_pd2: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_sleep_0>;
+		};
+
+		cpu_pd3: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_sleep_0>;
+		};
+	};
+
+	rpm: remoteproc {
+		compatible = "qcom,msm8937-rpm-proc", "qcom,rpm-proc";
+
+		smd-edge {
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			qcom,ipc = <&apcs1 8 0>;
+			qcom,smd-edge = <15>;
+
+			rpm_requests: rpm-requests {
+				compatible = "qcom,rpm-msm8937", "qcom,smd-rpm";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: clock-controller {
+					compatible = "qcom,rpmcc-msm8937", "qcom,rpmcc";
+					#clock-cells = <1>;
+					clocks = <&xo_board>;
+					clock-names = "xo";
+				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,msm8937-rpmpd", "qcom,msm8917-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+
+					rpmpd_opp_table: opp-table {
+						compatible = "operating-points-v2";
+
+						rpmpd_opp_ret: opp1 {
+							opp-level = <RPM_SMD_LEVEL_RETENTION>;
+						};
+
+						rpmpd_opp_ret_plus: opp2 {
+							opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
+						};
+
+						rpmpd_opp_min_svs: opp3 {
+							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+						};
+
+						rpmpd_opp_low_svs: opp4 {
+							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+						};
+
+						rpmpd_opp_svs: opp5 {
+							opp-level = <RPM_SMD_LEVEL_SVS>;
+						};
+
+						rpmpd_opp_svs_plus: opp6 {
+							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+						};
+
+						rpmpd_opp_nom: opp7 {
+							opp-level = <RPM_SMD_LEVEL_NOM>;
+						};
+
+						rpmpd_opp_nom_plus: opp8 {
+							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+						};
+
+						rpmpd_opp_turbo: opp9 {
+							opp-level = <RPM_SMD_LEVEL_TURBO>;
+						};
+					};
+				};
+			};
+		};
+	};
+
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs1 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-modem {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs1 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-wcnss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <451>, <431>;
+
+		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs1 18>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <4>;
+
+		wcnss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcnss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mboxes = <0>, <&apcs1 13>, <0>, <&apcs1 19>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+
+			#qcom,smem-state-cells = <1>;
+		};
+
+		hexagon_smsm: hexagon@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wcnss_smsm: wcnss@6 {
+			reg = <6>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xffffffff>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		rng@e3000 {
+			compatible = "qcom,prng";
+			reg = <0xe3000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		restart@4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0x004ab000 0x4>;
+		};
+
+		qfprom: qfprom@a4000 {
+			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
+			reg = <0x000a4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			tsens_base1: base1@1d8 {
+				reg = <0x1d8 1>;
+				bits = <0 8>;
+			};
+
+			tsens_s5_p1: s5-p1@1d9 {
+				reg = <0x1d9 1>;
+				bits = <0 6>;
+			};
+
+			tsens_s5_p2: s5-p2@1d9 {
+				reg = <0x1d9 2>;
+				bits = <6 6>;
+			};
+
+			tsens_s6_p1: s6-p1@1da {
+				reg = <0x1da 2>;
+				bits = <4 6>;
+			};
+
+			tsens_s6_p2: s6-p2@1db {
+				reg = <0x1db 1>;
+				bits = <2 6>;
+			};
+
+			tsens_s7_p1: s7-p1@1dc {
+				reg = <0x1dc 1>;
+				bits = <0 6>;
+			};
+
+			tsens_s7_p2: s7-p2@1dc {
+				reg = <0x1dc 2>;
+				bits = <6 6>;
+			};
+
+			tsens_s8_p1: s8-p1@1dd {
+				reg = <0x1dd 2>;
+				bits = <4 6>;
+			};
+
+			tsens_s8_p2: s8-p2@1de {
+				reg = <0x1de 1>;
+				bits = <2 6>;
+			};
+
+			tsens_base2: base2@1df {
+				reg = <0x1df 1>;
+				bits = <0 8>;
+			};
+
+			tsens_mode: mode@210 {
+				reg = <0x210 1>;
+				bits = <0 3>;
+			};
+
+			tsens_s0_p1: s0-p1@210 {
+				reg = <0x210 2>;
+				bits = <3 6>;
+			};
+
+			tsens_s0_p2: s0-p2@211 {
+				reg = <0x211 1>;
+				bits = <1 6>;
+			};
+
+			tsens_s1_p1: s1-p1@211 {
+				reg = <0x211 2>;
+				bits = <7 6>;
+			};
+
+			tsens_s1_p2: s1-p2@212 {
+				reg = <0x212 2>;
+				bits = <5 6>;
+			};
+
+			tsens_s2_p1: s2-p1@213 {
+				reg = <0x213 2>;
+				bits = <3 6>;
+			};
+
+			tsens_s2_p2: s2-p2@214 {
+				reg = <0x214 1>;
+				bits = <1 6>;
+			};
+
+			tsens_s3_p1: s3-p1@214 {
+				reg = <0x214 2>;
+				bits = <7 6>;
+			};
+
+			tsens_s3_p2: s3-p2@215 {
+				reg = <0x215 2>;
+				bits = <5 6>;
+			};
+
+			tsens_s4_p1: s4-p1@216 {
+				reg = <0x216 2>;
+				bits = <3 6>;
+			};
+
+			tsens_s4_p2: s4-p2@217 {
+				reg = <0x217 1>;
+				bits = <1 6>;
+			};
+
+			tsens_s9_p1: s9-p1@230{
+				reg = <0x230 1>;
+				bits = <0 6>;
+			};
+
+			tsens_s9_p2: s9-p2@230 {
+				reg = <0x230 2>;
+				bits = <6 6>;
+			};
+
+			tsens_s10_p1: s10-p1@231 {
+				reg = <0x231 2>;
+				bits = <4 6>;
+			};
+
+			tsens_s10_p2: s10-p2@232 {
+				reg = <0x232 1>;
+				bits = <2 6>;
+			};
+		};
+
+		usb_hs_phy: phy@6c000 {
+			compatible = "qcom,usb-hs-28nm-femtophy";
+			reg = <0x6c000 0x200>;
+			#phy-cells = <0>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+			clock-names = "ref", "ahb", "sleep";
+			resets = <&gcc GCC_QUSB2_PHY_BCR>,
+				 <&gcc GCC_USB2_HS_PHY_ONLY_BCR>;
+			reset-names = "phy", "por";
+			status = "disabled";
+		};
+
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,msm8937-tsens", "qcom,tsens-v1";
+			reg = <0x004a9000 0x1000>,
+			      <0x004a8000 0x1000>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
+			nvmem-cells = <&tsens_mode>,
+				      <&tsens_base1>, <&tsens_base2>,
+				      <&tsens_s0_p1>, <&tsens_s0_p2>,
+				      <&tsens_s1_p1>, <&tsens_s1_p2>,
+				      <&tsens_s2_p1>, <&tsens_s2_p2>,
+				      <&tsens_s3_p1>, <&tsens_s3_p2>,
+				      <&tsens_s4_p1>, <&tsens_s4_p2>,
+				      <&tsens_s5_p1>, <&tsens_s5_p2>,
+				      <&tsens_s6_p1>, <&tsens_s6_p2>,
+				      <&tsens_s7_p1>, <&tsens_s7_p2>,
+				      <&tsens_s8_p1>, <&tsens_s8_p2>,
+				      <&tsens_s9_p1>, <&tsens_s9_p2>,
+				      <&tsens_s10_p1>, <&tsens_s10_p2>;
+			nvmem-cell-names = "mode",
+					   "base1", "base2",
+					   "s0_p1", "s0_p2",
+					   "s1_p1", "s1_p2",
+					   "s2_p1", "s2_p2",
+					   "s3_p1", "s3_p2",
+					   "s4_p1", "s4_p2",
+					   "s5_p1", "s5_p2",
+					   "s6_p1", "s6_p2",
+					   "s7_p1", "s7_p2",
+					   "s8_p1", "s8_p2",
+					   "s9_p1", "s9_p2",
+					   "s10_p1", "s10_p2";
+			#qcom,sensors = <11>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		rpm_msg_ram: sram@60000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x00060000 0x8000>;
+		};
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,msm8917-pinctrl";
+			reg = <0x01000000 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 134>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			blsp1_i2c2_default: blsp1-i2c2-default-state {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c2_sleep: blsp1-i2c2-sleep-state {
+				pins = "gpio6", "gpio7";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c3_default: blsp1-i2c3-default-state {
+				pins = "gpio10", "gpio11";
+				function = "blsp_i2c3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c3_sleep: blsp1-i2c3-sleep-state {
+				pins = "gpio10", "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c4_default: blsp1-i2c4-default-state {
+				pins = "gpio14", "gpio15";
+				function = "blsp_i2c4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c4_sleep: blsp1-i2c4-sleep-state {
+				pins = "gpio14", "gpio15";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c1_default: blsp2-i2c1-default-state {
+				pins = "gpio18", "gpio19";
+				function = "blsp_i2c5";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c1_sleep: blsp2-i2c1-sleep-state {
+				pins = "gpio18", "gpio19";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_spi3_default: blsp1-spi3-default-state {
+				cs-pins {
+					pins = "gpio10";
+					function = "blsp_spi3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio8", "gpio9", "gpio11";
+					function = "blsp_spi3";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
+
+			blsp1_spi3_sleep: blsp1-spi3-sleep-state {
+				cs-pins {
+					pins = "gpio10";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio8", "gpio9", "gpio11";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			blsp2_spi2_default: blsp2-spi2-default-state {
+				cs0-pins {
+					pins = "gpio47";
+					function = "blsp_spi6";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cs1-pins {
+					pins = "gpio22";
+					function = "blsp_spi6";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "blsp_spi6";
+					drive-strength = <16>;
+					bias-disable;
+				};
+			};
+
+			blsp2_spi2_sleep: blsp2-spi2-sleep-state {
+				cs0-pins {
+					pins = "gpio47";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cs1-pins {
+					pins = "gpio22";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			blsp1_uart1_default: blsp1-uart1-default-state {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "blsp_uart1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_uart1_sleep: blsp1-uart1-sleep-state {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_uart2_default: blsp1-uart2-default-state {
+				pins = "gpio4", "gpio5";
+				function = "blsp_uart2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_uart2_sleep: blsp1-uart2-sleep-state {
+				pins = "gpio4", "gpio5";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			sdc1_default: sdc1-default-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_sleep: sdc1-sleep-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				sdc2_cmd_default: cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <16>;
+				};
+
+				sdc2_data_default: data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <16>;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			wcnss_pin_a: wcnss-active-state {
+				wcss-wlan-pins {
+					pins = "gpio79", "gpio80";
+					function = "wcss_wlan";
+					drive-strength = <6>;
+					bias-pull-up;
+
+				};
+
+				wcss-wlan0-pins {
+					pins = "gpio78";
+					function = "wcss_wlan0";
+					drive-strength = <6>;
+					bias-pull-up;
+
+				};
+
+				wcss-wlan1-pins {
+					pins = "gpio77";
+					function = "wcss_wlan1";
+					drive-strength = <6>;
+					bias-pull-up;
+
+				};
+
+				wcss-wlan2-pins {
+					pins = "gpio76";
+					function = "wcss_wlan2";
+					drive-strength = <6>;
+					bias-pull-up;
+
+				};
+			};
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,gcc-msm8937";
+			reg = <0x01800000 0x80000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi1_phy 0>;
+			clock-names = "xo",
+				      "sleep_clk",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "dsi1pll",
+				      "dsi1pllbyte";
+		};
+
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x01905000 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-msm8937", "syscon";
+			reg = <0x01937000 0x30000>;
+		};
+
+		mdss: display-subsystem@1a00000 {
+			compatible = "qcom,mdss";
+			reg = <0x01a00000 0x1000>,
+			      <0x01ab0000 0x1040>;
+			reg-names = "mdss_phys", "vbif_phys";
+			ranges;
+
+			power-domains = <&gcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "vsync";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			mdp: display-controller@1a01000 {
+				compatible = "qcom,msm8937-mdp5", "qcom,mdp5";
+				reg = <0x01a01000 0x89000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_VSYNC_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync";
+
+				iommus = <&apps_iommu 0x15>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdp5_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@1a94000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x01a94000 0x300>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
+						  <&gcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>,
+							 <&mdss_dsi0_phy 1>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE0_CLK>,
+					 <&gcc GCC_MDSS_PCLK0_CLK>,
+					 <&gcc GCC_MDSS_ESC0_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+				phys = <&mdss_dsi0_phy>;
+
+				operating-points-v2 = <&mdss_dsi0_opp_table>;
+				power-domains = <&rpmpd MSM8917_VDDCX>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-125000000 {
+						opp-hz = /bits/ 64 <125000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@1a94400 {
+				compatible = "qcom,dsi-phy-28nm-8937";
+				reg = <0x01a94a00 0xd4>,
+				      <0x01a94400 0x280>,
+				      <0x01a94b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss_dsi1: dsi@1a96000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x01a96000 0x300>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
+						  <&gcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>,
+							 <&mdss_dsi1_phy 1>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE1_CLK>,
+					 <&gcc GCC_MDSS_PCLK1_CLK>,
+					 <&gcc GCC_MDSS_ESC1_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+				phys = <&mdss_dsi1_phy>;
+
+				operating-points-v2 = <&mdss_dsi1_opp_table>;
+				power-domains = <&rpmpd MSM8917_VDDCX>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi1_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-125000000 {
+						opp-hz = /bits/ 64 <125000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@1a96a00 {
+				compatible = "qcom,dsi-phy-28nm-8937";
+				reg = <0x01a96a00 0xd4>,
+				      <0x01a96400 0x280>,
+				      <0x01a94b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
+		gpu: gpu@1c00000 {
+			compatible = "qcom,adreno-505.0", "qcom,adreno";
+			reg = <0x1c00000 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+			#cooling-cells = <2>;
+			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
+				<&gcc GCC_OXILI_AHB_CLK>,
+				<&gcc GCC_BIMC_GFX_CLK>,
+				<&gcc GCC_BIMC_GPU_CLK>,
+				<&gcc GCC_OXILI_TIMER_CLK>,
+				<&gcc GCC_OXILI_AON_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "rbbmtimer",
+				      "alwayson";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&gcc OXILI_GX_GDSC>;
+
+			iommus = <&adreno_smmu 0>;
+
+			status = "disabled";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					opp-supported-hw = <0xFF>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-216000000 {
+					opp-hz = /bits/ 64 <216000000>;
+					opp-supported-hw = <0xFF>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					opp-supported-hw = <0xFF>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-375000000 {
+					opp-hz = /bits/ 64 <375000000>;
+					opp-supported-hw = <0xFF>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-supported-hw = <0xFF>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+				};
+
+				opp-450000000 {
+					opp-hz = /bits/ 64 <450000000>;
+					opp-supported-hw = <0xFF>;
+					required-opps = <&rpmpd_opp_turbo>;
+				};
+			};
+		};
+
+		adreno_smmu: iommu@1c40000 {
+			compatible = "qcom,msm8996-smmu-v2",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-v2";
+			reg = <0x1c40000 0x10000>;
+
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+
+			clocks = <&gcc GCC_BIMC_GFX_CLK>, <&gcc GCC_OXILI_AHB_CLK>;
+			clock-names = "bus", "iface";
+
+			power-domains = <&gcc OXILI_CX_GDSC>;
+		};
+
+		apps_iommu: iommu@1e20000 {
+			compatible = "qcom,msm8937-iommu", "qcom,msm-iommu-v1";
+			ranges = <0 0x01e20000 0x20000>;
+
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+
+			qcom,iommu-secure-id = <17>;
+
+			#address-cells = <1>;
+			#iommu-cells = <1>;
+			#size-cells = <1>;
+
+			/* VFE */
+			iommu-ctx@14000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x14000 0x1000>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* MDP_0 */
+			iommu-ctx@15000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x15000 0x1000>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* VENUS_NS */
+			iommu-ctx@16000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x16000 0x1000>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		spmi_bus: spmi@200f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0200f000 0x001000>,
+			      <0x02400000 0x800000>,
+			      <0x02c00000 0x800000>,
+			      <0x03800000 0x200000>,
+			      <0x0200a000 0x002100>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		bam_dmux_dma: dma-controller@4044000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x04044000 0x19000>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+
+			status = "disabled";
+		};
+
+		sdhc_1: mmc@7824900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07824900 0x500>, <0x07824000 0x800>;
+			reg-names = "hc", "core";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface", "core", "xo";
+			pinctrl-0 = <&sdc1_default>;
+			pinctrl-1 = <&sdc1_sleep>;
+			pinctrl-names = "default", "sleep";
+			power-domains = <&rpmpd MSM8917_VDDCX>;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-ddr-1_8v;
+			bus-width = <8>;
+			non-removable;
+			status = "disabled";
+		};
+
+		sdhc_2: mmc@7864900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07864900 0x500>, <0x07864000 0x800>;
+			reg-names = "hc", "core";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface", "core", "xo";
+			pinctrl-0 = <&sdc2_default>;
+			pinctrl-1 = <&sdc2_sleep>;
+			pinctrl-names = "default", "sleep";
+			power-domains = <&rpmpd MSM8917_VDDCX>;
+			bus-width = <4>;
+			status = "disabled";
+		};
+
+		blsp1_dma: dma-controller@7884000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07884000 0x1f000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			qcom,controlled-remotely;
+			#dma-cells = <1>;
+			num-channels = <12>;
+			qcom,num-ees = <4>;
+			qcom,ee = <0>;
+		};
+
+		blsp1_uart2: serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b0000 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 2>, <&blsp1_dma 3>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+		};
+
+		blsp1_i2c2: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b6000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp1_i2c2_default>;
+			pinctrl-1 = <&blsp1_i2c2_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_i2c3: i2c@78b7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b7000 0x600>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp1_i2c3_default>;
+			pinctrl-1 = <&blsp1_i2c3_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_spi3: spi@78b7000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b7000 0x600>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp1_spi3_default>;
+			pinctrl-1 = <&blsp1_spi3_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_i2c4: i2c@78b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b8000 0x500>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 10>, <&blsp1_dma 11>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp1_i2c4_default>;
+			pinctrl-1 = <&blsp1_i2c4_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_dma: dma-controller@7ac4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07ac4000 0x1d000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			qcom,controlled-remotely;
+			#dma-cells = <1>;
+			num-channels = <10>;
+			qcom,num-ees = <4>;
+			qcom,ee = <0>;
+		};
+
+		blsp2_i2c1: i2c@7af5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x07af5000 0x600>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 4>, <&blsp2_dma 5>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp2_i2c1_default>;
+			pinctrl-1 = <&blsp2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_spi2: spi@7af6000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x07af6000 0x600>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_QUP2_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&blsp2_spi2_default>;
+			pinctrl-1 = <&blsp2_spi2_sleep>;
+			pinctrl-names = "default", "sleep";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		usb: usb@78db000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0x078db000 0x200>,
+			      <0x078db200 0x200>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
+				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			clock-names = "iface", "core";
+			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			assigned-clock-rates = <80000000>;
+			resets = <&gcc GCC_USB_HS_BCR>;
+			reset-names = "core";
+			phy_type = "ulpi";
+			dr_mode = "otg";
+			hnp-disable;
+			srp-disable;
+			adp-disable;
+			ahb-burst-config = <0>;
+			phy-names = "usb-phy";
+			phys = <&usb_hs_phy>;
+			status = "disabled";
+			#reset-cells = <1>;
+		};
+
+		wcnss: remoteproc@a204000 {
+			compatible = "qcom,pronto-v3-pil", "qcom,pronto";
+			reg = <0x0a204000 0x2000>,
+			      <0x0a202000 0x1000>,
+			      <0x0a21b000 0x3000>;
+			reg-names = "ccu",
+				    "dxe",
+				    "pmu";
+
+			memory-region = <&wcnss_mem>;
+
+			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			power-domains = <&rpmpd MSM8917_VDDCX>,
+					<&rpmpd MSM8917_VDDMX>;
+			power-domain-names = "cx", "mx";
+
+			qcom,smem-states = <&wcnss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			pinctrl-0 = <&wcnss_pin_a>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+
+			wcnss_iris: iris {
+				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+				clock-names = "xo";
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&apcs1 17>;
+				qcom,smd-edge = <6>;
+				qcom,remote-pid = <4>;
+
+				label = "pronto";
+
+				wcnss_ctrl: wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+
+					qcom,mmio = <&wcnss>;
+
+					wcnss_bt: bluetooth {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wcnss_wifi: wifi {
+						compatible = "qcom,wcnss-wlan";
+
+						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx", "rx";
+
+						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable",
+									"tx-rings-empty";
+					};
+				};
+			};
+		};
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0b000000 0x1000>,
+			      <0x0b002000 0x1000>;
+		};
+
+		apcs1: mailbox@b011000 {
+			compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
+			reg = <0x0b011000 0x1000>;
+			#mbox-cells = <1>;
+		};
+
+		watchdog@b017000 {
+			compatible = "qcom,apss-wdt-qcs404", "qcom,kpss-wdt";
+			reg = <0x0b017000 0x1000>;
+			clocks = <&sleep_clk>;
+		};
+
+		timer@b120000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0b120000 0x1000>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@b121000 {
+				reg = <0x0b121000 0x1000>,
+				      <0x0b122000 0x1000>;
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			frame@b123000 {
+				reg = <0x0b123000 0x1000>;
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@b124000 {
+				reg = <0x0b124000 0x1000>;
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@b125000 {
+				reg = <0x0b125000 0x1000>;
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@b126000 {
+				reg = <0x0b126000 0x1000>;
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@b127000 {
+				reg = <0x0b127000 0x1000>;
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@b128000 {
+				reg = <0x0b128000 0x1000>;
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+	};
+
+	thermal_zones: thermal-zones {
+		aoss-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				aoss_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		mdm-core-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				mdm_core_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		q6-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 2>;
+
+			trips {
+				q6_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		camera-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 3>;
+
+			trips {
+				camera_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 4>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpuss1_alert0>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpuss1_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpuss1_alert1: trip-point1 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss1_crit: cpuss1-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 5>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_alert1>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu4_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4_alert1: trip-point1 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu4_crit: cpu-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 6>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu5_alert1>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu5_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu5_alert1: trip-point1 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu5_crit: cpu-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 7>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu6_alert1>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu6_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu6_alert1: trip-point1 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu6_crit: cpu-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 8>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu7_alert1>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu7_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu7_alert1: trip-point1 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_crit: cpu-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 9>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpuss0_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpuss0_alert0: trip-point0 {
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpuss0_alert1: trip-point1 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpuss0_crit: cpuss0-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&tsens 10>;
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				gpu_alert: trip-point0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_crit: gpu-crit {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+

-- 
2.48.1


