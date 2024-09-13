Return-Path: <linux-arm-msm+bounces-31705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D1977EFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 13:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12A82814F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 11:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8048B1D9350;
	Fri, 13 Sep 2024 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pgtK/a3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0436D1D88AA;
	Fri, 13 Sep 2024 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228566; cv=none; b=fw44lmDTG1FV9ACTWd4Iilk577U+zIytF0b9dpqSU9tp1BN4TGbXWTLF0uAxS/dYa56TS+SEDrSADq0GW/uVj3gKTAQ0NfV26qEX2khyBWw4DhMgLSNqEbBPkoOHwGiU8a1PWxxagWRQZmb2ZM/dIJs/bpV0MhLaFr4i+9js4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228566; c=relaxed/simple;
	bh=SWUPv2yT9vFS1HF8hRCvwlmEe4NDPJrRcVUDDOhbUmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jisC/b7L5b0q08Kw4WsduX5pzMCw+X7lXCn+ZBi6fB+iTWIkiM0yqdFHuzYg4GyzFCy3Y4nFDD3MmqoWWgxhF8EzT0lu0q5WBD0JudLFytcN2Sk3qjOJWS5ZEb7MlP46soC2RFXjopYmJpTUPrGOGGY7cjVTCS/oKDp3moQ1q6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pgtK/a3C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAVw33008434;
	Fri, 13 Sep 2024 11:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMYU44qOA/0KMilXTlkfwD0/Wursf8pVE12AIec0iDA=; b=pgtK/a3CaZL7OqZF
	XD1S7M2oBeea/rNskyaExmFw8MOM4wHcGPyl76oZ+CPYcddbytUvjhT149pi+UJa
	wgmH0GLploqyAjP5CZTKqZPgBcG5YR+yTZ6h6inTvoBKfTmhDnKmxaAeUswJH3Iy
	oQczWIuHEIYOHYEO1NuF8kTOTLSl6g3vC8qQqnawIDDjz1EJSMR0/yQJXzujVp+Z
	odzooi5Ug8UnJJv2qvv3DO6k/wC0se2rcSVpWkxNhniN3GSvbc2JEibTzqTA6+2e
	IGoPqQi6gwyRioXh2I7MfTjzVFvTyHigai42x67LeHdObGY+067AX68x0pj/M92y
	dW2qzg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy738rm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DBtiih007499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:44 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 04:55:39 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 13 Sep 2024 19:55:23 +0800
Subject: [PATCH v2 1/6] dt-bindings: arm: qcom: document QCS615 and the
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240913-add_initial_support_for_qcs615-v2-1-9236223e7dab@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726228536; l=1010;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=SWUPv2yT9vFS1HF8hRCvwlmEe4NDPJrRcVUDDOhbUmo=;
 b=Hn89hQogkaUD6Aocs6Z9vk4FOvf6ITQ1fDm0kp/nNY94xsr3KzNVkGb60luDRWnPakMgGXQnh
 J6IaVoY03dyAx+jVTNr7SPnsoKGdEloKHlJY5qA1v1izHfjZIUqTYyj
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EQ--BBACMZz6Ck71w49MSzGsgKnnX6GZ
X-Proofpoint-GUID: EQ--BBACMZz6Ck71w49MSzGsgKnnX6GZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=866 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409130083

Document the QCS615 SoC and its reference board QCS615 RIDE.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..a0c9e7179ce9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         msm8996
         msm8998
         qcs404
+        qcs615
         qcs8550
         qcm2290
         qcm6490
@@ -895,6 +896,11 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs615-ride
+          - const: qcom,qcs615
+
       - items:
           - enum:
               - qcom,sa8155p-adp

-- 
2.46.0


