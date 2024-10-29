Return-Path: <linux-arm-msm+bounces-36252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD759B40D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 04:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304F12836E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 03:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C90E200BAA;
	Tue, 29 Oct 2024 03:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OVSpoLVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD2200B88;
	Tue, 29 Oct 2024 03:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171567; cv=none; b=G6m/YcQP6FrYoapQTe/JEKixew2hg+NM7jWJhTlmo34q0XYB59qlPQ6xj01ZTHKZyslfgCSnKtPKWTceMGUJslhWYBi2L3fmdk36f3nB87pyPmjP2ikTTwczg/ey6puOcnrD+a3d4TOTsvNhadck/11V1J1RE9Yk95x800Z7YAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171567; c=relaxed/simple;
	bh=xWjNZluUR5RshTnr1aE46BrVYT/UTHUg4PRtH1HSPbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IXR9Vul8GInP2GB6UYC4LLltJYExjiFlA7GfiwJ0Me8PzGwzTQ3vZ29HqMvXpBMCTfCWTcxpVm4S9DdaxYuavJXhZY/5S33WmrjD8UqFRKWy1OGeECnHlvPnDrKJUIFeEzncuuOh3d66ctOk7b8v9aSSfmJjU0p71p9FYeIO1/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OVSpoLVf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKkEwc000767;
	Tue, 29 Oct 2024 03:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKCGEyIX8Q9kh+SkKDiMKp1SI4CfGPWKyKdjLX87iHU=; b=OVSpoLVfW1MHpScx
	6zBBC0RNt05f+t+7PlBxESCz+6qjovbt/wAH1uEHWieooYIVh6F7LrfXugwG2kUS
	pkhRKWxc9eRHLN2+EqdjSIZ7BbiScdEi6b3RXBUiuyVDghri1EJvQc4Ziy7I/MsA
	ez3LZGMPCIqhdTm8c6/aW7SBMMyNchmAWoV4sEWKyjgUQYfsDtZ7SvrKrFBDoc25
	jUceJoX5XtzfKUmB6EMcfu0wd3f/9L/RjDAkDF5a0fnC2RALle4xCCX8B8SGMkuR
	GV+zku5l+Qyp6qprC/51I9a9BhudnPY8F6yhDe976+1eZoqmGD2Se2r1CVCkQRIZ
	8RApHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gskjxvxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:12:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T3CZVJ005157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:12:35 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 20:12:30 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 29 Oct 2024 11:11:56 +0800
Subject: [PATCH v3 2/2] dt-bindings: net: qcom,ethqos: add description for
 qcs8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241029-schema-v3-2-fbde519eaf00@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730171539; l=997;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=xWjNZluUR5RshTnr1aE46BrVYT/UTHUg4PRtH1HSPbM=;
 b=At+SLey1M0wj+VhJPNNaXhKyKqJQ2+5FkixFmhPowjylzkGevZveWCO1FT8jk6aY/OvQ52nXf
 8f7cGlloAwIDbl4lzw7c7JbeVODV7WUmTIM9DTc/N9Owte2y/zHE2vS
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iIt6mUtBfrhwQ4D0mUKWnuYKL5e6Bs7p
X-Proofpoint-ORIG-GUID: iIt6mUtBfrhwQ4D0mUKWnuYKL5e6Bs7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=716 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290024

Add compatible for the MAC controller on qcs8300 platforms.
Since qcs8300 shares the same EMAC as sa8775p, so it fallback to the
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
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


