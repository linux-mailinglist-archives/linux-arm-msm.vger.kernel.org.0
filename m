Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA24E7191C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 06:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjFAEVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 00:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjFAEVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 00:21:33 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B7C132;
        Wed, 31 May 2023 21:21:31 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3513NLsh016879;
        Thu, 1 Jun 2023 04:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=ZxUMWkiYU6cjz5PhfZnz13CUvFrMj/R9q+3PcYeSAjs=;
 b=K064C083xyRo12Gzg+xuOTlaHi4WuNwzeOVntmYoBRhGILuPDNz+525Wsx9wdZFGGM/L
 ZMi90dMxvm5so5uwMRYFy6hUzG+XgGFF4pwQsSBcxk0vu0fZWgTnNkeJHKvpFJV3QeM/
 LoiDeLJPO5eQxqi/2Hb4AhEc08HDue+PR68eX1+WlGrBsOfrcwL5ZDqPYes4cFGxzwSa
 FOQvV7BOgWOlT/5q1ndDeTcd/aPhUehdmsJ+cUuJYHsVEmkSOSQGUXOVojb856cvoFuy
 DmVhQpDMXEWRtr7R5hUlaKjGwS6YsIsF++dBCYJ7eDSpyOaG5qJDTgbZV/ZoTtGQ7B4x ZA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qwx8qaxxr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Jun 2023 04:21:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3514LQ63013834
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 1 Jun 2023 04:21:26 GMT
Received: from kathirav-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 31 May 2023 21:21:23 -0700
From:   Kathiravan T <quic_kathirav@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Kathiravan T <quic_kathirav@quicinc.com>
Subject: [PATCH RESEND 4/4] arm64: dts: qcom: ipq5332: add support for the RDP474 variant
Date:   Thu, 1 Jun 2023 09:50:54 +0530
Message-ID: <20230601042054.29075-5-quic_kathirav@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230601042054.29075-1-quic_kathirav@quicinc.com>
References: <20230601042054.29075-1-quic_kathirav@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9ntya9O8JPaGOdUgBz8VzkxOwIWEfv6R
X-Proofpoint-GUID: 9ntya9O8JPaGOdUgBz8VzkxOwIWEfv6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_02,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010036
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the initial device tree support for the Reference Design
Platform(RDP) 474 based on IPQ5332 family of SoC. This patch carries
the support for Console UART, eMMC, I2C and GPIO based buttons.

Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts | 112 ++++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4f9e81253e18..0f8c763a9bd9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-mi01.2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp474.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts
new file mode 100644
index 000000000000..085729a0fdf1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * IPQ5332 RDP474 board device tree source
+ *
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "ipq5332.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5332 MI01.9";
+	compatible = "qcom,ipq5332-ap-mi01.9", "qcom,ipq5332";
+
+	aliases {
+		serial0 = &blsp1_uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			debounce-interval = <60>;
+		};
+	};
+};
+
+&blsp1_uart0 {
+	pinctrl-0 = <&serial_0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&blsp1_i2c1 {
+	clock-frequency  = <400000>;
+	pinctrl-0 = <&i2c_1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhc {
+	bus-width = <4>;
+	max-frequency = <192000000>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	pinctrl-0 = <&sdc_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
+
+/* PINCTRL */
+
+&tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio35";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	i2c_1_pins: i2c-1-state {
+		pins = "gpio29", "gpio30";
+		function = "blsp1_i2c0";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	sdc_default_state: sdc-default-state {
+		clk-pins {
+			pins = "gpio13";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio12";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio8", "gpio9", "gpio10", "gpio11";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
-- 
2.17.1

