Return-Path: <linux-arm-msm+bounces-37425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA99C32EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 15:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 469121F21391
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 14:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6B6126BF9;
	Sun, 10 Nov 2024 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AxfRAUxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5A3F9CC;
	Sun, 10 Nov 2024 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731250432; cv=none; b=OkfJj5PJxhvNKaPney455HslGCJqNwRk/s9cAF0xeBdeDKGvdpvCOEnL0mr9gDUkyPkuopn+VgnwRuK5QNXfke8LYMomMp55LH4hK0S5DX7zGIDWOsgDn78UT7niXOh5FZ4Tri+4RrJEdBv1sgr/KHotZU6BjVaXaaZ2Xd3oq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731250432; c=relaxed/simple;
	bh=JW3VAwIWN98oOyaaTSFV4LLCBZ1LA2dwOs7i2bqcWoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jq4PIYfRtSvx+2tCF0OXV7e4tpQiQqYL8riG81IagVIGObHgx0NWGTO5IQceRP/s3YC5uN5swtVV1N4gZ3SBJ4vjikdhLYGgsT7HPjJxJrRg/KpOgZ4bu/goQZFLdk2grrgkYBV1eko8u+NrpsIhR4AVM5tbEVk6MXwPbHIrDzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AxfRAUxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AACkkrK024144;
	Sun, 10 Nov 2024 14:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n+g72/Tlo/S
	JJ86EA4DJ2HvrUw3FKcEopizmeoP2Le0=; b=AxfRAUxIknFmXneldeLpgDI4t8b
	UeBhO2gfB+swp6M8dQUG6gxbVEtu9iTfvnHaz6tSxFEWg9J0mNNCcMeJQsuzNmqp
	IHbyW3RfEavZg5Jjb1IWmtuP3oqIVSmkMXB5kdyVJ548+j/sJc1b1MkVBDU+EQ2A
	dCHwPXPWGoRLit44bTHfNw6sCsO1ZAc31akxjWx4dN2+yGXUH0xGJDpFPpKm5X3w
	EuuQihfx7ZeoRiXijRVQ+SRdQsBmDYFuucYDPFSaP7DdmyNdKDn4QcPzqMfE+6s0
	h9qsFqlXft7hOVw78p4BI6bxhtNmRG0hZPI71ujv9+sns7VEK41FjfsyDkQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t11824rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:48 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAErhEp019252;
	Sun, 10 Nov 2024 14:53:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42t0tkewhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:45 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AAEric7019267;
	Sun, 10 Nov 2024 14:53:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AAEri6P019266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:44 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 4A5035A4; Sun, 10 Nov 2024 20:23:42 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 5/5] arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3
Date: Sun, 10 Nov 2024 20:23:39 +0530
Message-ID: <20241110145339.3635437-6-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
References: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: id_fERmYmqatiwcfi34ZCsV50cFwA8zy
X-Proofpoint-GUID: id_fERmYmqatiwcfi34ZCsV50cFwA8zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411100133

Add device tree support for QCS9075 Ride & Ride-r3 boards.
QCS9075 Ride & Ride-r3 are similar to QCS9100 Ride and Ride-r3
boards but without safety monitoring feature of SAfety-IsLand
subsystem.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile            |  2 ++
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 12 ++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5d9847119f2e..91c811aca2ca 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -116,6 +116,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
new file mode 100644
index 000000000000..a04c8d1fa258
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "sa8775p-ride-r3.dts"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
+	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
new file mode 100644
index 000000000000..9ffab74fb1a8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "sa8775p-ride.dts"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
+	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
+};
--
2.47.0


