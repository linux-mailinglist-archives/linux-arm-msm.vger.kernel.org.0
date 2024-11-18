Return-Path: <linux-arm-msm+bounces-38180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 649199D0A2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 08:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00644B22665
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837A21922F9;
	Mon, 18 Nov 2024 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GFiwx76h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219B191F79;
	Mon, 18 Nov 2024 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731914365; cv=none; b=m1FWTg3tnyEJyt9N3x9cvhgkYueUMEcrDsm33LLgP7afFunNtxEyD98Q8/Yvbg9pJmHmLgSosVK0KCx/YRgf8F9k4lE6fyWpAvmO+fGnaNXRHYF+HZ1pmsvjusJL4KY24to5zropP+TKwPjiOE7olvokaccE/XWpizMgejdTfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731914365; c=relaxed/simple;
	bh=gLOTXMSVqBAJVToCBzQ4d1ktKmMFb132erf26LoT5go=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tA+MlTv0J2aubkqB7n9ToINi2n+NV9k4LHeTudXQI+uGtARA2xq7sOlATKD+bHFGfTmErRd153VKzv3t3gk/xCAO3RgOWtWQIZFbioW7AUJxYCRAdPEl30h7LMTkEz3T1XV4EqHxVG0qgsg81YwGK6JHpKwDHRVX6TIVQrRz8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GFiwx76h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RlKf004224;
	Mon, 18 Nov 2024 07:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1NBpInW4l5tc9ZOH+JZA2NRgCzDdpha/DW0TTMq/zo=; b=GFiwx76hIZyA9yMd
	dWtNkczsX9nhQI6048XuXDDfBtfwyd+2Ej4kEenfvppgaV6vD65jVTjmk4DS6hqL
	+B2IWR0iZAK3bjVS87SbEwFdwFDcE7DG3OKE8Yp79qptlCWdgXIxCSBY/PPyJnSC
	5cchCREx2AiAtoUMt1WjjO5smXaoW4JMWfpu/rmaot6xNBpcI8VckpHQWKYktkBt
	vKxyI1nSuZWYcuPDxO5m6dGOY/jwLrr2hJ4kLERliPoL9Wlo1LNTMlgXZ44NSnml
	/4waC659Z/eC/RqDp3+5W53VqhJC6gYPVBnBsCXUeCSLvcv86jboKtJ4PAsxbPWF
	m3/JIg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xm5g3pv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 07:19:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI7JKON029983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 07:19:20 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 23:19:16 -0800
From: YijieYang <quic_yijiyang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: dts: qcom: qcs8300-ride-r2: add new board file
Date: Mon, 18 Nov 2024 15:18:46 +0800
Message-ID: <20241118071846.2964333-6-quic_yijiyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118071846.2964333-1-quic_yijiyang@quicinc.com>
References: <20241118071846.2964333-1-quic_yijiyang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D3KMX6eLp-3rwznBv-96gFOe38Ikaa31
X-Proofpoint-ORIG-GUID: D3KMX6eLp-3rwznBv-96gFOe38Ikaa31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411180060

From: Yijie Yang <quic_yijiyang@quicinc.com>

Revision 2 of the qcs8300-ride board uses a different PHY for the two
ethernet ports and supports 2.5G speed. Create a new file for the board
reflecting the changes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile            |  1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts | 33 ++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b69be54829ea..65c69f30e0b5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -112,6 +112,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts
new file mode 100644
index 000000000000..e8bf4668b70e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride-r2.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "qcs8300-ride.dtsi"
+/ {
+	model = "Qualcomm Technologies, Inc. QCS8300 Ride Rev2";
+	compatible = "qcom,qcs8300-ride-r2", "qcom,qcs8300";
+	chassis-type = "embedded";
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+};
+
+&mdio {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgmii_phy0: phy@8 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x8>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 4 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+};
-- 
2.34.1


