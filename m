Return-Path: <linux-arm-msm+bounces-44866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0AA0B276
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 10:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02E977A269D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89495238750;
	Mon, 13 Jan 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OeJO42Ph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E1B239790;
	Mon, 13 Jan 2025 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736759709; cv=none; b=avSpXGYYX2kPMjzxnppVzZJdNvAgz2VNBLqvH10/hsfnkEWohtfdQJ8Hx4RI+g9q5eMVFqvDRkt4TTLvyds0g067bquV+PCLwJpumOzhTcsRdlQxteDXxVpqhKQw146AEMVxTroTqZ74Abyeng14uGbxcQ2va5AvXtSJrbCGLCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736759709; c=relaxed/simple;
	bh=PdKl8EpuUJEbPNOs9S6LsY7d2BQsIKVN0a3/wVZvbBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=brxI9DfnuW2Oz4r6H+BDFZY6OT9brWBZv/a9mKuImjAMLmlVbMoe7YhTKPnuj1iKR1zjcJXyF9JoDM75Lo5RPHuzLLGN6xQrYC5yzYPDswOHzUdUA1KnEPy8WDNWe5v0v/e5ntgqMHnXLXkcgxrB08AWnMFqE4FB1Jvh8kkZx3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OeJO42Ph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2HnDB021778;
	Mon, 13 Jan 2025 09:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3fReWpQjJqZadEx9vGwyqX
	bguWJDbIlaxdSWzE4O+q8=; b=OeJO42PhhpuI1IehbpQ0IUjA/AM3yhRLZrQ238
	R3emsJgWjcRIB/dMz91g78Ozddld8IsVHvGHPUKBWBZkf44Z5Hd/beA3HBwdCM+i
	dMqcrcp0p61hP118Hnp9ddiwjQxDA3KnEx86jYBXu0iVOZduyEJ2WQyUJg0uk7RW
	bU6eLL0xorfo19G7hnTZ80QaJxrKJNGY1kSieMxHzJOLEpv7BdXcNE22y/BXDcs+
	PTh3pBGBdNobe10miouT2q1PxbsDF9IO5Un9lwNCoiRUX3nVnqGSK2hQJ6n/taRM
	g/A4T3SM7OmsyusoWUKkJ66ZXXENk2jxwMLWseQJGyucMdxg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444swy8uwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:15:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D9F0Vs021600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:15:00 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 01:14:57 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 13 Jan 2025 17:06:20 +0800
Subject: [PATCH] dt-bindings: phy: Add eDP PHY compatible for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-dpphy_qcs9300-v1-1-842798ceee78@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJLXhGcC/yWMywqDMBBFf0Vm3cDkJdFfKVI0M6lZ+EpsaRH/v
 aEu7uJcOOeAzClyhrY6IPE75rjMBeStAj/285NFpMKgUFmUUgta1/H72HxuNKIgWZPCshB6KM6
 aOMTPv3fvLk68vUp2v04Y+szCL9MU97ZSg3POymCdJu0NGxw8GfSBZVNbZSR7pRoi6M7zB4y0s
 2erAAAA
X-Change-ID: 20250113-dpphy_qcs9300-d16d206d2ffa
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou
	<quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736759696; l=1814;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=PdKl8EpuUJEbPNOs9S6LsY7d2BQsIKVN0a3/wVZvbBI=;
 b=kMKWKP5OqtjkDK816oF5TKCrZ291uUbFYwUx4/K4auwPHPXzoMdDug0WCBVB2/Z/5/0orcrab
 tdJn8vNIDFgDiTVTfFkloCfFZsu3NThF0snMPSXz4R6J57wLdlwPsSj
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mMEKGX7aUkDD54Jj60lyHlXQu0UYzHpy
X-Proofpoint-ORIG-GUID: mMEKGX7aUkDD54Jj60lyHlXQu0UYzHpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=985 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130078

Add compatible string for the supported eDP PHY on QCS8300 platform.
QCS8300 have the same eDP PHY with SA8775P.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This patch is separated from the QCS8300 Display enablement patch
series, following Dmitry's suggestion. And it has got review-by from
Krzysztof, the original link as bellow:
https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com
---
 .../devicetree/bindings/phy/qcom,edp-phy.yaml         | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 293fb6a9b1c330438bceba15226c91e392c840fb..eb97181cbb9579893b4ee26a39c3559ad87b2fba 100644
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

---
base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
change-id: 20250113-dpphy_qcs9300-d16d206d2ffa

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


