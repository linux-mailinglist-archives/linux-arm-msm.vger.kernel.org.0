Return-Path: <linux-arm-msm+bounces-43288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 520199FC4A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 11:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BC37160306
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 10:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459271741D2;
	Wed, 25 Dec 2024 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DOcn+PRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018414E2E2;
	Wed, 25 Dec 2024 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735121211; cv=none; b=hbpwmDhR8BMoOCSyd3RC0B63JG0IqAykQVIUxDEjSE2mbY3E/g3CufNh/nY8WvVSOoxZ9IqypzlaKC2WowPegk2Kz7npwMaDJmt5KiA0uiU65wjEnlerKeE70LClOE4ext+x3cxwzKtwuCSrBiPRyV1hEMLXVIfWg+Goi3caWxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735121211; c=relaxed/simple;
	bh=Apxfv2T/un5aZ85UbnR2vXIgKjHF/0BsJNT6F5/1VEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t2HkSNVxds8jn99ADgIbO66mXVadZW3ADfZHSyyDMrF44BcB0TbRv/Jd5rO4bPKjJyq++9KYR5PVkZaqrICsncZRq2bdJ+w20zubCBq+1DT6wO2XWfjFKK5o7Fo470FBBsbJnO2bGB++X56ZNDSt9WWPpQq2ZFX56Mo+T/3ZDLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DOcn+PRV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BONkMk8021968;
	Wed, 25 Dec 2024 10:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqDXoEyYjLRclnNgz6+Jqy/Kv/maF7IMepbaEjnrWo0=; b=DOcn+PRVwpwyd4R6
	oveuEnK3HVXp3xvtB/LS077tiG/4g29q+Dq1YtRiHvFdd80Qbf0lEDbJQrXFps6V
	ORF4OBurfU9q+9hpxVLn3TDjOuX0YoW6ToNqahqBtDz3+DRLSDxkY8p8XJ8HxQ+t
	Xw9U/IUzANQepyzB/VZPNnYnlGgg3gAwcHCXvpE96Hq4ICYFrwV2rumZRlSNHUtL
	KkGOljuGv1zDqWsaOtQ4aLDHYYM2Iw/GRKiMeyuOsJXlsqpQzw2m7OVNHbTRciRC
	cx5NyMqnBdxj+cg4df/4WMqqCxbvJCEuLMdImoMRGpBQD2QsIH65RqU5HwB1Lbd6
	4fbQaQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qybd4yhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:06:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPA6Te8003110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:06:29 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:06:23 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Wed, 25 Dec 2024 18:04:45 +0800
Subject: [PATCH 1/3] dt-bindings: net: stmmac: Tune rx sampling occasion
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241225-support_10m100m-v1-1-4b52ef48b488@quicinc.com>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
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
	<konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735121177; l=1213;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=Apxfv2T/un5aZ85UbnR2vXIgKjHF/0BsJNT6F5/1VEA=;
 b=ADtYydjbO7oefF/JqDoZc7oxIOVR2uvm8OpdSMe5eY2xDP2+uAG1SicbLfLaCcXb0ABi0W4LC
 ev2B/iaaJbvC6KWi7Y5DI+mp+sTQjConT6pAc23EW7xEmGOaw9TdNE3
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f9_Tnsl30W4T8c1jb2p8xz9UwclxlR0c
X-Proofpoint-ORIG-GUID: f9_Tnsl30W4T8c1jb2p8xz9UwclxlR0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=498 bulkscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250088

Add documentation detailing the capability for tuning the RX sampling
occasion of the Qualcomm MAC. Introduce a new flag to indicate that a
board requires switching the timing of signal sampling, instead of relying
solely on the EMAC version in the driver code. For older DTS, the logic
for current boards is hard-coded in the driver code to ensure they
function as previously.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index f117471fb06fb3b507df811d55d41d0b610ac15f..dab6d9ccfa9a0b64e314a4cca84f25b97f6cee40 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -78,6 +78,12 @@ properties:
   phy-names:
     const: serdes
 
+  qcom,rx-prog-swap:
+    type: boolean
+    description:
+      Swap the sampling occasion on the RX side. This can be used for
+      tuning when connected to a third-party PHY.
+
 required:
   - compatible
   - clocks

-- 
2.34.1


