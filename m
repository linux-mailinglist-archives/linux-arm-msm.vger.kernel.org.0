Return-Path: <linux-arm-msm+bounces-21514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8D8D8B21
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 22:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A074A1F22A72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 20:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F33613BAC8;
	Mon,  3 Jun 2024 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kxfeIhjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB9546436;
	Mon,  3 Jun 2024 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448376; cv=none; b=CGIdipVHeWdrEIz03nR8lKT4iOgzL0L6JcWgo1dZ4DhzaFbiIEXJvE+p1K9hq++YGQekQSnnN1LN1w9lTpXxHlR5Pyfv3R3Kymgp3Fs6CLuOyq8/medXmdpVOyzKtv/+CRjmLxYDEYnpvLfXH3A40v/eHAn+TBvRAfXuLv94PxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448376; c=relaxed/simple;
	bh=dYTrKjBSxIylp1XitDttym4Ns0n5/s3vjxUhVzi8CDs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/9jj6BvFnBVd8zt/sO3cHNb42KY76K1gnN8Aqi55fkVnWd3IqxUp4E42ldCqDNTUHSDmb6w1uMNjgvsaG46rQgD7ElFraTuDGOFCufuV5NGfGo00OC5ekvJnRV2t0NzbDNq3et4ROr1Aaf6j0+5wGo2Uo8Ww9oTy4MTVRJw1g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kxfeIhjl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453CBNev011445;
	Mon, 3 Jun 2024 20:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HBqijYYJMsxO2hiY1npxQzneZ9M8tMSU768W+1SI4N4=; b=kxfeIhjlcI8TRChv
	wvWkllDVy6PsAZ0+hadKlmmH6KYTRVl2xDiHFae444pAf+MjE0c6iM5FdsXlOVb1
	S/CbYqL57i3wa08jRtXi6KId/QhMMWA7WYLKCpTAtLCAoByXhkIUEz2cM/zJdkh6
	wfLZCWNwNepFg1Et7MFkwds7YBhGSMUKt6loZdHPIjZ6LN1twX3d+ZQxUEpdL6Ga
	CHya6SCk4OElXN30ukvkiMPS4MMQdx0fbhfwqX+ciHXh3nrvjN/ic26Y8hPT+qRF
	pJ3ukK63L9lyzJDX4N0WqwyvSunkiys/cn3IvUhOEcZqaG9Sg43ZMqV4eYZSUb91
	BF21JA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dmybr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 20:59:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453KxPTf018066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 20:59:25 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 13:59:20 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH V5 1/5] dt-bindings: mailbox: qcom: Add CPUCP mailbox controller bindings
Date: Tue, 4 Jun 2024 02:28:55 +0530
Message-ID: <20240603205859.2212225-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603205859.2212225-1-quic_sibis@quicinc.com>
References: <20240603205859.2212225-1-quic_sibis@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Qg3vcFpY0s1kxmoumtQNSo0RzVLLGjjq
X-Proofpoint-GUID: Qg3vcFpY0s1kxmoumtQNSo0RzVLLGjjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=962 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030169

Add devicetree binding for CPUSS Control Processor (CPUCP) mailbox
controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 .../bindings/mailbox/qcom,cpucp-mbox.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
new file mode 100644
index 000000000000..f7342d04beec
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/qcom,cpucp-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. CPUCP Mailbox Controller
+
+maintainers:
+  - Sibi Sankar <quic_sibis@quicinc.com>
+
+description:
+  The CPUSS Control Processor (CPUCP) mailbox controller enables communication
+  between AP and CPUCP by acting as a doorbell between them.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,x1e80100-cpucp-mbox
+
+  reg:
+    items:
+      - description: CPUCP rx register region
+      - description: CPUCP tx register region
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@17430000 {
+        compatible = "qcom,x1e80100-cpucp-mbox";
+        reg = <0x17430000 0x10000>, <0x18830000 0x10000>;
+        interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };
-- 
2.34.1


