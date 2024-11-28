Return-Path: <linux-arm-msm+bounces-39389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B90109DB402
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39CC9B2104D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 08:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1876149DF7;
	Thu, 28 Nov 2024 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DbYYrkDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555A14E2CD;
	Thu, 28 Nov 2024 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783517; cv=none; b=XGCNkQnAvm8DVB/xfvzht8hjH0lnct3UDvYGGn3Kkqjb1qvOvCcWuDZt6M0WBjphnxUcRFcWsVzzej5hAW/OZ5PFcu/B56BAlJZQ81OvbTATDgJhQLzMlwBxTDa6lewxL6Hx5yrmeJ+H3FrA50RR3AyZTNgkvTX5Yd58XlQfNwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783517; c=relaxed/simple;
	bh=DBENkEC0ApGIzDp6doWvNzdm8cGCKFKIypaD504T8us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VyWBHDrBZphCKV9ZrKYSh7saz4gRdLhtQMDDjtYK3sx9Rm8SOy9bvOgnY1pz9pyCGKuQK3+2TbyEuASk/JwhO3oEZn6dSDX7a3s8wNKD1nIcHQyAcc3o1yqwfYIQIt8wnXuj1tPgWncDoxdL0q88xEW2xJ8RJP0YP5XDBpgm5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DbYYrkDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8d5U6028694;
	Thu, 28 Nov 2024 08:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB7H6zqOU8XA7++jjxBLmHR+yV+sy4tTZskNpFRtSKk=; b=DbYYrkDEDfmyaZgw
	uLy+AKvhu7PGgaKVaImbIInKP1WE5q8mzW/E3HkiK7G/OhGvSIFGnHvvUI70ddja
	F6k2s9vasRGD58bplsABc3fwn2A5//MyAs6d787Ywr5ek2bZNQ+uaYN7xfvexDrH
	1DLf2kM4enjg+GPCsel138JBJMvg35IoLddCYV7Qy/8eVo9/7rBFzPoClaDxkhkb
	rLRh6TBgAMciPUM2rauFsdcNaFkw2jMF41sZXHuCA1CxZ9NN1jVIRs6Eck4QWglr
	gao3BdPwybS2LZ8OVzIdg/gC2Ek6sm9Cj6w3RKXdyx3D3nUwOK+dVgNjqzyVTO9Y
	uWXrpw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671e9v34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:45:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS8j8dj007565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:45:08 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 00:45:05 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 28 Nov 2024 16:44:43 +0800
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: document QCS8300 SoC and
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241128-qcs8300_initial_dtsi-v3-1-26aa8a164914@quicinc.com>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732783501; l=1008;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=DBENkEC0ApGIzDp6doWvNzdm8cGCKFKIypaD504T8us=;
 b=cAhXmcLfDi5jRbRl1C6p3L/x1rNmLo9L3teaN+gRbMnOCU+3tsJOaBEHTFWjiReur7Sg5/HL5
 s6RGPdJbXQTByt4WMMlseM+sIWM/c+SMYPD4AELJA4xihR/Us+oCVpM
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 70aNPnlbIBTlHQhSy35K1KOgtfFJhF-_
X-Proofpoint-GUID: 70aNPnlbIBTlHQhSy35K1KOgtfFJhF-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=953
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280069

Document Qualcomm QCS8300 SoC and its reference board QCS8300 RIDE.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca3990393510..87f1106767a2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -52,6 +52,7 @@ description: |
         msm8996pro
         msm8998
         qcs404
+        qcs8300
         qcs8550
         qcm2290
         qcm6490
@@ -921,6 +922,11 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs8300-ride
+          - const: qcom,qcs8300
+
       - items:
           - enum:
               - qcom,sa8155p-adp

-- 
2.25.1


