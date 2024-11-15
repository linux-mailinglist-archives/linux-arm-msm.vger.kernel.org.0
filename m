Return-Path: <linux-arm-msm+bounces-38100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A9D9CFA6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 23:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 366B6283F49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 22:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF001AAE1E;
	Fri, 15 Nov 2024 22:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oNPk34/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C251922F2;
	Fri, 15 Nov 2024 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731711127; cv=none; b=r73d2JyVJTohVLkj2+RsiAqeAvZUedsLrkIKUzGKwBTyET3prHHglVHYCcoUOCtjqFONlYAnHYa14S/v3uFdgUhDHj1Z7bRayf771gC+zlPUxY6whfOoM4T8tUn9PxRdmwkLow0zFqQZM93dskFra1SCuoCsbOVDxCdxTn9aoic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731711127; c=relaxed/simple;
	bh=UU5fPa1TBAZ6+2wdti1tYkR6HNbrQW4vBr7KTADoiCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBr3sarhZzrc7v6UgCam7fpPClSjC5NH9T6kLi5x5QfZlio1it/08l3Fr88tE6Z/ze4+4ByWA5t8PL5ud/HIqj3JEvedAw2FacVUfqCZr8PzEA8jnskWhk2qtd3yVTpLwmxyPWxWefM3JA1YI27vpembrwaKVUsDq7UPbkW71bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oNPk34/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFBTkIr002544;
	Fri, 15 Nov 2024 22:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=toq4QokUBBz
	f0TwajtgeaN4ByORpJ0XGLWGij3aneV4=; b=oNPk34/NiIXvzYUDWUep3jVwzuJ
	XlqgD4G9xP8e5P6aXBZU7ofOlsXSYFCGdsQS3hRQEaUWmWBpVAP5ikhVQmX3sdmj
	HlcCmW4PaCzzBBNn4HCGxFIYuEQi1NY1biQ/KvRSKJb4HWWHo+QmyzCx0DZkcunb
	lObd/EklBSEWqz1qmJidNjhWYW/VW15qqhTp/bdRncsmoROVKWpogBu+SnoDh35v
	8SSCadT9cqVjNqPF503zo0jSq2HQycgJAONa43DquFlRfscYHVY085zF3kwfFm3p
	1SGg9Hh1P20YV69mkTPXs6iKxYkguEnecvMZRD7g3UFn2e7eSgT+WneDutA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ww6du2v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:52:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFMpvmp020277;
	Fri, 15 Nov 2024 22:51:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tn65dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:51:58 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AFMpuif020251;
	Fri, 15 Nov 2024 22:51:58 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AFMpv4H020291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:51:58 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id E05285A9; Sat, 16 Nov 2024 04:21:55 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v2 5/5] arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3
Date: Sat, 16 Nov 2024 04:21:52 +0530
Message-ID: <20241115225152.3264396-6-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
References: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 8N6MnQPiSM8xNlcidqh3p2jqjPgbGPh_
X-Proofpoint-GUID: 8N6MnQPiSM8xNlcidqh3p2jqjPgbGPh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150192

Add device tree support for QCS9075 Ride & Ride-r3 boards.
QCS9075 Ride & Ride-r3 are similar to QCS9100 Ride and Ride-r3
boards but without safety monitoring feature of SAfety-IsLand
subsystem.

Difference between ride and ride-r3 is the ethernet phy.
Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.

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


