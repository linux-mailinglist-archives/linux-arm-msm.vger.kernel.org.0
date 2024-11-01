Return-Path: <linux-arm-msm+bounces-36722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 378679B8F97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 11:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B94BB236D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 10:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273ED1AA7A3;
	Fri,  1 Nov 2024 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iCXJ29rc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4471AA78D;
	Fri,  1 Nov 2024 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730457595; cv=none; b=KJtKzWlc1yyLDGWbsdt2oOVT+LVp1ORkqoilnzHYmAq5yzIwCm/loI2TyAwRqxQSQtWs2ZEkWRenydP8fhrujgxcb1ciw5BKgW7eJWTE+6wmLVY8SqWdiSO21VUXflxopOU4+hP9zaqByBhc+KngTZvzeef7KzgM+Ny7+2Dccns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730457595; c=relaxed/simple;
	bh=q9hoVRImFMbgxE4HcTk/Vpj77eH7hY781HwIhE7HAv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=h4MSAEDKUMC7/xzHot+px3KS2V12xPbq0nySHQpsUZ48Sj422OoWD9BGZNak7n9w3oP44d0wPz3xVvozObYuJ+EkgMfat77K2+aBQjg+6M77ldt4PmETOkXZd8iiqi/fcpm3lT1qyFuoHOYoVXdgTxBs6aZv4+0dip9frytd+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iCXJ29rc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A14cHOJ020853;
	Fri, 1 Nov 2024 10:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9OGsaPPQIZ4mVWrMSoWVbICdS/QGG7nJlTXLwpwBVk=; b=iCXJ29rc04dgW1kp
	A+gefoNoV9S31G3g75LcKqxDfjog1X4nUxuwmiQCYekDssrzXperdrJwV+uf1TlD
	Pzlg4JrqPlW6bG9PEd/LdIhRZBrJRSQc2pnWtcpaksCxPa2rETXCkXlOmgUbbvNk
	hqkUScU3E+8/xgEzbEc5AY1zz0h2gLs+11Hg9L6XIRIkW4gmBsNzcFmzTzIS/o4e
	yAmskzGfq2SY3T5rUlMZt6oWUtx48f9O3aivZ5P94oWOC/E+O74w1eq0UPMunZCf
	YjhnzgYo0/Wf+3lYffJpEd+Wl32CV/gloOMf7iAPKVnBnSEtuinWqXtZwemLoxJs
	BShBvg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m1rpmqe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 10:39:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1AdJTZ027070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 10:39:19 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 1 Nov 2024 03:39:14 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 1 Nov 2024 16:08:21 +0530
Subject: [PATCH v2 09/11] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241101-qcs615-mm-clockcontroller-v2-9-d1a4870a4aed@quicinc.com>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ArbJCj8uOY0Jq_UF8hosE7js88YfAEEY
X-Proofpoint-ORIG-GUID: ArbJCj8uOY0Jq_UF8hosE7js88YfAEEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010076

Add DT bindings for the Video clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-videocc.yaml        | 64 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3359fb68124341d9673eb860a51d09a60459745d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm video clock control module provides clocks, resets and power
+  domains on QCS615 Qualcomm SoCs.
+
+  See also: include/dt-bindings/clock/qcom,qcs615-videocc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-videocc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+
+    clock-controller@ab00000 {
+      compatible = "qcom,qcs615-videocc";
+      reg = <0xab00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>;
+
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-videocc.h b/include/dt-bindings/clock/qcom,qcs615-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0ca3efb21103d7e0b09ab9c042be761bcbc5960d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-videocc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_QCS615_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_SLEEP_CLK					0
+#define VIDEO_CC_SLEEP_CLK_SRC					1
+#define VIDEO_CC_VCODEC0_AXI_CLK				2
+#define VIDEO_CC_VCODEC0_CORE_CLK				3
+#define VIDEO_CC_VENUS_AHB_CLK					4
+#define VIDEO_CC_VENUS_CLK_SRC					5
+#define VIDEO_CC_VENUS_CTL_AXI_CLK				6
+#define VIDEO_CC_VENUS_CTL_CORE_CLK				7
+#define VIDEO_CC_XO_CLK						8
+#define VIDEO_PLL0						9
+
+/* VIDEO_CC power domains */
+#define VCODEC0_GDSC						0
+#define VENUS_GDSC						1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_VCODEC0_BCR					1
+#define VIDEO_CC_VENUS_BCR					2
+
+#endif

-- 
2.45.2


