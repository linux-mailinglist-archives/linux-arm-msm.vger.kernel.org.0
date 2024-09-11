Return-Path: <linux-arm-msm+bounces-31495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C207297508C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81C8628F535
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5697918FDA7;
	Wed, 11 Sep 2024 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fA1zVzOy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D9418EFE6;
	Wed, 11 Sep 2024 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053088; cv=none; b=paiy03w7MW0OBqffU/HLo1tAn7vPO+IDjk84vZXy03blftgLGuLy6YysLSCEGbQzbxyGTWUEPwUa8kjwEuqH9RLyaj6b1UIW5hn0Hha16393ODAsni3thV0PVo1qS8QcPeC8VLhKgIwS7EgXetQ1yrC9vNYVUFKzJNiOWd6Vruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053088; c=relaxed/simple;
	bh=JK1WvNiY7DL8AAMtNymtv1neg43zl2y8wHzTwPvQAUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k+W7MH/RJbg7X9+mkz0dQXK4Ah7RH23WU3YQQPrfMEBOdfci7BsPIqD8kGqL+EmCkZqc3Chz/Vtn1qRZIyd+c9iuEN12i3UbEyezzcuTdH0Oomm2tjW3dKUaJ4/2erk2sKL3ZlTPX+FQyOv+WDKw8pcQldw9P4GaUrjegDYcrsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fA1zVzOy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B2GdHW025587;
	Wed, 11 Sep 2024 11:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJreH7JGsNzJZ5+krA0yVcXwj3n47aMOlQCLOlx2ZYY=; b=fA1zVzOyLT80L/uC
	Ll3ZblHAo3fh1XAQL1AbgDd+9+6t5Qes65pw9jW3kdJCdLDdyshhb+4bMpKXkzgj
	yFCx9GHBsWQa4B1vblF2Ek8VBFEHgFR7hPlJBmOOOr46hnZciw4Lat3r/+CuqWCL
	fLC00XbBl9juljGVdQhXCCh2b7BZfsRV9bT4EwsIDDCtky/YQm9mNS/DEW2M/hEF
	a0xg56uyEkBNsXUJElE0k0mhkS3Wz5ezdQJNhPSKCbWtA2iYIMUKTBoTgmQ5a9Y6
	g0b/HmjuRzRNGYuKdfHh7t9vseL8RV2TcHCciYi0k/AbltQgt1QSzdi2yLVV5Haf
	v+fGJw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy731d7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48BBBMtu008845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:22 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 04:11:17 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Wed, 11 Sep 2024 19:10:58 +0800
Subject: [PATCH v2 4/4] arm64: dts: qcom: qcs9100: Add support for the
 QCS9100 Ride and Ride Rev3 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com>
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
In-Reply-To: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726053066; l=2345;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=JK1WvNiY7DL8AAMtNymtv1neg43zl2y8wHzTwPvQAUE=;
 b=7oi59Q3VOAkExT6FBhhQJa4nW5uEUzlFuT/Gx8TSIPrrUbU2ap9SFXc0bSzQJnPhTK42aOnCD
 K3Cv8v4+cXDB9mGn/wqaHt1yLm188fW6f2k84L0W7hQTcEiOjyTXLVz
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BWY9rMArAovk0aJnbvv6tDaK_P44fEqE
X-Proofpoint-GUID: BWY9rMArAovk0aJnbvv6tDaK_P44fEqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=838 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110083

Add device tree support for the QCS9100 Ride and Ride Rev3 boards. The
QCS9100 is a variant of the SA8775p, and they are fully compatible with
each other. The QCS9100 Ride/Ride Rev3 board is essentially the same as
the SA8775p Ride/Ride Rev3 board, with the QCS9100 SoC mounted instead
of the SA8775p.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile            |  2 ++
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 11 +++++++++++
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts    | 11 +++++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ae002c7cf126..b3c369305731 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -112,6 +112,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
new file mode 100644
index 000000000000..759d1ec694b2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "sa8775p-ride-r3.dts"
+/ {
+	model = "Qualcomm QCS9100 Ride Rev3";
+	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
new file mode 100644
index 000000000000..979462dfec30
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "sa8775p-ride.dts"
+/ {
+	model = "Qualcomm QCS9100 Ride";
+	compatible = "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";
+};

-- 
2.25.1


