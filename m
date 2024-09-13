Return-Path: <linux-arm-msm+bounces-31706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25583977F01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 13:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56F441C24716
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 11:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1871DA0E8;
	Fri, 13 Sep 2024 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GbdmjrR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA591D88C9;
	Fri, 13 Sep 2024 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228566; cv=none; b=oVqfw2JrAMAHkcRFxePAP4QHUXI/Py77C6YaAA2TGc4uUKsuSQR5wrZK/pkFN4eFj1IVT389rLMK03rKC11uvExKvU+WzIyhmtMet1SBWoJw03Gs3FdNcN8cboQ9cg8OcpCe3yXQhlfEdKab+AMtweR5L9ejREKoUGAn+kVQAlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228566; c=relaxed/simple;
	bh=Yn9cD/hjcXr56ODGpiV5TBCjwDBZTNQTfCNxJnxFlO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oyBh0cRJYijV1HZJGxVrvrPf8PjaDs5hhtIVnIr9hzJxhHbHum2CKZ+jwUb7VYtuYR4MBQanFZ9PLIkQNnPNjwFJuLUbBi0S7BoZFG7FtFc1bxAQGWVVoAs8ox/jxVoYUwBGj/jWrmXvd4gsovfs60Sm6eIy26xWwYC1jlYKQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GbdmjrR/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DABODP018657;
	Fri, 13 Sep 2024 11:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PkyPssHjGzc3M1HbxF9LIc0u3PcHjb7E2ji5bSCuq6Y=; b=GbdmjrR/ikO6HAb/
	nLC8x/1N/Qicv0oHTXTesy9X6iZbQWIaweKYcPzpmL/Ch2QZRZdEThI5gXRIt0Kn
	PhPvZEH3gJebRJRIYFmLGhb8bLWROZZRew3ObLn5Bn795QsGXsPmHGA6OUdA94Ex
	kFj06QQQqh0qSCG3bvBuboLHtAj3O+jb9rAOAO6gR9sWGVmcSCCxf+6X6/Mk/b9z
	9FiWPkh0KEDJnGZDHj1FLI9M/Dd14TrRLSPK/vkJBCfdGvqjrmSP1Ql6tWu34ywE
	n5msbDOywoauD4HfvS8+MJfVmv6rOabZuetwgHJbwSi8VNTrQcEit1MFNOrOr/ag
	qXMIrA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41j6gn4wdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DBtnML010263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:49 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 04:55:44 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 13 Sep 2024 19:55:25 +0800
Subject: [PATCH v2 3/6] dt-bindings: qcom,pdc: document QCS615 Power Domain
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240913-add_initial_support_for_qcs615-v2-3-9236223e7dab@quicinc.com>
References: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
In-Reply-To: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
To: <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Thomas
 Gleixner" <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726228536; l=870;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=Yn9cD/hjcXr56ODGpiV5TBCjwDBZTNQTfCNxJnxFlO8=;
 b=jZR6G/Ze30JU3wqu6+aeDWRyseLgzLEcTDQmXBjdFPw4T4Tr1GBL6YuZ+HBz3fgf5HC40FXMf
 S3zjMQDP1V9DQf1Dst5+nPDG1+hhObOnzgf+QV6UwNOtVdMCffTbuhG
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JiSzu7azjOaQkMwA3ZonAP_G3iagERap
X-Proofpoint-GUID: JiSzu7azjOaQkMwA3ZonAP_G3iagERap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=689 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130083

Add a compatible for the Power Domain Controller on QCS615 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 985fa10abb99..5e234e845cb8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8775p-pdc
           - qcom,sc7180-pdc

-- 
2.46.0


