Return-Path: <linux-arm-msm+bounces-36889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3E9BAF33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4587D1F212CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7173F1AB525;
	Mon,  4 Nov 2024 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aGPS4/c3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AAF14B06C;
	Mon,  4 Nov 2024 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730711455; cv=none; b=mbV92pSqQhZCF7LG9OSeOt4qs3zW9jvokJDV42fka/iLjMd3Eb0s60BMCOk+/0p/unnkwnLTMw5Or3U7ffdMHx0TfEKTmLfBxSTK4RSTSl2D3xdkGfMOVjiQhraMU6JV2RQF8Fvp4EoMix8fLDmyecxxUrgByWU5lFMuO0Yd0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730711455; c=relaxed/simple;
	bh=WfEGy1gBvQLlivvSWlt/WjeCG3t+mDbKbgZ3QWdSCdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Rp0eozqlw+Z6Z6FHlh+Ebu8MK2k+8Yr+jcFWwTTaRWNZz4u0C2kijexiULrTGFBSD0nKPjucJpUu+ifAI4RUWKJ9WNARwyar2CdDpshdPBdyxc4aPgwtJSU+BqoHcbG+D5LCbZGPq8zG7i5iND5k5OoFn8IYljpbe2Kda+uIkG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aGPS4/c3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Mq0X8021752;
	Mon, 4 Nov 2024 09:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nq4+8zGPVzwbKy77FvdUljap/8xgrvYCNGaZHBGYgWQ=; b=aGPS4/c3nOkG1nMD
	JUHtUgDoUCZG1Xu1a3jEEs0DMSKM/GJIED5kHGgNwldR4OyRQqnmrIKBwU5BUomK
	mtxo0WCayUOaHOcV/U15uDBWq3gIOWCSfABeLBuV10sgxR2zTXiBY3Kr1dWq1qdq
	CCOTIA1eC1YmCIv6bBY8dFrS3cgkiSqnGyeT85NdrkqTJqBjKVUpXT62ez7qVUAx
	6ToksjhbZXOa6VPcPs/icazWgOv40nCk+tQDwcKYW/Xmvz6/fzhN3qmx5IOZ6Mxg
	hl5L2865dl2LLrw1YmyF00+/mowj/A0wJRGF0+2BM44wVH40rkeza0ww/ZzEtS0p
	5Q507g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ykh2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:10:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A49AWhC001993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 09:10:32 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 01:10:27 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 4 Nov 2024 17:10:08 +0800
Subject: [PATCH v5 1/5] dt-bindings: arm: qcom: document QCS615 and the
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241104-add_initial_support_for_qcs615-v5-1-9dde8d7b80b0@quicinc.com>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        lijuang <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730711423; l=1010;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=WfEGy1gBvQLlivvSWlt/WjeCG3t+mDbKbgZ3QWdSCdA=;
 b=7cbodv3J87bpHsFHl+NUPzorRC1cQY/ObrvtSq4sp25Vue0cZAWBYbA1Zhgel1gp1vHRPlEV4
 eAsLoG1/oSFCNG9mosAjhVGHbyKwk3GD4FQwo6d5I9ITs1zqrbacKNU
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nXi4wwxvxKIBECq2LdL39no_tF9mwYSw
X-Proofpoint-ORIG-GUID: nXi4wwxvxKIBECq2LdL39no_tF9mwYSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=998
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040081

Document the QCS615 SoC and its reference board QCS615 RIDE.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774..a1d03d341498 100644
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
@@ -897,6 +898,11 @@ properties:
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


