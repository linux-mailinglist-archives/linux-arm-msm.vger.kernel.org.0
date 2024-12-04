Return-Path: <linux-arm-msm+bounces-40415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4499E488B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 00:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BDE01880561
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3742066C2;
	Wed,  4 Dec 2024 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l+yIFwwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B681E202C2E;
	Wed,  4 Dec 2024 23:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354335; cv=none; b=ns86jnVqpMIPozAYh9bKHgu0adCv4dLjcNicOcxbhP07jvBV6setp9JWHmRgSI3o1jtfNms9gjVncZMvMzloqX+4t2hj8fX6kzEOs+zNQCvS9FpHNK8MThBt9ubjWlM7Og/cgm8U5mfKAaq9iThCwKPAbLu4MBS4bJmg3WDTN6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354335; c=relaxed/simple;
	bh=E8L3X6twDGQGZ9EwFxGElwgue/i1qsaV5h+RzZAugaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bmcKxrkDvMCG+D+xMCKuDsVpsoo8QgleVp6zPf38v3Jlfsh0RndCgAPN4BPJRr9Cw1un1qf6/Zb8iK9zJvK2dgoEmGTpfTS6AFDOldUgg+QH+8aTvVPyCBofe48E8wxf9hm1Ie17HzFW1u2jWlVAqfc6DStyJbt74IjSWkCaO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l+yIFwwO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4H4VjC031188;
	Wed, 4 Dec 2024 23:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wknoNktfChlEb6v/Cxq8LYojt8v9BnN6SIgmehT/3/o=; b=l+yIFwwObVVuGB8j
	ti4NaEOHqUaeP35Scsf4VVOeWTs6nIJ02g7IziRGYedcKac5PbOjVJWroB6WSFZS
	jTZvc3e4stMrWeKgsHuuNWIxWIsPDVBICycOqaxtVzzP0zjXecpX1HnKCG2pKAhg
	cM1ZoVdg/gG3HFOq7vsgNAWbPXAQEX97zdOm9JiCyCeVrPxL742iwCHZoullWvds
	UIjqT6SS1p4wt8xHlOHuc0hIjRIwUjG9blZnnepGq7vAXLkX4Ekcoo7Ocmqja6mB
	3usOhrRHx1fKO7wF6o//DA5gKnf+cHDX9z7fqEh5zQwzOWF3GFK5uckncsf6lnL7
	A5cWPg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90wqqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 23:18:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4NIgj9025911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 23:18:42 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 15:18:42 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 15:18:02 -0800
Subject: [PATCH v3 2/7] arm64: dts: qcom: Add PMD8028 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_dt-v3-2-4d5a8269950b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733354321; l=1994;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=E8L3X6twDGQGZ9EwFxGElwgue/i1qsaV5h+RzZAugaM=;
 b=e8MO4UdfoyInUmoov0GmdYnBXnVCuWndvmTWC/f/CvcB8trjIibSENOgD3vTSQein964SxXQo
 miIj0pT6eJRAu6cgSmdqxvK50DSHZ5mZsj8Vnbn+bbgCKy5f+nGXS8X
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PPK7DIkLImdQmQUZ7J3T3tEMYXPfsJY_
X-Proofpoint-GUID: PPK7DIkLImdQmQUZ7J3T3tEMYXPfsJY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=733 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040179

Add descriptions of PMD8028 PMIC used on SM8750 platforms.

Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/boot/dts/qcom/pmd8028.dtsi | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmd8028.dtsi b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..a00913e28a4ca94d04d8a195ae8a868e9dd2fea4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
@@ -0,0 +1,62 @@
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
+		pmd8028-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmd8028_temp_alarm>;
+
+			trips {
+				pmd8028_trip0: trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pmd8028_trip1: trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pmd8028_trip2: trip2 {
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
+	pmd8028: pmic@4 {
+		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmd8028_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmd8028_gpios: gpio@8800 {
+			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmd8028_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

-- 
2.46.1


