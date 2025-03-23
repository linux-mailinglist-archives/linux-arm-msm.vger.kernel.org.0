Return-Path: <linux-arm-msm+bounces-52255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBCA6CF35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Mar 2025 13:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 824E816C094
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Mar 2025 12:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC8B802;
	Sun, 23 Mar 2025 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eQ47Gk4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE161623;
	Sun, 23 Mar 2025 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742733246; cv=none; b=VQoPvTKQ8rOTjH37L6fPSnbsy3azyvdrj64B2GpFBiiC2yuCI+cgwuJAlyivot5fjOO1O2nxhqlhnAn55j1R+CsV3T3D+nNwtebdEIGZoR8xy5tGWZvNy4CcRtWu8aJFWbn2yvIUX3n5geFUF8kl9RUwsF/pxzGinNztg/IFwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742733246; c=relaxed/simple;
	bh=loay4Bp2+2OHJYqM7KRdnmJrNjgtWbQvqL9AEHGuZtI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eQuP091hlM7J/uIpKGjrygL3bBbENStAWoKj3jQvPe6fBGVbUd8bt7exZr4qiZTerYzStd7Ie3FalwCd9c+/EN4VEOJS+/MdZqJPl3jbAgDyM8n8w4VH13jZY5rHsPO7HeGwtTxVpiz55y+sQDjv5UAtsAErbFXFB3Cg6wwKjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eQ47Gk4F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N4QXw6028190;
	Sun, 23 Mar 2025 12:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s6aNyRs/Idm70xSkxkdtYE
	x6vdiW6K7s/uxxCnoMwxk=; b=eQ47Gk4F8nX0dcTs3wq/tNWR4CadwNbS4pilLV
	3PtAeELTpnSCoLtL9MmtAu3Epn6ykJkog7Onn5f5S9NW5OjUHViZNYi50smBfnlk
	7SZ7EdO09Alo7lBz9o+ndP/eHE0FRLeUe2mnx4lcvgilK8juQGACSMY3+8tpkRoE
	U2g6Gu0Ri+vc50Co1jjVozOGNyxBli0WjzHYNaf2Aq5A36KhrLWDtLa0srvYORYh
	1LsoqQ+Eqp1ourGaqOoncfjGetYuT8PZwGIph0pypxGVW1J78bjokEQDsKzY122B
	dkyjoqqIPUO9DzD/QSyTMi6WHGoilUcGz0xMYXgoAX5rkWug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnj7r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 12:34:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52NCXxK7015498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 12:33:59 GMT
Received: from hu-nkumarsi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Mar 2025 05:33:52 -0700
From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
To: <kernel@quicinc.com>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_nkumarsi@quicinc.com>, <quic_akdwived@quicinc.com>,
        <uchheda@qti.qualcomm.com>
CC: Sahil Chandna <quic_chandna@quicinc.com>
Subject: [PATCH v4] arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2
Date: Sun, 23 Mar 2025 18:03:33 +0530
Message-ID: <20250323123333.1622860-1-quic_nkumarsi@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67dfffb8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=BE7Z3Aw2EIX7jhhZxrUA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9Fk-tNgwPI03Mu1TZaFd7PV89bYkzMLD
X-Proofpoint-GUID: 9Fk-tNgwPI03Mu1TZaFd7PV89bYkzMLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_06,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503230092

Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine board.

Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

---
Changes in v4:
- Fixed the GPIO state setting using hardware rework instead of the
  pinctrl framework, based on Dmitry's comment.
- Link to V3: https://lore.kernel.org/all/20250122101424.1810844-1-quic_nkumarsi@quicinc.com/

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
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++++
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 21 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2abfb5..625b47d94416 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -116,6 +116,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-dtbs	:= qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
new file mode 100644
index 000000000000..619a42b5ef48
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -0,0 +1,21 @@
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
+&spi11 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	st33htpm0: tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
-- 
2.34.1


