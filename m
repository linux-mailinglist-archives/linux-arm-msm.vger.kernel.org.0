Return-Path: <linux-arm-msm+bounces-59693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6F2AC693D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 575DAA216F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB4F284B53;
	Wed, 28 May 2025 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X+mqThz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F146215F5C;
	Wed, 28 May 2025 12:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435284; cv=none; b=SRn9p5ZcbYj8uMyNcVnUgqtjvPMmQGX7ugOIR298qteZoxHvqPyBJZrFGHvKIBSHVEf3iDgxx15wyRsmc3BWz/3wX5xgKYDSRjaB0+JTUNfHmGkG6INwklHaqoSAIZZMtdjKJAnYDM8f0ri/s17dip8Rq0KdZE4aJ1Msn7Dt8Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435284; c=relaxed/simple;
	bh=SnpVa7I426a7+tDo9ZDH4Qa/C0XkGmiVoXDvxpI+gHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJcjHjJ+FweL11WNQhaWRdC/t3U5xnNQaV03K1tBRS3Jr8Kqg6uW0InElVchN59RBs9qqN6qrtHzwEgW6oid+XXcH/ohL/i2C3P4m5W9/+BPZAHlHROqSiSG5hVxqBNLUkvozW2aPoT0a6wOta2wASP+R5rkCNHw4sGthU4WtjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X+mqThz9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S748D2003397;
	Wed, 28 May 2025 12:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SnpVa7I426a
	7+tDo9ZDH4Qa/C0XkGmiVoXDvxpI+gHM=; b=X+mqThz9rBpSAf8GVFLRGMo3oTH
	7TUqGOe0Jk+GE3yMcShyuraD0WSne2KYzZtmUFZ3QHJ3vs/hMyLY9gcidj/BquRY
	JTXkp1kt2eLmqzDgFllkbXCo5z15Il5r+xLlnIEwHBy4mG6iKSGngU6xO9L3Q0vo
	JMKumHuuZVJFo7aagNt5A3xzzs5fF28TzlFhGNcVJw7uj5u7/jDhGLFP4YgWiYEG
	puVXEbFHgBRfUpw+NuCA6htZAJx0pGgV++VRBtd2fSCutSHyw3zIV9OMYs3pHxfv
	Z+GMMmCID273hMhus5UZU7/xJb+e0PTWJs3mqtLeHj6nICZtunHN+BIPsSw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkuy9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCRuPZ011486;
	Wed, 28 May 2025 12:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76mxk32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54SCRtuR011458;
	Wed, 28 May 2025 12:27:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54SCRthl011452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 12:27:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id E6C8A5B1; Wed, 28 May 2025 17:57:54 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v8 3/4] arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
Date: Wed, 28 May 2025 17:57:50 +0530
Message-ID: <20250528122753.3623570-4-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
References: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-GUID: mxKu9J0xPMMUWZDG8pceWzYhZTc5Ys_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNyBTYWx0ZWRfX4IweLMSWAHmk
 ca0fSD83JKLX4XeGLIhdflWtnI23l8XTbgl39RGA+ANaDeFE/Dqb8uozJonOdtt/3xMcg0S1C1Q
 TFelDOxiBP5TCgnCFMmWfLPAWB0W9zjrxPZDUJSiIkDdmgmGqsN+L2SXQUoDANjSGfxgNfm2HW6
 pKQUdf+ly9RdOvNvV+TiVOUdonPoumatUANGTtdzAZo22TNrSzMPASQALG9P6/GhKk+IhddoUSP
 TJTLcluBs3msRQKwUm+hEJ3+V/qKE1C7MjG5FOY8pcOeMYGnnwna1FbamCG7aggWuZ9VpxqkRrT
 knheOFExzu+8zsapq7pvNwNJI0RIDtm5g1sekV/zUu9AdNcQmtJ+zm3jPM5Fo5tyrPXimJwkpoR
 8/FrPF45NC0ILauenwoxnHdN1EXfO8HCBhJfk0Pc+/oK3qIqajXj3bMvyFcYo6MyqgvLMTls
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6837014f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=wRu9zdmjipw6Plw-N58A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mxKu9J0xPMMUWZDG8pceWzYhZTc5Ys_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=1 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=792 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280107

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


