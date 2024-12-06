Return-Path: <linux-arm-msm+bounces-40709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 455359E6777
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 07:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB761285911
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 06:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BF41BC9F6;
	Fri,  6 Dec 2024 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UjdoRpnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9482428684;
	Fri,  6 Dec 2024 06:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733467939; cv=none; b=es6iTiM5/DLm0+Lckl1UkqIlJghVo6ujCIuRn9YqNpzOVUyygsE126U6PmXSYgiUGWey7Rl7cW4AbeNopNXP6WEAWg4pqNRiLaxReyOQCCulsmUwMzLl5WsnuA4ZQxz8yWrlGS9xFnRF0LpTi7S3P3nW9k6W3vH4mgl9eZoSpUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733467939; c=relaxed/simple;
	bh=pPDg0x/mGLw0KjhNSZjr45w5t3pXSD5Pfdd69atmvNM=;
	h=From:To:Subject:Date:Message-Id; b=OeEVpUvyDTbu6GIhgXB/DaodFMLv88PXntqwNsJBw9ZDf7EvSlfg1u5bCb7YCEne0J4SyEyO+F+sMs82+OOnm9WX00mbPExnLL2QzVF+GcTE5WiGCQpOw3cEeHkmDoASGFNlhE/x+utQFYeUNAzaR3to5m6kf6FgV/yRr2i3hfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UjdoRpnX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaL87006904;
	Fri, 6 Dec 2024 06:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:message-id:subject:to; s=qcppdkim1; bh=D2RWn+8XZ4y909E
	FN5ViiUolCq7qp1God4SlYK/xQ1I=; b=UjdoRpnXOPEp3eQi9W78lWGeho0m1Df
	NCgoYbAmYQ+lgN6OgOMHxVotI+3IRPFRycgDpC8vpDLESGH2DhEjVh7wUwugtQ5G
	MhYPFGhYm/wFAIJ1Id9ia92M4YSrlUcKAXQo1zQtYCQ8/uYXZuUobFzMcEOjCNgl
	RIesmh+L4qfWe3rOhUG0Ed3sYLoGYAP6qA8hOJq3n8R9cjDdNlVJTlxfGZHEh425
	KwW/Lh4DEvhM/2mMLZ/33701Z46Kh2rtezjzuUyurVjWXFZ9kBu1zteA00y5qmEH
	ytDasZrW/2tcS4Hbtejo2LA57od2LlYT6Awgk1d88tcXnEmka2iOG5A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben8a43t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 06:52:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B66pxFL004136;
	Fri, 6 Dec 2024 06:51:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 437usm8byh-1;
	Fri, 06 Dec 2024 06:51:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B66pxNA004130;
	Fri, 6 Dec 2024 06:51:59 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-chandna-hyd.qualcomm.com [10.147.242.90])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4B66px12004129;
	Fri, 06 Dec 2024 06:51:59 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2303763)
	id 6363E500F44; Fri,  6 Dec 2024 12:21:58 +0530 (+0530)
From: Sahil Chandna <quic_chandna@quicinc.com>
To: kernel@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_nkumarsi@quicinc.com, quic_akdwived@quicinc.com,
        quic_kkotecha@quicinc.com, quic_chandna@quicinc.com
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add industrial mezzanine
Date: Fri,  6 Dec 2024 12:21:56 +0530
Message-Id: <20241206065156.2573-1-quic_chandna@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cgkWU0IZdBITAI6amq1kEExpT_1Usf2r
X-Proofpoint-GUID: cgkWU0IZdBITAI6amq1kEExpT_1Usf2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060047
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The industrial mezzanine kit enhances the capabilities of QCS6490
rb3gen2 core kit. Add support for industrial mezzanine board.

Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 ++
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 44 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6ca8db4b8afe..6fe5a5ccd950 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -111,6 +111,9 @@ dtb-$(CONFIG_ARCH_QCOM)     += qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += qcs6490-rb3gen2.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
+
 dtb-$(CONFIG_ARCH_QCOM)        += qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
new file mode 100644
index 000000000000..74f2f782d166
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/*
+
+/dts-v1/;
+/plugin/;
+
+#include "pm7250b.dtsi"
+#include "sc7280.dtsi"
+
+&pm7250b_gpios {
+        gpio5_tpm_dig_out {
+                gpio5_dig_out_default: gpio5_dig_out_default {
+                        pins = "gpio5";
+                        function = "normal";
+                        power-source = <1>;
+                        output-high;
+                        input-disable;
+                        bias-pull-up;
+                        qcom,drive-strength = <3>;
+                };
+        };
+};
+
+&qupv3_id_1 {
+        status = "okay";
+};
+
+&spi11 {
+        status = "okay";
+
+        st33htpm0: st33htpm@0 {
+                compatible = "st,st33htpm-spi";
+                reg = <0>;
+                spi-max-frequency = <20000000>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                pinctrl-names = "default";
+                pinctrl-0 = <&gpio5_dig_out_default>;
+                status="okay";
+        };
+};
--
2.17.1

