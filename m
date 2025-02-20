Return-Path: <linux-arm-msm+bounces-48593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C0A3D066
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F4713BB151
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EDC1E25EB;
	Thu, 20 Feb 2025 04:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FiKT/G0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661751E0E15;
	Thu, 20 Feb 2025 04:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740025399; cv=none; b=p0Ed756DLsPa81x/yy4BQpPyHi91KQsgq4pDUF+gnl+PyQ3XnDFxcBTY057dGNjaNiVFuwyJtgVxoC4RfnZ2YUSesshSlUPH38NBk+wcvOBt2EON9RgAIqfdPoC3sWcy2WjeR4ExrHqZFy3pheICedteTsAQbO4X5C9ZA5InZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740025399; c=relaxed/simple;
	bh=G9Mo6Wfz1iydjOzLDJ3j7Nn4nKadFM2hu04nU7c2fCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HCqJZzflwjKewLRulDQgU7ITyMUPynyDjlTOozdJey3mMJWQ9CqqL+J5UwmhzXb25oyV3UhB/GSr1XZbIwFuvCzmvR4OXN+gmaATl6PJ3DwfmEw2h/ENFyYu2QCVsuM+gCcdKr6cDK0jtJPhEz8MkRDZvNbACDkFYtTEfLovEOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FiKT/G0c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JLYLmq031470;
	Thu, 20 Feb 2025 04:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/bWcZhjHgUU6mvlypB6DOXerJ695y6ssLUCTWG+0dk=; b=FiKT/G0cnqRjDUK0
	gFlS7Vavt9bbd1DROdfgNA9EAlvZrud6FscpIJ/7DYMG2Ctac4dwwKHROd981WDv
	WqpKxk9qIPGCnvo5aYHjz02ef6WIFodePiJ3w1rzNWHmIt4oT0gcbqOkbGs+qsi9
	PX7bEMeunsb05uSov6SnzYv8BAQBnxbp0+/zhcqb06Z6AiOMiU8sqoaDEIS5k77u
	9JH/AvHGHRYtsf+pSj5s5XxhFKyfWa7/jIyLzdVJ7HF6+PUeG2L+Q5PM8aSNdphT
	RuXlz6tqoojghjivHQzccSiIfh51zl59XHv4NHpA+re41X+OKoEyJEgKf7EWQc0O
	JkDt+Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44we69jgwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K4NERo017137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:14 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 20:23:10 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 20 Feb 2025 09:52:50 +0530
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250220-lpass_qcm6490_resets-v4-1-68dbed85c485@quicinc.com>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F8sZGtpaL5oz4YxWY6iB_gdGZqBs9Fw0
X-Proofpoint-ORIG-GUID: F8sZGtpaL5oz4YxWY6iB_gdGZqBs9Fw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=956 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200027

Add the new QCM6490 compatible to support the reset functionality for
Low Power Audio subsystem.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index 488d63959424088ede67835eb4dcf3feef6d0848..64efb2c533d1e71a9bdc3bf0d245b00cec00841a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcm6490-lpassaudiocc
       - qcom,sc7280-lpassaoncc
       - qcom,sc7280-lpassaudiocc
       - qcom,sc7280-lpasscorecc
@@ -68,7 +69,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,sc7280-lpassaudiocc
+            enum:
+              - qcom,sc7280-lpassaudiocc
+              - qcom,qcm6490-lpassaudiocc
 
     then:
       properties:

-- 
2.48.1


