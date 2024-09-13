Return-Path: <linux-arm-msm+bounces-31708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A2977F08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 13:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F03CA1C20FEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 11:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E913B1DA610;
	Fri, 13 Sep 2024 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y2ux6kYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CE1DA311;
	Fri, 13 Sep 2024 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228570; cv=none; b=lZhB87ywQQ87FNs29OTvsXsmBuRJ7ut6p7wqOmcE7D9C2DARyWlqYDftp39DEng+Sr2I2vI7Kk+/HqnH558x4vIMr7z2wSsbzTau656OBeNlaPE/4J2V9GlS/awjTCU7RxVZPD49yfCv9e0jSGva2bmSsu1vHiUPQHDP+RMvXoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228570; c=relaxed/simple;
	bh=nte3vCyO91yQiFCJp0At0etrAjAwXd61SjQBynteXro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=F3hy4oEkTvsIilZiaHjGvSAFMlaE6EdApdZq7wjDbyMKDT93PKJA+DHkv/y2ynq1b73lKaayVG8QpEv4EWbtRBzZJJ0yazk86EuCX3X8mZsMslmTmPRB94rEwhzAILScVcfLB2f1dpkVX5U69dVnvw1cAdMkEl9L9+pUi7b5JX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y2ux6kYi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DANrIG018660;
	Fri, 13 Sep 2024 11:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9NCiuvcfmdV3o9Kd7r0g3oG8d5SphGFV12XoMf0qqE=; b=Y2ux6kYiMahjk0P+
	fcZtqIFVP/5w/Vs0lgP9spZywGXqn7+hCd3mAEjcZ1wKMRiNSZCnltrCPTYloNyf
	gbZ/leEykScLxl4bZTDoMpVljpXgsBn8vNp23aeeqJZwUeLeer81K2BDK/wRE2rL
	dHSnG6IK6LFqwwdRnRXK1DC31eL51Ozw9fSzB4a8Y8TCoz1nZcAD/uc89QJ6Bn8P
	UtUTqxzk+WWASTEpsZwBsuc9gKgauXCIah6MmskltWyErCrOwJnWqnEP3wexme4w
	XEYY0hJzC6XTdpOII92a1psXb7QILHL980mlwJkBpWaXoEHNh4WBqIuZHuAQ2zC3
	u5zE/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41j6gn4wds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DBttbi032369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:55 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 04:55:50 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 13 Sep 2024 19:55:27 +0800
Subject: [PATCH v2 5/6] arm64: dts: qcom: add initial support for QCS615
 DTSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240913-add_initial_support_for_qcs615-v2-5-9236223e7dab@quicinc.com>
References: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
In-Reply-To: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
To: <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Thomas
 Gleixner" <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726228536; l=13414;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=nte3vCyO91yQiFCJp0At0etrAjAwXd61SjQBynteXro=;
 b=W+xTtlKPWxmLYJFHKuBLKF1uziHuxqH07ibfqF/obtGo1v7nWQutRMhj0dUdEkVPz/SpIcJVI
 SYVNyUt5B/DA6gMP+eHmV6eE/1w1mRHbepLKTlljauwNmcAg22sTKJu
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: p4zfVwbI29vSm6N_NbH-CgmXQF-Dmcsp
X-Proofpoint-GUID: p4zfVwbI29vSm6N_NbH-CgmXQF-Dmcsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=639 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130083

Add initial DTSI for QCS615 SoC. It includes base description
of CPUs, interrupt-controller, cpu idle, tcsr, sram, qfprom, tlmm,
smem and watchdog on Qualcomm QCS615 platform.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 511 +++++++++++++++++++++++++++++++++++
 1 file changed, 511 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
new file mode 100644
index 000000000000..3db54be8f448
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -0,0 +1,511 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
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
+		qfprom: efuse@780000 {
+			compatible = "qcom,qcs615-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00780000 0x0 0x7000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
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
+			reg = <0x0 0x1fc0000 0x0 0x30000>;
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


