Return-Path: <linux-arm-msm+bounces-34720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6FC9A1F1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD9991F21489
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CE51DC194;
	Thu, 17 Oct 2024 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RAA8/zXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100741DB540;
	Thu, 17 Oct 2024 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158843; cv=none; b=l1sdnm+AHmK/GbQKhKMRN5awP9dJY5ydQAD/MR/4OfUZq7rIKt2WUZGCOgUE6QtJ9gqpuJdnD9q9xJdq3pyGh5AI44U94yVEUR1lNqu0ZDi25mpQXDw/4XgCRoWUbOakZwKODfh9BVOcPvuWu0rhbAP3klBgZKceQUE0NDavo+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158843; c=relaxed/simple;
	bh=1fRwR2aQ8UF3hr0qNofVM7Li7WOw04ziNuFhMZDlbVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VT8fzisxSHv5kFve42ZzMFEtORILLsFGAL6zRGMD8H3/Wz1FGU4CcR0CkbwlY0pHIadURYEkEwsyiTOfeIVrrAGYqvGySHav7qNjuCUJzGloPNiZgzwZjtEY3sARRsuX59NoSvM+aUsk61R88g7umbc+kNc7k0UUVKU7sfRj1SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RAA8/zXs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H8PHcN012407;
	Thu, 17 Oct 2024 09:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QD8WKOLKymw6e23TR9PZ97KYvtjsQw9ZqeQmcwE0nsg=; b=RAA8/zXs0v0Qczmg
	E07OW1Oa5krBrt5lDVRmtlaMBenlA4OGD+bm+j/Mb5y4v86ghoBiFIYjAYreVUOf
	KIvlBdBeSOW1AAjpSYsHmZDV/hpgvO9iVAkBYNyRYqyh/OgVhxmGLW+GJZqKs0X6
	2s8bQSrQRG6sFXXnZ6x7w3jxzQ2iGlsGRW3K5zaz15yag08F9iv+rKY2i1vu9q1k
	qvCDh9r6aGGDH1Xk7lXx4Cazv5/uKW7FN8HeOBHKOwm38N5NUQqWHLqvE2k3kD8t
	kC7b282z2dg8ccNv0osn3DDLjdUzZxjCp4bMoIs/s4p+Qh4wVHVJ5PWE7IVBF4hS
	tVpyIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abbxummn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:53:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H9rhkS018000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:53:43 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 02:53:37 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 17 Oct 2024 17:52:37 +0800
Subject: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: add description for
 qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241017-schema-v2-1-2320f68dc126@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729158811; l=1263;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=1fRwR2aQ8UF3hr0qNofVM7Li7WOw04ziNuFhMZDlbVE=;
 b=+wIQ4wow/VoWsJ3HVXyggm+oTTEdK2MByb1OAWDIGj2XGwVEbQzhGVptc+xZtJANlBtOlcGSf
 s2uZvrTkwVyCIz3IErBDjvK+LZGrwaz3zAHG/Ohs84f6vxqvlGesfb5
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YvM4fkeYkmdU3mvOtsgmPwGAIK7ei00L
X-Proofpoint-GUID: YvM4fkeYkmdU3mvOtsgmPwGAIK7ei00L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=838 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410170067

Add compatible for the MAC controller on qcs615 platform.
Since qcs615 shares the same EMAC as sm8150, so it fallback to that
compatible.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 6672327358bc13f4a464c845d242d32569bf66a7..8cf29493b8228967156758c0363a978daec84152 100644
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


