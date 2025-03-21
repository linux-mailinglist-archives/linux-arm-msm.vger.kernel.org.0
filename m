Return-Path: <linux-arm-msm+bounces-52176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBCA6BB29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFBD748378D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 12:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD3722ACC6;
	Fri, 21 Mar 2025 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G3WIerXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7880422A4EB;
	Fri, 21 Mar 2025 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742561413; cv=none; b=GmwdPj/quEGPLCJb6R6nqT2bnjAXPUi4uhv0uC/S9hrFNyklfZkIBgwkq5KtIxNuj4IC1+mQfRUL7KPkxdHBIJieUJ6yW16W9nQ3MHzEaIQkyvJkgPXMDB8lnfXDmEK5ieCfqF/qOY33krowlE/f/YUyYhyXXk31V2rVATI55aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742561413; c=relaxed/simple;
	bh=qZH3282QieBZWznwmdlXw14lTXzF3H90frj6mMvR9AE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cYeklFzp1ukVhQD3KySVgg+HzpfJCm7Wth/jEFkDBOWxQDxPZ+Xdvtjy6yrqcju/8xxbi7GQJhBo1dm6LQdj3/KdcIAbUioTuz9KX17cwsX3YfCOH69wGJq9aX0yC4A4QoBr98M3Q6AAYz8va/x4ibGsaJDeZLsPRrsiqehjk1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G3WIerXg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBEl000776;
	Fri, 21 Mar 2025 12:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dpZ9qhK7WzpiOKm9jRs8ELPhdub/AxuYTnw4bJ73VmI=; b=G3WIerXgaHdeYQDy
	N0bEXtXFqAEj6NhW1w4hyJVM8A93KAX9A/MhbcIJHbbR7uOB7HHPieNhZy4iqvnp
	ecUAMCUI9kz5vn+1UfoS1loYctE1OFRNm3UR8CcKtVkr0daFD5+NUouSNhufHYJo
	kGtiLnNCw/pFD50YsCiPR8mDYvytFX7P0Nioqr6eLmJ12Fmw8DV7nV31n3yBQ13I
	znokle0Cnw8VKhJyXHtd0GqjevjYMeQEecigJJ3C3D4cYyIl35UDfaRkxYk9w281
	okHN33RB1mkpL8ylXaELbvbcHLwgIM/Qwy/kaPKC8Cu6Sq3htxLnLgM0vd7vRL25
	f1Mz9g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4u9rpg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 12:50:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LCo85x016589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 12:50:08 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Mar 2025 05:50:04 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 21 Mar 2025 20:49:52 +0800
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250321-qcom_ipq5424_cmnpll-v1-1-3ea8e5262da4@quicinc.com>
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
In-Reply-To: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742561400; l=1947;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=qZH3282QieBZWznwmdlXw14lTXzF3H90frj6mMvR9AE=;
 b=NZUCRAjNnDTPldZl8UItgX/+jgRcrmrcm2ku44V1TdrdAtsITC5z7csqZlUn5X8/U6SThU31F
 h2WksWC0h60AzoCMwCIioT+HqE61LF1LA8miJD+5R3LVCoKAhm4kpip
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZfnG8EQIj0YooFGfCNmV1Y6Hj6Y7taAL
X-Authority-Analysis: v=2.4 cv=FYE3xI+6 c=1 sm=1 tr=0 ts=67dd6080 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=leb7mbaFTONhKzR9nrMA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZfnG8EQIj0YooFGfCNmV1Y6Hj6Y7taAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210094

The CMN PLL block in the IPQ5424 SoC takes 48 MHZ as the reference
input clock. The output clocks are the same as IPQ9574 SoC, except
for the clock rate of output clocks to PPE and NSS.

Also, add macros for clock rates that are applicable specifically
only for IPQ5424.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml        |  1 +
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h                   | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index f869b3739be8..bbaf896ae908 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq9574-cmn-pll
+      - qcom,ipq5424-cmn-pll
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
index 936e92b3b62c..e30d57001c38 100644
--- a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
+++ b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
@@ -19,4 +19,12 @@
 #define ETH1_50MHZ_CLK			7
 #define ETH2_50MHZ_CLK			8
 #define ETH_25MHZ_CLK			9
+
+/*
+ * The CMN PLL output clock rates that are specifically applicable for IPQ5424
+ * SoC. For IPQ5424, the other output clocks and their rates are same as IPQ9574.
+ */
+#define NSS_300MHZ_CLK			4
+#define PPE_375MHZ_CLK			5
+
 #endif

-- 
2.34.1


