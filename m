Return-Path: <linux-arm-msm+bounces-29698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E799E961BBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 04:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61F601F23FC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFC813C670;
	Wed, 28 Aug 2024 02:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mBga877z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A92946C;
	Wed, 28 Aug 2024 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810577; cv=none; b=fJ77I1xskaKNSOrZyBbnMuIv282RwtD6jehhBggq+You9HlLxnrll4Xp9hzO9/0H6qUGHa9AeVbCpZJAt+AYWqsSrtgxLt9GwibtewYQf9xvJm+scox1I0GL217nqgECCMPD28PT5Jb/uEoumEI8cei7GT6pG11eXMln8qKi3Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810577; c=relaxed/simple;
	bh=FMEsbk1JrRnSiN95mbOaCXhq63WmfdtjdXX6M7piyds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qxzsu+OM9Xw2C+XmsxjdFm866DLN2fV58dZa02qO9uXBeSZ7hfBykiPIbhIBV7LHF5TuJvnjv2746tRWhvjlJVkWHqJBdtNT2/tpwp/WcgUd6yDMHYciFl4u+dZLTtDauMVvFrN385XaYhu4fILHLBRVa8X6j2zyZz6gU3RCWak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mBga877z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLaRu1021272;
	Wed, 28 Aug 2024 02:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sbLefRkClcCTgwNnCBa2vs+LEesyA8kOqEsv76QUuOE=; b=mBga877zEHQ9t6pi
	45aKvX2vKz18AiibvgWkpNZBG6q945X3a/Mse43EzakTmicNj6UEIVCSDhpidBpl
	h2vzPXDFdFQsUI8tnnLsv5d4g0Gti4n+KcRZ87fZOkx2fhO4C+Ty6pX3cIQxkHTX
	X9IdBEsvYYI6C4hSUygHhvfq9AtcLMqbxqoND1yuEn5tRBYwon/h5gDDE28OXhwa
	BVL4tZFKvrXSrTJ3V3Lmr37vbD/W9qJQ1nK4FfRrevef/h0uI61Rv/qUnzlX3FOP
	39HXaoRwrlXEcmYlI3LahhDW3N4EoUnAORE9nhdVgCXSiJDptALFqUAOKWzmK7rB
	4GHsoA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0gdbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S22nuI024718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:49 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 19:02:44 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 28 Aug 2024 10:02:15 +0800
Subject: [PATCH 5/6] arm64: dts: qcom: add initial support for QCS615 DTSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-add_initial_support_for_qcs615-v1-5-5599869ea10f@quicinc.com>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724810550; l=11613;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=FMEsbk1JrRnSiN95mbOaCXhq63WmfdtjdXX6M7piyds=;
 b=6RZmA4zMDfOhHTgOCJZXA13vZ7BSSNxcc3Jyuf5bAF+ffjhtfHSOnMczE0xiVLAzMGIFRxm1e
 JmlJVeCuu8aDeK23Ono3sagMbwipG1EyXZ2IIhxWnbLF1uBI3NseR32
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V9JRRzHYTLoA_271wRn2M0TPzowkWfr4
X-Proofpoint-ORIG-GUID: V9JRRzHYTLoA_271wRn2M0TPzowkWfr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=571 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280013

Add initial DTSI for QCS615 SoC. It includes base description
of CPUs, interrupt-controller and cpu idle on Qualcomm QCS615
platform.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 449 +++++++++++++++++++++++++++++++++++
 1 file changed, 449 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
