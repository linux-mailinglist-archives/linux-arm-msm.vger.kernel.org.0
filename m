Return-Path: <linux-arm-msm+bounces-33756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C73CE997A63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 04:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14B24284966
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1906E18C03D;
	Thu, 10 Oct 2024 02:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P1bsZTQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2B187849;
	Thu, 10 Oct 2024 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728525953; cv=none; b=Ej0WFcE9M9ilY/M1TQTWJUUTMrh0aRUQzmweNIBFeu+3MfLJO3p8RAzH8Z9Kw5D97uGc5vQZti7QK3Q/9rumRNMIMOG0PL8KtkJKPHvSY8zQ0G6nLyumAluIJQMLTr9S9LvM5Nx75CGagysHD43MwMB5JoMoRy19QkP1dVbDLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728525953; c=relaxed/simple;
	bh=8P4ZQ+CZOCH8vZQlSLNo77S4gwMiUX4y1WrSWCcvZ+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CaHhT0+6Cfx4LJtQKL956pTVJnGg+2iql6Y4fE7OomEUBplXl6bQiJ1ihRp6ULLuz2d/6DzB9P+tMxaVYlOlNM8cne034BIGI0bge+gfU3qvIrKuP/zZNHTUBkQCMwPPRidbszHFiJc49Djs/kfsmS1/Wkn8ndbbHgC2seznLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P1bsZTQ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bHiE009185;
	Thu, 10 Oct 2024 02:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78PNpcCN8wMlM6G5jBcKLZRy/i3qNzJuV3HBQg4DeP0=; b=P1bsZTQ6KIOFSL2a
	c345x4TvisrYmzYZZ2ilPav3lPuJ+Y7Ipia3lj5X3XsuBo3msw5SKP2N84hZXmLb
	qNyTsMtlTQdpN0UqKr5kcOkfmIxQXEzMVU09y8+qROCGbd2Wo+9NGDDlxlcPRslg
	rEss4b1sMJvfK3Nv6jHdKavUDqHHFs5UrsESingWOK3VEPwx68BApKrMMGRLQn2D
	DmfSYEfbMy6ybJQqRDlSUVeLqgNUdLpKgyjX67T3mhFnC7u37qONbhztPGbWaCje
	0jfww9BjYSKXLAMhBvuQX5PoHAnCQDDV63NO3q2hNg7jeWsUbljqGEj1yTPN0gQU
	iln1sA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425tn11xqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:05:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A25TLd007361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:05:29 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 19:05:23 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 10 Oct 2024 10:03:43 +0800
Subject: [PATCH 1/3] dt-bindings: net: qcom,ethqos: add description for
 qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-schema-v1-1-98b2d0a2f7a2@quicinc.com>
References: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
In-Reply-To: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Yijie Yang <quic_yijiyang@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728525917; l=1140;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=8P4ZQ+CZOCH8vZQlSLNo77S4gwMiUX4y1WrSWCcvZ+8=;
 b=TGyLZpyXT7ehstJOQaa2jJoKlflSrHRFN4i7cU1VNoE0BOL/ukohiR35Ol5gO0jlA7BDAQoCK
 AJx80KEWeh5BHkSJHGGmGFNmV/BISJ5XS/S8fM/Crw/Qj/DAPmZ3vVs
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I2EfeC1qQIadFELihCnKvfXuPvp_oEAk
X-Proofpoint-GUID: I2EfeC1qQIadFELihCnKvfXuPvp_oEAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=812 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100012

Add compatible for the MAC controller on qcs615 platform.
Since qcs615 shares the same EMAC as sm8150, so it fallback to that
compatible.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 6672327358bc..8cf29493b822 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -18,11 +18,16 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,qcs404-ethqos
-      - qcom,sa8775p-ethqos
-      - qcom,sc8280xp-ethqos
-      - qcom,sm8150-ethqos
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs615-ethqos
+          - const: qcom,sm8150-ethqos
+      - enum:
+          - qcom,qcs404-ethqos
+          - qcom,sa8775p-ethqos
+          - qcom,sc8280xp-ethqos
+          - qcom,sm8150-ethqos
 
   reg:
     maxItems: 2

-- 
2.34.1


