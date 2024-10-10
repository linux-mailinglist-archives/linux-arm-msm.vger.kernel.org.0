Return-Path: <linux-arm-msm+bounces-33755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F31B997A5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 04:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21072849FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609416BB5B;
	Thu, 10 Oct 2024 02:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l11C3mXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A3502B1;
	Thu, 10 Oct 2024 02:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728525951; cv=none; b=SxXSi89i1ST3Zc2E/5YkFaqH2DcV6Ksx/K/JqvXRTa54Y3ucL2RUfL8KeSff6YdZnxB7touAjjTR1aN+11Y0y3PiZQG7YMokFgmy2p1CNYG1IH+bwpiIdxukIZTn2bD9zvUWTQDI443Z3eQc7L5pcbaRlp1pY/OaMc6Y7wVkqmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728525951; c=relaxed/simple;
	bh=+lmcbiWUBQR4Fi1H56e25DbQ4RQdd3mebYSIey3dDvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M5ZD4gNb9X8RTySYRjTK1Tvj8+ZOeJ00G+MU/wapn+AZ0/6Y3wkbNtuliTKL5vVhI+XX3adlDfbdAucbMzBYxuteluTzHqsJBkNVUUnI5DPEIXHoe8FQLPyX+MqTYXbE28v5NUYs8g2P+nwCbMGdFOnlzCKZYe8H9SpqUA+3/Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l11C3mXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1b5xs023566;
	Thu, 10 Oct 2024 02:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjEj3pnbNp9XmsXKNGOZ5pIyxV2deSdkOE3pPjEChtk=; b=l11C3mXtSYFp9mfK
	Pt5ddXFyWXNdzOvLHdAihLcCwAdx35/5ZDm4on+2Kx32RQaYpG0sVrs9v6GgG3og
	OsEJDtQkleoBngvEr/62Q7gN7WhYFA5zumsW0eYLP1jz89kF6IO0877qZj2BiBCf
	oFVwgO3BsrX7NGfmxynrUqgt+ymV0DNczd3y2OSvrTHeVu7J03bbU0VIkonHldZO
	7vScpDM2EqJJuIiX1hADRU952NSLSAjMjHVvriFXy0f8grl25iPHMCc4l4yss2OP
	CeQV6nu0wWOpxBtayUTr3ys+QU/D5ptcN8G/M2HQmGjWi9cO0LhwKDBXjtB9Ep3R
	fkEW0w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndyfxaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:05:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A25ZCm000874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:05:36 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 19:05:29 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 10 Oct 2024 10:03:44 +0800
Subject: [PATCH 2/3] dt-bindings: phy: describe the Qualcomm SGMII PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-schema-v1-2-98b2d0a2f7a2@quicinc.com>
References: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
In-Reply-To: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
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
        <quic_aiquny@quicinc.com>, Yijie Yang <quic_yijiyang@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728525917; l=1044;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=+lmcbiWUBQR4Fi1H56e25DbQ4RQdd3mebYSIey3dDvk=;
 b=P9bR72wi9uIzcBhqtyrc1/mogF0rydcexjaeyJqDdwck92yilino/0c9v1KD0uRThKtZm0Lsz
 fuTgYX6i002Bzis8eSMDCrDjrw5FEzdNUMiyyszr1Rgr/tETo4Oc8P4
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I3uLhonur_2VkvQbmKXts-eS0_ybtxqG
X-Proofpoint-ORIG-GUID: I3uLhonur_2VkvQbmKXts-eS0_ybtxqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=900 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100012

Describe the SGMII/SerDes PHY present on the qcs8300 platforms. Since
qcs8300 shares the same SerDes as sa8775p, so it fallback to the
compatible.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
index b9107759b2a5..90fc8c039219 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -15,7 +15,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-dwmac-sgmii-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-dwmac-sgmii-phy
+          - const: qcom,sa8775p-dwmac-sgmii-phy
+      - const: qcom,sa8775p-dwmac-sgmii-phy
 
   reg:
     items:

-- 
2.34.1


