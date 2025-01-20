Return-Path: <linux-arm-msm+bounces-45546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E4FA166E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 08:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C42F168FAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 07:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62879188907;
	Mon, 20 Jan 2025 07:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SrivZyOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEFF35968;
	Mon, 20 Jan 2025 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737356960; cv=none; b=VMu85ZSxN8kjV86TTQ5Q5hRD5yWLx7bzdEsKqoEMZc86khi0vA7U10WHwSXVksj2shlaXhoRRLGAlSV+TUCSbXt9Rf8VmfVgykpl33Xu+uVgUVWKAj7HAn0NdCk7mrmasPoqNaOXtplBYtKgfo7eXsIaesOu3M3UQqOaSz1pBG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737356960; c=relaxed/simple;
	bh=iTiU+sR8Q5ot0sGS+V/cSaGPgjcmwcVWfWk9+3LioY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ownWiANuK/o6lGXDqkbMKkxIt0mNqieUWitIUohnliJIVXn+OfgEkNbPziaI8DnSGNqZMLCo1lIuTTvQ+3GrFUeOM2sMHp1t8h4cKB+VhtClCnrghBlPV4lUJQNhZmJnSY8qNeFyNZZ87h1xKtMCNG5lblGcvI0+GB9yulqoIgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SrivZyOB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K3CE9N032476;
	Mon, 20 Jan 2025 07:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0RsIGrCbgvaSePTwM6ujYK
	ggcuA52rwAq3bp/VilRXA=; b=SrivZyOBWLklj+Z8XG19LqC5UsqDsshjw8W0db
	GxzUOR2ieUAwKPHR4gMyyJT6hk3d0lCZrL3ZUmFXJhWVYzPM3WvX/tEfVhG+15mb
	vkHwAywZuvy4d/Vh8kqH2j9lueHN802ZKmUmYfUn3vP8Y1EeM+umh51A98i4hp9x
	dXOCKxvvR3vKsWb1qc/4cvs1yUvvN8QsGdSuadRzbBg47ztdR2e8Hn+yMMpqh2TH
	XVV3IojM++py3rY89wpajahII70SJ/VnpAO/auB2BhVe9rJlKAF0QVwTbRhvBWOA
	RnptpIrZph8LCS7eE3x7P054LsrwrbAP56vXe03mmWix+IOQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449ecb0hd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 07:09:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K793Ih003439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 07:09:03 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 23:08:59 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Mon, 20 Jan 2025 15:08:28 +0800
Subject: [PATCH v4] dt-bindings: net: qcom,ethqos: Correct fallback
 compatible for qcom,qcs615-ethqos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250120-schema_qcs615-v4-1-d9d122f89e64@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGz2jWcC/22PwU7DMBBEfyXyGaO145CmJ/4DIWSv12QPcagdo
 qKq/46dFBCC4+zOm9FcRKbElMWxuYhEK2eeYxHmrhE42vhKkn3RQoPuQKlWZhxpsi8nzA+qk87
 3rvUHjTpYUZi3RIHPW97Tc9HOZpIu2YhjTdnhahw5L3P62HpXVe21wijQw61Crq1UMjhPnRrIB
 oDH0zsjR7zHeRI1fdU/oNbmG9QSJACQHcAYNMNfsP0C/xu1FfvOuQBEB3T9b/6670xUrpmXfey
 +tPwnXo5NpPMib+l9Ia6fPdZrY2gBAAA=
X-Change-ID: 20250113-schema_qcs615-bd7b3d82c2fa
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737356938; l=1797;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=iTiU+sR8Q5ot0sGS+V/cSaGPgjcmwcVWfWk9+3LioY0=;
 b=JjV75oFv47b+arzPWf+UnQlVFPQyi5BhLkSTdXMSA/zb78ronnFcLrUV4GLSThystNbmyM8+O
 NadYCJqemVKDgUVUWFMmQJqgbWW60tvktRst+kKSSo8Oo4xDAqTXhsB
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oSsUS-bdSA2PNpAOOhf3LOg6bI9dVyk2
X-Proofpoint-GUID: oSsUS-bdSA2PNpAOOhf3LOg6bI9dVyk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=921
 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200058

The qcs615-ride utilizes the same EMAC as the qcs404, rather than the
sm8150. The current incorrect fallback could result in packet loss.
The Ethernet on qcs615-ride is currently not utilized by anyone. Therefore,
there is no need to worry about any ABI impact.

Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
Changes in v4:
- Update the base commit to next-20250117.
- Update the commit description for better clarity and understanding.
- Link to v3: https://lore.kernel.org/r/20250113-schema_qcs615-v3-1-d5bbf0ee8cb7@quicinc.com
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index f117471fb06fb3b507df811d55d41d0b610ac15f..e7ee0d9efed8330f5cf62e6c0ea41066572415aa 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -22,12 +22,12 @@ properties:
     oneOf:
       - items:
           - enum:
-              - qcom,qcs8300-ethqos
-          - const: qcom,sa8775p-ethqos
+              - qcom,qcs615-ethqos
+          - const: qcom,qcs404-ethqos
       - items:
           - enum:
-              - qcom,qcs615-ethqos
-          - const: qcom,sm8150-ethqos
+              - qcom,qcs8300-ethqos
+          - const: qcom,sa8775p-ethqos
       - enum:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos

---
base-commit: 29ef83bb05764c31613d839f62474aa54b39e7d4
change-id: 20250113-schema_qcs615-bd7b3d82c2fa

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


