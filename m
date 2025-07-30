Return-Path: <linux-arm-msm+bounces-67055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859AB15990
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 131243B6C5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F32287513;
	Wed, 30 Jul 2025 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DW35AimM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FA61EFFB2;
	Wed, 30 Jul 2025 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753860558; cv=none; b=XTB5jrzQ/V8TMuo70fLFBx+fmxeQbe76B2C7RbR5Fyd9keLmAz+YLHVKlY4l5aKHBf6uTYqMPfNdPobVu6c+2ZvXilSdkgiX1NtCMOkqbzfpf0I3g1pVG8rcgFzVzJSIB05PLGr0AVKIH92mgCUi8GL7+u73xKK00jaFXA9XxMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753860558; c=relaxed/simple;
	bh=rdoU1EqVgDl8sy6XJ5uPQgrUXQtgjF+c2wH2+gurJnc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s1QJmJ1D6ueoTLvhyyPlL6d1wl1nnLZFceogdyB1YHEAQdt11LISREyEOfGFYpz2iI3ru831ef/y8RRWx7mfOSq7b7fOlWkLg7VGjqpikmXbXGUTENoiUdGw8rmZo/Ufu2g9sJKD8R3BbHM04OqibQ4OqFTih0/SYYz9X45oNlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DW35AimM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5ggDs017481;
	Wed, 30 Jul 2025 07:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IY2gWL1+FPISpzXUYxlmfN
	YyXNSkWMy9ApA1vD9WqQc=; b=DW35AimMBLuIjN9lu4Yvbeinxnt553HVKoNwVz
	i9cRpxZ/EixDafxpGZKFN7P/8ZJ9rpYq1jpSaUJ6WJwS3rAq7147hMZdA2bYWO5s
	xSrL9WCyDpbEOe55rX6kUf5fvOH/EbZ6wMR/Qd10V4OJ1Na2KqTX3AHpmKTYkdxF
	kzsCje0tGdFXQ8WZD+jJeCBVDKCbWMIkKnm/0hsATT0vPW9rpYUGSYp74mzkat6C
	hFZCw9hwCr0zKiX8e7Mysnu8Axb7H1XkZ9acijYUAFwWxV72UZh3otNTtCK80N66
	gPJLs7qUztjWj+bwinYRZH4D5UMW/vH/3BGnIylUrHkCOCiA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1ajrs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 07:29:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U7T79x010408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 07:29:07 GMT
Received: from cse-cd01-lnx.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 00:29:03 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yongxing Mou
	<quic_yongmou@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND] dt-bindings: phy: Add eDP PHY compatible for QCS8300
Date: Wed, 30 Jul 2025 15:27:25 +0800
Message-ID: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NKrGXozUY7lmJ3T_S6uTyBS-dsbNDeU9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1MCBTYWx0ZWRfXyfGu9lD0Q8xx
 LPbHY64ejBzwQmL8ZKwQG89XQw3j2LA8M451lKju0+Bh5IkzCGiNwbm4ipimRNRbatyFkvFE7+v
 /sSq7VJ6y6iDQefrwhrn7xNUwCe4ksrdiyk6uUJlti4y8+9jzeq3gdVdh6DdM4R6USgTSi2x16f
 h+OMybbjyG5VMPWfzChMF9QG6/N2R7vjKkXsQZiC++w7cYiJffRn3iAK082AzKSj+iDPkeRpUIu
 idk7A6vBG83dyXcuJ7jjBgPbVrNn8EybppmWuMuTZZNEI65NVy1xNGzh57yxI/w/TfHxa5Jhxsg
 KZ5IuyepmJYVrj+RRSmT5vRIo6Z0vObNFc4eL2tHkquUnSOzb0al4l9oKsufFEPDjm1ccCZbMGM
 Lk583oiTk2O+KSe1fJmx4Rfb0ATIPuM8dGQhuiymjB9fPav2m+hl3rpFOvZ9PLJrRJDiX55R
X-Proofpoint-GUID: NKrGXozUY7lmJ3T_S6uTyBS-dsbNDeU9
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6889c9c4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=O5udsO39-F6e2CSdgGgA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300050

Add compatible string for the supported eDP PHY on QCS8300 platform.
QCS8300 have the same eDP PHY with SA8775P.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,edp-phy.yaml | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 293fb6a9b1c3..eb97181cbb95 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -16,13 +16,18 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-edp-phy
-      - qcom,sc7280-edp-phy
-      - qcom,sc8180x-edp-phy
-      - qcom,sc8280xp-dp-phy
-      - qcom,sc8280xp-edp-phy
-      - qcom,x1e80100-dp-phy
+    oneOf:
+      - enum:
+          - qcom,sa8775p-edp-phy
+          - qcom,sc7280-edp-phy
+          - qcom,sc8180x-edp-phy
+          - qcom,sc8280xp-dp-phy
+          - qcom,sc8280xp-edp-phy
+          - qcom,x1e80100-dp-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-edp-phy
+          - const: qcom,sa8775p-edp-phy
 
   reg:
     items:

base-commit: 54efec8782214652b331c50646013f8526570e8d
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.34.1


