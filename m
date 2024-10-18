Return-Path: <linux-arm-msm+bounces-34944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D639A3D02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F13DAB234D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F3A202654;
	Fri, 18 Oct 2024 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XjudXBJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2573C20264B;
	Fri, 18 Oct 2024 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249982; cv=none; b=NnpN67Ft5154xZElAu4jE9Qzwp+3EJxWr1fmJm1ijVbJMFgG1LvBnQJTaLkPGY00o72Uny0xORL/dy/AHyv3eOG+XnjB5UNrPWSsyqgHx/9i1iIGXC0p6+mtNEEkR3Ws8pSjpioiwbNJ7jCRIk715SaMBY7s+zEn4UZwr+OJ290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249982; c=relaxed/simple;
	bh=uqNOtesIW04uGOyCW6iXkgnnTz9JrM+OHzkEzndMQXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fjqzX7/YRK9Ltth7UiboYYMz7x65nlo+E5F4V3dvq6VF398KyNp/IobaIldV7d9IttkX/DSDbdrZTv1WCTGNAQfld9UJTWbqbNroopa5YXOtJQltPut19+hoYk69dmZfGM3/aFJa3T/i8MobMWGPHde7/0tiXMegvtqqmw6GR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XjudXBJk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I6cbhF007916;
	Fri, 18 Oct 2024 11:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yF0B+FN8QzLo8ECyxsyPXXPzSPeqHK7Z2tRhLVtcL5w=; b=XjudXBJkATWUfd+/
	WaBpEY0YqE9jqdCNtpKcPLh7QDrh2kE8r6sUIXyhRgy2gSUuZIe5+sPBhDIIfpDZ
	ExsKM9LYMJYhbB3JjZtgmMQQL1VMTTNEqshRBj3QkTq8bWfQ8o2bX0la6YotXvAj
	92GuVdIalSrLrF63wzulwK1TJdK5SsNmO9EPpZfWAWE4y2LjM4MiN97PAvTMfcsZ
	IDrIRT5W4Qct2jjTW8gwBCrcKWY8oy4jLhjdPSmH5Ch4ZaKLKhBe93OiAJXzm9C/
	IBrD09d9NuVFUg57PTF2daTYksHTCzqEYNvD9pChaVPzqZ5P5JnbesPFWqWxq/jR
	oEkZYw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hstyag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:12:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IBCuMG002960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:12:56 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 04:12:52 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Fri, 18 Oct 2024 16:42:29 +0530
Subject: [PATCH 1/6] dt-bindings: clock: qcom: Add GPU clocks for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241018-qcs8300-mm-patches-v1-1-859095e0776c@quicinc.com>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
In-Reply-To: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e2hl7VjkJIDV6xc1eV2zLpDnOkI_Z88C
X-Proofpoint-ORIG-GUID: e2hl7VjkJIDV6xc1eV2zLpDnOkI_Z88C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=834 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180071

Add support for qcom GPU clock controller bindings for QCS8300 platform.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml | 1 +
 include/dt-bindings/clock/qcom,sa8775p-gpucc.h          | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 0858fd635282..b2b8a1e0297f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -27,6 +27,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-gpucc
       - qcom,sdm845-gpucc
       - qcom,sa8775p-gpucc
       - qcom,sc7180-gpucc
diff --git a/include/dt-bindings/clock/qcom,sa8775p-gpucc.h b/include/dt-bindings/clock/qcom,sa8775p-gpucc.h
index a5fd784b1ea2..54eaaf1c4e52 100644
--- a/include/dt-bindings/clock/qcom,sa8775p-gpucc.h
+++ b/include/dt-bindings/clock/qcom,sa8775p-gpucc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2023, Linaro Limited
  */
 
@@ -31,6 +31,8 @@
 #define GPU_CC_MEMNOC_GFX_CLK			20
 #define GPU_CC_SLEEP_CLK			21
 #define GPU_CC_XO_CLK_SRC			22
+#define GPU_CC_CX_ACCU_SHIFT_CLK		23
+#define GPU_CC_GX_ACCU_SHIFT_CLK		24
 
 /* GPU_CC resets */
 #define GPUCC_GPU_CC_ACD_BCR			0

-- 
2.25.1


