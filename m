Return-Path: <linux-arm-msm+bounces-29699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C0961BC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 04:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5319B2165C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF94C13D50A;
	Wed, 28 Aug 2024 02:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="astxU3k9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C4213B590;
	Wed, 28 Aug 2024 02:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810578; cv=none; b=t/sm6gGflmau9YpLbfb3xu6OWH5qcd9yNjubbnyfITkri9mvU6Gcv3gZqoQ02H/P/IlvYgUz0LH1EcxpNd0ygUqb3pJ0S8xANSXyUVtYK7YdU410OrKBAwlIhWXr4PT9U8Hks4iVT4byLTlXjPSyt4aUGfIZ8wabMqXraqpqi7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810578; c=relaxed/simple;
	bh=+BaQBnuuXWeLhLBMvLVXQ/PhL3c6ao0GdVg1uss35hY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RBYqAEJvgZvYE9/wQsSvLfsgE71fDGvveZOdIWLOv7LMvJHpd2ys19RfYfIypDcbNBk43gUjEL7QVOsENuFMtDCDB1TCj3v8ZAVcOvnGLqGGG0BBEkGZ8EyUdo5VDbg4lBkBPh3E55+g8eNnjVCR0h3dprKB9JeRV8+e78HEp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=astxU3k9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLZtIi007454;
	Wed, 28 Aug 2024 02:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bSaq/Qhl3rpvY90iItT2Ay2fmUtsprCRgXld614spV8=; b=astxU3k9ckrySTjd
	m5rIHzVjp2nDhIgmT0G0inhaWyCz2ySgrZhnFFBBhZb/lgk6foBhudWqK6zJdRMr
	VTtap6fp6ulR1WkupNqgprtbodZOvv1R6+zQC4fuf7MY/drxcCLEEjha6xtHxgek
	y6l8SM8wozkNGqvkTfidr5luRpSXU2uuxQ05meVNjIY3KcAHdgpVLBmqKH0kgHnp
	vKB3vpBW2O98z+RjEPN0X5TUgq8Od7zs3gd2s1+xGcXOBfwbmHd83A5qPlwC2xwJ
	bORibkfkT+U9rC9lUKXERUScVvic0EPtiHKNLj7nWveJseCLnnef75o8uu1tLKn4
	1lE9tA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puv8dd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S22qtD011820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 02:02:52 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 19:02:47 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 28 Aug 2024 10:02:16 +0800
Subject: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724810550; l=1531;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=+BaQBnuuXWeLhLBMvLVXQ/PhL3c6ao0GdVg1uss35hY=;
 b=wEMsLFN/MMuUA2oqNT2JWCDtwaDFdm4V+dwgxnww6y7O3ULwKFHB9gJP2laqy6umEZEavDUKt
 I74dhl4yoxJD9qz2T3IXaBC8clkgcUz0YkjoS+ErtAm9OYs46UhV0tE
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Sv-GZ52jHdqjgEMWyymRQc4VGdscXM8Z
X-Proofpoint-GUID: Sv-GZ52jHdqjgEMWyymRQc4VGdscXM8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280013

Add initial support for Qualcomm QCS615 RIDE board and enable
the QCS615 RIDE board to shell with dcc console.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 197ab325c0b9..c5503f189847 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -110,6 +110,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
new file mode 100644
index 000000000000..31d32ad951b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "qcs615.dtsi"
+/ {
+	model = "Qualcomm Technologies, Inc. QCS615 Ride";
+	compatible = "qcom,qcs615-ride", "qcom,qcs615";
+
+	chosen {
+		bootargs = "console=hvc0";
+	};
+};

-- 
2.46.0


