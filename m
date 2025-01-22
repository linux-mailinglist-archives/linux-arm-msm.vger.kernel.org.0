Return-Path: <linux-arm-msm+bounces-45801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6DA18F7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF78016057E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945AD21128F;
	Wed, 22 Jan 2025 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B98Q3GTM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AB016BE3A;
	Wed, 22 Jan 2025 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540895; cv=none; b=IWHuLIbvnK5FXPR6a5kaDFy7XpEo0T4otQmJxJpchFPsUg/pIVIUzxgM566fLgzTdFNCZ+7xgWoajwUptCKddIkhHKuDV9OPk5DwvZi0zuSgvqA8kFHSZhpV6AChmLZsHkasJE9lYeufBY4NBQlCrmFo3Pd+xZD99MfUrqVZXHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540895; c=relaxed/simple;
	bh=4+4uZLHD6kNhJLuhB6neOeSmgmIQjvXBjGYBADEbMR8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LCX9ozmsEwFPQGYj0ZCNyNDUs2xxD53y5+FsocUZTN6oqfrODtmqyt5Q3u3+x/zO/pnjQOUBZZzO7uqALgBlvNkxgia77JXcCYiWWznXt2jrOWg5/vVub2G9TriSR0KINuq7DDtb1AmnGm8GJkh2WIGrCYNz8e7lQJQny3eZKLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B98Q3GTM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9Cdmf011076;
	Wed, 22 Jan 2025 10:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kPC3bLg7DLGY4q7UzKY3aj
	FKd1DNq/1qZHyavJM0vC8=; b=B98Q3GTMF2SakYI3avwch4yGgUHEMdxf+vl9Dp
	ymdIGPk3ZQ+e1hKu+fiZYaxCs3qw1KEJykdIj8TfemmFvBcEyVGX2J8F05cX8fnd
	4DLEDiHJGTRvL6orjAZKu4Ur1KLOztqhYVRyMAtbP93EQ6rSQo8N6SQlNXVQuqoU
	6ZL0/ONUkj7fQUTvzRPrdrADrIZbJJo7qUKqP842FfXH1jzNeaFOlj1nkWBqyvTM
	CSsdKNIJUZfwRXSOo43TZFpfd19eW25BSsZGZL3EimR4RHRN5Qru+EiLLwSqFElJ
	nO0xYqwdf+4dKBhprvTWRKT43DFM/A4yefWk96wTgESx+cfw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44awuh0563-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:14:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MAEn00025022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:14:49 GMT
Received: from hu-nkumarsi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 02:14:42 -0800
From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
To: <kernel@quicinc.com>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_akdwived@quicinc.com>, <quic_uchheda@quicinc.com>
CC: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Sahil Chandna
	<quic_chandna@quicinc.com>
Subject: [PATCH v3] arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2
Date: Wed, 22 Jan 2025 15:44:24 +0530
Message-ID: <20250122101424.1810844-1-quic_nkumarsi@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rv-3ILK6IKEDRQerkZ-EZ9dTJPF9W3iD
X-Proofpoint-ORIG-GUID: rv-3ILK6IKEDRQerkZ-EZ9dTJPF9W3iD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220074

Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine board.

Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

---
Changes in v3:
- Fixed tpm pinctrl node label.
- Addressed comments by Dmitry.
- Improved indentation/formatting.
- Link to V2: https://lore.kernel.org/all/20250102190155.2593453-1-quic_nkumarsi@quicinc.com/

Changes in V2:
- Addressed comment by Konrad.
- Validated dts bindings with dtb_checks suggested by Krzysztof.
- Improved indentation/formatting.
- Fixed bug encountered during testing.
- Added dtb entry in makefile.
- Link to V1: https://lore.kernel.org/all/20241206065156.2573-1-quic_chandna@quicinc.com/
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +++
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 35 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6ca8db4b8afe..16ac008c58d2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -111,6 +111,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-dtbs	:= qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
new file mode 100644
index 000000000000..1498f32bd069
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+*/
+
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/clock/qcom,gcc-sc7280.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+&pm7250b_gpios {
+	tpm_spi_reset: tpm-spi-reset-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <1>;
+		output-high;
+		input-disable;
+		bias-pull-up;
+		qcom,drive-strength = <3>;
+	};
+};
+
+&spi11 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	st33htpm0: tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tpm_spi_reset>;
+	};
+};
-- 
2.34.1


