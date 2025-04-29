Return-Path: <linux-arm-msm+bounces-56014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA7EAA01FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2FE1B600FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 05:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AC4270EB8;
	Tue, 29 Apr 2025 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oKQF+1tL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177520C488;
	Tue, 29 Apr 2025 05:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745905760; cv=none; b=GPgk7RcslaWr7e4V/DuSZCTv2fyyd8EfzymxTUKXsOzBsDMU6nVXeu6wXjicFBPCCazO19h5sftEtFVm9X5drZVOM1XyWkNsNXCrvPHIj8lQ5INfeoIwp/iBoQspPB1k00ueht2RNcMaOl1SgWZZKKKhemypgJj+bzAVDaUSwB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745905760; c=relaxed/simple;
	bh=shSs3GrIhAh52LOXxB6T6NNrgfqY5gq6SHH9xWcHRHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgbyoeCWBzA1FeM9n3JP0j5FH/P74nQL+icBWHr0zb0H59Hc5nnoIIAKXgsBvBS35UAs9pWdqre4/l4OAp3hyZWeBOlw0SOHaP6OZvjT7Jr3TJ7PM8nHZKiJ0yLaIWuOQApy17hG2GmghjKaYp1SXyic7ku5vCrsNwltXkGL8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oKQF+1tL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqQQk001925;
	Tue, 29 Apr 2025 05:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=shSs3GrIhAh
	52LOXxB6T6NNrgfqY5gq6SHH9xWcHRHw=; b=oKQF+1tLNRnpCJfWDxQyrPl2oZ1
	bkhkVxHnvYju4vm4R3HS5KjgbJ7QcNLYrc1tNwj+O2wdVPEU0o/xzcoow41T0/dl
	wIS0Q2u+ifLNsJY4qxoYRaZFUHh9SzlmsBBkXJqKg7/V1YHkr1zyOJ2FxN8VipnL
	MylPnVQC9rCSkpvd+VlSijLP+JIb1KqY7RsK7pEt2qpNJL2YAx3BUNBS9qdTERXW
	EDl/Z6PtbzNtUTsX4eOQMoK1N3s9KiWZxY+U5gsdMfIcOFl3gcbO2eYExsYsHZGl
	IzBa2Ui0gUq1CtwEbc1Z51tQoUfDYoaBn7s/tZBlobznOpapw31j5GXPL1w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5jhbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T5nCht030270;
	Tue, 29 Apr 2025 05:49:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 468rjmfqup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:12 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T5nB72030236;
	Tue, 29 Apr 2025 05:49:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53T5nBBp030225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id A63625AF; Tue, 29 Apr 2025 11:19:10 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v6 3/4] arm64: dts: qcom: qcs9075: Introduce QCS9075M SOM
Date: Tue, 29 Apr 2025 11:19:03 +0530
Message-ID: <20250429054906.113317-4-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429054906.113317-1-quic_wasimn@quicinc.com>
References: <20250429054906.113317-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: P1uca9_zonl3PPFElk0jG6Ek6VjW8LU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0MiBTYWx0ZWRfX4Kq9feizszMs 84wMcC7/UevHujQ0sFI2OjPY5oh0nk3mqKKKjivoNe4ybEDBQtGU5wvhB/S8977qij40X33s8YI 3M5D1FZpmUsHf8al/CD8YnSW4jtlaWALqexfs/rLU9invWRQJ8VkUTL5bxyBOBF89x6JL/tLFhc
 LjlK+rx16/HXKYqHgrssYRIocqxeS+n3lmNDk8MlHn3d/VEgojX9y9BM8A8i0ThRCHK913uGnbN bYKYL4wc9NdzcZiKH4xIoNnQF1xvngAoAA+NI8bn2Cs83cXo/1t2JXsEHsUgbi59RPSZw+SdPIR iC1CnaoCAIlbT5yCdLaCI2+8D8zkDMkQ5kS+WkQBw1CuPRRi6UrEQvrPuLcYNaHp5Q+pbqi3EM0
 gRws8P19fbK2ZEq18iFaQJVDkDF97JGi/hpl/gUmdULI5gxiAuXREA4yJxcM9VL/9GvrzflU
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=6810685b cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=wRu9zdmjipw6Plw-N58A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: P1uca9_zonl3PPFElk0jG6Ek6VjW8LU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=782 lowpriorityscore=0 adultscore=3 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290042

QCS9075 is an IoT variant of SA8775P SOC, most notably without
safety monitoring feature of Safety Island(SAIL) subsystem.
qcs9075-som.dtsi specifies QCS9075 based SOM having SOC, PMICs,
Memory-map updates.
qcs9075-iq-9075-evk board is based on QCS9075M SOM.

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


