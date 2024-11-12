Return-Path: <linux-arm-msm+bounces-37509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF59C4AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EFAC1F23967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A031F7079;
	Tue, 12 Nov 2024 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JOfpLShi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5C91F4268;
	Tue, 12 Nov 2024 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371307; cv=none; b=HmcFiLt4ZrKgA9qaPWojoKwXYvZLfuc/wnqNJXs5NGvBGgPVfhgWqzAJVereAmGHm6IJ7TT4hpZ/9hIy4lP92VYvvXfdIqGfyGb5tJ2mqcpQkg7MayKQ9dVmXolCZTWk5vSrC9tu96LRNSfgdA74UNMf+AR2sf8y0BrOzRa/100=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371307; c=relaxed/simple;
	bh=yIS6G6g2gH+rTIfNkWwlSsXc/++pCGTGWzASNSAsGG4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dmtJS2iRSdqUewtxPjurAe6r6oedK+ec0+H8m8jt/mmTDkfp05xRXO849HTrcn/21VbTOhjvhMmr0xnc/OieOP8up2kwdAvpOm29tz117nDVgARMXyhUz/bq7DJuqYyixqtrdpvf97maWLxbMvKneW4jzFZnJGQhXft5ldQ00lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JOfpLShi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABC3fWP010055;
	Tue, 12 Nov 2024 00:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cisWVpfKHu5I+L5p72W08Lqy0ag65O6lCSfkdFwO6g=; b=JOfpLShiauZ5oZjR
	GdUWd3E7ExpfSot3kdAsHcgXE8Dfjs0b6nmu9rvOfY87mNAA2u5qIe6pqdmM4VI7
	XFINesuRVS81/IpHeTAAiz5F/CZ1WQhYAKQYPBoCiyOfjCR/0i7K73fn9delnvOk
	R5qfxkI3boECBknOLGUvMrg73cP1iXJpz8+qWyvr5WdO4Li3s4lNyDcqXBz1i+ev
	cTTNR6QaTrHdVigjGYJRIP81zUhE9S50ZzP37dj4vRs2AJU3fylVMAo/5cgAKZlv
	v6Q4NCQ3+ejHCrGgZVwG208unN9NGUBsLkh5diWPngnSseMcW+ZOYV45BkFe05aC
	f+Fhlg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0465n3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0SKvW004025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:20 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:28:19 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
Subject: [PATCH v2 6/7] dt-bindings: clock: qcom: Document the SM8750 TCSR Clock Controller
Date: Mon, 11 Nov 2024 16:28:06 -0800
Message-ID: <20241112002807.2804021-7-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241112002807.2804021-1-quic_molvera@quicinc.com>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 41psvP1sTpKg-VhwwkVihd1dxhoOcXb1
X-Proofpoint-ORIG-GUID: 41psvP1sTpKg-VhwwkVihd1dxhoOcXb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120002

From: Taniya Das <quic_tdas@quicinc.com>

Add bindings documentation for the SM8750 Clock Controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml          |  2 ++
 include/dt-bindings/clock/qcom,sm8750-tcsr.h      | 15 +++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-tcsr.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 3b546deb514a..f3afbb25e868 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,6 +16,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
+  - include/dt-bindings/clock/qcom,sm8750-tcsr.h
 
 properties:
   compatible:
@@ -24,6 +25,7 @@ properties:
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
+          - qcom,sm8750-tcsr
           - qcom,x1e80100-tcsr
       - const: syscon
 
diff --git a/include/dt-bindings/clock/qcom,sm8750-tcsr.h b/include/dt-bindings/clock/qcom,sm8750-tcsr.h
new file mode 100644
index 000000000000..1c502ac7c7f4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8750_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN				0
+#define TCSR_UFS_CLKREF_EN				1
+#define TCSR_USB2_CLKREF_EN				2
+#define TCSR_USB3_CLKREF_EN				3
+
+#endif
-- 
2.46.1


