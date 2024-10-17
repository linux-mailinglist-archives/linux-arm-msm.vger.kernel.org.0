Return-Path: <linux-arm-msm+bounces-34721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 767699A1F23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87C281F22976
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FEF1DCB0E;
	Thu, 17 Oct 2024 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iDjfcukV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7A11DC06D;
	Thu, 17 Oct 2024 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158845; cv=none; b=X+UxnM16ygzCcR63ZcZ2Th2NyzNT+m9ns2742vuNcqjJPOZnC03+EPX94m44q/CIr5hjBhtZm2gRnpwL6h0s9RrRj31Uu0Jrln77YcxQgr6tGLUiUX7aeVB4m0dUv/wKXGIZZ0w5hOVa3h+IUNDBX6jF/PjZbgc6wo0+412qJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158845; c=relaxed/simple;
	bh=9cNW7j6TUlFoD1BLDOBl2cAMAxZpuNjWlK3erXKFN0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UaKXFKocIbxU08YeGfp6psOypDkJNJ0QLF4KwqqiwIY44lqO7r6OhyHIdzMxIOoIXIndfioDR3fDH35uqbI47Yv7M9hm18YrNkSsg6W9A9vmpKI+GqKKk/ihx1rsz9fo7YnMzNb0xIVyt4cTCBvuogXFpUJVwN7wkKAd+tiJHnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iDjfcukV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H9K3vq011278;
	Thu, 17 Oct 2024 09:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVvDhdy9UwmXlEOuHMZND4WIdHH4PTsuwNOOcJfoPlM=; b=iDjfcukVy3tt2G+M
	f1QqlpTBrEYTiDTA4dcizteJn1ILKDVFViMYQMczW6anuWdyu1q89bpPKNrHXUsU
	ehrDc4q08W1bIYzHDT0l+KB5dACL7tjYN8nQhZgLYYe+s6AABySrJLbrHM6eK/F7
	ctW2EN2ctglmaY9sSCBecvW6jqiD9cf7tibXFMHsFmoFfWZVNRYaTB16cFGg9qnA
	MRdrUXCfA+9twK2UE8z9iLY6sbtl8jTY47LaCbCRmnBsOQqfK+ByCoFP1ercNe+6
	e5D0rug8GMPoeRXQ5N7N4AD2gkx5tpLPH6wF7bRuA1O0MKqPghLKxb0j0W6xLwZ1
	IpAvxA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5kjvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:53:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H9rnU8005197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:53:49 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 02:53:43 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 17 Oct 2024 17:52:38 +0800
Subject: [PATCH v2 2/3] dt-bindings: phy: describe the Qualcomm SGMII PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241017-schema-v2-2-2320f68dc126@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729158811; l=1167;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=9cNW7j6TUlFoD1BLDOBl2cAMAxZpuNjWlK3erXKFN0A=;
 b=RGAXvmLtaKB26TgOu885KNG8TDml5v0BrNtwHuxsuWzyANunGmSASMPqkCNGrTV/xZW5h+Szg
 Ig0VZP3PUYGAdarCG+cKkNcs6fvjcRIFGwQMaqgD7atJVslCuLuvDJl
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bTf4jQMSx0ugbQW7ZKDmNCqwCpgvyjsj
X-Proofpoint-GUID: bTf4jQMSx0ugbQW7ZKDmNCqwCpgvyjsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=924 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170065

Describe the SGMII/SerDes PHY present on the qcs8300 platforms. Since
qcs8300 shares the same SerDes as sa8775p, so it fallback to the
compatible.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
index b9107759b2a51738d884f6bdce16bf0bff644056..90fc8c039219c739eae05cc17108a9a2fc6193df 100644
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


