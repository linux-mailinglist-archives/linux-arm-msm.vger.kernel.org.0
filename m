Return-Path: <linux-arm-msm+bounces-44867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB0A0B289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 10:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C823A1CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1A523872C;
	Mon, 13 Jan 2025 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UEi1T877"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379FF188906;
	Mon, 13 Jan 2025 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736759822; cv=none; b=Mgr5eYItueceDUqgdMfDmPuO72JQ2JJZpHlBHMz1w6vy+jHhFILSkFO/6CfmrXQqmTCT/B+7TlR51xnnodQWHANoi57knkuK4JiUPEsXyqITVu9R+Z3C6ML7roOHmr1HeA/yq2eqB+C3trGb1VnB4JdwJ52ZoHutGSso5bcOmdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736759822; c=relaxed/simple;
	bh=7UnmyNdVe+32W2vUPO1zCBjs8r1y7uMlO2y0GncJoaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jKDeAAimS1D6ouwjPDbrh8Lt9dNeDj4wtK9WS9irrVFJfxAlLRg4bunFRqBJLJd74PHv9ZeREw6Vct7RmJipBL6Ek+H+gcWiUZPAkumKcFSE+PMH5l6+sX+hap+91COVBcbHKpp/qS8G0tn4JuUA6vXMutP1mvCODflqW1MmT2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UEi1T877; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2IePB022963;
	Mon, 13 Jan 2025 09:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3uxgE4idQR38GT/Gb14Ckn
	TFHWfCRtOUTFCc7UH8QKE=; b=UEi1T877f2Z18gLc0A+J2zUyAxxVjAfElutp1j
	9p/q9aBJMPPeioYwhzwURVWNsXkVq2bSoM0BYwGOpE+AKSiDkS96gGc09PHQ3nrN
	7i/h+RDOzaoAMkOLxEPTQNF+HDNE8BpsRnHxuB/DGb39sKlR9oWzG9CbKQPLkWIB
	N39ZWLxz+aShsgFWDrWtLOhb3fNwbe+Pil/ErtPhbsFkWQT3aBqsfkYXnk6bUv/M
	+euarL2FQcfOVv3aUjTaUu2cuJ1kU7g/eAdawxl1rzK28luybtcxbJfo2xnt9ytU
	wx1Cu97R+n7Efr7y9QBHWYRXWDS35QoPx05lzOqebsFBFn4w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444swy8v24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:16:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D9GoWa003237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:16:50 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 01:16:46 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Mon, 13 Jan 2025 17:15:39 +0800
Subject: [PATCH v3] dt-bindings: net: qcom,ethqos: Correct fallback
 compatible for qcom,qcs615-ethqos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-schema_qcs615-v3-1-d5bbf0ee8cb7@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALvZhGcC/1WPzU7EMAyEX6XKGSPHTYHuifdACCWuS31oupuUa
 tFq351ky484ju1vZnwxWZJKNofmYpJsmnWJRbR3jeHJx3cBHYo2hNShtS1knmT2byfOD7aDMDy
 GdngiptGbwhyTjHq++b28Fh18FgjJR56qyw7Xw0nzuqTPW+5m63mNcBap/46ArQULYxiks734E
 fH59KGske95mU113+gPJHK/IAECIorv0Tl2/X/wuvdMUqZZ173s3rTsZ10PTZTzCj8vF+L6BR4
 bsL0oAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736759806; l=1888;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=7UnmyNdVe+32W2vUPO1zCBjs8r1y7uMlO2y0GncJoaM=;
 b=B3nb3Mn3UmXhfXYL+TDx8mkmaKJCeumdmMZ/TR2FBQpLC3jAyvZSknTWiOUU/gfeViW5H5vBQ
 dqmCc/n4R6zB67B6vn7vH3IjKphJbaQJKRDTFB4WwVYtMQrgPJQFXed
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WSQ9bUlJ1OFMUT1n9Dnrj5DIwUKwR77t
X-Proofpoint-ORIG-GUID: WSQ9bUlJ1OFMUT1n9Dnrj5DIwUKwR77t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130078

The qcs615-ride utilizes the same EMAC as the qcs404, rather than the
sm8150.
The current fallback could lead to package loss, and the ethernet on
qcs615-ride was not utilized by anyone. Therefore, it needs to be revised,
and there is no need to worry about the ABI impact.

Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
Changes in v3:
- Fallback the Ethernet compatible of qcs615 to that of qcs404.
- Remove unnecessary patches.
- Enrich the commit description to clarify the ABI impact.
- Update the base commit to next-20250113.
- Link to v2: https://lore.kernel.org/r/20241224-schema-v2-0-000ea9044c49@quicinc.com
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
base-commit: 12d614e5293b74345f6d0ed93620f8f10ce0f8b9
change-id: 20250113-schema_qcs615-bd7b3d82c2fa

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


