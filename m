Return-Path: <linux-arm-msm+bounces-25670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3665B92BD16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 674D11C23AA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2E919DF77;
	Tue,  9 Jul 2024 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fApYI0HE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111519DF67;
	Tue,  9 Jul 2024 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535754; cv=none; b=JE5W6GWHXeoQ/7Zeml5eJqFs8nR0LBMDGTXXfeXXgceGf8rkG2FlwX7eAw/MqOUKZ3UYlJ3j/QZMU91jXNVQV0XO0c1N/NdOQ0INq5P/Ntu9+aK5dNbCx2dyqTxLa8QifsphiMW8P2SkCSQX+dlKSwoskfT40Lx6+c/U10/KsH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535754; c=relaxed/simple;
	bh=Nvykd/Ta+l0s+4XLdpU8dtY1SVQWU0isBnV6Dp+hWPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Orcl7gJEju2yVvrthHIRvjI6bKi6vDb3FM3Qm7xmsRT5GJFO9xSxUFcEOfhIDxEk3gMW1YUiV50crem6lv0llkrpVxfC9sNvRxPB5bDVIQysozX4HdsyEAJ7JtCwMxS4Iww87XAC/eov9d4DMQmd2Qc9mHvuF7T+cCwqLJlaVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fApYI0HE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4699v4ci000478;
	Tue, 9 Jul 2024 14:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZaXBOOrPoEecPmtmaEQl22fYgiiNm5F1J4MKUjuylU=; b=fApYI0HEIYV1WGoN
	O81BE8nHTD+BZXLe7G7CHXjPM6WCgVwq5wiWZ8KoqTLNOPLzJd9VPpOjcNXHBfZF
	vSBXqd2iEjLFZOeuBu7BvL7AFloin9K62fW0v7S4fPvZIOX5oWfkHzzxjJYHLeUO
	EV8cMWLlF99nml8IxHK6tlgfZDBhgofOuqXi1NfRFm6W9iQ68cNDSJfCTyUAtzi2
	nVvlpQbvLeOQu9WhoxqVVsCR2kxDt/i++aiteFB+wZAw7pZ/A2qBb8eCxOJAq/bu
	4rPife+z5Llrz1sqEfK7+EbWbqRT/1GVfon2kpYhSSW2jtEiJKhvDSA6+H1IVYh0
	FT1EoA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwpp9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:35:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EZmdG025301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:35:48 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:35:42 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:35:29 +0800
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_rpmh_clk_compatible-v2-1-b6f516c36818@quicinc.com>
References: <20240709-add_qcs9100_rpmh_clk_compatible-v2-0-b6f516c36818@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_rpmh_clk_compatible-v2-0-b6f516c36818@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720535739; l=1067;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=Nvykd/Ta+l0s+4XLdpU8dtY1SVQWU0isBnV6Dp+hWPQ=;
 b=EXVGhvxPYcP2UFwgCN39qIcyQ3DHF3dRpcITtArafaE+YhKUbVXcgdpTA9fYzyK2jVAw9qvQi
 CxqXaWmCQe4ANi+5+dn5sEtzhNSq2yHAjEx7u8tAdnzDrxrkgE08HWC
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cTek0oif_ouieHYt5f5ri7RKlBU37VVO
X-Proofpoint-ORIG-GUID: cTek0oif_ouieHYt5f5ri7RKlBU37VVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=838 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090095

Add bindings and update documentation for clock rpmh driver on QCS9100
SoC.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-rpmh-clk" to describe
non-SCMI based rpmhcc.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index ca857942ed6c..63e4b8f8e571 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs9100-rpmh-clk
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk
       - qcom,sc7180-rpmh-clk

-- 
2.25.1


