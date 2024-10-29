Return-Path: <linux-arm-msm+bounces-36251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6699B40CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 04:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA302835D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 03:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290A41FF5F2;
	Tue, 29 Oct 2024 03:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eChLHYnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2789F1FCF79;
	Tue, 29 Oct 2024 03:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171563; cv=none; b=m7U0gqcvdlbyCxu5NB31C9B3c65urY9HAFjtwx8bOx77mmJq4qux/ilaOLxYaV8v0yTl5TcZRvdIqwiJNm7qD7qqKjyqO/fJtda95V6bkeepdsC6ONVdxzXJJeXUCbNVHkImwhuXD4V5ij58PvctezDzht4ktxAOWM8kNOoZu3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171563; c=relaxed/simple;
	bh=9kiLm2i+dGqql4YVdS1cbYLK8q54tXh4pSZnQhKFr/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M4dyahx67hs8CF2y3dT0iVV9krh+PLla5UWz5Ap9zduyH/5IsAYeCzrbWJ6xzlsqj7vNS5hlvD9QqrWo6qzIHy21mAU+QHW0IuX/tOkAxxzQHlniQ5pqSrIGQ918hHc18xP2+9gxtp+swVWLltabsB/jZBRsN8IxgLQMpzEYzmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eChLHYnC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SMbash013295;
	Tue, 29 Oct 2024 03:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPpbEShmstIeKF7f+S4nIfMFMlJTE9ZF/FBsoULwBVg=; b=eChLHYnChz02Rrtu
	BlN4BbMZLSfmd6bOs+WNEzzODkSzkcTSXpchUtWQZ9BtkWgkc2DViQgmfybEtKW3
	uzd2JOmxZFAVFnODYcHm/3O/Jly/eBg9YRpWmlfwSYxH8rvVocFNj/y50Q3qfa+A
	c1fZlP3joR8HSMvk6QHxMbpzKGV2r4BKXSmDK91/mM/q773yqKmLBLFwGYM6YuiW
	n4ys2pAE00WsqG3oIRbF6/eBTwGZNdpvijnEu5Hj5eV7Di8OGYWLO86/1E/0jXXL
	R3h+Ca8Ds+YKabedMVYdFlxeABvyZxjumXPjUDXK8gx78D9M5v6m5Qas0lQUBjWe
	6I19bA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe5xxdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:12:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T3CUFI016992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:12:30 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 20:12:25 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 29 Oct 2024 11:11:55 +0800
Subject: [PATCH v3 1/2] dt-bindings: net: qcom,ethqos: add description for
 qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241029-schema-v3-1-fbde519eaf00@quicinc.com>
References: <20241029-schema-v3-0-fbde519eaf00@quicinc.com>
In-Reply-To: <20241029-schema-v3-0-fbde519eaf00@quicinc.com>
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
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730171539; l=1263;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=9kiLm2i+dGqql4YVdS1cbYLK8q54tXh4pSZnQhKFr/Y=;
 b=OlmOa7vknYMhEe2teL0cKkIZXhXzucVNRY3JAoTsCzUQe+tTtiI27Qck3x2guwfunVqwde59i
 FA0kuHJnndMBxwCJ+ZUAdNs5DBaQinDUR1E4vIXzUylu6Tx7n3Zwf9V
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ytWqyuRUrmwP-A5ePL0OEM008QvtMC1p
X-Proofpoint-ORIG-GUID: ytWqyuRUrmwP-A5ePL0OEM008QvtMC1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=849 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290024

Add compatible for the MAC controller on qcs615 platform.
Since qcs615 shares the same EMAC as sm8150, so it fallback to that
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
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


