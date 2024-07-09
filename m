Return-Path: <linux-arm-msm+bounces-25693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12692BDFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1421F24048
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D542C19D088;
	Tue,  9 Jul 2024 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ckyT9Fgb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928A15AD90;
	Tue,  9 Jul 2024 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538163; cv=none; b=CXbUIMIAebfpQS8/+cRaHECrEh+FCULHi2yU9RbPT5QwuONBb80O3Ed0Fq6L7WeV3vCJ/TxFiHpGp8iansZ/lGewnFHcUUde2vre+ei3ASYnV+I31tO+GoL/wxUYDOqTAtpficM/3pVa0+Li4N1JEH8CK3B2KrIYVyYuR+gSrqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538163; c=relaxed/simple;
	bh=/lpd/6iGDfY1wQlnOwz3oprrAmCChCkk9BHLv+PSqpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mVe40sIQUiV8AHnszu8yxDsffGazhXPsxcMMur3xy56e2MBFBp+wxTvbeC2vFpIvU3LUUkAnQR9Sd3rK+V/gNroUVUg0vZ42Yf1GaFU+Cp6GoQwle2iyJvKSzuommEWreBQIOQKZqJoosJo60gESJPIrxf9w6bZ+NEo6WJLBv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ckyT9Fgb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4698HARV026708;
	Tue, 9 Jul 2024 15:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cXScQVwtdscgzeO2pUgNBYYWBQc+MUbUHi2ZRjPfDs=; b=ckyT9FgbqCYFsKTc
	LFGUdfpSVDq2zqRes/bUxTNkV+Nw3Ewz6eunjMyQzhfi0Qe05hMHfNuFz8OMSMc1
	lwBk3R/jL7qtEE1xBS9RwIjuabeSS7GmlncPu1ma+UgU4ygw2+XOCbStpyJDp8dp
	XxDH8h8cuDixsNRTexgYwjMXG+FvJuyQULnFz/4Vv+t80LcN6pDOCG8W6tIYJcG8
	ZYZWYRNuxwkaA/tsL04ZpGMk1MCKjBPgn4H61mrmD6W9+w5Bow4NrGhWwpiu9o/w
	SHbvuISJuUeCnXy8sEnY/L+p/xCJlUyFJEgpE9uSJwvPO8roUXJyqt3FupLVI7Hl
	5vTLYQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdh314-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:15:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469FFu48019837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:15:56 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:15:50 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 23:15:36 +0800
Subject: [PATCH v2 1/2] dt-bindings: phy: describe the Qualcomm SGMII PHY
 for QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-1-5ffeb16252db@quicinc.com>
References: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-0-5ffeb16252db@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-0-5ffeb16252db@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720538147; l=1209;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=/lpd/6iGDfY1wQlnOwz3oprrAmCChCkk9BHLv+PSqpk=;
 b=ZwvHLw5FEy6KcDYPVg0BkkjURR5NdPnJGGItS6ca/n99iNJm/XIEQc0axw69RPPHNwdt/9C6t
 iLIMTl2blLzCzta2k+MBAFZYLbvkxl01lMx5eTetRvreArKLRCVFCSa
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lJEPkqgpidygrUNC3NxGfRI09P_KhegJ
X-Proofpoint-ORIG-GUID: lJEPkqgpidygrUNC3NxGfRI09P_KhegJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=886
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090100

Document the Qualcomm SGMII PHY for the QCS9100 platforms.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-dwmac-sgmii-phy" to describe
non-SCMI based the Qualcomm SGMII PHY.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
index b9107759b2a5..74ec4579c0d6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -15,7 +15,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-dwmac-sgmii-phy
+    items:
+      - enum:
+          - qcom,qcs9100-dwmac-sgmii-phy
+          - qcom,sa8775p-dwmac-sgmii-phy
 
   reg:
     items:

-- 
2.25.1


