Return-Path: <linux-arm-msm+bounces-43173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6A9FB8E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07AE4166091
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 03:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA3E183CA6;
	Tue, 24 Dec 2024 03:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jsF8LdnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7873C12C499;
	Tue, 24 Dec 2024 03:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735009706; cv=none; b=RZBFbADhXpDSXhDs/IjP7Gv/Muox0qeB0E/NkD+E7hFG9h9zFEMPMvGdDVuG35rtaxNAmGEjnUyqQyTwGhvOn1U2P6DL2cXhUV/75JdDO37m/aiBUAx4jZfD3Y7RVmP6b0rODNW+sElgsU4QqrKIFR2I5+set7c2n+4aQ7pBr0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735009706; c=relaxed/simple;
	bh=u7rxgoC9B/7rS3oQxWd41tk1pmohU3HeHSdKpUR5MUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=W/M6nGKr3ZwuHpl+8l6DTJRXfNA/jh2s4WVym6bR/k39Ut9LuSgfTouvi2JFbvUqaO3NsHQDrvLhONbBR0K5lBjECw8NIgWw3G0haQJWzAQVi8sTillrxaallIn1rqmJj12OnKN9KodvwEe2Yu21hKUHfrHTvHNaykz3sOOb+gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jsF8LdnW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNHSrKN022407;
	Tue, 24 Dec 2024 03:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnDTHkNtPDeGfy9Saf30rNzJ7NN5oQ4IQjxVX59tzy4=; b=jsF8LdnWFUg2Tg/W
	4k0Snw7dU+d0CoWwDuuTxJbgQp/DgE/Hs3/w8uFboN1fsHrPygodVgNQUkAiymut
	mjRD173AkQjWFZ/cOp9XsUg40s511aK7Uvb1dBpUripjOQLXRgzuJJBuKyvjoPbr
	vk5iKtgBne3rIAVxycpeoIokOXRp2bUQSkmOHO3ULwa/fcjvXcEojLMps7oTRQbG
	4gAOwUxgzn8E3UJJq8awbedTfQPR8jmqYY7r/yQjUSwhipCVIrQzkQz00KchXZbY
	xtehAAD7YDTgNLZCOqbR5XTLM9JI5/aMIH4TGP0D9wtF8r44e9U3JElXfI5vm3PW
	QRykOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qca0170y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO37rjB015050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 03:07:53 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 19:07:46 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 24 Dec 2024 11:07:02 +0800
Subject: [PATCH v2 2/3] dt-bindings: net: snps,dwmac: add description for
 qcs615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241224-schema-v2-2-000ea9044c49@quicinc.com>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
In-Reply-To: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
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
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735009653; l=1149;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=u7rxgoC9B/7rS3oQxWd41tk1pmohU3HeHSdKpUR5MUE=;
 b=OToDaCoTEVFkKynO5JQ/7BTei2xXs3R9Mqu9U0fPekh9LWMOXElqsb1q3MpBD/h9p//8LfpN7
 3SwtTPN6mEXCs5U0vMbJ/2idWHZRfCeSu0jbKzlAniW6ayP7BCBI0hz
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X2gMiTV-WEFb0Px3Mz0TPaDSZBRNTCvw
X-Proofpoint-ORIG-GUID: X2gMiTV-WEFb0Px3Mz0TPaDSZBRNTCvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=704 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240023

Add the necessary compatible entries for qcs615 to ensure its validation.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index eb1f3ae41ab9ab4536a110f6fb3e2facb0225549..658d4479aa4864d0e193f03d65eea8b54e1490df 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -68,6 +68,7 @@ properties:
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
+        - qcom,qcs615-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -622,6 +623,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,qcs615-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos

-- 
2.34.1


