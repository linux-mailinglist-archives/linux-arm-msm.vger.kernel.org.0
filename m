Return-Path: <linux-arm-msm+bounces-59867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE2BAC8AC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F5B83B6E38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B4D2236F3;
	Fri, 30 May 2025 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D3CpsgoY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E4F21FF31;
	Fri, 30 May 2025 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597344; cv=none; b=siqIYs65ISxvv9mDlxMtqqEp/1Ca7Q5VwaYUCwOnJswM63ne0xjlpeUzRk9nNimvdzLnG5DyWqNHVnyhsEJzi+quy1w26xHD/MRXH/5MdRz7tmkE5SXhdgFawvCPOpB40cbCqGJU/5KqNPXuR27KZ45y5+IhY3wOmedIvgS8+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597344; c=relaxed/simple;
	bh=SnpVa7I426a7+tDo9ZDH4Qa/C0XkGmiVoXDvxpI+gHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQ62+uxlTwLL8mD2ZqKyBf0j6Hpwk6DX8G6omLopdfgapRfrHd+wCXk3+N1YyPbxOW4YI3yCebk/Coy8HbOfHQU+as/3Nx0KmxNx83Dqrwkixuzh5OPM1f7BCFlUPLTLe1kgXYUQBfwKIh/WcQycCu7vZ98BSfxB7lkL1pGPSMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D3CpsgoY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U1pvTe005156;
	Fri, 30 May 2025 09:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SnpVa7I426a
	7+tDo9ZDH4Qa/C0XkGmiVoXDvxpI+gHM=; b=D3CpsgoYL9PfEw8Yx+ofrasQU9m
	KNqHYsrbxq6dC1iurDoqrX6JwXROHKQKNCUULjD5YQG1ECMKZQnpLfnahYcWAEJQ
	fXIKf8QrSpV6a5udDqVQce4DuM8NfawV2GZwnv4y6f7+zWJjXvmaRcGhjlBnlkYB
	OKSjR0KLcdZiMVlualiHgGOwqar207st6l5B6IhgZQTYum08gJCmXOP39FkKC7mD
	S1tbj9EMqpXzRe1bUH4lsbvkO6rQB9yCkEawJoNdI6tF4ejYyuZ+o5rLHmcjHBgC
	/EALB68cDCKa+mwtnO5Un3wEvhNJUjsgtlWAjeYeYGuowrLTve+QYW0xD2Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek8b83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:57 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54U9SqMC008750;
	Fri, 30 May 2025 09:28:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76my9gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:52 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54U9SqQg008722;
	Fri, 30 May 2025 09:28:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54U9Sqc4008715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 09:28:52 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 324A85B1; Fri, 30 May 2025 14:58:51 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v9 3/4] arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
Date: Fri, 30 May 2025 14:58:46 +0530
Message-ID: <20250530092850.631831-4-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530092850.631831-1-quic_wasimn@quicinc.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68397a59 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=wRu9zdmjipw6Plw-N58A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HqP6n_lF_pMw2y1QK4t7xl6769bBOvgo
X-Proofpoint-GUID: HqP6n_lF_pMw2y1QK4t7xl6769bBOvgo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA4MSBTYWx0ZWRfX/fPxDbMF5ezt
 v0KlBeoNEic9DqMPNA2C6hq/lhO0+iSTBu4y9O5cMbx/YfYWceO1/6mFFvLw5JLANtps2MBwmVt
 qtMFRrv2wmkekik7SQ5MHlWo6il4Mx2be8Po/dPKTiV1R9OcxbLcC/25iuqJ5HJUt3CVTuUuX1e
 Jcb1bCRehCmdbJgmGsHMlFTUc/ysp0f9fhk8dK59HnOdqi1TaNRVHz2C4ygOUVZI9aswjNq/2ki
 BNN2l9lf0u4U+4DqVyceVYHDuyjhsLx3bssng2mSSYEmKuq02lDnI8Ajt6ARYReSGnBH7laNaec
 +XGzu4wVifht/FeG0i3gpnFVFYyTqFbTvJ3eyhyetbLTe9tSKdUu1pFF2KI6X6pF8diW1oLLMJK
 8x90hAVsvyvjU1NVZfcv8gs509kzgnCnZ7wtlgKQmbcijy/AhhdWIltuevucA1rXv6P5kIoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=1 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=788 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300081

QCS9075 is an IoT variant of SA8775P SOC, most notably without
safety monitoring feature of Safety Island(SAIL) subsystem.
Add qcs9075-som.dtsi to specifies QCS9075 based SOM having SOC,
PMICs, Memory-map updates.
Use this SOM for qcs9075-iq-9075-evk board.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
new file mode 100644
index 000000000000..552e40c95e06
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sa8775p.dtsi"
+#include "iq9-reserved-memory.dtsi"
+#include "sa8775p-pmics.dtsi"
--
2.49.0


