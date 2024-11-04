Return-Path: <linux-arm-msm+bounces-36894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52D9BAF49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FCA5B23328
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617341B2197;
	Mon,  4 Nov 2024 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IY4HRHV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082931B0F1C;
	Mon,  4 Nov 2024 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711462; cv=none; b=go1mKiaJ4whQFW6RMmUDMh6eQXt0/FgdV9mx15F3jM24TesaxJQSMDe0fOKgXhQFEGANGlHsTb2QJ3lQLzKLMZJB0zhk96ofdpSCWOAMchJcGHWPnQUVxs11d0cR0Q6xPftPvQXDCjcuzyqNhm0Tp8pcL6WnbvgejhFHfGrspGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711462; c=relaxed/simple;
	bh=x7Q4PF93R3XCu1t3Koy19KqR6qC+FLG5g+QgpKbhQkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tzexrh2mmG7cexHkpcbfwvnQljhCHcDmoFEHj5geCfeKLfbY2NRr+hG7Jbnre9FI985eDn+mc/uOpA8j86ztAgXW6/+rPhJuL/BMS4KRJVkLxbfxB+gJReZdUUVwnCJQoUxLHUbrrQDucJHxTw9rcSiNptaiv2q9XL0LK0T/p9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IY4HRHV9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A40ee8B004206;
	Mon, 4 Nov 2024 09:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WAuapJHpQ1ydcuLMQP4vL57VvyqbO7adjRrMyUSzeM=; b=IY4HRHV9FnR3/ago
	1zHyDip9vFPpJe+5XDZPL+4oonRv2O2jFDkPP1lgJ6xkOyTjUbU+iG+So7m9dsRu
	9f6iaX0EBaxpSiucDUdxlh9V0Lf/alvaLRIRHg9e7mjFfwoOvjgTBdm6+vDT4CfN
	eDcK6KMlnhXTiule+FuhR6cxKn+flaZlnmQzfpn329OleKT3xJbjgGNAX5wroTql
	aehByTzudhFYSN0LSx5abyWFsC1QQA/8+f8msRolwkN/zUd2IWf+FeCE3ShfPGdb
	XFr6xIv6aRaDU9luqUtvF79CCXWQNygvccZz2BKqKUozn0AMJBMm5sQBarJAqFfB
	ME4aAg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ykh2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:10:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A49Aeq7022362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 09:10:40 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 01:10:34 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 4 Nov 2024 17:10:10 +0800
Subject: [PATCH v5 3/5] arm64: dts: qcom: add QCS615 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241104-add_initial_support_for_qcs615-v5-3-9dde8d7b80b0@quicinc.com>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        lijuang <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730711423; l=18585;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=x7Q4PF93R3XCu1t3Koy19KqR6qC+FLG5g+QgpKbhQkc=;
 b=2uWI0oFTajYfgTThu+dMF8pExIMztCzWgXNp/BEoqx62a9+PdcMLSNK7AcXk+0NXfpy0xqa+b
 nfs3C3f+fXzB7i7MwD/3O/3ZDKe42tmjNy3QxT9YITyUkJkG+a0lskp
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m50c5Rj8QoqQdx2WAPjX23umO7jGCeNu
X-Proofpoint-ORIG-GUID: m50c5Rj8QoqQdx2WAPjX23umO7jGCeNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040081

Add initial DTSI for QCS615 SoC.

Features added in this revision:
- CPUs with PSCI idle states
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- QFPROM
- TLMM
- Watchdog
- RPMH controller
- Sleep stats driver
- Rpmhpd power controller
- Interconnect
- GCC and Rpmhcc
- QUP with Uart serial support

Written with help from Tingguo Cheng (added rpmhpd power controller nodes)
Taniya Das (added clocks nodes), and Raviteja Laggyshetty (added
interconnect nodes).

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 688 +++++++++++++++++++++++++++++++++++
 1 file changed, 688 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
