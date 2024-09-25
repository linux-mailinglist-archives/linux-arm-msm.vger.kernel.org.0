Return-Path: <linux-arm-msm+bounces-32437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3698543C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CADAB20A17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 07:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56CF155335;
	Wed, 25 Sep 2024 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B0kC8xuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F6A14B950;
	Wed, 25 Sep 2024 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249694; cv=none; b=HyI9HrVc6O2NbH/acSW56n01JAL1SH4SIvwCd1OQLZ2zdmiLO4GoHM4LohcHfgkXkN9abAHG3j8zRCuKgOWYblKdV5hlCA345Wur+1Qzgb2msgs4BUXBZykcs/bOlmudo9YktnZKZs8X0IZNQbfyQoqqJ619orTZwXb9M2+edt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249694; c=relaxed/simple;
	bh=ZRkir0ir4hubkC9CXUb9lQ6Az1/aAWAJ1J20Ggywdi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=E5b4pJ5S03xTJxA5kxmCzutv1oY7GeeLi7ruWp+arwjDcaRjqCQmxPS6CYUSQtZMT8fT5PiN5cIgGmTT0XB1MQnGEPnAxni08l5EPiAHaEyg+uuC+CLK93JuvxMKMtJk2cKSpyCZOJVBohEmJSx6C/VclMaNsnYs7pdqjVdmI2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B0kC8xuG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OJ5hNc020750;
	Wed, 25 Sep 2024 07:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vhLzUTFBRxq/4bDnjdrZXa
	GPYhs8wsDwPEErkctEAOw=; b=B0kC8xuGwYog0Ss3DE3Rxs9VgyHZqozfzujUr7
	1l7CdfsLU1FyHfD5hNwxAeKlxCTWCgKsG+eIuujTgyxV1r5cIckEVSN3l9nuHMGU
	oKEqgRleEdr9G72EpayactzIETFplvgcw/HfwYaI6Xwg4FpPUmMM4SdyAjpOhuHl
	R6wEQFRC/YzSbunM3C9SfHA8+rSx00Nknq1h8FzbhoGjt+M3finvkemNaoZx/Cag
	eOCKzQUqchAU6iSkbWlxFmGAJh7L1ZeyvfJHu8NhyUQ/HFe3zeOv8GVKrneBz09f
	OlIuL/c52LSUfx38F8e9GetVJVvfhlfJCSwqsa2JmuIH6Gpg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn3sb4xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 07:34:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P7Yl9j012824
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 07:34:47 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 00:34:43 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 25 Sep 2024 15:34:32 +0800
Subject: [PATCH v3] dt-bindings: phy: Add QMP UFS PHY compatible for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAi982YC/3XOwQ6CMAyA4VcxOzvTFRTw5HsYs8xuQBMdyHCRG
 N5dIMbowePfpF/7FMF17ILYr56ic5EDN36KZL0SVBtfOcl2aoGAKRS4lTcKeQKg72XQbT3oM3v
 LvpIWiXZnhTm4QkzbbedKfizy8TR1zaFvumE5FNU8fZuQfkz23LO5aNsHllFJkBacKUxpCSA73
 O5M7GlDzVXMZMQvRqm/r0WUSlIOyqDFzOTprzSO4wu27MWVBwEAAA==
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Xin Liu <quic_liuxin@quicinc.com>,
        "Jingyi
 Wang" <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727249683; l=3033;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=aGZIamEGXyyS+e6xROal4OGV7Lj5G2cTIum5OK+tN0k=;
 b=lF7eGJYyBcwnASU5EdPKAJySCuu5HiFFsbUIop/zH9zeXxymxZWzE5wodJ8xVmrHDujviqNUJ
 DwdFkKgcWcyBzbiWLWYKS03LtKbA3XYXYy19Qrr8wxsWWEQW+iXsLSX
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZFWGWUn8WAOIZzwxY7lDtNCoIAny4Xs5
X-Proofpoint-ORIG-GUID: ZFWGWUn8WAOIZzwxY7lDtNCoIAny4Xs5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250052

From: Xin Liu <quic_liuxin@quicinc.com>

Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
on the SA8775P.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v3:
- remove redundant compatible.
- Link to v2: https://lore.kernel.org/r/20240911-qcs8300_ufs_phy_binding-v2-1-c801a2d27a84@quicinc.com

Changes in v2:
- decoupled from the original series.
- Use fallback to indicate compatibility with SA8775P.
- typo fixup
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
---
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 45 ++++++++++++----------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index f9cfbd0b2de6..8b7eda51b3ae 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -15,26 +15,31 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,msm8996-qmp-ufs-phy
-      - qcom,msm8998-qmp-ufs-phy
-      - qcom,sa8775p-qmp-ufs-phy
-      - qcom,sc7180-qmp-ufs-phy
-      - qcom,sc7280-qmp-ufs-phy
-      - qcom,sc8180x-qmp-ufs-phy
-      - qcom,sc8280xp-qmp-ufs-phy
-      - qcom,sdm845-qmp-ufs-phy
-      - qcom,sm6115-qmp-ufs-phy
-      - qcom,sm6125-qmp-ufs-phy
-      - qcom,sm6350-qmp-ufs-phy
-      - qcom,sm7150-qmp-ufs-phy
-      - qcom,sm8150-qmp-ufs-phy
-      - qcom,sm8250-qmp-ufs-phy
-      - qcom,sm8350-qmp-ufs-phy
-      - qcom,sm8450-qmp-ufs-phy
-      - qcom,sm8475-qmp-ufs-phy
-      - qcom,sm8550-qmp-ufs-phy
-      - qcom,sm8650-qmp-ufs-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-qmp-ufs-phy
+          - const: qcom,sa8775p-qmp-ufs-phy
+      - enum:
+          - qcom,msm8996-qmp-ufs-phy
+          - qcom,msm8998-qmp-ufs-phy
+          - qcom,sa8775p-qmp-ufs-phy
+          - qcom,sc7180-qmp-ufs-phy
+          - qcom,sc7280-qmp-ufs-phy
+          - qcom,sc8180x-qmp-ufs-phy
+          - qcom,sc8280xp-qmp-ufs-phy
+          - qcom,sdm845-qmp-ufs-phy
+          - qcom,sm6115-qmp-ufs-phy
+          - qcom,sm6125-qmp-ufs-phy
+          - qcom,sm6350-qmp-ufs-phy
+          - qcom,sm7150-qmp-ufs-phy
+          - qcom,sm8150-qmp-ufs-phy
+          - qcom,sm8250-qmp-ufs-phy
+          - qcom,sm8350-qmp-ufs-phy
+          - qcom,sm8450-qmp-ufs-phy
+          - qcom,sm8475-qmp-ufs-phy
+          - qcom,sm8550-qmp-ufs-phy
+          - qcom,sm8650-qmp-ufs-phy
 
   reg:
     maxItems: 1

---
base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
change-id: 20240925-qcs8300_ufs_phy_binding-d2cc6b1280e9

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


