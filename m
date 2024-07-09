Return-Path: <linux-arm-msm+bounces-25662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C184192BC97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4BE2831DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2D519B5A9;
	Tue,  9 Jul 2024 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="miid7pF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5418C325;
	Tue,  9 Jul 2024 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534447; cv=none; b=d+hKiuV91gHDQtZZ3WpT71uaT9H4yaa8Igq14oinO5+xmVQoB6WfoChySdo3twIx6HXRE+vNZ6hKLgVaenhPSfsq5kwm5dkS3TbWVAaLQqa5VXgKxH9h/WENiSA1PiaYDWmdy/n6TW4m6J+siWkm7Wsdy6xb5EOUKiJE3sR4On0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534447; c=relaxed/simple;
	bh=hWxXNw2LvBfwVp/xj7dlzgC69xtaJekipNgDxnXIwg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JrrVDO0PrkYABjbwgQjpuIyjjvTeClO7EWiGC4/XWqcelR2OPT9O6WJjTlbt5gXhtvD9lK0skw7Lk1/JBm7Q/IUuKX/snBZbOeiYVVNWQFynLscIqHjhpumBzABfAZa5EEI2MZ5RVBrTqzj38BP0PHI+nmOckUg/6Xm6IMQYqEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=miid7pF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BL5MB001714;
	Tue, 9 Jul 2024 14:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxviBOcHtKTweIrVl6PYDJKq5IMvSYa9RqiIv7EZ7Wo=; b=miid7pF8HhBYq818
	yDBq4Tckg+pkdeA+bt2twJQrjiedtU9BU47T8TOrOoTUAnf3cgQ2q1UCNPfv0+Ks
	40rwD98nasAWR6k+GwG/19lcu5MQd348hQa3HjMj/nJlecS0z3aEojZlS4JWdCW8
	bbf24Uwa/fkQ0IfXYZb/Ta3chcsPd6UJ6sxsBiZIMHzllpCD32ZTiECX3iZqIlbw
	XgN4yYU9jh1fVInYxtDmalO8c2tuBIZUGi4o0BBJcaN07UIk0yTlTugU0anqVV7F
	uAxn5L72s2bfyKXJNo3ZCMa5WslBglSfTk0iwdzyXioqHPBzuvBg6VEY0ri7bBE0
	x6HihQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa66kbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:13:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EDhoH027300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:13:43 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:13:36 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:13:17 +0800
Subject: [PATCH v2 1/2] dt-bindings: net: qcom,ethqos: add description for
 qcs9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_ethqos_compatible-v2-1-ba22d1a970ff@quicinc.com>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <kernel@quicinc.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720534411; l=1943;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=hWxXNw2LvBfwVp/xj7dlzgC69xtaJekipNgDxnXIwg4=;
 b=hU7weGJVJ5p8TecCq9alk7G6SadHqS0cd9UPHQVqfezeMEV1dm/hsN6TTo8qCA9A/vjFos2tc
 RSRUCaxEfD7Cgs1xNkI8tlOg5kTjKGxprv48wwDcMLfN4KSBwqzO8Df
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mNer7o5Hyd3WknLGS4qMPyTINNLuU4HX
X-Proofpoint-ORIG-GUID: mNer7o5Hyd3WknLGS4qMPyTINNLuU4HX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=716
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090092

Add the compatible for the MAC controller on qcs9100 platforms.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-ethqos" to describe non-SCMI
based ethqos.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 6672327358bc..8ab11e00668c 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs404-ethqos
+      - qcom,qcs9100-ethqos
       - qcom,sa8775p-ethqos
       - qcom,sc8280xp-ethqos
       - qcom,sm8150-ethqos
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ab124324eec..291252f2f30d 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
+        - qcom,qcs9100-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -611,6 +612,7 @@ allOf:
               - ingenic,x1830-mac
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
+              - qcom,qcs9100-ethqos
               - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - qcom,sm8150-ethqos

-- 
2.25.1


