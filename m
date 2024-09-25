Return-Path: <linux-arm-msm+bounces-32470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC28985746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 12:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22560284611
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E015C188A01;
	Wed, 25 Sep 2024 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ScFLy0Ao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943717BEB9;
	Wed, 25 Sep 2024 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727261046; cv=none; b=s6Hrv0MfKENosMQRTMf84m2UDeJXWcyFp2QvIxdelJRPUVJs8aOJzgK5vSqmnu5k0xstgqEL+3qYDc8PjepfYZH3mqRSZQQGl2nFMMa5RPZbPq68+J7/Ow+ZGYd3vkyMrPBjGBj5S6BDTFCASx+NwHTiaUF6u4JMn2Ft/Tk04bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727261046; c=relaxed/simple;
	bh=i/EH3GF+7NnKvCjHI7DhROOYsuLkflJ4CHgbP4s3Rco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uPrhHWptKHOf34fTljy/G0I4/lIro430kHKWMztuyvr8GvTsvB1lp+NtQ+AwxX3zw52Xnl6dI0pyXbkwCbumybExLAhnIqP8U1BX8LVQpzChlOaPu+5iY5WEprsKwxnW9nVtzFk5+ofviIWqY6f5rKW+XGvTSP2Ehn9FEIhjmT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ScFLy0Ao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P7VX6E008964;
	Wed, 25 Sep 2024 10:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPy1jcjVMtvxOwahG1N12roPDhS1EbHakna7VTG4ry8=; b=ScFLy0Aordkd/lEm
	dsogm63ZE11V6wJzocgF79osi1US8pcN6cLQXnNqjPf/CrXA0WRVgxYimEu0X+zM
	TX7TzdlHg8Egbe9mcm+SsOaYsWLsDHmWlz0933VkLoKGFRA/Zi+2JPcmumR+xeyP
	AcyEJrNXBPYBXAeWA2NRYwMdRrQPk0vIb66gla0GEINM5CUKZXzSG9t7Cn3mSyrs
	IayOy583BGu5yeqjBPeYR/8Ka6Fd0PpaxnbwZuRL4BeToiuOoOA7Nw0Xpuwyg9/0
	P7EtsENfJYzvhLGmWdprsIXOSRoMwmCJr0Jqx7fl+rA4suAvsdYLSBks09Ph2xFh
	tjLEtQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spweuh0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:43:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PAhtG9002480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:43:55 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 03:43:51 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 25 Sep 2024 18:43:32 +0800
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: document QCS8300 SoC and
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240925-qcs8300_initial_dtsi-v2-1-494c40fa2a42@quicinc.com>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
In-Reply-To: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
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
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727261026; l=953;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=i/EH3GF+7NnKvCjHI7DhROOYsuLkflJ4CHgbP4s3Rco=;
 b=Qkna4d8V2rvWNSiWof629Iu20y+4/VonSMrokA0Vw6ppYAKZMLNZl6DHkTjhYCAuEozqIUWPc
 OsMRQtUyArtDJxtjfqeSyQJzgAuVJP2kFo/IW7LyRzaygauM7uphH3c
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g9BYNCNqkjez6zkT55Z_i0hnGgoIOa1l
X-Proofpoint-ORIG-GUID: g9BYNCNqkjez6zkT55Z_i0hnGgoIOa1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=970 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250073

Document Qualcomm QCS8300 SoC and its reference board QCS8300 RIDE.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..b40c3d7b63fe 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         msm8996
         msm8998
         qcs404
+        qcs8300
         qcs8550
         qcm2290
         qcm6490
@@ -895,6 +896,11 @@ properties:
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


