Return-Path: <linux-arm-msm+bounces-67091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043CB15C8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 255BE5A418B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF1426D4F9;
	Wed, 30 Jul 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQLHayxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80AD25DB1A;
	Wed, 30 Jul 2025 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868609; cv=none; b=fbLRv1i3M9IIjB+3jdnCZ6QIMuchkxzxfmRgGuLhump3eEfF54ZelvUaUz+oxySME1m0Y2/ypCoxfWAX6XmhgFBfANlBSIdlWJoKqFNr++tf42sVZekVEOctJzoYhXzJT6dLVkE+w0TNqLdNw29p5iraNnIX68iDifSo+Ifag60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868609; c=relaxed/simple;
	bh=3LEyTrzFTxMFIabd2SmtMTJaVgRTXiMoCpeUw7sZfZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BLSdW/PhmdljbV0oI+Dt+bba/MHfLh4qN0AwD6mrRFZ2JTcyLkbPS0pljzckhrkHrfTuN1f27hiEKfe3Q51lin9FRHLld+/5L0qr/T48GToBlUGhcz8mZQfO0eZJf/ewBC3lP6nK33eq+jfcwb+e2lDQWVY+SiZPovOHpsNIU3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQLHayxp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U4vxDm015048;
	Wed, 30 Jul 2025 09:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkGvSIYaTQPMbIW+IZr/VThNStS26OGk66UC1ih+rpY=; b=dQLHayxplz69KFMe
	N79anzdnvG1o9ztee0aNzrVN2AT+j9SsXVdWsamPs4gOoklEXIZfbcXtqnCQks8+
	GaGTtqgcsEsjy9IPq6LtiHlFSnrDWFvRq8s8VjhEnLJmONTgVcRVFeUOxrA5iSlA
	KuO/tdovzPw876n3LvA4/gV9jpuxFxEtcsU5e+YjCyjx0hw2diCX1HTbYKY0tI01
	2LqCBXuSHe9THDDLQ7YBRDAqh9bEOkv7nG1YXVjn7GCVKuIsN0X4hjDTuJGGhQTo
	p9dnxvZhMysvuWYp26i5aOXZW5hOPr6qTNXQQcpp+ba3brtKZIpIXFh+JtIcIlqM
	8FfJ1A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xu6qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:43:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9hAIE005173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:43:10 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 02:43:04 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 30 Jul 2025 17:42:26 +0800
Subject: [PATCH v5 1/5] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250730-mdssdt_qcs8300-v5-1-bc8ea35bbed6@quicinc.com>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
In-Reply-To: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868577; l=1226;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=3LEyTrzFTxMFIabd2SmtMTJaVgRTXiMoCpeUw7sZfZw=;
 b=tzfwAguX3ww9vqHppB0uwtKwaO/Fc//iecppyRunjnhFaCmuj13EvlQCWhR/KHZYoFApO5EsR
 jt6BhOJzH9zDQZ19OG7k665b+/rJ8x/G0RelnK7Mm/SDtZv3lPIcntL
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6889e92f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=5ixSZjX4nqodb9qzXsEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: h1Bd5mP3l5UkMS-nqXjUMXJvb4BYtEkv
X-Proofpoint-GUID: h1Bd5mP3l5UkMS-nqXjUMXJvb4BYtEkv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2NyBTYWx0ZWRfX+Ge6M/MCwHiw
 qpzGanK2tXkFnkp+Nm7ZopVxntSiS1fDchYvdIMZUEe+UQBGTYs17zkNptTQ8BCZQgOnfqlx4DE
 7Lx78wXBbXCqT+FLlc5xNstXd48W3nNX6/jjlA+YxBFhRJuU156LWGW4rDIcpeLC8Zi5zZCrDia
 my547XYKP0D0kW+2bk3DT5H65JgmymcFhyAXQKBe0VXsrWyTH+gJ413PeTuolqEpU222Dtmrtk+
 ij4J17WhgrUctTtwtQbmjwsJydTEq44DxLA3UTq/Z3KGrUPUsAXYhyMQPsomufZ+t0LBHUXjwc1
 pGHsC29SqWK56QbfjHMINk0OX0sldGPOfulNQ0u/hkJBKsD+mMBR5Vqm4T8w0jgaoH59epXDSon
 Gm9ZSEoDgCFONRiQCrlAFDsEAnAvEy/g4WEsouKM9i/+qc5ytctpBaz+aMh2F98cUFGS4YnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300067

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1


