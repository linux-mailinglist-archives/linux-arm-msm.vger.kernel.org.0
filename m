Return-Path: <linux-arm-msm+bounces-34722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B209A1F26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADF971F22371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2341DD537;
	Thu, 17 Oct 2024 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X7qSpJcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9491DD0EA;
	Thu, 17 Oct 2024 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158854; cv=none; b=UXs+ELVBnU1Bu579YtN8nytzwU/XOGUPBPxPSNRX3ym8SoZ2cyLC4Fown3eK/eQVXBWd+7gFYqv5KMgvT+2hrz6WI56MbKywTbogtF/tzxB/Hcjue60Lxg0TF2FAtVLybKHDVy4QphXDIErwtAo2XRpwAoYSepBXLqMk3LzwF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158854; c=relaxed/simple;
	bh=vUABZNOEU5zglsAKlfRDz3MXnciku93th5+5j2jXmAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=coXeCvO2lOEfAwnZ9aNwhTh/AnLY2+gnjBbn+xJSpIi1sa35lfYRWbN/UwvnDYJeTajZtD1qXu/JSllVrlLQzC8Z/R2UbiX+0KxjVapgnLQjBQyuMawMvzRkuzHyqqKm5iZwlQmHX/8LyeKsliURK7zOs18KFtKLtIZboI5HyPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X7qSpJcl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H85h9R012387;
	Thu, 17 Oct 2024 09:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1Z5zmDQ1OlpDM8knvCmKvl8qeoK7rF44pz04m5RQUg=; b=X7qSpJclIK8YEZJk
	eKuMp2tARobUNSoZhJ9kck8dKTfFN57QSwR/uAMjLKeVDZSCNW6IDkQwD22/YCTl
	fsdeuhCMjCTCC1ceTGnH9AkbkcBLEhlWEoqU+ORvssLRbm3QQ2T1TmEtFPApCoeM
	lVKLJ4yY0odGofrH9yo4KJqY6fDqboQoIE+D6kTy3kJBS3rtX/r85y0mnsSO+mhO
	OZmMahYxFCYsCiv220lXBCey8Z8PUe0TnK4MIacQVKnkk7AsaePK0qOcUea60lfi
	8a6ec0sKH246k0sFMXwbUDG3BlSPDyUjDKrik5NE8z4h1NCFlNPU97e9b6HoMRro
	0L7a1g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abbxumn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:53:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H9rtLC007900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:53:55 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 02:53:49 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 17 Oct 2024 17:52:39 +0800
Subject: [PATCH v2 3/3] dt-bindings: net: qcom,ethqos: add description for
 qcs8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241017-schema-v2-3-2320f68dc126@quicinc.com>
References: <20241017-schema-v2-0-2320f68dc126@quicinc.com>
In-Reply-To: <20241017-schema-v2-0-2320f68dc126@quicinc.com>
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
        <quic_aiquny@quicinc.com>, Yijie Yang <quic_yijiyang@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729158811; l=997;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=vUABZNOEU5zglsAKlfRDz3MXnciku93th5+5j2jXmAA=;
 b=tby6vQu9qH88iG15U/qaKWjOLc+dbzaT0wSQDW4m1xMAdnP1B/qoFa5vX9wS/SjMkNHcuDoES
 UvEvu21aKxhB9LnrY0wGrjqr5N0o1Yyq0iCL46yND3g+47RSr5C8glD
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TF6qnuv2ur5_d99nYxsHI5iWBWe7TDK2
X-Proofpoint-GUID: TF6qnuv2ur5_d99nYxsHI5iWBWe7TDK2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=773 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410170067

Add compatible for the MAC controller on qcs8300 platforms.
Since qcs8300 shares the same EMAC as sa8775p, so it fallback to the
compatible.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 8cf29493b8228967156758c0363a978daec84152..0bcd593a7bd093d4475908d82585c36dd6b3a284 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -19,6 +19,10 @@ allOf:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-ethqos
+          - const: qcom,sa8775p-ethqos
       - items:
           - enum:
               - qcom,qcs615-ethqos

-- 
2.34.1


