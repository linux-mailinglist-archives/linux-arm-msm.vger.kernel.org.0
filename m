Return-Path: <linux-arm-msm+bounces-54030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB92BA85E0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769713B9B53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1170A221FA1;
	Fri, 11 Apr 2025 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IGR8ziGD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D62367DF;
	Fri, 11 Apr 2025 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376309; cv=none; b=ehX2cYj40UyrNHVBvd0Z8rxkQJzuuc9wW+14n5zBiIpLlZgWw0X3bYHKbm47Uu5EUjVwlS03Oc2NZseLXKn4ee5aqGg3NXocXQoXzCo6Bc+WOs9X1goPygH8LVCKBHneviDE2AFPmXibCURVDLzAl6pX4U5NK0SuPKjGAXHYwMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376309; c=relaxed/simple;
	bh=2gDRDdKSLXHYPkzxvZkYqqsqIWbX7O1U/JavSY5jIE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UAxNqrYZZBrh7qtHBydOhI4dYa1WvfvrwebQOYMR+puZadZYudVD3S8+iN7HcHCJTg48kCk3+QbIwW/uhsvk9zU8GgjkplgWI0BZbx7GsHkOnnKKYQ74njHhEN4nKjV5WaU+5Wb20r1mINl291MDl9dZnhRusX3iyf29/YuIKgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IGR8ziGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B614P9000337;
	Fri, 11 Apr 2025 12:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFkU6Yl9ThsQGQ+YR7FwBjuJZwbm3WJpjELJBvucM7c=; b=IGR8ziGDdZFSvCaw
	U0WOlpCk5vhJtvrjt6mrigMx2bZtVbK+2N2zpCYQPTjEQKeD6L7hMsw2HRY1RXPg
	z8AWZEhJG9tqNMbQup+29IjcdlqFs4E2XQ1fD1wXmh/nlzHUjc3zkM8f3J0AyjAc
	0cFKxhoQcc4xjdGM8RcBuooYml1nMiEQv9xmVntCxqAkVC2FUphTSBLcbtqV7QqH
	Ah4P/uuzKO/zTElHfyb9VOECTdINn1Bf7QWPDBuRVEEAD/PmCEqKQWkkpS+A9dPj
	Nm/TBqJiUH8TWCLFNqBnq6dR3UvN1eSk73lQsDmTrwE7L0phkRX8yJSlRB+X6/Z0
	81xbFg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkt7ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:58:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCwMJ5018095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:58:22 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:58:18 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 11 Apr 2025 20:58:10 +0800
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250411-qcom_ipq5424_cmnpll-v2-1-7252c192e078@quicinc.com>
References: <20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com>
In-Reply-To: <20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744376294; l=1993;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=2gDRDdKSLXHYPkzxvZkYqqsqIWbX7O1U/JavSY5jIE8=;
 b=3ArCi2IwyrnpvUB9tGE7TDmVs6YUc6AgMyCGbOJs8tBBwuXYOTMWxhX8MEsLcTZeKGFF/PbOU
 IhzUKTO+lE2DcpmRAk6ZOuC7ZA/50ub8/7RGSWKDLqwe0ZGN+HQkuXD
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4iPhaM4qW0Dc4NmRGsg4-Uv_N0gJ3X_U
X-Proofpoint-ORIG-GUID: 4iPhaM4qW0Dc4NmRGsg4-Uv_N0gJ3X_U
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f911ef cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=leb7mbaFTONhKzR9nrMA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110083

The CMN PLL block in the IPQ5424 SoC takes 48 MHZ as the reference
input clock. The output clocks are the same as IPQ9574 SoC, except
for the clock rate of output clocks to PPE and NSS.

Also, add the new header file to export the CMN PLL output clock
specifiers for IPQ5424 SoC.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h   | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index f869b3739be8..cb6e09f4247f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -24,6 +24,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,ipq5424-cmn-pll
       - qcom,ipq9574-cmn-pll
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h
new file mode 100644
index 000000000000..f643c2668c04
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5424_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5424_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ5424_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ5424. */
+#define IPQ5424_XO_24MHZ_CLK			1
+#define IPQ5424_SLEEP_32KHZ_CLK			2
+#define IPQ5424_PCS_31P25MHZ_CLK		3
+#define IPQ5424_NSS_300MHZ_CLK			4
+#define IPQ5424_PPE_375MHZ_CLK			5
+#define IPQ5424_ETH0_50MHZ_CLK			6
+#define IPQ5424_ETH1_50MHZ_CLK			7
+#define IPQ5424_ETH2_50MHZ_CLK			8
+#define IPQ5424_ETH_25MHZ_CLK			9
+#endif

-- 
2.34.1