new file mode 100644
index 000000000000..868808918fd2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -0,0 +1,688 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+/ {
+	interrupt-parent = <&intc>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+
+			l2_0: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
+			next-level-cache = <&l2_100>;
+
+			l2_100: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
+			next-level-cache = <&l2_200>;
+
+			l2_200: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
+			next-level-cache = <&l2_300>;
+
+			l2_300: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd4>;
+			power-domain-names = "psci";
+			next-level-cache = <&l2_400>;
+
+			l2_400: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd5>;
+			power-domain-names = "psci";
+			next-level-cache = <&l2_500>;
+
+			l2_500: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x0 0x600>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd6>;
+			power-domain-names = "psci";
+			next-level-cache = <&l2_600>;
+			#cooling-cells = <2>;
+
+			l2_600: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x0 0x700>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd7>;
+			power-domain-names = "psci";
+			next-level-cache = <&l2_700>;
+
+			l2_700: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			      cache-unified;
+			      next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu-map {
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
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+
+				core6 {
+					cpu = <&cpu6>;
+				};
+
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		l3_0: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+		};
+	};
+
+	idle-states {
+		entry-method = "psci";
+
+		little_cpu_sleep_0: cpu-sleep-0-0 {
+			compatible = "arm,idle-state";
+			idle-state-name = "silver-power-collapse";
+			arm,psci-suspend-param = <0x40000003>;
+			entry-latency-us = <549>;
+			exit-latency-us = <901>;
+			min-residency-us = <1774>;
+			local-timer-stop;
+		};
+
+		little_cpu_sleep_1: cpu-sleep-0-1 {
+			compatible = "arm,idle-state";
+			idle-state-name = "silver-rail-power-collapse";
+			arm,psci-suspend-param = <0x40000004>;
+			entry-latency-us = <702>;
+			exit-latency-us = <915>;
+			min-residency-us = <4001>;
+			local-timer-stop;
+		};
+
+		big_cpu_sleep_0: cpu-sleep-1-0 {
+			compatible = "arm,idle-state";
+			idle-state-name = "gold-power-collapse";
+			arm,psci-suspend-param = <0x40000003>;
+			entry-latency-us = <523>;
+			exit-latency-us = <1244>;
+			min-residency-us = <2207>;
+			local-timer-stop;
+		};
+
+		big_cpu_sleep_1: cpu-sleep-1-1 {
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
+		cluster_sleep_0: cluster-sleep-0 {
+			compatible = "domain-idle-state";
+			arm,psci-suspend-param = <0x41000044>;
+			entry-latency-us = <2752>;
+			exit-latency-us = <3048>;
+			min-residency-us = <6118>;
+		};
+
+		cluster_sleep_1: cluster-sleep-1 {
+			compatible = "domain-idle-state";
+			arm,psci-suspend-param = <0x41001344>;
+			entry-latency-us = <3263>;
+			exit-latency-us = <4562>;
+			min-residency-us = <8467>;
+		};
+
+		cluster_sleep_2: cluster-sleep-2 {
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
+	camnoc_virt: interconnect-0 {
+		compatible = "qcom,qcs615-camnoc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	ipa_virt: interconnect-1 {
+		compatible = "qcom,qcs615-ipa-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mc_virt: interconnect-2 {
+		compatible = "qcom,qcs615-mc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+		};
+
+		cpu_pd7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_0
+					      &cluster_sleep_1
+					      &cluster_sleep_2>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smem_region: smem@86000000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x86000000 0x0 0x200000>;
+			no-map;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0 0x10 0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,qcs615-gcc";
+			reg = <0 0x00100000 0 0x1f0000>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qfprom: efuse@780000 {
+			compatible = "qcom,qcs615-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00780000 0x0 0x7000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
+		qupv3_id_0: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x008c0000 0x0 0x6000>;
+			ranges;
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			uart0: serial@880000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart0_tx>, <&qup_uart0_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&aggre1_noc MASTER_QUP_0 0
+						 &mc_virt SLAVE_EBI1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0
+						 &config_noc SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				status = "disabled";
+			};
+		};
+
+		config_noc: interconnect@1500000 {
+			reg = <0x0 0x01500000 0x0 0x5080>;
+			compatible = "qcom,qcs615-config-noc";
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1620000 {
+			reg = <0x0 0x01620000 0x0 0x1f300>;
+			compatible = "qcom,qcs615-system-noc";
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@1700000 {
+			reg = <0x0 0x01700000 0x0 0x3f200>;
+			compatible = "qcom,qcs615-aggre1-noc";
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@1740000 {
+			reg = <0x0 0x01740000 0x0 0x1c100>;
+			compatible = "qcom,qcs615-mmss-noc";
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: syscon@1fc0000 {
+			compatible = "qcom,qcs615-tcsr", "syscon";
+			reg = <0x0 0x01fc0000 0x0 0x30000>;
+		};
+
+		tlmm: pinctrl@3100000 {
+			compatible = "qcom,qcs615-tlmm";
+			reg = <0x0 0x03100000 0x0 0x300000>,
+			      <0x0 0x03500000 0x0 0x300000>,
+			      <0x0 0x03d00000 0x0 0x300000>;
+			reg-names = "east",
+				    "west",
+				    "south";
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&tlmm 0 0 123>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			wakeup-parent = <&pdc>;
+
+			qup_uart0_tx: qup-uart0-tx-state {
+				pins = "gpio16";
+				function = "qup0";
+			};
+
+			qup_uart0_rx: qup-uart0-rx-state {
+				pins = "gpio17";
+				function = "qup0";
+			};
+		};
+
+		dc_noc: interconnect@9160000 {
+			reg = <0x0 0x09160000 0x0 0x3200>;
+			compatible = "qcom,qcs615-dc-noc";
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@9680000 {
+			reg = <0x0 0x09680000 0x0 0x3e200>;
+			compatible = "qcom,qcs615-gem-noc";
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,qcs615-pdc", "qcom,pdc";
+			reg = <0x0 0x0b220000 0x0 0x30000>,
+			      <0x0 0x17c000f0 0x0 0x64>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
+			interrupt-parent = <&intc>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c3f0000 0x0 0x400>;
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
+		watchdog: watchdog@17c10000 {
+			compatible = "qcom,apss-wdt-qcs615", "qcom,kpss-wdt";
+			reg = <0x0 0x17c10000 0x0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
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
+
+		apps_rsc: rsc@18200000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+			      <0x0 0x18210000 0x0 0x10000>,
+			      <0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0",
+				    "drv-1",
+				    "drv-2";
+
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+			qcom,drv-id = <2>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,tcs-config = <ACTIVE_TCS    2>,
+					  <SLEEP_TCS     3>,
+					  <WAKE_TCS      3>,
+					  <CONTROL_TCS   1>;
+
+			label = "apps_rsc";
+			power-domains = <&cluster_pd>;
+
+			apps_bcm_voter: bcm-voter {
+				compatible = "qcom,bcm-voter";
+			};
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,qcs615-rpmh-clk";
+				clock-names = "xo";
+
+				#clock-cells = <1>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,qcs615-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp-0 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp-1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp-2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp-3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp-4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp-5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp-6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp-7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp-8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp-9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
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


