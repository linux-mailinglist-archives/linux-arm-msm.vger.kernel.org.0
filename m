Return-Path: <linux-arm-msm+bounces-67584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E8B193B3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE88C3B75B3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A138326D4DE;
	Sun,  3 Aug 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMqT/flL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AAA259CB6;
	Sun,  3 Aug 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218898; cv=none; b=bCTGfhc+8pFKzi124CyjELroCTu+XMLObu629ZOm2Jo+Rfe9bLW7W2d07Vh1AAKXnjgytmAat8S3RZP7at5dZEJ4rQhocvXKQh+GtXb7RAZWCmrjOLdPzOUyvkjy+D6I1/OJQkzk2OQPvZqgI/JzeVMW3H87t/sKHvZH8fGO+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218898; c=relaxed/simple;
	bh=KXtnzAu3QT57ciSOt152PVWbueZCUur8PEsiddg2z0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEA6jsKKiXVUftv0+w4zNkhKfQN1SPFuZR+XsrNmFzoscitcx9ibjXr2GfoZ8kftesM1vRNHyLHxctBEwo4mCZ4cYwkMhC20o5h6zH59DC8V3pOWxwfKECiB+AMajjyhkACvd2h2hOLQQirWPrgssuJ36vkFcYIK09sCkxH6R0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMqT/flL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5739PXlS007547;
	Sun, 3 Aug 2025 11:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFWvPcE9DhdtYmCXD3aKPE20S8We1cN3IpSOSaZW2X0=; b=bMqT/flLDBDUCNcJ
	CDbaMInoqoptlf9AsJ52v/K+7BavWTZdOQ+Muj/P9mTvPC2SjbCr2xcuPyvqh65a
	GQP6t/+Kvqaw+wfYUJmLOSUQn0vScXUte+CbvYzY4QZMdD7DeXMLF/mLQlle9sus
	NnZzgK7DHeRw3clN1vnjbgl20fMP0Rof7sliYb3edND65TAvqfZzdRLd4j6Iv5Z1
	J8uwqEFHVpGusEhYZXhX8FOPupDzCiHef3iJzOh7DpYhe9VppjvfKk95s7sj+LeJ
	m8L/OUQ35VYtbMBqjdRRC0X/A5rYFEeZYU25SA+1vAA8H4Bek8IcogFPZcJU6w1E
	uCnjfg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a91t7s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1KAu015314;
	Sun, 3 Aug 2025 11:01:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke04h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:21 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1LsK015336;
	Sun, 3 Aug 2025 11:01:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1K2W015330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 8D163ABE; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Rakesh Kota <quic_kotarake@quicinc.com>,
        Sayali Lokhande <quic_sayalil@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 8/8] arm64: dts: qcom: Add lemans evaluation kit (EVK) initial board support
Date: Sun,  3 Aug 2025 16:31:12 +0530
Message-ID: <20250803110113.401927-9-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9fNoRHNPXYIK_C73jDtDuzB8tCrlvKw_
X-Proofpoint-GUID: 9fNoRHNPXYIK_C73jDtDuzB8tCrlvKw_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfXy0nzRQr0WMKu
 hdiYfbddW4WiDEtsY1XZJOf/RvgtRDn6g2l9cPDIqQifh2dc4x5zYycj63zU6ggcUHubegeAX1U
 WBwMXdwkHLI7WlEjVNPDtZw8iTnfFkpu7wTFRUKN5ECHa0ASWlntiTuTotdiGRNsvaLZ1ZiNolS
 i51Eg0OBFclv2qSTy9Kf2ZivTf9pOatoUDAcX1mIfnUVmF8mQlpPUUrnMjZnbsiudTr8fW0+Yk+
 J4p3MbekuTs6bjH/FNVRI/YytK6Q1nIHYRLeBvic7ioCfi04UYH8LAoJA7QxTj4UZeyoGi3kGCR
 rRjlaYS2BSa7yYTYGeZFRiuXyLUSLnKQxE93N1nvS/BOFHvCetUauGqJMebjpRupQygTit99Npt
 +L84MTriC21yXc5VbuMf4FME5ktOioazzFGuCe3NWoN53MdpfR2yQtfps8w/9WBMmepqmAjN
X-Authority-Analysis: v=2.4 cv=UdpRSLSN c=1 sm=1 tr=0 ts=688f4184 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=SOkdykdnccwuzwQJ1m4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030073

Lemans EVK is an IoT board without safety monitoring feature of
Safety Island(SAIL) subsystem.

Lemans EVK is single board supporting these peripherals:
  - Storage: 2 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
    eMMC on mezzanine card
  - Audio/Video, Camera & Display ports
  - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
  - Sensors: IMU
  - PCIe ports
  - USB & UART ports

On top of lemans EVK board additional mezzanine boards can be stacked
in future.

Implement basic features like uart/ufs to enable 'boot to shell'.

Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
Co-developed-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 291 ++++++++++++++++++++++++
 2 files changed, 292 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4bfa926b6a08..dcc0f6382f51 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
new file mode 100644
index 000000000000..669ac52f4cf6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "lemans.dtsi"
+#include "lemans-pmics.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Lemans EVK";
+	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
+
+	aliases {
+		serial0 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1816000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1996000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c: ldo3 {
+			regulator-name = "vreg_l3c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c: ldo5 {
+			regulator-name = "vreg_l5c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_s4e: smps4 {
+			regulator-name = "vreg_s4e";
+			regulator-min-microvolt = <970000>;
+			regulator-max-microvolt = <1520000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7e: smps7 {
+			regulator-name = "vreg_s7e";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9e: smps9 {
+			regulator-name = "vreg_s9e";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6e: ldo6 {
+			regulator-name = "vreg_l6e";
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1450000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-name = "vreg_l8e";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&uart10 {
+	compatible = "qcom,geni-debug-uart";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
--
2.50.1


