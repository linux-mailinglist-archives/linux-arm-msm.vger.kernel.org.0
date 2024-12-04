Return-Path: <linux-arm-msm+bounces-40416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4779E488F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 00:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3B518804B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFA32066DE;
	Wed,  4 Dec 2024 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ndPb7IJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55527202C40;
	Wed,  4 Dec 2024 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354335; cv=none; b=lznTGV8v66MzXj/HTPFJWWPEMmqUkkrwy4PUWS1gIQoG7cvmw80zcFy3iF9WVofZRY7q0VlKKGmKnEgHC8oFSwuvdqpPk9mFTfMQyF6Rk9NN7XspTJAPPrMxmOv9DiFe+GHz15lNr1xwA6esZuCZSQKLcSJtSLY567yuUpFRcXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354335; c=relaxed/simple;
	bh=YLeDeAiI0PcoVi2sy2aLZ1KQ02CCrXz1X0y+SP8lzh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t5rttaxT+ETOY1NhiBIHA//6kMWswNo33p77lNGh/KOZf+lTOhyOPRz62SHlYqOjEs8T6K5Rcn/ME0PyW71tqdZddTUHuW3NEyWEYIioEBPpChq7GbN5j5hr2slHOOgUk3k4F7LI+tzVTU/KMr/ZG2QMRjyfK2HHQu/BB3xy9oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ndPb7IJe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4G9EP5031010;
	Wed, 4 Dec 2024 23:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9EKE+QByO4LToX4cyHqeYzzA4RFKP1+7OmMo0x78l4=; b=ndPb7IJeMBblJWcf
	TcS/iG69/Mps894HvW5eEESV9Ex5mWua8/FeDlurm+OCZAekXXX7fHVbKraO2yWw
	Zx/DKAwkN4bSQcP/vZjcHFRkC0vW572PEveHXze79jpbRR+lSKe9R7Vv8YMceU+S
	TweHSDbPZXOGkQr+Vo4UeIqaHQlSjUHdTSffRfzE+le98qdLA9VZt5NlJ9F65hiB
	fM+8WKX356ipfPuOXfl2A0UV9/rgiVUVifxXyufqB748rMqNxrTtMpCHXbQHmyb2
	tCf74tsMplA1Jpnf9rAdql6g/8rgc5nqOhjiWGBj86ytZ1+Cnk6QRXzz/cZe0ewT
	aAd/Nw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90wqqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 23:18:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4NIhPn003149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 23:18:43 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 15:18:42 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 15:18:03 -0800
Subject: [PATCH v3 3/7] arm64: dts: qcom: Add PMIH0108 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_dt-v3-3-4d5a8269950b@quicinc.com>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jishnu Prakash
	<quic_jprakash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733354321; l=2105;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=YLeDeAiI0PcoVi2sy2aLZ1KQ02CCrXz1X0y+SP8lzh0=;
 b=aGctJ3dXmZq7ql8TaGOuNmKKm1ZJEwV+gjTwcjG8Z///5VtIU8a4wG7q5KEofvWNhHZZjjtQn
 w317Z2HJHqSBDfQz9Ch7pEaJ40i8WYCikRd5E2u8ZMkysxwEoVnIJFQ
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: edhwYLD2U7FdYMyndBDSSwojdfGEoPj4
X-Proofpoint-GUID: edhwYLD2U7FdYMyndBDSSwojdfGEoPj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=733 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040179

Add descriptions of PMIH0108 PMIC used on SM8750 platforms.

Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..1c875995d8813900795b6d68e5528a6f88850fd4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmih0108-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmih0108_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmih0108: pmic@7 {
+		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmih0108_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmih0108_gpios: gpio@8800 {
+			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmih0108_gpios 0 0 18>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmih0108_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.46.1