new file mode 100644
index 000000000000..cf7aaa7f6131
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -0,0 +1,449 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen { };
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+
+			L2_0: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&L3_0>;
+
+				L3_0: l3-cache {
+				      compatible = "cache";
+				      cache-level = <3>;
+				      cache-unified;
+				};
+			};
+		};
+
+		CPU1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
+			next-level-cache = <&L2_100>;
+
+			L2_100: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			power-domains = <&CPU_PD2>;
+			power-domain-names = "psci";
+			next-level-cache = <&L2_200>;
+
+			L2_200: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			power-domains = <&CPU_PD3>;
+			power-domain-names = "psci";
+			next-level-cache = <&L2_300>;
+
+			L2_300: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+			power-domains = <&CPU_PD4>;
+			power-domain-names = "psci";
+			next-level-cache = <&L2_400>;
+
+			L2_400: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+			power-domains = <&CPU_PD5>;
+			power-domain-names = "psci";
+			next-level-cache = <&L2_500>;
+
+			L2_500: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x0 0x600>;
+			enable-method = "psci";
+			power-domains = <&CPU_PD6>;
+			power-domain-names = "psci";
+			next-level-cache = <&L2_600>;
+			#cooling-cells = <2>;
+
+			L2_600: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x0 0x700>;
+			enable-method = "psci";
+			power-domains = <&CPU_PD7>;
+			power-domain-names = "psci";
+			next-level-cache = <&L2_700>;
+
+			L2_700: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&L3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+
+				core4 {
+					cpu = <&CPU4>;
+				};
+
+				core5 {
+					cpu = <&CPU5>;
+				};
+
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU6>;
+				};
+
+				core1 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
+	};
+
+	idle-states {
+		LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			compatible = "arm,idle-state";
+			idle-state-name = "silver-power-collapse";
+			arm,psci-suspend-param = <0x40000003>;
+			entry-latency-us = <549>;
+			exit-latency-us = <901>;
+			min-residency-us = <1774>;
+			local-timer-stop;
+		};
+
+		LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+			compatible = "arm,idle-state";
+			idle-state-name = "silver-rail-power-collapse";
+			arm,psci-suspend-param = <0x40000004>;
+			entry-latency-us = <702>;
+			exit-latency-us = <915>;
+			min-residency-us = <4001>;
+			local-timer-stop;
+		};
+
+		BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			compatible = "arm,idle-state";
+			idle-state-name = "gold-power-collapse";
+			arm,psci-suspend-param = <0x40000003>;
+			entry-latency-us = <523>;
+			exit-latency-us = <1244>;
+			min-residency-us = <2207>;
+			local-timer-stop;
+		};
+
+		BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+			compatible = "arm,idle-state";
+			idle-state-name = "gold-rail-power-collapse";
+			arm,psci-suspend-param = <0x40000004>;
+			entry-latency-us = <526>;
+			exit-latency-us = <1854>;
+			min-residency-us = <5555>;
+			local-timer-stop;
+		};
+	};
+
+	domain-idle-states {
+		CLUSTER_SLEEP_0: cluster-sleep-0 {
+			compatible = "domain-idle-state";
+			arm,psci-suspend-param = <0x41000044>;
+			entry-latency-us = <2752>;
+			exit-latency-us = <3048>;
+			min-residency-us = <6118>;
+		};
+
+		CLUSTER_SLEEP_1: cluster-sleep-1 {
+			compatible = "domain-idle-state";
+			arm,psci-suspend-param = <0x41001344>;
+			entry-latency-us = <3263>;
+			exit-latency-us = <4562>;
+			min-residency-us = <8467>;
+		};
+
+		SYSTEM_SLEEP: domain-sleep {
+			compatible = "domain-idle-state";
+			arm,psci-suspend-param = <0x4100b344>;
+			entry-latency-us = <3638>;
+			exit-latency-us = <6562>;
+			min-residency-us = <9826>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0 0x80000000 0 0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		CPU_PD0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+		};
+
+		CPU_PD6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+		};
+
+		CPU_PD7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+		};
+
+		CLUSTER_PD: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&CLUSTER_SLEEP_0 &CLUSTER_SLEEP_1 &SYSTEM_SLEEP>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0 0x10 0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,qcs615-pdc", "qcom,pdc";
+			reg = <0x0 0xb220000 0x0 0x30000>,
+			      <0x0 0x17c000f0 0x0 0x64>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
+			interrupt-parent = <&intc>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+		};
+
+		timer@17c20000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+			ranges = <0 0 0 0x20000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@17c21000 {
+				reg = <0x17c21000 0x1000>,
+				      <0x17c22000 0x1000>;
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			frame@17c23000 {
+				reg = <0x17c23000 0x1000>;
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				reg = <0x17c25000 0x1000>;
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				reg = <0x17c27000 0x1000>;
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				reg = <0x17c29000 0x1000>;
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				reg = <0x17c2b000 0x1000>;
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				reg = <0x17c2d000 0x1000>;
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+	};
+
+	arch_timer: timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};

-- 
2.46.0


