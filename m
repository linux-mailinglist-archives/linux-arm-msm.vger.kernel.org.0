Return-Path: <linux-arm-msm+bounces-43803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E698D9FFF3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 20:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0CDD163D33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 19:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07F11BD027;
	Thu,  2 Jan 2025 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YHUA/gIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F11BD517;
	Thu,  2 Jan 2025 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735844546; cv=none; b=Z81XsYeGuVSc5iBNp2bMXahIx84wGVossVkT4SyB78+5dP+dHIHy7VkiEUPdpAh2wud9mHUOO7Y9ldLoblR+V+mcg2ziH5fVte8Vghqpe9qQX0l58AhPLcmlkMhrg8qARqxULC3vFj0fOvL7MHzt/O5PgDDQq2ezba3TTBcZ0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735844546; c=relaxed/simple;
	bh=OhEnDSSyulNqHZSxTrQD9y3jt1ZYhq8CMt4ERfa/Ae8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L1MTTjkRY76ETA8YMK/MdQ72EaYHp/biquE+roK++GIiWii9/6hrw8RxwOu0Zrs09m/UZk3p680GKtL1GbMNEH4KFMd6HkMInpQU2/fp4OmrlTqC0CjupNWiwTBG0A5hQTlxyy2tTGQUdkw8xXGXcR7RL7eaV7CWALqJeRscBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YHUA/gIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1GPC031931;
	Thu, 2 Jan 2025 19:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hc0piVwEhcCNfNlkq3FV9s
	hlR7KHn4qeQhdVtEg4ZEI=; b=YHUA/gIl7rvpzJL6mlsA15k6/AEkCpOomh8Dws
	pJKOK9j1uY609ZLTUHknS2skfrNia6viPnNW3ID9fnOuRBBbYlZ94pEOV/UzO+3I
	Ga4D0Vr5RkYleKPx+tC5lHIfXHjxQbCHKKyzUZdyDD3xT2CFwuzvV+bY4X4S8rrf
	W5PqCkLzTny6f/yP44JjpOAjQHclTNdZ5CZNHDyAsOgWMtb2uk1HJdXJWXI1qtPe
	90EdKMuHUMy+oZvNtQc2zwWPIy4TzR/YPeRAaj8kCumtxQvwpArFc6zH0wk5g1cO
	iAanGnWoAJ4v+zyN7NN06NbcvqnFipiaAGtoHaFQjVAYIS7g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wpy2s9fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 19:02:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 502J2K1U007906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 19:02:20 GMT
Received: from hu-nkumarsi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 11:02:14 -0800
From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
To: <kernel@quicinc.com>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_nkumarsi@quicinc.com>, <quic_akdwived@quicinc.com>
CC: Sahil Chandna <quic_chandna@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add industrial mezzanine
Date: Fri, 3 Jan 2025 00:31:55 +0530
Message-ID: <20250102190155.2593453-1-quic_nkumarsi@quicinc.com>
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
X-Proofpoint-ORIG-GUID: p54bFv6wOjep82816nuLdOfeB7Fi12CQ
X-Proofpoint-GUID: p54bFv6wOjep82816nuLdOfeB7Fi12CQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020167

From: Sahil Chandna <quic_chandna@quicinc.com>

Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine
board which uses QCS6490 SoC. This board enhances the capabilities of
QCS6490 rb3gen2 core kit.

Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

---
Changes in V2:
- Addressed comment by Konrad.
- Validated dts bindings with dtb_checks suggested by Krzysztof.
- Improved indentation/formatting.
- Fixed bug encountered during testing.
- Added dtb entry in makefile.
- Link to V1: https://lore.kernel.org/all/20241206065156.2573-1-quic_chandna@quicinc.com/

---
---
 arch/arm64/boot/dts/qcom/Makefile             |  5 +++
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 34 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6ca8db4b8afe..7c61e9e330d7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -111,6 +111,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM) += qcs6490-rb3gen2-industrial-mezzanine.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
new file mode 100644
index 000000000000..7a067e8dc622
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+*/
+
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/clock/qcom,gcc-sc7280.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+pm7250b-gpios {
+                pins = "gpio5";
+                function = "normal";
+                power-source = <1>;
+                output-high;
+                input-disable;
+                bias-pull-up;
+                qcom,drive-strength = <3>;
+        };
+};
+
+&spi11 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+        status = "okay";
+
+        st33htpm0: tpm@0 {
+		compatible = "st,st33htpm-spi","tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+
+        };
+};
-- 
2.34.1


